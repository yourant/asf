using System;
using System.Linq;
using System.Text.RegularExpressions;
using ASF.Application.DTO;
using ASF.Domain.Entities;
using AutoMapper;

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
            // 账户权限菜单等响应
            this.CreateMap<Account, AccountInfoResponseDto>();
        }
    }
}
