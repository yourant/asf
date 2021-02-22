using ASF.Domain.Services;
using ASF.Infrastructure.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authorization.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;
using ASF.Application.DtoMapper;
using ASF;
using ASF.Internal.Security;
using Coravel;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;

namespace ASF.DependencyInjection
{
    /// <summary>
    /// asf 服务
    /// </summary>
    public class ASFBuilder
    {
        /// <summary>
        /// 服务集合
        /// </summary>
        public IServiceCollection Services { get; }
        /// <summary>
        /// asf 服务
        /// </summary>
        /// <param name="services"></param>
        public ASFBuilder(IServiceCollection services)
        {
            this.Services = services;
        }
        /// <summary>
        /// 编译服务
        /// </summary>
        public void Build()
        {
            Services.AddMemoryCache();

            this.AddDomainServices();
            this.AddAuthorization();
            this.AddScheduledTasks();
        }

        /// <summary>
        /// 添加授权
        /// </summary>
        private void AddAuthorization()
        {
            this.Services.AddAuthorization(opt =>
            {
                opt.AddPolicy(JwtBearerDefaults.AuthenticationScheme, new AuthorizationPolicyBuilder()
                    .AddAuthenticationSchemes(JwtBearerDefaults.AuthenticationScheme)
                    .RequireAuthenticatedUser()
                    .Build());
                // opt.DefaultPolicy = new AuthorizationPolicyBuilder().AddRequirements(new OperationAuthorizationRequirement()).Build();
            }).AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, jwtBearerOptions =>
                {
                    jwtBearerOptions.SaveToken = true;
                    jwtBearerOptions.RequireHttpsMetadata = false;
                    jwtBearerOptions.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = RSA.RSAPublicKey,
                        ValidateIssuer = true,
                        ValidIssuer = "asf",
                        ValidateAudience = true,
                        ValidAudience = "asf",
                        ValidateLifetime = true,
                        ClockSkew = TimeSpan.Zero,
                        RequireExpirationTime = true
                    };
                });;
        }
        /// <summary>
        /// 添加领域服务
        /// </summary>
        private void AddDomainServices()
        {
            Services.AddTransient<AccountAuthorizationService>();
            Services.AddTransient<LoggerService>();
            Services.AddTransient<IAccountLoginService, AccountLoginService>();
            Services.AddTransient<AccountService>();
            Services.AddTransient<PermissionService>();
            Services.AddTransient<ApiService>();
            Services.AddTransient<MenuService>();
            Services.AddTransient<TranslateService>();
            Services.AddTransient<TenancyService>();
            Services.AddTransient<DepartmentService>();
            Services.AddTransient<RoleService>();
            Services.AddTransient<PostService>();
        }
        // /// <summary>
        // /// 添加账户仓储缓存
        // /// </summary>
        // /// <typeparam name="T"></typeparam>
        // /// <returns></returns>
        // public ASFBuilder AddAccountRepositoryCache<T>()
        //     where T : IAccountRepository
        // {
        //     Services.AddTransient(typeof(T));
        //     Services.AddTransient<IAccountRepository, CachingAccountRepository<T>>();
        //     return this;
        // }
        
        /// <summary>
        /// 添加调度任务
        /// </summary>
        public void AddScheduledTasks()
        {
            
            this.Services.AddScheduler();
        }
    }
}
