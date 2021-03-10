using System.Threading.Tasks;
using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
	/// <summary>
	/// 权限菜单仓储
	/// </summary>
	public interface IMenuRepositories: IRepositories<PermissionMenu>
	{
		/// <summary>
		/// 获取权限菜单详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		Task<PermissionMenu> GetPermissionMenuAsync(long id);
	}
}