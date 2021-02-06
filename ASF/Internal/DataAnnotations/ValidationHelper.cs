using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Collections.Generic;
using Microsoft.Extensions.Logging.Configuration;
using ASF.Internal.Results;

namespace System.ComponentModel.DataAnnotations
{
    /// <summary>
    /// 实体验证
    /// </summary>
    public class EntityValidationResult
    {
        /// <summary>
        /// 验证错误集合
        /// </summary>
        public IList<ValidationResult> Errors { get; private set; }
        /// <summary>
        /// 是否有错误
        /// </summary>
        public bool HasError
        {
            get { return Errors.Count > 0; }
        }
        /// <summary>
        /// 验证返回
        /// </summary>
        /// <param name="errors"></param>
        public EntityValidationResult(IList<ValidationResult> errors = null)
        {
            Errors = errors ?? new List<ValidationResult>();
        }
    }
    /// <summary>
    /// 实体验证
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class EntityValidator<T> where T : class
    {
        /// <summary>
        /// 验证
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public EntityValidationResult Validate(T entity)
        {
            var validationResults = new List<ValidationResult>();
            var context = new ValidationContext(entity, null, null);
            var isValid = Validator.TryValidateObject
                    (entity, context, validationResults, true);

            return new EntityValidationResult(validationResults);
        }
    }
    /// <summary>
    /// 实体验证辅助方法
    /// </summary>
    public class ValidationHelper
    {
        /// <summary>
        /// 验证实体返回
        /// </summary>
        /// <param name="entity"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static EntityValidationResult ValidateEntity<T>(T entity)
            where T : class
        {
            return new EntityValidator<T>().Validate(entity);
        }

        /// <summary>
        /// 验证是否成功
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public static bool IsValid<T>(T entity)
            where T : class
        {
            return IsValid(entity, null);
        }
        /// <summary>
        /// 验证是否成功
        /// </summary>
        /// <param name="entity">实体</param>
        /// <param name="logger">日志记录</param>
        /// <param name="logLevel">日志记录级别</param>
        /// <returns></returns>
        public static bool IsValid<T>(T entity, ILogger logger, LogLevel logLevel = LogLevel.Information)
            where T : class
        {
            EntityValidationResult result = ValidateEntity<T>(entity);

            if (result.HasError && logger != null)
                logger.Log(logLevel, 0, string.Format("{0} Valid Fail Message:{1}", entity.GetType(), JsonConvert.SerializeObject(result.Errors)));
            return !result.HasError;
        }

        /// <summary>
        /// 验证是否成功
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public static Result ValidResult<T>(T entity)
            where T : class
        {
            EntityValidationResult result = ValidateEntity<T>(entity);
            if (result.HasError)
                return Result.ReFailure(BaseResultCodes.BadRequest.ToFormat(result.Errors[0].ErrorMessage));
            else
                return Result.ReSuccess();
        }


    }
}
