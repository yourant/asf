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
	/// 角色领域服务
	/// </summary>
	public class RoleService
	{
		private readonly IRoleRepositories _roleRepositories;
		/// <summary>
		/// 角色领域服务
		/// </summary>
		public RoleService(IRoleRepositories roleRepositories)
		{
			_roleRepositories = roleRepositories;
		}
		/// <summary>
		/// 获取角色详情
		/// </summary>
		/// <param name="id"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Result<Role>> Get(long id, long? tenancyId = null)
		{
			Role role = await _roleRepositories.GetRoleAsync(id, tenancyId);
			if (role == null)
				return Result<Role>.ReFailure(ResultCodes.RoleNotExist);
			if (role.Enable != null && (EnabledType) role.Enable == EnabledType.Disabled)
				return Result<Role>.ReFailure(ResultCodes.RoleUnavailable.ToFormat(role.Name));
			return Result<Role>.ReSuccess(role);
		}
		/// <summary>
		/// 获取角色分页列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="name"></param>
		/// <param name="enable"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<Role>> GetList(int pageNo, int pageSize, string name, long? enable = null,
			long? tenancyId = null)
		{
			if (!string.IsNullOrEmpty(name) && enable != null && tenancyId != null)
			{
				var (list, total) = await _roleRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Name.Equals(name) && f.Enable == enable && f.TenancyId == tenancyId);
				return ResultPagedList<Role>.ReSuccess(list,total);
			}
			if (!string.IsNullOrEmpty(name) && enable != null && tenancyId == null)
			{
				var (list, total) = await _roleRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Name.Equals(name) && f.Enable == enable);
				return ResultPagedList<Role>.ReSuccess(list,total);
			}
			if (enable != null && tenancyId != null)
			{
				var (list, total) = await _roleRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Enable == enable && f.TenancyId == tenancyId);
				return ResultPagedList<Role>.ReSuccess(list,total);
			}
			if (!string.IsNullOrEmpty(name) && tenancyId != null)
			{
				var (list, total) = await _roleRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Name.Equals(name) && f.TenancyId == tenancyId);
				return ResultPagedList<Role>.ReSuccess(list,total);
			}
			if (tenancyId != null)
			{
				var (list, total) = await _roleRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.TenancyId == tenancyId);
				return ResultPagedList<Role>.ReSuccess(list,total);
			}
			if (!string.IsNullOrEmpty(name))
			{
				var (list, total) = await _roleRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Name.Equals(name));
				return ResultPagedList<Role>.ReSuccess(list,total);
			}
			if (enable != null)
			{
				var (list, total) = await _roleRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Enable == enable );
				return ResultPagedList<Role>.ReSuccess(list,total);
			}
			
			var (data, totalCount) = await _roleRepositories.GetEntitiesForPaging(pageNo, pageSize,
				f => f.Id != 0);
			return ResultPagedList<Role>.ReSuccess(data,totalCount);
		}
		/// <summary>
		/// 获取角色列表
		/// </summary>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<ResultList<Role>> GetList(long? tenancyId = null)
		{
			if (tenancyId != null)
			{
				IEnumerable<Role> list = await _roleRepositories.GetEntities(f => f.Id != 0 && f.TenancyId == tenancyId);
				return ResultList<Role>.ReSuccess(list.ToList());
			}
			
			IEnumerable<Role> l = await _roleRepositories.GetEntities(f => f.Id != 0);
			return ResultList<Role>.ReSuccess(l.ToList());
		}
		/// <summary>
		/// 创建角色
		/// </summary>
		/// <param name="role"></param>
		/// <returns></returns>
		public async Task<Result> Create(Role role)
		{
			if (await _roleRepositories.GetEntity(f => f.Name.Equals(role.Name)) != null)
				return Result.ReFailure(ResultCodes.RoleNameExist);
			bool isAdd = await _roleRepositories.Add(role);
			if (!isAdd)
				return Result.ReFailure(ResultCodes.RoleCreateFailed);
			return Result.ReSuccess();
		}
		/// <summary>
		/// 修改角色
		/// </summary>
		/// <param name="role"></param>
		/// <returns></returns>
		public async Task<Result> Modify(Role role)
		{
			if (await _roleRepositories.GetEntity(f => f.Id != role.Id && f.Name.Equals(role.Name)) != null)
				return Result.ReFailure(ResultCodes.RoleNameExist);
			bool isUpdate = await _roleRepositories.Update(role);
			if (!isUpdate)
				return Result.ReFailure(ResultCodes.RoleModifyFailed);
			return Result.ReSuccess();
		}
	}
}