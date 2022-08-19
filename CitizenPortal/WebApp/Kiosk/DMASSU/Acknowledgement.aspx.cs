using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CitizenPortal.WebApp.Kiosk.DMASSU
{
    public partial class Acknowledgement : CommonBasePage
    {
        DivisionalCertificateBLL m_DivisionalCertificateBLL = new DivisionalCertificateBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_DivisionalCertificateBLL.GetDivisionalCertificate(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtTransDetail = dt.Tables[1];
            DataTable dtTrackStatus = dt.Tables[2];

            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAadhaar.Text = dtApp.Rows[0]["UIDNo"].ToString();
                AppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AppDate"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAppname.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();

                lblRegistration.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
                lblSession.Text = dtApp.Rows[0]["Session"].ToString();
                lblJoining.Text = dtApp.Rows[0]["JoiningYear"].ToString();
                lblLeaving.Text = dtApp.Rows[0]["LeavingYear"].ToString();
                lblInstitute.Text = dtApp.Rows[0]["InstituteName"].ToString();
                lblSemester.Text = dtApp.Rows[0]["Semester"].ToString();
                lblSubject.Text = dtApp.Rows[0]["SubjectName"].ToString();
                lblBranch.Text = dtApp.Rows[0]["BranchName"].ToString();

                lblvillage.Text = dtApp.Rows[0]["VillageName"].ToString();
                lbltaluka.Text = dtApp.Rows[0]["SubDistrictName"].ToString();
                lbldist.Text = dtApp.Rows[0]["DistrictName"].ToString();
                lblpin.Text = dtApp.Rows[0]["Pincode"].ToString();
                lblMobile.Text = dtApp.Rows[0]["MobileNo"].ToString();

                lblAppID.Text = dtTransDetail.Rows[0]["AppID"].ToString();
                lblCertificateName.Text = dtTransDetail.Rows[0]["ServiceName"].ToString();
                lbldepartment.Text = dtTransDetail.Rows[0]["DepartmentName"].ToString();
                lblapplicant_address.Text = dtApp.Rows[0]["AppFullAddress"].ToString();
                AppName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblTrnsID.InnerHtml = dtTransDetail.Rows[0]["TrnID"].ToString();
                lblTrnsDate.InnerHtml = Convert.ToDateTime(dtTransDetail.Rows[0]["trans_date"].ToString()).ToString("dd/MM/yyyy");
                lblAppFee.Text = dtTransDetail.Rows[0]["govt"].ToString();
                lblServTax.Text = dtTransDetail.Rows[0]["misc_charges_01"].ToString();
                lblPortalFee.Text = dtTransDetail.Rows[0]["portal_serv_fee"].ToString();
                lblTotalFee.Text = dtTransDetail.Rows[0]["total"].ToString();
                lblAmtWord.Text = dtTransDetail.Rows[0]["AmtInText"].ToString();
                ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();


                try
                {

                    QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);

                }
                catch { }
            }

        }
    }
}