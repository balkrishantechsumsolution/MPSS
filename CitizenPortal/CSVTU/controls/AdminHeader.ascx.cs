using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.Sambalpur.controls
{
    public partial class AdminHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginID"].ToString() != null)
            {
                lblUser.InnerHtml = Session["FullName"].ToString();
            }
        }
        protected void lnkbtnLogOut_Click(object sender, EventArgs e)
        {
            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(20);
            }
            if (Request.Cookies["AuthToken"] != null)
            {
                Response.Cookies["AuthToken"].Value = string.Empty;
                Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);
            }

            Response.Redirect("/Sambalpur/index.aspx");
        }

    }
}