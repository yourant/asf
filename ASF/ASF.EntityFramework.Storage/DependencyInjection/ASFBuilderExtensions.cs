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
            builder.Services.AddDbContext<RepositoryContext>(configureDbContext,ServiceLifetime.Transient);
            builder.Services.AddRepositories();
            return builder;
        }

        public static ASFBuilder AddDbContext(this ASFBuilder builder, Action<DbContextOptionsBuilder> configureDbContext, bool allowCenter)
        {
            // 是否使用第二个库
            if (allowCenter)
            {
                builder.AddDbContextCenter(configureDbContext);
            }
            else
            {
                builder.AddDbContext(configureDbContext);
            }
            return builder;
        }
        /// <summary>
        /// 第二个数据库
        /// </summary>
        /// <param name="builder"></param>
        /// <param name="configureDbContext"></param>
        /// <returns></returns>
        public static ASFBuilder AddDbContextCenter(this ASFBuilder builder, Action<DbContextOptionsBuilder> configureDbContext)
        {
            builder.Services.AddDbContext<CenterRepositoryContext>(configureDbContext,ServiceLifetime.Transient);
            return builder;
        }

        /// <summary>
        /// 注入仓储层
        /// </summary>
        /// <param name="services"></param>
        private static void AddRepositories(this IServiceCollection services)
        {
            // 基础仓储
            services.AddScoped<IAccountsRepository, AccountsRepository>();
            services.AddScoped<ITenancyRepository, TenancyRepository>();
            services.AddScoped<IPermissionsRepository,PermissionsRepository>();
            services.AddScoped<IApiRepository, ApiRepository>();
            services.AddScoped<ILoggingsRepository, LoggingsRepository>();
            services.AddScoped<ITranslateRepositories, TranslateRepositories>();
            services.AddScoped<IDepartmentRepositories, DepartmentRepositories>();
            services.AddScoped<IMenuRepositories, MenuRepositories>();
            services.AddScoped<IRoleRepositories,RoleRepositories>();
            services.AddScoped<IPostRepository, PostRepository>();
            services.AddScoped<ISecurityTokenRepository, SecurityTokenRepository>();
            services.AddScoped<IAsfDictionaryRepository, AsfDictionaryRepository>();
            services.AddScoped<IEditorRepository, EditorRepository>();
            services.AddScoped<IConcatRepositories, ConcatRepositories>();
            // 自定义扩展db仓储
            services.AddScoped<ICenterAccountsRepository, CenterAccountsRepository>();
        }
    }
}
