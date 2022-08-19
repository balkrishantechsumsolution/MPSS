using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Examination
{
    public partial class RTRVAcknowledgement : CommonBasePage
    {
        ExamFormBLL t_ExamFormBLL = new ExamFormBLL();
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = t_ExamFormBLL.GetRTRVStudentDetail(m_ServiceID, m_AppID);
            DataTable StudentDT = dt.Tables[0];
            DataTable SubjectTB = dt.Tables[1];
            DataTable PaymentTB = dt.Tables[2];


            if (!IsPostBack && StudentDT != null && StudentDT.Rows.Count > 0)
            {
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

                lblRegNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                lblRoll.Text = StudentDT.Rows[0]["RollNo"].ToString();
                lblRegNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                
                lblDOB.Text = StudentDT.Rows[0]["DOB"].ToString();
                lblAdmissionYear.Text = StudentDT.Rows[0]["AdmissionYear"].ToString();
                lblSession.Text = StudentDT.Rows[0]["Session"].ToString();
                
                lblCurrentSemester.Text = StudentDT.Rows[0]["CurrentSemester"].ToString();
                
                if (SubjectTB != null && SubjectTB.Rows.Count > 0)
                {
                    lblExamYear.Text = SubjectTB.Rows[0]["ExamYear"].ToString();
                    Regular.Visible = true;
                    GridViewSubject.DataSource = SubjectTB;
                    GridViewSubject.DataBind();

                    
                    
                }

                if (PaymentTB.Rows.Count > 0)
                {
                    lblAppID.Text = PaymentTB.Rows[0]["AppID"].ToString();
                    AppDate.Text = PaymentTB.Rows[0]["CreatedOn"].ToString();
                    lblTrnsID.Text = PaymentTB.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.Text = PaymentTB.Rows[0]["trans_date"].ToString();
                    lblTotalFee.Text = PaymentTB.Rows[0]["Amount"].ToString();
                    lblPayStatus.Text = PaymentTB.Rows[0]["PayStatus"].ToString();
                    if (m_ServiceID == "1474") {
                        trService.Visible = false;
                    }
                    lblSubjectSelectedRT.Text = PaymentTB.Rows[0]["PaperCountRT"].ToString();
                    lblSubjectSelectedRV.Text = PaymentTB.Rows[0]["PaperCountRV"].ToString();
                }

            }
        }
        
    }
}