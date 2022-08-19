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
    public partial class AddExaminer : AdminBasePage
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
                divAddH.Visible = false;
                divAddD.Visible = false;
                divDetails.Visible = false;
                GetZone();                
                BranchList();
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
                    ddlBranch.Items.Insert(0, new ListItem("Select", "0"));
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
                    ddlPaper.Items.Insert(0, new ListItem("Select", "0"));
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
            Examiner = txtExaminer.Text;            
            
            DataTable ds = null;
            ds = m_AdmissionFormBLL.GetExaminer(LoginID, Branch, t_Year, Semester, ddlSubject.SelectedItem.Text, ddlSubject.SelectedValue, PaperCode, Examiner);
            
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
            divAddD.Visible = false;
            divAddH.Visible = false;
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
                    ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
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
                    ddlZone.Items.Insert(0, new ListItem("Select", "0"));
                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        
                    }
                    else
                    {
                        string ZoneID = Session["LoginID"].ToString().ToUpper();
                        ddlZone.SelectedIndex = ddlZone.Items.IndexOf(ddlZone.Items.FindByValue(ZoneID));                        
                        ddlZone.Enabled = false;
                        
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

        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetSubjectType();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            CheckValidation();           
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            CheckValidation();
            if (txtExaminerCode.Text != "" && txtExaminerName.Text != "")
            {
                string[] AFields =
                        {
                            "ZoneID"
                            ,"Semester"
                            ,"ExamYear"
                            ,"BranchCode"
                            ,"SubjectType"
                            ,"SubjectCode"
                            ,"PaperCode"
                            ,"ExaminerCode"
                            ,"ExaminerName"
                            ,"CreatedBy"                            

                    };

                Examiner_DT t_Examiner_DT = new Examiner_DT();

                t_Examiner_DT.RowID = "";
                t_Examiner_DT.ZoneID = ddlZone.SelectedValue;
                t_Examiner_DT.CreatedBy = Session["LoginID"].ToString();
                t_Examiner_DT.Semester = ddlSemester.SelectedValue;
                t_Examiner_DT.ExamYear = ddlSession.SelectedValue;
                t_Examiner_DT.BranchCode = ddlBranch.SelectedValue;
                t_Examiner_DT.SubjectType = ddlSubject.SelectedValue;
                t_Examiner_DT.SubjectCode = "";
                t_Examiner_DT.PaperCode = ddlPaper.SelectedValue;
                t_Examiner_DT.ExaminerCode = txtExaminerCode.Text.Trim();
                t_Examiner_DT.ExaminerName = txtExaminerName.Text.Trim();

                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

                System.Data.DataTable result = null;
                string UID = "";

                result = m_AdmissionFormBLL.InsertExaminer(t_Examiner_DT, AFields);

                if(result.Rows.Count == 1 )
                {
                    divAddH.Visible = false;
                    divAddD.Visible = false;
                    txtExaminerCode.Text = "";
                    txtExaminerName.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Examiner Name Saved Sucessfully!');", true);
                }
                LoadGridData();
            }
            else {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Examiner Code & Name cannot be blank');", true);
                return;
            }
        }

        private void CheckValidation()
        {
            if (ddlZone.SelectedIndex == 0 || ddlBranch.SelectedIndex == 0 || ddlSemester.SelectedIndex == 0 || ddlSession.SelectedIndex == 0 || ddlSubject.SelectedIndex == 0 || ddlPaper.SelectedIndex == 0)
            {
                divAddH.Visible = false;
                divAddD.Visible = false;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please select ALL fields');", true);
                return;
            }
            else {
                divAddH.Visible = true;
                divAddD.Visible = true;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }
    }
    
}