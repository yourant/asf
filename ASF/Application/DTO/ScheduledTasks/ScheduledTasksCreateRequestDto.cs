using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.ScheduledTasks
{
    public class ScheduledTasksCreateRequestDto: IDto
    {
        /// <summary>
        /// 计划任务名称
        /// </summary>
        [Required(ErrorMessage = "计划任务名称不能为空"), MaxLength(100, ErrorMessage = "最多输入100个字符长度计划任务名")]
        public string Name { get; set; }
        /// <summary>
        /// 计划任务描述
        /// </summary>
        [MaxLength(255, ErrorMessage = "最多输入255个字符长度计划任务描述")]
        public string Description { get; set; }
        /// <summary>
        /// 计划任务执行方法地址
        /// </summary>
        [MaxLength(255, ErrorMessage = "最多输入255个字符长度计划任务执行方法地址")]
        public string Url { get; set; }
        /// <summary>
        /// 任务负责人
        /// </summary>
        [Required(ErrorMessage = "任务负责人不能为空"),MaxLength(255, ErrorMessage = "最多输入255个字符长度计划任务负责人")]
        public string TaskUserName { get; set; }
        /// <summary>
        /// 告警通知邮箱
        /// </summary>
        [RegularExpression(@"^[-\w\+]+(?:\.[-\w]+)*@[-a-z0-9]+(?:\.[a-z0-9]+)*(?:\.[a-z]{2,})$",ErrorMessage = "告警通知邮箱格式不正确")]
        public string ErrorEmail { get; set; }
        /// <summary>
        /// cron表达式
        /// </summary>
        [Required(ErrorMessage = "cron表达式不能为空")]
        public string Cron { get; set; }

        /// <summary>
        /// 失败后暂停执行
        /// </summary>
        public bool? FailStop { get; set; } = true;

        /// <summary>
        /// 任务状态
        /// </summary>
        public bool? TaskStatus { get; set; } = true;
        /// <summary>
        /// 参数内容
        /// </summary>
        public string ParamsContent { get; set; } 
    }
}