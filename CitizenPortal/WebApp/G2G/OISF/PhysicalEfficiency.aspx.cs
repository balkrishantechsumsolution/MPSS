using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.OISF
{
    public partial class PhysicalEfficiency : System.Web.UI.Page
    {
        OISFBLL m_OISFBLL = new OISFBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_OISFBLL.OSIF_GetEPassData(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            //DataTable dtTransDetail = dt.Tables[1];

            lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
            lblAppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy HH:mm:ss");
            lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
            lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
            lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
            lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
            lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
            lblAge.Text = dtApp.Rows[0]["Age"].ToString() + " years";
            lblCategory.Text = dtApp.Rows[0]["Religion"].ToString() + " (" + dtApp.Rows[0]["Category"].ToString() + ") ";
            ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
            ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }
        }
    }
}