using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OISF
{
    public partial class OISFHome : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string m_AppID, m_ServiceID;

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            divPass.Visible = false;
            divSEBC.Visible = false;

            OISFBLL t_OISFBLL = new OISFBLL();
            DataTable dt = t_OISFBLL.VerifyPayment(m_ServiceID, m_AppID);

            if(dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["PayCount"].ToString() ==  "1")
                {
                    divPayment.Visible = false;
                }

                if (dt.Rows[0]["PayCount"].ToString() == "1")
                {
                    divPass.Visible = true;
                }

            }

            DataTable dt1 = t_OISFBLL.UploadCasteCertificate(m_ServiceID, m_AppID);

            if (dt1 != null && dt1.Rows.Count > 0)
            {
                if (dt1.Rows[0]["SEBCCount"].ToString() == "0")
                {
                    divSEBC.Visible = false;
                }

                if (dt1.Rows[0]["SEBCCount"].ToString() == "1")
                {
                    divSEBC.Visible = true;
                }

            }

        }
    }
}