using System;
using System.Collections.Generic;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 权限菜单响应数据
	/// </summary>
	public class PermissionMenuInfoResponseDto
	{
		/// <summary>
		/// 唯一标示
		/// </summary>
		public long Id { get;  set; }
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
		/// 描述
		/// </summary>
		public string Description { get; set; }
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
		/// 菜单标题
		/// </summary>
		public string Title { get; set; }
		/// <summary>
		/// 副标题
		/// </summary>
		public string Subtitle { get; set; }
		/// <summary>
		/// 菜单图标
		/// </summary>
		public string Icon { get; set; }
		/// <summary>
		/// 菜单是否隐藏
		/// </summary>
		public bool? MenuHidden { get; set; }
		/// <summary>
		/// 菜单内部地址
		/// </summary>
		public string MenuUrl { get; set; }
		/// <summary>
		/// 外部链接
		/// </summary>
		public string ExternalLink { get; set; }

		/// <summary>
		/// 菜单重定向地址
		/// </summary>
		public string MenuRedirect { get; set; }
		/// <summary>
		/// 菜单说明
		/// </summary>
		public string MenuDescription { get; set; }
		/// <summary>
		/// 多语言
		/// </summary>
		public string Translate { get; set; }
		/// <summary>
		/// 权限功能
		/// </summary>
		public List<string> Actions { get; set; }
	}
}