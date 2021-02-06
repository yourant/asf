using System.ComponentModel;

namespace ASF.Domain.Values
{
	/// <summary>
	/// 启用/禁用枚举
	/// </summary>
	public enum EnabledType
	{
		/// <summary>
		/// 禁用
		/// </summary>
		[Description("禁用")]
		Disabled = 0,
		/// <summary>
		/// 启用
		/// </summary>
		[Description("启用")]
		Enabled = 1
	}
}