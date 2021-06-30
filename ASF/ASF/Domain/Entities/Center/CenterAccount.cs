using System;

namespace ASF.Domain.Entities.Center
{
	/// <summary>
	/// 账户中心
	/// </summary>
	public class CenterAccount
	{
		/// <summary>
		/// 账户id
		/// </summary>
		public long AccountId { get; set; }
		/// <summary>
		/// 商户组 id
		/// </summary>
		public long GroupShopId { get; set; }
		/// <summary>
		/// 账户姓名
		/// </summary>
		public string Name { get; set; }
		/// <summary>
		/// 所有商户类型
		/// </summary>
		public int AllowShopType { get; set; }
		/// <summary>
		/// 账户抵消金额
		/// </summary>
		public decimal Balance { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		public uint IsEnable { get; set; }
		/// <summary>
		/// 是否为平台账户
		/// </summary>
		public uint IsPlatform { get; set; }
		/// <summary>
		/// 是否为虚拟账户
		/// </summary>
		public uint IsVisual { get; set; }
		/// <summary>
		/// 是否允许提款
		/// </summary>
		public uint AllowCashOut { get; set; }
		/// <summary>
		/// 是否允许收款
		/// </summary>
		public uint AllowCashIn { get; set; }
		/// <summary>
		/// 是否允许自动提款
		/// </summary>
		public uint AutoCashOut { get; set; }
		/// <summary>
		/// 最小提款
		/// </summary>
		public decimal MinCashOut { get; set; }
		/// <summary>
		/// 开始提款金额
		/// </summary>
		public decimal SeedCashOut { get; set; }
		/// <summary>
		/// 云支付账户名
		/// </summary>
		public string CloudPayAccountName { get; set; }
		/// <summary>
		/// 微信支付渠道key
		/// </summary>
		public string PosWxChannelKey { get; set; }
		/// <summary>
		/// 支付宝支付渠道key
		/// </summary>
		public string PosAliChannelKey { get; set; }
		/// <summary>
		/// 易极支付key
		/// </summary>
		public string YiJiChannelKey { get; set; }
		/// <summary>
		/// 提款手续费率
		/// </summary>
		public decimal CashOutRate { get; set; }
		/// <summary>
		/// 默认手续费率
		/// </summary>
		public decimal DefaultRate { get; set; }
		/// <summary>
		/// 默认支付宝账户
		/// </summary>
		public string DefaultAlipayMerNo { get; set; }
		/// <summary>
		/// 默认微信账户
		/// </summary>
		public string DefaultWePayMerNo { get; set; }
		/// <summary>
		/// 默认和包支付账户
		/// </summary>
		public string DefaultCmPayMerNo { get; set; }
		/// <summary>
		///	 默认翼支付账户
		/// </summary>
		public string DefaultBestPayMerNo { get; set; }
		/// <summary>
		/// 默认银联支付账户
		/// </summary>
		public string DefaultUnionPayMerNo { get; set; }
		/// <summary>
		/// 默认沃钱包支付账户
		/// </summary>
		public string DefaultUnicomPayMerNo { get; set; }
		/// <summary>
		/// 支付宝账户默认费率
		/// </summary>
		public decimal DefaultAliPayRate { get; set; }
		/// <summary>
		/// 微信账户费率
		/// </summary>
		public decimal DefaultWePayRate { get; set; }
		/// <summary>
		/// 和钱包费率
		/// </summary>
		public decimal DefaultCmPayRate { get; set; }
		/// <summary>
		/// 翼支付费率
		/// </summary>
		public decimal DefaultBestpayRate { get; set; }
		/// <summary>
		/// 银联账户费率
		/// </summary>
		public decimal DefaultUnionPayRate { get; set; }
		/// <summary>
		/// 沃钱包费率
		/// </summary>
		public decimal DefaultUnicomPayRate { get; set; }
		/// <summary>
		/// 支付类型启用
		/// </summary>
		public int PayTypeEnable { get; set; }
		/// <summary>
		/// 备注
		/// </summary>
		public string Remarks { get; set; }
		/// <summary>
		/// 行版本
		/// </summary>
		public byte[] RowVersion { get; set; }
	}
}