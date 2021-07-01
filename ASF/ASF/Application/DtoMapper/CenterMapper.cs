using System.Linq;
using ASF.Application.DTO.Center;
using ASF.Domain.Entities.Center;
using ASF.Domain.Values;
using ASF.Internal.Utils;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;

namespace ASF.Application.DtoMapper
{
	/// <summary>
	/// 中心端对象映射
	/// </summary>
	public class CenterMapper: Profile
	{
		/// <summary>
		/// 中心端对象映射
		/// </summary>
		public CenterMapper()
		{
			//账户响应
			this.CreateMap<CenterAccount, CenterAccountResponseDto>()
				.ForMember(f => f.ShopTypeStr,s=>s.MapFrom(o=>string.Join(",",((ShopType)o.AllowShopType).SplitFlags().Select(a=>a.ToString()))));
			this.CreateMap<CenterShop, CenterShopResponseDto>()
				.ForMember(f => f.ShopTypeStr,s=>s.MapFrom(o=>string.Join(",",((ShopType)o.ShopType).SplitFlags().Select(a=>a.ToString()))))
				.ForMember(f=>f.EditionTypeStr,s=>s.MapFrom(o=> string.Join(",", ((EditionType)o.EditionType).SplitFlags().Select(a => a.ToString()))));
			this.CreateMap<CenterProgram, CenterProgramResponseDto>()
				.ForMember(f => f.ProgramTypeStr, s => s.MapFrom(o => string.Join(",",((ProgramType) o.Type).SplitFlags().Select(a =>a.ToString()))))
				.ForMember(f => f.ProgramModeTypeStr, s => s.MapFrom(o => string.Join(",", ((ProgramModeType) o.Mode).SplitFlags().Select(a =>a.ToString()))))
				.ForMember(f => f.ProgramWayTypeStr, s => s.MapFrom(o => string.Join(",",((ProgramWayType) o.Way).SplitFlags().Select(a =>a.ToString()))));
		}
	}
}