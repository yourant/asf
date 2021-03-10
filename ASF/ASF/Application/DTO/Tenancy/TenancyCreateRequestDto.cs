using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO.Tenancy
{
	/// <summary>
	/// 创建租户
	/// </summary>
	public class TenancyCreateRequestDto
	{
		/// <summary>
		/// 租户名
		/// </summary>
		[Required(ErrorMessage = "租户名称不能为空"),MinLength(2,ErrorMessage = "最少输入两个字符的租户名"),MaxLength(50,ErrorMessage = "最多输入50个字符的租户名")]
		public string Name { get; set; }
		/// <summary>
		/// 排序
		/// </summary>
		[Range(0,100,ErrorMessage = "只能输入0-100之间的排序")]
		public int? Sort { get; set; }
		/// <summary>
		/// 等级
		/// </summary>
		[Range(0,10,ErrorMessage = "只能输入0-10之间的等级")]
		public int? Level { get; set; }
		/// <summary>
		/// 租户状态
		/// </summary>
		[Range(0,1,ErrorMessage = "只能输入0-1之间的状态")]
		public uint? Status { get; set; }
		/// <summary>
		/// 是否删除
		/// </summary>
		[Range(0,1,ErrorMessage = "只能输入0-1之间的软删除值")]
		public uint? IsDeleted { get; set; }
	}
}