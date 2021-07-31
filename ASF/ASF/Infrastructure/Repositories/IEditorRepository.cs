using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Editor;
using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
	/// <summary>
	/// 富文本仓储
	/// </summary>
	public interface IEditorRepository: IRepositories<Editor>
	{
	}
}