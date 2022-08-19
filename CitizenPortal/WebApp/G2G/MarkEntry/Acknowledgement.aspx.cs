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
    public partial class Acknowledgement : AdminBasePage
    {
        string mCollege, mBranch, mSemester,mPaper,mYear,mType;

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

            mCollege= Request.QueryString["CC"].ToString();
            mBranch = Request.QueryString["BC"].ToString();
            mSemester= Request.QueryString["SC"].ToString();
            mPaper  = Request.QueryString["PC"].ToString();
            mYear   = Request.QueryString["EY"].ToString();
            mType   = Request.QueryString["ET"].ToString();
                        
            DataSet dt = m_G2GDashboardBLL.InternalMarksSummary(mCollege, mBranch, mSemester, mPaper, mYear, mType);

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
                lblPaperName.Text = dtPaper.Rows[0]["PaperName"].ToString();
                lblPaperCode.Text = dtPaper.Rows[0]["PaperCode"].ToString();
                lblBranch.Text = dtSubmitted.Rows[0]["BranchName"].ToString();

                lblsemester.Text = dtPaper.Rows[0]["Semester"].ToString();
                lblExamType.Text = dtPaper.Rows[0]["ExamType"].ToString();
                lblExamYear.Text = dtPaper.Rows[0]["ExamYear"].ToString();

                lblTotalNo.Text = dtSummary.Rows[0]["TotalStudent"].ToString();
                lblExamNo.Text = dtSummary.Rows[0]["PaidStudent"].ToString();
                lblEnteredNo.Text = dtSummary.Rows[0]["PaperStudent"].ToString();

                lblSubmittedBy.Text = dtSubmitted.Rows[0]["FirstName"].ToString();
                lblSubmittedOn.Text = dtMarksDetail.Rows[0]["SubmittedOn"].ToString();
                lblPrintedOn.Text = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");

            }
            
        }
    }
}