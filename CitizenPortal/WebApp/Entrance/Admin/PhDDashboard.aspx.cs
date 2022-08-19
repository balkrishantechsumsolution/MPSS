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
using System.IO;
using System.Text;

namespace CitizenPortal.WebApp.Entrance.PhD
{
    public partial class PhDDashboard : AdminBasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        SeniorCitizenBLL m_SeniorCitizenBLL = new SeniorCitizenBLL();
        OUATBLL m_OUATBLL = new OUATBLL();

        string LoginID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //txtFromDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                //txtToDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                GetPhDResearchCenter();
                KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
                System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState("21");
                LoginID = Session["LoginID"].ToString();
                
            }

            BindData();

        }

        private void GetPhDResearchCenter()
        {
            DataTable dtResearchCenter = m_OUATBLL.GetPhDResearchCenter();

            ddlReserchCenter.DataTextField = "ResearchCenters";
            ddlReserchCenter.DataValueField = "RCCode";
            ddlReserchCenter.DataSource = dtResearchCenter;
            ddlReserchCenter.DataBind();

            ddlReserchCenter.Items.Insert(0, new ListItem("-Select-", "0"));
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
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    int i = 0;
                    HtmlAnchor t_Anchor = null;
                    //HiddenField HDFCurrentUrl = new HiddenField();
                    HtmlInputHidden HDFCurrentUrl = new HtmlInputHidden();
                    HDFCurrentUrl.ID = "HDF" + e.Row.RowIndex;
                    //hide for the time being on 21 july as per Niraj Sir
                    TableCell Cell = GetCellByName(e.Row, "Output");

                    LoginID = Session["LoginID"].ToString();
                    string userr = e.Row.Cells[6].Text;
                    if (LoginID.Contains(e.Row.Cells[6].Text))
                    {
                        if (LoginID.Contains("ACPReserve"))
                        {
                            if (LoginID.Contains(e.Row.Cells[6].Text))
                            {
                                HDFCurrentUrl.Value = Convert.ToString(e.Row.Cells[8].Text);
                            }
                            else { HDFCurrentUrl.Value = Convert.ToString(e.Row.Cells[7].Text); }
                            e.Row.Cells[10].Attributes.Add("style", "display:block");

                        }
                        else
                        {
                            //url for action
                            HDFCurrentUrl.Value = Convert.ToString(e.Row.Cells[8].Text);
                            //e.Row.Cells[8].Attributes.Add("style", "display:block");

                        }
                    }
                    
                    if (Cell != null)
                    {
                        t_Anchor = new HtmlAnchor();
                        t_Anchor.ID = "ViewDocument_" + e.Row.RowIndex;

                        t_Anchor.InnerHtml = "View";

                        t_Anchor.Attributes.Add("onclick", "ViewOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

                        t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                        Cell.Controls.Add(t_Anchor);
                        Cell.Attributes.Add("Title", "View");
                        Cell.Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                        t_Anchor = null;
                    }
                    //End Here
                    i = e.Row.Cells.Count - 1;

                    t_Anchor = new HtmlAnchor();
                    t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                    t_Anchor.InnerHtml = "View";

                    t_Anchor.Attributes.Add("onclick", "TakeAction('" + e.Row.Cells[i].Text.Replace("&amp;", "&") + "', '" + e.Row.Cells[2].Text + "', '" + e.Row.Cells[i-1].Text + "')");

                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");

                    e.Row.Cells[i].Controls.Add(HDFCurrentUrl);
                    e.Row.Cells[i].Attributes.Add("Title", "View");
                    e.Row.Cells[i].Controls.Add(t_Anchor);
                    e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                    i++;

                    t_Anchor = null;


                    //HDFCurrentUrl = null;
                }

                if (e.Row.RowType == DataControlRowType.DataRow
                || e.Row.RowType == DataControlRowType.Header
                || e.Row.RowType == DataControlRowType.Footer)
                {

                    e.Row.Cells[0].Attributes.Add("style", "display:none");
                    //e.Row.Cells[5].Attributes.Add("style", "display:none");
                    //e.Row.Cells[6].Attributes.Add("style", "display:none");
                    //e.Row.Cells[7].Attributes.Add("style", "display:none");
                    //e.Row.Cells[8].Attributes.Add("style", "display:none");
                }
                   
            }
            catch (Exception exx)
            {

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
            BindData();
        }
        public void BindData()
        {
            try
            {
                string FromDate = "";
                string ToDate = "";
                string Status = "";
               
                string AppID = "";
                string RollNo = "";

                string Department = "";
                string ResearchCenter = "";
                string Discipline = "";
                string Specilization = "";
                string Mobile = "";

                LoginID = Session["LoginID"].ToString();
                Department = Session["Department"].ToString();
                

                if (ddlReserchCenter.SelectedIndex > 0)
                {
                    ResearchCenter = ddlReserchCenter.SelectedItem.Text;
                }
                if (ddlDiscipline.SelectedIndex > 0)
                {
                    Discipline = ddlDiscipline.SelectedItem.Text;
                }
                if (ddlSpecilization.SelectedIndex > 0)
                {
                    Specilization = ddlSpecilization.SelectedItem.Text;
                }

                if (txtFromDate.Text != "" && txtToDate.Text != "")
                {
                    FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                    ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
                }

                if (txtAppID.Text != null && txtAppID.Text != "")
                {
                    AppID = txtAppID.Text;
                    //if (AppID.Length != 12)
                    //{
                    //    string m_Message = "Reference ID must be of 12 digit number.";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    //    return;
                    //}
                }
                if (txtMobile.Text != "" && txtMobile.Text != null)
                {
                    Mobile = txtMobile.Text.Trim();
                }
                
                Status = ddlStatus.SelectedValue;

                DataTable dt = new DataTable();
                dt = m_G2GDashboardBLL.GetPhDAdmninData(LoginID, Department, FromDate, ToDate, Status, AppID, RollNo, Mobile, ResearchCenter, Discipline, Specilization);
                if (dt.Rows.Count > 0)
                {
                    grdView.DataSource = dt;
                    grdView.DataBind();
                    lblMsg.Text = "";
                    lblMsg.Visible = false;
                    grdView.Visible = true;
                }
                else
                {
                    lblMsg.Text = "No Records Found";
                    lblMsg.Visible = true;
                    grdView.Visible = false;
                }

                //lblTotalRecords.InnerText = dt.Rows.Count.ToString();
            }
            catch (Exception ex)
            {

            }
        }
       

       
        protected void BtnExcel_Click(object sender, EventArgs e)
        {
            string FromDate = "";
            string ToDate = "";
            string Status = "";            
            string AppID = "";
            string RollNo = "";
            string Department;
            string ResearchCenter = "";
            string Discipline = "";
            string Specilization = "";
            string Mobile = "";

            LoginID = Session["LoginID"].ToString();
            Department = Session["Department"].ToString();


            if (ddlReserchCenter.SelectedIndex > 0)
            {
                ResearchCenter = ddlReserchCenter.SelectedItem.Text;
            }
            if (ddlDiscipline.SelectedIndex > 0)
            {
                Discipline = ddlDiscipline.SelectedItem.Text;
            }
            if (ddlSpecilization.SelectedIndex > 0)
            {
                Specilization = ddlSpecilization.SelectedItem.Text;
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
            if (txtMobile.Text != "" && txtMobile.Text != null)
            {
                Mobile = txtMobile.Text.Trim();
            }

            Status = ddlStatus.SelectedValue;
            try
            {
                DataTable dt = new DataTable();
                dt = m_G2GDashboardBLL.GetPhDAdmninData(LoginID, Department, FromDate, ToDate, Status, AppID, RollNo, Mobile, ResearchCenter, Discipline, Specilization);
                if (dt.Rows.Count > 0)
                {
                    DownloadCSVFormat(dt);
                    //DownloadExcelFormat(dt);
                    
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void DownloadCSVFormat_Old(DataTable dt)
        {
            try
            {
                dt.Columns.RemoveAt(0);
                dt.Columns.RemoveAt(4);
                dt.Columns.RemoveAt(5);
                dt.Columns.RemoveAt(5);
                dt.Columns.RemoveAt(7);
                dt.Columns.RemoveAt(7);

                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=Report_" + DateTime.Now + ".csv");
                Response.Charset = "";
                Response.ContentType = "application/text";
                StringBuilder sb = new StringBuilder();
                for (int k = 0; k < dt.Columns.Count; k++)
                {
                    //add separator
                    sb.Append(dt.Columns[k].ColumnName + ',');
                }
                //append new line
                sb.Append("\r\n");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int k = 0; k < dt.Columns.Count; k++)
                    {
                        //add separator
                        sb.Append(dt.Rows[i][k].ToString().Replace(",", ";") + ',');
                       
                    }
                    //append new line
                    sb.Append("\r\n");

                }
                //string style = @"<style> .textmode { mso-number-format:\@; } </style>";
                Response.Output.Write(sb.ToString());
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {
                //row.Cells[3].Attributes.CssStyle["text-align"] = "center";
            }
        }
        public void DownloadExcelFormat(DataTable dt)
        {
            try
            {
                //Create a dummy GridView
                GridView GridView1 = new GridView();
                GridView1.AllowPaging = false;
                GridView1.DataSource = dt;
                GridView1.DataBind();

                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=Report_" + DateTime.Now + ".xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    //Apply text style to each Row
                    GridView1.Rows[i].Attributes.Add("class", "textmode");
                }
                GridView1.RenderControl(hw);
                //style to format numbers to string
                string style = @"<style> .textmode { mso-number-format:\@; } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {               
                                     
            }
        }
      
        public void DownloadCSVFormat(DataTable dt)
        {
            dt.Columns.RemoveAt(0);
            dt.Columns.RemoveAt(4);
            dt.Columns.RemoveAt(5);
            dt.Columns.RemoveAt(5);
            dt.Columns.RemoveAt(7);
            dt.Columns.RemoveAt(7);

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

        protected void grdView_PreRender(object sender, EventArgs e)
        {
            if (grdView.Rows.Count > 0)
            {
                grdView.UseAccessibleHeader = true;
                grdView.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void ddlReserchCenter_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtDiscipline = m_OUATBLL.GetPhDDiscipline(ddlReserchCenter.SelectedValue, "NO","NO");

            ddlDiscipline.DataTextField = "DisciplineName";
            ddlDiscipline.DataValueField = "DisciplineCode";
            ddlDiscipline.DataSource = dtDiscipline;
            ddlDiscipline.DataBind();

            ddlDiscipline.Items.Insert(0, new ListItem("-Select-", "0"));
        }

        protected void ddlDiscipline_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtSpecilization = m_OUATBLL.GetPhDSpecialization(ddlDiscipline.SelectedValue);

            ddlSpecilization.DataTextField = "SpecializationName";
            ddlSpecilization.DataValueField = "SpecializationCode";
            ddlSpecilization.DataSource = dtSpecilization;
            ddlSpecilization.DataBind();

            ddlSpecilization.Items.Insert(0, new ListItem("-Select-", "0"));
        }
    }
}