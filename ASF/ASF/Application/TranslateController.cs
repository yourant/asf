using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Translate;
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
	/// 多语言控制器
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class TranslateController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 多语言控制器
		/// </summary>
		public TranslateController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取多语言分页
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<TranslateResponseDto>> GetList([FromQuery] TranslateListRequestDto dto)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var (list,total) = await _serviceProvider.GetRequiredService<TranslateService>().GetList(dto.PageNo,dto.PageSize,dto.Name,tenancyId);
			return ResultPagedList<TranslateResponseDto>.ReSuccess(_mapper.Map<List<TranslateResponseDto>>(list),
				total);
		}
		/// <summary>
		/// 获取多语言列表
		/// </summary>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultList<TranslateResponseDto>> GetLists()
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<TranslateService>().GetList(tenancyId);
			if(!data.Success)
				return ResultList<TranslateResponseDto>.ReFailure(data.Message,data.Status);
			return ResultList<TranslateResponseDto>.ReSuccess(_mapper.Map<List<TranslateResponseDto>>(data.Data));
		}
		
		/// <summary>
		/// 获取多语言详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<TranslateResponseDto>> Details([FromQuery] long id)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<TranslateService>().Get(id,tenancyId);
			if (!data.Success)
				return Result<TranslateResponseDto>.ReFailure(data.Message, data.Status);
			return Result<TranslateResponseDto>.ReSuccess(_mapper.Map<TranslateResponseDto>(data.Data));
		}

		/// <summary>
		/// 创建多语言
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Create([FromBody] TranslateCreateRequestDto dto)
		{
			// 只有超级管理员才能选择租户创建
			long? tenancyId = HttpContext.User.IsSuperRole() ? dto.TenancyId : Convert.ToInt64(HttpContext.User.TenancyId());
			Translate translate = _mapper.Map<Translate>(dto);
			translate.TenancyId = tenancyId;
			return await _serviceProvider.GetRequiredService<TranslateService>().Create(translate);
		}
		/// <summary>
		/// 修改多语言
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> Modify([FromBody] TranslateModifyRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<TranslateService>();
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var result = await server.Get(dto.Id,tenancyId);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			// 除总超级管理员之外其他不允许操作其他租户信息
			if (tenancyId != null && result.Data.TenancyId != tenancyId)
				return Result.ReFailure(ResultCodes.TenancyMatchExist);
			return await _serviceProvider.GetRequiredService<TranslateService>().Modify(_mapper.Map(dto,result.Data));
		}
		/// <summary>
		/// 删除多语言
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpPost("{id}")]
		public async Task<Result> Delete([FromRoute] long id)
		{
			var server = _serviceProvider.GetRequiredService<TranslateService>();
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var result = await server.Get(id,tenancyId);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			// 除总超级管理员之外其他不允许操作其他租户信息
			if (tenancyId != null && result.Data.TenancyId != tenancyId)
				return Result.ReFailure(ResultCodes.TenancyMatchExist);
			return await server.Delete(result.Data);
		}
	}
}