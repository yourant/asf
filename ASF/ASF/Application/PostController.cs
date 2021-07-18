using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Post;
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
	/// 岗位控制器
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class PostController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 岗位控制器
		/// </summary>
		public PostController(IServiceProvider serviceProvider,IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取岗位分页列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<PostResponseDto>> GetList([FromQuery] PostListRequestDto dto)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var (list,total) = await _serviceProvider.GetRequiredService<PostService>().GetList(dto.PageNo,dto.PageSize,dto.Name,tenancyId);
			return ResultPagedList<PostResponseDto>.ReSuccess(_mapper.Map<List<PostResponseDto>>(list),
				total);
		}
		/// <summary>
		/// 获取岗位列表
		/// </summary>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultList<PostResponseDto>> GetLists()
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<PostService>().GetList(tenancyId);
			if(!data.Success)
				return ResultList<PostResponseDto>.ReFailure(data.Message,data.Status);
			return ResultList<PostResponseDto>.ReSuccess(_mapper.Map<List<PostResponseDto>>(data.Data));
		}
		/// <summary>
		/// 获取岗位详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<PostResponseDto>> Details([FromQuery] long id)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<PostService>().Get(id,tenancyId);
			if (!data.Success)
				return Result<PostResponseDto>.ReFailure(data.Message, data.Status);
			return Result<PostResponseDto>.ReSuccess(_mapper.Map<PostResponseDto>(data.Data));
		}
		/// <summary>
		/// 创建岗位
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> Create([FromBody] PostCreateRequestDto dto)
		{
			// 只有超级管理员才能选择租户创建
			long? tenancyId = HttpContext.User.IsSuperRole() ? dto.TenancyId : Convert.ToInt64(HttpContext.User.TenancyId());
			Post post = _mapper.Map<Post>(dto);
			post.TenancyId = tenancyId;
			return await _serviceProvider.GetRequiredService<PostService>().Create(post);
		}
		/// <summary>
		/// 修改岗位
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> Modify([FromBody] PostModifyRequestDto dto)
		{
			var server = _serviceProvider.GetRequiredService<PostService>();
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var result = await server.Get(dto.Id,tenancyId);
			if(!result.Success)
				return Result.ReFailure(result.Message,result.Status);
			// 除总超级管理员之外其他不允许操作其他租户信息
			if (tenancyId != null && result.Data.TenancyId != tenancyId)
				return Result.ReFailure(ResultCodes.TenancyMatchExist);
			return await _serviceProvider.GetRequiredService<PostService>().Modify(_mapper.Map(dto,result.Data));
		}
		/// <summary>
		/// 删除岗位
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpPost("{id}")]
		public async Task<Result> Delete([FromRoute] long id)
		{
			var server = _serviceProvider.GetRequiredService<PostService>();
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