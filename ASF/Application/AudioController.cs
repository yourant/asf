using System;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ASF.Application
{
	/// <summary>
	/// 审计控制器
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class AudioController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 审计控制器
		/// </summary>
		public AudioController(IServiceProvider serviceProvider,IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
	}
}