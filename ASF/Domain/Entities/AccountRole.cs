using System;
using System.ComponentModel.DataAnnotations.Schema;
using ASF.Internal;

namespace ASF.Domain.Entities
{
  /// <summary>
  /// 用户角色中间表
  /// </summary>
  public class AccountRole: IJoinEntity<Account>, IJoinEntity<Role>
  {
    /// <summary>
    /// id
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 账户id
    /// </summary>
    public long AccountId { get; set; }
    /// <summary>
    /// 角色id
    /// </summary>
    public long RoleId { get; set; }
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
    /// 关联角色
    /// </summary>
    public Role Role { get; set; }
    Role IJoinEntity<Role>.Navigation
    {
      get => Role;
      set => Role = value;
    }
  }
}