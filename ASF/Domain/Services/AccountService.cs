using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Domain.Entities;
using ASF.Domain.Values;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;
using ASF.Internal.Security;
using AutoMapper;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 账户服务
	/// </summary>
	public class AccountService
	{
		//账户仓储
		private readonly IAccountsRepository _accountsRepository;
		/// <summary>
		/// 账户服务
		/// </summary>
		/// <param name="accountsRepository"></param>
		public AccountService(IAccountsRepository accountsRepository)
		{
			_accountsRepository = accountsRepository;
		}
		/// <summary>
		/// 获取账户登录信息
		/// </summary>
		/// <param name="uid"></param>
		/// <param name="tenancyId">租户id</param>
		/// <returns></returns>
		public async Task<Result<Account>> GetAccountInfo(long uid,long? tenancyId = null)
		{
			Account account = await _accountsRepository.GetAccountAndRoleAndPermissionAsync(uid,tenancyId);
			if (account == null)
				return Result<Account>.ReFailure(ResultCodes.AccountNotExist);
			if (account.Status != null && (EnabledType)account.Status == EnabledType.Disabled)
				return Result<Account>.ReFailure(ResultCodes.AccountUnavailable);
			return Result<Account>.ReSuccess(account);
		}
		
	}
}