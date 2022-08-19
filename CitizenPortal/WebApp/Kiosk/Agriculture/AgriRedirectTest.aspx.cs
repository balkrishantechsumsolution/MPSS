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
    public partial class AgriRedirectTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string result = "";
            string t_QueryString = "";

            t_QueryString = Request.QueryString.ToString();

            if (t_QueryString == "")
            {
                Response.Write("Invalid Details"); return;
            }

            result = SimpleTripleDesDecrypt(t_QueryString);

            result = result.Trim();


        }

        string SimpleTripleDesDecrypt(string Data)
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
    }
}