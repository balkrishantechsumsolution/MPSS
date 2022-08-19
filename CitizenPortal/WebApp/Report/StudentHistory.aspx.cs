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

namespace CitizenPortal.WebApp.Report
{
    public partial class StudentHistory : AdminBasePage
    {      
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string LoginID = "";
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                CollegeList();
                CourseList();                
            }

            //BindGrid(LoginID, Department);
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
            string College = "";
            string Program = "";
            string t_Year = "";
            string Course = "";

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (ddlCollege.SelectedIndex == 0 || ddlCourse.SelectedIndex == 0 || ddlSession.SelectedIndex == 0)
            //{ ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('College, Course & Admission Year is Mandatory OR search indivadual record')", true);
            //    return;
            //}

            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }
            if (ddlCourse.SelectedIndex != 0)
            {
                Course = ddlCourse.SelectedValue;
            }
            if (ddlCollege.SelectedIndex != 0)
            {
                College = ddlCollege.SelectedValue;
            }

            if (ddlProgram.SelectedIndex != 0)
            {
                Program = ddlProgram.SelectedValue;
            }
            if (ddlSession.SelectedIndex != 0)
            {
                t_Year = ddlSession.SelectedValue;
            }
            
            DataTable ds = null;
            ds = m_FacultyModuleBLL.GetCSVTUStudentHistory(LoginID, Department, FromDate, ToDate, RollNo, RegNo, College, Course, Program, t_Year);

            //DataTable ds = m_G2GDashboardBLL.GetDTEG2GDashboardDetails(LoginID, Department, Service, District, Status);

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
                j = e.Row.Cells.Count-1;

                t_ViewOutput = new HtmlAnchor();
                t_ViewOutput.ID = "View_Output" + e.Row.RowIndex;

                t_ViewOutput.InnerHtml = "Student History";

                t_ViewOutput.Attributes.Add("onclick", "StudentHistory('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[j].Text + "')");

                t_ViewOutput.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[j].Controls.Add(t_ViewOutput);
                e.Row.Cells[j].Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
                e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                
                //i++;

                t_Anchor = null;

                ////-------------------------------//
                //i = e.Row.Cells.Count - 1;

                t_Image = new Image();
                t_Image.ID = "img" + e.Row.RowIndex;

                t_Image.ImageUrl = e.Row.Cells[2].Text;
                t_Image.AlternateText = e.Row.Cells[11].Text;
                t_Image.Attributes.Add("style", "width:50px;height:75px;border:1px solid #ccc");
                e.Row.Cells[2].Controls.Add(t_Image);

                t_SImage = new Image();
                t_SImage.ID = "img" + e.Row.RowIndex;

                t_SImage.ImageUrl = e.Row.Cells[3].Text;
                t_SImage.AlternateText = e.Row.Cells[11].Text;
                t_SImage.Attributes.Add("style", "width:90px;height:50px;border:1px solid #ccc");
                e.Row.Cells[3].Controls.Add(t_SImage);
                //i++;

                t_Anchor = null;
                t_Image = null;
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Attributes.Add("style", "display:none");
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
        
        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProgramList();
        }
    }
}