namespace ASF.Application.DTO.Center
{
	/// <summary>
	/// 应用列表请求
	/// </summary>
	public class CenterProgramListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 商户名称
		/// </summary>
		public string Name { get; set; }
	}
}