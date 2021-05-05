using ASF.Application.DTO.Editor;
using ASF.Domain.Entities;
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
			// 富文本响应
			this.CreateMap<Editor, EditorResponseDto>()
				.ForMember(f=> f.NewContent, s=>s.MapFrom(o=>!string.IsNullOrEmpty(o.NewContent) ? o.NewContent : null));
		}
	}
}