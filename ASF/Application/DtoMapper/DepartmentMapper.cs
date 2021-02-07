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
			this.CreateMap<DepartmentResponseDto, Department>();
		}
	}
}