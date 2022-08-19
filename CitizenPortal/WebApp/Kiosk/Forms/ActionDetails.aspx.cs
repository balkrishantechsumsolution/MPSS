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
    public partial class ActionDetails : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID;
        ActionDetailsBLL m_ActionDetailsBLL = new ActionDetailsBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();          

            btnHome.PostBackUrl = Session["HomePage"].ToString();

            if (!IsPostBack)
            {
                getActionHistoryData();
            }
            getActionDetails();
        }

        protected void getActionHistoryData()
        {
            DataTable dt = m_ActionDetailsBLL.GetActionHistoryData(m_ServiceID, m_AppID);
            gvActionHistory.DataSource = dt;
            gvActionHistory.DataBind();
        }

        protected void getActionDetails()
        {
            DataTable dt = m_ActionDetailsBLL.GetActionDetails(m_AppID);
            lblApplicationName.Text = dt.Rows[0]["AppName"].ToString();
            lblApplicationNo.Text = dt.Rows[0]["AppID"].ToString();
            lblApplicationDate.Text = dt.Rows[0]["CreatedOn"].ToString();
            lblServiceName.Text = dt.Rows[0]["ServiceName"].ToString();
        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            string strSendBack = "Yes";
            Response.Redirect("./Attachment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&IsRequired=" + strSendBack + "");
        }

        protected void btnAcknowledgement_Click(object sender, EventArgs e)
        {

            DataTable dt = m_ActionDetailsBLL.GetActionDetails(m_AppID);
            string strAckUrl = dt.Rows[0]["CertificateURL"].ToString() + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "";
            //Response.Redirect(strAckUrl + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "");
            string s = "window.open('" + strAckUrl + "', 'popup_window', 'width=800,height=600,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }
    }
}