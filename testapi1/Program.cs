using System;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace testapi1
{
    public class Program
    {
        /// <summary>
        /// 入口
        /// </summary>
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
        }
        /// <summary>
        /// host
        /// </summary>
        public static IWebHost BuildWebHost(string[] args)
        {
            // 默认5000端口
            string port = "5001";
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
