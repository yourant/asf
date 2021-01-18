using System;
using System.ComponentModel.DataAnnotations.Schema;
using ASF.Internal;

namespace ASF.Domain.Entities
{
  /// <summary>
  /// 用户-角色中间表
  /// </summary>
  public class DepartmentRole: IJoinEntity<Role>, IJoinEntity<Department>
  {
    /// <summary>
    /// id
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 角色id
    /// </summary>
    public long RoleId { get; set; }
    /// <summary>
    /// 部门id
    /// </summary>
    public long DepartmentId { get; set; }
    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreateTime { get; set; }
    
    /// <summary>
    /// 关联角色
    /// </summary>
    public Role Role { get; set; }
    Role IJoinEntity<Role>.Navigation
    {
      get => Role;
      set => Role = value;
    }
    /// <summary>
    /// 关联部门
    /// </summary>
    public Department Department { get; set; }
    Department IJoinEntity<Department>.Navigation
    {
      get => Department;
      set => Department = value;
    }
  }
}