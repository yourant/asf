namespace ASF.Domain.Values;
/// <summary>
/// 聚宽配置
/// </summary>
public class JQData
{
	/// <summary>
	/// api地址
	/// </summary>
	public string Url { get; set; }
	/// <summary>
	/// 获取token别名
	/// </summary>
	public string GetToken { get; set; }
	/// <summary>
	/// 手机号码
	/// </summary>
	public string Mobile { get; set; }
	/// <summary>
	/// 密码 
	/// </summary>
	public string Password { get; set; }
}