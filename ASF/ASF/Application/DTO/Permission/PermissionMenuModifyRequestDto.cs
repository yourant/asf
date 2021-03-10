namespace ASF.Application.DTO
{
	/// <summary>
	/// 修改权限菜单
	/// </summary>
	public class PermissionMenuModifyRequestDto: PermissionMenuCreateRequestDto
	{
		/// <summary>
		/// 唯一标示
		/// </summary>
		public long Id { get;  set; }
	}
}