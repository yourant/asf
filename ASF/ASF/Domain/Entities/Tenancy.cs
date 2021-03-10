using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using ASF.Domain.Values;

namespace ASF.Domain.Entities
{
  /// <summary>
  /// 多租户
  /// </summary>
  public class Tenancy
  {
    /// <summary>
    /// 租户id
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 租户名
    /// </summary>
    public string Name { get; set; }
    /// <summary>
    /// 排序
    /// </summary>
    public int? Sort { get; set; }
    /// <summary>
    /// 等级
    /// </summary>
    public int? Level { get; set; }
    /// <summary>
    /// 创建者id
    /// </summary>
    public long? CreateId { get; set; }
    /// <summary>
    /// 租户状态
    /// </summary>
    public uint? Status { get; set; }
    /// <summary>
    /// 是否删除
    /// </summary>
    public uint? IsDeleted { get; set; }

    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreateTime { get; set; }
    /// <summary>
    /// 租户下面用户集合
    /// </summary>
    [NotMapped] 
    public List<Account> Accounts { get; set; }
  }
}