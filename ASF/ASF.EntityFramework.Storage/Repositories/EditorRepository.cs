using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
	/// <summary>
	/// 富文本编辑仓储
	/// </summary>
	public class EditorRepository: Repositories<Editor>, IEditorRepository
	{
		public EditorRepository(RepositoryContext context) : base(context)
		{
		}
	}
}