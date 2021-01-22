namespace ASF.Application.DTO
{
	/// <summary>
	/// 修改权限
	/// </summary>
	public class PermissionModifyRequestDto: PermissionCreateRequestDto
	{
		/// <summary>
		/// 权限id
		/// </summary>
		public long Id { get; set; }
	}
}