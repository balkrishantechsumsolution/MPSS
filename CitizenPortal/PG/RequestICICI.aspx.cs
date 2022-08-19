using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.PG
{
    public partial class RequestICICI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_Load_old(object sender, EventArgs e)
        {

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            string Result = "";
            //string ReqUdf1 = "VLEID=" + txtVLEID.Text + "&";		// UDF1 values
            //string ReqUdf2 = "SCAID=" + txtSCAID.Text + "&";		// UDF2 values
            //string ReqUdf3 = "SCAPassword=" + txtSCAPassword.Text + "&";	 	// UDF3 values
            //string ReqUdf4 = "WebServiceURL=" + txtWebURL.Text;// "Amt=" + "1000";	 	// UDF4 values


            string m_AppID = Request.QueryString["AppID"].ToString();
            string m_ServiceID = Request.QueryString["SvcID"].ToString();

            string redirecturl = "";  // this is to check what url is coming before encryption
            string encryptredirecturl = "";

            string AESKEY = "1219442032705000";

            string beforeEncryption = "https://eazypay.icicibank.com/EazyPG?merchantid=123279&mandatory fields=123|654|1&optional fields=&returnurl=http:siinnovative.in/pg/responseICICI.aspx&Reference No=123&submerchantid=654&transaction amount=1&paymode=9";

            string afterEncryption = "https://eazypay.icicibank.com/EazyPG?merchantid=123279&mandatory fields=U4C+3+t/eF38KM8tLyDVjg==&optional fields=&returnurl=oeNmC0MZhFvUlHPBMi74yNsL2+Ieb34Py3eNuqgx2JeypltuCXgkhyad1aKcE6M/&Reference No=Qy5zdN8IC8cPd7aSQWxPGQ==&submerchantid=L8B7vfXcMrz18pz8dVRNvA==&transaction amount=Tc8e/VyhIKhzXn/5A7r5yQ==&paymode=BxK4odahlyqfJapzFMhzTA==";

            string merchantID, mandatoryfields, returnURL, referenceNo, subMerchantID, transactionAmount, payMode;

            string Reference_no, sub_merchant_id, pgamount, Mobile_No, city, name;

            Reference_no = m_AppID;
            sub_merchant_id = "654";
            pgamount = "1";
            //Mobile_No = "your value"; ;
            //city = "your value";
            //name = "your value";


            redirecturl += "https://eazypay.icicibank.com/EazyPG?";
            redirecturl += "merchantid=123279";
            redirecturl += "&mandatory fields=" + Reference_no + "|" + sub_merchant_id + "|" + pgamount;
            redirecturl += "&optional fields=";
            redirecturl += "&returnurl=http:siinnovative.in/pg/responseICICI.aspx";
            redirecturl += "&Reference No=" + Reference_no;
            redirecturl += "&submerchantid=" + sub_merchant_id;
            redirecturl += "&transaction amount=" + pgamount;
            redirecturl += "&paymode=9";


            encryptredirecturl += "https://eazypay.icicibank.com/EazyPG?";
            encryptredirecturl += "merchantid=123279";
            encryptredirecturl += "&mandatory fields=" + encryptFile(Reference_no + "|" + sub_merchant_id + "|" + pgamount, AESKEY);
            encryptredirecturl += "&optional fields=";
            encryptredirecturl += "&returnurl=" + encryptFile("http:siinnovative.in/pg/responseICICI.aspx", AESKEY);
            encryptredirecturl += "&Reference No=" + encryptFile(Reference_no, AESKEY);
            encryptredirecturl += "&submerchantid=" + encryptFile(sub_merchant_id, AESKEY);
            encryptredirecturl += "&transaction amount=" + encryptFile(pgamount, AESKEY);
            encryptredirecturl += "&paymode=" + encryptFile("9", AESKEY);

            string TranRequest = encryptredirecturl;

            string URLAuth = "";
            //URLAuth = "https://eazypay.icicibank.com/EazyPG";
            URLAuth = encryptredirecturl;

            const string contentType = "application/x-www-form-urlencoded";
            System.Net.ServicePointManager.Expect100Continue = false;

            CookieContainer cookies = new CookieContainer();
            HttpWebRequest webRequest = WebRequest.Create(URLAuth) as HttpWebRequest;
            webRequest.Method = "POST";
            webRequest.ContentType = contentType;
            webRequest.CookieContainer = cookies;
            webRequest.ContentLength = TranRequest.Length;
            webRequest.UserAgent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.1) Gecko/2008070208 Firefox/3.0.1";
            webRequest.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";


            StreamWriter requestWriter = new StreamWriter(webRequest.GetRequestStream());
            requestWriter.Write(TranRequest);
            requestWriter.Close();

            string responseData = "";
            try
            {
                using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
                {
                    responseData = responseReader.ReadToEnd();
                }
                webRequest.GetResponse().Close();
                Result = responseData;
            }
            catch (Exception ex)
            {
                if (ex is WebException)
                {
                    WebResponse errResp = ((WebException)ex).Response;
                    using (Stream respStream = errResp.GetResponseStream())
                    {
                        // read the error response
                        Result = ex.Message + "< br />" + ex.StackTrace;
                    }
                }
                else
                {
                    Result = ex.Message + "< br />" + ex.StackTrace;
                }
            }
            //lblMsg.Text = Result;
            //Response.Write(Result);
            Response.Redirect(URLAuth);
        }

        string encryptFile(string texttoencrypt, string key)
        {
            RijndaelManaged Rijndaelcipher = new RijndaelManaged();
            Rijndaelcipher.Mode = CipherMode.ECB;
            Rijndaelcipher.Padding = PaddingMode.PKCS7;
            Rijndaelcipher.KeySize = 0x80;
            Rijndaelcipher.BlockSize = 0x80;
            Byte[] pwdbytes = Encoding.UTF8.GetBytes(key);
            Byte[] keybytes = new byte[0x10];
            int len = pwdbytes.Length;
            if (len > keybytes.Length)
            {
                len = keybytes.Length;
            }
            Array.Copy(pwdbytes, keybytes, len);
            Rijndaelcipher.Key = keybytes;
            Rijndaelcipher.IV = keybytes;
            ICryptoTransform transform = Rijndaelcipher.CreateEncryptor();
            Byte[] plaintext = Encoding.UTF8.GetBytes(texttoencrypt);
            return Convert.ToBase64String(transform.TransformFinalBlock(plaintext, 0, plaintext.Length));
        }

        protected void PaymentICICI(object sender, EventArgs e)
        {
        


        }
    }
}