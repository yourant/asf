using System;

namespace ASF.Domain.Entities.Center
{
	/// <summary>
	/// 应用
	/// </summary>
	public class CenterProgram
	{
		/// <summary>
		/// 应用id
		/// </summary>
		public long ProgramId { get; set; }
		/// <summary>
		/// 应用key
		/// </summary>
		public string ProgramKey { get; set; }
		/// <summary>
		/// 应用组id
		/// </summary>
		public long ProgramGroupId { get; set; }
		/// <summary>
		/// 商户组id
		/// </summary>
		public long GroupShopId { get; set; }
		/// <summary>
		/// 账户id
		/// </summary>
		public long AccountId { get; set; }
		/// <summary>
		/// 支付渠道key
		/// </summary>
		public string PayChannelKey { get; set; }
		/// <summary>
		/// 应用名称
		/// </summary>
		public string Name { get; set; }
		/// <summary>
		/// 云app key
		/// </summary>
		public string CloudAppKey { get; set; }
		/// <summary>
		/// 微信appid
		/// </summary>
		public string WxAppId { get; set; }
		/// <summary>
		/// 应用类型
		/// </summary>
		public int Type { get; set; }
		/// <summary>
		/// 方式
		/// </summary>
		public int Way { get; set; }
		/// <summary>
		/// 模式
		/// </summary>
		public int Mode { get; set; }
		/// <summary>
		/// 商户id
		/// </summary>
		public long MerchantId { get; set; }
		/// <summary>
		/// 商户key
		/// </summary>
		public string MerchantKey { get; set; }
		/// <summary>
		/// 供应链ID
		/// </summary>
		public long ChainId { get; set; }
		/// <summary>
		/// 供应链key
		/// </summary>
		public string ChainKey { get; set; }
		/// <summary>
		/// 创建时间s
		/// </summary>
		public DateTime SubmitTime { get; set; }
		/// <summary>
		/// 使用版本号
		/// </summary>
		public string TrialVersion { get; set; }
		/// <summary>
		/// 使用商户key
		/// </summary>
		public string TrialMerchantKey { get; set; }
		/// <summary>
		/// 是否有直播
		/// </summary>
		public uint HasLiveBroadcast { get; set; }
		/// <summary>
		/// 版权
		/// </summary>
		public string Copyright { get; set; }
		/// <summary>
		/// 应用logo
		/// </summary>
		public string Logo { get; set; }
	}	
}