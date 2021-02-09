using System;

namespace ASF.Application.DTO.Post
{
	/// <summary>
	/// 岗位响应
	/// </summary>
	public class PostResponseDto: PostModifyRequestDto
	{
		/// <summary>
		/// 租户id
		/// </summary>
		public long? TenancyId { get; set; }
		/// <summary>
		/// 创建者id
		/// </summary>
		public long? CreateId { get; set; }
		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
	}
}