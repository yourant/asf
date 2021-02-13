using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO;
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
		/// <summary>
		/// 账户控制器
		/// </summary>
		/// <param name="serviceProvider"></param>
		/// <param name="mapper"></param>
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
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var account = await _serviceProvider.GetRequiredService<AccountService>().GetAccountInfo(uid,tenancyId);
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
			AccountInfoResponseDto accountInfo = _mapper.Map<AccountInfoResponseDto>(account.Data);
			accountInfo.RoleName = string.Join(",", role);
			accountInfo.PermissionMenu = permissionMenuTreeItems;
			// AccountInfoResponseDto accountInfo = new AccountInfoResponseDto()
			// {
			// 	Id = account.Data.Id,
			// 	TenancyId = account.Data.TenancyId,
			// 	DepartmentId = account.Data.DepartmentId,
			// 	Name = account.Data.Name,
			// 	Username = account.Data.Username,
			// 	Telephone = account.Data.Telephone,
			// 	Email = account.Data.Email,
			// 	Sex = account.Data.Sex,
			// 	Avatar = account.Data.Avatar,
			// 	Status = account.Data.Status,
			// 	RoleName = string.Join(",",role),
			// 	PermissionMenu = permissionMenuTreeItems
			// };
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
		/// <summary>
		/// 获取账户列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<AccountResponseDto>> GetList([FromQuery] AccountListRequestDto dto)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = await _serviceProvider.GetRequiredService<AccountService>().GetList(dto.PageNo,dto.PageSize,dto.Username,dto.Telephone,dto.Email,dto.Sex,dto.Status,tenancyId);
			if (!data.Success)
				return ResultPagedList<AccountResponseDto>.ReFailure(data.Message, data.Status);
			return ResultPagedList<AccountResponseDto>.ReSuccess(_mapper.Map<List<AccountResponseDto>>(data.Data),
				data.TotalCount);
		}
		/// <summary>
		/// 获取账户详情
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<Result<AccountResponseDto>> Details([FromQuery] long id)
		{
			long? tenancyId = HttpContext.User.IsSuperRole() ? null : Convert.ToInt64(HttpContext.User.TenancyId());
			var result = await _serviceProvider.GetRequiredService<AccountService>().GetDetails(id,tenancyId);
			if (!result.Success)
				return Result<AccountResponseDto>.ReFailure(result.Message, result.Status);
			List<object> roles = new List<object>();
			if (result.Data.Department.Role != null && result.Data.Department.Role.Count > 0)
			{
				foreach (var value in result.Data.Department.Role.ToList())
				{
					roles.Add(new
					{
						Id = value.Id,
						Nmae = value.Name,
						Enable = value.Enable,
						Description = value.Description,
						CreateId = value.CreateId,
						CreateTime = value.CreateTime,
						TenancyId = value.TenancyId
					});
				}
			}

			if (result.Data.Role != null && result.Data.Role.Count > 0)
			{
				foreach (var value in result.Data.Role.ToList())
				{
					roles.Add(new
					{
						Id = value.Id,
						Nmae = value.Name,
						Enable = value.Enable,
						Description = value.Description,
						CreateId = value.CreateId,
						CreateTime = value.CreateTime,
						TenancyId = value.TenancyId
					});
				}
			}
			AccountResponseDto data = _mapper.Map<AccountResponseDto>(result.Data);
			data.Roles = roles;
			return Result<AccountResponseDto>.ReSuccess(data);
		}
		/// <summary>
		/// /c创建账户
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		public async Task<Result> Create([FromBody] AccountCreateRequestDto dto)
		{
			// 只有超级管理员才能选择租户创建
			long? tenancyId = HttpContext.User.IsSuperRole() ? dto.TenancyId : Convert.ToInt64(HttpContext.User.TenancyId());
			var data = _mapper.Map<Account>(dto);
			data.TenancyId = tenancyId;
			return await _serviceProvider.GetRequiredService<AccountService>().Create(data);
		}
	}
}