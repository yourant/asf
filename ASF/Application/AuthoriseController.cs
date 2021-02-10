using ASF.Application.DTO;
using ASF.Domain.Services;
using ASF.Domain.Values;
using ASF.Internal.Results;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ASF.Application
{
    /// <summary>
    /// 管理员账户验证
    /// </summary>
    [Route("[controller]/[action]")]
    public class AuthoriseController : ControllerBase
    {
        private readonly IServiceProvider _serviceProvider;
        /// <summary>
        /// 授权控制器
        /// </summary>
        /// <param name="serviceProvider"></param>
        public AuthoriseController(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        /// <summary>
        /// 账户登入 登录
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<Result<AccessToken>> Login([FromBody]AuthoriseByUsernameRequestDto dto)
        {

            //账户登录验证
            var service = this._serviceProvider.GetRequiredService<IAccountLoginService>();
            var ip = HttpContext.Connection.RemoteIpAddress?.ToString();
            if (string.IsNullOrEmpty(ip))
                ip = "127.0.0.1";
            if(ip.Equals("::1"))
                ip = "127.0.0.1";
            // 如果为手机号码就试用手机号码/密码登录
            if (Regex.IsMatch(dto.Username, @"^1[0-9]{10}$"))
                return await service.LoginByTelephone(new PhoneNumber(dto.Username,86), dto.Password, ip);
            // 如果为有限就使用邮箱/密码登录
            if (Regex.IsMatch(dto.Username, @"^[-\w\+]+(?:\.[-\w]+)*@[-a-z0-9]+(?:\.[a-z0-9]+)*(?:\.[a-z]{2,})$"))
                return await service.LoginByEmail(dto.Username, dto.Password, ip);
            // 否则使用账户密码
            return await service.LoginByUsername(dto.Username, dto.Password, ip);
        }

        /// <summary>
        /// 退出登录
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public Result Logout()
        {
            return Result.ReSuccess();
        }
    }
}
