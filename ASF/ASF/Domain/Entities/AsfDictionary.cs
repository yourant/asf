using System;

namespace ASF.Domain.Entities
{
    /// <summary>
    /// 字典表
    /// </summary>
    public class AsfDictionary
    {
        /// <summary>
        /// 字典ID
        /// </summary>
        public long Id { get; set; }
        /// <summary>
        /// 字典编码
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 租户id
        /// </summary>
        public long? TenancyId { get; set; }
        /// <summary>
        /// 字典Key
        /// </summary>
        public string Key { get; set; }
        /// <summary>
        /// 字典值
        /// </summary>
        public string Value { get; set; }
        /// <summary>
        /// 字典扩充字段
        /// </summary>
        public string Options { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
}