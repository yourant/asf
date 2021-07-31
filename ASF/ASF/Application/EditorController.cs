using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Application.DTO.AsfDictionary;
using ASF.Application.DTO.Editor;
using ASF.Application.DTO.Translate;
using ASF.Domain;
using ASF.Domain.Entities;
using ASF.Domain.Services;
using ASF.Internal.Results;
using ASF.Internal.Security;
using AutoMapper;
using HtmlAgilityPack;
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
        /// 获取联系方式分页
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        public async Task<ResultPagedList<ConcatResponseDto>> GetList(
            [FromQuery] PaginationRequestDto dto)
        {
	        var data = await _serviceProvider.GetRequiredService<EditorService>().GetConcatList(dto.PageNo,dto.PageSize);
            if (!data.Success)
                return ResultPagedList<ConcatResponseDto>.ReFailure(data.Message, data.Status);
            return ResultPagedList<ConcatResponseDto>.ReSuccess(_mapper.Map<List<ConcatResponseDto>>(data.Data),
                data.TotalCount);
        }
        /// <summary>
        /// 获取富文本列表
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Authorize]
        public async Task<ResultList<EditorTitleListResponseDto>> GetLists()
        {
	        var data = await _serviceProvider.GetRequiredService<EditorService>().GetLists();
	        return ResultList<EditorTitleListResponseDto>.ReSuccess(_mapper.Map<List<EditorTitleListResponseDto>>(data));
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
					var data = await _serviceProvider.GetRequiredService<EditorService>().GetEditor(dto.Id);
					if (!string.IsNullOrEmpty(dto.NewContent))
					{
						data.NewContent = dto.NewContent;
						var result = await _serviceProvider.GetRequiredService<EditorService>().Modify(data);
						if (result.Success)
						{
							var htmlDoc = new HtmlDocument();
							htmlDoc.LoadHtml(dto.NewContent);
		
							TextWriter tw = System.IO.File.CreateText(data.Path);

							htmlDoc.Save(tw);
						}
						return result;
					}else if (dto.Banner != null)
					{
						data.Banner = dto.Banner.WriteFromObject<Banner>();
						return await _serviceProvider.GetRequiredService<EditorService>().Modify(data);
					}
					else
					{
						return Result.ReFailure("内容不能为空", 2004);
					}

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
					Editor editor = await _serviceProvider.GetRequiredService<EditorService>().GetEditor(id);
					return Result<EditorResponseDto>.ReSuccess(_mapper.Map<EditorResponseDto>(editor));
				}
    }
}