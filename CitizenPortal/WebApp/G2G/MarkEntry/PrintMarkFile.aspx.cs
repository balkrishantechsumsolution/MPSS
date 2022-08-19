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
    
    public partial class PrintMarkFile : AdminBasePage
    {
        string mBranch, mSemester, mPaper, mYear, mZoneID, mCreatedBy, mExaminerID;
        public DataTable dtSummary;
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if ((!Session["LoginID"].ToString().Contains("Admin")) && (!Session["LoginID"].ToString().Contains("Zone")))
            if (Session["menuRole"].ToString() == "College" || Session["menuRole"].ToString() == "Principal")
            {
                return;
            }

            if (Request.QueryString.Count != 0) { 
            if (Request.QueryString["BC"] == null) return;
            if (Request.QueryString["PC"] == null) return;
            if (Request.QueryString["SC"] == null) return;
            if (Request.QueryString["ZI"] == null) return;
            if (Request.QueryString["EY"] == null) return;
            if (Request.QueryString["EI"] == null) return;

            mBranch = Request.QueryString["BC"].ToString();
            mSemester = Request.QueryString["SC"].ToString();
            mPaper = Request.QueryString["PC"].ToString();
            mYear = Request.QueryString["EY"].ToString();
            mZoneID = Request.QueryString["ZI"].ToString();
            mExaminerID = Request.QueryString["EI"].ToString();
                divBody.Visible = false;
                divHead.Visible = false;
                GetPrintMarkFileData();
            }
            
            if (!IsPostBack)
            {                
                GetZone();                
                BranchList();
            }
        }

        private void GetPrintMarkFileData()
        {
            DataSet dt = m_AdmissionFormBLL.PrintMarkFile(mBranch, mSemester, mPaper, mYear, mZoneID, mExaminerID);

            dtSummary = dt.Tables[0];

            if (dtSummary.Rows.Count != 0)
            {
                grdHeader.DataSource = dtSummary;
                grdHeader.DataBind();
            }
            else {
                grdHeader.DataSource = dtSummary;
                grdHeader.DataBind();
                divBody.Visible = true;
                divHead.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true); }
        }

        protected void grdAttendanceSheet_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            string tRollRange = dtSummary.Rows[e.Item.ItemIndex]["RollNoRange"].ToString();
            string tMarFileSetID = dtSummary.Rows[e.Item.ItemIndex]["MarkFileSetID"].ToString();
            string tBranch = dtSummary.Rows[e.Item.ItemIndex]["BranchCode"].ToString();
            string tSemester = dtSummary.Rows[e.Item.ItemIndex]["Semester"].ToString();
            string tPaper = dtSummary.Rows[e.Item.ItemIndex]["PaperCode"].ToString();
            string tZoneID = dtSummary.Rows[e.Item.ItemIndex]["ZoneID"].ToString();
            string tExaminerID = dtSummary.Rows[e.Item.ItemIndex]["ExaminerID"].ToString(); 
            DataSet t_DS = new DataSet();

            t_DS = m_AdmissionFormBLL.PrintMarkFileRange(tBranch, tSemester, tPaper, mYear, tZoneID, tExaminerID, tMarFileSetID, tRollRange); 
            
            if (t_DS.Tables[0].Rows.Count > 0)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                GridView innerDataList = e.Item.FindControl("grdView") as GridView;
                foreach (DataRow rw in t_DS.Tables[0].Rows)
                {
                    innerDataList.DataSource = t_DS.Tables[0];
                    innerDataList.DataBind();
                }
            }



            Label Print = e.Item.FindControl("lblPrintedOn") as Label;
            Print.Text = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");

        }
                
        public void BranchList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetCBCSCourseLists();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlBranch.DataSource = dt;
                    ddlBranch.DataTextField = "Course";
                    ddlBranch.DataValueField = "BranchCode";
                    ddlBranch.DataBind();
                    ddlBranch.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void PaperList()
        {

            DataTable dt = new DataTable();
            dt = m_AdmissionFormBLL.GetTheoryPaperLists(ddlBranch.SelectedValue.ToString(), ddlSemester.SelectedValue.ToString(), ddlSession.SelectedValue.ToString(), ddlSubject.SelectedValue, ddlZone.SelectedValue);
            //if (dt != null && dt.Rows.Count > 0)
            {
                ddlPaper.DataSource = dt;
                ddlPaper.DataTextField = "PaperName";
                ddlPaper.DataValueField = "PaperCode";
                ddlPaper.DataBind();
                ddlPaper.Items.Insert(0, new ListItem("Select", "0"));
            }

        }

        private void GetSubjectType()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetPaperSubjectType(ddlBranch.SelectedValue, ddlSemester.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectType";
                    ddlSubject.DataValueField = "SubjectType";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            mBranch = ddlBranch.SelectedValue;
            mSemester = ddlSemester.SelectedValue;
            mPaper = ddlPaper.SelectedValue;
            mYear = ddlSession.SelectedValue;
            mZoneID = ddlZone.SelectedValue;
            mExaminerID = ddlExaminer.SelectedValue;

            GetPrintMarkFileData();
        }

        protected void ddlExaminer_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetRollRange();
        }

        private void GetZone()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetZone(Session["LoginID"].ToString());
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlZone.DataSource = dt;
                    ddlZone.DataTextField = "ZoneName";
                    ddlZone.DataValueField = "ZoneID";
                    ddlZone.DataBind();
                    ddlZone.Items.Insert(0, new ListItem("Select", "0"));
                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        //btnSave.Visible = false;
                        //btnSubmit.Text = "Re-open for Marks Entry";
                    }
                    else
                    {
                        string ZoneID = Session["LoginID"].ToString().ToUpper();
                        ddlZone.SelectedIndex = ddlZone.Items.IndexOf(ddlZone.Items.FindByValue(ZoneID));
                        //ddlZone.Items.IndexOf(new ListItem("USA"));
                        //ddlZone.SelectedIndex = ddlZone.Items.IndexOf(ddlZone.Items.FindByValue(ZoneID));
                        ddlZone.Enabled = false;
                        //btnSubmit.Text = "Submitted to University";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ddlBranch_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GetSubjectType();            
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();            
        }

        private void GetExaminer()
        {
            string LoginID = "";
            int Department;
            string Branch = "";
            string t_Year = "";
            string Semester = "";
            string PaperCode = "";
            string Examiner = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());

            Branch = ddlBranch.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            PaperCode = ddlPaper.SelectedValue.ToString();

            DataTable ds = null;
            ds = m_AdmissionFormBLL.GetExaminer(LoginID, Branch, t_Year, Semester, ddlSubject.SelectedItem.Text, ddlSubject.SelectedValue, PaperCode, Examiner);

            //if (ds.Rows.Count > 0)
            {
                ddlExaminer.DataSource = ds;
                ddlExaminer.DataTextField = "Examiner";
                ddlExaminer.DataValueField = "ExaminerID";
                ddlExaminer.DataBind();
                ddlExaminer.Items.Insert(0, new ListItem("Select", "0"));
            }
        }

        protected void ddlPaper_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetExaminer();            
        }

        private void GetRollRange()
        {
            string LoginID = "";
            int Department;
            string Branch = "";
            string t_Year = "";
            string Semester = "";
            string PaperCode = "";
            string t_College = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());

            Branch = ddlBranch.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            PaperCode = ddlPaper.SelectedValue.ToString();
            

            DataTable ds = null;
            ds = m_AdmissionFormBLL.GetRollNoRange(Branch, t_Year, Semester, PaperCode, t_College);

            if (ds.Rows.Count > 0)
            {
                ddlRange.DataSource = ds;
                ddlRange.DataTextField = "RangeID";
                ddlRange.DataValueField = "RollNo";
                ddlRange.DataBind();
                ddlRange.Items.Insert(0, new ListItem("Select", "0"));
            }
        }
    }
}