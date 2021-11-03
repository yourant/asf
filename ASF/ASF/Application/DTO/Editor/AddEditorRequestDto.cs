using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Editor
{
	/// <summary>
	/// 修改富文本内容
	/// </summary>
	public class AddEditorRequestDto
	{
		/// <summary>
		/// 页面名称
		/// </summary>
		[Required(ErrorMessage = "页面名称不能为空")]
		public string Name { get; set; }
		/// <summary>
		/// 页面路径
		/// </summary>
		[Required(ErrorMessage = "页面路径不能为空")]
		public string Path { get; set; }
		/// <summary>
		/// 旧内容
		/// </summary>
		[Required(ErrorMessage = "页面内容不能为空")]
		public string OldContent { get; set; }
		/// <summary>
		/// 轮播图
		/// </summary>
		public Banner Banner { get; set; }
		/// <summary>
		/// meta元数据
		/// </summary>
		public string Meta { get; set; }
	}
}