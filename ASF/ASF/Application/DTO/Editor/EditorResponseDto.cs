using System;

namespace ASF.Application.DTO.Editor
{
	/// <summary>
	/// 富文本列表响应
	/// </summary>
	public class EditorResponseDto: EditorTitleListResponseDto
	{
		/// <summary>
		/// key
		/// </summary>
		public long Key { get; set; }
		/// <summary>
		/// 富文本类型
		/// </summary>
		public int Type { get; set; }
		/// <summary>
		/// 生成html路径
		/// </summary>
		public string Path { get; set; }
		/// <summary>
		/// 轮播图集合
		/// </summary>
		public Banner Banner { get; set; }
		/// <summary>
		/// 原始网页
		/// </summary>
		public string OldContent { get; set; }
		/// <summary>
		/// 新网页
		/// </summary>
		public string NewContent { get; set; }
		/// <summary>
		/// meta 源数据
		/// </summary>
		public string Meta { get; set; }

		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
	}
	/// <summary>
	/// 轮播图
	/// </summary>
	public class Banner
	{
		/// <summary>
		/// 首页轮播图
		/// </summary>
		public string IndexBanner { get; set; }
		/// <summary>
		/// 资质证书
		/// </summary>
		public string DeviceBanner { get; set; }
		/// <summary>
		/// 合作伙伴
		/// </summary>
		public string Hezuo { get; set; }
	}
}