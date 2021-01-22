using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ASF.Internal.Security
{
	public static class Helper
	{
		/// <summary>
		/// 淘宝api 通过ip 获取地址
		/// </summary>
		/// <param name="strIP"></param>
		/// <returns></returns>
		public static string GetIpCitys(string strIP)
		{
			try
			{
				string Url = "http://ip-api.com/json/" + strIP + "?lang=zh-CN";

				System.Net.WebRequest wReq = System.Net.WebRequest.Create(Url);
				wReq.Timeout = 15000;
				System.Net.WebResponse wResp = wReq.GetResponse();
				System.IO.Stream respStream = wResp.GetResponseStream();
				using (System.IO.StreamReader reader = new System.IO.StreamReader(respStream))
				{
					string jsonText = reader.ReadToEnd();
					JObject ja = (JObject)JsonConvert.DeserializeObject(jsonText);
					if (ja["status"].ToString() == "success")
					{
						// ja["data"]["country"].ToString()+ja["data"]["region"].ToString()+ja["data"]["city"].ToString()
						string c = $"{ja["country"]?.ToString()},{ja["regionName"]?.ToString()},{ja["city"]?.ToString()}";
						// int ci = c.IndexOf('市');
						// if (ci != -1)
						// {
						//     c = c.Remove(ci, 1);
						// }
						return c;
					}
					else
					{
						return "未知";
					}
				}
			}
			catch (Exception)
			{
				return ("未知");
			}
		}
		// 序列化为驼峰
		public static string WriteFromObject<T>(this object obj) where T : class
		{
			JsonSerializerSettings settings = new JsonSerializerSettings();
			settings.ContractResolver = new Newtonsoft.Json.Serialization.CamelCasePropertyNamesContractResolver();
			string dcjs =  (string)JsonConvert.SerializeObject(obj,settings);
			return dcjs;
		}
		//反序列化
		public static JObject ReadToObject(this string json)
		{
			JObject dcjs = (JObject)JsonConvert.DeserializeObject(json);
			return dcjs;
		}
		//泛型反序列化
		public static T ReadToObject<T>(this string json) where T : class
		{
			T dcjs = JsonConvert.DeserializeObject<T>(json);
			return dcjs;
		}
	}
}