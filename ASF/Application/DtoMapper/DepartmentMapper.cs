using System.Linq;
using ASF.Application.DTO.Department;
using ASF.Domain.Entities;
using AutoMapper;

namespace ASF.Application.DtoMapper
{
	/// <summary>
	/// 部门映射
	/// </summary>
	public class DepartmentMapper: Profile
	{
		/// <summary>
		/// 部门映射
		/// </summary>
		public DepartmentMapper()
		{
			//创建
			this.CreateMap<DepartmentCreateRequestDto, Department>();
			//修改
			this.CreateMap<DepartmentModifyRequestDto, Department>();
			//响应
			this.CreateMap<Department,DepartmentResponseDto>()
				.ForMember(f => f.Roles, s=> s.MapFrom(o => o.Role.Count != 0 ? o.Role.Select(a=> new
				{
					Id = a.Id,
					Name = a.Name,
					Enable = a.Enable,
					CreateId = a.CreateId,
					Description = a.Description,
					CreateTime = a.CreateTime
				}) : null))
				.ForMember(f => f.Accounts, s=> s.MapFrom(o => o.Accounts.Count != 0 ? o.Accounts.Select(a=> new
				{
					Id = a.Id,
					Name = a.Name,
					Username = a.Username,
					CreateId = a.CreateId,
					Sex = a.Sex,
					CreateTime = a.CreateTime
				}) : null));
		}
	}
}