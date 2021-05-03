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
		public EditorMapper()
		{
			// 添加咨询
			this.CreateMap<AddConcatRequestDto, Concat>();
			// 咨询联系响应
			this.CreateMap<Concat, ConcatResponseDto>();
			// 富文本响应
			this.CreateMap<Editor, EditorResponseDto>();
		}
	}
}