using System.Collections.Generic;
using System.Linq;
using System.Net;
using ASF.Internal.Results;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace System.ComponentModel.DataAnnotations
{
    /// <summary>
    /// 验证扩展
    /// </summary>
    public static class ValidatorExtensions
    {
        /// <summary>
        /// 验证
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static Result Valid(this object obj)
        {
            return ValidationHelper.ValidResult(obj);
        }
        /// <summary>
        /// 验证
        /// </summary>
        /// <param name="obj"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static Result<T> Valid<T>(this object obj)
        {
            var result = ValidationHelper.ValidResult(obj);
            return Result<T>.ReSuccess((T)obj);
        }
        /// <summary>
        /// 获取验证返回信息集合
        /// </summary>
        /// <param name="dictionary"></param>
        /// <returns></returns>
        public static List<string> GetErrorMessages(this ModelStateDictionary dictionary)
        {
            return dictionary.SelectMany(m => m.Value.Errors)
                .Select(m => m.ErrorMessage)
                .ToList();
        }
    }
    /// <summary>
    /// 模型验证
    /// </summary>
    public class ValidationActionFilter: ActionFilterAttribute
    {
        /// <summary>
        /// 执行验证输出
        /// </summary>
        /// <param name="context"></param>
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var modelState = context.ModelState;
            string result = null;
            if(!modelState.IsValid)
            {
                context.Result = new JsonResult(new {
                    data = result,
                    status = HttpStatusCode.BadRequest,
                    message = modelState.GetErrorMessages()[0]
                }){
                    StatusCode = (int)HttpStatusCode.BadRequest
                };
            }
        }
    }
    // 转换00:00时间
    /// <summary>
    /// Converts a <see cref="DateTime"/> to and from Unix epoch time
    /// </summary>
    public class MyUnixDateTimeConverter : UnixDateTimeConverter
    {
        internal static readonly DateTime UnixEpoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

        /// <summary>
        /// Writes the JSON representation of the object.
        /// </summary>
        /// <param name="writer">The <see cref="JsonWriter"/> to write to.</param>
        /// <param name="value">The value.</param>
        /// <param name="serializer">The calling serializer.</param>
        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            long seconds;

            if (value is DateTime dateTime)
            {
                if(dateTime == DateTime.MinValue)
                {
                    seconds = (long)(UnixEpoch.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
                }else
                {
                    seconds = (long)(dateTime.ToUniversalTime() - UnixEpoch).TotalSeconds;
                }
            }
#if HAVE_DATE_TIME_OFFSET
            else if (value is DateTimeOffset dateTimeOffset)
            {
                if(dateTime == DateTime.MinValue)
                {
                    seconds = (long)(UnixEpoch.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
                }else
                {
                    seconds = (long)(dateTimeOffset.ToUniversalTime() - UnixEpoch).TotalSeconds;
                }
            }
#endif
            else
            {
                throw new JsonSerializationException("Expected date object value.");
            }

            if (seconds < 0)
            {
                // seconds = seconds;
                writer.WriteValue(seconds);
                // throw new JsonSerializationException("Cannot convert date value that is before Unix epoch of 00:00:00 UTC on 1 January 1970.");
            }

            writer.WriteValue(seconds);
        }
    }
}
