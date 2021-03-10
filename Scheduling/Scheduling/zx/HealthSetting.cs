using System.Collections.Generic;
using Wjsz.BaseExtensions.Entity;

namespace Scheduling.zx
{
  public class HealthSetting
  {
    /// <summary>
    /// 健康检查服务地址集合
    /// </summary>
    public List<HealthService> HealthServices { get; set; }
  }
}