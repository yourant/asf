using System;

namespace ASF.Domain.Entities.Center
{
	/// <summary>
	/// 商户
	/// </summary>
	public class CenterShop
	{
		/// <summary>
		/// 商户id
		/// </summary>
		public long ShopId { get; set; }
		/// <summary>
		/// 商户key
		/// </summary>
		public string ShopKey { get; set; }
		/// <summary>
		/// 商户类型
		/// </summary>
		public int ShopType { get; set; }
		/// <summary>
		/// 供应链id
		/// </summary>
		public string ChainId { get; set; }
		/// <summary>
		/// 商户名称
		/// </summary>
		public string Name { get; set; }
		/// <summary>
		/// 商户昵称
		/// </summary>
		public string NickName { get; set; }
		/// <summary>
		/// 商户logo
		/// </summary>
		public string Logo { get; set; }
		/// <summary>
		/// 商户图片
		/// </summary>
		public string Principal { get; set; }
		/// <summary>
		/// 商户手机
		/// </summary>
		public string Mobile { get; set; }
		/// <summary>
		/// 商铺电话
		/// </summary>
		public string Phone { get; set; }
		/// <summary>
		/// 商户简介
		/// </summary>
		public string BusinessContacter { get; set; }
		/// <summary>
		/// 商品电话
		/// </summary>
		public string BusinessPhone { get; set; }
		/// <summary>
		/// 商户地址
		/// </summary>
		public string Address { get; set; }
		/// <summary>
		/// 商户区域id
		/// </summary>
		public long RegionId { get; set; }
		/// <summary>
		/// 商户区域路径
		/// </summary>
		public string RegionPath { get; set; }
		/// <summary>
		/// 商户证书状态
		/// </summary>
		public uint CertState { get; set; }
		/// <summary>
		/// 商户创建时间
		/// </summary>
		public DateTime SubmitTime { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		public uint IsEnable { get; set; }
		/// <summary>
		/// 商户行业id
		/// </summary>
		public long ShopIndustryId { get; set; }
		/// <summary>
		/// 商户认证状态
		/// </summary>
		public int AuthenticationState { get; set; }
		/// <summary>
		/// 商户备注
		/// </summary>
		public string Remarks { get; set; }
		/// <summary>
		/// 商户更新时间
		/// </summary>
		public DateTime UpdateTime { get; set; }
		/// <summary>
		/// 经度
		/// </summary>
		public decimal Longitude { get; set; }
		/// <summary>
		/// 纬度
		/// </summary>
		public decimal Latitude { get; set; }
		/// <summary>
		/// 供应商id
		/// </summary>
		public long VendorId { get; set; }
		/// <summary>
		/// 供应商名称
		/// </summary>
		public string VendorName { get; set; }
		/// <summary>
		/// 编辑类型
		/// </summary>
		public int EditionType { get; set; }
		/// <summary>
		/// 版本
		/// </summary>
		public byte[] RowVersion { get; set; }
		/// <summary>
		/// 更新商铺名称时间
		/// </summary>
		public DateTime UpdateNameTime { get;set; }
	}
}