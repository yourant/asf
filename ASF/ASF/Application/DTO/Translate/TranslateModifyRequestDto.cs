namespace ASF.Application.DTO.Translate
{
	/// <summary>
	/// 修改多语言
	/// </summary>
	public class TranslateModifyRequestDto: TranslateCreateRequestDto
	{
		/// <summary>
		/// 多语言id
		/// </summary>
		public long Id { get; set; }
	}
}