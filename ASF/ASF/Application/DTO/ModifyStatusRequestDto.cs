namespace ASF.Application.DTO
{
	/// <summary>
	/// 修改状态
	/// </summary>
	public class ModifyStatusRequestDto
	{
		/// <summary>
		/// id
		/// </summary>
		public long Id { get; set; }
		/// <summary>
		/// 状态
		/// </summary>
		public uint Status { get; set; }
	}
}