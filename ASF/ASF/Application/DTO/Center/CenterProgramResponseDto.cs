using System;
using System.Collections.Generic;
using ASF.Domain.Values;

namespace ASF.Application.DTO.Center
{
	/// <summary>
	/// 应用响应
	/// </summary>
	public class CenterProgramResponseDto
	{
		/// <summary>
		/// 表格需要的键
		/// </summary>
		public long Key {
			get
			{
				return ProgramId;
			}
		}
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
		public long? ProgramGroupId { get; set; }
		/// <summary>
		/// 商户组id
		/// </summary>
		public int? GroupShopId { get; set; }
		/// <summary>
		/// 账户id
		/// </summary>
		public long? AccountId { get; set; }
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
		public string ProgramTypeStr { get; set; }
		/// <summary>
		/// 方式
		/// </summary>
		public string ProgramWayTypeStr { get; set; }
		/// <summary>
		/// 模式
		/// </summary>
		public string ProgramModeTypeStr { get; set; }
		/// <summary>
		/// 商户id
		/// </summary>
		public int? MerchantId { get; set; }
		/// <summary>
		/// 商户key
		/// </summary>
		public string MerchantKey { get; set; }
		/// <summary>
		/// 供应链ID
		/// </summary>
		public long? ChainId { get; set; }
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
		public bool HasLiveBroadcast { get; set; }
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