using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class OUATProcessbar : CitizenPortalLib.BasePage
    {
        string m_AppID, m_ServiceID;
        string m_UserType;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            if (Request.QueryString["FormA_AppID"] != null && Request.QueryString["FormA_AppID"].ToString() != "")
            {
                lblAppID.Text = Request.QueryString["FormA_AppID"].ToString();
            }
            else
            {
            lblAppID.Text = m_AppID;

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (m_ServiceID == "403"|| m_ServiceID == "409")
            {
                
                Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }
            else
            {
                if (m_ServiceID == "428")
                {
                    lblTitle.InnerText = "SUBMISSION OF AGRO POLYTECHNIC OUAT 2017-18";
                }
                Response.Redirect("/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }
        }
    }
}