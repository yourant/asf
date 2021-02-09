using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 岗位仓储
	/// </summary>
	public class PostRepository: Repositories<Post>, IPostRepository
	{
		public PostRepository(RepositoryContext context) : base(context)
		{
		}
	}
}