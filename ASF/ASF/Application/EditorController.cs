using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Application.DTO.Editor;
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
    /// 富文本控制器
    /// </summary>
    [Route("[controller]/[action]")]
    public class EditorController: ControllerBase
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IMapper _mapper;
        /// <summary>
        /// 字典控制器
        /// </summary>
        public EditorController(IServiceProvider serviceProvider, IMapper mapper)
        {
            _serviceProvider = serviceProvider;
            _mapper = mapper;
        }
        /// <summary>
        /// 获取富文本分页列表
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        public async Task<ResultPagedList<EditorResponseDto>> GetList(
	        [FromQuery] EditorListRequestDto dto)
        {
	        var (data,total) = await _serviceProvider.GetRequiredService<EditorService>().GetList(dto.PageNo, dto.PageSize,
		        dto.Name, dto.Type);
	        List<EditorResponseDto> list = _mapper.Map<List<EditorResponseDto>>(data);
	        return ResultPagedList<EditorResponseDto>.ReSuccess(list,total);
        }
        /// <summary>
        /// 获取联系方式分页
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        public async Task<ResultPagedList<ConcatResponseDto>> GetList(
            [FromQuery] PaginationRequestDto dto)
        {
	        return await _serviceProvider.GetRequiredService<EditorService>().GetConcatList(dto.PageNo,dto.PageSize);
        }
        /// <summary>
        /// 获取富文本列表
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        public async Task<ResultList<EditorTitleListResponseDto>> GetLists()
        {
	        return  await _serviceProvider.GetRequiredService<EditorService>().GetLists();
        } 
        /// <summary>
				/// 修改富文本内容
				/// </summary>
				/// <param name="dto"></param>
				/// <returns></returns>
				[HttpPut]
        [Authorize]
				public async Task<Result> Modify([FromBody] ModifyEditorRequestDto dto)
				{
					return await _serviceProvider.GetRequiredService<EditorService>().Modify(dto);
				}

				/// <summary>
				/// 提交咨询内容
				/// </summary>
				/// <param name="dto"></param>
				/// <returns></returns>
				[HttpGet]
				public async Task<Result> Concat([FromQuery] AddConcatRequestDto dto)
				{
					Concat concat = _mapper.Map<Concat>(dto);
					return await _serviceProvider.GetRequiredService<EditorService>().Concat(concat);
				}
				/// <summary>
				/// 根据type获取banner
				/// </summary>
				/// <param name="id"></param>
				/// <returns></returns>
				[HttpGet]
				public async Task<Result<EditorResponseDto>> GetEditor([FromQuery] long id)
				{
					return await _serviceProvider.GetRequiredService<EditorService>().GetEditor(id);
				}
    }
}