using System;
using System.Linq;
using System.Text.RegularExpressions;
using ASF.Application.DTO;
using ASF.Domain.Entities;
using AutoMapper;
using Zop.AspNetCore.Authentication.JwtBearer;

namespace ASF.Application.DtoMapper
{
    /// <summary>
    /// 账户映射
    /// </summary>
    public class AccountMapper : Profile
    {
        /// <summary>
        /// 账户映射
        /// </summary>
        public AccountMapper()
        {
        }
    }
}
