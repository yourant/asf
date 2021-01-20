using System.ComponentModel.DataAnnotations;

namespace ASF.Application.DTO
{
	public class PermissionApiRequestDto: PaginationRequestDto
	{
		/// <summary>
		/// 权限id
		/// </summary>
		public long? PermissionId { get; set; }
		/// <summary>
		/// 权限功能类型
		/// </summary>
		public uint? Type { get; set; }
		/// <summary>
		/// 权限功能状态
		/// </summary>
		public uint? Status { get; set; }
		/// <summary>
		/// 权限功能名称
		/// </summary>
		[MinLength(1,ErrorMessage = "最少输入1个字符的api名称")]
		[MaxLength(50,ErrorMessage = "最多输入50个字符的api名称")]
		public string Name { get; set; }
		/// <summary>
		/// api请求方法
		/// </summary>
		[MinLength(1,ErrorMessage = "最少输入1个字符的请求方法")]
		[MaxLength(5,ErrorMessage = "最多输入5个字符的请求方法")]
		public string HttpMethod { get; set; }
		/// <summary>
		/// api请求路径
		/// </summary>
		[MinLength(1,ErrorMessage = "最少输入1个字符的请求路径")]
		[MaxLength(100,ErrorMessage = "最多输入100个字符的请求路径")]
		public string Path { get; set; }
	}
}