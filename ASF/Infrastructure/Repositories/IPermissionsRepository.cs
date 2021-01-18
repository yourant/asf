using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
  /// <summary>
  /// 权限仓储
  /// </summary>
  public interface IPermissionsRepository: IRepositories<Permission>
  {
    /// <summary>
    /// 根据id获取对应权限
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    Task<Permission> GetAsync(long id);
    /// <summary>
    /// 根据权限id集合获取权限集合
    /// </summary>
    /// <param name="list"></param>
    /// <returns></returns>
    Task<List<Permission>> GetListAsync(List<long> list);
  }
}