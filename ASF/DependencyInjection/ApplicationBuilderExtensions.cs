using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Microsoft.AspNetCore.Builder
{
    /// <summary>
    /// asf 中间件扩展
    /// </summary>
    public static class ApplicationBuilderExtensions
    {
        /// <summary>
        /// asf 中间件
        /// </summary>
        /// <param name="app"></param>
        /// <returns></returns>
        public static IApplicationBuilder UseASF(this IApplicationBuilder app)
        {
            // Nginx 代理时获取真实 IP
            app.Use((context, next) =>
            {
                var headers = context.Request.Headers;
                try
                {
                    if (headers.ContainsKey("X-Forwarded-For"))
                    {
                        context.Connection.RemoteIpAddress = IPAddress.Parse(headers["X-Forwarded-For"].ToString().Split(',')[0]);
                    }
                    else
                    {
                        context.Connection.RemoteIpAddress = IPAddress.Parse("127.0.0.1");
                    }
                }
                finally
                {
                    next().Wait();
                }
                return Task.CompletedTask;
            });
            return app.UseASFMiddleware();


        }
    }
}
