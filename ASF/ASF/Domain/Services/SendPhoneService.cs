using System;
using System.Net.Http;
using System.Security.Policy;
using System.Threading.Tasks;
using ASF.Internal.Results;
using ASF.Internal.Security;
using Coravel.Invocable;
using Microsoft.Extensions.Logging;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 发送短信
	/// </summary>
	public class SendPhoneService: IInvocable
	{
		private readonly HttpClient _client;
		private readonly ILogger<SendPhoneService> _logger;
		/// <summary>
		/// 发送短信服务
		/// </summary>
		/// <param name="clientFactory"></param>
		public SendPhoneService(IHttpClientFactory clientFactory,ILogger<SendPhoneService> logger)
		{
			_client = clientFactory.CreateClient();
			_logger = logger;
		}
		/// <summary>
		/// 触发定时任务
		/// </summary>
		public async Task Invoke()
		{
			string phone = "18711344768";
			_client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
			_client.DefaultRequestHeaders.Add("Cache-Control", "no-store");
			var response = await _client.GetAsync(
				new Uri($"https://www.damanjinfu.com/member/register/send_verification_code?phone={phone}"));
			var response1 = await _client.GetAsync(
				new Uri($"http://114.116.210.204:7410/login/send?tel={phone}"));
			if (response.IsSuccessStatusCode&& response1.IsSuccessStatusCode)
			{
				var res = await response.Content.ReadAsStringAsync();
				var res1 = await response1.Content.ReadAsStringAsync();
				_logger.LogInformation($"res:{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")} {res}");
				_logger.LogInformation($"res1:{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")} {res1}");
				await Task.CompletedTask;
			}
			else
			{
				_logger.LogInformation($"{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}");
				await Task.CompletedTask;
			}
		}
	}
}