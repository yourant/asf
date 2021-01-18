using System.ComponentModel;

namespace ASF.Domain.Values
{
    /// <summary>
    /// 任务状态
    /// </summary>
    public enum TaskStatus
    {
        [Description("暂停")]
        Stop = 0,
        [Description("启动运行")]
        Start = 1
    }
}