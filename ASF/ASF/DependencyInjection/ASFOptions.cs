using System;
using System.Collections.Generic;
using System.Text;

namespace ASF.DependencyInjection
{
    /// <summary>
    /// asf 配置
    /// </summary>
    public class ASFOptions
    {
        /// <summary>
        /// 数据库连接字符串
        /// </summary>
        public string DBConnectionString { get; set; }

        /// <summary>
        /// 数据库类型
        /// </summary>
        public string DBType { get; set; }
        /// <summary>
        /// 第二个数据db连接字符串
        /// </summary>
        public string CenterDBConnectionString { get; set; }
        /// <summary>
        /// 第二个数据db 类型
        /// </summary>
        public string CenterDBType { get; set; }
        

    }
}
