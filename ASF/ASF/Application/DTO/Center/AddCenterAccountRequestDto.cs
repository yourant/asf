using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Center
{
	/// <summary>
	/// 添加账户
	/// </summary>
	public class AddCenterAccountRequestDto
	{
		/// <summary>
		/// 账户姓名
		/// </summary>
		[Required(ErrorMessage = "账户名不能为空")]
		[MinLength(2,ErrorMessage = "最少输入两个字符的账户名"),MaxLength(100,ErrorMessage = "最多输入100个字符的账户名")]
		public string Name { get; set; }
		/// <summary>
		/// 所有商户类型
		/// </summary>
		[Required(ErrorMessage = "商户类型不能为空")]
		public int? AllowShopType { get; set; }
		/// <summary>
		/// 账户抵消金额
		/// </summary>
		[Range(0.01,10000,ErrorMessage = "请输入0.01-10000之间的数值")]
		public decimal Balance { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		public bool IsEnable { get; set; } = true;
		/// <summary>
		/// 是否为平台账户
		/// </summary>
		public bool IsPlatform { get; set; } = false;
		/// <summary>
		/// 是否为虚拟账户
		/// </summary>
		public bool IsVisual { get; set; } = false;
		/// <summary>
		/// 是否允许提款
		/// </summary>
		public bool AllowCashOut { get; set; } = false;

		/// <summary>
		/// 是否允许收款
		/// </summary>
		public bool AllowCashIn { get; set; } = false;

		/// <summary>
		/// 是否允许自动提款
		/// </summary>
		public bool AutoCashOut { get; set; } = false;
		/// <summary>
		/// 最小提款
		/// </summary>
		[Range(0.01,10000,ErrorMessage = "请输入0.01-10000之间的数值")]
		public decimal? MinCashOut { get; set; }
		/// <summary>
		/// 开始提款金额
		/// </summary>
		[Range(0.01,10000,ErrorMessage = "请输入0.01-10000之间的数值")]
		public decimal? SeedCashOut { get; set; }
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
		public string YijiChannelKey { get; set; }
		/// <summary>
		/// 提款手续费率
		/// </summary>
		[Required(ErrorMessage = "提款手续费不能为空")]
		[Range(0.01,10000,ErrorMessage = "请输入0.01-10000之间的数值")]
		public decimal? CashOutRate { get; set; }
		/// <summary>
		/// 默认手续费率
		/// </summary>
		[Range(0.01,10000,ErrorMessage = "请输入0.01-10000之间的数值")]
		[Required(ErrorMessage = "默认手续费率不能为空")]
		public decimal? DefaultRate { get; set; }
		/// <summary>
		/// 默认支付宝账户
		/// </summary>
		public string DefaultAlipayMerNO { get; set; }
		/// <summary>
		/// 默认微信账户
		/// </summary>
		public string DefaultWepayMerNO { get; set; }
		/// <summary>
		/// 默认和包支付账户
		/// </summary>
		public string DefaultCmPayMerNO { get; set; }
		/// <summary>
		///	 默认翼支付账户
		/// </summary>
		public string DefaultBestpayMerNO { get; set; }
		/// <summary>
		/// 默认银联支付账户
		/// </summary>
		public string DefaultUnionPayMerNO { get; set; }
		/// <summary>
		/// 默认沃钱包支付账户
		/// </summary>
		public string DefaultUnicompayMerNO { get; set; }
		/// <summary>
		/// 支付宝账户默认费率
		/// </summary>
		public decimal? DefaultAliPayRate { get; set; }
		/// <summary>
		/// 微信账户费率
		/// </summary>
		public decimal? DefaultWePayRate { get; set; }
		/// <summary>
		/// 和钱包费率
		/// </summary>
		public decimal? DefaultCmPayRate { get; set; }
		/// <summary>
		/// 翼支付费率
		/// </summary>
		public decimal? DefaultBestpayRate { get; set; }
		/// <summary>
		/// 银联账户费率
		/// </summary>
		public decimal? DefaultUnionPayRate { get; set; }
		/// <summary>
		/// 沃钱包费率
		/// </summary>
		public decimal? DefaultUnicompayRate { get; set; }
		/// <summary>
		/// 支付类型启用
		/// </summary>
		[Required(ErrorMessage = "支付类型是否启用不能为空")]
		public int? PayTypeEnable { get; set; }
		/// <summary>
		/// 备注
		/// </summary>
		public string Remarks { get; set; }
	}
}