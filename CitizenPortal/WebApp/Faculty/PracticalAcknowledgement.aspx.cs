using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Faculty
{
    public partial class PracticalAcknowledgement : AdminBasePage
    {
        string mCollege, mCourse, mProgram, mSemester,mSubject,mYear,mType;
        
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CC"] == null) return; //CollegeCode
            if (Request.QueryString["BC"] == null) return; //CourseCode
            if (Request.QueryString["PC"] == null) return; //ProgramCode
            if (Request.QueryString["SC"] == null) return; //SemesterCode
            if (Request.QueryString["ET"] == null) return; //ExamType
            if (Request.QueryString["EY"] == null) return; //ExamYear
            if (Request.QueryString["SS"] == null) return; //SubjectCode

            mCollege = Request.QueryString["CC"].ToString();
            mCourse = Request.QueryString["BC"].ToString();
            mSemester= Request.QueryString["SC"].ToString();
            mProgram = Request.QueryString["PC"].ToString();
            mYear   = Request.QueryString["EY"].ToString();
            mType   = Request.QueryString["ET"].ToString();
            mSubject = Request.QueryString["SS"].ToString();


            DataSet dt = m_FacultyModuleBLL.PracticalSummaryPrint(mCollege, mCourse, mProgram, mSemester, mSubject, mYear, mType);

            DataTable dtSummary = dt.Tables[0];
            DataTable dtMarksDetail = dt.Tables[1];
            DataTable dtSubmitted = dt.Tables[2];
            DataTable dtPaper = dt.Tables[3];

            if (dtMarksDetail.Rows.Count != 0)
            {
                grdView.DataSource = dtMarksDetail;
                grdView.DataBind();
            }

            if (dt.Tables[2].Rows.Count != 0)
            {
                lblCollegeName.Text = dtSubmitted.Rows[0]["CollegeName"].ToString();
                lblCollegeCode.Text = dtSubmitted.Rows[0]["CollegeCode"].ToString();
                lblSubject.Text = dtPaper.Rows[0]["SubjectName"].ToString();
                lblSubjectCode.Text = dtPaper.Rows[0]["SubjectCode"].ToString();
                lblCourse.Text = dtSubmitted.Rows[0]["CourseName"].ToString();
                lblCourseCode.Text = dtSubmitted.Rows[0]["CourseCode"].ToString();

                lblProgram.Text = dtSubmitted.Rows[0]["ProgramName"].ToString();
                lblProgramCode.Text = dtSubmitted.Rows[0]["ProgramCode"].ToString();

                lblsemester.Text = dtPaper.Rows[0]["Semester"].ToString();
                lblExamType.Text = dtPaper.Rows[0]["ExamType"].ToString();
                lblExamYear.Text = dtPaper.Rows[0]["ExamYear"].ToString();

                lblTotalNo.Text = dtSummary.Rows[0]["TotalStudent"].ToString();
                lblExamNo.Text = dtSummary.Rows[0]["Submitted"].ToString();
                lblEnteredNo.Text = dtSummary.Rows[0]["PaperStudent"].ToString();

                lblSubmittedBy.Text = dtSubmitted.Rows[0]["FirstName"].ToString();
                lblSubmittedOn.Text = dtMarksDetail.Rows[0]["Submitted On"].ToString();
                lblPrintedOn.Text = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");

            }
            
        }
    }
}