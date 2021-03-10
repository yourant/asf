using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Post
{
	/// <summary>
	/// 创建岗位请求
	/// </summary>
	public class PostCreateRequestDto
	{
		/// <summary>
		/// 租户id
		/// </summary>
		public long? TenancyId { get; set; }
		/// <summary>
		/// 岗位名
		/// </summary>
		[Required(ErrorMessage = "岗位名称不能为空"),MinLength(2,ErrorMessage = "最少输入两个字符的岗位名"),MaxLength(50,ErrorMessage = "最多输入50个字符的岗位名")]
		public string Name { get; set; }
		/// <summary>
		/// 排序
		/// </summary>
		[Range(0,100,ErrorMessage = "只能输入0-100之间的排序")]
		public int? Sort { get; set; }
		/// <summary>
		/// 等级
		/// </summary>
		[Range(0,10,ErrorMessage = "只能输入0-10之间的等级")]
		public int? Level { get; set; }
		/// <summary>
		/// 岗位状态
		/// </summary>
		[Range(0,1,ErrorMessage = "只能输入0-1之间的状态")]
		public uint? Enabled { get; set; }
		/// <summary>
		/// 岗位描述
		/// </summary>
		[MaxLength(ErrorMessage = "最多输入255个字符的岗位描述")]
		public string Description { get; set; }
	}
}