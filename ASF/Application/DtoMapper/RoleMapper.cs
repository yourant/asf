using System.Linq;
using ASF.Application.DTO.Role;
using ASF.Domain.Entities;
using AutoMapper;

namespace ASF.Application.DtoMapper
{
	/// <summary>
	/// 角色映射
	/// </summary>
	public class RoleMapper: Profile
	{
		/// <summary>
		/// 角色映射
		/// </summary>
		public RoleMapper()
		{
			// 创建
			this.CreateMap<RoleCreateRequestDto, Role>();
			// 修改
			this.CreateMap<RoleModifyRequestDto, Role>();
			//角色响应
			this.CreateMap<Role, RoleResponseDto>()
				.ForMember(f => f.AccountName, s => s.MapFrom(o => o.Account.Select(a => a.Username).ToList()))
				.ForMember(f => f.Department, s => s.MapFrom(o => o.Department.Count != 0 ? o.Department.Select(a => new
				{
					Id = a.Id,
					Name = a.Name,
					Enabled = a.Enabled,
					CreateTime = a.CreateTime
				}).ToList() : null))
				.ForMember(f => f.Permission, s => s.MapFrom(o => o.Permission.Count != 0 ? o.Permission.ToList() : null));
		}
	}
}