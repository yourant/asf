using System;
using System.Linq.Expressions;
using System.Threading.Tasks;
using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
	public interface IAccountsRepository: IRepositories<Account>
	{
		/// <summary>
		/// 通过用户id获取用户角色权限信息
		/// </summary>
		/// <param name="id"></param>
		/// <returns>返回用户部门信息以及角色权限信息</returns>
		Task<Account> GetAccountAndRoleAndPermissionAsync(long id);
		/// <summary>
		/// 通过用户名获取账户信息
		/// </summary>
		/// <param name="username"></param>
		/// <returns></returns>
		Task<Account> GetByUsernameAsync(string username);
		/// <summary>
		/// 通过手机号码找到账号
		/// </summary>
		/// <param name="phone"></param>
		/// <returns></returns>
		Task<Account> GetByPhoneAsync(string phone);
		/// <summary>
		/// 通过邮箱找到账号
		/// </summary>
		/// <param name="email"></param>
		/// <returns></returns>
		Task<Account> GetByEamilAsync(string email);
	}
}