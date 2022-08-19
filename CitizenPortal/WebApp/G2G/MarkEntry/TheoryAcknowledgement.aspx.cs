using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.G2G.MarkEntry
{
    public partial class TheoryAcknowledgement : AdminBasePage
    {
        string mCollege, mBranch, mSemester,mPaper,mYear,mType, mCreatedBy, mExaminerID;

        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();

        protected void Page_Load(object sender, EventArgs e)
            {
            if (Request.QueryString["CC"] == null) return;
            if (Request.QueryString["BC"] == null) return;
            if (Request.QueryString["PC"] == null) return;
            if (Request.QueryString["SC"] == null) return;
            if (Request.QueryString["ET"] == null) return;
            if (Request.QueryString["EY"] == null) return;
            if (Request.QueryString["EI"] == null) return;

            mCollege = Request.QueryString["CC"].ToString();
            mBranch = Request.QueryString["BC"].ToString();
            mSemester= Request.QueryString["SC"].ToString();
            mPaper  = Request.QueryString["PC"].ToString();
            mYear   = Request.QueryString["EY"].ToString();
            mType   = Request.QueryString["ET"].ToString();
            mCreatedBy = Request.QueryString["CB"].ToString();
            mExaminerID = Request.QueryString["EI"].ToString();
            DataSet dt = m_AdmissionFormBLL.TheoryMarksSummary(mCollege, mBranch, mSemester, mPaper, mYear, mType, mCreatedBy, mExaminerID);

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
                lblCollegeName.Text = dtSubmitted.Rows[0]["ZoneName"].ToString();
                lblCollegeCode.Text = dtSubmitted.Rows[0]["ZoneID"].ToString();
                lblPaperName.Text = dtPaper.Rows[0]["PaperName"].ToString();
                lblPaperCode.Text = dtPaper.Rows[0]["PaperCode"].ToString();
                lblBranch.Text = dtPaper.Rows[0]["BranchName"].ToString();

                lblsemester.Text = dtPaper.Rows[0]["Semester"].ToString();
                lblExamType.Text = dtPaper.Rows[0]["ExamType"].ToString();
                lblExamYear.Text = dtPaper.Rows[0]["ExamYear"].ToString();
                              

                lblSubmittedBy.Text = dtSubmitted.Rows[0]["FirstName"].ToString();
                lblSubmittedOn.Text = dtMarksDetail.Rows[0]["SubmittedOn"].ToString();
                lblPrintedOn.Text = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");

            }

            if (dtSummary.Rows.Count != 0)
            {
                lblTotalNo.Text = dtSummary.Rows[0]["TotalStudent"].ToString();
                lblExamNo.Text = dtSummary.Rows[0]["PaidStudent"].ToString();
                lblEnteredNo.Text = dtSummary.Rows[0]["PaperStudent"].ToString();
                lblAbsent.Text = dtSummary.Rows[0]["AbsentStudent"].ToString();
            }
            else {

                lblTotalNo.Text = "Paid";
                lblExamNo.Text = "Appeared";
                lblEnteredNo.Text = "Enteres";
                lblAbsent.Text = "Absenties";
            }
        }
    }
}