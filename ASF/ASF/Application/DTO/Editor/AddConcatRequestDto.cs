using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Editor
{
	/// <summary>
	/// 添加联系方式
	/// </summary>
	public class AddConcatRequestDto
	{
		/// <summary>
		/// 姓名
		/// </summary>
		[Required(ErrorMessage = "姓名不能为空")]
		public string Name { get; set; }
		/// <summary>
		/// 手机号码
		/// </summary>
		[Required(ErrorMessage = "联系方式不能为空")]
		public string TelPhone { get; set; }
		/// <summary>
		/// 面积
		/// </summary>
		public string Area { get; set; }
		/// <summary>
		/// 内容
		/// </summary>
		public string Content { get; set; }
	}
}