using System.IdentityModel.Tokens.Jwt;
using ASF.DependencyInjection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using ASF.Application.DtoMapper;
using Coravel;
using Ocelot.Middleware;
using Ocelot.DependencyInjection;
using Ocelot.Provider.Consul;

namespace ASF.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            // services.AddRazorPages();
            JwtSecurityTokenHandler.DefaultInboundClaimTypeMap.Clear();
            // services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer((AccessTokenOptions opt) =>
            // {
            //     opt.SecurityType = SecurityType.RsaSha512;
            // });
            //添加日志
            services.AddLogging();
            // httpclient 
            services.AddHttpClient();
            // 添加定时调度任务
            services.AddScheduler();
            //automapper
            services.AddAutoMapper(typeof(LoggerMapper).Assembly);
            // 跨域处理中间件
            services.AddCors(options => options.AddPolicy("CorsPolicy", builder =>
            {
                // string[] urls = Configuration.GetSection("AllowedCores").Value.Split(',');
                builder
                    .WithOrigins()
                    .SetIsOriginAllowed(orig => true)
                    .AllowAnyHeader()
                    .AllowAnyMethod()
                    .AllowCredentials();
            }));
            // 添加asf 服务
            services.AddASF(build =>
            {
                var asfOptions = Configuration.GetSection("ASF").Get<ASFOptions>();
                build.AddDbContext(b =>
                {
                    //处理各种db
                    switch (asfOptions.DBType.ToLower())
                    {
                        case "sqlite":
                            b.UseSqlite(asfOptions.DBConnectionString, opt =>
                            {
                                opt.MigrationsAssembly("ASF.Web");
                            });
                            break;
                        case "mysql":
                            b.UseMySql(asfOptions.DBConnectionString, ServerVersion.AutoDetect(asfOptions.DBConnectionString),
                                builder =>
                                {
                                    builder.MigrationsAssembly("ASF.Web");
                                });
                            b.EnableSensitiveDataLogging();
                            b.EnableDetailedErrors();
                            break;
                        case "sqlserver":
                            b.UseSqlServer(asfOptions.DBConnectionString, opt =>
                            {
                                opt.MigrationsAssembly("ASF.Web");
                            });
                            break;
                        case "postgre":
                            b.UseNpgsql(asfOptions.DBConnectionString, opt =>
                            {
                                opt.MigrationsAssembly("ASF.Web");
                            });
                            break;
                    }
                });
                //使用第二个db
                build.AddDbContextCenter(b =>
                {
                    //处理各种db
                    switch (asfOptions.CenterDBType.ToLower())
                    {
                        case "sqlite":
                            b.UseSqlite(asfOptions.CenterDBConnectionString, opt =>
                            {
                                opt.MigrationsAssembly("ASF.Web");
                            });
                            break;
                        case "mysql":
                            b.UseMySql(asfOptions.CenterDBConnectionString, ServerVersion.AutoDetect(asfOptions.DBConnectionString),
                                builder =>
                                {
                                    builder.MigrationsAssembly("ASF.Web");
                                });
                            b.EnableSensitiveDataLogging();
                            b.EnableDetailedErrors();
                            break;
                        case "sqlserver":
                            b.UseSqlServer(asfOptions.CenterDBConnectionString);
                            break;
                        case "postgre":
                            b.UseNpgsql(asfOptions.CenterDBConnectionString, opt =>
                            {
                                opt.MigrationsAssembly("ASF.Web");
                            });
                            break;
                    }
                });
            });
            //网关服务
            services.AddOcelot().AddConsul();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                // app.UseDeveloperExceptionPage();
                app.UseSwaggerUI(c =>
                {
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "asf API");
                    //c.RoutePrefix = "";
                });
            }
            app.UseStaticFiles();
            app.UseCors("CorsPolicy");
            
            // app.ASFInitDatabase();
            app.UseASF();
            
            app.UseOcelot().Wait();


        }
    }
}
