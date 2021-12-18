﻿using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace ASF.Internal.Utils
{
  /// <summary>
  /// http请求接口辅助方法
  /// </summary>
  public class HttpHelper : IHttpHelper
  {
    private readonly HttpClient _client;
    /// <summary>
    /// 构造方法
    /// </summary>
    public HttpHelper(IHttpClientFactory httpClientFactory)
    {
      _client = httpClientFactory.CreateClient();
      _client.Timeout = TimeSpan.FromSeconds(60);
      _client.DefaultVersionPolicy = HttpVersionPolicy.RequestVersionExact;
    }
    /// <summary>
    /// put泛型请求
    /// </summary>
    public async Task<T> PutResponse<T>(string url, string putData) where T : class, new()
    {
      T result = default(T);
      HttpContent httpContent = new StringContent(putData);
      httpContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/json");
      httpContent.Headers.ContentType.CharSet = "utf-8";
      HttpResponseMessage response = await _client.PutAsync(url, httpContent);

      if (response.IsSuccessStatusCode)
      {
        Task<string> t = response.Content.ReadAsStringAsync();
        string s = t.Result;
        string json = JsonConvert.DeserializeObject(s).ToString();
        result = JsonConvert.DeserializeObject<T>(json);
      }
      return await Task.FromResult(result);
    }
    /// <summary>
    /// get 泛型请求
    /// </summary>
    public async Task<T> GetResponse<T>(string url) where T : class, new()
    {

      T result = default(T);


      _client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
      HttpResponseMessage response = await _client.GetAsync(new Uri(url));

      if (response.IsSuccessStatusCode)
      {
        Task<string> t = response.Content.ReadAsStringAsync();
        string s = t.Result;
        string json = JsonConvert.DeserializeObject(s).ToString();
        result = JsonConvert.DeserializeObject<T>(json);
      }
      return await Task.FromResult(result);
    }
    /// <summary>
    /// post泛型请求
    /// </summary>
    public async Task<T> PostResponse<T>(string url, Dictionary<string, string> dic) where T : class, new()
    {
      T result = default(T);

      FormUrlEncodedContent httpContent = new FormUrlEncodedContent(dic);
      // httpContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/json");
      // httpContent.Headers.ContentType.CharSet = "utf-8";

      HttpResponseMessage response = await _client.PostAsync(new Uri(url), httpContent);

      if (response.IsSuccessStatusCode)
      {
        Task<string> t = response.Content.ReadAsStringAsync();
        string s = t.Result;
        //Newtonsoft.Json
        string json = JsonConvert.DeserializeObject(s).ToString();
        result = JsonConvert.DeserializeObject<T>(json);
      }

      return await Task.FromResult(result);
    }
    /// <summary>
    /// post泛型请求 传入json对象
    /// </summary>
    public async Task<T> PostResponse<T>(string url, object content) where T : class, new()
    {
      T result = default(T);

      var httpContent = new JsonContent(content);
      // httpContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/json");
      // httpContent.Headers.ContentType.CharSet = "utf-8";
      HttpResponseMessage response = await _client.PostAsync(new Uri(url), httpContent);

      if (response.IsSuccessStatusCode)
      {
        Task<string> t = response.Content.ReadAsStringAsync();
        string s = t.Result;
        //Newtonsoft.Json
        string json = JsonConvert.DeserializeObject(s).ToString();
        result = JsonConvert.DeserializeObject<T>(json);
      }

      return await Task.FromResult(result);
    }
    /// <summary>
    /// post请求 传入json对象
    /// </summary>
    public async Task<string> PostResponse(string url, object content)
    {
      string result = string.Empty;
      var httpContent = new JsonContent(content);
      // httpContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/json");
      // httpContent.Headers.ContentType.CharSet = "utf-8";
      HttpResponseMessage response = await _client.PostAsync(new Uri(url), httpContent);

      if (response.IsSuccessStatusCode)
      {
        Task<string> t = response.Content.ReadAsStringAsync();
        result= t.Result;
      }

      return await Task.FromResult(result);
    }
  }
}
