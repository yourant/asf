using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 修改账户头像
	/// </summary>
	public class AccountModifyAvatarRequestDto
	{
		/// <summary>
		/// 账户id
		/// </summary>
		public long Id { get; set; }
		/// <summary>
		/// 头像
		/// </summary>
		[MaxLength(255,ErrorMessage = "头像最多500个字符")]
		public string Avatar { get; set; }
	}
}