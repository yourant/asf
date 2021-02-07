namespace ASF.Application.DTO.Translate
{
	/// <summary>
	/// 多语言响应
	/// </summary>
	public class TranslateResponseDto: TranslateModifyRequestDto
	{
		/// <summary>
		/// 租户id
		/// </summary>
		public long? TenancyId { get; set; }
	}
}