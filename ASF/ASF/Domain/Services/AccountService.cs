using System;
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
		/// 获取账户登录权限信息
		/// </summary>
		/// <param name="uid"></param>
		/// <param name="tenancyId">租户id</param>
		/// <returns></returns>
		public async Task<Result<Account>> GetAccountInfo(long uid,long? tenancyId = null)
		{
			Account account = await _accountsRepository.GetAccountAndRoleAndPermissionAsync(uid,tenancyId);
			if (account == null)
				return Result<Account>.ReFailure(ResultCodes.AccountNotExist);
			if(account.IsDeleted != null && (Status)account.IsDeleted == Status.Yes)
				return Result<Account>.ReFailure(ResultCodes.AccountUnavailable);
			return Result<Account>.ReSuccess(account);
		}
		/// <summary>
		/// 获取账户基本信息
		/// </summary>
		/// <param name="uid"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Result<Account>> Get(long uid, long? tenancyId = null)
		{
			if (tenancyId != null)
			{
				Account a = await _accountsRepository.GetEntity(f => f.Id == uid && f.TenancyId == tenancyId);
				if (a == null)
					return Result<Account>.ReFailure(ResultCodes.AccountNotExist);
				if(a.IsDeleted != null && (Status)a.IsDeleted == Status.Yes)
					return Result<Account>.ReFailure(ResultCodes.AccountUnavailable);
				return Result<Account>.ReSuccess(a);
			}
			
			Account account = await _accountsRepository.GetEntity(f => f.Id == uid);
			if (account == null)
				return Result<Account>.ReFailure(ResultCodes.AccountNotExist);
			if(account.IsDeleted != null && (Status)account.IsDeleted == Status.Yes)
				return Result<Account>.ReFailure(ResultCodes.AccountUnavailable);
			return Result<Account>.ReSuccess(account);
		}
		/// <summary>
		/// 获取账户对应岗位和部门
		/// </summary>
		/// <param name="uid"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Result<Account>> GetAccountByPostAsync(long uid, long? tenancyId = null)
		{
			Account account = await _accountsRepository.GetAccountByPostAsync(uid,tenancyId);
			if (account == null)
				return Result<Account>.ReFailure(ResultCodes.AccountNotExist);
			if(account.IsDeleted != null && (Status)account.IsDeleted == Status.Yes)
				return Result<Account>.ReFailure(ResultCodes.AccountUnavailable);
			return Result<Account>.ReSuccess(account);
		}
		/// <summary>
		/// 获取账户对应角色
		/// </summary>
		/// <param name="uid"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Result<Account>> GetAccountByRole(long uid, long? tenancyId = null)
		{
			Account account = await _accountsRepository.GetAccountByRole(uid,tenancyId);
			if (account == null)
				return Result<Account>.ReFailure(ResultCodes.AccountNotExist);
			if(account.IsDeleted != null && (Status)account.IsDeleted == Status.Yes)
				return Result<Account>.ReFailure(ResultCodes.AccountUnavailable);
			return Result<Account>.ReSuccess(account);
		}
		/// <summary>
		/// 获取账户对应 角色权限以及部门。租户，岗位信息
		/// </summary>
		/// <param name="uid"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Result<Account>> GetDetails(long uid, long? tenancyId = null)
		{
			Account account = await _accountsRepository.GetAccountByPostAndRoleAsync(uid,tenancyId);
			if (account == null)
				return Result<Account>.ReFailure(ResultCodes.AccountNotExist);
			if(account.IsDeleted != null && (Status)account.IsDeleted == Status.Yes)
				return Result<Account>.ReFailure(ResultCodes.AccountUnavailable);
			return Result<Account>.ReSuccess(account);
		}

		/// <summary>
		/// 获取账户分页列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="username"></param>
		/// <param name="telPhone"></param>
		/// <param name="email"></param>
		/// <param name="sex"></param>
		/// <param name="status"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<(IList<Account> list,int total)> GetList(int pageNo, int pageSize, string username,string telPhone,string email,int? sex,uint? status,long? tenancyId = null)
		{
			if (tenancyId != null)
			{
				if (!string.IsNullOrEmpty(username) || !string.IsNullOrEmpty(telPhone) || !string.IsNullOrEmpty(email) ||
				    sex != null || status != null)
				{
					return await _accountsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.TenancyId == tenancyId && (f.Username.Equals(username) || f.TelPhone.Equals(telPhone) || f.Email.Equals(email) || f.Sex == sex || f.Status == status));
				}
				else
				{
					return await _accountsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.TenancyId == tenancyId);
				}
			}
			else
			{
				if (!string.IsNullOrEmpty(username) || !string.IsNullOrEmpty(telPhone) || !string.IsNullOrEmpty(email) ||
				    sex != null || status != null)
				{
					return await _accountsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Username.Equals(username) || f.TelPhone.Equals(telPhone) || f.Email.Equals(email) || f.Sex == sex || f.Status == status);
				}
				else
				{
					return await _accountsRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Id != 0);
				}
			}
		}
		/// <summary>
		/// 创建账户
		/// </summary>
		/// <param name="account"></param>
		/// <returns></returns>
		public async Task<bool> Create(Account account)
		{
			if (await _accountsRepository.GetEntity(f => f.TenancyId == account.TenancyId && (f.Username.Equals(account.Username) || f.Email.Equals(account.Email) || f.TelPhone.Equals(account.TelPhone))) != null)
				return false;
			return await _accountsRepository.Add(account);
		}
		/// <summary>
		/// 修改账户
		/// </summary>
		/// <param name="account"></param>
		/// <param name="dic">返回值字典</param>
		/// <returns></returns>
		public async Task<Result> Modify(Account account,string dic = "default")
		{
			if (dic.Equals("default") && await _accountsRepository.GetEntity(f => f.Id != account.Id && f.TenancyId == account.TenancyId && (f.Username.Equals(account.Username) || f.Email.Equals(account.Email) || f.TelPhone.Equals(account.TelPhone))) != null)
				return Result.ReFailure(ResultCodes.AccountExist);
			if (dic.Equals("telphone") && await _accountsRepository.GetEntity(f =>
				f.Id != account.Id && f.TenancyId == account.TenancyId && f.TelPhone.Equals(account.TelPhone)) != null)
				return Result.ReFailure(ResultCodes.AccountExistTelPhoneError);
			if (dic.Equals("email") && await _accountsRepository.GetEntity(f =>
				f.Id != account.Id && f.TenancyId == account.TenancyId && f.Email.Equals(account.Email)) != null)
				return Result.ReFailure(ResultCodes.AccountExistEmailError);
			if (dic.Equals("username") && await _accountsRepository.GetEntity(f =>
				f.Id != account.Id && f.TenancyId == account.TenancyId && f.Username.Equals(account.Username)) != null)
				return Result.ReFailure(ResultCodes.AccountExistUserNameError);
			bool isUpdate = await _accountsRepository.Update(account);
			if(!isUpdate)
				return Result.ReFailure(ResultCodes.AccountUpdateError);
			return Result.ReSuccess();
		}
	}
}