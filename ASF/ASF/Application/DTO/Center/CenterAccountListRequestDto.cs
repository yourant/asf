namespace ASF.Application.DTO.Center
{
	/// <summary>
	/// center 账户列表请求
	/// </summary>
	public class CenterAccountListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 账户名称
		/// </summary>
		public string Name { get; set; }
	}
}