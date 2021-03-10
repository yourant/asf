using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 账户分页请求
	/// </summary>
	public class AccountListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 用户名
		/// </summary>
		[MinLength(2,ErrorMessage = "账户名称最少输入2个字符"),MaxLength(50,ErrorMessage = "账户名称最多输入50个字符")]
		public string Username { get;  set; }
		/// <summary>
		/// 手机号码
		/// </summary>
		[RegularExpression(@"^1[0-9]{10}$",ErrorMessage = "手机号码不正确")]
		public string Telephone { get;set; }
		/// <summary>
		/// 邮箱地址
		/// </summary>
		[RegularExpression(@"^[-\w\+]+(?:\.[-\w]+)*@[-a-z0-9]+(?:\.[a-z0-9]+)*(?:\.[a-z]{2,})$",ErrorMessage = "邮箱格式不正确")]
		public string Email { get; set; }
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
	}
}