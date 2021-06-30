using System.Collections.Generic;

namespace ASF.Domain.Values
{
	/// <summary>
	/// 枚举类型字典
	/// </summary>
	public static class EnumValue
	{
		/// <summary>
		/// 商户类型
		/// </summary>
		public static Dictionary<int, string> AllowShopTypeValue = new Dictionary<int, string>()
		{
			[0] = "空",
			[1] = "JPOS",
			[2] = "JWMS",
			[4] = "JMart",
			[8] = "JCRM",
			[16] = "JOA",
			[32] = "JMall",
			[64] = "JMarket",
			[128] = "JISV",
			[256] = "JGroup",
			[512] = "JPMS",
			[1024] = "GPOS",
			[2048] = "GAMS",
			[4094] = "GEmporium",
			[8192] = "EmporiumAgent",
			[16384] = "GTMS"
		};
	}
}