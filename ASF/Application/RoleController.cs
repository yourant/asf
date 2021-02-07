using System;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ASF.Application
{
	/// <summary>
	/// 角色控制器
	/// </summary>
	[Authorize]
	public class RoleController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 角色控制器
		/// </summary>
		/// <param name="serviceProvider"></param>
		/// <param name="mapper"></param>
		public RoleController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		
	}
}