using ASF.Domain.Values;
using ASF.Infrastructure.Repositories;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Linq;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web;
using ASF.Domain.Entities;
using ASF.Internal.Results;
using ASF.Internal.Security;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using RSA = ASF.Internal.Security.RSA;
using SecurityToken = ASF.Domain.Entities.SecurityToken;

namespace ASF.Domain.Services
{
    /// <summary>
    /// 账户登录服务
    /// </summary>
    public class AccountLoginService : IAccountLoginService
    {
        private readonly IMemoryCache _memoryCache;
        private string _loginType = string.Empty;
        private int maxLoginFailedCount = 5;

        private IServiceProvider _serviceProvider;
        //new
        private readonly IAccountsRepository _accountsRepository;
        /// <summary>
        /// 账户登入服务
        /// </summary>
        /// <param name="accountsRepository"></param>
        /// <param name="memoryCache"></param>
        /// <param name="serviceProvider"></param>
        public AccountLoginService(
            IAccountsRepository accountsRepository,
            IMemoryCache memoryCache,
            IServiceProvider serviceProvider)
        {
            _accountsRepository = accountsRepository;
            _memoryCache = memoryCache;
            _serviceProvider = serviceProvider;
        }


        /// <summary>
        /// 使用用户名登录
        /// </summary>
        /// <param name="username">账户账号</param>
        /// <param name="tenancyId">租户id</param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        public async Task<Result<AccessToken>> LoginByUsername(string username, long tenancyId,string password, string ip)
        {
            //获取用户数据
            var account = await _accountsRepository.GetByUsernameAsync(username,tenancyId);
            if (account == null)
                return Result<AccessToken>.ReFailure(ResultCodes.AccountNotExist);

            //登录验证
            _loginType = "UsernameAndPassword";
            return await this.Login(account, password, ip);
        }
        /// <summary>
        /// 使用邮箱登录账户
        /// </summary>
        /// <param name="email">邮箱地址</param>
        /// <param name="tenancyId"></param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        public async Task<Result<AccessToken>> LoginByEmail(string email,  long tenancyId,string password, string ip)
        {
            //获取用户数据
            var account = await _accountsRepository.GetByEamilAsync(email,tenancyId);
            if (account == null)
                return Result<AccessToken>.ReFailure(ResultCodes.AccountNotExist);

            //登录验证
            _loginType = "EmailAndPassword";
            return await this.Login(account, password, ip);
        }
        /// <summary>
        /// 使用手机登录账户
        /// </summary>
        /// <param name="telphone">手机号码</param>
        /// <param name="tenancyId">租户id</param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        public async Task<Result<AccessToken>> LoginByTelephone(PhoneNumber telphone, long tenancyId, string password, string ip)
        {
            //获取用户数据
            var account = await _accountsRepository.GetByPhoneAsync(telphone.ToString(),tenancyId);
            if (account == null)
                return Result<AccessToken>.ReFailure(ResultCodes.AccountNotExist);

            //登录验证
            _loginType = "TelephoneAndPassword";
            return await this.Login(account, password, ip);
        }
        /// <summary>
        /// 登录用户验证
        /// </summary>
        /// <param name="account">账户</param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录ip</param>
        /// <returns></returns>
        private async Task<Result<AccessToken>> Login(Account account, string password, string ip)
        {
            //判断用户是否禁止登陆和密码匹配
            if (!account.IsAllowLogin())
                return Result<AccessToken>.ReFailure(ResultCodes.AccountNotAllowedLogin);
            //获取是否有登录失败信息
            LoginFailed loginFailed = this.GetLoginFailedInfo(account.Username);
            loginFailed.Accumulative();
            if (loginFailed.FailedCount >= this.maxLoginFailedCount)
            {
                return Result<AccessToken>.ReFailure(ResultCodes.AccountPasswordNotSameOverrun);
            }
            
            if (!PasswordHelper.ValidatePassword(password,account.PasswordSalt,account.Password))
            {
                return Result<AccessToken>.ReFailure(ResultCodes.AccountPasswordNotSame2.ToFormat((this.maxLoginFailedCount - loginFailed.FailedCount).ToString()));
            }

            List<string> role = new List<string>();
            if (account.Department != null && account.Department.Role.Count > 0)
            {
                role.AddRange(account.Department.Role.Select(f => f.Name));
            }

            if (account.Role.Count > 0)
            {
                role.AddRange(account.Role.Select(f => f.Name));
            }
            var identity = new ClaimsIdentity(new GenericIdentity(HttpUtility.UrlEncode(account.Name), "AccessToken"));
            //去重复之后添加多角色
            identity.AddClaims(role.Distinct().Select(s => new Claim(ClaimTypes.Role,s)));
            // 添加账户信息
            identity.AddClaims(new[] {
                // new Claim(ClaimTypes.Role, role.Count > 0 ? string.Join(",",role.Distinct()) : "user"),
                new Claim("name", account.Username),
                // new Claim("nickname", HttpUtility.UrlEncode(account.Name)),
                new Claim("sub", account.Id.ToString()),
                new Claim("auth_mode", _loginType),
                new Claim("tenancy_id", ((long)account.TenancyId).ToString())
            });

            AccessToken accessToken =  new AccessToken()
            {
                Token = await GenerateTokenAsync(identity,86400),
                RefreshToken = await GenerateTokenAsync(identity,129600),
                Expired = DateTime.UtcNow.AddSeconds(86400)
            };
            // 判断是否存在已经拉黑的授权token
            if (!string.IsNullOrEmpty(account.Token))
            {
                await _serviceProvider.GetRequiredService<ISecurityTokenRepository>().Add(new SecurityToken()
                {
                    AccountId = account.Id,
                    Token = account.Token,
                    TokenExpired = account.Expired
                });
            }
            // 判断是否存在已经拉黑的刷新token
            if (!string.IsNullOrEmpty(account.RefreshToken))
            {
                await _serviceProvider.GetRequiredService<ISecurityTokenRepository>().Add(new SecurityToken()
                {
                    AccountId = account.Id,
                    Token = account.RefreshToken,
                    TokenExpired = account.Expired
                });
            }
            // 设置登录信息
            account.SetLoginInfo(accessToken,ip);
            // 登录日志
            LogInfo logInfo = new LogInfo()
            {
                Remark = "登录成功"
            };
            logInfo.SetLogin(account.Id,account.Username,_loginType,LoggingType.Login,account.LoginIp,account.LoginLocation);
            await _serviceProvider.GetRequiredService<LoggerService>().Create(logInfo);
            

            bool isUpdate = await _accountsRepository.Update(account);
            if (!isUpdate)
            {
                return Result<AccessToken>.ReFailure(ResultCodes.AccountUpdateError);
            }
            //移除登录失败记录
            this.RemoveLoginFailedInfo(account.Username);
            return Result<AccessToken>.ReSuccess(accessToken);
        }

