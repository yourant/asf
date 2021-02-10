using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 账户
	/// </summary>
	public class AccountModifyRequestDto: AccountCreateRequestDto
	{
		
		/// <summary>
		/// 是否删除
		/// </summary>
		[Range(0,1,ErrorMessage = "是否删除只能输入0-1之间的数字")]
		public bool? IsDeleted { get;  set; }
	}
}