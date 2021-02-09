using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.DependencyInjection;

namespace ASF
{
	/// <summary>
	/// token 黑名单中间件
	/// </summary>
	public class AuthorizationTokenSecurityPolicy
	{
		private readonly RequestDelegate _next;
    private readonly IMemoryCache _cache;
    private readonly IServiceProvider _serviceProvider;
    private DateTime _refreshTime = DateTime.Now.AddYears(-5);
    private int _isProcessing = 0;
    private int tokenRefreshInterval = 1000;
    private long _lastId = 0;
    /// <summary>
    /// token黑名单中间件
    /// </summary>
    /// <param name="next"></param>
    /// <param name="serviceProvider"></param>
    /// <param name="cache"></param>
    public AuthorizationTokenSecurityPolicy(RequestDelegate next, IServiceProvider serviceProvider, IMemoryCache cache)
    {
      _next = next;
      _serviceProvider = serviceProvider;
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
        string tokne = string.Empty;
        if (authorization.StartsWith("Bearer ", StringComparison.OrdinalIgnoreCase))
        {
          tokne = authorization.Substring("Bearer ".Length).Trim();
        }
        this.LoadBlacklistToken();
        if (_cache.TryGetValue(tokne, out string warnInfo))
        {
          context.Response.Headers.Add("blacklist", "error");
          context.Response.StatusCode = 401;
          var bytes = Encoding.UTF8.GetBytes(warnInfo);
          await context.Response.Body.WriteAsync(bytes, 0, bytes.Length);
          return;
        }
        await _next(context);
      }
    }
    /// <summary>
    /// 黑名单线程
    /// </summary>
    private void LoadBlacklistToken()
    {
      if ((DateTime.Now - _refreshTime).TotalMilliseconds < tokenRefreshInterval * 2)
      {
        return;
      }
      if (Interlocked.CompareExchange(ref _isProcessing, 1, 0) == 1)
        return;
      new Task(async () =>
      {
        while (true)
        {
          try
          {
            _refreshTime = DateTime.Now;
            Task.Delay(tokenRefreshInterval).Wait();
            IEnumerable<SecurityToken> tokens = await _serviceProvider.GetRequiredService<ISecurityTokenRepository>().GetEntities(f => f.Id == _lastId);
            var securityTokens = tokens as SecurityToken[] ?? tokens.ToArray();
            if (securityTokens.ToList().Count == 0)
              continue;
            foreach (var item in securityTokens)
            {
              if (_cache.TryGetValue(item.Token, out string warnInfo))
                continue;

              _cache.Set(item.Token, item.AccountId, new MemoryCacheEntryOptions()
              {
                AbsoluteExpiration = item.TokenExpired
              });
            }
            _lastId = securityTokens.LastOrDefault().Id;
          }
          catch (Exception ex)
          {
            Console.WriteLine(ex);
          }
        }
      }).Start();
    }
  }
}