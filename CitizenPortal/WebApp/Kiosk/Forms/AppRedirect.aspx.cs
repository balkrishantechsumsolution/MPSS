using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class AppRedirect : BasePage
    {
        KioskRegistrationBLL m_KioskDashboardBLL = new KioskRegistrationBLL();

        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            string t_UID = "";
            string UserType = "";

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            if (Request.QueryString["UID"] != null && Request.QueryString["UID"].ToString() != "")
            {
                t_UID = Request.QueryString["UID"].ToString();
            }

            if (Session["UserType"].ToString().ToUpper() == "CITIZEN")
            {
                UserType = "CITIZEN";

            }
            else if (Session["UserType"].ToString().ToUpper() == "KIOSK")
            {
                UserType = "KIOSK";
            }

            string t_URL = "";
            DataSet dt = m_KioskDashboardBLL.GetAppStatusWithURL(m_ServiceID, m_AppID, UserType);
            DataTable dtApp = dt.Tables[0];
            //DataTable dtAddress = dt.Tables[1];

            if (dt != null && dt.Tables[0].Rows.Count > 0)
            {
                t_URL = dt.Tables[0].Rows[0]["URL"].ToString();
                //t_URL = t_URL + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + (t_UID == "" ? "" : "&UID=" + t_UID);
                Response.Redirect(t_URL);
            }

        }
    }
}