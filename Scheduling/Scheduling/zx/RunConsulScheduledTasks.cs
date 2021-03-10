using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Consul;
using Coravel.Invocable;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Wjsz.BaseExtensions.Entity;

namespace Scheduling.zx
{
  /// <summary>
  /// 健康检查定时任务
  /// </summary>
  public class RunConsulScheduledTasks: IInvocable
  {
    private readonly HttpClient _client;
    private ConsulService _consulService;
    private HealthSetting _healthSetting;
    private IHostApplicationLifetime _lifetime;
    public RunConsulScheduledTasks(IHttpClientFactory httpClientFactory, IOptions<ConsulService> consulService,IOptions<HealthSetting> healthSetting, IHostApplicationLifetime lifetime)
    {
      _consulService = consulService?.Value;
      _healthSetting = healthSetting?.Value;
      _client = httpClientFactory.CreateClient();
      _client.Timeout = TimeSpan.FromSeconds(100000);
      _client.DefaultRequestVersion = new Version(1, 0);
      _client.DefaultVersionPolicy = HttpVersionPolicy.RequestVersionExact;
      _lifetime = lifetime;
    }

    public async Task Invoke()
    {
      Console.WriteLine("健康检查心跳.");
      if (_healthSetting.HealthServices.Count > 0)
      {
        var consulClient = new ConsulClient(x =>
        {
          x.Address = new Uri($"http://{_consulService.Ip}:{_consulService.Port.ToString()}");
        });//请求注册的 Consul 地址
        foreach (HealthService item in _healthSetting.HealthServices)
        {
          if (item != null)
          {
            var httpCheck = new AgentServiceCheck()
            {
              // DeregisterCriticalServiceAfter = TimeSpan.FromSeconds(5),//服务启动多久后注册
              // Interval = TimeSpan.FromSeconds(10),//健康检查时间间隔，或者称为心跳间隔
              // HTTP = $"http://",//健康检查地址
              // Timeout = TimeSpan.FromSeconds(5)
              TTL = TimeSpan.FromDays(1000),
              Status = HealthStatus.Passing
            };
              
            // Register service with consul
            var registration = new AgentServiceRegistration()
            {
              Checks = new[] { httpCheck },
              ID = item.Name + "_" + item.Port.ToString(),
              Name = item.Name,
              Address = item.Ip,
              Port = item.Port,
              Tags = new[] { $"urlprefix-/{item.Name}" }//添加 urlprefix-/servicename 格式的 tag 标签，以便 Fabio 识别
            };
            try
            {
              HttpResponseMessage res =
                await _client.GetAsync($"http://{item.Ip}:{item.Port.ToString()}/health");
              if (res.StatusCode == HttpStatusCode.OK)
              {
                consulClient.Agent.ServiceRegister(registration).Wait();//服务启动时注册，内部实现其实就是使用 Consul API 进行注册（HttpClient发起）
                _lifetime.ApplicationStopping.Register(() =>
                {
                  consulClient.Agent.ServiceDeregister(registration.ID).Wait();//服务停止时取消注册
                });
              }
              else
              {
                consulClient.Agent.ServiceDeregister(registration.ID).Wait();
              }
            }
            catch (Exception e)
            {
              consulClient.Agent.ServiceDeregister(registration.ID).Wait();
            }
          }
        }
      }
      await Task.CompletedTask;
    }
  }
}