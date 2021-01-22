using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 创建权限
	/// </summary>
	public class PermissionCreateRequestDto
	{
		/// <summary>
		/// 权限代码
		/// </summary>
		[Required(ErrorMessage = "权限代码不能为空")]
		[MaxLength(255,ErrorMessage = "最多输入255个字符的权限代码")]
		public string Code { get;  set; }
		/// <summary>
		/// 上级权限编号
		/// </summary>
		public long? ParentId { get; set; }
		/// <summary>
		/// 名称
		/// </summary>
		[Required(ErrorMessage = "权限名称不能为空")]
		[MaxLength(255,ErrorMessage = "最多输入255个字符的权限名称")]
		public string Name { get; set; }
		/// <summary>
		/// 权限类型
		/// </summary>
		[Required(ErrorMessage = "权限类型不能为空")]
		[Range(1,2,ErrorMessage = "只能输入1-2之间的权限类型")]
		public uint? Type { get; set; }
		/// <summary>
		/// 是否系统权限
		/// </summary>
		[Range(0,1,ErrorMessage = "是否为系统权限功能只能为0-1之间的数字")]
		public uint? IsSystem { get; set; }
        
		/// <summary>
		/// 描述
		/// </summary>
		[MaxLength(ErrorMessage = "最多输入500个字符的描述")]
		public string Description { get; set; }
		/// <summary>
		/// 排序
		/// </summary>
		[Range(0,100,ErrorMessage = "只能输入0-100之间的排序规则")]
		public int? Sort { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		[Range(0,1,ErrorMessage = "是否启用只能输入0-1之间的数字")]
		public uint? Enable { get; set; }
	}
}