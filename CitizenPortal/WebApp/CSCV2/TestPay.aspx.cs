using CitizenPortal.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.CSCV2
{
    public partial class TestPay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["Connectdata"])))
            {
                var result = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(Session["Connectdata"].ToString().Trim());
                lblsessiondata.Text = "</br> Name : " + result["User"]["username"].Value + "<br />"
                                     + "Email Id : " + result["User"]["email"].Value + "<br />"
                                     + "CSC Id : " + result["User"]["csc_id"].Value + "<br />"
                                     + "Status :" + result["User"]["active_status"].Value + "<br />"
                                     + "Type : " + result["User"]["user_type"].Value + "<br />"
                                     + "last_active : " + result["User"]["last_active"].Value + "<br />"
                                    ;
                Session["username"] = result["User"]["csc_id"].Value;
                //lblsessiondata.Visible = true;
                //btnShop.Visible = true;
                //btnLogOut.Visible = true;

            }
            else
            {
                //btnLogin.Visible = true;
                //lblsessiondata.Text = "";
                //btnLogOut.Visible = false;
                //btnShop.Visible = false;
            }
        }

        protected void btnFirstProduct_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["Connectdata"])))
            {
                BridgePGUtil objBridgePGUtil = new BridgePGUtil();
                string merchant_id = ConfigurationManager.AppSettings["MERCHANT_ID"];
                string productid = ConfigurationManager.AppSettings["product_id1"];
                string productname = ConfigurationManager.AppSettings["product_name1"];
                string csc_id = Session["username"].ToString();
                string txn_amount = "50";
                string csc_share_amount = "10";
                string param1 = DateTime.Now.ToString();
                string param2 = DateTime.Now.ToString();
                string param3 = DateTime.Now.ToString();
                string param4 = DateTime.Now.ToString();

                string merchant_receipt_no = merchant_id + DateTime.Now.Year.ToString().PadLeft(4, '0') +
                                             DateTime.Now.Month.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Day.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Hour.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Minute.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Second.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Millisecond.ToString().PadLeft(4, '0');
                //merchant_receipt_no = merchant_receipt_no + "_" + merchant_receipt_no;
                string return_url = ConfigurationManager.AppSettings["SUCCESS_URL"];
                string cancel_url = ConfigurationManager.AppSettings["FAILURE_URL"];
                string message = objBridgePGUtil.CreateMessage(merchant_id, csc_id, txn_amount, csc_share_amount,
                    merchant_receipt_no, return_url, cancel_url, productid, productname, param1, param2, param3, param4, "", "");
                message = ConfigurationManager.AppSettings["MERCHANT_ID"] + "|" + message;
                Response.Clear();
                StringBuilder sb = new StringBuilder();
                sb.Append("<html>");
                sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                sb.AppendFormat("<form name='form' action='{0}' method='post'>", objBridgePGUtil.CreateURLappendString());
                sb.AppendFormat("<input type='hidden' name='message' value='{0}'>", message);
                // Other params go here
                sb.Append("</form>");
                sb.Append("</body>");
                sb.Append("</html>");
                Response.Write(sb.ToString());
                Response.End();


            }
            else
            {
                Response.Write("Null Session  Go fro Home Page");
            }
        }

        protected void btnSeconProduct_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["Connectdata"])))
            {
                BridgePGUtil objBridgePGUtil = new BridgePGUtil();
                string merchant_id = ConfigurationManager.AppSettings["MERCHANT_ID"];
                string productid = ConfigurationManager.AppSettings["product_id1"];
                string productname = ConfigurationManager.AppSettings["product_name1"];
                string csc_id = Session["username"].ToString();
                string txn_amount = "100";
                string csc_share_amount = "10";
                string merchant_receipt_no = merchant_id + DateTime.Now.Year.ToString().PadLeft(4, '0') +
                                             DateTime.Now.Month.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Day.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Hour.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Minute.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Second.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Millisecond.ToString().PadLeft(4, '0');
                string return_url = ConfigurationManager.AppSettings["SUCCESS_URL"];
                string cancel_url = ConfigurationManager.AppSettings["FAILURE_URL"];
                string message = objBridgePGUtil.CreateMessage(merchant_id, csc_id, txn_amount, csc_share_amount,
                    merchant_receipt_no, return_url, cancel_url, productid, productname, "", "", "", "", "", "");
                message = ConfigurationManager.AppSettings["MERCHANT_ID"] + "|" + message;
                Response.Clear();
                StringBuilder sb = new StringBuilder();
                sb.Append("<html>");
                sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                sb.AppendFormat("<form name='form' action='{0}' method='post'>", objBridgePGUtil.CreateURLappendString());
                sb.AppendFormat("<input type='hidden' name='message' value='{0}'>", message);
                // Other params go here
                sb.Append("</form>");
                sb.Append("</body>");
                sb.Append("</html>");
                Response.Write(sb.ToString());
                Response.End();


            }
            else
            {
                Response.Write("Null Session  Go fro Home Page");
            }
        }

        protected void btnProduct_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["Connectdata"])))
            {
                BridgePGUtil objBridgePGUtil = new BridgePGUtil();
                string merchant_id = ConfigurationManager.AppSettings["MERCHANT_ID"];
                string productid = ConfigurationManager.AppSettings["product_id1"];
                string productname = ConfigurationManager.AppSettings["product_name1"];
                string csc_id = Session["username"].ToString();
                string txn_amount = "50";
                string csc_share_amount = "10";
                string merchant_receipt_no = merchant_id + DateTime.Now.Year.ToString().PadLeft(4, '0') +
                                             DateTime.Now.Month.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Day.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Hour.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Minute.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Second.ToString().PadLeft(2, '0') +
                                             DateTime.Now.Millisecond.ToString().PadLeft(4, '0');
                string return_url = ConfigurationManager.AppSettings["SUCCESS_URL"];
                string cancel_url = ConfigurationManager.AppSettings["FAILURE_URL"];
                string message = objBridgePGUtil.CreateMessage(merchant_id, csc_id, txn_amount, csc_share_amount,
                    merchant_receipt_no, return_url, cancel_url, productid, productname, "", "", "", "", "", "");
                message = ConfigurationManager.AppSettings["MERCHANT_ID"] + "|" + message;
                Response.Clear();
                StringBuilder sb = new StringBuilder();
                sb.Append("<html>");
                sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                sb.AppendFormat("<form name='form' action='{0}' method='post'>", objBridgePGUtil.CreateURLappendString());
                sb.AppendFormat("<input type='hidden' name='message' value='{0}'>", message);
                // Other params go here
                sb.Append("</form>");
                sb.Append("</body>");
                sb.Append("</html>");
                Response.Write(sb.ToString());
                Response.End();


            }
            else
            {
                Response.Write("Null Session  Go fro Home Page");
            }
        }
    }
}