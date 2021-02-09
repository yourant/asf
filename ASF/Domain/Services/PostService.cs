using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Domain.Values;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 岗位领域服务
	/// </summary>
	public class PostService
	{
		private readonly IPostRepository _postRepository;
		/// <summary>
		/// 岗位领域服务
		/// </summary>
		public PostService(IPostRepository postRepository)
		{
			_postRepository = postRepository;
		}
		/// <summary>
		/// 获取岗位详情
		/// </summary>
		/// <param name="id"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<Result<Post>> Get(long id, long? tenancyId = null)
		{
			if (tenancyId != null)
			{
				Post p = await _postRepository.GetEntity(f => f.Id == id && f.TenancyId == tenancyId);
				if(p == null)
					return Result<Post>.ReFailure(ResultCodes.PostNotExist);
				if (p.Enabled != null && (EnabledType) p.Enabled == EnabledType.Disabled)
					return Result<Post>.ReFailure(ResultCodes.PostUnavailable);
				return Result<Post>.ReSuccess(p);
			}

			Post post = await _postRepository.GetEntity(f => f.Id == id);
			if(post == null)
				return Result<Post>.ReFailure(ResultCodes.PostNotExist);
			return Result<Post>.ReSuccess(post);
		}
		/// <summary>
		/// 获取岗位列表
		/// </summary>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<ResultList<Post>> GetList(long? tenancyId = null)
		{
			if (tenancyId == null)
			{
				IEnumerable<Post> l = await _postRepository.GetEntities(f => f.Id != 0);
				return ResultList<Post>.ReSuccess(l.ToList());
			}
			IEnumerable<Post> list = await _postRepository.GetEntities(f => f.Id != 0 && f.TenancyId == tenancyId);
			return ResultList<Post>.ReSuccess(list.ToList());
		}
		/// <summary>
		/// 获取岗位分页
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="name"></param>
		/// <param name="enable"></param>
		/// <param name="tenancyId"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<Post>> GetList(int pageNo, int pageSize, string name, long? enable = null,long? tenancyId = null)
		{
			if (!string.IsNullOrEmpty(name) && enable != null && tenancyId != null)
			{
				var (list, total) = await _postRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Name.Equals(name) && f.Enabled == enable && f.TenancyId == tenancyId);
				return ResultPagedList<Post>.ReSuccess(list,total);
			}
			if (!string.IsNullOrEmpty(name) && tenancyId != null)
			{
				var (list, total) = await _postRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Name.Equals(name) && f.TenancyId == tenancyId);
				return ResultPagedList<Post>.ReSuccess(list,total);
			}
			if (enable != null && tenancyId != null)
			{
				var (list, total) = await _postRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Enabled == enable && f.TenancyId == tenancyId);
				return ResultPagedList<Post>.ReSuccess(list,total);
			}
			if (tenancyId != null)
			{
				var (list, total) = await _postRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.TenancyId == tenancyId);
				return ResultPagedList<Post>.ReSuccess(list,total);
			}
			if (!string.IsNullOrEmpty(name))
			{
				var (list, total) = await _postRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Name.Equals(name));
				return ResultPagedList<Post>.ReSuccess(list,total);
			}
			if (enable != null)
			{
				var (list, total) = await _postRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Enabled == enable);
				return ResultPagedList<Post>.ReSuccess(list,total);
			}
			
			var (data, totalCount) = await _postRepository.GetEntitiesForPaging(pageNo, pageSize,
				f => f.Id != 0);
			return ResultPagedList<Post>.ReSuccess(data,totalCount);
		}
		/// <summary>
		/// 添加岗位
		/// </summary>
		/// <param name="post"></param>
		/// <returns></returns>
		public async Task<Result> Create(Post post)
		{
			if(await _postRepository.GetEntity(f=> f.TenancyId==post.TenancyId && f.Name.Equals(post.Name)) != null)
				return Result.ReFailure(ResultCodes.PostNameExist);
			bool isAdd = await _postRepository.Add(post);
			if(!isAdd)
				return Result.ReFailure(ResultCodes.PostCreateError);
			return Result.ReSuccess();
		}
		/// <summary>
		/// 修改岗位
		/// </summary>
		/// <param name="post"></param>
		/// <returns></returns>
		public async Task<Result> Modify(Post post)
		{
			if (await _postRepository.GetEntity(f => f.Id != post.Id && f.Name.Equals(post.Name)) != null)
				return Result.ReFailure(ResultCodes.RoleNameExist);
			bool isUpdate = await _postRepository.Update(post);
			if (!isUpdate)
				return Result.ReFailure(ResultCodes.PostModifyError);
			return Result.ReSuccess();
		}
		/// <summary>
		/// 硬 删除岗位
		/// </summary>
		/// <param name="post"></param>
		/// <returns></returns>
		public async Task<Result> Delete(Post post)
		{
			bool isDelete = await _postRepository.Delete(post);
			if (!isDelete)
			{
				return Result.ReFailure(ResultCodes.PostDeleteError);
			}
			
			return Result.ReSuccess();
		}
	}
}