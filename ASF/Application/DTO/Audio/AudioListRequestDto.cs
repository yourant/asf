namespace ASF.Application.DTO.Audio
{
	/// <summary>
	/// 审计分页请求
	/// </summary>
	public class AudioListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 操作账户名
		/// </summary>
		public string AccountName { get; set; }
	}
}