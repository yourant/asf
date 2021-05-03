using System;

namespace ASF.Application.DTO.Editor
{
	/// <summary>
	/// 联系方式响应
	/// </summary>
	public class ConcatResponseDto: AddConcatRequestDto
	{
		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
	}
}