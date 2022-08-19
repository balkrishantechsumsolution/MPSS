using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System.Data;
using System.Web.UI.HtmlControls;

namespace CitizenPortal.WebApp.G2G.OISF
{
    public partial class DistrictDashboard : BasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsPostBack)
            //{
            //    BindDummyGridrow();
            //}

            string LoginID = "";
            int Department;
            string FromDate = "";
            string ToDate = "";

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());


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


            string category = "";
            string DistrictCode = "";

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
            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetOISFG2GData_District(LoginID, Department, category, DistrictCode,FromDate,ToDate);

            grdView.DataSource = dt;
            grdView.DataBind();

            lblTotalRecords.InnerText = dt.Rows.Count.ToString();
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
        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            grdView.PageIndex = e.NewPageIndex;
            grdView.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}