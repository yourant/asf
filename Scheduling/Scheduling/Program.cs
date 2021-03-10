using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Scheduling
{
  public class Program
  {
    /// <summary>
    /// 入口
    /// </summary>
    public static void Main(string[] args)
    {
      AppContext.SetSwitch(
        "System.Net.Http.SocketsHttpHandler.Http2UnencryptedSupport", true);
      BuildWebHost(args).Run();
    }
    /// <summary>
    /// host
    /// </summary>
    public static IWebHost BuildWebHost(string[] args)
    {
      // 默认5000端口
      string port = "6500";
      // 通过启动参数改变监听端口
      if (args.Length > 0 && int.TryParse(args[0], out _))
        port = args[0];
      // 此处因为不需要往下传递命令行参数，故去除
      return WebHost.CreateDefaultBuilder()
        .UseStartup<Startup>()
        .UseUrls($"http://*:{port}")
        .Build();
    }
  }
}