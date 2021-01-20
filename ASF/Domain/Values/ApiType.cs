using System.ComponentModel;

namespace ASF.Domain.Values
{
	public enum ApiType
	{
		[Description("开放api")]
		OpenApi = 1,
		[Description("授权api")]
		AuthApi = 2
	}
}