using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.CSCSPV
{
    public partial class CSCHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string omtid = "MP115500806";
            BindData("K0799990054", omtid);
        }

        private void BindData(string ChannelId, string omtid)
        {



            string oth1Val = omtid + "CSC" + System.Web.HttpContext.Current.Session.SessionID + DateTime.Now.ToString("yyyyMMddHHmmss");


            byte[] key = GetKey();
            string encKID = EncryptDecryptPG.EncryptDecrypt.Encrypt(ChannelId, key);
            string EncData = "CSCID=" + omtid + "&SessionID=" + System.Web.HttpContext.Current.Session.SessionID + "&MID=mponline&OtherVal1=" + oth1Val + "&OtherVal2=" + encKID;
            EncData = EncryptDecryptPG.EncryptDecrypt.Encrypt(EncData, key);
            Dictionary<string, string> i = new Dictionary<string, string>();
            i.Add("EncData", EncData);

            RedirectAndPOST(this.Page, "X", "http://staging.csc.gov.in/mponline/authentication.php", i);


        }
        public static void RedirectAndPOST(System.Web.UI.Page page, string formid, string destinationUrl, IDictionary<string, string> variables)
        {
            //Prepare the Posting form
            string strForm = PreparePOSTForm(formid, destinationUrl, variables);
            //Add a literal control the specified page holding the Post Form, this is to submit the Posting form with the request.
            page.Controls.Add(new System.Web.UI.LiteralControl(strForm));
        }
        private static String PreparePOSTForm(string formid, string url, IDictionary<string, string> variables)
        {
            //Set a name for the form
            string formID = formid;
            //Build the form using the specified data to be posted.
            StringBuilder strForm = new StringBuilder();
            strForm.Append("<form id=\"" + formID + "\" name=\"" + formID + "\" action=\"" + url + "\" method=\"POST\">");
            foreach (KeyValuePair<string, string> keyVal in variables)
            {
                strForm.Append("<input type=\"hidden\" name=\"" + keyVal.Key + "\" value=\"" + keyVal.Value + "\">");
            }
            strForm.Append("</form>");
            //Build the JavaScript which will do the Posting operation.
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script language='javascript'>");
            strScript.Append("var v" + formID + " = document." + formID + ";");
            strScript.Append("v" + formID + ".submit();");
            strScript.Append("</script>");
            //Return the form and the script concatenated. (The order is important, Form then JavaScript)
            return strForm.ToString() + strScript.ToString();
        }
        public static byte[] GetKey()
        {
            string str = "Qmo5M#47Fm94@*1b";
            byte[] bytes = new byte[str.Length * sizeof(char)];
            System.Buffer.BlockCopy(str.ToCharArray(), 0, bytes, 0, bytes.Length);
            return bytes;
        }
    }
}