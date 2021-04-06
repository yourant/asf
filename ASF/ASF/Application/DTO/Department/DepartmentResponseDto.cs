using System;
using System.Collections.Generic;
using ASF.Application.DTO.Role;

namespace ASF.Application.DTO.Department
{
	/// <summary>
	/// 部门响应
	/// </summary>
	public class DepartmentResponseDto: DepartmentModifyRequestDto
	{
		/// <summary>
		/// key
		/// </summary>
		public long Key { get; set; }

		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
		/// <summary>
		/// 部门对应的角色id与名称
		/// </summary>
		public List<object> Roles { get; set; }
		/// <summary>
		/// 部门所属用户
		/// </summary>
		public List<object> Accounts { get; set; }
	}
}