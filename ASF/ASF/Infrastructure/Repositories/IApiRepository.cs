using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
  /// <summary>
  /// api 仓储
  /// </summary>
  public interface IApiRepository: IRepositories<Api>
  {
    /// <summary>
    /// 获取权限功能详情
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    Task<Api> GetApiAsync(long id);
    /// <summary>
    /// 批量删除权限功能api
    /// </summary>
    /// <param name="list"></param>
    /// <returns></returns>
    Task<bool> BatchDeleteAsync(List<Api> list);
  }
}