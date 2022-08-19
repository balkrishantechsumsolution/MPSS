using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Provisional
{
    public partial class Acknowledgement : CommonBasePage
    {
        MigrationBLL t_MigrationBLL = new MigrationBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = t_MigrationBLL.GetProvisionalDetail(m_ServiceID, m_AppID);
            DataTable StudentDT = dt.Tables[0];
            DataTable AppTB = dt.Tables[1];
            DataTable PaymentTB = dt.Tables[2];
            DataTable HistoryTB = dt.Tables[3];
            


            if (!IsPostBack && StudentDT != null && StudentDT.Rows.Count > 0)
            {
                //try
                //{
                ProfilePhoto.Src = StudentDT.Rows[0]["Photograph"].ToString();
                ProfileSignature.Src = StudentDT.Rows[0]["Signature"].ToString();

                FullName.Text = StudentDT.Rows[0]["Name"].ToString();

                lblBrnachName.Text = StudentDT.Rows[0]["CourseName"].ToString();
                lblProgram.Text = StudentDT.Rows[0]["ProgramName"].ToString();

                gender.Text = StudentDT.Rows[0]["Gender"].ToString();

                EmailID.Text = StudentDT.Rows[0]["email"].ToString();
                MobileNo.Text = StudentDT.Rows[0]["Mobile"].ToString();
                Category.Text = StudentDT.Rows[0]["Category"].ToString();
                lblCollege.Text = StudentDT.Rows[0]["CollegeName"].ToString();

                lblRegNo.Text = StudentDT.Rows[0]["EnrollmentNo"].ToString();
                lblRoll.Text = StudentDT.Rows[0]["RollNo"].ToString();


                lblDOB.Text = StudentDT.Rows[0]["DOB"].ToString();
                lblAdmissionYear.Text = StudentDT.Rows[0]["AdmissionYear"].ToString();
                lblSession.Text = StudentDT.Rows[0]["Session"].ToString();

                if (AppTB != null && AppTB.Rows.Count > 0)
                {
                    txtnameEnglish.Text = AppTB.Rows[0]["StudentNameEnglish"].ToString();
                    txtNameHindi.Text = AppTB.Rows[0]["StudentNameHindi"].ToString();
                    txtFather.Text = AppTB.Rows[0]["FatherName"].ToString();
                    txtAdmission.Text = AppTB.Rows[0]["AdmissionYear"].ToString();
                    txtPassing.Text = AppTB.Rows[0]["PassingYear"].ToString();
                    txtEmailID.Text = AppTB.Rows[0]["EmailID"].ToString();
                    txtMobileNo.Text = AppTB.Rows[0]["MobileNo"].ToString();

                    txtRemark.Text = AppTB.Rows[0]["Remark"].ToString();

                    txtMode.Text = AppTB.Rows[0]["DeliverMode"].ToString();
                    txtType.Text = AppTB.Rows[0]["DeliverType"].ToString();
                    txtAddress1.Text = AppTB.Rows[0]["AddressLine1"].ToString();
                    txtAddress2.Text = AppTB.Rows[0]["AddressLine2"].ToString();
                    txtState.Text = AppTB.Rows[0]["State"].ToString();
                    txtDist.Text = AppTB.Rows[0]["DISTRICT"].ToString();
                    txtTaluka.Text = AppTB.Rows[0]["SUBDISTRICT"].ToString();
                    txtVillage.Text = AppTB.Rows[0]["Village"].ToString();
                    txtPinCode.Text = AppTB.Rows[0]["PinCode"].ToString();
                }



                if (HistoryTB != null && HistoryTB.Rows.Count > 0)
                {
                    tblHistory.Visible = true;
                    grdHistory.DataSource = HistoryTB;
                    grdHistory.DataBind();
                }

                if (PaymentTB.Rows.Count > 0)
                {
                    lblAppID.Text = PaymentTB.Rows[0]["AppID"].ToString();
                    AppDate.Text = PaymentTB.Rows[0]["CreatedOn"].ToString();
                    lblTrnsID.Text = PaymentTB.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.Text = PaymentTB.Rows[0]["trans_date"].ToString();
                    lblTotalFee.Text = PaymentTB.Rows[0]["Amount"].ToString();
                    lblPayStatus.Text = PaymentTB.Rows[0]["PayStatus"].ToString();
                }

            }
        }
        
    }
}