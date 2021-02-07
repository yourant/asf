using System;

namespace ASF.Application.DTO.Tenancy
{
	/// <summary>
	/// 租户响应
	/// </summary>
	public class TenancyResponseDto:TenancyModifyRequestDto
	{
		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
	}
}