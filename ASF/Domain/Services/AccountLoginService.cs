using ASF.Domain.Values;
using ASF.Infrastructure.Repositories;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using ASF.Domain.Entities;
using Zop.AspNetCore.Authentication.JwtBearer;
using ASF.Internal.Results;
using ASF.Internal.Security;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Domain.Services
{
    /// <summary>
    /// 账户登录服务
    /// </summary>
    public class AccountLoginService : IAccountLoginService
    {
        private readonly IAccessTokenGenerate _tokenGenerate;
        private readonly IMemoryCache _memoryCache;
        private string _loginType = string.Empty;
        private int maxLoginFailedCount = 5;

        private IServiceProvider _serviceProvider;
        //new
        private readonly IAccountsRepository _accountsRepository;
        /// <summary>
        /// 账户登入服务
        /// </summary>
        /// <param name="tokenGenerate"></param>
        /// <param name="accountsRepository"></param>
        /// <param name="memoryCache"></param>
        /// <param name="serviceProvider"></param>
        public AccountLoginService(
            IAccessTokenGenerate tokenGenerate,
            IAccountsRepository accountsRepository,
            IMemoryCache memoryCache,
            IServiceProvider serviceProvider)
        {
            _tokenGenerate = tokenGenerate;
            _accountsRepository = accountsRepository;
            _memoryCache = memoryCache;
            _serviceProvider = serviceProvider;
        }


        /// <summary>
        /// 使用用户名登录
        /// </summary>
        /// <param name="username">账户账号</param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        public async Task<Result<AccessToken>> LoginByUsername(string username, string password, string ip)
        {
            //获取用户数据
            var account = await _accountsRepository.GetByUsernameAsync(username);
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
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        public async Task<Result<AccessToken>> LoginByEmail(string email, string password, string ip)
        {
            //获取用户数据
            var account = await _accountsRepository.GetByEamilAsync(email);
            if (account == null)
                return Result<AccessToken>.ReFailure(ResultCodes.AccountNotExist);

            //登录验证
            _loginType = "EmailAndPassword";
            return await this.Login(account, password, ip);
        }
        /// <summary>
        /// 使用手机登录账户
        /// </summary>
        /// <param name="telephone">手机号码</param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        public async Task<Result<AccessToken>> LoginByTelephone(PhoneNumber telephone, string password, string ip)
        {
            //获取用户数据
            var account = await _accountsRepository.GetByPhoneAsync(telephone.ToString());
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
            if (!PasswordHelper.ValidatePassword(password,account.PasswordSalt,account.Password))
            {
                //获取是否有登录失败信息
                LoginFailed loginFailed = this.GetLoginFailedInfo(account.Username);
                loginFailed.Accumulative();
                if (loginFailed.FailedCount >= this.maxLoginFailedCount)
                {
                    return Result<AccessToken>.ReFailure(ResultCodes.AccountPasswordNotSameOverrun);
                }
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
            //生成访问Token
            List<Claim> claims = new List<Claim>();
            //去重复之后添加多角色
            claims.AddRange(role.Distinct().Select(s => new Claim(ClaimsIdentity.DefaultRoleClaimType,s)));
            // 添加账户信息
            claims.AddRange(new[] {
                // new Claim(ClaimTypes.Role, role.Count > 0 ? string.Join(",",role.Distinct()) : "user"),
                new Claim("name", account.Username),
                new Claim("nickname", HttpUtility.UrlEncode(account.Name)),
                new Claim("sub", account.Id.ToString()),
                new Claim("auth_mode", _loginType),
                new Claim("tenancy_id", ((long)account.TenancyId).ToString())
            });


            var accessToken = _tokenGenerate.Generate(claims);
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
