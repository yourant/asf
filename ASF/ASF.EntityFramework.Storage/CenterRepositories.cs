using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ASF.EntityFramework.Repository
{
    /// <summary>
    /// center db仓储
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class CenterRepositories<T>: IRepositories<T> where T : class
    {
        private readonly CenterRepositoryContext _context;

        public CenterRepositories(CenterRepositoryContext context)
        {
            _context = context;
        }

        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<bool> Add(T entity)
        {
          await _context.Set<T>().AddAsync(entity);
          return await _context.SaveChangesAsync() > 0;
        }
        /// <summary>
        /// 批量添加
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<bool> AddRange(List<T> entity)
        {
          await _context.Set<T>().AddRangeAsync(entity);
          return await _context.SaveChangesAsync() > 0;
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<bool> Delete(T entity)
        {
          _context.Set<T>().Remove(entity);
          return await _context.SaveChangesAsync() > 0;
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<bool> Update(T entity)
        {
          _context.Set<T>().Update(entity);
          return await _context.SaveChangesAsync() > 0;
        }
        /// <summary>
        /// 批量修改
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<bool> UpdateRange(List<T> entity)
        {
          _context.Set<T>().UpdateRange(entity);
          return await _context.SaveChangesAsync() > 0;
        }

        public async Task<IEnumerable<T>> GetEntities(Expression<Func<T, bool>> exp)
        {
          return await Task.FromResult<IEnumerable<T>>(CompileQuery(exp));
        }

        public async Task<(IList<T> list, int total)> GetEntitiesForPaging(int page, int pageSize, Expression<Func<T, bool>> exp)
        {
          IList<T> query = CompileQuery(exp).ToList();
          int count = query.Count() == 0 ? 1 : query.Count();
          int p = page == 0 ? 1 : page;
          int c = pageSize == 0 ? count : pageSize;
          int totalPages = (int)Math.Ceiling(((decimal)count / c));
          p = Math.Min(p, totalPages);
          var list = query
            .Skip((p - 1) * c)
            .Take(c)
            .ToList();
          return await Task.FromResult<(IList<T> list,  int total)>((list, count));
        }

        public async Task<T> GetEntity(Expression<Func<T, bool>> exp)
        {
          return await Task.FromResult<T>(CompileQuerySingle(exp));
        }
        /// <summary>
        /// 查询集合
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        private IEnumerable<T> CompileQuery(Expression<Func<T, bool>> exp)
        {
          var func = EF.CompileQuery((CenterRepositoryContext context, Expression<Func<T, bool>> exps) => context.Set<T>().Where(exp));
          return func(_context, exp);
        }

        /// <summary>
        /// 查询单个
        /// </summary>
        /// <param name="exp"></param>
        /// <returns></returns>
        private T CompileQuerySingle(Expression<Func<T, bool>> exp)
        {
          var func = EF.CompileQuery((CenterRepositoryContext context, Expression<Func<T, bool>> exps) =>
            context.Set<T>().FirstOrDefault(exp));
          return func(_context, exp);
        }
        /// <summary>
        /// 获取db context
        /// </summary>
        /// <returns></returns>
        public CenterRepositoryContext GetDbContext()
        {
          return _context;
        }
    }
}