        /// <summary>
        /// 生成一个新的 Token
        /// </summary>
        /// <param name="identity">认证信息</param>
        /// <param name="time">过期时间</param>
        /// <returns>表示生成新的Token的任务</returns>        
        private async Task<string> GenerateTokenAsync(ClaimsIdentity identity,long time)
        {
            return await Task.Run(() =>
            {
                var handler = new JwtSecurityTokenHandler();

                // 签发时间
                DateTime issuedAt = DateTime.UtcNow;

                var securityToken = handler.CreateToken(new SecurityTokenDescriptor
                {
                    IssuedAt = issuedAt,
                    Issuer = "asf",
                    Audience = "asf",
                    SigningCredentials = new SigningCredentials(RSA.RSAPrivateKey, SecurityAlgorithms.RsaSha256Signature),
                    Subject = identity,
                    // 到期时间
                    Expires = issuedAt.AddSeconds(time)
                });
                return handler.WriteToken(securityToken);
            });
        }

        /// <summary>
        /// 获取登录失败信息
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        private LoginFailed GetLoginFailedInfo(string username)
        {
            string key = "LOGIN_FILED_" + username;
            if (_memoryCache.TryGetValue<LoginFailed>(key, out LoginFailed loginFailed))
            {
                return loginFailed;
            }
            return _memoryCache.Set<LoginFailed>(key, new LoginFailed(username), TimeSpan.FromMinutes(30));
        }


        private void RemoveLoginFailedInfo(string username)
        {
            string key = "LOGIN_FILED_" + username;
            _memoryCache.Remove(key);
        }
    }
}
