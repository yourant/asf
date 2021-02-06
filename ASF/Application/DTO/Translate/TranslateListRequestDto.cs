using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Translate
{
	/// <summary>
	/// 多语言分页请求
	/// </summary>
	public class TranslateListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 多语言名称
		/// </summary>
		[MinLength(2,ErrorMessage = "多语言名称最少输入2个字符"),MaxLength(50,ErrorMessage = "多语言名字最多输入50个字符")]
		public string Name { get; set; }
	}
}