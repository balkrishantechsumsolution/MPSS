using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.Views.Account.cscconnect
{
    public partial class cscconncetresponse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginCheckOMT();
        }

        protected void LoginCheckOMT()
        {

            if (Request.Cookies["__csc_connect__inf0_"] != null)
            {

                string CSCID, CookieVal;
                CSCID = "";
                HttpCookie aCookie = Request.Cookies["__csc_connect__inf0_"];
                CookieVal = Server.HtmlEncode(aCookie.Value);

                CSCID = CookieVal.Substring(6, 11);

                if (CSCID != null)
                {

                    if (Regex.IsMatch(CSCID, "^[a-zA-Z]{2}[0-9]{9}"))
                    {
                        string[] split = CookieVal.Split('&');

                        Session["Id"] = CSCID;
                        Session["role"] = "vle";
                        string user = Session["Id"].ToString();
                        string role = Session["role"].ToString();

                        Response.Cookies["Id"].Value = user;

                        Session["CurrentCulture"] = "en-GB";
                        Session["SCAID"] = split[3].Replace("scaid=", "");
                        Session["SCALoginID"] = split[4].Replace("scaname=", "");
                        Session["__SessionHelper__"] = "";
                        Session["KioskID"] = split[0].Replace("cscid=", "");
                        Session["LoginID"] = CSCID;
                        Session["FullName"] = split[5].Replace("vlename=", "");
                        Session["PaymentFlag"] = "S";
                        Session["Role"] = role;
                        Session["sRole"] = role;
                        Session["Balance"] = 0;
                        Session["UserType"] = "KIOSK";

                        //Response.Write(CookieVal);

                        //Response.Write("Culture"+Session["CurrentCulture"].ToString() + " SCAID" + Session["SCAID"].ToString()+ " SCALoginID" + Session["SCALoginID"].ToString() + "KioskID " + Session["KioskID"].ToString() + " FullName" + Session["FullName"].ToString() + "PaymentFlag" + Session["PaymentFlag"].ToString());

                        Response.Redirect("/WebApp/Kiosk/Forms/DashboardChart.aspx", false);

                    }

                    else
                    {
                        Response.Write("Please Clear The Browser Cookies and  Login Again .....");
                    }
                }
                else
                {
                    Response.Write("Please Clear The Browser Cookies and  Login Again .....");
                }
            }

        }
    }
}