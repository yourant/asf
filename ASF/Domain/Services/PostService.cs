using System.Threading.Tasks;
using ASF.Domain.Entities;
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
				return Result<Post>.ReSuccess(p);
			}

			Post post = await _postRepository.GetEntity(f => f.Id == id);
			if(post == null)
				return Result<Post>.ReFailure(ResultCodes.PostNotExist);
			return Result<Post>.ReSuccess(post);
		}
	}
}