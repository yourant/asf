using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASF.Application.DTO.Role
{
	/// <summary>
	/// 创建角色
	/// </summary>
	public class RoleCreateRequestDto
	{
		/// <summary>
		/// 租户id
		/// </summary>
		public long? TenancyId { get; set; }
		/// <summary>
		/// 角色名称
		/// </summary>
		[Required(ErrorMessage = "角色名称不能为空"),MinLength(2,ErrorMessage = "最少输入2个字符的角色名称"), MaxLength(50,ErrorMessage = "最多输入50个字符的角色名称")]
		public string Name { get; set; }
		/// <summary>
		/// 描述
		/// </summary>
		[MinLength(2,ErrorMessage = "最少输入2个字符的角色名称"), MaxLength(255,ErrorMessage = "最多输入255个字符的角色名称")]
		public string Description { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		[Range(0,1,ErrorMessage = "是否启用只能输入0-1之间的数字")]
		public uint? Enable { get; set; }
		/// <summary>
		/// 要分配的权限id集合
		/// </summary>
		[NotMapped]
		public List<long> PermissionId { get; set; }
	}
}