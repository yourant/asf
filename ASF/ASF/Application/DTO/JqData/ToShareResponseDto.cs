using System.Collections.Generic;
using Newtonsoft.Json;
namespace ASF.Application.DTO.JqData;
/// <summary>
/// to share 响应
/// </summary>
public class ToShareResponseDto
{
  /// <summary>
  /// 请求id
  /// </summary>
  [JsonProperty("request_id")]
  public string RequestId { get; set; }
  /// <summary>
  /// 响应 code
  /// </summary>
  [JsonProperty("code")]
  public string Code { get; set; }
  /// <summary>
  /// 响应消息
  /// </summary>
  [JsonProperty("msg")]
  public string Msg { get; set; }
  /// <summary>
  /// 响应数据
  /// </summary>
  [JsonProperty("data")]
  public ResponseData Data { get; set; }
}

public class ResponseData
{
  /// <summary>
  /// 字段名称
  /// </summary>
  [JsonProperty("fields")]
  public List<string> Fields { get; set; } = new List<string>();
  /// <summary>
  /// items
  /// </summary>
  [JsonProperty("items")]
  public List<List<string>> Items { get; set; } = new List<List<string>>();
}