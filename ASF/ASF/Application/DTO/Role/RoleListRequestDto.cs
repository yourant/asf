using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Role
{
	/// <summary>
	/// 角色分页请求
	/// </summary>
	public class RoleListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 角色名称
		/// </summary>
		[MinLength(2,ErrorMessage = "最少输入2个字符的角色名称"), MaxLength(50,ErrorMessage = "最多输入50个字符的角色名称")]
		public string Name { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		[Range(0,1,ErrorMessage = "是否启用只能输入0-1之间的数字")]
		public uint? Enable { get; set; }
	}
}