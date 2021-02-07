using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Department
{
	/// <summary>
	/// 部门分页请求
	/// </summary>
	public class DepartmentListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 部门名称
		/// </summary>
		[MinLength(2,ErrorMessage = "最少输入2个字符的部门名称"), MaxLength(50,ErrorMessage = "最多输入50个字符的部门名称")]
		public string Name { get; set; }
		/// <summary>
		/// 部门状态
		/// </summary>
		public uint? Status { get; set; }
	}
}