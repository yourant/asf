using System.Collections.Generic;

namespace ASF.Internal.Security
{
	public class TreeItem<T>
	{
		public T Data { get; set; }
		public IEnumerable<TreeItem<T>> Children { get; set; }
	}
}