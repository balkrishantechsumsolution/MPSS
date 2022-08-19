using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using CitizenPortalLib;
using System.Text;

namespace CitizenPortal.WebApp.G2G.PG
{
    public partial class PGG2GDashboard : AdminBasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

        protected void Page_Load(object sender, EventArgs e)
        {                      

            if (!IsPostBack)
            {
               // txtFromDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
               // txtToDate.Text = DateTime.Now.ToString("dd-MM-yyyy");

                KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
                System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState("21");

                ddlDistrict.DataTextField = "DistrictName";
                ddlDistrict.DataValueField = "DistrictCode";
                ddlDistrict.DataSource = dtDistrict;
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));

                DepartmentList();
                string LogId = Session["LoginID"].ToString();

                if (LogId.Contains("Admin"))
                {
                    ddlDepartment.Enabled = true;
                }
                else
                {
                    var str = LogId;
                    var charsToRemove = new string[] { "SUPG", "S" };
                    foreach (var c in charsToRemove)
                    {
                        str = str.Replace(c, string.Empty);
                    }
                    if (str != "")
                    {
                        ddlDepartment.SelectedIndex = ddlDepartment.Items.IndexOf(ddlDepartment.Items.FindByValue(str));
                        ddlDepartment.Enabled = false;
                    }
                }

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

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;

                TableCell Cell = GetCellByName(e.Row, "Document");
                if (Cell != null)
                {
                    t_Anchor = new HtmlAnchor();
                    t_Anchor.ID = "ViewDocument_" + e.Row.RowIndex;

                    t_Anchor.InnerHtml = "View";

                    t_Anchor.Attributes.Add("onclick", "ViewDoc('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "')");

                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    Cell.Controls.Add(t_Anchor);
                    Cell.Attributes.Add("Title", "View");
                    Cell.Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    t_Anchor = null;
                }

                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";
                
                t_Anchor.Attributes.Add("onclick", "TakeAction('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "')");
                if (Convert.ToString(Session["LoginID"]).Contains("Admin"))
                {
                    t_Anchor.Attributes.Add("style", "font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    t_Anchor.Attributes.Add("class", "disable");
                    
                }
                else
                {
                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                }                
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;

                t_Anchor = null;
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[0].Attributes.Add("style", "display:none");
                e.Row.Cells[5].Attributes.Add("style", "display:none");
            }

        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            grdView.PageIndex = e.NewPageIndex;
            grdView.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string FromDate = "";
            string ToDate = "";
            string Status = "";
            string category = "";
            string DistrictCode = "";
            string AppID = "";
            string LoginID = "";
            string RollNo = "";
            int Department;
            string CourseType = "";
            string DepartmentId = "";
            string Program = "";

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (ddlCategory.SelectedValue != "")
            {
                category = ddlCategory.SelectedValue;
            }

            //if (ddlCategory.SelectedValue == "0")
            //{
            //    string m_Message = "Please Select Application Type.";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            //    return;
            //}

            if (ddlDistrict.SelectedValue != "")
            {
                DistrictCode = ddlDistrict.SelectedValue;
            }

            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }

            if (txtAppID.Text != null && txtAppID.Text != "")
            {
                AppID = txtAppID.Text;
                if (AppID.Length != 12)
                {
                    string m_Message = "Reference ID must be of 12 digit number.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    return;
                }
            }

            CourseType = ddlCourse.SelectedValue.ToString();
            DepartmentId = ddlDepartment.SelectedValue.ToString();
            Program = ddlProgram.SelectedValue.ToString();

            Status = ddlStatus.SelectedValue;

            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetPGG2GData(LoginID, Department, category, DistrictCode, FromDate, ToDate, Status, AppID, CourseType, DepartmentId, Program);

            grdView.DataSource = dt;
            grdView.DataBind();

            lblTotalRecords.InnerText = dt.Rows.Count.ToString();
        }

