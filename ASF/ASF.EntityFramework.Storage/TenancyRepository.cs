using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
	public class TenancyRepository: Repositories<Tenancy>, ITenancyRepository
	{
		public TenancyRepository(RepositoryContext context) : base(context)
		{
		}
		/// <summary>
		/// 获取对应租户下面的用户以及详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Tenancy> GetAsync(long id)
		{
			Tenancy tenancy = await base.GetDbContext().Tenancy.Include("Accounts").FirstOrDefaultAsync(f => f.Id == id);
			return await Task.FromResult<Tenancy>(tenancy);
		}
	}
}