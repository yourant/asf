using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Translate;
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
			var data = await _serviceProvider.GetRequiredService<TranslateService>().GetList(dto.PageNo,dto.PageSize,dto.Name);
			if (!data.Success)
				return ResultPagedList<TranslateResponseDto>.ReFailure(data.Message, data.Status);
			return ResultPagedList<TranslateResponseDto>.ReSuccess(_mapper.Map<List<TranslateResponseDto>>(data.Data),
				data.TotalCount);
		}
		// /// <summary>
		// /// 获取多语言列表
		// /// </summary>
		// /// <returns></returns>
		// [HttpGet]
		// public async Task<ResultList<TranslateResponseDto>> GetLists()
		// {
		// 	var data = await _serviceProvider.GetRequiredService<TranslateService>().GetList();
		// 	if(!data.Success)
		// 		return ResultList<TranslateResponseDto>.ReFailure(data.Message,data.Status);
		// 	return ResultList<TranslateResponseDto>.ReSuccess(_mapper.Map<List<TranslateResponseDto>>(data.Data));
		// }
		
		/// <summary>
		/// 获取多语言详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<TranslateResponseDto>> Details([FromQuery] long id)
		{
			var data = await _serviceProvider.GetRequiredService<TranslateService>().Get(id);
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
			return await _serviceProvider.GetRequiredService<TranslateService>().Create(_mapper.Map<Translate>(dto));
		}
		/// <summary>
		/// 修改多语言
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> Modify([FromBody] TranslateModifyRequestDto dto)
		{
			return await _serviceProvider.GetRequiredService<TranslateService>().Modify(_mapper.Map<Translate>(dto));
		}
		/// <summary>
		/// 删除多语言
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpPost("{id}")]
		public async Task<Result> Delete([FromRoute] long id)
		{
			var service =  _serviceProvider.GetRequiredService<TranslateService>();
			var result = await service.Get(id);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			return await service.Delete(result.Data);
		}
	}
}