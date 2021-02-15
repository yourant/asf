using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Audio;
using ASF.Application.DTO.Translate;
using ASF.Domain.Services;
using ASF.Domain.Values;
using ASF.Internal.Results;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
	/// <summary>
	/// 审计控制器
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class AudioController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 审计控制器
		/// </summary>
		public AudioController(IServiceProvider serviceProvider,IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取错误日志列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<AudioResponseDto>> GetErrorList([FromBody] AudioListRequestDto dto)
		{
			var data = await _serviceProvider.GetRequiredService<LoggerService>().GetList(dto.PageNo,dto.PageSize,(uint)LoggingType.Error,dto.AccountName);
			if (!data.Success)
				return ResultPagedList<AudioResponseDto>.ReFailure(data.Message, data.Status);
			return ResultPagedList<AudioResponseDto>.ReSuccess(_mapper.Map<List<AudioResponseDto>>(data.Data),
				data.TotalCount);
		}
		/// <summary>
		/// 删除错误日志
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpPost("{id}")]
		public async Task<Result> DeleteError([FromRoute] long id)
		{
			var server = _serviceProvider.GetRequiredService<LoggerService>();
			var result = await server.Get(id);
			if (!result.Success)
				return Result.ReFailure(result.Message, result.Status);
			return await server.Delete(result.Data);
		}

		/// <summary>
		/// 获取操作日志列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<AudioResponseDto>> GetLogList([FromBody] AudioListRequestDto dto)
		{
			var data = await _serviceProvider.GetRequiredService<LoggerService>().GetList(dto.PageNo,dto.PageSize,(uint)LoggingType.Operate,dto.AccountName);
			if (!data.Success)
				return ResultPagedList<AudioResponseDto>.ReFailure(data.Message, data.Status);
			return ResultPagedList<AudioResponseDto>.ReSuccess(_mapper.Map<List<AudioResponseDto>>(data.Data),
				data.TotalCount);
		}
		/// <summary>
		/// 删除操作日志
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpPost("{id}")]
		public async Task<Result> DeleteLog([FromRoute] long id)
		{
			var server = _serviceProvider.GetRequiredService<LoggerService>();
			var result = await server.Get(id);
			if (!result.Success)
				return Result.ReFailure(result.Message, result.Status);
			return await server.Delete(result.Data);
		}
	}
}