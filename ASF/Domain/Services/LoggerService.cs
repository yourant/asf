using System;
using System.Threading.Tasks;
using ASF.Domain.Entities;
using ASF.Domain.Values;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 日志服务
	/// </summary>
	public class LoggerService
	{
		private readonly ILoggingsRepository _loggingsRepository;
		public LoggerService(ILoggingsRepository loggingsRepository)
		{
			_loggingsRepository = loggingsRepository;
		}
		/// <summary>
		/// 添加日志
		/// </summary>
		/// <param name="logInfo"></param>
		/// <returns></returns>
		public async Task Create(LogInfo logInfo)
		{
			await _loggingsRepository.Add(logInfo);

			await Task.CompletedTask;
		}
		/// <summary>
		/// 获取日志分页列表
		/// </summary>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <param name="type"></param>
		/// <param name="accountName"></param>
		/// <returns></returns>
		public async Task<ResultPagedList<LogInfo>> GetList(int pageNo, int pageSize, uint? type = null,
			string accountName = "")
		{
			if (type != null && !string.IsNullOrEmpty(accountName))
			{
				var (list, total) = await _loggingsRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Type == type && f.AccountName.Equals(accountName));
				return ResultPagedList<LogInfo>.ReSuccess(list,total);
			}
			
			if (type != null)
			{
				var (list, total) = await _loggingsRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.Type == type);
				return ResultPagedList<LogInfo>.ReSuccess(list,total);
			}
			
			if (!string.IsNullOrEmpty(accountName))
			{
				var (list, total) = await _loggingsRepository.GetEntitiesForPaging(pageNo, pageSize,
					f => f.AccountName.Equals(accountName));
				return ResultPagedList<LogInfo>.ReSuccess(list,total);
			}
			
			var (data, totalCount) = await _loggingsRepository.GetEntitiesForPaging(pageNo, pageSize,
				f => f.Id != 0);
			return ResultPagedList<LogInfo>.ReSuccess(data,totalCount);
		}
		/// <summary>
		/// 删除日志
		/// </summary>
		/// <param name="logInfo"></param>
		/// <returns></returns>
		public async Task<Result> Delete(LogInfo logInfo)
		{
			// 判断如果日志时间不大于三个月不能删除
			if(logInfo.AddTime.AddDays(90) < DateTime.Now)
				return Result.ReFailure(ResultCodes.LogginDeletedCannoBeWithinThreeMonths);
			bool isDelete = await _loggingsRepository.Delete(logInfo);
			if (!isDelete)
			{
				return Result.ReFailure(ResultCodes.LogginDeletedError);
			}
			return Result.ReSuccess();
		}
	}
}