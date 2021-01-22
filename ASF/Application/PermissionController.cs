using System;
using System.Threading.Tasks;
using ASF.Internal.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ASF.Application
{
	/// <summary>
	/// 权限控制器 只有超级管理员才能有权限控制
	/// </summary>
	[Authorize(Roles = "superadmin")]
	[Route("[controller]/[action]")]
	public class PermissionController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		public PermissionController(IServiceProvider serviceProvider)
		{
			_serviceProvider = serviceProvider;
		}
	}
}