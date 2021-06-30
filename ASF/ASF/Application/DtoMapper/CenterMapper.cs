using ASF.Application.DTO.Center;
using ASF.Domain.Entities.Center;
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
			this.CreateMap<CenterAccount, CenterAccountResponseDto>();
		}
	}
}