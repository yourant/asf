using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Domain;
using ASF.Domain.Entities;
using ASF.Domain.Services;
using ASF.Internal.Results;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
	/// <summary>
	/// 账户控制器
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class AccountController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		public AccountController(IServiceProvider serviceProvider, IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取账户登录信息
		/// </summary>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<AccountInfoResponseDto>> AccountInfo()
		{
			long uid = HttpContext.User.UserId(); 
			var account = await _serviceProvider.GetRequiredService<AccountService>().GetAccountInfo(uid);
			if (!account.Success)
				return Result<AccountInfoResponseDto>.ReFailure(account.Message, account.Status);
			// 权限id 集合
			List<long> permissionIds = new List<long>();
			List<string> role = new List<string>();
			// 遍历部门角色权限
			if (account.Data.Department != null && account.Data.Department.Role.Count != 0)
			{
				foreach (var item in account.Data.Department.Role.ToList())
				{
					role.Add(item.Name);
					permissionIds.AddRange(item.Permission.Select(s => s.Id));
				}
			}
			// 遍历账户角色权限
			if (account.Data.Role.Count != 0)
			{
				foreach (var item in account.Data.Role.ToList())
				{
					// 判断角色重叠不添加
					if(!role.Any(f => f.Equals(item.Name)))
						role.Add(item.Name);
					permissionIds.AddRange(item.Permission.Select(s => s.Id));
				}
			}
			// 权限去重
			permissionIds = permissionIds.Union(permissionIds).ToList();
			var permissionList= await _serviceProvider.GetRequiredService<PermissionService>().GetPermissionListAsync(permissionIds);
			if (!permissionList.Success)
				return Result<AccountInfoResponseDto>.ReFailure(permissionList.Message,permissionList.Status);
			// 权限菜单分级
			List<PermissionMenuTreeItem<PermissionMenuInfoResponseDto>> permissionMenuTreeItems = TreeSortMultiLevelFormat(_mapper.Map<List<PermissionMenuInfoResponseDto>>(permissionList.Data)).ToList();
			AccountInfoResponseDto accountInfo = new AccountInfoResponseDto()
			{
				Id = account.Data.Id,
				TenancyId = account.Data.TenancyId,
				DepartmentId = account.Data.DepartmentId,
				Name = account.Data.Name,
				Username = account.Data.Username,
				Telephone = account.Data.Telephone,
				Email = account.Data.Email,
				Sex = account.Data.Sex,
				Avatar = account.Data.Avatar,
				Status = (uint)account.Status,
				RoleName = string.Join(",",role),
				PermissionMenu = permissionMenuTreeItems
			};
			return Result<AccountInfoResponseDto>.ReSuccess(accountInfo);
		}
		/// <summary>
		/// 无限分级权限菜单
		/// </summary>
		/// <param name="list"></param>
		/// <param name="pid"></param>
		/// <returns></returns>
		private IEnumerable<PermissionMenuTreeItem<PermissionMenuInfoResponseDto>> TreeSortMultiLevelFormat(
			IEnumerable<PermissionMenuInfoResponseDto> list, long pid = 0)
		{
			foreach (var item in list.Where(x => x.ParentId == pid))
			{
				yield return new PermissionMenuTreeItem<PermissionMenuInfoResponseDto>
				{
					Id = item.Id,
					Name = item.Name,
					Code = item.Code,
					ParentId = item.ParentId,
					Type = item.Type,
					IsSystem = item.IsSystem,
					Description = item.Description,
					Sort = item.Sort,
					Enable = item.Enable,
					CreateTime = item.CreateTime,
					Title = item.Title,
					Subtitle = item.Subtitle,
					Icon = item.Icon,
					MenuHidden = item.MenuHidden,
					MenuUrl = item.MenuUrl,
					MenuRedirect = item.MenuRedirect,
					ExternalLink = item.ExternalLink,
					PermissionDescription = item.PermissionDescription,
					Translate = item.Translate,
					Actions = item.Actions,
					Children = TreeSortMultiLevelFormat(list, item.Id)
				};
			}
		}
	}
}