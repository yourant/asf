namespace ASF.Application.DTO
{
	/// <summary>
	/// 分页请求
	/// </summary>
	public class PaginationRequestDto
	{
		/// <summary>
		/// 页数 不传默认为1
		/// </summary>
		public int PageNo { get; set; } = 1;
		/// <summary>
		/// 每页条数 不传默认每页20 条
		/// </summary>
		public int PageSize { get; set; } = 20;
	}
}