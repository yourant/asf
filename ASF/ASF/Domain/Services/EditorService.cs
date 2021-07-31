using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO.Editor;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 富文本编辑服务
	/// </summary>
	public class EditorService
	{
		private readonly IEditorRepository _editorRepository;
		private readonly IConcatRepositories _concatRepositories;
		/// <summary>
		/// 富文本编辑服务
		/// </summary>
		/// <param name="editorRepository"></param>
		/// <param name="concatRepositories"></param>
		public EditorService(IEditorRepository editorRepository, IConcatRepositories concatRepositories)
		{
			_editorRepository = editorRepository;
			_concatRepositories = concatRepositories;
		}
		/// <summary>
		/// 获取富文本内容
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Editor> GetEditor(long id)
		{
			Editor editor = await _editorRepository.GetEntity(f => f.Id == id);
			if (editor == null)
				throw new Exception("没有这个富文本");
			return editor;
		}
		
		/// <summary>
		/// 根据type 类型获取富文本banner
		/// </summary>
		/// <param name="type"></param>
		/// <returns></returns>
		public async Task<Result<string>> GetBanner(uint type)
		{
			Editor editor = await _editorRepository.GetEntity(f => f.Type == type);
			if (editor == null)
				return Result<string>.ReFailure("没有这个轮播", 2003);
			return Result<string>.ReSuccess(editor.Banner ?? "");
		}

		/// <summary>
		/// 获取富文本列表
		/// </summary>
		/// <returns></returns>
		public async Task<List<Editor>> GetLists()
		{
			IEnumerable<Editor> list = await _editorRepository.GetEntities(f => f.Id != 0);
			if (list == null)
				return new List<Editor>();
			return list.ToList();
		}
		/// <summary>
		/// 修改富文本内容
		/// </summary>
		/// <param name="editor"></param>
		/// <returns></returns>
		public async Task<Result> Modify(Editor editor)
		{
			bool isModify = await _editorRepository.Update(editor);
			if(!isModify)
				return Result.ReFailure("修改富文本内容失败",2001);
			return Result.ReSuccess();
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