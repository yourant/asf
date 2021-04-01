using System;

namespace ASF.Application.DTO.AsfDictionary
{
    /// <summary>
    /// 字典响应
    /// </summary>
    public class AsfDictionaryResponseDto: AsfDictionaryModifyRequestDto
    {
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
}