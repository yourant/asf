using System.ComponentModel;

namespace ASF.Domain.Values
{
    /// <summary>
    /// 任务状态
    /// </summary>
    public enum TaskStatus
    {
        /// <summary>
        /// 暂停
        /// </summary>
        [Description("暂停")]
        Stop = 0,
        /// <summary>
        /// 启动
        /// </summary>
        [Description("启动运行")]
        Start = 1
    }
}