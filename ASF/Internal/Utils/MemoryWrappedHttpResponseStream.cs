using System;
using System.IO;

namespace ASF.Internal
{
    /// <summary>
    /// 缓存http 响应
    /// </summary>
    public class MemoryWrappedHttpResponseStream : MemoryStream
    {
        private Stream _innerStream;
        /// <summary>
        /// 缓存http 响应
        /// </summary>
        /// <param name="innerStream"></param>
        public MemoryWrappedHttpResponseStream(Stream innerStream)
        {
            this._innerStream = innerStream ?? throw new ArgumentNullException(nameof(innerStream));
        }
        /// <summary>
        /// 推流
        /// </summary>
        public override void Flush()
        {
            this._innerStream.Flush();
            base.Flush();
        }
        /// <summary>
        /// 写流
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="offset"></param>
        /// <param name="count"></param>
        public override void Write(byte[] buffer, int offset, int count)
        {
            base.Write(buffer, offset, count);
            this._innerStream.Write(buffer, offset, count);
        }
        /// <summary>
        /// 销毁
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            if (disposing)
            {
                this._innerStream.Dispose();
            }
        }
        /// <summary>
        /// 关闭
        /// </summary>
        public override void Close()
        {
            base.Close();
            this._innerStream.Close();
        }
    }

}
