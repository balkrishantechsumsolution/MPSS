using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Death
{
    public partial class DeathAcknowledgement : System.Web.UI.Page
    {
        DeathCertificateBLL m_DeathCertificateBLL = new DeathCertificateBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_DeathCertificateBLL.GetAppDetails(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtAddress = dt.Tables[1];
            DataTable dtTransDetail = dt.Tables[2];

            lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
            lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString(); //UID No
            lblappdate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            lblfullname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
            lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
            lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();

            lblapplicant_address.Text = dtAddress.Rows[0]["FullAddress"].ToString();
            lblapp_dist.Text = dtAddress.Rows[0]["DistrictName"].ToString();
            lblapp_tehsil.Text = dtAddress.Rows[0]["SubDistrictName"].ToString();
            lblpin_app.Text = dtAddress.Rows[0]["Pincode"].ToString();

            lblvillage.Text = dtAddress.Rows[0]["VillageName"].ToString();
            lbltaluka.Text = dtAddress.Rows[0]["SubDistrictName"].ToString();
            lbldist.Text = dtAddress.Rows[0]["DistrictName"].ToString();
            lblpin.Text = dtAddress.Rows[0]["Pincode"].ToString();

            lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();

            TokenNo.Text = dtTransDetail.Rows[0]["AppID"].ToString();
            AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"].ToString()).ToString("dd/MM/yyyy");
            lblCertificateName.Text = "Death Certificate";
            AppName.Text = dtApp.Rows[0]["FullName"].ToString();
            lblBenificery.Text = dtApp.Rows[0]["FullName"].ToString();
            lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
            lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
            lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
            lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
            lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
            lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();

            lbl1Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(10).ToString("dd/MM/yyyy");
            lbl2Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(20).ToString("dd/MM/yyyy");
            lbl3Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(30).ToString("dd/MM/yyyy");

        }
    }
}
