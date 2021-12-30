using System;
using System.Threading.Tasks;
using ASF.Application.DTO.JqData;
using ASF.Domain.Services;
using ASF.Internal.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application;

/// <summary>
/// 聚集宽api
/// </summary>
[Authorize]
[Route("[controller]/[action]")]
public class JqDataController: ControllerBase
{
	private readonly IServiceProvider _serviceProvider;
	/// <summary>
	/// 聚集宽api
	/// </summary>
	public JqDataController(IServiceProvider serviceProvider)
	{
		_serviceProvider = serviceProvider;
	}
	/// <summary>
	/// 获取股票标的信息
	/// </summary>
	/// <returns></returns>
	[Authorize]
	[HttpGet]
	public async Task<Result<object>> GetAllSecurities()
	{
		return await _serviceProvider.GetRequiredService<JqDataService>().GetAllSecurities();
	}
	/// <summary>
	///  模拟 jq data run query方法
	/// </summary>
	/// <returns></returns>
	[Authorize]
	[HttpGet]
	public async Task<Result<object>> RunQuery([FromQuery] GetFundamentalsRequestDto dto)
	{
		// var a = DateTime.Now.ToString("yyyyMMdd").ToString();
		// var b = DateTime.Now.ToString("yyyy").ToString();
		return await _serviceProvider.GetRequiredService<JqDataService>().RunToShareQuery("stock_basic","");
		// return await _serviceProvider.GetRequiredService<JqDataService>().RunQuery(dto);
	}
}