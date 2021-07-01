using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.Serialization;

namespace ASF.Domain.Values
{
	/// <summary>
	/// 商户类型枚举
	/// </summary>
	[Flags]
	public enum ShopType : int
	{
		/// <summary>
		/// 空
		/// </summary>
		[Description("空")]
		None = 0,

		/// <summary>
		/// JPOS门店
		/// </summary>
		[Description("JPOS")]
		JPOS = 1,

		/// <summary>
		/// 仓库
		/// </summary>
		[Description("JPOS")]
		JWMS = 2,

		/// <summary>
		/// JMart
		/// 订小易注册的商户
		/// 允许JPOS门店登陆
		/// </summary>
		[Description("JMart")]
		
		JMart = 4,

		/// <summary>
		/// JCRM
		/// </summary>
		[Description("JCRM")]
		
		JCRM = 8,

		/// <summary>
		/// JOA（内部管理）
		/// </summary>
		[Description("JOA")]
		
		JOA = 16,

		/// <summary>
		/// 小易商城
		/// </summary>
		[Description("JMall")]
		
		JMall = 32,

		/// <summary>
		/// 小易商圈
		/// </summary>
		[Description("JMarket")]
		
		JMarket = 64,

		/// <summary>
		/// 服务商（暂指JWMS服务商，未来可考虑JPOS服务商）
		/// </summary>
		[Description("JISV")]
		
		JISV = 128,

		/// <summary>
		/// 集团型/总部管理（可以创建门店或仓库账号，统一查看其订单客户等信息）
		/// </summary>
		[Description("JGroup")]
		
		JGroup = 256,

		/// <summary>
		/// JPMS
		/// </summary>
		[Description("JPMS")]
		
		JPMS = 512,

		/// <summary>
		/// 新版门店收银系统
		/// </summary>
		[Description("GPOS")]
		
		GPOS = 1024,

		/// <summary>
		/// 券小易平台账户
		/// </summary>
		[Description("GAMS")]
		
		GAMS = 2048,

		/// <summary>
		/// 团购平台
		/// </summary>
		[Description("GEmporium")]
		
		GEmporium = 4096,

		/// <summary>
		/// 团购团长
		/// </summary>
		[Description("EmporiumAgent")]
		
		EmporiumAgent = 8192,

		/// <summary>
		/// 物流运输系统
		/// </summary>
		[Description("GTMS")]
		GTMS = 16384,
	}
	/// <summary>
	/// 版本枚举
	/// </summary>
	/// <summary>
	/// 系统版本类型
	/// </summary>
	[Flags]
	public enum EditionType : int
	{
		/// <summary>
		/// 空
		/// </summary>
		
		None = 0,

		/// <summary>
		/// 专业版（批发）
		/// </summary>
		
		Major = 1,

		/// <summary>
		/// 基础版（批发）
		/// </summary>
		
		Basics = 2,

		/// <summary>
		/// 商城版（批发）
		/// </summary>
		
		Mall = 4,

		/// <summary>
		/// 大客户版（批发）
		/// </summary>
		
		Clique = 128,

		/// <summary>
		/// 门店版（零售）
		/// </summary>
		
		POS = 8,

		/// <summary>
		/// 零售版（零售）
		/// </summary>
		
		Emporium = 16,

		/// <summary>
		/// 团购版（零售）
		/// </summary>
		
		Groupon = 32,
		/// <summary>
		/// 团长版（零售）
		/// </summary>
		
		Agent = 64,
	}
	/// <summary>
	/// 应用类型枚举
	/// </summary>
	[Flags]
	public enum ProgramType : int
	{
		/// <summary>
		/// 空
		/// </summary>
		
		None = 0,

		/// <summary>
		/// 批发订货系统
		/// </summary>
		
		JMart = 1,

		/// <summary>
		/// 批发订货系统
		/// </summary>
		
		JWMS = 2,

		/// <summary>
		/// 零售订货系统
		/// </summary>
		
		JSeller = 4,

		/// <summary>
		/// 零售管理
		/// </summary>
		
		GPOS = 8,

		/// <summary>
		/// 商圈
		/// </summary>
		
		JMarket = 16,

		/// <summary>
		/// 商城管理
		/// </summary>
		
		JMall = 32,

		//
		//Pifalao=32,

		/// <summary>
		/// 服务商
		/// </summary>
		
		JISV = 64,

		/// <summary>
		/// 优惠券平台
		/// </summary>
		
		GAMS = 128,

		/// <summary>
		/// 大数据系统
		/// </summary>
		
		GeData = 256,

		/// <summary>
		/// 团购系统
		/// </summary>
		
		GTuan = 512,

		/// <summary>
		/// 运输系统
		/// </summary>
		
		GTMS = 1024,
	}
	

	/// <summary>
	/// 程序的形式
	/// </summary>
	[Flags]
	public enum ProgramModeType : int
	{
		/// <summary>
		/// 空
		/// </summary>
		
		None = 0,

		/// <summary>
		/// 平台版
		/// 众多商户共存的聚合平台
		/// </summary>
		
		Platform = 1,

		/// <summary>
		/// 专业版
		/// 只限于单一商户的专业形式
		/// </summary>
		
		Single = 2,

		/// <summary>
		/// 连锁版
		/// 当前连锁客户的多商户版
		/// </summary>
		
		Chain = 3,
	}

	/// <summary>
	/// 程序的途径
	/// </summary>
	[Flags]
	public enum ProgramWayType : int
	{
		
		/// <summary>
		/// 空
		/// </summary>
		[Description("空")]
		None = 0,

		/// <summary>
		/// 客户端
		/// </summary>
		
		Client = 1,
		/// <summary>
		/// Web
		/// </summary>
		
		Web = 2,

		/// <summary>
		/// 
		/// </summary>
		
		Android = 4,

		/// <summary>
		/// IOS APP
		/// </summary>
		
		IOS = 8,

		/// <summary>
		/// 小程序
		/// </summary>
		
		MiniApp = 16,

		/// <summary>
		/// 微信公众号
		/// </summary>
		
		WechatMedia = 32,

		/// <summary>
		/// 微信开放平台
		/// </summary>
		
		WeixinOpen = 64,
	}
	/// <summary>
	/// 修改账户的类型
	/// </summary>
	public enum ModifyAccountType
	{
		/// <summary>
		/// 是否启用账户
		/// </summary>
		Enable = 1,
		/// <summary>
		/// 是否为平台账户
		/// </summary>
		IsPlatform = 2,
		/// <summary>
		/// 是否为虚拟账户
		/// </summary>
		IsVisual  = 3,
		/// <summary>
		/// 是否允许提款
		/// </summary>
		AllowCashOut = 4,
		/// <summary>
		/// 是否允许收款
		/// </summary>
		AllowCashIn = 5,
		/// <summary>
		/// 是否允许自动提款
		/// </summary>
		AutoCashOut = 6,
		/// <summary>
		/// 启用支付类型
		/// </summary>
		PayTypeEnable = 7
	}

	/// <summary>
	/// 枚举类型字典
	/// </summary>
	public static class EnumValue
	{
		/// <summary>
		/// 商户类型值对象
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

		// /// <summary>
		// /// 版本类型枚举值对象
		// /// </summary>
		// public static Dictionary<int, string> EditionTypeValue = new Dictionary<int, string>()
		// {
		// 	[0] = "空",
		// 	[1] = "Major",
		// 	[2] = "Basics",
		// 	[4] = "Mall",
		// 	[8] = "POS",
		// 	[16] = "Emporium",
		// 	[32] = "Groupon",
		// 	[64] = "Agent",
		// 	[128] = "Clique"
		// };
	}
}