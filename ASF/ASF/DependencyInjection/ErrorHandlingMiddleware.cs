using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace ASF.DependencyInjection
{
  /// <summary>
  /// 统一全局错误拦截
  /// </summary>
  public class ErrorHandlingMiddleware
  {
    private readonly RequestDelegate next;
    private readonly ILogger<ErrorHandlingMiddleware> _logger;
    /// <summary>
    /// 统一错误处理中间件
    /// </summary>
    public ErrorHandlingMiddleware(RequestDelegate next,ILogger<ErrorHandlingMiddleware> logger)
    {
      this.next = next;
      this._logger = logger;
    }
    /// <summary>
    /// 激活
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    public async Task Invoke(HttpContext context)
    {
      try
      {
        await next(context);
      }
      catch (Exception ex)
      {
        // var statusCode = context.Response.StatusCode;
        int statusCode = 500;
        if (ex is ArgumentException)
        {
          statusCode = 200;
        }
        _logger.LogError($"统一拦截异常处理: {ex.Message}, StackTrace:{ex.StackTrace}");
        // await HandleExceptionAsync(context, statusCode, ex.Message);
        await HandleExceptionAsync(context, statusCode, ex.Message);
      }
      finally
      {
        var statusCode = context.Response.StatusCode;
        var msg = "";
        // if (statusCode == 401)
        // {
        //   msg = "未授权";
        // }
        if (statusCode == 404)
        {
          msg = "未找到服务";
        }
        else if (statusCode == 502)
        {
          msg = "请求错误";
        }
        // else if (statusCode != 200)
        // {
        //   msg = "未知错误";
        // }
        if (!string.IsNullOrWhiteSpace(msg))
        {
          await HandleExceptionAsync(context, statusCode, msg);
        }
      }
    }

    private static Task HandleExceptionAsync(HttpContext context, int statusCode, string msg)
    {
      string data = null;
      var result = JsonConvert.SerializeObject(new { status = statusCode, result = data, message = msg });
      context.Response.StatusCode = statusCode;
      context.Response.ContentType = "application/json;charset=utf-8";
      return context.Response.WriteAsync(result);
    }
  }
}