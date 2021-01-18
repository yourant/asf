using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 多语言数据仓储
	/// </summary>
	public class DepartmentRepositories: Repositories<Department>, IDepartmentRepositories
	{
		public DepartmentRepositories(RepositoryContext context) : base(context)
		{
		}
		/// <summary>
		/// 获取部门及其关联信息
		/// </summary>
		/// <param name="id"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Department> GetDepartmentAsync(long id,long tenancyId)
		{
			Department department = await base.GetDbContext().Departments
				.Include("DepartmentRole.Role.PermissionRole.Permission").Include("Accounts")
				.FirstOrDefaultAsync(f => f.Id == id && f.TenancyId == tenancyId);
			return await Task.FromResult<Department>(department);
		}
	}
}