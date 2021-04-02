using System.Collections;
using System.Collections.Generic;

namespace ASF.Application.DTO.Department
{
    /// <summary>
    /// 部分分级
    /// </summary>
    public class DepartmentTreeItem<T>
    {
        /// <summary>
        /// 部门名称
        /// </summary>
        public string Label { get; set; }
        /// <summary>
        /// 部门ID
        /// </summary>
        public long Value { get; set; }
        /// <summary>
        /// 部门子集
        /// </summary>
        public IEnumerable<DepartmentTreeItem<T>> Children { get; set; }
    }
}