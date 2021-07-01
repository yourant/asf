using System;

namespace ASF.Internal.Utils
{
  internal static class BitsExtensions
  {
    /*
        * value = Byte:   (value & (value - Byte1))   =  Int32;
        * value = UInt16: (value & (value - UShort1)) =  Int32;
        * value = UInt32: (value & (value - 1U))      = UInt32;
        * value = UInt64: (value & (value - 1UL))     = UInt64;
        */

    const Byte Byte0 = Byte.MinValue;
    const Byte Byte1 = 1;

    const UInt16 UShort0 = UInt16.MinValue;
    const UInt16 UShort1 = 1;

    static Byte ClearLeast(Byte value)
    {
      return (Byte)(value & (value - Byte1));
    }
    static UInt16 ClearLeast(UInt16 value)
    {
      return (UInt16)(value & (value - UShort1));
    }
    static UInt32 ClearLeast(UInt32 value)
    {
      return value & (value - 1U);
    }
    static UInt64 ClearLeast(UInt64 value)
    {
      return value & (value - 1UL);
    }

    public static int Count(Byte value)
    {
      var count = 0;
      while (value != Byte0)
      {
        count++;
        value = (Byte)(value & (value - Byte1));
      }
      return count;
    }
    public static int Count(UInt16 value)
    {
      var count = 0;
      while (value != UShort0)
      {
        count++;
        value = (UInt16)(value & (value - UShort1));
      }
      return count;
    }
    public static int Count(UInt32 value)
    {
      var count = 0;
      while (value != 0U)
      {
        count++;
        value = value & (value - 1U);
      }
      return count;
    }
    public static int Count(UInt64 value)
    {
      var count = 0;
      while (value != 0UL)
      {
        count++;
        value = value & (value - 1UL);
      }
      return count;
    }

    public static Byte[] GetOnes(Byte value)
    {
      var index = 0;
      Byte temp;
      var temps = new Byte[0x08];

      while (value != UShort0)
      {
        // 消掉最后一个1之前
        temp = value;
        // 消掉最后一个1之后
        value = (Byte)(value & (value - Byte1));
        // 记录差值
        temps[index++] = (Byte)(temp - value);
      }

      var result = new Byte[index];
      for (var i = 0; i < index; i++)
      {
        result[i] = temps[i];
      }
      return result;
    }
    public static UInt16[] GetOnes(UInt16 value)
    {
      var index = 0;
      UInt16 temp;
      var temps = new UInt16[0x10];

      while (value != UShort0)
      {
        // 消掉最后一个1之前
        temp = value;
        // 消掉最后一个1之后
        value = (UInt16)(value & (value - UShort1));
        // 记录差值
        temps[index++] = (UInt16)(temp - value);
      }

      var result = new UInt16[index];
      for (var i = 0; i < index; i++)
      {
        result[i] = temps[i];
      }
      return result;
    }
    public static UInt32[] GetOnes(this UInt32 value)
    {
      var index = 0;
      UInt32 temp;
      var temps = new UInt32[0x20];

      while (value != 0U)
      {
        // 消掉最后一个1之前
        temp = value;
        // 消掉最后一个1之后
        value = value & (value - 1U);
        // 记录差值
        temps[index++] = temp - value;
      }

      var result = new UInt32[index];
      for (var i = 0; i < index; i++)
      {
        result[i] = temps[i];
      }
      return result;
    }
    public static UInt64[] GetOnes(UInt64 value)
    {
      var index = 0;
      UInt64 temp;
      var temps = new UInt64[0x40];

      while (value != 0UL)
      {
        // 消掉最后一个1之前
        temp = value;
        // 消掉最后一个1之后
        value = value & (value - 1UL);
        // 记录差值
        temps[index++] = temp - value;
      }

      var result = new UInt64[index];
      for (var i = 0; i < index; i++)
      {
        result[i] = temps[i];
      }
      return result;
    }

    public static bool ExactlyOne(Byte value)
    {
      return (value != Byte0) && ((value & (value - Byte1)) == 0);
    }
    public static bool ExactlyOne(UInt16 value)
    {
      return (value != UShort0) && ((value & (value - UShort1)) == 0);
    }
    public static bool ExactlyOne(UInt32 value)
    {
      return (value != 0U) && ((value & (value - 1U)) == 0U);
    }
    public static bool ExactlyOne(UInt64 value)
    {
      return (value != 0UL) && ((value & (value - 1U)) == 0UL);
    }

    public static bool MoreThanOne(Byte value)
    {
      return (value & (value - Byte1)) != 0;
    }
    public static bool MoreThanOne(UInt16 value)
    {
      return (value & (value - UShort1)) != 0;
    }
    public static bool MoreThanOne(UInt32 value)
    {
      return (value & (value - 1U)) != 0U;
    }
    public static bool MoreThanOne(UInt64 value)
    {
      return (value & (value - 1UL)) != 0UL;
    }

    public static SByte[] GetOnes(SByte value)
    {
      var ones = GetOnes((Byte)value);

      var length = ones.Length;
      var result = new SByte[length];
      for (var i = 0; i < length; i++)
        result[i] = (SByte)ones[i];

      return result;
    }
    public static Int16[] GetOnes(Int16 value)
    {
      var ones = GetOnes((UInt16)value);

      var length = ones.Length;
      var result = new Int16[length];
      for (var i = 0; i < length; i++)
        result[i] = (Int16)ones[i];

      return result;
    }
    public static Int32[] GetOnes(this Int32 value)
    {
      var ones = GetOnes((UInt32)value);

      var length = ones.Length;
      var result = new Int32[length];
      for (var i = 0; i < length; i++)
        result[i] = (Int32)ones[i];

      return result;
    }
    public static Int64[] GetOnes(Int64 value)
    {
      var ones = GetOnes((UInt64)value);

      var length = ones.Length;
      var result = new Int64[length];
      for (var i = 0; i < length; i++)
        result[i] = (Int64)ones[i];

      return result;
    }

    public static int CompareTimestamp(this byte[] @this, byte[] other)
    {
      var length = @this.Length;
      if (other.Length != length)
        throw new NotSupportedException();

      for (var i = 0; i < length; i++)
      {
        if (@this[i] > other[i])
          return 1;
        if (@this[i] < other[i])
          return -1;
      }
      return 0;
    }

    public static long ToInt64WithBigEndian(this byte[] timestamp)
    {
      var high = (timestamp[0] << 0x18) | (timestamp[1] << 0x10) | (timestamp[2] << 8) | timestamp[3];
      var low = (timestamp[4] << 0x18) | (timestamp[5] << 0x10) | (timestamp[6] << 8) | timestamp[7];

      return (long)high << 0x20 | (uint)low;
    }
  }
}