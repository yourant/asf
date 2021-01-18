using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
  public class PermissionsRepository: Repositories<Permission>,IPermissionsRepository
  {
    public PermissionsRepository(RepositoryContext context) : base(context)
    {
    }
    /// <summary>
    /// 根据id获取对应权限
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Permission> GetAsync(long id)
    {
      // var cc = base.GetDbContext().Accounts.Include("AccountPost.Post").Include("Department.DepartmentRole.Role.PermissionRole.Permission").ToList();
      return await base.GetDbContext().Permissions.Include("PermissionMenus").Include("Apis").FirstOrDefaultAsync(x=> x.Id == id);
    }
    /// <summary>
    /// 根据权限id集合获取权限集合
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task<List<Permission>> GetListAsync(List<long> ids)
    {
      List<Permission> list = (from p in await base.GetDbContext().Permissions.Include("PermissionMenus").Include("Apis").ToListAsync()
        from l in ids
        where (p.Id == l)
        select p).ToList();
      return await Task.FromResult<List<Permission>>(list);
    }
  }
}