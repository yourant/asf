using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 权限菜单仓储
	/// </summary>
	public class MenuRepositories: Repositories<PermissionMenu>, IMenuRepositories
	{
		public MenuRepositories(RepositoryContext context) : base(context)
		{
		}
		/// <summary>
		/// 获取权限菜单详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<PermissionMenu> GetPermissionMenuAsync(long id)
		{
			PermissionMenu permissionMenu = await base.GetDbContext().PermissionMenus.Include(f => f.Permissions)
				.FirstOrDefaultAsync(f => f.Id == id);
			return await Task.FromResult<PermissionMenu>(permissionMenu);
		}
	}
}