using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Domain.Entities;
using ASF.Domain.Services;
using ASF.Internal.Results;
using ASF.Internal.Security;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
	/// <summary>
	/// 权限控制器 只有超级管理员才能有权限控制
	/// </summary>
	[Authorize(Roles = "superadmin")]
	[Route("[controller]/[action]")]
	public class PermissionController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		public PermissionController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取权限分级分页列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<PermissionResponseDto>> GetList(
			[FromQuery] PermissionListRequestDto dto)
		{
			var result = await _serviceProvider.GetRequiredService<PermissionService>().GetList(dto.PageNo, dto.PageSize, dto.Code,
				dto.Name, dto.Type, dto.IsSys, dto.Status);
			if (!result.Success)
				return ResultPagedList<PermissionResponseDto>.ReFailure(result.Message, result.Status);
			IEnumerable<PermissionResponseDto> list = _mapper.Map<IEnumerable<PermissionResponseDto>>(result.Data);
			return ResultPagedList<PermissionResponseDto>.ReSuccess(TreeSortMultiLevelFormat(list).ToList(),result.TotalCount);
		}
		/// <summary>
		/// 获取权限详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<PermissionResponseDto>> Details([FromQuery] long id)
		{
			var result = await _serviceProvider.GetRequiredService<PermissionService>().Get(id);
			if (!result.Success)
				return Result<PermissionResponseDto>.ReFailure(result.Message, result.Status);
			return Result<PermissionResponseDto>.ReSuccess(_mapper.Map<PermissionResponseDto>(result.Data));
		}
		/// <summary>
		/// 创建权限
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Create([FromBody] PermissionCreateRequestDto dto)
		{
			return await _serviceProvider.GetRequiredService<PermissionService>().Create(_mapper.Map<Permission>(dto));
		}
		/// <summary>
		/// 修改权限
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> Modify([FromBody] PermissionModifyRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<PermissionService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			return await server.Modify(_mapper.Map(dto, result.Data));
		}
		/// <summary>
		/// 删除权限
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpPost("{id}")]
		public async Task<Result> Delete([FromRoute] long id)
		{
			var server = _serviceProvider.GetRequiredService<PermissionService>();
			var result = await server.Get(id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			return await server.Delete(result.Data);
		}

		/// <summary>
		/// 无限分级权限菜单
		/// </summary>
		/// <param name="list"></param>
		/// <param name="pid"></param>
		/// <returns></returns>
		private IEnumerable<PermissionResponseDto> TreeSortMultiLevelFormat(
			IEnumerable<PermissionResponseDto> list, long pid = 0)
		{
			foreach (var item in list.Where(x => x.ParentId == pid))
			{
				yield return new PermissionResponseDto
				{
					Id = item.Id,
					Name = item.Name,
					Code = item.Code,
					ParentId = item.ParentId,
					Type = item.Type,
					IsSystem = item.IsSystem,
					Description = item.Description,
					Sort = item.Sort,
					Enable = item.Enable,
					CreateTime = item.CreateTime,
					Children = TreeSortMultiLevelFormat(list, item.Id)
				};
			}
		}
	}
}