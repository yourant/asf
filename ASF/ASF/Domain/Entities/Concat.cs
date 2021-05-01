using System;

namespace ASF.Domain.Entities
{
	/// <summary>
	/// 联系方式
	/// </summary>
	public class Concat
	{
		/// <summary>
		/// id
		/// </summary>
		public long Id { get; set; }
		/// <summary>
		/// 姓名
		/// </summary>
		public string Name { get; set; }
		/// <summary>
		/// 手机号码
		/// </summary>
		public string TelPhone { get; set; }
		/// <summary>
		/// 邮箱地址
		/// </summary>
		public string Email { get; set; }
		/// <summary>
		/// 面积
		/// </summary>
		public string Area { get; set; }
		/// <summary>
		/// 内容
		/// </summary>
		public string Content { get; set; }

		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
	}
}