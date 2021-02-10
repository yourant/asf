using System.Threading.Tasks;
using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
	/// <summary>
	/// 租户仓储
	/// </summary>
	public interface ITenancyRepository: IRepositories<Tenancy>
	{
		/// <summary>
		/// 获取对应租户下面的用户以及详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		Task<Tenancy> GetAsync(long id);
	}
}