using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	public class TenancyRepository: Repositories<Tenancy>, ITenancyRepository
	{
		public TenancyRepository(RepositoryContext context) : base(context)
		{
		}
	}
}