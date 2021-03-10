using System;

namespace ASF.Application.DTO
{
  /// <summary>
  /// 权限api响应
  /// </summary>
  public class PermissionApiResponseDto: PermissionApiModifyRequestDto
  {
    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreateTime { get; set; }
    /// <summary>
    /// api功能状态名称
    /// </summary>
    public string StatusName { get; set; }
    /// <summary>
    /// api功能类型名
    /// </summary>
    public string TypeName { get; set; }
  }
}