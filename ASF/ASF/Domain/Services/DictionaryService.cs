using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;

namespace ASF.Domain.Services
{
    /// <summary>
    /// 字典领域服务
    /// </summary>
    public class DictionaryService
    {
        private IAsfDictionaryRepository _asfDictionaryRepository;
        /// <summary>
        /// 字典领域服务
        /// </summary>
        public DictionaryService(IAsfDictionaryRepository asfDictionaryRepository)
        {
            _asfDictionaryRepository = asfDictionaryRepository;
        }
        /// <summary>
        /// 获取字典
        /// </summary>
        /// <param name="id"></param>
        /// <param name="tenancyId"></param>
        /// <returns></returns>
        public async Task<Result<AsfDictionary>> Get(long id, long? tenancyId = null)
        {
            if (tenancyId != null)
            {
                AsfDictionary d = await _asfDictionaryRepository.GetEntity(f => f.Id == id && f.TenancyId == tenancyId);
                if (d == null)
                    return Result<AsfDictionary>.ReFailure(ResultCodes.DictionaryNotExist);
                return Result<AsfDictionary>.ReSuccess(d);
            }
			
            AsfDictionary asfDictionary = await _asfDictionaryRepository.GetEntity(f => f.Id == id);
            if (asfDictionary == null)
                return Result<AsfDictionary>.ReFailure(ResultCodes.DictionaryNotExist);
            return Result<AsfDictionary>.ReSuccess(asfDictionary);
        }
        /// <summary>
        /// 获取字典分页列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <param name="key"></param>
        /// <param name="tenancyId"></param>
        /// <returns></returns>
        public async Task<(IList<AsfDictionary> list, int total)> GetList(int pageNo, int pageSize, string key,
            long? tenancyId = null)
        {
            if (!string.IsNullOrEmpty(key) && tenancyId != null)
            {
                var (list,total) = await _asfDictionaryRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Key.Equals(key) && f.TenancyId == tenancyId);
                return (list,total);
            }
            if (tenancyId != null)
            {
                var (list,total) = await _asfDictionaryRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.TenancyId == tenancyId);
                return (list,total);
            }
            if (!string.IsNullOrEmpty(key))
            {
                var (list,total) = await _asfDictionaryRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Key.Equals(key));
                return  (list,total);
            }

            var (data,totalCount) = await _asfDictionaryRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Id != 0);
            return (data,totalCount);
        }
        /// <summary>
        /// 获取字典列表
        /// </summary>
        /// <param name="tenancyId"></param>
        /// <returns></returns>
        public async Task<ResultList<AsfDictionary>> GetList(long? tenancyId = null)
        {
            if (tenancyId != null)
            {
                IEnumerable<AsfDictionary> l = await _asfDictionaryRepository.GetEntities(f => f.Id != 0 && f.TenancyId == tenancyId);
                if(l == null)
                    return ResultList<AsfDictionary>.ReFailure(ResultCodes.DictionaryNotExist);
                return ResultList<AsfDictionary>.ReSuccess(l.ToList());
            }

            IEnumerable<AsfDictionary> list = await _asfDictionaryRepository.GetEntities(f => f.Id != 0);
            if(list == null)
                return ResultList<AsfDictionary>.ReFailure(ResultCodes.DictionaryNotExist);
            return ResultList<AsfDictionary>.ReSuccess(list.ToList());
        }
        /// <summary>
        /// 添加字典
        /// </summary>
        /// <param name="asfDictionary"></param>
        /// <returns></returns>
        public async Task<Result> Create(AsfDictionary asfDictionary)
        {
            if (await _asfDictionaryRepository.GetEntity(f => f.TenancyId == asfDictionary.TenancyId && f.Key.Equals(asfDictionary.Key)) != null)
                return Result.ReFailure(ResultCodes.DictionaryKeyExist);
            bool isAdd = await _asfDictionaryRepository.Add(asfDictionary);
            if (!isAdd)
            {
                return Result.ReFailure(ResultCodes.DictionaryCreateError);
            }

            return Result.ReSuccess();
        }
        /// <summary>
        /// 修改字典
        /// </summary>
        /// <param name="asfDictionary"></param>
        /// <returns></returns>
        public async Task<Result> Modify(AsfDictionary asfDictionary)
        {
            if (await _asfDictionaryRepository.GetEntity(f =>f.Id !=asfDictionary.Id && f.TenancyId == asfDictionary.TenancyId &&f.Key.Equals(asfDictionary.Key)) != null)
                return Result.ReFailure(ResultCodes.TranslateNameExist);
            bool isUpdate = await _asfDictionaryRepository.Update(asfDictionary);
            if (!isUpdate)
            {
                return Result.ReFailure(ResultCodes.DictionaryUpdateError);
            }
			
            return Result.ReSuccess();
        }
        /// <summary>
        /// 硬 删除字典
        /// </summary>
        /// <param name="asfDictionary"></param>
        /// <returns></returns>
        public async Task<Result> Delete(AsfDictionary asfDictionary)
        {
            bool isDelete = await _asfDictionaryRepository.Delete(asfDictionary);
            if (!isDelete)
            {
                return Result.ReFailure(ResultCodes.DictionaryDeleteError);
            }
			
            return Result.ReSuccess();
        }
    }
}