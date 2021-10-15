using System;

namespace ASF.Application.DTO.Audio
{
  /// <summary>
  /// 审计日志响应
  /// </summary>
  public class AudioResponseDto
  {
    /// <summary>
    /// key
    /// </summary>
    public long Key { get; set; }

    /// <summary>
    /// 日志编号
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 操作账号编号
    /// </summary>
    public long? AccountId { get; set; }
    /// <summary>
    /// 操作账户名
    /// </summary>
    public string AccountName { get; set; }
    /// <summary>
    /// 日志类型
    /// </summary>
    public uint Type { get; private set; }
    /// <summary>
    /// 登录方式
    /// </summary>
    public string Subject { get; private set; }
    /// <summary>
    /// 客户端IP
    /// </summary>
    public string ClientIp { get; set; }
    /// <summary>
    /// 客户端位置
    /// </summary>
    public string ClientLocation { get; set; }
    /// <summary>
    /// 权限ID
    /// </summary>
    public long? PermissionId { get; set; }
    /// <summary>
    /// 日志记录时间
    /// </summary>
    public DateTime AddTime { get; set; }
    /// <summary>
    /// 请求地址
    /// </summary>
    public string ApiAddress { get; set; }
    /// <summary>
    /// API请求数据
    /// </summary>
    public string ApiRequest { get; set; }
    /// <summary>
    /// 响应数据
    /// </summary>
    public string ApiResponse { get; set; }
    /// <summary>
    /// 备注
    /// </summary>
    public string Remark { get; set; }
  }
}