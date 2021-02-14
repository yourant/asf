using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 创建账户
	/// </summary>
	public class AccountCreateRequestDto
	{
		/// <summary>
		/// 部门id
		/// </summary>
		public long? DepartmentId { get; set; }
		/// <summary>
		/// 租户id
		/// </summary>
		public long? TenancyId { get; set; }

		/// <summary>
		/// 昵称
		/// </summary>
		[MinLength(2,ErrorMessage = "账户昵称最少输入2个字符"),MaxLength(50,ErrorMessage = "账户昵称最多输入50个字符")]
		public string Name { get; set; }
		/// <summary>
		/// 用户名
		/// </summary>
		[Required(ErrorMessage = "账户名称不能为空"),MinLength(2,ErrorMessage = "账户名称最少输入2个字符"),MaxLength(50,ErrorMessage = "账户名称最多输入50个字符")]
		public string Username { get;  set; }
		/// <summary>
		/// 登录密码
		/// </summary>
		[Required(ErrorMessage = "账户密码不能为空"),MinLength(2,ErrorMessage = "账户密码最少输入2个字符"),MaxLength(255,ErrorMessage = "账户密码最多输入255个字符")]
		public string Password { get;  set; }

		/// <summary>
		/// 手机号码
		/// </summary>
		[RegularExpression(@"^1[0-9]{10}$",ErrorMessage = "手机号码不正确")]
		public string TelPhone { get;set; }
		/// <summary>
		/// 手机区号。默认 86
		/// </summary>
		public int Area { get; set; } = 86;

		/// <summary>
		/// 邮箱地址
		/// </summary>
		[RegularExpression(@"^[-\w\+]+(?:\.[-\w]+)*@[-a-z0-9]+(?:\.[a-z0-9]+)*(?:\.[a-z]{2,})$",ErrorMessage = "邮箱格式不正确")]
		public string Email { get; set; }
		/// <summary>
		/// 头像
		/// </summary>
		[MaxLength(255,ErrorMessage = "头像最多500个字符")]
		public string Avatar { get; set; }
		/// <summary>
		/// 状态
		/// </summary>
		[Range(0,1,ErrorMessage = "状态只能输入0-1之间的数字")]
		public uint? Status { get; set; }
		
		/// <summary>
		/// 性别
		/// </summary>
		[Range(0,2,ErrorMessage="性别只能输入0-2之间的数字")]
		public int? Sex { get; set; }
		/// <summary>
		/// 岗位id
		/// </summary>
		public List<long> PostId { get; set; }
	}
}