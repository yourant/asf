using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace ASF.Internal
{
  public interface IJoinEntity<TEntity>
  {
    TEntity Navigation { get; set; }
  }
  public class JoinCollectionFacade<TEntity, TOtherEntity, TJoinEntity>
    : ICollection<TEntity>
    where TJoinEntity : IJoinEntity<TEntity>, IJoinEntity<TOtherEntity>, new()
  {
    private readonly TOtherEntity _ownerEntity;
    private readonly ICollection<TJoinEntity> _collection;

    public JoinCollectionFacade(
      TOtherEntity ownerEntity,
      ICollection<TJoinEntity> collection)
    {
      _ownerEntity = ownerEntity;
      _collection = collection;
    }

    public IEnumerator<TEntity> GetEnumerator()
      => _collection.Select(e => ((IJoinEntity<TEntity>)e).Navigation).GetEnumerator();

    IEnumerator IEnumerable.GetEnumerator()
      => GetEnumerator();

    public void Add(TEntity item)
    {
      var entity = new TJoinEntity();
      ((IJoinEntity<TEntity>)entity).Navigation = item;
      ((IJoinEntity<TOtherEntity>)entity).Navigation = _ownerEntity;
      _collection.Add(entity);
    }

    public void Clear()
      => _collection.Clear();

    public bool Contains(TEntity item)
      => _collection.Any(e => Equals(item, e));

    // public void CopyTo(TEntity[] array, int arrayIndex)
    //     => this.ToList().CopyTo(array, arrayIndex);
    // 此处我做出了修改，修正了堆栈溢出的问题
    public void CopyTo(TEntity[] array, int arrayIndex)
      => _collection
        .Select(je => ((IJoinEntity<TEntity>)je).Navigation)
        .ToList()
        .CopyTo(array, arrayIndex);

    public bool Remove(TEntity item)
      => _collection.Remove(
        _collection.FirstOrDefault(e => Equals(item, e)));

    public int Count
      => _collection.Count;

    public bool IsReadOnly
      => _collection.IsReadOnly;

    private static bool Equals(TEntity item, TJoinEntity e)
      => Equals(((IJoinEntity<TEntity>)e).Navigation, item);
  }
}