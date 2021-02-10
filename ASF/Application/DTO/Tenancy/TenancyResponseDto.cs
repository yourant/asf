using System;
using System.Collections.Generic;

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
		/// <summary>
		/// 创建者id
		/// </summary>
		public long? CreateId { get; set; }
		/// <summary>
		/// 对应租户下面账户
		/// </summary>
		public List<object> Accounts { get; set; }
	}
}