using ASF.Domain.Entities.Center;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 应用仓储
	/// </summary>
	public class CenterProgramsRepository: CenterRepositories<CenterProgram>,ICenterProgramsRepository
	{
		public CenterProgramsRepository(CenterRepositoryContext context) : base(context)
		{
		}
	}
}