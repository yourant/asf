namespace ASF.Application.DTO.Post
{
	/// <summary>
	/// 修改岗位
	/// </summary>
	public class PostModifyRequestDto: PostCreateRequestDto
	{
		/// <summary>
		/// 岗位id
		/// </summary>
		public long Id { get; set; }
	}
}