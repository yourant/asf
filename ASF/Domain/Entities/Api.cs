using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASF.Domain.Entities
{
  /// <summary>
  /// api表
  /// </summary>
  public class Api
  {
    /// <summary>
    /// 权限功能
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 权限id
    /// </summary>
    public long PermissionId { get; set; }

    /// <summary>
    /// 名称
    /// </summary>
    public string Name { get; set; }
    /// <summary>
    /// api 功能 状态
    /// </summary>
    public uint Status { get; set; }
    /// <summary>
    ///  api功能类型
    /// </summary>
    public uint Type { get; set; }
    /// <summary>
    /// api路径
    /// </summary>
    public string Path { get; set; }
    /// <summary>
    /// Http 方法
    /// </summary>
    public string HttpMethods { get; set; }
    /// <summary>
    /// 是否日志记录
    /// </summary>
    public uint? IsLogger { get; set; }
    /// <summary>
    /// 描述
    /// </summary>
    public string Description { get; set; }
    /// <summary>
    /// 是否系统权限
    /// </summary>
    public uint? IsSystem { get; set; }
    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreateTime { get; set; }
    /// <summary>
    /// 对应权限
    /// </summary>
    [NotMapped] 
    public Permission Permission { get; set; }
  }
}