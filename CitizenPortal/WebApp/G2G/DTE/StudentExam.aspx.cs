using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.DTE
{
    public partial class StudentExam : AdminBasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            string LoginID = "";
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                CollegeList();
                BranchList();
                ProgramList();
                //BindDistrict("21");
                //BindService("132");
            }
            
        }

        public void ProgramList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetProgramList();
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

            }
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


        public void LoadGridData()
        {
            string LoginID = "";
            int Department;
            string FromDate = "";
            string ToDate = "";
            string RollNo = txtRoll.Text.Trim();
            string RegNo = txtReg.Text.Trim();
            string Branch = "";
            string College = "";
            string ProgramCode = "";
            string Semester = "";
            string SubProgram = "";
            string t_Year = "";
            string t_Course = "";

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }

            if (ddlBranch.SelectedIndex != 0)
            {
                Branch = ddlBranch.SelectedValue;
            }

            if (ddlCollege.SelectedIndex != 0)
            {
                College = ddlCollege.SelectedValue;
            }

            if (ddlProgram.SelectedIndex != 0)
            {
                ProgramCode = ddlProgram.SelectedValue;
            }
            if (ddlSemester.SelectedIndex != 0)
            {
                Semester = ddlSemester.SelectedValue;
            }
            if (ddlSession.SelectedIndex != 0)
            {
                t_Year = ddlSession.SelectedValue;
            }

            if (ddlSubProgram.SelectedIndex != 0)
            {
                SubProgram = ddlSubProgram.SelectedItem.Text;
            }
            if (ddlCourse.SelectedIndex != 0)
            {
                t_Course = ddlCourse.SelectedItem.Text;
            }

            DataTable ds = null;
            ds = m_G2GDashboardBLL.GetStudentExamData(LoginID, Department, FromDate, ToDate, RollNo, RegNo, College, Branch, ProgramCode, t_Year, Semester, SubProgram, t_Course);
            
            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    DataGridView.DataSource = ds;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataTable dt = null;
                    DataGridView.DataSource = dt;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataTable dt = null;
                DataGridView.DataSource = dt;
            }
            DataGridView.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LoadGridData();
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
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                HtmlAnchor t_ViewOutput = null;
                Image t_Image = null;
                Image t_SImage = null;
                TableCell Cell = GetCellByName(e.Row, "Document");
                if (Cell != null)
                {
                    //t_Anchor = new HtmlAnchor();
                    //t_Anchor.ID = "ViewDocument_" + e.Row.RowIndex;

                    //t_Anchor.InnerHtml = "Student History";

                    //t_Anchor.Attributes.Add("onclick", "StudentHistory()");

                    //t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    //Cell.Controls.Add(t_Anchor);
                    //Cell.Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
                    //Cell.Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    //t_Anchor = null;
                }
                int j = 0;
                j = e.Row.Cells.Count - 1;

                t_ViewOutput = new HtmlAnchor();
                t_ViewOutput.ID = "View_Output" + e.Row.RowIndex;

                t_ViewOutput.InnerHtml = "Detail";

                t_ViewOutput.Attributes.Add("onclick", "ExamDetail('"+ e.Row.Cells[3].Text +"', '" + e.Row.Cells[5].Text + "', '" + e.Row.Cells[6].Text + "')");

                t_ViewOutput.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[j].Controls.Add(t_ViewOutput);
                e.Row.Cells[j].Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
                e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                                
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                //e.Row.Cells[4].Attributes.Add("style", "display:none");
                //e.Row.Cells[2].Attributes.Add("style", "display:none");
                //e.Row.Cells[1].Attributes.Add("style", "display:none");
                //e.Row.Cells[0].Attributes.Add("style", "display:none");
            }
        }

        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.Get_CollegeList();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", ""));
                    //if (!Session["LoginID"].ToString().Contains("Admin") && !Session["LoginID"].ToString().Contains("Univ"))
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

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ////GetSelectedRec();
            //grdView.PageIndex = e.NewPageIndex;
            //grdView.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }

        public void SubProgramList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetSubProgramList(ddlProgram.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlSubProgram.DataSource = dt;
                    ddlSubProgram.DataTextField = "SubProgramme";
                    ddlSubProgram.DataValueField = "SubCode";
                    ddlSubProgram.DataBind();
                    ddlSubProgram.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }


        public void CourseList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetCourseList(ddlProgram.SelectedValue, ddlSubProgram.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCourse.DataSource = dt;
                    ddlCourse.DataTextField = "CourseName";
                    ddlCourse.DataValueField = "Code";
                    ddlCourse.DataBind();
                    ddlCourse.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubProgramList();
        }

        protected void ddlSubProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            CourseList();
        }
    }
}