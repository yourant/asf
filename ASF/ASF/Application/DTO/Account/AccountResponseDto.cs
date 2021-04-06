using System;
using System.Collections.Generic;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 账户响应数据
	/// </summary>
	public class AccountResponseDto
	{
		/// <summary>
		/// 账户key
		/// </summary>
		public long Key { get; set; }
		/// <summary>
		/// 租户id
		/// </summary>
		public long? TenancyId { get; set; }
		 /// <summary>
        /// 编号
        /// </summary>
        public long Id { get;  set; }
		 /// <summary>
        /// 昵称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        public string Username { get;  set; }
        
        /// <summary>
        /// 手机号码
        /// </summary>
        public string TelPhone { get; private set; }
        /// <summary>
        /// 邮箱地址
        /// </summary>
        public string Email { get; private set; }
        /// <summary>
        /// 头像
        /// </summary>
        public string Avatar { get; set; }
        /// <summary>
        /// 状态
        /// </summary>
        public uint? Status { get; set; }
        /// <summary>
        /// 是否删除
        /// </summary>
        public uint? IsDeleted { get;  set; }
        /// <summary>
        /// 性别
        /// </summary>
        public uint? Sex { get; set; }
        /// <summary>
        /// 创建用户
        /// </summary>
        public long? CreateId { get;  set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }
        /// <summary>
        /// 最后登录IP
        /// </summary>
        public string LoginIp { get;  set; }
        /// <summary>
        /// 最后登录时间
        /// </summary>
        public DateTime? LoginTime { get;  set; }
        /// <summary>
        /// 最近登录位置
        /// </summary>
        public string LoginLocation { get; set; }
        /// <summary>
        /// Token
        /// </summary>
        public string Token { get;  set; }
        /// <summary>
        /// 刷新令牌
        /// </summary>
        public string RefreshToken { get;  set; }
        /// <summary>
        /// 过期时间
        /// </summary>
        public DateTime? Expired { get;  set; }
        /// <summary>
		/// 账户角色
		/// </summary>
		public List<object> Roles { get; set; }
		/// <summary>
		/// 账户对应部门
		/// </summary>
		public object Department { get; set; }
		/// <summary>
		/// 账户对应岗位
		/// </summary>
		public List<object> Posts { get; set; }
		/// <summary>
		/// 账户对应租户
		/// </summary>
		public object Tenancys { get; set; }
	}
}