using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Editor
{
	/// <summary>
	/// 修改富文本内容
	/// </summary>
	public class ModifyEditorRequestDto
	{
		/// <summary>
		/// 富文本id
		/// </summary>
		public long Id { get; set; }
		/// <summary>
		/// 新内容
		/// </summary>
		public string NewContent { get; set; }
		/// <summary>
		/// 轮播图
		/// </summary>
		public string Banner { get; set; }
	}
}