using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace ASF.Internal
{
  /// <summary>
  /// ef core 连接工厂
  /// </summary>
  /// <typeparam name="TEntity"></typeparam>
  public interface IJoinEntity<TEntity>
  {
    /// <summary>
    /// 连接导航
    /// </summary>
    TEntity Navigation { get; set; }
  }
  /// <summary>
  /// ef core 连接工厂集合
  /// </summary>
  /// <typeparam name="TEntity"></typeparam>
  /// <typeparam name="TOtherEntity"></typeparam>
  /// <typeparam name="TJoinEntity"></typeparam>
  public class JoinCollectionFacade<TEntity, TOtherEntity, TJoinEntity>
    : ICollection<TEntity>
    where TJoinEntity : IJoinEntity<TEntity>, IJoinEntity<TOtherEntity>, new()
  {
    private readonly TOtherEntity _ownerEntity;
    private readonly ICollection<TJoinEntity> _collection;
    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="ownerEntity"></param>
    /// <param name="collection"></param>
    public JoinCollectionFacade(
      TOtherEntity ownerEntity,
      ICollection<TJoinEntity> collection)
    {
      _ownerEntity = ownerEntity;
      _collection = collection;
    }
    /// <summary>
    /// 获取枚举集合
    /// </summary>
    /// <returns></returns>
    public IEnumerator<TEntity> GetEnumerator()
      => _collection.Select(e => ((IJoinEntity<TEntity>)e).Navigation).GetEnumerator();
    /// <summary>
    /// 获取枚举集合
    /// </summary>
    /// <returns></returns>
    IEnumerator IEnumerable.GetEnumerator()
      => GetEnumerator();
    /// <summary>
    /// 添加
    /// </summary>
    /// <param name="item"></param>
    public void Add(TEntity item)
    {
      var entity = new TJoinEntity();
      ((IJoinEntity<TEntity>)entity).Navigation = item;
      ((IJoinEntity<TOtherEntity>)entity).Navigation = _ownerEntity;
      _collection.Add(entity);
    }
    /// <summary>
    /// 清除
    /// </summary>
    public void Clear()
      => _collection.Clear();
    /// <summary>
    /// 包含
    /// </summary>
    /// <param name="item"></param>
    /// <returns></returns>
    public bool Contains(TEntity item)
      => _collection.Any(e => Equals(item, e));

    // public void CopyTo(TEntity[] array, int arrayIndex)
    //     => this.ToList().CopyTo(array, arrayIndex);
    /// <summary>
    /// 此处我做出了修改，修正了堆栈溢出的问题
    /// </summary>
    /// <param name="array"></param>
    /// <param name="arrayIndex"></param>
    public void CopyTo(TEntity[] array, int arrayIndex)
      => _collection
        .Select(je => ((IJoinEntity<TEntity>)je).Navigation)
        .ToList()
        .CopyTo(array, arrayIndex);
    /// <summary>
    /// 移除
    /// </summary>
    /// <param name="item"></param>
    /// <returns></returns>
    public bool Remove(TEntity item)
      => _collection.Remove(
        _collection.FirstOrDefault(e => Equals(item, e)));
    /// <summary>
    /// 数量
    /// </summary>
    public int Count
      => _collection.Count;
    /// <summary>
    /// 是否为只读
    /// </summary>
    public bool IsReadOnly
      => _collection.IsReadOnly;
    /// <summary>
    /// 对比字符串
    /// </summary>
    /// <param name="item"></param>
    /// <param name="e"></param>
    /// <returns></returns>
    private static bool Equals(TEntity item, TJoinEntity e)
      => Equals(((IJoinEntity<TEntity>)e).Navigation, item);
  }
}