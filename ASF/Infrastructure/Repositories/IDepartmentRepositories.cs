using System.Threading.Tasks;
using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
	/// <summary>
	/// 部门仓储
	/// </summary>
	public interface IDepartmentRepositories: IRepositories<Department>
	{
		/// <summary>
		/// 获取部门及其关联信息
		/// </summary>
		/// <param name="id"></param>
		/// <param name="tenancyId"/>
		/// <returns></returns>
		Task<Department> GetDepartmentAsync(long id, long? tenancyId = null);
	}
}