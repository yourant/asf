using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Domain.Values;
using ASF.Internal.Utils;

namespace ASF.Domain.Services
{
  /// <summary>
  /// 账号权限认证服务
  /// </summary>
  public class AccountAuthorizationService
  {
    private readonly IHttpContextAccessor _httpContextAccessor;
    private readonly IServiceProvider _serviceProvider;
    private readonly ILogger _logger;
    // new
    private readonly IApiRepository _apiRepository;
    /// <summary>
    /// 账户认证服务
    /// </summary>
    /// <param name="apiRepository"></param>
    /// <param name="httpContextAccessor"></param>
    /// <param name="serviceProvider"></param>
    /// <param name="logger"></param>
    public AccountAuthorizationService(IApiRepository apiRepository, IHttpContextAccessor httpContextAccessor, IServiceProvider serviceProvider, ILogger<AccountAuthorizationService> logger)
    {
      _apiRepository = apiRepository;
      _httpContextAccessor = httpContextAccessor;
      _serviceProvider = serviceProvider;
      _logger = logger;
    }
    /// <summary>
    /// 认证
    /// </summary>
    /// <returns></returns>
    public async Task<Result<Api>> Authentication()
    {
      HttpContext context = _httpContextAccessor.HttpContext;
      HttpRequest request = context.Request;
      var requestPath = (request.PathBase + request.Path).ToString().ToLower();


      //根据请求地址获取权限
      Api api = await this.MatchApiPermission(requestPath.Trim());
      if (api == null)
      {
        this._logger.LogWarning($"没有这个权限 {requestPath}");
        return Result<Api>.ReFailure(ResultCodes.NotAcceptable);
      }
      this._logger.LogDebug($"[{ request.Method}]{requestPath} 匹配权限id {api.Id}");
      // 判断请求方法
      if (!api.HttpMethods.Contains(request.Method.ToLower()))
      {
        this._logger.LogWarning($"请求方法不匹配 : [{ request.Method}]{requestPath}");
        return Result<Api>.ReFailure(ResultCodes.NotAcceptable);
      }
      if (api.Status == 0)
      {
        this._logger.LogWarning($"{api.Id} api被禁用");
        return Result<Api>.ReFailure(ResultCodes.NotAcceptable);
      }
      //如果是开放性权限，只要登录就可以访问
      if ((PermissionType)api.Type == Values.PermissionType.OpenApi)
      {
        this._logger.LogDebug($"{api.Id} 公开api授权成功");
        return Result<Api>.ReSuccess(api);
      }

      
      long uid = context.User.UserId();
      //获取账户信息
      Account account = await this._serviceProvider.GetRequiredService<IAccountsRepository>().GetAccountAndRoleAndPermissionAsync(uid);
      if (account == null)
      {
        this._logger.LogWarning($"{ uid } 账户不存在");
        return Result<Api>.ReFailure(ResultCodes.NotAcceptable);
      }
      // 判断角色是否为空
      if (account.Role.Count == 0 && (account.Department != null && account.Department.Role.Count == 0))
      {
        this._logger.LogDebug("账户不包含角色");
        return Result<Api>.ReFailure(ResultCodes.NotAcceptable);
      }
      // 账户角色是否被禁用以及对应的权限是否被禁用与否匹配
      if ((account.Department != null && account.Department.Role.Count != 0 && account.Department.Role.Any(f => (f.Enable != null && (EnabledType)f.Enable == EnabledType.Disabled) || f.Permission.Count(x => (x.Enable != null && (EnabledType)x.Enable == EnabledType.Enabled) && x.Id == api.PermissionId) == 0)) 
          && 
          (account.Role.Count != 0 && account.Role.Any(f => (f.Enable != null && (EnabledType)f.Enable == EnabledType.Disabled) || f.Permission.Count(x => (x.Enable != null && (EnabledType)x.Enable == EnabledType.Enabled) && x.Id == api.PermissionId) == 0)))
      {
        _logger.LogWarning($"角色 {string.Join(",", account.Department.Role.Select(s => s.Name))} 被禁用");
        return Result<Api>.ReFailure(ResultCodes.NotAcceptable);
      }

      // if ((account.Department.Role.Count != 0 && !account.Department.Role.Any(f => f.Enable != null && (bool)f.Enable)) ||
      //     (account.Role.Count != 0 && !account.Role.Any(f => f.Enable != null && (bool) f.Enable)))
      // {
      //     this._logger.LogWarning($"Authorized users are not assigned {api.Name} permissions ");
      //     return Result<Api>.ReFailure(ResultCodes.NotAcceptable);
      // }
      this._logger.LogDebug($"认证成功");
      return Result<Api>.ReSuccess(api);
    }

    /// <summary>
    /// 匹配权限
    /// </summary>
    /// <param name="requestPath"></param>
    /// <returns></returns>
    private async Task<Api> MatchApiPermission(string requestPath)
    {
      IEnumerable<Api> api = await _apiRepository.GetEntities(f => f.Id != 0);
      Api[] enumerable = api as Api[] ?? api.ToArray();
      if (!enumerable.Any())
        return await Task.FromResult<Api>(null);
      return enumerable.FirstOrDefault(f => Regex.IsMatch(requestPath, $"^{f.Path}$"));
    }

  }
}
