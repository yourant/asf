using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASF.Application.DTO.Department
{
	/// <summary>
	/// 创建部门
	/// </summary>
	public class DepartmentCreateRequestDto
	{
		/// <summary>
		/// 父id
		/// </summary>
		public long Pid { get; set; }
		/// <summary>
		/// 部门名称
		/// </summary>
		[Required(ErrorMessage = "部门名称不能为空"),MinLength(2,ErrorMessage = "最少输入2个字符的部门名称"), MaxLength(50,ErrorMessage = "最多输入50个字符的部门名称")]
		public string Name { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		public uint? Enabled { get; set; }
		/// <summary>
		/// 排序
		/// </summary>
		public int? Sort { get; set; }
		/// <summary>
		/// 角色id 集合
		/// </summary>
		[NotMapped]
		public List<long> RoleIds { get; set; }
	}
}