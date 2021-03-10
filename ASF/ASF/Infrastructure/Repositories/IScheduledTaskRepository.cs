using ASF.Domain.Entities;

namespace ASF.Infrastructure.Repositories
{
    /// <summary>
    /// 调度任务
    /// </summary>
    public interface IScheduledTaskRepository: IRepository<ScheduledTasks, int>
    {
        
    }
}