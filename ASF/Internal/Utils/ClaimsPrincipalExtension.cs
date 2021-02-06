using System.Security.Claims;
using System;

namespace Microsoft.AspNetCore.Mvc
{
    /// <summary>
    /// ClaimsPrincipal 扩展类
    /// </summary>
    public static class ClaimsPrincipalExtension
    {
        /// <summary>
        /// 账户Id
        /// </summary>
        /// <param name="principal"></param>
        /// <returns></returns>
        public static long UserId(this ClaimsPrincipal principal)
        {
            var sub = principal.FindFirst("sub")?.Value;
            if (string.IsNullOrEmpty(sub))
                sub = principal.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(sub))
                return 0;
            return Convert.ToInt64(sub);
        }
        /// <summary>
        /// 名称
        /// </summary>
        /// <param name="principal"></param>
        /// <returns></returns>
        public static string Name(this ClaimsPrincipal principal)
        {
            return principal.FindFirst("name")?.Value;
        }
        /// <summary>
        /// 昵称
        /// </summary>
        /// <param name="principal"></param>
        /// <returns></returns>
        public static string NickName(this ClaimsPrincipal principal)
        {
            return principal.FindFirst("nickname")?.Value;
        }
        /// <summary>
        /// 租户id
        /// </summary>
        /// <param name="principal"></param>
        /// <returns></returns>
        public static string TenancyId(this ClaimsPrincipal principal)
        {
            return principal.FindFirst("tenancy_id")?.Value;
        }
        /// <summary>
        /// 是否为超级管理员角色
        /// </summary>
        /// <param name="principal"></param>
        /// <returns></returns>
        public static bool IsSuperRole(this ClaimsPrincipal principal)
        {
            string role = principal.FindFirst("http://schemas.microsoft.com/ws/2008/06/identity/claims/role")?.Value;
            if (string.IsNullOrEmpty(role))
                return false;
            return role.Contains("superadmin") ? true : false;
        }
    }
}
