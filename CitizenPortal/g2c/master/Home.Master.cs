using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.lokaseba_adhikar.master
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /// Added for check Cookies value with session value ...
            if (Session["AuthToken"] != null
                      && Request.Cookies["AuthToken"] != null)
            {
                if (!Session["AuthToken"].ToString().Equals(
                 Request.Cookies["AuthToken"].Value))
                {
                    HttpCookie myCookie = new HttpCookie("AuthToken");
                    myCookie.Value = "";
                    myCookie.Expires = DateTime.Now.AddMinutes(-1);
                    HttpContext.Current.Response.Cookies.Add(myCookie);
                    //HttpContext.Current.Response.Cookies.Remove("AuthToken");
                    ////Request.Cookies["AuthToken"].Expires = DateTime.Now.AddDays(-1); 
                    Session["AuthToken"] = null;
                    Response.Redirect("/g2c/forms/index.aspx");

                }
                else
                { }

            }
            else
            {
                HttpCookie myCookie = new HttpCookie("AuthToken");
                myCookie.Value = "";
                myCookie.Expires = DateTime.Now.AddMinutes(-1);
                HttpContext.Current.Response.Cookies.Add(myCookie);
                //HttpContext.Current.Response.Cookies.Remove("AuthToken");
                ////Request.Cookies["AuthToken"].Expires = DateTime.Now.AddDays(-1); 
                Session["AuthToken"] = null;
                Response.Redirect("/g2c/forms/index.aspx");
            }
            Response.Cache.SetCacheability(HttpCacheability.NoCache);  // HTTP 1.1.
            Response.Cache.AppendCacheExtension("no-store, must-revalidate");
            Response.AppendHeader("Pragma", "no-cache"); // HTTP 1.0.
            Response.AppendHeader("Expires", "0"); // Proxies.
        }
    }
}