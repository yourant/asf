using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using ASF.Application.DTO.JqData;
using ASF.Domain.Values;
using ASF.Internal.Results;
using ASF.Internal.Security;
using ASF.Internal.Utils;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;

namespace ASF.Domain.Services;
/// <summary>
/// 聚宽领域服务
/// </summary>
public class JqDataService
{
	private readonly IMemoryCache _memoryCache;
	private readonly IHttpHelper _httpHelper;
	private readonly JQData _jqData;
	private const string JqToken = "JqToken";
	/// <summary>
	/// 聚宽领域服务
	/// </summary>
	public JqDataService(IMemoryCache memoryCache,IHttpHelper httpHelper,IOptions<JQData> options)
	{
		_memoryCache = memoryCache;
		_httpHelper = httpHelper;
		_jqData = options?.Value;
	}
	/// <summary>
	/// 获取登录token
	/// </summary>
	/// <returns></returns>
	private async Task<Result<string>> GetLoginToken()
	{
		if (_memoryCache.TryGetValue<string>(JqToken, out string token))
		{
			return Result<string>.ReSuccess(token);
		}
		var result = await _httpHelper.PostResponse(_jqData.Url, new
		{
			mob = _jqData.Mobile,
			pwd = _jqData.Password,
			method = _jqData.GetToken
		});
		if (!result.Contains("err"))
		{
			string t =  _memoryCache.Set<string>(JqToken,result, TimeSpan.FromMinutes(30));
			return Result<string>.ReSuccess(t);
		}
		else
		{
			return Result<string>.ReFailure(result,500);
		}
	}
	/// <summary>
	/// 组合数据
	/// </summary>
	/// <param name="data"></param>
	/// <returns></returns>
	private Task<Result<object>> GetData(string data)
	{
		string[] arr = data.Split(Environment.NewLine.ToCharArray(), StringSplitOptions.None);
		List<object> list = new List<object>();
		List<string> tableKey = arr[0].SpitArray();
		for (int i = 1; i < arr.Length; i++)
		{
			Dictionary<string, string> dic = new Dictionary<string, string>();
			dic.Add("key",i.ToString());
			for(int j = 0;j<tableKey.Count;j++)
			{
				dic.Add(tableKey[j],arr[i].SpitArray()[j]);
			}
			list.Add(dic);
		}
		return Result<object>.ReSuccess(new
		{
			columns = tableKey.Select(s=>new
			{
				title = s,
				dataIndex = s,
				key = s,
				width = "200px",
				ellipsis = new {
					showTitle = false,
				}
			}),
			list = list
		}).AsTask();
	}
	/// <summary>
	/// 获取所有标的数据
	/// </summary>
	/// <returns></returns>
	public async Task<Result<object>> GetAllSecurities()
	{
		//获取登录token
		var res = await this.GetLoginToken();
		if(!res.Success)
			return Result<object>.ReFailure(res.Message,res.Status);
		var data = await _httpHelper.PostResponse(_jqData.Url, new
		{
			method = "get_all_securities",
			token = res.Data, //token
			code = "stock"
		});
		return await this.GetData(data);
	}

	/// <summary>
	/// 获取股票收益数据
	/// </summary>
	/// <returns></returns>
	public async Task<Result<object>> GetFundamentals(GetFundamentalsRequestDto dto)
	{
		//获取登录token
		var res = await this.GetLoginToken();
		if(!res.Success)
			return Result<object>.ReFailure(res.Message,res.Status);
		var data = await _httpHelper.PostResponse(_jqData.Url, new
		{
			method = "get_fundamentals",
			token = res.Data, //token
			table = dto.Table,
			code = dto.Code,
			date = dto.Date,
			count = 1000
		});
		return await this.GetData(data);
	}
	/// <summary>
	/// 获取融资融券信息
	/// </summary>
	/// <returns></returns>
	public async Task<Result<object>> GetMtss(GetFundamentalsRequestDto dto)
	{
		//获取登录token
		var res = await this.GetLoginToken();
		if(!res.Success)
			return Result<object>.ReFailure(res.Message,res.Status);
		var data = await _httpHelper.PostResponse(_jqData.Url, new
		{
			method = "get_mtss",
			token = res.Data, //token
			table = dto.Table,
			code = dto.Code,
			date = dto.Date,
			count = 1000
		});
		return await this.GetData(data);
	}
	/// <summary>
	/// 模拟 jq data run query方法
	/// </summary>
	/// <param name="dto"></param>
	/// <returns></returns>
	public async Task<Result<object>> RunQuery(GetFundamentalsRequestDto dto)
	{
		if (dto.Table.Contains("finance."))
		{
			//获取登录token
			var res = await this.GetLoginToken();
			if(!res.Success)
				return Result<object>.ReFailure(res.Message,res.Status);
			Dictionary<string, string> dic = new Dictionary<string, string>()
			{
				["finance.STK_XR_XD"] = dto.Date.Contains("q") ? $"code#=#{dto.Code}" : $"report_date#=#{dto.Date}&code#=#{dto.Code}",
				["finance.STK_INCOME_STATEMENT"] = dto.Date.Contains("q") ? $"code#=#{dto.Code}" : $"end_date#=#{dto.Date}&code#=#{dto.Code}",
				["finance.STK_CASHFLOW_STATEMENT"] = dto.Date.Contains("q") ? $"code#=#{dto.Code}" : $"end_date#=#{dto.Date}&code#=#{dto.Code}",
				["finance.STK_BALANCE_SHEET"] = dto.Date.Contains("q") ? $"code#=#{dto.Code}" : $"end_date#=#{dto.Date}&code#=#{dto.Code}",
				["finance.STK_COMPANY_INFO"] = $"code#=#{dto.Code}",
				["finance.STK_STATUS_CHANGE"] = $"code#=#{dto.Code}",
				["finance.STK_LIST"] = $"code#=#{dto.Code}",
				["finance.STK_EXCHANGE_TRADE_INFO"] =  dto.Date.Contains("q") ? "" : $"date#=#{dto.Date}"
			};
			var data = await _httpHelper.PostResponse(_jqData.Url, new
			{
				method = "run_query",
				token = res.Data, //token
				table = dto.Table,
				conditions = dic[dto.Table],
				count = 1000
			});
			return await this.GetData(data);
		}else if (dto.Table.Equals("getMtss"))
		{
			return await this.GetMtss(dto);
		}
		else
		{
			return await this.GetFundamentals(dto);
		}
	}
	/// <summary>
	/// 查询to share
	/// </summary>
	/// <returns></returns>
	public async Task<Result<object>> RunToShareQuery(string apiName,string code)
	{
		object obj = !string.IsNullOrEmpty(code) ?  new
		{
			api_name = apiName,
			token = _jqData.ToShareToken,
			@params = new
			{
				ts_code = code,
				start_date = "20040101",
				end_date = DateTime.Now.ToString("yyyyMMdd").ToString()
			}
		} : new
		{
			api_name = apiName,
			token = _jqData.ToShareToken
		};
		var data = await _httpHelper.PostResponse<ToShareResponseDto>(_jqData.ToShareUrl,obj);
		List<object> list = new List<object>();
		for (int i = 1; i < data.Data.Items.Count; i++)
		{
			Dictionary<string, string> dic = new Dictionary<string, string>();
			dic.Add("key",i.ToString());
			for(int j = 0;j<data.Data.Fields.Count;j++)
			{
				dic.Add(data.Data.Fields[j],data.Data.Items[i][j]);
			}
			list.Add(dic);
		}
		return Result<object>.ReSuccess(new
		{
			list = list
		});
	}
}