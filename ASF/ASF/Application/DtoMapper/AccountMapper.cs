using System.Linq;
using ASF.Application.DTO;
using ASF.Domain.Entities;
using ASF.Domain.Values;
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
            //创建账户
            this.CreateMap<AccountCreateRequestDto, Account>()
                .ForMember(f => f.TelPhone, s => s.MapFrom(o=>new PhoneNumber(o.TelPhone,o.Area)));
            // 修改账户
            this.CreateMap<AccountModifyRequestDto, Account>()
                .ForMember(f => f.TelPhone, s => s.MapFrom(o=>new PhoneNumber(o.TelPhone,o.Area)));
            // 账户响应数据
            this.CreateMap<Account, AccountResponseDto>()
                .ForMember(f => f.Key, s => s.MapFrom(o => o.Id))
            .ForMember(f => f.Department, s => s.MapFrom(o => o.Department != null
                ? new
                {
                    Id = o.Department.Id,
                    Pid = o.Department.Pid,
                    TenancyId = o.Department.TenancyId,
                    Name = o.Department.Name,
                    Enabled = o.Department.Enabled,
                    Sort = o.Department.Sort,
                    CreateTime = o.Department.CreateTime
                }
                : null))
            .ForMember(f => f.Posts, s => s.MapFrom(o => o.Post.Count > 0
                ? o.Post.Select(a => new
                {
                    Id = a.Id,
                    TenancyId = a.TenancyId,
                    Name = a.Name,
                    Enabled = a.Enabled,
                    Sort = a.Sort,
                    CreateTime = a.CreateTime,
                    CreateId = a.CreateId,
                    Description = a.Description
                })
                : null))
            .ForMember(f => f.Tenancys, s => s.MapFrom(o => o.Tenancys != null
                ? new
                {
                    Id = o.Tenancys.Id,
                    Name = o.Tenancys.Name,
                    Status = o.Tenancys.Status,
                    Sort = o.Tenancys.Sort,
                    CreateTime = o.Tenancys.CreateTime,
                    CreateId = o.Tenancys.CreateId,
                    IsDeleted = o.Tenancys.IsDeleted
                }
                : null));
        }
    }
}
