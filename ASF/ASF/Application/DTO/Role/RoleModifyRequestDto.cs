namespace ASF.Application.DTO.Role
{
	/// <summary>
	/// 修改角色请求
	/// </summary>
	public class RoleModifyRequestDto: RoleCreateRequestDto
	{
		/// <summary>
		/// 角色id
		/// </summary>
		public long Id { get; set; }
	}
}