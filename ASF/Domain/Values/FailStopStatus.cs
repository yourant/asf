using System.ComponentModel;

namespace ASF.Domain.Values
{
    public enum FailStopStatus
    {
        [Description("禁用")]
        Disabled = 0,
        [Description("启用")]
        Enabled = 1
    }
}