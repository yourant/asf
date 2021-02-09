using ASF.Application.DTO.Post;
using ASF.Domain.Entities;
using AutoMapper;

namespace ASF.Application.DtoMapper
{
	/// <summary>
	/// 岗位映射
	/// </summary>
	public class PostMapper: Profile
	{
		/// <summary>
		/// 岗位映射
		/// </summary>
		public PostMapper()
		{
			//创建
			this.CreateMap<PostCreateRequestDto, Post>();
			//修改
			this.CreateMap<PostModifyRequestDto, Post>();
			//响应
			this.CreateMap<Post, PostResponseDto>();
		}
	}
}