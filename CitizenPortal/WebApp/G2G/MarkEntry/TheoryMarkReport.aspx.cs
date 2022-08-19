using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.HtmlControls;
using System.Text;
using CitizenPortalLib;
using CitizenPortalLib.DataStructs;

namespace CitizenPortal.WebApp.G2G.MarkEntry
{
    public partial class TheoryMarkReport : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        List<string> Checked = new List<string>();
        string m_Message = "";
        string m_LoginID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            m_LoginID = Session["LoginID"].ToString();
            //if ((!Session["LoginID"].ToString().Contains("Admin")) && (!Session["LoginID"].ToString().Contains("Zone")) && (!Session["LoginID"].ToString().Contains("Supervisor")))
            if (Session["menuRole"].ToString() == "College" || Session["menuRole"].ToString() == "Principal")
            {                
                return;
            }
                
            if (!IsPostBack)
            {
                divDetails.Visible = false;
                GetZone();                
                BranchList();
            }
        }

        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetZoneCollegeList(ddlSemester.SelectedValue, ddlSession.SelectedValue, ddlZone.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", ""));                    
                }
            }
            catch (Exception ex)
            {

            }
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
                    ddlBranch.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void PaperList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetTheoryPaperLists(ddlBranch.SelectedValue.ToString(),ddlSemester.SelectedValue.ToString(),ddlSession.SelectedValue.ToString(),ddlSubject.SelectedValue, ddlZone.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlPaper.DataSource = dt;
                    ddlPaper.DataTextField = "PaperName";
                    ddlPaper.DataValueField = "PaperCode";
                    ddlPaper.DataBind();
                    ddlPaper.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void LoadGridData()
        {
            string LoginID = "";
            int Department;
            string ExamType = "";
            string PayStatus = "";
            string Branch = "";
            string College = "";
            string RollNo = "";
            string t_Year = "";
            string Semester = "";
            string PaperCode = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());
          
            ExamType = ddlExamType.SelectedItem.Text;
            College = ddlCollege.SelectedValue;

            Branch = ddlBranch.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            PaperCode = ddlPaper.SelectedValue.ToString();
            RollNo = txtRollNo.Text;            
            
            DataTable ds = null;
            ds = m_AdmissionFormBLL.GetStudentTheoryReport(College, ExamType, Branch, t_Year, Semester, PaperCode, RollNo,ddlSubject.SelectedValue,ddlBranch.SelectedValue ,ddlZone.SelectedValue);
            
            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    DataGridView.DataSource = ds;
                    divDetails.Visible = true;                    
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataGridView.DataSource = null;
                    DataGridView.DataBind();
                    divDetails.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataGridView.DataSource = null;
                DataGridView.DataBind();
                divDetails.Visible = false;
            }
            DataGridView.DataBind();
        }     

        protected void DataGridView_PreRender(object sender, EventArgs e)
        {
            if (DataGridView.Rows.Count > 0)
            {
                DataGridView.UseAccessibleHeader = true;
                DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {            

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                //e.Row.Cells[0].Attributes.Add("style", "display:none");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }
        
        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();
            
            DataGridView.DataSource = null;
            DataGridView.DataBind();
            divDetails.Visible = false;

            //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('/WebApp/G2G/MarkEntry/Acknowledgement.aspx?CC='"+ddlCollege.SelectedValue+ "'&BC='" + ddlBranch.SelectedValue + "'&PC='" + ddlPaper.SelectedValue + "'&SC='" + ddlSemester.SelectedValue + "'&ET='" + ddlExamType.SelectedValue + "'&EY='" + ddlSession.SelectedValue + "'');", true);
            //return;
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
                    ddlSubject.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void GetZone()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetZone(m_LoginID);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlZone.DataSource = dt;
                    ddlZone.DataTextField = "ZoneName";
                    ddlZone.DataValueField = "ZoneID";
                    ddlZone.DataBind();
                    ddlZone.Items.Insert(0, new ListItem("Select", ""));
                    
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ddlBranch_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GetSubjectType();
            CollegeList();
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();
        }
    }
    
}