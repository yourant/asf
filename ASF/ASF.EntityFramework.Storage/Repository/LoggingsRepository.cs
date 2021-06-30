using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	public class LoggingsRepository: Repositories<LogInfo>, ILoggingsRepository
	{
		public LoggingsRepository(RepositoryContext context) : base(context)
		{
		}
	}
}