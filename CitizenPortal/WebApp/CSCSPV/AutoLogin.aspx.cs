using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.CSCSPV
{
    public partial class AutoLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Response.Write(Request.HttpMethod.ToString());
                try
                {
                    AutoLoginRequest();                    
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        public string Decrypt3DES(string strString, string Key)
        {
            DESCryptoServiceProvider DES = new DESCryptoServiceProvider();

            DES.Key = Encoding.UTF8.GetBytes(Key);
            DES.Mode = CipherMode.ECB;
            DES.Padding = PaddingMode.Zeros;
            ICryptoTransform DESDecrypt = DES.CreateDecryptor();

            byte[] Buffer = Convert.FromBase64String(strString);
            return UTF8Encoding.UTF8.GetString(DESDecrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));
        }


        protected void AutoLoginRequest()
        {
            String key = "gbUnoiDA";

            String str = (Request.QueryString["ApnaCSC"]);


            if (str == null)
            {
                Response.Redirect("http://apna.csc.gov.in/index.php/my-account.html", false);
            }

            else
            {

                String str1 = Decrypt3DES(str, key);

                string[] words;
                if (str1.Contains("&"))
                {
                    words = str1.Split(new[] { "&" }, StringSplitOptions.RemoveEmptyEntries);
                    string CSCCode = words[0].Substring(11);
                    if (Regex.IsMatch(CSCCode, "^[a-zA-Z]{2}[0-9]{9}"))
                    {
                        Session["Id"] = words[0].Substring(11);
                        string user = Session["Id"].ToString();
                        Response.Redirect("Servicepage.aspx", false);                        
                    }
                    else
                    {
                        Response.Redirect("http://apna.csc.gov.in/index.php/my-account.html", false);
                        string url = "http://apna.csc.gov.in/index.php/my-account.html";
                        RedirectPageWithMsg(this.Page, url, "InValid User...");
                    }                    
                }                
                else
                {
                    words = null;
                    RedirectPageWithMsg(this.Page, "http://apna.csc.gov.in/index.php/my-account.html", "Please Clear The Browser Cookies and  Login Again .....");

                }
            }

        }

        public static void RedirectPageWithMsg(System.Web.UI.Page page, string url, string Msg)
        {
            String strScript = String.Empty;
            strScript += "alert('" + Msg + "');\n";
            strScript += "function redirectMyPage()\n{\n";
            strScript += "window.location='" + url + "';\n}\n";
            strScript += "setTimeout('redirectMyPage()',1);\n";

            ScriptManager.RegisterStartupScript(page, typeof(Page), "myKey", strScript, true);
        }


    }
}