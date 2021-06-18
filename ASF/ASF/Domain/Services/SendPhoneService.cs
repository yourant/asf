using System;
using System.Net.Http;
using System.Security.Policy;
using System.Threading.Tasks;
using ASF.Internal.Results;
using Coravel.Invocable;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 发送短信
	/// </summary>
	public class SendPhoneService: IInvocable
	{
		private readonly HttpClient _client;

		/// <summary>
		/// 发送短信服务
		/// </summary>
		/// <param name="clientFactory"></param>
		public SendPhoneService(IHttpClientFactory clientFactory)
		{
			_client = clientFactory.CreateClient();
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
				await Task.CompletedTask;
			}
			else
			{
				await Task.CompletedTask;
			}
		}
	}
}