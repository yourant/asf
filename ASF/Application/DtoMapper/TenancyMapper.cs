using ASF.Application.DTO.Tenancy;
using ASF.Domain.Entities;
using AutoMapper;

namespace ASF.Application.DtoMapper
{
	/// <summary>
	/// 租户映射
	/// </summary>
	public class TenancyMapper: Profile
	{
		/// <summary>
		/// 租户映射
		/// </summary>
		public TenancyMapper()
		{
			//创建
			this.CreateMap<TenancyCreateRequestDto, Tenancy>();
			//修改
			this.CreateMap<TenancyModifyRequestDto, Tenancy>();
			//响应
			this.CreateMap<Tenancy, TenancyResponseDto>();
		}
	}
}