using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.AsfDictionary
{
    /// <summary>
    /// 字典列表请求
    /// </summary>
    public class AsfDictionaryListRequestDto: PaginationRequestDto
    {
        /// <summary>
        /// 字典Key
        /// </summary>
        [MaxLength(255,ErrorMessage = "最多输入255个key字符")]
        public string Key { get; set; }
    }
}