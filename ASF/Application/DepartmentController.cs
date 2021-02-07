using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Department;
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
	/// 部门控制器
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class DepartmentController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 部门控制器
		/// </summary>
		public DepartmentController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取部门分页列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<DepartmentResponseDto>> GetList(DepartmentListRequestDto dto)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<DepartmentService>().GetList(dto.PageNo,dto.PageSize,dto.Name,dto.Status,tenancyId);
			if (!data.Success)
				return ResultPagedList<DepartmentResponseDto>.ReFailure(data.Message, data.Status);
			return ResultPagedList<DepartmentResponseDto>.ReSuccess(_mapper.Map<List<DepartmentResponseDto>>(data.Data),
				data.TotalCount);
		}
		/// <summary>
		/// 获取部门列表
		/// </summary>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultList<DepartmentResponseDto>> GetLists()
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<DepartmentService>().GetList(tenancyId);
			if (!data.Success)
				return ResultList<DepartmentResponseDto>.ReFailure(data.Message, data.Status);
			return ResultList<DepartmentResponseDto>.ReSuccess(_mapper.Map<List<DepartmentResponseDto>>(data.Data));
		}
		/// <summary>
		/// 获取部门详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Result<DepartmentResponseDto>> Details([FromQuery] long id)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<DepartmentService>().Get(id,tenancyId);
			if (!data.Success)
				return Result<DepartmentResponseDto>.ReFailure(data.Message, data.Status);
			return Result<DepartmentResponseDto>.ReSuccess(_mapper.Map<DepartmentResponseDto>(data.Data));
		}

		/// <summary>
		/// 创建部门
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Create([FromBody] DepartmentCreateRequestDto dto)
		{
			long? tenancyId = Convert.ToInt64(HttpContext.User.TenancyId());
			var data = _mapper.Map<Department>(dto);
			data.TenancyId = tenancyId;
			return await _serviceProvider.GetRequiredService<DepartmentService>().Create(data);
		}
		/// <summary>
		/// 修改部门
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> Modify([FromBody] DepartmentModifyRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<DepartmentService>();
			var result = await server.Get(dto.Id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			// 除总超级管理员之外其他不允许操作其他租户信息
			if (tenancyId != null && result.Data.TenancyId != tenancyId)
				return Result.ReFailure(ResultCodes.TenancyMatchExist);
			return await _serviceProvider.GetRequiredService<DepartmentService>().Modify(_mapper.Map(dto,result.Data));
		}
	}
}