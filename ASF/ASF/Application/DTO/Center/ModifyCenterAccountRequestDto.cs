using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Center
{
	/// <summary>
	/// 修改账户
	/// </summary>
	public class ModifyCenterAccountRequestDto: AddCenterAccountRequestDto
	{
		/// <summary>
		/// 账户id
		/// </summary>
		[Required(ErrorMessage = "账户id不能为空")]
		public long? AccountId { get; set; }
	}
}