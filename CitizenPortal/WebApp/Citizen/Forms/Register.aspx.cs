using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Citizen.Forms
{
    public partial class Register : System.Web.UI.Page
    {
        CitizenRegistrationBLL m_CitizenRegistrationBLL = new CitizenRegistrationBLL();
        string m_UserID, ProfileID, mUID = "", OriginalProfileID = "", KeyField = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UserID"] == null) return;

                m_UserID = Request.QueryString["UserID"].ToString();
                Session["LoginID"] = m_UserID;
                DataSet dt = m_CitizenRegistrationBLL.GetUserDetails(m_UserID);
                DataTable dtApp = dt.Tables[0];
                ProfileID = dtApp.Rows[0]["ProfileID"].ToString();
                lblName.Text = dtApp.Rows[0]["FirstName"].ToString();
                lblUserID.Text = dtApp.Rows[0]["LoginId"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["Email"].ToString();
                mUID = dtApp.Rows[0]["UID"].ToString();
                OriginalProfileID = dtApp.Rows[0]["OriginalProfileID"].ToString();
                KeyField = dtApp.Rows[0]["KeyField"].ToString();
                if (Request.QueryString["UserID"] != null || Request.QueryString["UserID"] != "")
                {
                    Session["KioskID"] = dtApp.Rows[0]["ProfileID"].ToString();
                    Session["LoginID"] = dtApp.Rows[0]["LoginId"].ToString();
                    Session["FullName"] = dtApp.Rows[0]["FirstName"].ToString();
                    Session["PaymentFlag"] = "C";
                    Session["__SessionHelper__"] = "G2C";
                }

                Session["HomePage"] = "/WebApp/Citizen/Forms/Register.aspx?UserID=" + Request.QueryString["UserID"].ToString();

                if (mUID != null && mUID != "")
                {
                    if (ProfileID != null && ProfileID != "")
                    {
                        Session["KioskID"] = ProfileID; //-- Only for citizen
                        Session["HomePage"] = "/WebApp/Citizen/Forms/Dashboard.aspx?UID=" + OriginalProfileID + "&UserID=" + m_UserID + "&ProfileID=" + OriginalProfileID + "&KeyField=" + KeyField;
                        Response.Redirect("/WebApp/Citizen/Forms/Dashboard.aspx?UID=" + OriginalProfileID + "&UserID=" + m_UserID + "&ProfileID=" + OriginalProfileID + "&KeyField=" + KeyField);
                    }
                }
               
            }
        }
    }
}