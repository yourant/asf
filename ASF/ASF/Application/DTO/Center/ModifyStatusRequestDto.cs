using System.ComponentModel.DataAnnotations;
using ASF.Domain.Values;

namespace ASF.Application.DTO.Center
{
	/// <summary>
	/// 修改状态
	/// </summary>
	public class ModifyStatusRequestDto
	{
		/// <summary>
		/// id
		/// </summary>
		[Required(ErrorMessage = "id不能为空")]
		public long Id { get; set; }
		/// <summary>
		/// 状态
		/// </summary>
		[Required(ErrorMessage = "状态不能为空")]
		public int? Status { get; set; }
		/// <summary>
		/// 要修改的种类
		/// </summary>
		[Required(ErrorMessage = "修改种类不能为空")]
		public ModifyAccountType Type { get; set; }
	}
}