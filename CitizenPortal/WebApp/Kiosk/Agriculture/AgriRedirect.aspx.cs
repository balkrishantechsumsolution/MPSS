using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Agriculture
{
    public partial class AgriRedirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string t_TextToEncrypt = "";
            string t_EncryptedText = "";
            string t_ReturnURL = "http://www.google.com";
            string t_URL = "";
            string t_SQLQuery = "", t_ServiceID = "500";

            string m_OMTID = "1234";
            string sUNQ = "7890";

            t_TextToEncrypt = "OMTID=" + m_OMTID + "&SessionID=" + sUNQ + "&ServiceID=" +
                              t_ServiceID + "&ReturnURL=" + t_ReturnURL;

            t_TextToEncrypt = t_TextToEncrypt.Trim();

            t_EncryptedText = SimpleTripleDes(t_TextToEncrypt);

            //lblMsg.Text = RedirectToSPVPortal1(t_EncryptedText);
            t_URL = RedirectToURL(t_EncryptedText);

            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Redirect", "window.location.href='" + t_URL + "';", true);
        }

        string RedirectToURL(string p_EncryptedText)
        {
            
            string data = p_EncryptedText;

            //string URLAuth = "http://csc.myoxigen.com/mahaonline/authentication.php?" + data;
            string URLAuth = "AgriRedirectTest.aspx";

            URLAuth = URLAuth + "?" + data;

            string tmp = "";
            tmp = URLAuth;

            return tmp;
        }


        #region 3DES Encryption
        string SimpleTripleDes(string Data)
        {
            byte[] key = Encoding.ASCII.GetBytes("@pn@csc@m@h@0nl!ne@12345");
            byte[] iv = Encoding.ASCII.GetBytes("password");
            byte[] data = Encoding.ASCII.GetBytes(Data);
            byte[] enc = new byte[0];
            TripleDES tdes = TripleDES.Create();
            tdes.IV = iv;
            tdes.Key = key;
            tdes.Mode = CipherMode.CBC;
            tdes.Padding = PaddingMode.Zeros;
            ICryptoTransform ict = tdes.CreateEncryptor();
            enc = ict.TransformFinalBlock(data, 0, data.Length);
            return ByteArrayToString(enc);
        }

        string SimpleTripleDesDecrypt1(string Data)
        {
            byte[] key = Encoding.ASCII.GetBytes("@pn@csc@m@h@0nl!ne@12345");
            byte[] iv = Encoding.ASCII.GetBytes("password");
            byte[] data = StringToByteArray(Data);
            byte[] enc = new byte[0];
            TripleDES tdes = TripleDES.Create();
            tdes.IV = iv;
            tdes.Key = key;
            tdes.Mode = CipherMode.CBC;
            tdes.Padding = PaddingMode.Zeros;
            ICryptoTransform ict = tdes.CreateDecryptor();
            enc = ict.TransformFinalBlock(data, 0, data.Length);
            return Encoding.ASCII.GetString(enc);
        }

        string ByteArrayToString(byte[] ba)
        {
            string hex = BitConverter.ToString(ba);
            return hex.Replace("-", "");
        }

        byte[] StringToByteArray(String hex)
        {
            int NumberChars = hex.Length;
            byte[] bytes = new byte[NumberChars / 2];
            for (int i = 0; i < NumberChars; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }
#endregion


    }
}