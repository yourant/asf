using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Application.DTO.Tenancy;
using ASF.Domain;
using ASF.Domain.Entities;
using ASF.Domain.Services;
using ASF.Internal.Results;
using ASF.Internal.Utils;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
	/// <summary>
	/// 租户控制器
	/// </summary>
	[Authorize]
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
			if(!HttpContext.User.IsSuperRole())
				return ResultPagedList<TenancyResponseDto>.ReFailure(ResultCodes.RoleNotSuperFailed);
			var (list,total) = await _serviceProvider.GetRequiredService<TenancyService>().GetList(dto.PageNo,dto.PageSize,dto.Name,dto.Status);
			return ResultPagedList<TenancyResponseDto>.ReSuccess(_mapper.Map<List<TenancyResponseDto>>(list),
				total);
		}
		/// <summary>
		/// 获取租户列表集合
		/// </summary>
		/// <returns></returns>
		[HttpGet]
		[AllowAnonymous]
		public async Task<ResultList<TenancyResponseDto>> GetLists()
		{
			var data = await _serviceProvider.GetRequiredService<TenancyService>().GetList();
			if (!data.Success)
				return ResultList<TenancyResponseDto>.ReFailure(data.Message, data.Status);
			return ResultList<TenancyResponseDto>.ReSuccess(_mapper.Map<List<TenancyResponseDto>>(data.Data));
		}
		/// <summary>
		/// 获取租户详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<TenancyResponseDto>> Details([FromQuery] long id)
		{
			if(!HttpContext.User.IsSuperRole())
				return Result<TenancyResponseDto>.ReFailure(ResultCodes.RoleNotSuperFailed);
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
			if(!HttpContext.User.IsSuperRole())
				return Result.ReFailure(ResultCodes.RoleNotSuperFailed);
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
			if(!HttpContext.User.IsSuperRole())
				return Result.ReFailure(ResultCodes.RoleNotSuperFailed);
			var server = _serviceProvider.GetRequiredService<TenancyService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			result.Data.CreateId = this.User.UserId();
			return await server.Modify(_mapper.Map(dto,result.Data));
		}
		/// <summary>
		/// 软删除租户
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Delete([FromBody] ModifyStatusRequestDto dto)
		{
			if(!HttpContext.User.IsSuperRole())
				return Result.ReFailure(ResultCodes.RoleNotSuperFailed);
			var server = _serviceProvider.GetRequiredService<TenancyService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			result.Data.IsDeleted = dto.Status;
			return await server.Modify(result.Data);
		}
	}
}