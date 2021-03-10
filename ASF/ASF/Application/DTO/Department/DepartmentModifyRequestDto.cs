namespace ASF.Application.DTO.Department
{
	/// <summary>
	/// 修改部门
	/// </summary>
	public class DepartmentModifyRequestDto: DepartmentCreateRequestDto
	{
		/// <summary>
		/// 部门id
		/// </summary>
		public long Id { get; set; }
	}
}