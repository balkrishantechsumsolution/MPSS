using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.Entrance.PhD
{
    public partial class PGPhdProcessbar : CitizenPortalLib.BasePage
    {
        string m_AppID, m_ServiceID;
        string m_UserType;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            lblAppID.Text = m_AppID;


            OUATBLL t_OUATBLL = new OUATBLL();
            DataTable t_DT = t_OUATBLL.GetOUATPGAppDetails(m_ServiceID, m_AppID);

            //System.Data.DataTable t_DT;

            if (Session["UserType"].ToString() == "CITIZEN")
            {
                string ProfileID = t_DT.Rows[0]["ProfileID"].ToString();
                lblLoginId.Text = t_DT.Rows[0]["LoginId"].ToString();
                lblPasword.Text = t_DT.Rows[0]["Password"].ToString();
                LoginBLL login = new LoginBLL();
                t_DT = login.GetCitizenDetail(ProfileID);

                Session["CitizenID"] = t_DT.Rows[0]["LoginID"].ToString();
                Session["LoginID"] = t_DT.Rows[0]["LoginID"].ToString();
                Session["FullName"] = t_DT.Rows[0]["FullName"].ToString();
                //Session["G2GRole"] = t_DT.Rows[0]["G2GRole"].ToString();
                Session["Role"] = t_DT.Rows[0]["Role"].ToString();
                Session["CurrentCulture"] = "en-GB";
                Session["__SessionHelper__"] = "";
                Session["sRole"] = t_DT.Rows[0]["Role"].ToString();
                Session["UserType"] = "CITIZEN";
                Session["ProfileID"] = t_DT.Rows[0]["ProfileID"].ToString();

                if (Session["HomePage"] == null)
                {
                    Session["HomePage"] = "/WebApp/Entrance/Login/Dashboard.aspx?UID=" + ProfileID;
                }
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Session.Abandon();
            //Session.RemoveAll();
            //Response.Redirect("/g2c/forms/index.aspx");
            Response.Redirect(Session["HomePage"].ToString());
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (m_ServiceID != "")
            {
                Response.Redirect("/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
                //Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }
            else if (Session["UserType"].ToString() == "CITIZEN")
            {
                Response.Redirect("/WebApp/Entrance/PhD/CSVTUPGPhdHome.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }
            else
            {
                Response.Redirect("/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
                //Response.Redirect("/WebApp/Kiosk/OUAT/OUATPGHome.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }
        }
    }
}