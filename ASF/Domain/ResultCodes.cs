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
        public static ValueTuple<int, string> TenancyMatchExist = (10006, "不允许操作其他租户数据");
        public static ValueTuple<int, string> TenancyIsDelete = (10007, "租户已经被删除");
        //账户错误码
        public static ValueTuple<int, string> AccountUpdateError = (11000, "账户更新失败");
        public static ValueTuple<int, string> AccountOldPasswordAndNewPasswordSame = (11002, "新密码和旧密码不能一样，为了安全请重新输入");
        public static ValueTuple<int, string> AccountNotExist = (11003, "用户不存在");
        public static ValueTuple<int, string> AccountRoleAssignationFailed = (11004, "账户角色分配失败，请重试");
        public static ValueTuple<int, string> AccountNotAllowedLogin = (11005, "账户被禁止登陆，请联系管理员");
        public static ValueTuple<int, string> AccountUnavailable = (11006, "账户暂不可以使用");
        public static ValueTuple<int, string> AccountPasswordNotSame2 = (11007, "账户密码不匹配，失败{0}次之后自动锁定账号");
        public static ValueTuple<int, string> AccountPasswordNotSameOverrun = (11008, "登录失败超限，请30分钟之后再试");
        public static ValueTuple<int, string> AccountLoginExpired = (11009, "登录状态已过期，请重新登录");
        public static ValueTuple<int, string> AccountExist = (11010, "输入的账户名或手机号码或邮箱地址已经被人使用了");
        public static ValueTuple<int, string> AccountCreate = (11011, "账户创建失败");
        public static ValueTuple<int, string> AccountOldEmailError = (11012, "账户旧邮箱不匹配");
        public static ValueTuple<int, string> AccountOldTelPhoneError = (11013, "账户旧手机不匹配");
        public static ValueTuple<int, string> AccountExistTelPhoneError = (11014, "手机号码已经存在");
        public static ValueTuple<int, string> AccountExistEmailError = (11015, "邮箱已经存在");
        public static ValueTuple<int, string> AccountExistUserNameError = (11015, "账户名已经存在");
        public static ValueTuple<int, string> AccountExistTypeError = (11016, "账户登录类型错误");
        //角色错误码
        public static ValueTuple<int, string> RoleNotExist = (12000, "角色不存在");
        public static ValueTuple<int, string> RoleUnavailable = (12001, "{0}角色已禁止使用");
        public static ValueTuple<int, string> RoleCreateFailed = (12002, "创建角色失败");
        public static ValueTuple<int, string> RolePermissionAssignationFailed = (12003, "角色权限分配失败，请重试");
        public static ValueTuple<int, string> RoleIdNotExist = (12004, "角色id不能为空");
        public static ValueTuple<int, string> RoleNameExist = (12005, "角色名已经存在");
        public static ValueTuple<int, string> RoleModifyFailed = (12006, "角色修改失败");
        public static ValueTuple<int, string> RoleNotSuperFailed = (12007, "只有超级管理员才能操作");
        
        //权限错误码
        public static ValueTuple<int, string> PermissionNotExist = (13000, "权限不存在");
        public static ValueTuple<int, string> PermissionCreateError = (13001, "权限添加失败");
        public static ValueTuple<int, string> PermissionUpdateError = (13002, "权限修改失败");
        public static ValueTuple<int, string> PermissionDeleteError = (13003, "权限删除失败");
        public static ValueTuple<int, string> PermissionSysDeleteError = (13004, "系统权限不允许删除");
        public static ValueTuple<int, string> PermissionSystemNotModify = (13005, "{0}权限为系统权限无法修改");
        public static ValueTuple<int, string> PermissionApiNotExist = (13006, "权限功能不存在");
        public static ValueTuple<int, string> PermissionApiCreateError = (13007, "权限功能创建失败");
        public static ValueTuple<int, string> PermissionApiUpdateError = (13008, "权限功能修改失败");
        public static ValueTuple<int, string> PermissionSysApiUpdateError = (13009, "系统权限功能不允许修改");
        public static ValueTuple<int, string> PermissionSysApiDeleteError = (130010, "系统权限功能不允许删除");
        public static ValueTuple<int, string> PermissionApiPathExist = (13011, "存在相同的api地址");
        public static ValueTuple<int, string> PermissionMenuNotExist = (13012, "权限菜单不存在");
        public static ValueTuple<int, string> PermissionMenuTitleOrUrlExist = (13013, "存在相同的菜单标题或地址");
        public static ValueTuple<int, string> PermissionMenuCreateError = (13014, "权限菜单创建失败");
        public static ValueTuple<int, string> PermissionMenuUpdateError = (13015, "权限菜单修改失败");
        public static ValueTuple<int, string> PermissionMenuDeleteError = (13016, "权限菜单删除失败");
        public static ValueTuple<int, string> PermissionNameOrCodeExist = (13017, "权限名称或code 已经存在");
        public static ValueTuple<int, string> PermissionIdNotExist = (13018, "权限id不能为空");
        //日志记录
        public static ValueTuple<int, string> LogginDeletedCannoBeWithinThreeMonths = (14000, "三个月之内的日志不能删除");
        public static ValueTuple<int, string> LogginDeletedError = (14001, "删除日志失败");
        public static ValueTuple<int, string> LoggingNotExist = (14002, "没有这个日志");
        // 多语言
        public static ValueTuple<int, string> TranslateNotExist = (15000, "多语言不存在");
        public static ValueTuple<int, string> TranslateNameExist = (15001, "多语言名称已经存在");
        public static ValueTuple<int, string> TranslateCreateError = (15002, "多语言添加失败");
        public static ValueTuple<int, string> TranslateUpdateError = (15003, "多语言修改失败");
        public static ValueTuple<int, string> TranslateDeleteError = (15004, "多语言删除失败");
        
        // 部门
        public static ValueTuple<int, string> DepartmentNotExist = (16000, "部门不存在");
        public static ValueTuple<int, string> DepartmentNameExist = (16001, "部门已经存在");
        public static ValueTuple<int, string> DepartmentCreateError = (16002, "部门添加失败");
        public static ValueTuple<int, string> DepartmentUpdateError = (16003, "部门修改失败");
        public static ValueTuple<int, string> DepartmentUnavailable= (16004, "部门已被禁用");
        // 岗位
        public static ValueTuple<int, string> PostNotExist = (17000, "岗位不存在");
        public static ValueTuple<int, string> PostNameExist = (17001, "岗位名已经存在");
        public static ValueTuple<int, string> PostCreateError = (17002, "岗位添加失败");
        public static ValueTuple<int, string> PostModifyError = (17003, "岗位修改失败");
        public static ValueTuple<int, string> PostDeleteError = (17004, "岗位删除失败");
        public static ValueTuple<int, string> PostUnavailable= (16004, "部门已被禁用");
    }
}
