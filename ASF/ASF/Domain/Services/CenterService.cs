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
		private readonly ICenterProgramsRepository _centerProgramsRepository;
		/// <summary>
		/// center 领域服务
		/// </summary>
		/// <param name="centerAccountsRepository"></param>
		/// <param name="centerShopRepository"></param>
		/// <param name="centerProgramsRepository"></param>
		public CenterService(ICenterAccountsRepository centerAccountsRepository,ICenterShopRepository centerShopRepository,ICenterProgramsRepository centerProgramsRepository)
		{
			_centerAccountsRepository = centerAccountsRepository;
			_centerShopRepository = centerShopRepository;
			_centerProgramsRepository = centerProgramsRepository;

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
		/// <summary>
		/// 获取应用列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="name"></param>
		/// <returns></returns>
		public async Task<(IList<CenterProgram> list, int total)> GetProgramList(int pageNo, int pageSize, string name)
		{
			if (!string.IsNullOrEmpty(name))
			{
				return await _centerProgramsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Name.Equals(name));
			}
			else
			{
				return await _centerProgramsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.ProgramId != 0);
			}
		}
		/// <summary>
		/// 查找账户
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Result<CenterAccount>> GetAccount(long id)
		{
			CenterAccount centerAccount = await _centerAccountsRepository.GetEntity(f => f.AccountId == id);
			if(centerAccount == null)
				return Result<CenterAccount>.ReFailure(ResultCodes.AccountNotExist);
			return Result<CenterAccount>.ReSuccess(centerAccount);
		}
		/// <summary>
		/// 添加账户
		/// </summary>
		/// <param name="account"></param>
		/// <returns></returns>
		public async Task<Result> AddAccount(CenterAccount account)
		{
			bool isAdd = await _centerAccountsRepository.Add(account);
			if (!isAdd)
				return Result.ReFailure(ResultCodes.AccountCreate);
			return Result.ReSuccess();
		}
		/// <summary>
		/// 修改账户
		/// </summary>
		/// <param name="account"></param>
		/// <returns></returns>
		public async Task<Result> ModifyAccount(CenterAccount account)
		{
			bool isUpdate = await _centerAccountsRepository.Update(account);
			if (!isUpdate)
				return Result.ReFailure(ResultCodes.AccountUpdateError);
			return Result.ReSuccess();
		}

		/// <summary>
		/// 修改账户状态
		/// </summary>
		/// <param name="account"></param>
		/// <returns></returns>
		public async Task<Result> ModifyStatus(CenterAccount account)
		{
			bool isUpdate = await _centerAccountsRepository.Update(account);
			if(!isUpdate)
				return Result.ReFailure(ResultCodes.NotAcceptable);
			return Result.ReSuccess();
		}
	}
}