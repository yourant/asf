using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASF.Domain.Entities
{
    /// <summary>
    /// 调度任务 model
    /// </summary>
    public class ScheduledTasks
    {
        /// <summary>
        /// 计划任务id
        /// </summary>
        [Key]
        public long Id { get; private set; }
        /// <summary>
        /// 计划任务名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 计划任务描述
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 计划任务执行方法地址
        /// </summary>
        public string Url { get; set; }
        /// <summary>
        /// 计划任务执行代码。只限于c#
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 任务负责人
        /// </summary>
        public string TaskUserName { get; set; }
        /// <summary>
        /// 告警通知邮箱
        /// </summary>
        public string ErrorEmail { get; set; }
        /// <summary>
        /// cron表达式
        /// </summary>
        public string Cron { get; set; }
        /// <summary>
        /// 失败后暂停执行
        /// </summary>
        public bool? FailStop { get; set; }
        /// <summary>
        /// 任务状态
        /// </summary>
        public bool? TaskStatus { get; set; }
        /// <summary>
        /// 参数内容
        /// </summary>
        public string ParamsContent { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
}