using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Domain.Entities.Center;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;

namespace ASF.Domain.Services
{
	/// <summary>
	/// center 领域服务
	/// </summary>
	public class CenterService
	{
		private readonly ICenterAccountsRepository _centerAccountsRepository;
		private readonly ICenterShopRepository _centerShopRepository;
		/// <summary>
		/// center 领域服务
		/// </summary>
		/// <param name="centerAccountsRepository"></param>
		/// <param name="centerShopRepository"></param>
		public CenterService(ICenterAccountsRepository centerAccountsRepository,ICenterShopRepository centerShopRepository)
		{
			_centerAccountsRepository = centerAccountsRepository;
			_centerShopRepository = centerShopRepository;
		}
		/// <summary>
		/// 获取账户列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="name"></param>
		/// <returns></returns>
		public async Task<(IList<CenterAccount> list,int total)> GetAccountList(int pageNo, int pageSize, string name)
		{
			if (!string.IsNullOrEmpty(name))
			{
				return await _centerAccountsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Name.Equals(name));
			}
			else
			{
				return await _centerAccountsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.AccountId != 0);
			}
		}
		/// <summary>
		/// 获取商铺列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="name"></param>
		/// <returns></returns>
		public async Task<(IList<CenterShop> list, int total)> GetShopList(int pageNo, int pageSize, string name)
		{
			if (!string.IsNullOrEmpty(name))
			{
				return await _centerShopRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Name.Equals(name));
			}
			else
			{
				return await _centerShopRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.ShopId != 0);
			}
		}
	}
}