using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 权限分页列表请求
	/// </summary>
	public class PermissionListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 权限代码
		/// </summary>
		[MaxLength(50, ErrorMessage = "权限代码最多50个字符")]
		public string Code { get; set; }
		/// <summary>
		/// 权限名称
		/// </summary>
		[MaxLength(100, ErrorMessage = "权限名称最多输100个字符")]
		public string Name { get; set; }
		/// <summary>
		/// 权限类型
		/// </summary>
		[Range(1,3,ErrorMessage = "权限类型只能输入1-3数字")]
		public uint? Type { get; set; }
		/// <summary>
		/// 是否为系统权限
		/// </summary>
		[Range(0,1,ErrorMessage = "是否为系统权限只能输入0-1数字")]
		public uint? IsSys { get; set; }
		/// <summary>
		/// 权限状态
		/// </summary>
		[Range(0,1,ErrorMessage = "权限状态只能输入0-1数字")]
		public uint? Status { get; set; }
	}
}