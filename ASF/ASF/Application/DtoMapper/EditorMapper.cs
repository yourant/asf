using ASF.Application.DTO.Editor;
using ASF.Domain.Entities;
using ASF.Internal.Security;
using AutoMapper;

namespace ASF.Application.DtoMapper
{
	/// <summary>
	/// 富文本映射
	/// </summary>
	public class EditorMapper: Profile
	{
		/// <summary>
		/// 富文本映射
		/// </summary>	
		public EditorMapper()
		{
			// 添加咨询
			this.CreateMap<AddConcatRequestDto, Concat>();
			// 咨询联系响应
			this.CreateMap<Concat, ConcatResponseDto>();
			this.CreateMap<Editor, EditorTitleListResponseDto>();
			// 富文本响应
			this.CreateMap<Editor, EditorResponseDto>()
				.ForMember(f=>f.Banner,s=>s.MapFrom(o=>o.Banner.ReadToObject<Banner>()));
		}
	}
}