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
			//添加富文本
			this.CreateMap<AddEditorRequestDto, Editor>()
				.ForMember(f=>f.Banner,s=>s.MapFrom(o=> o.Banner != null ? o.Banner.WriteFromObject<Banner>() : null));
			// 富文本响应
			this.CreateMap<Editor, EditorResponseDto>()
				.ForMember(f => f.Key, s => s.MapFrom(o => o.Id))
				.ForMember(f=>f.Banner,s=>s.MapFrom(o=>!string.IsNullOrEmpty(o.Banner) ? o.Banner.ReadToObject<Banner>() : null));
		}
	}
}