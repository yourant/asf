using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
	public class RoleRepositories: Repositories<Role>, IRoleRepositories
	{
		public RoleRepositories(RepositoryContext context) : base(context)
		{
		}
		/// <summary>
		/// 获取角色关联详情
		/// </summary>
		/// <param name="id"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Role> GetRoleAsync(long id, long? tenancyId = null)
		{
			if (tenancyId == null)
			{
				Role r = await base.GetDbContext().Role.Include("AccountRole.Account")
					.Include("DepartmentRole.Department").Include("PermissionRole.Permission").AsSplitQuery()
					.FirstOrDefaultAsync(f => f.Id == id);
				return await Task.FromResult<Role>(r);
			}
			
			Role role = await base.GetDbContext().Role.Include("AccountRole.Account")
				.Include("DepartmentRole.Department").Include("PermissionRole.Permission").AsSplitQuery()
				.FirstOrDefaultAsync(f => f.Id == id && f.TenancyId == tenancyId);
			return await Task.FromResult<Role>(role);
		}
	}
}