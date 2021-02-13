using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 修改账户手机号码
	/// </summary>
	public class AccountModifyTelPhoneRequestDto
	{
		/// <summary>
		/// 账户id
		/// </summary>
		public long Id { get; set; }
		/// <summary>
		/// 旧手机号码
		/// </summary>
		[RegularExpression(@"^1[0-9]{10}$",ErrorMessage = "手机号码不正确")]
		public string OldTelephone { get;set; }
		/// <summary>
		/// 新手机号码
		/// </summary>
		[RegularExpression(@"^1[0-9]{10}$",ErrorMessage = "手机号码不正确")]
		public string NewTelephone { get;set; }
	}
}