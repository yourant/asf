using System.ComponentModel;

namespace ASF.Domain.Values
{
  /// <summary>
  /// 真/否
  /// </summary>
  public enum Status
  {
    /// <summary>
    /// 否
    /// </summary>
    [Description("否")]
    No = 0,
    /// <summary>
    /// 是
    /// </summary>
    [Description("是")]
    Yes = 1
  }
}