        public void DepartmentList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.Get_SUDepartmentList("");
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlDepartment.DataSource = dt;
                    ddlDepartment.DataTextField = "DeptName";
                    ddlDepartment.DataValueField = "DeptCode";
                    ddlDepartment.DataBind();
                    ddlDepartment.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Could not process your request, please check error log---\n" + ex.Message + "')</script>");
            }
        }
        public void ProgrammList(string DepartmentCode,string CourseType)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.Get_SUProgramList(DepartmentCode, CourseType);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlProgram.DataSource = dt;
                    ddlProgram.DataTextField = "Program";
                    ddlProgram.DataValueField = "ProgramId";
                    ddlProgram.DataBind();
                    ddlProgram.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Could not process your request, please check error log---\n" + ex.Message + "')</script>");
            }
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartment.SelectedIndex > 0 && ddlCourse.SelectedIndex > 0)
            {
                string Department = ddlDepartment.SelectedValue.ToString();
                string Course = ddlCourse.SelectedValue.ToString();

                ProgrammList(Department, Course);
            }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            try
            {
                DownloadCSVFormat();
            }
            catch (Exception ex)
            {

            }
        }

        public void DownloadCSVFormat()
        {
            //dt.Columns.RemoveAt(0);
            //dt.Columns.RemoveAt(4);
            //dt.Columns.RemoveAt(5);
            //dt.Columns.RemoveAt(5);
            //dt.Columns.RemoveAt(7);
            //dt.Columns.RemoveAt(7);
            DataTable dt = new DataTable();
            DataRow drow;
            dt.Columns.Add(new System.Data.DataColumn("SNo", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Application No", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Application Date", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Applicant Name", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Status", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Programme", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Category", typeof(String)));

            foreach (GridViewRow row in grdView.Rows)
            {
                
                drow = dt.NewRow();
                drow[0] = row.Cells[1].Text;
                drow[1] = row.Cells[2].Text;
                drow[2] = row.Cells[3].Text;
                drow[3] = row.Cells[4].Text;
                drow[4] = row.Cells[6].Text;
                drow[5] = row.Cells[7].Text;
                drow[6] = row.Cells[8].Text;

                dt.Rows.Add(drow);
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Report_" + DateTime.Now + ".csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            StringBuilder csv = new StringBuilder();

            for (int c = 0; c < dt.Columns.Count; c++)
            {
                if (c > 0)
                    csv.Append(",");
                DataColumn dc = dt.Columns[c];
                string columnTitleCleaned = CleanCSVString(dc.ColumnName);
                csv.Append(columnTitleCleaned);
            }
            csv.Append(Environment.NewLine);
            foreach (DataRow dr in dt.Rows)
            {
                StringBuilder csvRow = new StringBuilder();
                for (int c = 0; c < dt.Columns.Count; c++)
                {
                    if (c != 0)
                        csvRow.Append(",");

                    object columnValue = dr[c];
                    if (columnValue == null)
                        csvRow.Append("");
                    else
                    {
                        string columnStringValue = columnValue.ToString();


                        string cleanedColumnValue = CleanCSVString(columnStringValue);

                        if (columnValue.GetType() == typeof(string) && !columnStringValue.Contains(","))
                        {
                            cleanedColumnValue = "=" + cleanedColumnValue; // Prevents a number stored in a string from being shown as 8888E+24 in Excel. Example use is the AccountNum field in CI that looks like a number but is really a string.
                        }
                        csvRow.Append(cleanedColumnValue);
                    }
                }
                csv.AppendLine(csvRow.ToString());
            }

            //HttpResponseBase response = Context.Request;
            Response.Output.Write(csv.ToString());
            Response.Flush();
            Response.End();
        }

        protected string CleanCSVString(string input)
        {
            string output = "\"" + input.Replace("\"", "\"\"").Replace("\r\n", " ").Replace("\r", " ").Replace("\n", "") + "\"";
            return output;
        }
    }
}