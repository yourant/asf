using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 权限菜单列表请求	
	/// </summary>
	public class PermissionMenuListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 权限id
		/// </summary>
		public long? PermissionId { get; set; }
		/// <summary>
		/// 权限菜单标题
		/// </summary>
		[MinLength(1,ErrorMessage = "最少输入1个字符的权限菜单标题")]
		[MaxLength(50,ErrorMessage = "最多输入50个字符的权限菜单标题")]
		public string Title { get; set; }
		/// <summary>
		/// 权限菜单地址
		/// </summary>
		[MinLength(1,ErrorMessage = "最少输入1个字符的权限菜单地址")]
		[MaxLength(255,ErrorMessage = "最多输入255个字符的权限菜单地址")]
		public string MenuUrl { get; set; }
	}
}