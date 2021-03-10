using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 创建权限菜单
	/// </summary>
	public class PermissionMenuCreateRequestDto
	{
		/// <summary>
		/// 权限id
		/// </summary>
		public long? PermissionId { get; set; }
		/// <summary>
		/// 菜单标题
		/// </summary>
		[Required(ErrorMessage = "权限菜单标题不能为空")]
		[MinLength(2,ErrorMessage = "最少输入两个字符的权限菜单标题")]
		[MaxLength(50,ErrorMessage = "最多输入50个字符的权限菜单标题")]
		public string Title { get; set; }
		/// <summary>
		/// 副标题
		/// </summary>
		[MinLength(2,ErrorMessage = "最少输入两个字符的权限菜单副标题")]
		[MaxLength(50,ErrorMessage = "最多输入50个字符的权限菜单副标题")]
		public string Subtitle { get; set; }
		/// <summary>
		/// 菜单图标
		/// </summary>
		[Required(ErrorMessage = "权限菜单图标不能为空")]
		public string Icon { get; set; }
		/// <summary>
		/// 菜单是否隐藏
		/// </summary>
		[Range(0,1,ErrorMessage = "是否隐藏菜单只能为0-1之间的数字")]
		public uint? MenuHidden { get; set; }
		/// <summary>
		/// 菜单内部地址
		/// </summary>
		[MaxLength(255,ErrorMessage = "权限菜单地址最多输入255个字符")]
		public string MenuUrl { get; set; }
		/// <summary>
		/// 描述
		/// </summary>
		[MaxLength(500,ErrorMessage = "权限菜单描述最多输入500个字符")]
		public string Description { get; set; }
		/// <summary>
		/// 外部链接
		/// </summary>
		[MaxLength(255,ErrorMessage = "权限菜单外部地址最多输入255个字符")]
		public string ExternalLink { get; set; }
		/// <summary>
		/// 菜单重定向地址
		/// </summary>
		[MaxLength(255,ErrorMessage = "权限菜单重定向地址最多输入255个字符")]
		public string MenuRedirect { get; set; }
		/// <summary>
		/// 多语言
		/// </summary>
		[MaxLength(255,ErrorMessage = "权限菜单多语言最多输入255个字符")]
		public string Translate { get; set; }
	}
}