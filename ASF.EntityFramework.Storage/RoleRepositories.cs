using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

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
		public Task<Role> GetRoleAsync(long id, long? tenancyId = null)
		{
			throw new System.NotImplementedException();
		}
	}
}