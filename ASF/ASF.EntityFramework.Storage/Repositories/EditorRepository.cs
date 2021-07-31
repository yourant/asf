using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Editor;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;

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