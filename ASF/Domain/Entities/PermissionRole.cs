using System;
using System.ComponentModel.DataAnnotations.Schema;
using ASF.Internal;

namespace ASF.Domain.Entities
{
  /// <summary>
  /// 角色权限中间表
  /// </summary>
  public class PermissionRole: IJoinEntity<Permission>, IJoinEntity<Role>
  {
    /// <summary>
    /// id
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 权限id
    /// </summary>
    public long PermissionId { get; set; }
    /// <summary>
    /// 角色id
    /// </summary>
    public long RoleId { get; set; }
    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreateTime { get; set; }
    
    /// <summary>
    /// 关联权限
    /// </summary>
    public Permission Permission { get; set; }
    Permission IJoinEntity<Permission>.Navigation
    {
      get => Permission;
      set => Permission = value;
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