using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Application.DTO.Role;
using ASF.Domain;
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
	/// 角色控制器
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class RoleController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 角色控制器
		/// </summary>
		/// <param name="serviceProvider"></param>
		/// <param name="mapper"></param>
		public RoleController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取角色分页信息
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<RoleResponseDto>> GetList([FromQuery] RoleListRequestDto dto)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<RoleService>().GetList(dto.PageNo,dto.PageSize,dto.Name,dto.Enable,tenancyId);
			if (!data.Success)
				return ResultPagedList<RoleResponseDto>.ReFailure(data.Message, data.Status);
			return ResultPagedList<RoleResponseDto>.ReSuccess(_mapper.Map<List<RoleResponseDto>>(data.Data),
				data.TotalCount);
		}
		/// <summary>
		/// 获取角色详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<RoleResponseDto>> Details([FromQuery] long id)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<RoleService>().Get(id, tenancyId);
			if (!data.Success)
				return Result<RoleResponseDto>.ReFailure(data.Message, data.Status);
			return Result<RoleResponseDto>.ReSuccess(_mapper.Map<RoleResponseDto>(data.Data));
		}
		/// <summary>
		/// 获取角色列表
		/// </summary>
		/// <returns></returns>
		public async Task<ResultList<RoleResponseDto>> GetLists()
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<RoleService>().GetList(tenancyId);
			if(!data.Success)
				return ResultList<RoleResponseDto>.ReFailure(data.Message,data.Status);
			return ResultList<RoleResponseDto>.ReSuccess(_mapper.Map<List<RoleResponseDto>>(data.Data));
		}
		/// <summary>
		/// 创建角色 并分配角色
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Create([FromBody] RoleCreateRequestDto dto)
		{
			// 只有超级管理员才能选择租户创建
			long? tenancyId = HttpContext.User.IsSuperRole() ? dto.TenancyId : Convert.ToInt64(HttpContext.User.TenancyId());
			Role role = _mapper.Map<Role>(dto);
			role.TenancyId = tenancyId;
			role.CreateId = Convert.ToInt64(HttpContext.User.UserId());
			if (dto.PermissionId!= null && dto.PermissionId.Count > 0)
			{
				dto.PermissionId.ForEach(item =>
				{
					role.PermissionRole.Add(new PermissionRole()
					{
						PermissionId = item,
						RoleId = role.Id
					});
				});
			}
			return await _serviceProvider.GetRequiredService<RoleService>().Create(role);
		}
		/// <summary>
		/// 修改角色
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> Modify([FromBody] RoleModifyRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<RoleService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			// 除总超级管理员之外其他不允许操作其他租户信息
			if (tenancyId != null && result.Data.TenancyId != tenancyId)
				return Result.ReFailure(ResultCodes.TenancyMatchExist);
			
			result.Data.CreateId = Convert.ToInt64(HttpContext.User.UserId());
			if (dto.PermissionId != null && dto.PermissionId.Count > 0)
			{
				result.Data.PermissionRole.Clear();
				foreach (long value in dto.PermissionId.ToList())
				{
					if (result.Data.PermissionRole.Count(f => f.PermissionId == value) == 0)
					{
						result.Data.PermissionRole.Add(new PermissionRole()
						{
							PermissionId = value,
							RoleId = dto.Id
						});
					}
				}
			}
			return await server.Modify(_mapper.Map(dto,result.Data));
		}
		/// <summary>
		/// 修改角色状态
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> ModifyStatus([FromBody] ModifyStatusRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<RoleService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			// 除总超级管理员之外其他不允许操作其他租户信息
			if (tenancyId != null && result.Data.TenancyId != tenancyId)
				return Result.ReFailure(ResultCodes.TenancyMatchExist);
			result.Data.Enable = dto.Status;
			return await _serviceProvider.GetRequiredService<RoleService>().Modify(result.Data);
		}
		/// <summary>
		/// 分配角色权限
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> AssignPermission([FromBody] AssignIdArrayRequestDto<long> dto)
		{
			var server = _serviceProvider.GetRequiredService<RoleService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			// 除总超级管理员之外其他不允许操作其他租户信息
			if (tenancyId != null && result.Data.TenancyId != tenancyId)
				return Result.ReFailure(ResultCodes.TenancyMatchExist);
			if (dto.Ids == null || dto.Ids.Count == 0)
				return Result.ReFailure(ResultCodes.PermissionIdNotExist);
			result.Data.CreateId = Convert.ToInt64(HttpContext.User.UserId());
			
			result.Data.PermissionRole.Clear();
			foreach (long value in dto.Ids.ToList())
			{
				if (result.Data.PermissionRole.Count(f => f.PermissionId == value) == 0)
				{
					result.Data.PermissionRole.Add(new PermissionRole()
					{
						PermissionId = value,
						RoleId = dto.Id
					});
				}	
			}
			return await _serviceProvider.GetRequiredService<RoleService>().Modify(result.Data);
		}
	}
}