using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.VerificationSU
{
    public partial class Acknowledgement : CommonBasePage
    {
        DocumentVerificationBLL m_DocumentVerificationBLL = new DocumentVerificationBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {


            //float sum = 0.0F;
            //for (int i = 1; i <= 10; i++) {
            //    sum = sum + 1 / (float)i;
            //}

            //sum = +sum;

            //float f;
            //for (f = 0.1f; f <= 0.5; f+=1)
            //{
            //    ++f;
            //}

            //float a = f;




            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_DocumentVerificationBLL.GetDocumentVerification(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];

            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString();
                AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblCertificateName.Text = dtTransDetail.Rows[0]["ServiceName"].ToString();
                lblDeptName.InnerHtml = dtTransDetail.Rows[0]["DepartmentName"].ToString();

                lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();

                lblRegistration.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
                //lblSession.Text = dtApp.Rows[0]["Session"].ToString();
                //lblJoining.Text = dtApp.Rows[0]["JoiningYear"].ToString();
                lblLeaving.Text = dtApp.Rows[0]["LeavingYear"].ToString();
                lblInstitute.Text = dtApp.Rows[0]["InstituteName"].ToString();
                lblReason.Text = dtApp.Rows[0]["Reason"].ToString();

                lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
                lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
                lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
                lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
                lblapplicant_address.Text = dtApp.Rows[0]["FullAddress"].ToString();
                lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();

                lblCompany.Text = dtApp.Rows[0]["CompanyApplicantName"].ToString();
                lblAppFullAddress.Text = dtApp.Rows[0]["AppFullAddress"].ToString();
                lblAppVillage.Text = dtApp.Rows[0]["AppVillage"].ToString();
                lblAppBlock.Text = dtApp.Rows[0]["AppBlockname"].ToString();
                lblAppDistrict.Text = dtApp.Rows[0]["AppDistrictName"].ToString();
                lblAppPin.Text = dtApp.Rows[0]["AppPinCode"].ToString();

                lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();                
                //AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
                lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                //lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
                //lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
                //lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
                lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();

                ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
            }
        }
    }
}