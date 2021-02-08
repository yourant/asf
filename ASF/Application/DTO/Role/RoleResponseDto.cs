using System;
using System.Collections.Generic;
using ASF.Application.DTO.Department;

namespace ASF.Application.DTO.Role
{
	/// <summary>
	/// 角色响应
	/// </summary>
	public class RoleResponseDto: RoleModifyRequestDto
	{
		/// <summary>
		/// 租户id
		/// </summary>
		public long? TenancyId { get; set; }
		/// <summary>
		/// 创建者id
		/// </summary>
		public long? CreateId { get; set; }

		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
		/// <summary>
		/// 角色权限
		/// </summary>
		public List<PermissionResponseDto> Permission { get; set; }

		/// <summary>
		/// 角色关联账户名称
		/// </summary>
		public List<string> AccountName { get; set; }

		/// <summary>
		/// 角色关联部门集合
		/// </summary>
		public List<object> Department { get; set; }
	}
}