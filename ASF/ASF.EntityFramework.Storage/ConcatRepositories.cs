using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 咨询内容仓储
	/// </summary>
	public class ConcatRepositories: Repositories<Concat>,IConcatRepositories
	{
		public ConcatRepositories(RepositoryContext context) : base(context)
		{
		}
	}
}