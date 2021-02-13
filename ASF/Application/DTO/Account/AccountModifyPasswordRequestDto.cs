using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 修改账户密码
	/// </summary>
	public class AccountModifyPasswordRequestDto
	{
		/// <summary>
		/// 账户id
		/// </summary>
		public long Id { get; set; }
		/// <summary>
		/// 登录密码
		/// </summary>
		[Required(ErrorMessage = "账户密码不能为空"),MinLength(2,ErrorMessage = "账户密码最少输入2个字符"),MaxLength(255,ErrorMessage = "账户密码最多输入255个字符")]
		public string Password { get;  set; }
	}
}