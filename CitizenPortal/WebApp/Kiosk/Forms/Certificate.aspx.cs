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
    public partial class Certificate : CommonBasePage
    {
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            btnHome.PostBackUrl = Session["HomePage"].ToString();

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            HFAppID.Value = m_AppID;
            HFServiceID.Value = m_ServiceID;

            DataTable t_DT = null;

            AcknowledgementBLL t_AcknowledgementBLL = new AcknowledgementBLL();
            t_DT = t_AcknowledgementBLL.GetAcknowledgementInfo(m_ServiceID, m_AppID);


            if(t_DT != null && t_DT.Rows.Count > 0)
            {
                //SvcName.InnerText = t_DT.Rows[0]["SvcName"].ToString();
                AckURL.Src = t_DT.Rows[0]["CertiURL"].ToString();
            }

        }
    }
}