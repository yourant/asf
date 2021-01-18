using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
	public class AccountsRepository: Repositories<Account>,IAccountsRepository
	{
		public AccountsRepository(RepositoryContext context) : base(context)
		{
		}
		/// <summary>
		/// 通过用户id获取用户
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		/// <exception cref="NotImplementedException"></exception>
		public async Task<Account> GetAsync(long id)
		{
			Account account = await base.GetDbContext().Accounts.Include("Department.DepartmentRole.Role.PermissionRole.Permission").AsSplitQuery().FirstOrDefaultAsync(f=>f.Id == id);
			if (account != null && account.Role.Count == 0)
				account = await base.GetDbContext().Accounts.Include("AccountRole.Role.PermissionRole.Permission").AsSplitQuery().FirstOrDefaultAsync(f=>f.Id == id);
			return await Task.FromResult<Account>(account);
		}

		/// <summary>
		/// 通过用户名获取账户信息
		/// </summary>
		/// <param name="username"></param>
		/// <returns></returns>
		public async Task<Account>  GetByUsernameAsync(string username)
		{
			Account account = await base.GetDbContext().Accounts.Include("Department.DepartmentRole.Role.PermissionRole.Permission").AsSplitQuery().FirstOrDefaultAsync(f=>f.Username.Equals(username));
			if (account != null && account.Role.Count == 0)
				account = await base.GetDbContext().Accounts.Include("AccountRole.Role.PermissionRole.Permission").AsSplitQuery().FirstOrDefaultAsync(f=>f.Username.Equals(username));
			
			return await Task.FromResult<Account>(account);
		}
		/// <summary>
		/// 通过手机号码找到账号
		/// </summary>
		/// <param name="phone"></param>
		/// <returns></returns>
		public async Task<Account> GetByPhoneAsync(string phone)
		{
			Account account = await base.GetDbContext().Accounts.Include("Department.DepartmentRole.Role.PermissionRole.Permission").AsSplitQuery().FirstOrDefaultAsync(f=>f.Telephone.Equals(phone));
			if(account != null && account.Role.Count == 0)
				account = await base.GetDbContext().Accounts.Include("AccountRole.Role.PermissionRole.Permission").AsSplitQuery().FirstOrDefaultAsync(f=>f.Telephone.Equals(phone));
			return await Task.FromResult<Account>(account);
		}
		/// <summary>
		/// 通过邮箱找到账号
		/// </summary>
		/// <param name="email"></param>
		/// <returns></returns>
		public async Task<Account> GetByEamilAsync(string email)
		{
			Account account = await base.GetDbContext().Accounts.Include("Department.DepartmentRole.Role.PermissionRole.Permission").AsSplitQuery().FirstOrDefaultAsync(f=>f.Email.Equals(email));
			if(account != null && account.Role.Count == 0)
				account = await base.GetDbContext().Accounts.Include("AccountRole.Role.PermissionRole.Permission").AsSplitQuery().FirstOrDefaultAsync(f=>f.Email.Equals(email));
			return await Task.FromResult<Account>(account);
		}
	}
}