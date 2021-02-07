using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Department;
using ASF.Application.DTO.Tenancy;
using ASF.Domain.Services;
using ASF.Internal.Results;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
	/// <summary>
	/// 租户控制器
	/// </summary>
	[Authorize(Roles = "superadmin")]
	[Route("[controller]/[action]")]
	public class TenancyController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 租户控制器
		/// </summary>
		public TenancyController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取租户分页列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<TenancyResponseDto>> GetList([FromQuery] TenancyListRequestDto dto)
		{
			var data = await _serviceProvider.GetRequiredService<TenancyService>().GetList(dto.PageNo,dto.PageSize,dto.Name,dto.Status);
			if (!data.Success)
				return ResultPagedList<TenancyResponseDto>.ReFailure(data.Message, data.Status);
			return ResultPagedList<TenancyResponseDto>.ReSuccess(_mapper.Map<List<TenancyResponseDto>>(data.Data),
				data.TotalCount);
		}
	}
}