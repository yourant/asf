using System.Net.Http;
using System.Text;
using Newtonsoft.Json;

namespace ASF.Internal.Utils
{
    /// <summary>
    /// http请求json序列化内容
    /// </summary>
    public class JsonContent : StringContent
    {
        /// <summary>
        /// http请求json序列化内容
        /// </summary>
        /// <param name="obj"></param>
        public JsonContent(object obj) :
        base(JsonConvert.SerializeObject(obj), Encoding.UTF8, "application/json")
        { }
    }
}
