using ASF.Domain.Entities.Center;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 商户仓储
	/// </summary>
	public class CenterShopRepository: CenterRepositories<CenterShop>,ICenterShopRepository
	{
		public CenterShopRepository(CenterRepositoryContext context) : base(context)
		{
		}
	}
}