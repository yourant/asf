using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using ASF.Domain.Values;
using ASF.Internal;

namespace ASF.Domain.Entities
{
  /// <summary>
  /// 岗位
  /// </summary>
  public class Post
  {
    public Post()
    {
      Account = new JoinCollectionFacade<Account, Post, AccountPost>(this, AccountPost);
    }

    /// <summary>
    /// 岗位id
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 租户id
    /// </summary>
    public long? TenancyId { get; set; }
    /// <summary>
    /// 岗位名称
    /// </summary>
    public string Name { get; set; }
    /// <summary>
    /// 岗位排序
    /// </summary>
    public int Sort { get; set; }
    /// <summary>
    /// 创建者id
    /// </summary>
    public long? CreateId { get; set; }
    /// <summary>
    /// 岗位描述
    /// </summary>
    public string Description { get; set; }

    /// <summary>
    /// 启用/禁用
    /// </summary>
    public Status Enabled { get; set; }
    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreateTime { get; set; }
    
    /// <summary>
    /// 关联账户
    /// </summary>
    [NotMapped]
    public ICollection<Account> Account { get; }
    /// <summary>
    /// 角色账户中间表
    /// </summary>
    public ICollection<AccountPost> AccountPost { get; } = new List<AccountPost>();
  }
}