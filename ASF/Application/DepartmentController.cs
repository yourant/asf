using System;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;

namespace ASF.Application
{
	/// <summary>
	/// 部门控制器
	/// </summary>
	public class DepartmentController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// 部门控制器
		/// </summary>
		public DepartmentController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
	}
}