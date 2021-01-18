using System.Linq;
using System.Threading.Tasks;
using ASF.DependencyInjection;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ASF.Application
{
  /// <summary>
  /// api 控制器 只有超级管理员才有权限控制
  /// </summary>
  [Authorize(Roles="superadmin")]
  [Route("[controller]/[action]")]
  public class ApiController: ControllerBase
  {
    private readonly IApiRepository _apiRepository;
    private readonly IPermissionsRepository _permissionsRepository;
    public ApiController(IApiRepository apiRepository, IPermissionsRepository permissionsRepository)
    {
      _apiRepository = apiRepository;
      _permissionsRepository = permissionsRepository;
    }
    
    [HttpPost]
    public async Task<Result> Create()
    {
      // var a = await _apiRepository.Add(new Api()
      // {
      //   PermissionId = 2,
      //   Name = "测试api",
      //   Status = 1,
      //   Type = 1,
      //   Path = "/testa/sdasdas",
      //   HttpMethods = "post",
      //   IsLogger = true,
      //   Description = "测试api",
      //   IsSystem = false,
      // });
      // var data = new Permission()
      // {
      //   Name = "api",
      //   Code = "asf_api",
      //   ParentId = 1,
      //   Type = 2,
      //   IsSystem = true
      // };
      // data.PermissionMenus = new PermissionMenu()
      // {
      //   PermissionId = data.Id,
      //   Title = "api权限管理",
      //   Subtitle = "api权限管理"
      // };
      // var a = await _permissionsRepository.Add(data);
      // var (list,total) = await _permissionsRepository.GetEntitiesForPaging(1,5,j=>j.Id != 0);
 
      var a = await _permissionsRepository.GetAsync(15);
      return Result.ReSuccess();
    }
  }
}