using System;
using System.Collections.Generic;
using System.Linq;
using ASF.Domain.Values;

namespace ASF.Application.DTO.Center
{
	/// <summary>
	/// 中心端商户响应
	/// </summary>
	public class CenterShopResponseDto
	{
		/// <summary>
		/// 表格需要的键
		/// </summary>
		public long Key {
			get
			{
				return ShopId;
			}
		}
		/// <summary>
		/// 商户id
		/// </summary>
		public int ShopId { get; set; }
		/// <summary>
		/// 商户key
		/// </summary>
		public string ShopKey { get; set; }
		/// <summary>
		/// 商户类型
		/// </summary>
		public string ShopTypeStr { get; set; }

		/// <summary>
		/// 供应链id
		/// </summary>
		public long? ChainId { get; set; }
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
		/// 商户负责人
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
		public int? RegionId { get; set; }
		/// <summary>
		/// 商户区域路径
		/// </summary>
		public string RegionPath { get; set; }
		/// <summary>
		/// 商户证书状态
		/// </summary>
		public byte? CertState { get; set; }
		/// <summary>
		/// 商户创建时间
		/// </summary>
		public DateTime SubmitTime { get; set; }
		/// <summary>
		/// 是否启用
		/// </summary>
		public bool IsEnable { get; set; }
		/// <summary>
		/// 商户行业id
		/// </summary>
		public int? ShopIndustryId { get; set; }
		/// <summary>
		/// 商户认证状态
		/// </summary>
		public int? AuthenticationState { get; set; }
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
		public decimal? Longitude { get; set; }
		/// <summary>
		/// 纬度
		/// </summary>
		public decimal? Latitude { get; set; }
		/// <summary>
		/// 供应商id
		/// </summary>
		public int? VendorId { get; set; }
		/// <summary>
		/// 供应商名称
		/// </summary>
		public string VendorName { get; set; }
		/// <summary>
		/// 版本类型
		/// </summary>
		public string EditionTypeStr { get; set; }

		/// <summary>
		/// 更新商铺名称时间
		/// </summary>
		public DateTime? UpdateNameTime { get;set; }
	}
}