using System.Threading.Tasks;
using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
	/// <summary>
	/// 角色仓储
	/// </summary>
	public interface IRoleRepositories: IRepositories<Role>
	{
		/// <summary>
		/// 获取角色关联详情
		/// </summary>
		/// <param name="id"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		Task<Role> GetRoleAsync(long id, long? tenancyId = null);
	}
}