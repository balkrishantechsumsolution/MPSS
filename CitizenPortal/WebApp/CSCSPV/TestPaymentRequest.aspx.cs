using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.CSCSPV
{
    public partial class TestPaymentRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {




            }
        }

        public String rendomNumber(int length)
        {
            string numValue = "";
            Char[] chars = "0123456789".ToCharArray();
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                numValue += chars[random.Next(chars.Length)];
            }
            return numValue;
        }

        protected void BtnPay_Click(object sender, EventArgs e)
        {
            TransLogSubmit();
        }

        protected void TransLogSubmit()
        {
            string KeyValue = "CoaP#@671*er457E";
            string OMTID = "";// "PY040700101";
            string mid = "COAP_Orissa";
            string mitem = "Orissa Services";
            string otherval = "";// "PY040700101";
            string amt = "10";
            DateTime tn = DateTime.Now;
            string mrtxid = "COAP" + tn.ToFileTime().ToString();

            byte[] array = System.Text.Encoding.UTF8.GetBytes(KeyValue);
            string enmtrxid = EncryptDecrypt.Encrypt(mrtxid, array);
            string enfee = EncryptDecrypt.Encrypt(amt, array);
            string enmitem = EncryptDecrypt.Encrypt(mitem, array);
            string enotherval = EncryptDecrypt.Encrypt(otherval, array);
            string enomtid = EncryptDecrypt.Encrypt(OMTID, array);


            RemotePost myremotepost = new RemotePost();

            myremotepost.Url = "http://staging.csc.gov.in:8082/PaymentGateway.aspx";
            //   myremotepost.Url = "https://wallet.csc.gov.in";
            myremotepost.Add("mtrxid", enmtrxid);
            myremotepost.Add("mid", mid);
            myremotepost.Add("mitem", enmitem);
            myremotepost.Add("amount", enfee);
            myremotepost.Add("othervals", enotherval);
            myremotepost.Add("omtid", enomtid);

            myremotepost.Post();
            
        }

    }

    public class EncryptDecrypt 
    {
        public const string serverMac = "D8-9D-67-17-C3-84";

        private static string merMAC
        {
            get;
            set;
        }

        public EncryptDecrypt()
        {
        }

        public static string Decrypt(string textToDecrypt, byte[] keyValue)
        {
            //if (!EncryptDecrypt.VerifyMac())
            //{
            //    throw new Exception(string.Concat("Authentication Failed ", EncryptDecrypt.merMAC));
            //}
            RijndaelManaged rijndaelManaged = new RijndaelManaged()
            {
                Mode = CipherMode.CBC,
                Padding = PaddingMode.PKCS7,
                KeySize = 128,
                BlockSize = 128
            };
            int length = textToDecrypt.Length;
            byte[] numArray = Convert.FromBase64String(textToDecrypt.Replace(" ", "+"));
            byte[] numArray1 = new byte[16];
            int num = (int)keyValue.Length;
            if (num > (int)numArray1.Length)
            {
                num = (int)numArray1.Length;
            }
            Array.Copy(keyValue, numArray1, num);
            rijndaelManaged.Key = numArray1;
            rijndaelManaged.IV = numArray1;
            byte[] numArray2 = rijndaelManaged.CreateDecryptor().TransformFinalBlock(numArray, 0, (int)numArray.Length);
            return Encoding.UTF8.GetString(numArray2);
        }

        private static byte[] Decrypt(byte[] btName)
        {
            throw new NotImplementedException();
        }

        public string DecryptPHP(string textToDecrypt, string key)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(key);
            //if (!EncryptDecrypt.VerifyMac())
            //{
            //    throw new Exception(string.Concat("Authentication Failed ", EncryptDecrypt.merMAC));
            //}
            RijndaelManaged rijndaelManaged = new RijndaelManaged()
            {
                Mode = CipherMode.CBC,
                Padding = PaddingMode.PKCS7,
                KeySize = 128,
                BlockSize = 128
            };
            int length = textToDecrypt.Length;
            byte[] numArray = Convert.FromBase64String(textToDecrypt.Replace(" ", "+"));
            byte[] numArray1 = bytes;
            byte[] numArray2 = new byte[16];
            int num = (int)numArray1.Length;
            if (num > (int)numArray2.Length)
            {
                num = (int)numArray2.Length;
            }
            Array.Copy(numArray1, numArray2, num);
            rijndaelManaged.Key = numArray2;
            rijndaelManaged.IV = numArray2;
            byte[] numArray3 = rijndaelManaged.CreateDecryptor().TransformFinalBlock(numArray, 0, (int)numArray.Length);
            return Encoding.UTF8.GetString(numArray3);
        }

        public static string Encrypt(string textToEncrypt, byte[] keyValue)
        {
            //if (!EncryptDecrypt.VerifyMac())
            //{
            //    throw new Exception(string.Concat("Authentication Failed ", EncryptDecrypt.merMAC));
            //}
            RijndaelManaged rijndaelManaged = new RijndaelManaged()
            {
                Mode = CipherMode.CBC,
                Padding = PaddingMode.PKCS7,
                KeySize = 128,
                BlockSize = 128
            };
            byte[] numArray = new byte[16];
            int length = (int)keyValue.Length;
            if (length > (int)numArray.Length)
            {
                length = (int)numArray.Length;
            }
            Array.Copy(keyValue, numArray, length);
            rijndaelManaged.Key = numArray;
            rijndaelManaged.IV = numArray;
            ICryptoTransform cryptoTransform = rijndaelManaged.CreateEncryptor();
            byte[] bytes = Encoding.UTF8.GetBytes(textToEncrypt);
            string base64String = Convert.ToBase64String(cryptoTransform.TransformFinalBlock(bytes, 0, (int)bytes.Length));
            return base64String;
        }

        public string EncryptPHP(string textToEncrypt, string key)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(key);
            //if (!EncryptDecrypt.VerifyMac())
            //{
            //    throw new Exception("Authentication Failed");
            //}
            RijndaelManaged rijndaelManaged = new RijndaelManaged()
            {
                Mode = CipherMode.CBC,
                Padding = PaddingMode.PKCS7,
                KeySize = 128,
                BlockSize = 128
            };
            byte[] numArray = bytes;
            byte[] numArray1 = new byte[16];
            int length = (int)numArray.Length;
            if (length > (int)numArray1.Length)
            {
                length = (int)numArray1.Length;
            }
            Array.Copy(numArray, numArray1, length);
            rijndaelManaged.Key = numArray1;
            rijndaelManaged.IV = numArray1;
            ICryptoTransform cryptoTransform = rijndaelManaged.CreateEncryptor();
            byte[] bytes1 = Encoding.UTF8.GetBytes(textToEncrypt);
            string base64String = Convert.ToBase64String(cryptoTransform.TransformFinalBlock(bytes1, 0, (int)bytes1.Length));
            return base64String;
        }

        //private static byte[] GetFileBytes(string filePath)
        //{
        //    byte[] numArray;
        //    FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.Read);
        //    try
        //    {
        //        int length = (int)fileStream.Length;
        //        numArray = new byte[length];
        //        int num = 0;
        //        while (true)
        //        {
        //            int num1 = fileStream.Read(numArray, num, length - num);
        //            int num2 = num1;
        //            if (num1 <= 0)
        //            {
        //                break;
        //            }
        //            num = num + num2;
        //        }
        //    }
        //    finally
        //    {
        //        fileStream.Close();
        //    }
        //    return numArray;
        //}

        //public static string GetMac()
        //{
        //    string str;
        //    try
        //    {
        //        ManagementObjectCollection instances = (new ManagementClass("Win32_NetworkAdapterConfiguration")).GetInstances();
        //        string empty = string.Empty;
        //        foreach (ManagementObject instance in instances)
        //        {
        //            if (empty == string.Empty)
        //            {
        //                if ((bool)instance["IPEnabled"])
        //                {
        //                    empty = instance["MacAddress"].ToString();
        //                }
        //            }
        //            instance.Dispose();
        //        }
        //        str = empty;
        //    }
        //    catch (Exception exception)
        //    {
        //        Console.Write(exception);
        //        string empty1 = string.Empty;
        //        NetworkInterface[] allNetworkInterfaces = NetworkInterface.GetAllNetworkInterfaces();
        //        int num = 0;
        //        while (num < (int)allNetworkInterfaces.Length)
        //        {
        //            byte[] addressBytes = allNetworkInterfaces[num].GetPhysicalAddress().GetAddressBytes();
        //            for (int i = 0; i < (int)addressBytes.Length; i++)
        //            {
        //                empty1 = string.Concat(empty1, addressBytes[i].ToString("X2"));
        //                if (i != (int)addressBytes.Length - 1)
        //                {
        //                    empty1 = string.Concat(empty1, ":");
        //                }
        //            }
        //            if (!"D8-9D-67-17-C3-84".Replace("-", ":").ToUpper().Contains(empty1))
        //            {
        //                empty1 = string.Empty;
        //                num++;
        //            }
        //            else
        //            {
        //                str = empty1;
        //                return str;
        //            }
        //        }
        //        str = empty1;
        //    }
        //    return str;
        //}

        //public static string GetMacAmit()
        //{
        //    string empty = string.Empty;
        //    NetworkInterface[] allNetworkInterfaces = NetworkInterface.GetAllNetworkInterfaces();
        //    for (int i = 0; i < (int)allNetworkInterfaces.Length; i++)
        //    {
        //        byte[] addressBytes = allNetworkInterfaces[i].GetPhysicalAddress().GetAddressBytes();
        //        for (int j = 0; j < (int)addressBytes.Length; j++)
        //        {
        //            empty = string.Concat(empty, addressBytes[j].ToString("X2"));
        //            if (j != (int)addressBytes.Length - 1)
        //            {
        //                empty = string.Concat(empty, "-");
        //            }
        //        }
        //        Console.Write(empty);
        //    }
        //    return empty;
        //}

        public static string GetMD5Hash(string name)
        {
            MD5 mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
            byte[] numArray = mD5CryptoServiceProvider.ComputeHash((new ASCIIEncoding()).GetBytes(name));
            StringBuilder stringBuilder = new StringBuilder((int)numArray.Length * 2);
            byte[] numArray1 = numArray;
            for (int i = 0; i < (int)numArray1.Length; i++)
            {
                stringBuilder.AppendFormat("{0:x2}", numArray1[i]);
            }
            return stringBuilder.ToString();
        }

        public static bool VerifyMac()
        {
            bool flag;
            //string mac = EncryptDecrypt.GetMac();
            //if (!"D8-9D-67-17-C3-84".Replace("-", ":").ToUpper().Contains(mac.ToUpper()))
            //{
            //    EncryptDecrypt.merMAC = mac;
            //    flag = false;
            //}
            //else
            {
                flag = true;
            }
            return flag;
        }
    }

    public class EncryptDecrypt_Old 
    {
        private static string merMAC
        {
            get;
            set;
        }

        public EncryptDecrypt_Old()
        {
        }

        public static string Decrypt(string textToDecrypt, byte[] keyValue)
        {
            string str;
            string str1 = "";
            try
            {
                RijndaelManaged rijndaelManaged = new RijndaelManaged()
                {
                    Mode = CipherMode.CBC,
                    Padding = PaddingMode.PKCS7,
                    KeySize = 128,
                    BlockSize = 128
                };
                int length = textToDecrypt.Length;
                byte[] numArray = Convert.FromBase64String(textToDecrypt.Replace(" ", "+"));
                byte[] numArray1 = new byte[16];
                int num = (int)keyValue.Length;
                if (num > (int)numArray1.Length)
                {
                    num = (int)numArray1.Length;
                }
                Array.Copy(keyValue, numArray1, num);
                rijndaelManaged.Key = numArray1;
                rijndaelManaged.IV = numArray1;
                byte[] numArray2 = rijndaelManaged.CreateDecryptor().TransformFinalBlock(numArray, 0, (int)numArray.Length);
                str1 = Encoding.UTF8.GetString(numArray2);
            }
            catch (Exception exception)
            {
                Console.Write(exception);
                str = "NULL";
                return str;
            }
            str = str1;
            return str;
        }

        public static string Encrypt(string textToEncrypt, byte[] keyValue)
        {
            string str;
            string base64String = "";
            try
            {
                RijndaelManaged rijndaelManaged = new RijndaelManaged()
                {
                    Mode = CipherMode.CBC,
                    Padding = PaddingMode.PKCS7,
                    KeySize = 128,
                    BlockSize = 128
                };
                byte[] numArray = new byte[16];
                int length = (int)keyValue.Length;
                if (length > (int)numArray.Length)
                {
                    length = (int)numArray.Length;
                }
                Array.Copy(keyValue, numArray, length);
                rijndaelManaged.Key = numArray;
                rijndaelManaged.IV = numArray;
                ICryptoTransform cryptoTransform = rijndaelManaged.CreateEncryptor();
                byte[] bytes = Encoding.UTF8.GetBytes(textToEncrypt);
                base64String = Convert.ToBase64String(cryptoTransform.TransformFinalBlock(bytes, 0, (int)bytes.Length));
            }
            catch (Exception exception)
            {
                Console.Write(exception);
                str = "NULL";
                return str;
            }
            str = base64String;
            return str;
        }
    }
    
    public class RemotePost
    {
        private System.Collections.Specialized.NameValueCollection Inputs
        = new System.Collections.Specialized.NameValueCollection();

        public string Url = "";
        public string Method = "post";
        public string FormName = "form1";

        public void Add(string name, string value)
        {
            Inputs.Add(name, value);
        }

        public void Post()
        {
            System.Web.HttpContext.Current.Response.Clear();

            System.Web.HttpContext.Current.Response.Write("<html><head>");

            System.Web.HttpContext.Current.Response.Write(string.Format("</head><body onload=\"document.{0}.submit()\">", FormName));

            System.Web.HttpContext.Current.Response.Write(string.Format("<form name=\"{0}\" method=\"{1}\" action=\"{2}\" >",

           FormName, Method, Url));
            for (int i = 0; i < Inputs.Keys.Count; i++)
            {
                System.Web.HttpContext.Current.Response.Write(string.Format("<input name=\"{0}\" type=\"hidden\" value=\"{1}\">", Inputs.Keys[i], Inputs[Inputs.Keys[i]]));
            }
            System.Web.HttpContext.Current.Response.Write("</form>");
            System.Web.HttpContext.Current.Response.Write("</body></html>");
            System.Web.HttpContext.Current.Response.End();
        }
    }
}