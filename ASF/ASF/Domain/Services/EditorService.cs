using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using ASF.Application.DTO.Editor;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;
using ASF.Internal.Security;
using AutoMapper;
using HtmlAgilityPack;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 富文本编辑服务
	/// </summary>
	public class EditorService
	{
		private readonly IEditorRepository _editorRepository;
		private readonly IConcatRepositories _concatRepositories;
		private readonly IMapper _mapper;
		/// <summary>
		/// 富文本编辑服务
		/// </summary>
		/// <param name="editorRepository"></param>
		/// <param name="concatRepositories"></param>
		public EditorService(IEditorRepository editorRepository, IConcatRepositories concatRepositories,IMapper mapper)
		{
			_editorRepository = editorRepository;
			_concatRepositories = concatRepositories;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取富文本内容
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Result<EditorResponseDto>> GetEditor(long id)
		{
			Editor editor = await _editorRepository.GetEntity(f => f.Id == id);
			if (editor == null)
				return Result<EditorResponseDto>.ReFailure("没有这个富文本",1000);
			return Result<EditorResponseDto>.ReSuccess(_mapper.Map<EditorResponseDto>(editor));
		}

		/// <summary>
		/// 获取富文本标题列表
		/// </summary>
		/// <returns></returns>
		public async Task<ResultList<EditorTitleListResponseDto>> GetLists()
		{
			IEnumerable<Editor> list = await _editorRepository.GetEntities(f => f.Id != 0);
			if (list == null)
				return ResultList<EditorTitleListResponseDto>.ReSuccess(new List<EditorTitleListResponseDto>());
			return ResultList<EditorTitleListResponseDto>.ReSuccess(_mapper.Map<List<EditorTitleListResponseDto>>(list));
		}
		/// <summary>
		/// 修改富文本内容
		/// </summary>
		/// <param name="editor"></param>
		/// <returns></returns>
		public async Task<Result> Modify(ModifyEditorRequestDto dto)
		{
			Editor editor = await _editorRepository.GetEntity(f => f.Id == dto.Id);
			if (editor == null)
				return Result.ReFailure("没有这个富文本内容",1001);
			if (!string.IsNullOrEmpty(dto.NewContent))
			{
				editor.NewContent = dto.NewContent;
				bool isUpdate = await _editorRepository.Update(editor);
				if(!isUpdate)
					return Result.ReFailure("修改内容失败",1002);
				var htmlDoc = new HtmlDocument();
				htmlDoc.LoadHtml(dto.NewContent);
		
				TextWriter tw = System.IO.File.CreateText(editor.Path);
				htmlDoc.Save(tw);
				return Result.ReSuccess();
			}else if (dto.Banner != null)
			{
				editor.Banner = dto.Banner.WriteFromObject<Banner>();
				bool isUpdate = await _editorRepository.Update(editor);
				if(!isUpdate)
					return Result.ReFailure("修改内容失败",1002);
				return Result.ReSuccess();
			}else
			{
				return Result.ReFailure("内容不能为空", 1004);
			}
			// bool isModify = await _editorRepository.Update(editor);
			// if(!isModify)
			// 	return Result.ReFailure("修改富文本内容失败",2001);
			// return Result.ReSuccess();
		}
		/// <summary>
		/// 获取咨询列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<Concat>> GetConcatList(int pageNo, int pageSize)
		{
			var (data,totalCount) = await _concatRepositories.GetEntitiesForPaging(pageNo, pageSize, f => f.Id != 0);
			return ResultPagedList<Concat>.ReSuccess(data,totalCount);
		}
		/// <summary>
		/// 提交咨询内容
		/// </summary>
		/// <param name="concat"></param>
		/// <returns></returns>
		public async Task<Result> Concat(Concat concat)
		{
			bool isAdd = await _concatRepositories.Add(concat);
			if(!isAdd)
				return Result.ReFailure("提交失败", 2004);
			return Result.ReSuccess();
		}
	}
}