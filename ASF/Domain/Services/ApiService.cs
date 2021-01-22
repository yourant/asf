using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Domain.Values;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 权限功能
	/// </summary>
	public class ApiService
	{
		private readonly IApiRepository _apiRepository;

		public ApiService(IApiRepository apiRepository)
		{
			_apiRepository = apiRepository;
		}
		/// <summary>
		/// 获取权限api
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Result<Api>> Get(long id)
		{
			Api api = await _apiRepository.GetApiAsync(id);
			if (api == null)
				return Result<Api>.ReFailure(ResultCodes.PermissionApiNotExist);
			return Result<Api>.ReSuccess(api);
		}
		/// <summary>
		/// 获取权限api集合
		/// </summary>
		/// <returns></returns>
		public async Task<ResultList<Api>> GetList(List<long> ids)
		{
			if (!ids.Any())
			{
				IEnumerable<Api> list = await _apiRepository.GetEntities(f => f.Id != 0);
				if(list == null)
					return ResultList<Api>.ReFailure(ResultCodes.PermissionApiNotExist);
				return ResultList<Api>.ReSuccess(list.ToList());
			}
			else
			{
				IEnumerable<Api> list = await _apiRepository.GetEntities(f => (f.IsSystem != null && (Status)f.IsSystem != Status.Yes) && ids.Any(x=> x == f.Id));
				if(list == null)
					return ResultList<Api>.ReFailure(ResultCodes.PermissionApiNotExist);
				return ResultList<Api>.ReSuccess(list.ToList());
			}
		}
		/// <summary>
		/// api 分页
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="permissionId"></param>
		/// <param name="type"></param>
		/// <param name="status"></param>
		/// <param name="name"></param>
		/// <param name="httpMethod"></param>
		/// <param name="path"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<Api>> GetList(int pageNo, int pageSize, long? permissionId = null,
			uint? type = null, uint? status = null, string name = "", string httpMethod = "",string path = "")
		{ 
			// 搜索对应类型的权限api
			if (permissionId != null && type != null)
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId && f.Type == type);
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			// 搜索对应状态的权限api
			if (permissionId != null && status != null)
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId && f.Status == status);
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			// 搜索对应api名权限api
			if (permissionId != null && !string.IsNullOrEmpty(name))
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId && f.Name.Equals(name));
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			// 搜索对应请求权限api
			if (permissionId != null && !string.IsNullOrEmpty(httpMethod))
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId && f.HttpMethods.Contains(name));
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			// 搜索对应路径地址权限api
			if (permissionId != null && !string.IsNullOrEmpty(path))
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId && f.Path.Equals(path));
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			
			// 搜索对权限api
			if (permissionId != null)
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId);
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			
			// 搜索类型
			if (type != null)
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Type == type);
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			// 搜索状态
			if (status != null)
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f =>f.Status == status);
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			// 搜索api名称
			if (!string.IsNullOrEmpty(name))
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f =>f.Name.Equals(name));
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			// 搜索请求方法
			if (!string.IsNullOrEmpty(httpMethod))
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.HttpMethods.Contains(name));
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			//搜索请求路径
			if (!string.IsNullOrEmpty(path))
			{
				var (list, count) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId && f.Path.Equals(path));
				return ResultPagedList<Api>.ReSuccess(list, count);
			}
			
			var (data, apiCount) = await _apiRepository.GetEntitiesForPaging(pageNo, pageSize,
				f => f.Id != 0);
			return ResultPagedList<Api>.ReSuccess(data, apiCount);
		}
		/// <summary>
		/// 添加功能api
		/// </summary>
		/// <param name="api"></param>
		/// <returns></returns>
		public async Task<Result> Create(Api api)
		{
			Api a = await _apiRepository.GetEntity(f => f.Path.Equals(api.Path));
			// 判断是否有路径相同
			if (a != null)
				return Result.ReFailure(ResultCodes.PermissionApiPathExist);
			
			var isAdd = await _apiRepository.Add(api);
			if (!isAdd)
			{
				return Result.ReFailure(ResultCodes.PermissionApiCreateError);
			}
			
			return Result.ReSuccess();
		}
		/// <summary>
		/// 修改api
		/// </summary>
		/// <param name="api"></param>
		/// <returns></returns>
		public async Task<Result> Modify(Api api)
		{
			if (api.IsSystem != null && (Status) api.IsSystem == Status.Yes)
				return Result.ReFailure(ResultCodes.PermissionSysApiUpdateError);
			bool isUpdate = await _apiRepository.Update(api);
			if (!isUpdate)
			{
				return Result.ReFailure(ResultCodes.PermissionApiUpdateError);
			}
			return Result.ReSuccess();
		}
		
		/// <summary>
		/// 删除api
		/// </summary>
		/// <param name="api"></param>
		/// <returns></returns>
		public async Task<Result> Delete(Api api)
		{
			if (api.IsSystem != null && (Status) api.IsSystem == Status.Yes)
				return Result.ReFailure(ResultCodes.PermissionSysApiDeleteError);
			bool isdDelete = await _apiRepository.Delete(api);
			if (!isdDelete)
				return Result.ReFailure(ResultCodes.PermissionSysApiDeleteError);
			return Result.ReSuccess();
		}
		/// <summary>
		/// 批量删除授权api
		/// </summary>
		/// <param name="list"></param>
		/// <returns></returns>
		public async Task<Result> BatchDelete(List<Api> list)
		{
			bool isdDelete = await _apiRepository.BatchDeleteAsync(list);
			if (!isdDelete)
				return Result.ReFailure(ResultCodes.PermissionSysApiDeleteError);
			return Result.ReSuccess();
		}
	}
}