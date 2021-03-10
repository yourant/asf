using System.ComponentModel;

namespace ASF.Domain.Values
{
	/// <summary>
	/// 功能类型枚举
	/// </summary>
	public enum ApiType
	{
		/// <summary>
		/// 开放api
		/// </summary>
		[Description("开放api")]
		OpenApi = 1,
		/// <summary>
		/// 授权api
		/// </summary>
		[Description("授权api")]
		AuthApi = 2
	}
}