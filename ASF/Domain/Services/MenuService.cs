using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 权限菜单领域服务
	/// </summary>
	public class MenuService
	{
		private readonly IMenuRepositories _menuRepositories;
		private readonly IUnitOfWork _unitOfWork;

		public MenuService(IMenuRepositories menuRepositories, IUnitOfWork unitOfWork)
		{
			_menuRepositories = menuRepositories;
			_unitOfWork = unitOfWork;
		}
		/// <summary>
		/// 获取权限菜单
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public async Task<Result<PermissionMenu>> Get(long id)
		{
			PermissionMenu permissionMenu = await _menuRepositories.GetPermissionMenuAsync(id);
			if(permissionMenu == null)
				return Result<PermissionMenu>.ReFailure(ResultCodes.PermissionMenuNotExist);
			return Result<PermissionMenu>.ReSuccess(permissionMenu);
		}
		/// <summary>
		/// 获取所有权限菜单集合
		/// </summary>
		/// <returns></returns>
		public async Task<ResultList<PermissionMenu>> GetList()
		{
			IEnumerable<PermissionMenu> list = await _menuRepositories.GetEntities(f => f.Id != 0);
			if(list == null)
				return ResultList<PermissionMenu>.ReFailure(ResultCodes.PermissionMenuNotExist);
			return ResultList<PermissionMenu>.ReSuccess(list.ToList());
		}

		public async Task<ResultPagedList<PermissionMenu>> GetList(int pageNo, int pageSize, long? permissionId = null,
			string title = "", string menuUrl = "")
		{
			// 查找对应权限菜单标题
			if (permissionId != null && !string.IsNullOrEmpty(title))
			{
				var (list, total) = await _menuRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId && f.Title.Equals(title));
				return ResultPagedList<PermissionMenu>.ReSuccess(list,total);
			}
			// 查找对应权限菜单地址
			if (permissionId != null && !string.IsNullOrEmpty(menuUrl))
			{
				var (list, total) = await _menuRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId && f.MenuUrl.Equals(menuUrl));
				return ResultPagedList<PermissionMenu>.ReSuccess(list,total);
			}
			// 查找对应权限
			if (permissionId != null)
			{
				var (list, total) = await _menuRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.PermissionId == permissionId);
				return ResultPagedList<PermissionMenu>.ReSuccess(list,total);
			}
			// 查找权限菜单标题
			if (!string.IsNullOrEmpty(title))
			{
				var (list, total) = await _menuRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Title.Equals(title));
				return ResultPagedList<PermissionMenu>.ReSuccess(list,total);
			}
			// 查找权限菜单地址
			if ( !string.IsNullOrEmpty(menuUrl))
			{
				var (list, total) = await _menuRepositories.GetEntitiesForPaging(pageNo, pageSize,
					f => f.MenuUrl.Equals(menuUrl));
				return ResultPagedList<PermissionMenu>.ReSuccess(list,total);
			}
			
			var (data, totalCount) = await _menuRepositories.GetEntitiesForPaging(pageNo, pageSize,
				f => f.MenuUrl.Equals(menuUrl));
			return ResultPagedList<PermissionMenu>.ReSuccess(data,totalCount);
		}
		/// <summary>
		/// 创建权限菜单
		/// </summary>
		/// <param name="permissionMenu"></param>
		/// <returns></returns>
		public async Task<Result> Create(PermissionMenu permissionMenu)
		{
			// 判断权限菜单标题或地址是否重复了
			if (await _menuRepositories.GetEntities(f =>
				f.Title.Equals(permissionMenu.Title) || f.MenuUrl.Equals(permissionMenu.MenuUrl)) != null)
				return Result.ReFailure(ResultCodes.PermissionMenuTitleOrUrlExist);
			// 添加权限菜单
			bool isAdd = await _menuRepositories.Add(permissionMenu);
			if (!isAdd)
			{
				await _unitOfWork.CommitAsync(true);
				return Result.ReFailure(ResultCodes.PermissionMenuCreateError);
			}

			return Result.ReSuccess();
		}
		/// <summary>
		/// 修改权限菜单
		/// </summary>
		/// <param name="permissionMenu"></param>
		/// <returns></returns>
		public async Task<Result> Modify(PermissionMenu permissionMenu)
		{
			bool isUpdate = await _menuRepositories.Update(permissionMenu);
			if (!isUpdate)
			{
				await _unitOfWork.CommitAsync(true);
				return Result.ReFailure(ResultCodes.PermissionMenuUpdateError);
			}
			
			return Result.ReSuccess();
		}
		/// <summary>
		/// 删除权限菜单
		/// </summary>
		/// <param name="permissionMenu"></param>
		/// <returns></returns>
		public async Task<Result> Delete(PermissionMenu permissionMenu)
		{
			bool isDelete = await _menuRepositories.Delete(permissionMenu);
			if (!isDelete)
			{
				await _unitOfWork.CommitAsync(true);
				return Result.ReFailure(ResultCodes.PermissionMenuDeleteError);
			}
			
			return Result.ReSuccess();
		}
	}
}