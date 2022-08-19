using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace CitizenPortal.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ImageUpload" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ImageUpload.svc or ImageUpload.svc.cs at the Solution Explorer and start debugging.
    public class ImageUpload : IImageUpload
    {
        public void DoWork()
        {
        }

        public void FileUpload(string fileName, Stream fileStream)
        {

            FileStream fileToupload = new FileStream("D:\\TempDB\\" + fileName, FileMode.Create);

            byte[] bytearray = new byte[10000];
            int bytesRead, totalBytesRead = 0;
            do
            {
                bytesRead = fileStream.Read(bytearray, 0, bytearray.Length);
                totalBytesRead += bytesRead;
            } while (bytesRead > 0);

            fileToupload.Write(bytearray, 0, bytearray.Length);
            fileToupload.Close();
            fileToupload.Dispose();

        }
    }
}
