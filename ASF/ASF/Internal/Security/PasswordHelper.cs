using System;
using System.Security.Cryptography;
using System.Text;

namespace ASF.Internal.Security
{
	/// <summary>
	/// 哈希密码帮助类
	/// </summary>
	public static class PasswordHelper
	{
		/// <summary>
		/// 生成哈希密码
		/// </summary>
		/// <param name="pwd">加密前的密码</param>
		/// <param name="salt">盐</param>
		/// <returns></returns>
		public static string GeneratePasswordHash(string pwd, string salt)
		{
			byte[] passwordAndSaltBytes = Encoding.UTF8.GetBytes(pwd + salt);
			byte[] hashBytes = SHA256.Create().ComputeHash(passwordAndSaltBytes);
			return Convert.ToBase64String(hashBytes);
		}

		/// <summary>
		/// 验证密码
		/// </summary>
		/// <param name="pwd">加密前的密码</param>
		/// <param name="salt">盐</param>
		/// <param name="pwdHash">哈希密码</param>
		/// <returns></returns>
		public static bool ValidatePassword(string pwd, string salt, string pwdHash)
			=> GeneratePasswordHash(pwd, salt) == pwdHash;
	}
}