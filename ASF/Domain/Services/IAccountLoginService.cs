using ASF.Domain.Values;
using ASF.Internal.Results;
using System.Threading.Tasks;

namespace ASF.Domain.Services
{
    /// <summary>
    /// 账户登录服务
    /// </summary>
    public interface IAccountLoginService
    {
        /// <summary>
        /// 使用用户名登录
        /// </summary>
        /// <param name="username">账户账号</param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        Task<Result<AccessToken>> LoginByUsername(string username, string password, string ip);
        /// <summary>
        /// 使用邮箱登录账户
        /// </summary>
        /// <param name="email">邮箱地址</param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        Task<Result<AccessToken>> LoginByEmail(string email, string password, string ip);
        /// <summary>
        /// 使用手机登录账户
        /// </summary>
        /// <param name="telephone">手机号码</param>
        /// <param name="password">账户密码</param>
        /// <param name="ip">登录IP</param>
        /// <returns></returns>
        Task<Result<AccessToken>> LoginByTelephone(PhoneNumber telephone, string password, string ip);
    }
}
