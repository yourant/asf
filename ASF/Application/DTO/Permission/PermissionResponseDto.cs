using System;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 权限响应数据
	/// </summary>
	public class PermissionResponseDto: PermissionModifyRequestDto
	{
		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime CreateTime { get; set; }
	}
}