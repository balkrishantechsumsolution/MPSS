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

namespace CitizenPortal.WebApp.G2G.OUAT
{
    public partial class AdmissionReport : BasePage//System.Web.UI.Page 
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string LoginID = "";
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = 0;//Convert.ToInt32(Session["Department"].ToString());
            
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
            string FromDate = "";
            string ToDate = "";
            string Status = "";
            string Application = "";
            string DistrictCode = "";
            string AppID = "";
            string LoginID = "";
            string RollNo = "";
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (ddlApplication.SelectedValue != "")
            {
                Application = ddlApplication.SelectedValue;
            }

            if (ddlApplication.SelectedValue == "0")
            {
                string m_Message = "Please Select Application Type.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
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
                    string m_Message = "Application No must be of 12 digit number.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    return;
                }
            }

            if (txtRoll.Text != null && txtRoll.Text != "")
            {
                RollNo = txtRoll.Text;
                if (RollNo.Length != 6)
                {
                    string m_Message = "Roll Number must be of 6 digit number.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    return;
                }
            }

            Status = "0";

            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetOUATAdmissionDetails(LoginID, Department, Application, "0", FromDate, ToDate, Status, AppID, RollNo);

            
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows.Count > 0)
                {
                    DataGridView.DataSource = dt;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataTable t_Dt = null;
                    DataGridView.DataSource = t_Dt;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataTable t_Dt = null;
                DataGridView.DataSource = t_Dt;
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
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    int i = 0;
            //    HtmlAnchor t_Anchor = null;
            //    HtmlAnchor t_ViewOutput = null;

            //    TableCell Cell = GetCellByName(e.Row, "Document");
            //    if (Cell != null)
            //    {
            //        t_Anchor = new HtmlAnchor();
            //        t_Anchor.ID = "ViewDocument_" + e.Row.RowIndex;

            //        t_Anchor.InnerHtml = "View Output";

            //        t_Anchor.Attributes.Add("onclick", "ViewOutput()");

            //        t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
            //        Cell.Controls.Add(t_Anchor);
            //        Cell.Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
            //        Cell.Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
            //        t_Anchor = null;
            //    }
            //    int j = 0;
            //    j = e.Row.Cells.Count - 2;

            //    t_ViewOutput = new HtmlAnchor();
            //    t_ViewOutput.ID = "View_Output" + e.Row.RowIndex;

            //    t_ViewOutput.InnerHtml = "View Output";

            //    t_ViewOutput.Attributes.Add("onclick", "ViewOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

            //    t_ViewOutput.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
            //    e.Row.Cells[j].Controls.Add(t_ViewOutput);
            //    e.Row.Cells[j].Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
            //    e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

            //    i++;

            //    t_Anchor = null;

            //    //-------------------------------//
            //    i = e.Row.Cells.Count - 1;

            //    t_Anchor = new HtmlAnchor();
            //    t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

            //    t_Anchor.InnerHtml = "View";

            //    t_Anchor.Attributes.Add("onclick", "TakeAction('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

            //    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
            //    e.Row.Cells[i].Controls.Add(t_Anchor);
            //    e.Row.Cells[i].Attributes.Add("Title", "View");
            //    e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

            //    i++;

            //    t_Anchor = null;
            //}

            //if (e.Row.RowType == DataControlRowType.DataRow
            //|| e.Row.RowType == DataControlRowType.Header
            //|| e.Row.RowType == DataControlRowType.Footer)
            //{

            //    e.Row.Cells[0].Attributes.Add("style", "display:none");
            //}
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
    }
}