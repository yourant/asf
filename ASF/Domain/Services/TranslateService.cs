using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 多语言服务
	/// </summary>
	public class TranslateService
	{
		private readonly ITranslateRepositories _translateRepositories;
		/// <summary>
		/// 多语言服务
		/// </summary>
		/// <param name="translateRepositories"></param>
		public TranslateService(ITranslateRepositories translateRepositories)
		{
			_translateRepositories = translateRepositories;
		}
		/// <summary>
		/// 获取多语言
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Result<Translate>> GetTranslate(long id)
		{
			Translate translate = await _translateRepositories.GetEntity(f => f.Id == id);
			if (translate == null)
				return Result<Translate>.ReFailure(ResultCodes.TranslateNotExist);
			return Result<Translate>.ReSuccess(translate);
		}
		/// <summary>
		/// 获取多语言分页
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="name"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<Translate>> GetTranslateList(int pageNo, int pageSize, string name)
		{
			if (!string.IsNullOrEmpty(name))
			{
				var (list,total) = await _translateRepositories.GetEntitiesForPaging(pageNo, pageSize, f => f.Name.Equals(name));
				return  ResultPagedList<Translate>.ReSuccess(list,total);
			}
			
			var (data,totalCount) = await _translateRepositories.GetEntitiesForPaging(pageNo, pageSize, f => f.Id != 0);
			return ResultPagedList<Translate>.ReSuccess(data,totalCount);
		}
		/// <summary>
		/// 获取多语言列表
		/// </summary>
		/// <returns></returns>
		public async Task<ResultList<Translate>> GetTranslateList()
		{
			IEnumerable<Translate> list = await _translateRepositories.GetEntities(f => f.Id != 0);
			if(list == null)
				return ResultList<Translate>.ReFailure(ResultCodes.TranslateNotExist);
			return ResultList<Translate>.ReSuccess(list.ToList());
		}

		/// <summary>
		/// 添加多语言
		/// </summary>
		/// <param name="translate"></param>
		/// <returns></returns>
		public async Task<Result> AddTranslate(Translate translate)
		{
			Translate data = await _translateRepositories.GetEntity(f => f.Name.Equals(translate.Name));
			if (data != null)
				return Result.ReFailure(ResultCodes.TranslateNameExist);
			bool isAdd = await _translateRepositories.Add(translate);
			if (!isAdd)
			{
				return Result.ReFailure(ResultCodes.TranslateCreateError);
			}

			return Result.ReSuccess();
		}
		/// <summary>
		/// 修改多语言
		/// </summary>
		/// <param name="translate"></param>
		/// <returns></returns>
		public async Task<Result> ModifyTranslate(Translate translate)
		{
			bool isUpdate = await _translateRepositories.Update(translate);
			if (!isUpdate)
			{
				return Result.ReFailure(ResultCodes.TranslateUpdateError);
			}
			
			return Result.ReSuccess();
		}
		/// <summary>
		/// 硬 删除多语言
		/// </summary>
		/// <param name="translate"></param>
		/// <returns></returns>
		public async Task<Result> DeleteTranslate(Translate translate)
		{
			bool isDelete = await _translateRepositories.Delete(translate);
			if (!isDelete)
			{
				return Result.ReFailure(ResultCodes.TranslateDeleteError);
			}
			
			return Result.ReSuccess();
		}
	}
}