using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 账户分配部门
	/// </summary>
	public class AccountAssignDepartmentRequestDto
	{
		/// <summary>
		/// 账户id
		/// </summary>
		public long Id { get; set; }
		/// <summary>
		/// 部门id
		/// </summary>
		[Required(ErrorMessage = "部门id不能为空")]
		public long? DepartmentId { get; set; }
	}
}