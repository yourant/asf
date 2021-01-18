using ASF.Domain.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;
using ASF.Domain.Values;

namespace ASF
{
    public class ASFPermissionAuthorizationMiddleware
    {
        private readonly RequestDelegate _next;

        public ASFPermissionAuthorizationMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            var serviceProvider = httpContext.RequestServices;
            var logger = serviceProvider.GetRequiredService<ILogger<ASFPermissionAuthorizationMiddleware>>();
            
            //验证登陆用户是否有权限
            var result = await serviceProvider.GetRequiredService<AccountAuthorizationService>().Authentication();
            var requestPath = httpContext.Request.PathBase + httpContext.Request.Path;
            if (result.Success)
            {
                if (result.Data.IsLogger != null && (Status)result.Data.IsLogger == Status.Yes)
                    logger.LogInformation($"{requestPath} Permission authorization success");
                
                httpContext.Items.Add("asf_api_parmission", result.Data);
                await _next(httpContext);

            }
            else
            {
                if (httpContext.User.Identity != null && !httpContext.User.Identity.IsAuthenticated)
                    httpContext.Response.StatusCode = 401;
                else                
                    httpContext.Response.StatusCode = 403;                    
                logger.LogWarning($"{requestPath} Response.StatusCode {httpContext.Response.StatusCode} Permission authorization failed ");
                await Task.CompletedTask;
                // return;
            }
        }

    }
}
