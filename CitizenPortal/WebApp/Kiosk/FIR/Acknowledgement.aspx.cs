using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.FIR
{
    public partial class Acknowledgement : System.Web.UI.Page
    {
        FIRRegistrationBLL m_FIRRegistrationBLL = new FIRRegistrationBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_FIRRegistrationBLL.GetFIRRegistration(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];

            lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
            lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString(); //UID No
            lblappdate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy");
            lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();;
            lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
            lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
            lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();            
            lblCategory.Text = dtApp.Rows[0]["Category"].ToString();            
            lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
            lblvillage.Text = dtApp.Rows[0]["village"].ToString();
            lbltaluka.Text = dtApp.Rows[0]["SubDistrict"].ToString();
            lbldist.Text = dtApp.Rows[0]["District"].ToString();
            lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
            lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();
            lblDate.Text = Convert.ToDateTime(dtApp.Rows[0]["IncidentDate"].ToString()).ToString("dd/MM/yyyy"); 
            lblIncident.Text = dtApp.Rows[0]["IncidentPlace"].ToString();
            lblDescription.Text = dtApp.Rows[0]["Description"].ToString();
            lblParticulars.Text = dtApp.Rows[0]["Particulars"].ToString();
            TokenNo.Text = dtTransDetail.Rows[0]["AppID"].ToString();
            AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"].ToString()).ToString("dd/MM/yyyy");
            lblCertificateName.Text = "Chief Minister Relife Fund (FIRRegistration)";
            lblKiosk.Text = dtTransDetail.Rows[0]["CreatedBy"].ToString();
            lblTrnsID.Text = dtTransDetail.Rows[0]["TrnID"].ToString();
            lblTrnsDate.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
            lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
            lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
            lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
            lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();

            //lbl1Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(10).ToString("dd/MM/yyyy");
            //lbl2Date.Text = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).AddDays(20).ToString("dd/MM/yyyy");

            ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
            try
            {

                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);

            }
            catch { }
        }
    }
}