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
	}
}