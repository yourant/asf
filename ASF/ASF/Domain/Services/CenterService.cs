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
		/// <summary>
		/// center 领域服务
		/// </summary>
		/// <param name="centerAccountsRepository"></param>
		public CenterService(ICenterAccountsRepository centerAccountsRepository)
		{
			_centerAccountsRepository = centerAccountsRepository;
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
	}
}