using System;
using System.ComponentModel.DataAnnotations;

namespace ASF.Domain.Values
{
    /// <summary>
    /// 手机号码
    /// </summary>
    public class PhoneNumber : IEquatable<PhoneNumber>, IValueObject
    {
        /// <summary>
        /// 手机号码
        /// </summary>
        /// <param name="number"></param>
        /// <param name="areacode"></param>
        public PhoneNumber(string number, int areacode = 86)
        {
            this.Number = number;
            this.AreaCode = areacode;
        }
        /// <summary>
        /// 手机号码
        /// </summary>
        /// <param name="phoneNumber"></param>
        public PhoneNumber(string phoneNumber)
        {
            if (!string.IsNullOrEmpty(phoneNumber))
            {
                var data = phoneNumber.Split('+');
                if (data.Length != 2)
                {
                    this.Number = "";
                }
                if (data.Length > 0)
                    this.Number = data[1];
                if (data.Length > 1)
                    this.AreaCode = int.Parse(data[0]);
            }


        }
        /// <summary>
        /// 手机号码
        /// </summary>
        [MaxLength(20)]
        public string Number { get; }
        /// <summary>
        /// 手机号码区号
        /// </summary>
        public int AreaCode { get; }
        /// <summary>
        /// 重载字符串
        /// </summary>
        /// <returns></returns>

        public override string ToString()
        {
            return this.AreaCode + "+" + this.Number;
        }
        /// <summary>
        /// 浅复制
        /// </summary>
        /// <returns></returns>
        public PhoneNumber Clone()
        {
            return new PhoneNumber(this.Number, this.AreaCode);
        }
        /// <summary>
        /// 比对
        /// </summary>
        /// <param name="other"></param>
        /// <returns></returns>
        public bool Equals(PhoneNumber other)
        {
            if (this.AreaCode != other.AreaCode)
                return false;
            if (this.Number != other.Number)
                return false;
            else
                return true;
        }
    }
}
