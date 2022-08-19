using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Report
{
    public partial class UniversityReport : AdminBasePage
    {
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
        
        string LoginID = ""; int checkcount = 0;

        List<string> Checked = new List<string>();

        bool m_DispPanel = false;
        string m_Status = "";
        bool m_DispCheckBox = true;
        string m_ServiceID = "";
        string m_Message = "";        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CollegeList();
                GetDepartment();
                CourseList();
                GetReportType();
                divApp.Visible = false;
            }
            
                string Status = "";                
                
                if (ddlStatus.SelectedIndex != 0)
                {
                    Status = ddlStatus.SelectedValue;
                }

                if(Status == "P")
                {
                    m_DispCheckBox = true;
                }
                else
                {
                    m_DispCheckBox = false;
                }
                
                BindData();
            
            
        }
        

        public void GetDepartment()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetDepartment();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlDepartment.DataSource = dt;
                    ddlDepartment.DataTextField = "DepartmentName";
                    ddlDepartment.DataValueField = "DepartmentCode";
                    ddlDepartment.DataBind();
                    ddlDepartment.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetCollegeCSVTU();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", "0"));
                    if (Session["menuRole"].ToString() == "College" || Session["menuRole"].ToString() == "Principal")
                    {
                        ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(Session["LoginID"].ToString().Substring(0, 3)));
                        ddlCollege.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void GetReportType()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetReportType();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlServices.DataSource = dt;
                    ddlServices.DataTextField = "ReportName";
                    ddlServices.DataValueField = "ReportID";
                    ddlServices.DataBind();
                    ddlServices.Items.Insert(0, new ListItem("Select", "0"));
                    
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //BindData();
        }
               
        public void BindData()
        {            
            string FromDate = "";
            string ToDate = "";
            string Service = "";
            string Status = "";            

            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }
            
            try
            {
                gvDetail.Columns.Clear();

                DataTable t_DT = new DataTable();
                
                t_DT = m_FacultyModuleBLL.GetUniversityReport(LoginID, ddlCollege.SelectedValue, ddlDepartment.SelectedValue, ddlCourse.SelectedValue, ddlProgram.SelectedValue,
                    ddlSession.SelectedValue, ddlSemester.SelectedValue, ddlSubject.SelectedValue, Status, txtRollNo.Text.Trim(), ddlServices.SelectedValue, ddlAdmission.SelectedValue);
                if (t_DT != null && t_DT.Rows.Count > 0)
                {
                    divApp.Visible = true;

                    BoundField t_BoundField;
                    ButtonField t_ButtonField;

                    if (m_DispCheckBox)
                    {
                        t_BoundField = new BoundField();
                        t_BoundField.HeaderText = "Select";
                        gvDetail.Columns.Add(t_BoundField);
                    }

                    for (int i = 0; i < t_DT.Columns.Count; i++)
                    {
                        t_BoundField = new BoundField();
                        t_BoundField.DataField = t_DT.Columns[i].ColumnName;
                        t_BoundField.SortExpression = t_DT.Columns[i].ColumnName;

                        if (t_DT.Columns[i].DataType.Equals(typeof(int)) ||
                            t_DT.Columns[i].DataType.Equals(typeof(decimal)))
                        {
                            t_BoundField.ItemStyle.CssClass = "tdRT";
                            t_BoundField.HeaderStyle.CssClass = "tdRT";
                        }
                        else
                        {
                            t_BoundField.ItemStyle.CssClass = "tdLT";
                            t_BoundField.HeaderStyle.CssClass = "tdLT";
                        }
                        t_BoundField.HeaderText = t_DT.Columns[i].ColumnName;

                        gvDetail.Columns.Add(t_BoundField);
                    }

                    t_ButtonField = new ButtonField();
                    t_ButtonField.HeaderText = "Detail";
                    gvDetail.Columns.Add(t_ButtonField);

                    gvDetail.DataSource = t_DT;
                    gvDetail.DataBind();

                    
                }
                else
                {
                    divApp.Visible = false;
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Not Found','No Record Found For Search Criteria !');", true);
                }

                

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Exception!','" + ex.Message.ToString() + "');", true);
            }
        }
        
        void GetSelectedRec()
        {
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
            }
            foreach (GridViewRow rows in gvDetail.Rows)
            {
                if (rows.Cells[0].Controls.Count > 0 && rows.Cells[0].Controls[0].GetType().FullName.Equals(typeof(CheckBox).FullName))
                {
                    CheckBox chk = rows.Cells[0].Controls[0] as CheckBox;
                    if (chk.Checked == true)
                    {
                        if (!Checked.Contains(chk.ID))
                            Checked.Add(chk.ID);
                    }
                    else
                    {
                        if (Checked.Contains(chk.ID))
                            Checked.Remove(chk.ID);
                    }
                }
            }
            ViewState.Remove("Checked");
            ViewState["Checked"] = Checked;
        }

        string GetRecords()
        {
            GetSelectedRec();
            string t_RowID = "";
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
                int t_itemcount = Checked.Count;
                if (t_itemcount == 0)
                {
                    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "PageScript", "alert('Please Select a Record');", true);
                    return "";
                }
                for (int i = 0; i < t_itemcount; i++)
                {
                    if (i > 0)
                        t_RowID = t_RowID + ",";

                    t_RowID += Checked[i].Split('_')[0];
                }
                Checked.Clear();
                ViewState["Checked"] = Checked;
                return t_RowID;
            }
            return "";
        }
        
        DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
        {
            foreach (DataControlFieldCell Cell in Row.Cells)
            {
                if (Cell.ContainingField.ToString() == CellName)
                    return Cell;
            }
            return null;
        }
        
        protected void gvDetail_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Attributes.Add("Style", "text-align:center");
                //e.Row.Cells[12].Attributes.Add("Style", "text-align:center");

                if (m_DispCheckBox)
                    e.Row.Cells[1].Attributes.Add("Style", "Display:none");
                else
                    e.Row.Cells[0].Attributes.Add("Style", "Display:none");

                //if (rbt_Pending.Checked)
                //{
                //    e.Row.Cells[13].Attributes.Add("Style", "Display:none");
                //}

            }
        }

        protected void gvDetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                //e.Row.Cells[0].Controls.Clear();

                //CheckBox t_chk = new CheckBox();

                //t_chk.ID = e.Row.Cells[1].Text + "_ChkHdr";
                //t_chk.Enabled = true;

                //e.Row.Cells[0].Controls.Add(t_chk);
                int j = e.Row.Cells.Count;
                e.Row.Cells[j-2].Attributes.Add("style", "display:none");
                e.Row.Cells[0].Attributes.Add("style", "display:none");
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Controls.Clear();

                CheckBox t_chk = new CheckBox();

                t_chk.ID = e.Row.Cells[1].Text + "_Chk";
                t_chk.Enabled = true;
                if (ViewState["Checked"] != null && ((List<string>)ViewState["Checked"]).Contains(t_chk.ID))
                {
                    t_chk.Checked = true;
                }
                else
                {
                    t_chk.Checked = false;
                }

                if (m_DispCheckBox)
                {
                    e.Row.Cells[0].Controls.Add(t_chk);
                }
            }

            int i = 0;
            HtmlAnchor t_Anchor = null;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                //if (ddlStatus.SelectedValue == "P")
                {                    
                    t_Anchor.Attributes.Add("onclick", "TakeAction('', '', '" + e.Row.Cells[i-1].Text + "')");
                    e.Row.Cells[i-1].Attributes.Add("style", "display:none");
                }
                
                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                e.Row.Cells[0].Attributes.Add("style", "display:none");
                i++;
            }
            t_Anchor = null;

        }

        protected void gvDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            gvDetail.PageIndex = e.NewPageIndex;
            gvDetail.DataBind();
            BindData();
        }
        
        
        public void GetSubject()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetFacultySubjectCSVTU(ddlCourse.SelectedItem.Text, ddlProgram.SelectedValue, ddlSemester.SelectedValue, ddlSession.SelectedValue,"");
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "Subject";
                    ddlSubject.DataValueField = "Code";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, new ListItem("Select", "0"));

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Exception!','" + ex.Message.ToString() + "');", true);
            }
        }

        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubject.Items.Clear();
            ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
            //GetSubject();
        }
        
        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProgram.Items.Clear();
            ddlProgram.Items.Insert(0, new ListItem("Select", "0"));
            ddlSemester.Items.Clear();
            ddlSemester.Items.Insert(0, new ListItem("Select", "0"));
            ddlSubject.Items.Clear();
            ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
            ProgramList();
            GetSemester();
        }

        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSemester.Items.Clear();
            ddlSemester.Items.Insert(0, new ListItem("Select", "0"));
            ddlSubject.Items.Clear();
            ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
            GetSemester();
        }

        private void GetSemester()
        {
            DataTable dt = new DataTable();
            dt = m_FacultyModuleBLL.GetSemesterCSVTU(ddlCourse.SelectedValue, ddlProgram.SelectedValue);
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlSemester.DataSource = dt;
                ddlSemester.DataTextField = "Semester";
                ddlSemester.DataValueField = "Semester";
                ddlSemester.DataBind();
                ddlSemester.Items.Insert(0, new ListItem("Select", "0"));

            }
        }

        public void CourseList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetCourseCSVTU(ddlCollege.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCourse.DataSource = dt;
                    ddlCourse.DataTextField = "CourseName";
                    ddlCourse.DataValueField = "CourseCode";
                    ddlCourse.DataBind();
                    ddlCourse.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void ProgramList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetProgramCSVTU(ddlCourse.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlProgram.DataSource = dt;
                    ddlProgram.DataTextField = "ProgramName";
                    ddlProgram.DataValueField = "ProgramCode";
                    ddlProgram.DataBind();
                    ddlProgram.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Exception!','" + ex.Message.ToString() + "');", true);
            }
        }
    }
}