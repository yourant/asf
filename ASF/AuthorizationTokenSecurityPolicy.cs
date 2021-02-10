using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Domain.Services;
using ASF.Infrastructure.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;

namespace ASF
{
	/// <summary>
	/// token 黑名单中间件
	/// </summary>
	public class AuthorizationTokenSecurityPolicy
	{
		private readonly RequestDelegate _next;
    private readonly IMemoryCache _cache;
    private DateTime _refreshTime = DateTime.Now.AddYears(-5);
    // private int _isProcessing = 0;
    // private int tokenRefreshInterval = 1000;
    /// <summary>
    /// token黑名单中间件
    /// </summary>
    /// <param name="next"></param>
    /// <param name="cache"></param>
    public AuthorizationTokenSecurityPolicy(RequestDelegate next,  IMemoryCache cache)
    {
      _next = next;
      _cache = cache;
    }
    /// <summary>
    /// 事件
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    public async Task Invoke(HttpContext context)
    {
      string authorization = context.Request.Headers["Authorization"];
      if (string.IsNullOrEmpty(authorization))
      {
        context.Response.StatusCode = 200;
        await _next(context);
        // // var bytes = Encoding.UTF8.GetBytes("未经授权的请求");
        // // await context.Response.Body.WriteAsync(bytes, 0, bytes.Length);
      }
      else
      {
        string token = string.Empty;
        if (authorization.StartsWith("Bearer ", StringComparison.OrdinalIgnoreCase))
        {
          token = authorization.Substring("Bearer ".Length).Trim();
        }
        IServiceProvider serviceProvider = context.RequestServices;

        // this.LoadBlacklistToken(securityTokenService,uid);
        if (_cache.TryGetValue(token, out string warnInfo))
        {
          context.Response.Headers.Add("blacklist", "error");
          context.Response.StatusCode = 403;
          var result = JsonConvert.SerializeObject(new { status = 403, result = string.Empty, message = "无效的token" });
          context.Response.ContentType = "application/json;charset=utf-8";
          await context.Response.WriteAsync(result);
          return;
        }
        else
        {
          SecurityToken securityToken = await serviceProvider.GetRequiredService<ISecurityTokenRepository>().GetEntity(f=>f.Token.Equals(token));
          if (securityToken != null)
          {
            _cache.Set(securityToken.Token, securityToken.AccountId, new MemoryCacheEntryOptions()
            {
              AbsoluteExpiration = securityToken.TokenExpired
            });
            context.Response.Headers.Add("blacklist", "error");
            context.Response.StatusCode = 403;
            var result = JsonConvert.SerializeObject(new { status = 403, result = string.Empty, message = "无效的token" });
            context.Response.ContentType = "application/json;charset=utf-8";
            await context.Response.WriteAsync(result);
            return;
          }
        }

        await _next(context);
      }
    }
    // /// <summary>
    // /// 黑名单线程
    // /// </summary>
    // /// <param name="securityTokenService"></param>
    // /// <param name="uid"></param>
    // private void LoadBlacklistToken(SecurityTokenService securityTokenService,long uid)
    // {
    //   if ((DateTime.Now - _refreshTime).TotalMilliseconds < tokenRefreshInterval * 2)
    //   {
    //     return;
    //   }
    //   if (Interlocked.CompareExchange(ref _isProcessing, 1, 0) == 1)
    //     return;
    //   new Task(async () =>
    //   {
    //     while (true)
    //     {
    //       try
    //       {
    //         _refreshTime = DateTime.Now;
    //         Task.Delay(tokenRefreshInterval).Wait();
    //         IList<SecurityToken> tokens = await securityTokenService.GetList(uid);
    //         if (tokens.ToList().Count == 0)
    //           continue;
    //         foreach (var item in tokens)
    //         {
    //           if (_cache.TryGetValue(item.Token, out string warnInfo))
    //             continue;
    //
    //           _cache.Set(item.Token, item.AccountId, new MemoryCacheEntryOptions()
    //           {
    //             AbsoluteExpiration = item.TokenExpired
    //           });
    //         }
    //       }
    //       catch (Exception ex)
    //       {
    //         Console.WriteLine(ex);
    //       }
    //     }
    //   }).Start();
    // }
  }
}