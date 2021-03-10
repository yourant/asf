using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 修改账户邮箱
	/// </summary>
	public class AccountModifyEmailRequestDto
	{
		/// <summary>
		/// 账户id
		/// </summary>
		public long Id { get; set; }
		/// <summary>
		/// 旧邮箱地址
		/// </summary>
		[RegularExpression(@"^[-\w\+]+(?:\.[-\w]+)*@[-a-z0-9]+(?:\.[a-z0-9]+)*(?:\.[a-z]{2,})$",ErrorMessage = "邮箱格式不正确")]
		public string OldEmail { get; set; }
		/// <summary>
		/// 新邮箱地址
		/// </summary>
		[RegularExpression(@"^[-\w\+]+(?:\.[-\w]+)*@[-a-z0-9]+(?:\.[a-z0-9]+)*(?:\.[a-z]{2,})$",ErrorMessage = "邮箱格式不正确")]
		public string NewEmail { get; set; }
	}
}