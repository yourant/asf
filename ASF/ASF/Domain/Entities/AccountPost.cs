using System;
using ASF.Internal;

namespace ASF.Domain.Entities
{
  /// <summary>
  /// 账户-岗位中间表
  /// </summary>
  public class AccountPost: IJoinEntity<Account>, IJoinEntity<Post>
  {
    /// <summary>
    /// 中间表id
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 账户id
    /// </summary>
    public long AccountId { get; set; }
    /// <summary>
    /// 岗位id
    /// </summary>
    public long PostId { get; set; }
    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreateTime { get; set; }

    /// <summary>
    /// 关联用户
    /// </summary>
    public Account Account { get; set; }
    Account IJoinEntity<Account>.Navigation
    {
      get => Account;
      set => Account = value;
    }
    /// <summary>
    /// 关联岗位
    /// </summary>
    public Post Post { get; set; }
    Post IJoinEntity<Post>.Navigation
    {
      get => Post;
      set => Post = value;
    }
  }
}