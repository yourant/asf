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
	/// 部门领域服务
	/// </summary>
	public class DepartmentService
	{
		private readonly IDepartmentRepositories _departmentRepositories;

		public DepartmentService(IDepartmentRepositories departmentRepositories)
		{
			_departmentRepositories = departmentRepositories;
		}
		/// <summary>
		/// 获取部门
		/// </summary>
		/// <param name="id"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Result<Department>> Get(long id, long tenancyId)
		{
			Department department = await _departmentRepositories.GetDepartmentAsync(id, tenancyId);
			if (department == null)
				return Result<Department>.ReFailure(ResultCodes.DepartmentNotExist);
			if (department.Enabled != null && (EnabledType) department.Enabled == EnabledType.Disabled)
				return Result<Department>.ReFailure(ResultCodes.DepartmentUnavailable);
			return Result<Department>.ReSuccess(department);
		}
		/// <summary>
		/// 获取 部门分页列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="name"></param>
		/// <param name="status"></param>
		/// <param name="tenancyId">租户id</param>
		/// <returns></returns>
		public async Task<ResultPagedList<Department>> GetList(int pageNo, int pageSize, string name = "",
			uint? status = null, long? tenancyId = null)
		{
			
			if (!string.IsNullOrEmpty(name) && status != null && tenancyId != null)
			{
				var (list, total) =
					await _departmentRepositories.GetEntitiesForPaging(pageNo, pageSize,
						f => f.Name.Equals(name) && f.Enabled == status && f.TenancyId == tenancyId);
				return ResultPagedList<Department>.ReSuccess(list,total);
			}
			
			if (!string.IsNullOrEmpty(name) && tenancyId != null)
			{
				var (list, total) =
					await _departmentRepositories.GetEntitiesForPaging(pageNo, pageSize,
						f => f.Name.Equals(name) && f.TenancyId == tenancyId);
				return ResultPagedList<Department>.ReSuccess(list,total);
			}
			
			if (status != null && tenancyId != null)
			{
				var (list, total) =
					await _departmentRepositories.GetEntitiesForPaging(pageNo, pageSize,
						f => f.Enabled == status && f.TenancyId == tenancyId);
				return ResultPagedList<Department>.ReSuccess(list,total);
			}
			
			if (tenancyId != null)
			{
				var (list, total) =
					await _departmentRepositories.GetEntitiesForPaging(pageNo, pageSize,
						f => f.TenancyId == tenancyId);
				return ResultPagedList<Department>.ReSuccess(list,total);
			}
			
			if (!string.IsNullOrEmpty(name))
			{
				var (list, total) =
					await _departmentRepositories.GetEntitiesForPaging(pageNo, pageSize,
						f => f.Name.Equals(name));
				return ResultPagedList<Department>.ReSuccess(list,total);
			}

			if (status != null)
			{
				var (list, total) =
					await _departmentRepositories.GetEntitiesForPaging(pageNo, pageSize,
						f => f.Enabled == status);
				return ResultPagedList<Department>.ReSuccess(list,total);
			}
			
			var (data, totalCount) =
				await _departmentRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Id != 0);
			return ResultPagedList<Department>.ReSuccess(data,totalCount);
		}
		/// <summary>
		/// 获取部门列表集合
		/// </summary>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<ResultList<Department>> GetList(long? tenancyId = null)
		{
			if (tenancyId != null)
			{
				IEnumerable<Department> list = await _departmentRepositories.GetEntities(f => f.TenancyId == tenancyId);
				if(list == null)
					return ResultList<Department>.ReFailure(ResultCodes.DepartmentNotExist);
				return ResultList<Department>.ReSuccess(list.ToList());
			}
			
			IEnumerable<Department> data = await _departmentRepositories.GetEntities(f => f.Id != 0);
			if(data == null)
				return ResultList<Department>.ReFailure(ResultCodes.DepartmentNotExist);
			return ResultList<Department>.ReSuccess(data.ToList());
		}
		/// <summary>
		/// 添加部门
		/// </summary>
		/// <param name="department"></param>
		/// <returns></returns>
		public async Task<Result> Create(Department department)
		{
			// 判断当前租户添加部门名是否存在
			if (await _departmentRepositories.GetEntity(f =>
				f.TenancyId == department.TenancyId && f.Name.Equals(department.Name)) != null)
				return Result.ReFailure(ResultCodes.DepartmentNameExist);
			
			bool isAdd = await _departmentRepositories.Add(department);
			if (!isAdd)
			{
				return Result.ReFailure(ResultCodes.DepartmentCreateError);
			}
			
			return Result.ReSuccess();
		}
		/// <summary>
		/// 修改部门
		/// </summary>
		/// <param name="department"></param>
		/// <returns></returns>
		public async Task<Result> Modify(Department department)
		{
			bool isUpdate = await _departmentRepositories.Update(department);
			if (!isUpdate)
			{
				return Result.ReFailure(ResultCodes.DepartmentUpdateError);
			}

			return Result.ReSuccess();
		}
	}
}