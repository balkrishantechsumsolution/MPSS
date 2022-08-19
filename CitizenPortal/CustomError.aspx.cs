using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal
{
    public partial class CustomError : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null) return;
            if (Request.QueryString["ID"].ToString() == "") return;

            //pnlError.Controls.Add(new LiteralControl(Request.QueryString["ID"].ToString()));
            //Response.Redirect("/CustomError.aspx?" + Request.QueryString.ToString() + "&ID=" + Session["ErrorCode"].ToString());
        }
        protected void lnk_home_Click(object sender, EventArgs e)
        {
            try
            {
                string UserHomePage = "";

                if (Session["UserType"] == null)
                {
                    UserHomePage = "/Default.aspx";
                }
                else
                {
                    LoginBLL login = new LoginBLL();

                    System.Data.DataSet dtUser = login.GetUserData(Session["LoginID"].ToString(), Session["UserType"].ToString());
                    System.Data.DataTable user = dtUser.Tables[0];
                    UserHomePage = user.Rows[0]["HomePage"].ToString();

                }


                Response.Redirect(UserHomePage);
                //Response.Redirect(m_AckURL + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID, false);
            }
            catch (Exception ex)
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}