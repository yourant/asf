namespace ASF.Domain.Entities
{
  /// <summary>
  /// 多语言表
  /// </summary>
  public class Translate
  {
    /// <summary>
    /// 多语言id
    /// </summary>
    public long Id { get; set; }
    /// <summary>
    /// 多语言名称
    /// </summary>
    public string Name { get; set; }

    /// <summary>
    ///  key
    /// </summary>
    public string Key { get; set; }
    /// <summary>
    /// 多语言值
    /// </summary>
    public string Value { get; set; }
  }
}