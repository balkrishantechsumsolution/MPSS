using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Examination
{
    public partial class AdmitCard : CommonBasePage
    {
        string mRollNo, m_ServiceID, mExamSession,mSemester;
        ExamFormBLL t_AdmitCardBLL = new ExamFormBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["RollNo"] == null) return;
            if (Request.QueryString["ExamSession"] == null) return;

            if (Request.QueryString["Semester"] != null) {
                mSemester = Request.QueryString["Semester"].ToString();
            };
            mRollNo = Request.QueryString["RollNo"].ToString();
            mExamSession = Request.QueryString["ExamSession"].ToString();

            DataSet dt = t_AdmitCardBLL.GetStudentAdmitCard(mRollNo, mExamSession, mSemester);
            DataTable StudentDT = dt.Tables[0];
            DataTable SubjectListDT = dt.Tables[1];
            

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                //try
                //{
                    ProfilePhoto.Src = StudentDT.Rows[0]["Photograph"].ToString();
                    ProfileSignature.Src = StudentDT.Rows[0]["Signature"].ToString();

                    lblCanddidateName.Text = StudentDT.Rows[0]["Name"].ToString();
                    if (StudentDT.Rows[0]["DOB"].ToString() != "")
                    {
                        DateTime date = Convert.ToDateTime(StudentDT.Rows[0]["DOB"]);
                        DOBConverted.Text = date.ToString("dd-MM-yyyy");
                    }
                    //DateTime AsOndate = Convert.ToDateTime(StudentDT.Rows[0]["CreatedOn"]);
                    
                    lblGender.Text = StudentDT.Rows[0]["Gender"].ToString();

                    lblBrnachName.Text = StudentDT.Rows[0]["CourseName"].ToString();
                    lblProgram.Text = StudentDT.Rows[0]["ProgramName"].ToString();

                    lblCollegeName.Text = StudentDT.Rows[0]["CollegeName"].ToString();
                    FatherName.Text = StudentDT.Rows[0]["Father"].ToString();
                    lblBrnachName.Text = StudentDT.Rows[0]["CourseName"].ToString();
                    lblRollNo.Text = StudentDT.Rows[0]["RollNo"].ToString();
                    lblRegistrationNo.Text = StudentDT.Rows[0]["RegNo"].ToString();                    
                    lblVenue.Text = StudentDT.Rows[0]["ExamCenter"].ToString();
                    lblCurrentSemester.Text = StudentDT.Rows[0]["CurrentSemester"].ToString();

                    if (SubjectListDT != null && SubjectListDT.Rows.Count > 0)
                    {
                        //lblBrnachName.Text = SubjectListDT.Rows[0]["Course"].ToString();

                        GridViewSubject.DataSource = SubjectListDT;
                        GridViewSubject.DataBind();
                    }

                   

                //}
                //catch (Exception ex)
                //{

                //}

                try
                {

                    QRCode.GenerateQRCodeDetails(m_ServiceID, mRollNo);
                    

                }
                catch { }
            }
        }
    }
}