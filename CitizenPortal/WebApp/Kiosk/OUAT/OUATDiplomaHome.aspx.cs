using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using CitizenPortalLib;
namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class OUATDiplomaHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string m_AppID, m_ServiceID;

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            divPass.Visible = false;

            OUATBLL t_OUATBLL = new OUATBLL();
            DataTable dt = t_OUATBLL.VerifyOUATDiplomaPayment(m_ServiceID, m_AppID);

            if (dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["PayCount"].ToString() == "1")
                {
                    divPayment.Visible = false;
                }
                else
                    divPayment.Visible = true;

                if (dt.Rows[0]["AdmitCount"].ToString() == "0")
                {
                    divPass.Visible = false;
                }
                else
                    divPass.Visible = true;

                if (dt.Rows[0]["DocCount"].ToString() == "0")
                {
                    divDoc.Visible = false;
                }
                else
                    divDoc.Visible = true;
            }
        }
    }
}