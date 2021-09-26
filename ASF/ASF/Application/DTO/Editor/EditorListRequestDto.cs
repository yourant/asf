using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 富文本分页请求
	/// </summary>
	public class EditorListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 用户名
		/// </summary>
		[MinLength(2,ErrorMessage = "页面名称最少输入2个字符"),MaxLength(50,ErrorMessage = "页面名称最多输入50个字符")]
		public string Name { get;  set; }
		/// <summary>
		/// 手机号码
		/// </summary>
		[Range(0,1,ErrorMessage = "页面类型只能输入0-1之间的数字")]
		public int? Type { get;set; }
	}
}