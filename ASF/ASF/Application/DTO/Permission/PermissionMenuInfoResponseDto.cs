using System;
using System.Collections.Generic;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 权限菜单响应数据
	/// </summary>
	public class PermissionMenuInfoResponseDto: PermissionMenuModifyRequestDto
	{
		/// <summary>
		/// 权限代码
		/// </summary>
		public string Code { get;  set; }
		/// <summary>
		/// 上级权限编号
		/// </summary>
		public long ParentId { get; set; }
		/// <summary>
		/// 名称
		/// </summary>
		public string Name { get; set; }
		/// <summary>
		/// 权限类型
		/// </summary>
		public uint Type { get; set; }
		/// <summary>
		/// 是否系统权限
		/// </summary>
		public bool? IsSystem { get; set; }
		/// <summary>
		/// 排序
		/// </summary>
		public int Sort { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		public bool? Enable { get; set; }
		/// <summary>
		/// 添加时间
		/// </summary>
		public DateTime CreateTime { get; set; }
		/// <summary>
		/// 权限说明
		/// </summary>
		public string PermissionDescription { get; set; }
		/// <summary>
		/// 权限功能
		/// </summary>
		public List<string> Actions { get; set; }
	}
}