using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Transport
{
    public partial class PaymentInfo : System.Web.UI.Page
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
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (m_ServiceID == "421")
            {
                Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }
            else
            {
                Response.Redirect("/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
            }
        }
    }
}
    