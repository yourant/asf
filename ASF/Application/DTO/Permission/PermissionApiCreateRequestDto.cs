using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	/// <summary>
	/// 创建权限功能api请求
	/// </summary>
	public class PermissionApiCreateRequestDto
	{
		/// <summary>
		/// 权限id
		/// </summary>
		public long? PermissionId { get; set; }

		/// <summary>
		/// 名称
		/// </summary>
		[Required(ErrorMessage = "权限功能名不能为空")]
		[MinLength(2,ErrorMessage = "最少输入两个字符的权限功能名")]
		[MaxLength(50,ErrorMessage = "最多输入50个字符的权限功能名")]
		public string Name { get; set; }
		/// <summary>
		/// api 功能 状态
		/// </summary>
		[Range(0,1,ErrorMessage = "权限功能状态只能为0-1之间的数字")]
		public uint? Status { get; set; }
		/// <summary>
		///  api功能类型
		/// </summary>
		[Range(1,2,ErrorMessage = "权限功能类型只能为1-2指甲你的数字")]
		public uint? Type { get; set; }
		/// <summary>
		/// api路径
		/// </summary>
		[Required(ErrorMessage = "权限功能路径不能为空")]
		[MaxLength(500,ErrorMessage = "权限功能路径最多输入500个字符")]
		public string Path { get; set; }
		/// <summary>
		/// Http 方法
		/// </summary>
		[Required(ErrorMessage = "请求方法不能为空")]
		[MaxLength(30,ErrorMessage = "最多输入30个字符的请求方法")]
		public string HttpMethods { get; set; }
		/// <summary>
		/// 是否日志记录
		/// </summary>
		[Range(0,1,ErrorMessage = "是否记录日志权限功能只能为0-1之间的数字")]
		public uint? IsLogger { get; set; }
		/// <summary>
		/// 描述
		/// </summary>
		[MaxLength(ErrorMessage = "最多输入500个字符的描述")]
		public string Description { get; set; }
		/// <summary>
		/// 是否系统权限
		/// </summary>
		[Range(0,1,ErrorMessage = "是否为系统权限功能只能为0-1之间的数字")]
		public uint? IsSystem { get; set; }
	}
}