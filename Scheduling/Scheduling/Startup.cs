using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Coravel;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Scheduling.zx;
using Wjsz.BaseExtensions.Entity;

namespace Scheduling
{
  public class Startup
  {
    /// <summary>
    /// 读取配置文件
    /// </summary>
    public IConfiguration Configuration { get; }
    /// <summary>
    /// 启动.net core
    /// </summary>
    public Startup(IConfiguration configuration)
    {
      Configuration = configuration;
    }
    // This method gets called by the runtime. Use this method to add services to the container.
    // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
    public void ConfigureServices(IServiceCollection services)
    {
      services.AddHttpClient();
      // 定时健康检查
      services.AddTransient<RunConsulScheduledTasks>();

      services.AddOptions().Configure<HealthSetting>(this.Configuration.GetSection("HealthSetting"));
      services.AddOptions().Configure<ConsulService>(this.Configuration.GetSection("ConsulService"));
      services.AddScheduler();
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }

      app.UseRouting();
      var provider = app.ApplicationServices;
      provider.UseScheduler(scheduler =>
      {
        scheduler.Schedule<RunConsulScheduledTasks>()
          .EverySeconds(15);
      });
      app.UseEndpoints(endpoints =>
      {
        endpoints.MapGet("/", async context => { await context.Response.WriteAsync("Hello World!"); });
      });
    }
  }
}