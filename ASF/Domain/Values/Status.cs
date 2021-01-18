using System.ComponentModel;

namespace ASF.Domain.Values
{
  /// <summary>
  /// 启用禁用
  /// </summary>
  public enum Status
  {
    [Description("否")]
    No = 0,
    [Description("是")]
    Yes = 1
  }
}