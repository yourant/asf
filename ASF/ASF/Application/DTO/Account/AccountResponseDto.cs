using System;
using System.Collections.Generic;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 账户响应数据
	/// </summary>
	public class AccountResponseDto
	{
		/// <summary>
		/// 账户集合
		/// </summary>
		public object Accounts { get; set; }
		/// <summary>
		/// 账户角色
		/// </summary>
		public List<object> Roles { get; set; }
		/// <summary>
		/// 账户对应部门
		/// </summary>
		public object Department { get; set; }
		/// <summary>
		/// 账户对应岗位
		/// </summary>
		public List<object> Posts { get; set; }
		/// <summary>
		/// 账户对应租户
		/// </summary>
		public object Tenancys { get; set; }
	}
}