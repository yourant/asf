using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASF.Domain.Entities
{
  /// <summary>
  /// 菜单模型
  /// </summary>
  public class PermissionMenu
  {
    /// <summary>
    /// 菜单id
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 权限id
    /// </summary>
    public long PermissionId { get; set; }
    /// <summary>
    /// 菜单标题
    /// </summary>
    public string Title { get; set; }
    /// <summary>
    /// 副标题
    /// </summary>
    public string Subtitle { get; set; }
    /// <summary>
    /// 菜单图标
    /// </summary>
    public string Icon { get; set; }
    /// <summary>
    /// 菜单是否隐藏
    /// </summary>
    public bool? MenuHidden { get; set; }
    /// <summary>
    /// 菜单内部地址
    /// </summary>
    public string MenuUrl { get; set; }
    /// <summary>
    /// 外部链接
    /// </summary>
    public string ExternalLink { get; set; }

    /// <summary>
    /// 菜单重定向地址
    /// </summary>
    public string MenuRedirect { get; set; }
    /// <summary>
    /// 菜单说明
    /// </summary>
    public string Description { get; set; }
    /// <summary>
    /// 多语言
    /// </summary>
    public string Translate { get; set; }
    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreateTime { get; set; }
    /// <summary>
    /// 菜单下对应权限
    /// </summary>
    [NotMapped] 
    public Permission Permissions { get; set; }
  }
}