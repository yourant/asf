﻿using ASF.Domain.Services;
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
using Coravel;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace ASF.DependencyInjection
{
    public class ASFBuilder
    {
        public IServiceCollection Services { get; }

        public ASFBuilder(IServiceCollection services)
        {
            this.Services = services;
        }
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
            });
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

        }
        /// <summary>
        /// 添加账户仓储缓存
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
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
