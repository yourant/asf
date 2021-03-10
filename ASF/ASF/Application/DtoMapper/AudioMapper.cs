using ASF.Domain.Entities;
using AutoMapper;

namespace ASF.Application.DtoMapper
{
	/// <summary>
	/// 审计日志映射
	/// </summary>
	public class AudioMapper: Profile
	{
		/// <summary>
		/// 审计日志映射
		/// </summary>
		public AudioMapper()
		{
			this.CreateMap<LogInfo, AudioMapper>();
		}
	}
}