using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Specialized;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web.Script.Serialization;

namespace CitizenPortal.WebApp
{
    public class FileColectionToUpload
    {
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public string ContentType { get; set; }
        /*image/jpeg*/
    }
    public static class APICommon
    {
        static string QuickLinksDirectory = System.Configuration.ConfigurationManager.AppSettings["QuickLinksDirectory"];
        static string EdistrictAPI = System.Configuration.ConfigurationManager.AppSettings["EdistrictAPI"];

        public static string HttpUploadFile(string url, FileColectionToUpload[] filescollection, NameValueCollection nvc)
        {
            string boundary = "---------------------------" + DateTime.Now.Ticks.ToString("x");
            byte[] boundarybytes = System.Text.Encoding.ASCII.GetBytes("\r\n--" + boundary + "\r\n");

            HttpWebRequest wr = (HttpWebRequest)WebRequest.Create(url);
            wr.ContentType = "multipart/form-data; boundary=" + boundary;
            wr.Method = "POST";
            wr.KeepAlive = true;
            wr.Credentials = System.Net.CredentialCache.DefaultCredentials;
            Stream rs = wr.GetRequestStream();
            string formdataTemplate = "Content-Disposition: form-data; name=\"{0}\"\r\n\r\n{1}";
            foreach (string key in nvc.Keys)
            {
                rs.Write(boundarybytes, 0, boundarybytes.Length);
                string formitem = string.Format(formdataTemplate, key, nvc[key]);
                byte[] formitembytes = System.Text.Encoding.UTF8.GetBytes(formitem);
                rs.Write(formitembytes, 0, formitembytes.Length);
            }

            foreach (FileColectionToUpload file in filescollection)
            {
                rs.Write(boundarybytes, 0, boundarybytes.Length);
                string headerTemplate = "Content-Disposition: form-data; name=\"{0}\"; filename=\"{1}\"\r\nContent-Type: {2}\r\n\r\n";
                string header = string.Format(headerTemplate, file.FileName, file.FilePath, file.ContentType);
                byte[] headerbytes = System.Text.Encoding.UTF8.GetBytes(header);
                rs.Write(headerbytes, 0, headerbytes.Length);
                FileStream fileStream = new FileStream(file.FilePath, FileMode.Open, FileAccess.Read);
                byte[] buffer = new byte[4096];
                int bytesRead = 0;
                while ((bytesRead = fileStream.Read(buffer, 0, buffer.Length)) != 0)
                {
                    rs.Write(buffer, 0, bytesRead);
                }
                fileStream.Close();

            }
            byte[] trailer = System.Text.Encoding.ASCII.GetBytes("\r\n--" + boundary + "--\r\n");
            rs.Write(trailer, 0, trailer.Length);
            rs.Close();
            WebResponse wresp = null;
            try
            {
                wresp = wr.GetResponse();
                Stream stream2 = wresp.GetResponseStream();
                StreamReader reader2 = new StreamReader(stream2);
                string result = reader2.ReadToEnd();
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error occurred while converting file", "Error!");
                if (wresp != null)
                {
                    wresp.Close();
                    wresp = null;
                }
                return "";
            }
            finally
            {
                wr = null;
            }
        }
        public static string ComputeHash(string plainText)
        {
            string unhashed = string.Concat(plainText, "thisshouldbechangedtoakeyofyourchoosing");
            return BitConverter.ToString(new SHA512CryptoServiceProvider().ComputeHash(Encoding.Default.GetBytes(unhashed))).Replace("-", String.Empty).ToLower();
        }
        public static T Post<T>(string uri, NameValueCollection pairs)
        {
            byte[] response = null;
            using (WebClient client = new WebClient())
            {
                response = client.UploadValues(uri, pairs);
            }
            string result = System.Text.Encoding.UTF8.GetString(response);
            JavaScriptSerializer oJS = new JavaScriptSerializer();
            return oJS.Deserialize<T>(result);
        }
        public static T[] GetAnmsByteArray<T>(T[] A)
        {
            for (int i = 0; i < A.Length; i++)
            {
                A.SetValue(ReadFile(A.ToString()), i);
            }
            return A;
        }
        public static byte[] ReadFile(string filePath)
        {
            byte[] buffer;
            FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            try
            {
                int length = (int)fileStream.Length;
                buffer = new byte[length];
                int count;
                int sum = 0;
                // read until Read method returns 0 (end of the stream has been reached)
                while ((count = fileStream.Read(buffer, sum, length - sum)) > 0)
                    sum += count;
            }
            finally
            {
                fileStream.Close();
            }
            return buffer;
        }
        public static NameValueCollection ConvertObjectToNameValueCollection<T>(T Object)
        {
            NameValueCollection formFields = new NameValueCollection();
            Object.GetType().GetProperties()
                .ToList()
                .ForEach(pi => formFields.Add(pi.Name, pi.GetValue(Object, null).ToString()));
            return formFields;
        }

        public static string ReadImageBase64(string url)
        {
            string base64Url = "";
            if (url != "")
            {
                var filepath = (QuickLinksDirectory + url).Replace("\\", "//");
                if (File.Exists(filepath))
                {
                    byte[] imageArray = System.IO.File.ReadAllBytes(@filepath);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    base64Url = "data:image/png;base64," + base64ImageRepresentation;
                }
            }
            return base64Url;
        }

        public static string ReadImagePath(string url)
        {
            string path = "";
            if (url != "")
            {
                var filepath = (QuickLinksDirectory + url.Replace(@"/", @"\\")).Replace("//", "\\");
                path = @filepath;
            }
            return path;
        }



        public static string[] ConvertStringtoArray(string str)
        {
            string[] names = new string[] { };
            if (str != "")
            {
                names = str.Split(',');
            }
            return names;
        }

        public static string DecodeBase64Str(string encodedStr)
        {
            string decodedEID = "";
            byte[] data = Convert.FromBase64String(encodedStr);
            decodedEID = Encoding.UTF8.GetString(data);
            return decodedEID;
        }


        public static string CheckStrIsNullorEmpty(string str)
        {
            string res = "";
            res = string.IsNullOrEmpty(str) ? "" : str;
            return res;
        }

    }
}