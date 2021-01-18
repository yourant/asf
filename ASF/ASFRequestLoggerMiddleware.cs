using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using System.Net;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Domain.Values;

namespace ASF
{
    public class ASFRequestLoggerMiddleware
    {
        private readonly RequestDelegate _next;

        public ASFRequestLoggerMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {       
                    
            //判断是否响应成功
            if (context.Response.StatusCode != (int)HttpStatusCode.OK)
            {
                return;                
            }

            //开始记录日志
            var serviceProvider = context.RequestServices;
            var logger = serviceProvider.GetRequiredService<ILogger<ASFRequestLoggerMiddleware>>();
            try
            {
                if (context.Items.ContainsKey("asf_api_parmission"))
                {
                    if (context.Items["asf_api_parmission"] is Api api)
                    {
                        //判断是否需要记录日志
                        if (api.IsLogger != null && (Status)api.IsLogger == Status.Yes)                            
                            await ASFRequestLogger.GetInstance(context, api,this._next).Record();
                        else 
                            await _next(context);
                    }
                    else
                    {
                        logger.LogError($"HttpContext.Items[\"asf_api_parmission\"] is not equal to {typeof(Api)}");
                        await Task.CompletedTask;
                        // return;
                    }
                }

                await Task.CompletedTask;
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "ASF Logging");
                await _next(context);
            }
        }

        
    }
}
