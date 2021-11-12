using ASF.DependencyInjection;
using AutoMapper.Configuration;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Reflection;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json.Serialization;

namespace Microsoft.Extensions.DependencyInjection
{
    /// <summary>
    /// 服务扩展
    /// </summary>
    public static class ServiceCollectionExtensions
    {

        /// <summary>
        /// 添加ASF框架
        /// </summary>
        /// <param name="services"></param>
        /// <param name="startupAction"></param>
        /// <returns></returns>
        public static IServiceCollection AddASF(this IServiceCollection services, Action<ASFBuilder> startupAction)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            //swagger
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "asf", Version = "v1" });

                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
                c.IncludeXmlComments(xmlPath);
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Type = SecuritySchemeType.Http,
                    Scheme = "bearer",
                    BearerFormat = "JWT"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer" }
                        },
                        new string[] { }
                    }
                });

            });
            services.AddMvcCore().AddApplicationPart(typeof(ASFBuilder).Assembly).AddApiExplorer();
            services.AddControllers(options =>
            {
                options.Filters.Add(new ValidationActionFilter()); // 添加全局请求拦截
                options.EnableEndpointRouting = false;
            }).AddNewtonsoftJson(opt =>
            {
                opt.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
                opt.SerializerSettings.NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore; //是否移除空值
                opt.SerializerSettings.Converters.Add(new MyUnixDateTimeConverter()); //统一时间戳转换
            });
            services.AddASFCore(startupAction);
            return services;
        }


        /// <summary>
        /// 添加ASF核心服务
        /// </summary>
        /// <param name="services"></param>
        /// <param name="startupAction">ASF启动配置函数</param>
        /// <returns></returns>
        internal static IServiceCollection AddASFCore(this IServiceCollection services, Action<ASFBuilder> startupAction)
        {
            ASFBuilder builder = new ASFBuilder(services);
            startupAction?.Invoke(builder);
            builder.Build();
            return services;
        }
    }
}
