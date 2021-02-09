using System.IdentityModel.Tokens.Jwt;
using ASF.DependencyInjection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Zop.AspNetCore.Authentication.JwtBearer;
using AutoMapper;
using ASF.Application.DtoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Ocelot.Middleware;
using Ocelot.DependencyInjection;

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
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer((AccessTokenOptions opt) =>
            {
                opt.SecurityType = SecurityType.RsaSha512;
            });
            //automapper
            services.AddAutoMapper(typeof(LoggerMapper).Assembly);
            
            services.AddASF(build =>
            {
                var asfOptions = Configuration.GetSection("ASF").Get<ASFOptions>();
                build.AddDbContext(b =>
                {
                    switch (asfOptions.DBType.ToLower())
                    {
                        case "sqlite":
                            b.UseSqlite(asfOptions.DBConnectionString);
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
                            b.UseSqlServer(asfOptions.DBConnectionString);
                            break;
                    }
                });

            });

            //网关服务
            services.AddOcelot();
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
            // app.ASFInitDatabase();
            //token 黑名单
            app.UseMiddleware<AuthorizationTokenSecurityPolicy>();
            app.UseASF();
            
            app.UseOcelot().Wait();


        }
    }
}
