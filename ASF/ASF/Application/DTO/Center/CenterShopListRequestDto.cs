namespace ASF.Application.DTO.Center
{
	/// <summary>
	/// 商户列表请求
	/// </summary>
	public class CenterShopListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 商户名称
		/// </summary>
		public string Name { get; set; }
	}
}