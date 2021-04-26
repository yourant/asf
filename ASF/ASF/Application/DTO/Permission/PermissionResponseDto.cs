using System;
using System.Collections.Generic;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 权限响应数据
	/// </summary>
	public class PermissionResponseDto: PermissionModifyRequestDto
	{
		/// <summary>
		/// key
		/// </summary>
		public long Key { get; set; }

		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
		/// <summary>
		/// 子集合
		/// </summary>
		public IEnumerable<PermissionResponseDto> Children { get; set; }
	}
}