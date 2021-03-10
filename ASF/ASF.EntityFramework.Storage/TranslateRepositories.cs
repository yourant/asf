using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 多语言仓储
	/// </summary>
	public class TranslateRepositories: Repositories<Translate>, ITranslateRepositories
	{
		public TranslateRepositories(RepositoryContext context) : base(context)
		{
		}
	}
}