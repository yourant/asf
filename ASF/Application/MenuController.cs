using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO;
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
	/// 权限菜单控制器
	/// </summary>
	[Authorize(Roles="superadmin")]
	[Route("[controller]/[action]")]
	public class MenuController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;

		public MenuController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取权限菜单分页列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<PermissionMenuResponseDto>> GetList(
			[FromQuery] PermissionMenuListRequestDto dto)
		{
			var result = await _serviceProvider.GetRequiredService<MenuService>()
				.GetList(dto.PageNo, dto.PageSize, dto.PermissionId, dto.Title, dto.MenuUrl);
			if(!result.Success)
				return ResultPagedList<PermissionMenuResponseDto>.ReFailure(result.Message,result.Status);
			return ResultPagedList<PermissionMenuResponseDto>.ReSuccess(_mapper.Map<List<PermissionMenuResponseDto>>(result.Data),result.TotalCount);
		}
		/// <summary>
		/// 获取权限菜单详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Result<PermissionMenuResponseDto>> Details([FromQuery] long id)
		{
			var result = await _serviceProvider.GetRequiredService<MenuService>().Get(id);
			if(!result.Success)
				return Result<PermissionMenuResponseDto>.ReFailure(result.Message,result.Status);
			return Result<PermissionMenuResponseDto>.ReSuccess(_mapper.Map<PermissionMenuResponseDto>(result.Data));
		}
		/// <summary>
		/// 创建权限菜单
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Create([FromBody] PermissionMenuCreateRequestDto dto)
		{
			return await _serviceProvider.GetRequiredService<MenuService>().Create(_mapper.Map<PermissionMenu>(dto));
		}
		/// <summary>
		/// 修改权限菜单
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> Modify([FromBody] PermissionMenuModifyRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<MenuService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			return await _serviceProvider.GetRequiredService<MenuService>().Modify(_mapper.Map(dto,result.Data));
		}
		/// <summary>
		/// 修改菜单显示状态
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> ModifyHidden([FromBody] ModifyStatusRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<MenuService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			result.Data.MenuHidden = dto.Status;
			return await _serviceProvider.GetRequiredService<MenuService>().Modify(result.Data);
		}
		/// <summary>
		/// 删除权限菜单
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpPost("{id}")]
		public async Task<Result> Delete([FromRoute]long id)
		{
			var server = _serviceProvider.GetRequiredService<MenuService>();
			var result = await server.Get(id);
			if (!result.Success)
				return result;
			return await server.Delete(result.Data);
		}
	}
}