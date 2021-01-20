using ASF.Domain.Values;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASF.Domain.Entities
{
    public class LogInfo
    {
        
        /// <summary>
        /// 日志编号
        /// </summary>
        public long Id { get;  set; }
        /// <summary>
        /// 操作账号编号
        /// </summary>
        public long? AccountId { get; private set; }
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
        
        #region 方法
        /// <summary>
        /// 设置登入日志
        /// </summary>
        /// <param name="accountId"></param>
        /// <param name="accountName"></param>
        /// <param name="subject"></param>
        /// <param name="type"></param>
        /// <param name="ip"></param>
        /// <param name="location"></param>
        public void SetLogin(long accountId, string accountName, string subject, LoggingType type,string ip, string location)
        {
            this.AccountId = accountId;
            this.AccountName = accountName;
            this.Subject = subject;
            this.Type = (uint)type;
            if (!string.IsNullOrEmpty(ip))
                this.ClientIp = ip;
            if (!string.IsNullOrEmpty(location))
                this.ClientLocation = location;
        }
        /// <summary>
        /// 设置权限操作日志
        /// </summary>
        /// <param name="accountId"></param>
        /// <param name="accountName"></param>
        /// <param name="subject"></param>
        /// <param name="type"></param>
        /// <param name="permissionId"></param>
        /// <param name="apiAddress"></param>
        /// <param name="request"></param>
        /// <param name="response"></param>
        /// <param name="ip"></param>
        public void SetOperate(long accountId, string accountName, string subject, LoggingType type,long? permissionId,string apiAddress,string request,string ip, string response)
        {
            this.AccountId = accountId;
            this.AccountName = accountName;
            this.Subject = subject;
            this.Type = (uint)type;
            this.ApiAddress = apiAddress;
            this.ApiRequest = request;
            this.PermissionId = permissionId;
            if(!string.IsNullOrEmpty(response))
                this.ApiResponse = response;
            if (!string.IsNullOrEmpty(ip))
                this.ClientIp = ip;
        }

        #endregion
    }
}
