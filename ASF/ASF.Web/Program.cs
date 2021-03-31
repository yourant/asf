using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace ASF.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    string port = "5000";
                    string realPath = Directory.GetParent(System.Reflection.Assembly.GetExecutingAssembly().Location)?.FullName;
                    webBuilder.ConfigureAppConfiguration((hostingContext, config) => 
                    {
                        config
                            .SetBasePath(realPath)
                             // .SetBasePath(hostingContext.HostingEnvironment.ContentRootPath)
                             .AddJsonFile("appsettings.json", true, true)
                             .AddJsonFile($"appsettings.{hostingContext.HostingEnvironment.EnvironmentName}.json", true, true)
                             .AddJsonFile("ocelot.json", false, true)
                             .AddEnvironmentVariables();
                    }).ConfigureLogging((hostingContext,logging)=> 
                    {
                        logging.AddConfiguration(hostingContext.Configuration.GetSection("Logging"));
                        logging.AddConsole();
                        logging.AddDebug();
                    });
                    webBuilder.UseUrls($"http://*:{port}").UseStartup<Startup>();
                });
    }
}