using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Application.DTO.Tenancy;
using ASF.Domain.Entities;
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
		/// <summary>
		/// 获取租户详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<TenancyResponseDto>> Details([FromQuery] long id)
		{
			var data = await _serviceProvider.GetRequiredService<TenancyService>().Get(id);
			if(!data.Success)
				return Result<TenancyResponseDto>.ReFailure(data.Message,data.Status);
			return Result<TenancyResponseDto>.ReSuccess(_mapper.Map<TenancyResponseDto>(data.Data));
		}
		/// <summary>
		/// 创建租户
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Create([FromBody] TenancyCreateRequestDto dto)
		{
			Tenancy tenancy = _mapper.Map<Tenancy>(dto);
			tenancy.CreateId = this.User.UserId();
			return await _serviceProvider.GetRequiredService<TenancyService>().Create(tenancy);
		}
		/// <summary>
		/// 修改租户
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> Modify([FromBody] TenancyModifyRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<TenancyService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			result.Data.CreateId = this.User.UserId();
			return await _serviceProvider.GetRequiredService<TenancyService>().Modify(_mapper.Map(dto,result.Data));
		}
		/// <summary>
		/// 软删除租户
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Delete([FromBody] ModifyStatusRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<TenancyService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			result.Data.IsDeleted = dto.Status;
			return await _serviceProvider.GetRequiredService<TenancyService>().Modify(result.Data);
		}
	}
}