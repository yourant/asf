using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Translate;
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
		/// <summary>
		/// 获取多语言列表
		/// </summary>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultList<TranslateResponseDto>> GetLists()
		{
			var data = await _serviceProvider.GetRequiredService<TranslateService>().GetList();
			if(!data.Success)
				return ResultList<TranslateResponseDto>.ReFailure(data.Message,data.Status);
			return ResultList<TranslateResponseDto>.ReSuccess(_mapper.Map<List<TranslateResponseDto>>(data.Data));
		}
	}
}