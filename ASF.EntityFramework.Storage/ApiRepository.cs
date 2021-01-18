using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
  /// <summary>
  /// api仓储
  /// </summary>
  public class ApiRepository: Repositories<Api>, IApiRepository
  {
    public ApiRepository(RepositoryContext context) : base(context)
    {
    }
    /// <summary>
    /// 获取权限功能详情
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Api> GetApiAsync(long id)
    {
      Api api = await base.GetDbContext().Apis.Include(f => f.Permission).FirstOrDefaultAsync(f => f.Id == id);
      return await Task.FromResult<Api>(api);
    }
  }
}