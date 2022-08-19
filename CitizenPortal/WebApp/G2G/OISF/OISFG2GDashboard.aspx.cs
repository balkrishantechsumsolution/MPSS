using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.G2G.OISF
{
    public partial class OISFG2GDashboard : BasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsPostBack)
            //{
            //    BindDummyGridrow();
            //}

            


            if (!IsPostBack)
            {
                txtFromDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                txtToDate.Text = DateTime.Now.ToString("dd-MM-yyyy");

                KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
                System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState("21");

                ddlDistrict.DataTextField = "DistrictName";
                ddlDistrict.DataValueField = "DistrictCode";
                ddlDistrict.DataSource = dtDistrict;
                ddlDistrict.DataBind();

                ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));


            }
                        
        }

        public void BindDummyGridrow()
        {
            DataTable dt = new DataTable();
            //dt.Columns.Add("Select");
            dt.Columns.Add("Sl. No.");
            dt.Columns.Add("Application ID");
            dt.Columns.Add("Application Date");
            dt.Columns.Add("Application Name");
            dt.Columns.Add("Service Name");
            dt.Columns.Add("Status");
            dt.Columns.Add("Delivery Date");
            dt.Columns.Add("Payment");
            dt.Columns.Add("Document");
            dt.Columns.Add("Certificate");
            dt.Columns.Add("Remark");
            dt.Columns.Add("Action");
            grdView.DataSource = dt;
            grdView.DataBind();
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

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
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
            }

            //if ((e.Row.RowType == DataControlRowType.Footer))
            //{
            //    e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Left;

            //    e.Row.Font.Bold = true;

            //    double t_ServiceUsedl = 0;
            //    HtmlAnchor t_Anchor = default(HtmlAnchor);
            //    t_Anchor = new HtmlAnchor();
            //    double t_Total = 0;
            //    //Int32 i = default(Int32);


            //    DataTable t_DT = (DataTable)GDNatPark.DataSource;

            //    e.Row.Cells[0].Text = "Total:";
            //    e.Row.Cells[0].Attributes.Add("style", "text-align:left;");

            //    if (e.Row.Cells.Count <= 29)
            //    {
            //        //' for the Footer, display the totals
            //        for (int i = 0; i < 29; i++)
            //        {
            //            if (i != 0 && i != 1 && i != 2 && i != 8 && i != 14 && i != 17 && i != 21 && i != 26 && i != 27)
            //            {
            //                t_ServiceUsedl = Convert.ToDouble(t_DT.Compute("Sum([" + t_DT.Columns[i].ColumnName + "])", ""));
            //                e.Row.Cells[i].Text = t_ServiceUsedl.ToString();
            //                e.Row.Cells[i].Attributes.Add("style", "text-align:right;");
            //            }
            //        }

            //    }

            //}
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
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (ddlCategory.SelectedValue != "")
            {
                category = ddlCategory.SelectedValue;
            }

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

            Status = ddlStatus.SelectedValue;

            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetOISFG2GData(LoginID, Department, category, DistrictCode, FromDate, ToDate, Status, AppID);

            grdView.DataSource = dt;
            grdView.DataBind();

            lblTotalRecords.InnerText = dt.Rows.Count.ToString();
        }


    }
}