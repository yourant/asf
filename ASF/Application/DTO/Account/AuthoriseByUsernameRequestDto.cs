using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
    /// <summary>
    /// 管理员身份验证请求
    /// </summary>
    public class AuthoriseByUsernameRequestDto
    {
        /// <summary>
        /// 用户名
        /// </summary>
        [Required(ErrorMessage = "用户名不能为空"), StringLength(32, MinimumLength = 2,ErrorMessage = "清输入2-32位长度的用户名")]
        public string Username { get; set; }
        /// <summary>
        /// 登录密码
        /// </summary>
        [Required(ErrorMessage = "登录密码不能为空"), StringLength(32, MinimumLength = 5, ErrorMessage = "请输入5-32位长度的密码")]
        public string Password { get; set; }
    }
}
