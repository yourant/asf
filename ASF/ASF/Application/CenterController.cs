using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Center;
using ASF.Domain.Services;
using ASF.Internal.Results;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
	/// <summary>
	/// center 管理
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class CenterController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// center 管理
		/// </summary>
		public CenterController(IServiceProvider serviceProvider,IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取账户列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<CenterAccountResponseDto>> GetAccountList([FromQuery] CenterAccountListRequestDto dto)
		{
			var (list, total) = await _serviceProvider.GetRequiredService<CenterService>().GetAccountList(dto.PageNo,dto.PageSize,dto.Name);
			return ResultPagedList<CenterAccountResponseDto>.ReSuccess(_mapper.Map<List<CenterAccountResponseDto>>(list),total);
		}
		/// <summary>
		/// 获取商户列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<CenterShopResponseDto>> GetShopList([FromQuery] CenterShopListRequestDto dto)
		{
			var (list, total) = await _serviceProvider.GetRequiredService<CenterService>()
				.GetShopList(dto.PageNo, dto.PageSize, dto.Name);
			return ResultPagedList<CenterShopResponseDto>.ReSuccess(_mapper.Map<List<CenterShopResponseDto>>(list),total);
		}
		/// <summary>
		/// 获取应用列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<CenterProgramResponseDto>> GetProgramList(
			[FromQuery] CenterProgramListRequestDto dto)
		{
			var (list, total) = await _serviceProvider.GetRequiredService<CenterService>()
				.GetProgramList(dto.PageNo, dto.PageSize, dto.Name);
			return ResultPagedList<CenterProgramResponseDto>.ReSuccess(_mapper.Map<List<CenterProgramResponseDto>>(list),total);
		}
	}
}