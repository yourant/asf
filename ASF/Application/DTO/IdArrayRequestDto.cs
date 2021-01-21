using System.Collections.Generic;

namespace ASF.Application.DTO
{
	public class IdArrayRequestDto<T>
	{
		/// <summary>
		/// id 数组集合
		/// </summary>
		public List<T> Ids { get; set; }
	}
}