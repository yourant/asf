using ASF.Internal.Results;
using System;

namespace ASF.Domain
{
    /// <summary>
    /// 错误结果代码
    /// </summary>
    public class ResultCodes : BaseResultCodes
    {
        #pragma warning disable 1591
        
        public static ValueTuple<int, string> TenancyNameExist = (10001, "输入的租户名已经被使用，请重新输入");
        public static ValueTuple<int, string> TenancyNotExist = (10002, "没有这个租户");
        public static ValueTuple<int, string> TenancyCreateFailure = (10003, "创建租户失败");
        public static ValueTuple<int, string> TenancyModifyFailure = (10004, "创建租户失败");
        public static ValueTuple<int, string> TenancyDisabled = (10005, "租户被禁用");
        //账户错误码
        public static ValueTuple<int, string> AccountUpdateError = (10001, "账户更新失败");
        public static ValueTuple<int, string> AccountPermissionEmpty = (10002, "账户为空");
        public static ValueTuple<int, string> AccountUsernameExist = (10001, "输入的用户名已经被使用，请重新输入");
        public static ValueTuple<int, string> AccountOldPasswordAndNewPasswordSame = (10002, "新密码和旧密码不能一样，为了安全请重新输入");
        public static ValueTuple<int, string> AccountTelephoneExist = (10003, "输入的手机号码已经被使用，请重新输入");
        public static ValueTuple<int, string> AccountNotExist = (10004, "用户不存在");
        public static ValueTuple<int, string> AccountEmailExist = (10006, "输入的邮箱地址已经被使用，请重新输入");
        public static ValueTuple<int, string> AccountRoleAssignationFailed = (10007, "账户角色分配失败，请重试");
        public static ValueTuple<int, string> AccountNotAllowedLogin = (10008, "账户被禁止登陆，请联系管理员");
        public static ValueTuple<int, string> AccountUnavailable = (10009, "账户暂不可以使用");
        public static ValueTuple<int, string> AccountPasswordNotSame = (10010, "账户密码不匹配");
        public static ValueTuple<int, string> AccountPasswordNotSame2 = (10011, "账户密码不匹配，失败{0}次之后自动锁定账号");
        public static ValueTuple<int, string> AccountPasswordNotSameOverrun = (10012, "登录失败超限，请30分钟之后再试");
        public static ValueTuple<int, string> AccountResetPasswordPasswordNotSame = (10013, "重置密码失败，管理员密码不匹配");
        public static ValueTuple<int, string> AccountSuperAdminNoAllowedModify = (10014, "超级管理员不能修改");
        public static ValueTuple<int, string> AccountSuperAdminNoAllowedDelete = (10015, "超级管理员不能删除");
        public static ValueTuple<int, string> AccountLoginExpired = (10016, "登录状态已过期，请重新登录");


        //角色错误码
        public static ValueTuple<int, string> RoleNotExist = (11000, "角色不存在");
        public static ValueTuple<int, string> RoleUnavailable = (11001, "{0}角色已禁止使用");
        public static ValueTuple<int, string> RoleCreateFailed = (11003, "创建角色失败");
        public static ValueTuple<int, string> RolePermissionAssignationFailed = (11004, "角色权限分配失败，请重试");

        //权限错误码
        public static ValueTuple<int, string> PermissionNotExist = (12000, "权限不存在");
        public static ValueTuple<int, string> PermissionCreateError = (12001, "权限添加失败");
        public static ValueTuple<int, string> PermissionUpdateError = (12002, "权限修改失败");
        public static ValueTuple<int, string> PermissionDeleteError = (12003, "权限删除失败");
        public static ValueTuple<int, string> PermissionSysDeleteError = (12004, "系统权限不允许删除");
        public static ValueTuple<int, string> PermissionSystemNotModify = (12005, "{0}权限为系统权限无法修改");
        public static ValueTuple<int, string> PermissionApiNotExist = (12006, "权限功能不存在");
        public static ValueTuple<int, string> PermissionApiCreateError = (12007, "权限功能创建失败");
        public static ValueTuple<int, string> PermissionApiUpdateError = (12008, "权限功能修改失败");
        public static ValueTuple<int, string> PermissionSysApiUpdateError = (12009, "系统权限功能不允许修改");
        public static ValueTuple<int, string> PermissionSysApiDeleteError = (120010, "系统权限功能不允许删除");
        public static ValueTuple<int, string> PermissionApiPathExist = (12011, "存在相同的api地址");
        public static ValueTuple<int, string> PermissionMenuNotExist = (12012, "权限菜单不存在");
        public static ValueTuple<int, string> PermissionMenuTitleOrUrlExist = (12013, "存在相同的菜单标题或地址");
        public static ValueTuple<int, string> PermissionMenuCreateError = (12014, "权限菜单创建失败");
        public static ValueTuple<int, string> PermissionMenuUpdateError = (12015, "权限菜单修改失败");
        public static ValueTuple<int, string> PermissionMenuDeleteError = (12016, "权限菜单删除失败");
        public static ValueTuple<int, string> PermissionNameOrCodeExist = (12017, "权限名称或code 已经存在");
        //日志记录
        public static ValueTuple<int, string> LogginDeletedCannoBeWithinThreeMonths = (13000, "三个月之内的日志不能删除");
        public static ValueTuple<int, string> LogginDeletedError = (13001, "删除日志失败");
        // 多语言
        public static ValueTuple<int, string> TranslateNotExist = (14000, "多语言不存在");
        public static ValueTuple<int, string> TranslateNameExist = (14001, "多语言名称已经存在");
        public static ValueTuple<int, string> TranslateCreateError = (14002, "多语言添加失败");
        public static ValueTuple<int, string> TranslateUpdateError = (14003, "多语言修改失败");
        public static ValueTuple<int, string> TranslateDeleteError = (14004, "多语言删除失败");
        
        // 部门
        public static ValueTuple<int, string> DepartmentNotExist = (15000, "部门不存在");
        public static ValueTuple<int, string> DepartmentNameExist = (15001, "部门已经存在");
        public static ValueTuple<int, string> DepartmentCreateError = (15002, "部门添加失败");
        public static ValueTuple<int, string> DepartmentUpdateError = (15003, "部门修改失败");
        public static ValueTuple<int, string> DepartmentUnavailable= (15004, "部门已被禁用");
    }
}
