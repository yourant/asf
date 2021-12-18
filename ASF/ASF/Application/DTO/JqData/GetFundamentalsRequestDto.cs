using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.JqData;
/// <summary>
/// 股票收益数据请求
/// </summary>
public class GetFundamentalsRequestDto
{
	/// <summary>
	/// 表名称
	/// </summary>
	[Required(ErrorMessage = "表名不能为空")]
	public string Table { get; set; }
	/// <summary>
	/// 股票代码
	/// </summary>
	[Required(ErrorMessage = "股票代码不能为空")]
	public string Code { get; set; }
	/// <summary>
	/// 查询日期
	/// </summary>
	[Required(ErrorMessage = "查询日期不能为空")]
	public string Date { get; set; }
}