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
	/// 权限服务
	/// </summary>
	public class PermissionService
	{
		// 权限仓储
		private readonly IPermissionsRepository _permissionsRepository;
		/// <summary>
		/// 权限服务
		/// </summary>
		/// <param name="permissionsRepository"></param>
		public PermissionService(IPermissionsRepository permissionsRepository)
		{
			_permissionsRepository = permissionsRepository;
		}
		/// <summary>
		/// 获取权限详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Result<Permission>> Get(long id)
		{
			Permission permission = await _permissionsRepository.GetAsync(id);
			if (permission == null)
				return Result<Permission>.ReFailure(ResultCodes.PermissionNotExist);
			return Result<Permission>.ReSuccess(permission);
		}
		/// <summary>
		/// 通过 id集合获取权限集合
		/// </summary>
		/// <param name="permissionList"></param>
		/// <returns>返回权限集合</returns>
		public async Task<ResultList<Permission>> GetPermissionListAsync(List<long> permissionList)
		{
			List<Permission> list = await _permissionsRepository.GetListAsync(permissionList);
			if (list.Count == 0)
				return ResultList<Permission>.ReFailure(ResultCodes.PermissionNotExist);
			return ResultList<Permission>.ReSuccess(list);
		}
		/// <summary>
		/// 获取权限集合
		/// </summary>
		/// <returns></returns>
		public async Task<ResultList<Permission>> GetList()
		{
			IEnumerable<Permission> list = await _permissionsRepository.GetEntities(f => f.Id != 0);
			if(list == null)
				return ResultList<Permission>.ReFailure(ResultCodes.PermissionNotExist);
			return ResultList<Permission>.ReSuccess(list.ToList());
		}
		/// <summary>
		/// 获取权限分页列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="code"></param>
		/// <param name="name"></param>
		/// <param name="type"></param>
		/// <param name="isSys"></param>
		/// <param name="status"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<Permission>> GetList(int pageNo, int pageSize,string code="",string name = "",uint? type = null,uint? isSys = null,uint? status = null )
		{
			if (!string.IsNullOrEmpty(code))
			{
				var (list, total) =
					await _permissionsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Code.Equals(code));
				return ResultPagedList<Permission>.ReSuccess(list,total);
			}
			
			if (!string.IsNullOrEmpty(name))
			{
				var (list, total) =
					await _permissionsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Name.Equals(code));
				return ResultPagedList<Permission>.ReSuccess(list,total);
			}
			
			if (type != null)
			{
				var (list, total) =
					await _permissionsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Type == type);
				return ResultPagedList<Permission>.ReSuccess(list,total);
			}
			
			if (isSys != null)
			{
				var (list, total) =
					await _permissionsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.IsSystem == isSys);
				return ResultPagedList<Permission>.ReSuccess(list,total);
			}
			if (status != null)
			{
				var (list, total) =
					await _permissionsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Enable == status);
				return ResultPagedList<Permission>.ReSuccess(list,total);
			}
			
			var (data, totalCount) =
				await _permissionsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Id != 0);
			return ResultPagedList<Permission>.ReSuccess(data,totalCount);
		}
		/// <summary>
		/// 添加权限
		/// </summary>
		/// <param name="permission"></param>
		/// <returns></returns>
		public async Task<Result> Create(Permission permission)
		{
			Permission p =
				await _permissionsRepository.GetEntity(f => f.Code.Equals(permission.Code) || f.Name.Equals(permission.Name));
			if (p != null)
				return Result.ReFailure(ResultCodes.PermissionNameOrCodeExist);
			bool isAdd = await _permissionsRepository.Add(permission);
			if (!isAdd)
			{
				return Result.ReFailure(ResultCodes.PermissionCreateError);
			}
			return Result.ReSuccess();
		}
		/// <summary>
		/// 修改权限
		/// </summary>
		/// <param name="permission"></param>
		/// <returns></returns>
		public async Task<Result> Modify(Permission permission)
		{
			if(permission.IsSystem != null && (Status)permission.IsSystem == Status.Yes)
				return Result.ReFailure(ResultCodes.PermissionSystemNotModify);
			bool isUpdate = await _permissionsRepository.Update(permission);
			if (!isUpdate)
			{
				return Result.ReFailure(ResultCodes.PermissionUpdateError);
			}
			return Result.ReSuccess();
		}
		/// <summary>
		/// 删除权限
		/// </summary>
		/// <param name="permission"></param>
		/// <returns></returns>
		public async Task<Result> Delete(Permission permission)
		{
			if (permission.IsSystem != null && (Status)permission.IsSystem == Status.Yes)
				return Result.ReFailure(ResultCodes.PermissionSysDeleteError);
			bool isDelete = await _permissionsRepository.Delete(permission);
			if (!isDelete)
			{
				return Result.ReFailure(ResultCodes.PermissionDeleteError);
			}
			return Result.ReSuccess();
		}
	}
}