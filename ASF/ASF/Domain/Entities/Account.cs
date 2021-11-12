using ASF.Domain.Values;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.RegularExpressions;
using ASF.Internal;
using ASF.Internal.Results;
using ASF.Internal.Security;
using AccessToken = ASF.Domain.Values.AccessToken;

namespace ASF.Domain.Entities
{
    /// <summary>
    /// 账户模型
    /// </summary>
    public class Account
    {
        /// <summary>
        /// 账户模型
        /// </summary>
        public Account()
        {
            Role = new JoinCollectionFacade<Role, Account, AccountRole>(this, AccountRole);
            Post = new JoinCollectionFacade<Post, Account, AccountPost>(this, AccountPost);
        }

        #region 属性
        
        /// <summary>
        /// 编号
        /// </summary>
        public long Id { get;  set; }
        /// <summary>
        /// 租户id
        /// </summary>
        public long? TenancyId { get; set; }
        /// <summary>
        /// 部门id
        /// </summary>
        public long? DepartmentId { get; set; }
        /// <summary>
        /// 昵称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        public string Username { get;  set; }
        /// <summary>
        /// 登录密码
        /// </summary>
        public string Password { get;  private set; }

        /// <summary>
        /// 密码加盐
        /// </summary>
        public string PasswordSalt { get; set; } = Guid.NewGuid().ToString();

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
        /// 关联角色
        /// </summary>
        [NotMapped]
        public ICollection<Role> Role { get; }
        /// <summary>
        /// 角色账户中间表
        /// </summary>
        public ICollection<AccountRole> AccountRole { get; } = new List<AccountRole>();
        /// <summary>
        /// 关联岗位
        /// </summary>
        [NotMapped]
        public ICollection<Post> Post { get; }
        /// <summary>
        /// 角色账户中间表
        /// </summary>
        public ICollection<AccountPost> AccountPost { get; } = new List<AccountPost>();

        /// <summary>
        /// 多个用户关联一个租户
        /// </summary>
        [NotMapped] 
        public Tenancy Tenancys { get; set; }
        /// <summary>
        /// 一个用户关联一个部门
        /// </summary>
        [NotMapped] 
        public Department Department { get; set; }
        
        #endregion

        #region 方法
        /// <summary>
        /// 设置用户密码
        /// </summary>
        public Result SetPassword(string passsword)
        {
            // this.PasswordSalt = Guid.NewGuid().ToString();
            string newPassword = PasswordHelper.GeneratePasswordHash(passsword, this.PasswordSalt);
            if(newPassword == this.Password)
                return Result.ReFailure(ResultCodes.AccountOldPasswordAndNewPasswordSame);
            this.Password = newPassword;
            return Result.ReSuccess();
        }
        /// <summary>
        /// 设置用户手机号码
        /// </summary>
        public void SetPhone(string phone, int area)
        {
            this.TelPhone = new PhoneNumber(phone,area).ToString();
        }
        /// <summary>
        /// 设置用户邮箱
        /// </summary>
        public void SetEmail(string email)
        {
            this.Email = email;
        }
        /// <summary>
        /// 设置用户名
        /// </summary>
        /// <param name="username"></param>
        public void SetUserName(string username)
        {
            this.Username = username;
        }

        /// <summary>
        /// 是否允许登录
        /// </summary>
        /// <returns></returns>
        public bool IsAllowLogin()
        {
            var isDeleted = this.IsDeleted;
            if (isDeleted != null && (Status)isDeleted == Values.Status.Yes)
                return false;
            if (this.Status != null && (EnabledType)this.Status != EnabledType.Enabled)
                return false;
            return true;
        }
        /// <summary>
        /// 设置登录信息
        /// </summary>
        /// <param name="token"></param>
        /// <param name="ip"></param>
        public void SetLoginInfo(AccessToken token, string ip)
        {
            if(!string.IsNullOrEmpty(token.Token))
                this.Token = token.Token;
            if (!string.IsNullOrEmpty(token.RefreshToken))
                this.RefreshToken = token.RefreshToken;
            this.Expired = token.Expired;
            this.LoginTime = DateTime.UtcNow;
            if (!string.IsNullOrEmpty(ip))
            {
                this.LoginIp = ip;
                if (ip.Equals("127.0.0.1"))
                {
                    this.LoginLocation = "本地";
                }
                else
                {
                    this.LoginLocation = Helper.GetIpCitys(ip);
                }
            }
        }

        /// <summary>
        /// 删除
        /// </summary>
        public void Delete()
        {
            this.IsDeleted = (uint)Values.Status.Yes;
        }
        #endregion
    }
}
