namespace ASF.Application.DTO.Tenancy
{
	/// <summary>
	/// 修改租户
	/// </summary>
	public class TenancyModifyRequestDto:TenancyCreateRequestDto
	{
		/// <summary>
		/// 租户id
		/// </summary>
		public long Id { get; set; }
	}
}