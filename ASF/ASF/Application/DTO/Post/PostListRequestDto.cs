using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Post
{
	/// <summary>
	/// 岗位分页请求
	/// </summary>
	public class PostListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 岗位名称
		/// </summary>
		[MinLength(2,ErrorMessage = "最少输入2个字符的部门名称"), MaxLength(50,ErrorMessage = "最多输入50个字符的部门名称")]
		public string Name { get; set; }
		/// <summary>
		/// 岗位状态
		/// </summary>
		[Range(0,1,ErrorMessage = "岗位状态只能输入0-1之间数字")]
		public uint? Status { get; set; }
	}
}