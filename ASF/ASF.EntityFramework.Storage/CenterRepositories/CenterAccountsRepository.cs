using ASF.Domain.Entities.Center;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 账户仓储
	/// </summary>
	public class CenterAccountsRepository: CenterRepositories<CenterAccount>,ICenterAccountsRepository
	{
		public CenterAccountsRepository(CenterRepositoryContext context) : base(context)
		{
		}
	}
}