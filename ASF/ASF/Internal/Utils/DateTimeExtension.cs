using System;
using System.Collections.Generic;
using System.Text;

namespace System
{
    /// <summary>
    /// 时间扩展
    /// </summary>
    public static class DateTimeExtension
    {
        /// <summary>
        /// 转换为毫秒时间戳
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static long ToUnixTime64(this DateTime date)
        {
            var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            return Convert.ToInt64((date.ToUniversalTime() - epoch).TotalMilliseconds);
        }
        /// <summary>
        /// 转换为秒级时间戳
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static int ToUnixTime32(this DateTime date)
        {
            var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            return Convert.ToInt32((date.ToUniversalTime() - epoch).TotalSeconds);
        }
    }
}
