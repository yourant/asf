using System.ComponentModel;

namespace ASF.Domain.Values
{
	/// <summary>
	/// 登录类型枚举
	/// </summary>
	public enum LoginTypeValue
	{
		/// <summary>
		/// 账户名登录
		/// </summary>
		[Description("账户名登录")]
		Account = 1,
		/// <summary>
		/// 手机号码登录
		/// </summary>
		[Description("手机号码登录")]
		Mobile = 2,
		/// <summary>
		/// 邮箱地址登录
		/// </summary>
		[Description("邮箱地址登录")]
		Email = 3
	}
}