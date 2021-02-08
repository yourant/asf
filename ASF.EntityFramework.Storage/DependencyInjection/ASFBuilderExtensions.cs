using ASF;
using ASF.DependencyInjection;
using ASF.EntityFramework.Repository;
using ASF.Infrastructure.Repositories;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using ASF.Domain.Entities;

namespace Microsoft.Extensions.DependencyInjection
{
    public static class ASFBuilderExtensions
    {
        public static ASFBuilder AddDbContext(this ASFBuilder builder, Action<DbContextOptionsBuilder> configureDbContext)
        {
            builder.Services.AddDbContext<RepositoryContext>(configureDbContext);
            builder.Services.AddRepositories();
            return builder;
        }

        public static ASFBuilder AddDbContext(this ASFBuilder builder, Action<DbContextOptionsBuilder> configureDbContext, bool allowCache)
        {
            if (allowCache)
            {
                builder.AddDbContextCache(configureDbContext);
            }
            else
            {
                builder.AddDbContext(configureDbContext);
            }
            return builder;
        }
        public static ASFBuilder AddDbContextCache(this ASFBuilder builder, Action<DbContextOptionsBuilder> configureDbContext)
        {
            builder.Services.AddDbContext<RepositoryContext>(configureDbContext);
            builder.AddRepositoriesCache();
            return builder;
        }
        // /// <summary>
        // /// 初始化 Database 方法
        // /// </summary>
        // /// <typeparam name="TContext"></typeparam>
        // /// <param name="build">ocelot config</param>
        // /// <param name="sedder"></param>
        // /// <returns></returns>
        // public static IApplicationBuilder ASFInitDatabase(this IApplicationBuilder build)
        // {
        //     //创建数据库实例在本区域有效
        //     using (var scope = build.ApplicationServices.CreateScope())
        //     {
        //         var services = scope.ServiceProvider;
        //         var logger = services.GetRequiredService<ILogger<RepositoryContext>>();
        //         var context = services.GetService<RepositoryContext>();
        //         try
        //         {
        //             new InitializeMigrationData( services, context).Migration();
        //             logger.LogInformation($"执行初始化 Database 数据 {typeof(RepositoryContext).Name} seed 成功");
        //         }
        //         catch (Exception ex)
        //         {
        //             logger.LogError(ex, $"执行初始化 Database 数据 {typeof(RepositoryContext).Name}  seed失败");
        //         }
        //     }
        //     return build;
        // }

        /// <summary>
        /// 注入仓储层
        /// </summary>
        /// <param name="builder"></param>
        private static void AddRepositories(this IServiceCollection services)
        {
            // 新仓储
            services.AddScoped<IAccountsRepository, AccountsRepository>();
            services.AddScoped<ITenancyRepository, TenancyRepository>();
            services.AddScoped<IPermissionsRepository,PermissionsRepository>();
            services.AddScoped<IApiRepository, ApiRepository>();
            services.AddScoped<ILoggingsRepository, LoggingsRepository>();
            services.AddScoped<ITranslateRepositories, TranslateRepositories>();
            services.AddScoped<IDepartmentRepositories, DepartmentRepositories>();
            services.AddScoped<IMenuRepositories, MenuRepositories>();
            services.AddScoped<IRoleRepositories,RoleRepositories>();
        }
        /// <summary>
        /// 注入缓存仓储层
        /// </summary>
        /// <param name="builder"></param>
        private static void AddRepositoriesCache(this ASFBuilder builder)
        {
            // builder.AddAccountRepositoryCache<AccountRepository>();
        }
    }
}
