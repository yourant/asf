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
                .AddJwtBearer(jwtBearerOptions =>
                {
                    jwtBearerOptions.TokenValidationParameters = new TokenValidationParameters
                    {
                        // 签收者用公钥对JWT进行认证，如果直接给一个私钥，则框架会生成相应的公钥去认证
                        // 参考资料https://stackoverflow.com/questions/39239051/rs256-vs-hs256-whats-the-difference
                        IssuerSigningKey = RSA.RSAPublicKey,
                        ValidAudience = "asf",
                        ValidIssuer = "asf",

                        // When receiving a token, check that we've signed it.
                        ValidateIssuerSigningKey = true,

                        // When receiving a token, check that it is still valid.
                        ValidateLifetime = true,

                        // This defines the maximum allowable clock skew - i.e. provides a tolerance on the token expiry time 
                        // when validating the lifetime. As we're creating the tokens locally and validating them on the same 
                        // machines which should have synchronised time, this can be set to zero. Where external tokens are
                        // used, some leeway here could be useful.
                        ClockSkew = TimeSpan.FromMinutes(0)
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
