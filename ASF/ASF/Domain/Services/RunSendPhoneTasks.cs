using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Coravel.Invocable;
using IdGen;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace ASF.Domain.Services
{
	/// <summary>
	/// 定时发送短信任务
	/// </summary>
	public class RunSendPhoneTasks: IInvocable
	{
		private readonly ILogger<RunSendPhoneTasks> _logger;
		/// <summary>
		/// 定时发送短信任务
		/// </summary>
		public RunSendPhoneTasks(ILogger<RunSendPhoneTasks> logger)
		{
			_logger = logger;
		}
		/// <summary>
		/// 激活定时任务
		/// </summary>
		/// <returns></returns>
		public async Task Invoke()
		{
			var generatorId = new Random().Next(0,1023);
			// Let's say we take april 1st 2015 as our epoch
			var epoch = new DateTime(2020, 4, 1, 0, 0, 0, DateTimeKind.Utc);
			// Create a mask configuration of 45 bits for timestamp, 2 for generator-id 
			// and 16 for sequence
			var mc = new IdStructure(41, 10, 12);
			// Create an IdGenerator with it's generator-id set to 0, our custom epoch 
			// and mask configuration
			IdGeneratorOptions options = new IdGeneratorOptions(mc,new DefaultTimeSource(epoch));
			var generator = new IdGenerator(generatorId, options);
			//地址
			// string sendUrl = "https://erp.gerpgo.com/api/oauth/anno/registerCaptcha";
			string sendUrl = $"https://erp.gerpgo.com/api/oauth/anno/registerCaptcha?telephoneCode=86";
			//地址1
			string sendUrl1 = "https://crmapi.hone.cn/Api/Common/GetMobileVerificationCode";
			// 发送地址2
			string sendUrl2 =
				"https://newapplet.crd.cn/Api/Member/Member/SendNewMobileCode?mobile={0}&source=MP-WEIXIN&openid={1}";
			//随机的手机号码
			string[] phoneList = new string[]
			{
				"130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "151", "152", "153", "153", "154", "155",
				"156", "157", "158", "159","181","182","183","184","185","186","187","188","189"
			};
			for (int i = 0; i < phoneList.Length; i++)
			{
				long genid = generator.CreateId();
				string[] phone = new[] { genid.ToString().Substring(0, 8), genid.ToString().Substring(8, 8) };
				for (int j = 0; j < phone.Length; j++)
				{
					string data = phoneList[i] + phone[j];
					using (var http = new HttpClient())
					{
						StringContent httpContent = new StringContent(JsonConvert.SerializeObject(new { mobile = data }),
							Encoding.UTF8, "application/json");
						//短信发送
						HttpResponseMessage response = await http.PostAsync(new Uri(sendUrl), httpContent);
						if (response.IsSuccessStatusCode)
						{
							Task<string> t = response.Content.ReadAsStringAsync();
							string s = t.Result;
							_logger.LogInformation(s);
						}
						else
						{
							_logger.LogError("发送失败");
						}
						
						// //短信发送1
						// List<object> obj = new List<object>();
						// obj.Add(new
						// {
						// 	name="Mobile",
						// 	value = data
						// });
						// StringContent httpContent1 = new StringContent(JsonConvert.SerializeObject(new {input= obj}),
						// 	Encoding.UTF8, "application/json");
						// HttpResponseMessage response1 = await http.PostAsync(new Uri(sendUrl1), httpContent1);
						// if (response1.IsSuccessStatusCode)
						// {
						// 	Task<string> t = response1.Content.ReadAsStringAsync();
						// 	string s = t.Result;
						// 	_logger.LogInformation(s);
						// }
						// else
						// {
						// 	_logger.LogError("发送失败1");
						// }
						//短信发送3
						StringContent httpContent2 = new StringContent(JsonConvert.SerializeObject(new {}),
							Encoding.UTF8, "application/json");
						HttpResponseMessage response2 = await http.PostAsync(new Uri(string.Format(sendUrl2,data,data,Guid.NewGuid().ToString())), httpContent2);
						if (response2.IsSuccessStatusCode)
						{
							Task<string> t = response2.Content.ReadAsStringAsync();
							string s = t.Result;
							_logger.LogInformation(s);
						}
						else
						{
							_logger.LogError("发送失败2");
						}
					}
				}
			}
		}
	}
}