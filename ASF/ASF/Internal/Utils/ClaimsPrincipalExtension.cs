using System.Security.Claims;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

namespace ASF.Internal.Utils
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
      string role = principal.FindFirst("role")?.Value;
      if (string.IsNullOrEmpty(role))
        return false;
      return role.Contains("superadmin");
    }

    /// <summary>
    /// 拆分标记
    /// </summary>
    /// <typeparam name="TEnum"></typeparam>
    /// <param name="value"></param>
    /// <returns></returns>
    public static IEnumerable<TEnum> SplitFlags<TEnum>(this TEnum value) where TEnum : struct
    {
      var type = value.GetType();
      // 是否枚举.
      if (!type.IsEnum)
        throw new ArgumentException();
      // 是否含有特性: [Flags]
      if (type.GetCustomAttributes(typeof(FlagsAttribute), false).Length == 0)
        throw new NotSupportedException();

      // 准许使用的枚举类型有 byte、 sbyte、 short、 ushort、 int、 uint、 long 或 ulong。
      var code = Type.GetTypeCode(type);
      // 此处性能有待提高
      switch (code)
      {
        case TypeCode.SByte:
          {
            return BitsExtensions
                .GetOnes((SByte)(Object)value)
                .Where(i => type.IsEnumDefined(i))
                .Select(i => (TEnum)(Object)i);
          }
        case TypeCode.Byte:
          {
            return BitsExtensions
                .GetOnes((Byte)(Object)value)
                .Where(i => type.IsEnumDefined(i))
                .Select(i => (TEnum)(Object)i);
          }
        case TypeCode.Int16:
          {
            return BitsExtensions
                .GetOnes((Int16)(Object)value)
                .Where(i => type.IsEnumDefined(i))
                .Select(i => (TEnum)(Object)i);
          }
        case TypeCode.UInt16:
          {
            return BitsExtensions
                .GetOnes((UInt16)(Object)value)
                .Where(i => type.IsEnumDefined(i))
                .Select(i => (TEnum)(Object)i);
          }
        case TypeCode.Int32:
          {
            return BitsExtensions
                .GetOnes((Int32)(Object)value)
                .Where(i => type.IsEnumDefined(i))
                .Select(i => (TEnum)(Object)i);
          }
        case TypeCode.UInt32:
          {
            return BitsExtensions
                .GetOnes((UInt32)(Object)value)
                .Where(i => type.IsEnumDefined(i))
                .Select(i => (TEnum)(Object)i);
          }
        case TypeCode.Int64:
          {
            return BitsExtensions
                .GetOnes((Int64)(Object)value)
                .Where(i => type.IsEnumDefined(i))
                .Select(i => (TEnum)(Object)i);
          }
        case TypeCode.UInt64:
          {
            return BitsExtensions
                .GetOnes((UInt64)(Object)value)
                .Where(i => type.IsEnumDefined(i))
                .Select(i => (TEnum)(Object)i);
          }
        default:
          throw new NotSupportedException();
      }
    }
    /// <summary>
    /// 状态枚举的转换拓展
    /// </summary>
    public static string GetEnumDescription(this Enum data)
    {
      var dataType = data.GetType();
      var filed = data.GetType().GetField(data.ToString());
      if (filed == null)
        return string.Empty;
      var attributes = filed.GetCustomAttributes(typeof(DescriptionAttribute), true);
      if (attributes.Length > 0)
      {
        var enumDescriptionAttribute = attributes[0];
        if (enumDescriptionAttribute != null)
          return ((DescriptionAttribute)enumDescriptionAttribute).Description;
      }
      return string.Empty;
    }
    /// <summary>
    /// 获取枚举备注
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>
    public static string GetEnumDescription(this object data)
    {
      var dataType = data.GetType();
      var filed = data.GetType().GetField(data.ToString());
      if (filed == null)
        return string.Empty;
      var attributes = filed.GetCustomAttributes(typeof(DescriptionAttribute), true);
      if (attributes.Length > 0)
      {
        var enumDescriptionAttribute = attributes[0];
        if (enumDescriptionAttribute != null)
          return ((DescriptionAttribute)enumDescriptionAttribute).Description;
      }
      return string.Empty;
    }
  }
}
