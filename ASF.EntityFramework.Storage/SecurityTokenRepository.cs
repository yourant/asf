using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// token黑名单仓储
	/// </summary>
	public class SecurityTokenRepository: Repositories<SecurityToken>, ISecurityTokenRepository
	{
		public SecurityTokenRepository(RepositoryContext context) : base(context)
		{
		}
	}
}