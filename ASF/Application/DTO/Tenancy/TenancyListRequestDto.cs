using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Tenancy
{
	/// <summary>
	/// 租户分页请求
	/// </summary>
	public class TenancyListRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 租户名
		/// </summary>
		[Required(ErrorMessage = "租户名称不能为空"),MinLength(2,ErrorMessage = "最少输入两个字符的租户名"),MaxLength(50,ErrorMessage = "最多输入50个字符的租户名")]
		public string Name { get; set; }
		/// <summary>
		/// 租户状态
		/// </summary>
		[Range(0,1,ErrorMessage = "只能输入0-1之间的状态")]
		public uint? Status { get; set; }
	}
}