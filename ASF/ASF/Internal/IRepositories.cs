using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ASF
{
    /// <summary>
    /// 基仓储
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IRepositories<T> where T : class
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        Task<bool> Add(T entity);
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        Task<bool> Delete(T entity);
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        Task<bool> Update(T entity);
        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<IEnumerable<T>> GetEntities(Expression<Func<T, bool>> exp);
        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<(IList<T> list,int total)> GetEntitiesForPaging(int page, int pageSize, Expression<Func<T, bool>> exp);
        /// <summary>
        /// 获取查询数据
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        Task<T> GetEntity(Expression<Func<T, bool>> exp);
    }
}