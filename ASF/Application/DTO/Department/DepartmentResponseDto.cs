using System;

namespace ASF.Application.DTO.Department
{
	/// <summary>
	/// 部门响应
	/// </summary>
	public class DepartmentResponseDto: DepartmentModifyRequestDto
	{
		/// <summary>
		/// 租户id
		/// </summary>
		public long? TenancyId { get; set; }
		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
	}
}