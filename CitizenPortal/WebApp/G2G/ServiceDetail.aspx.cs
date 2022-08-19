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

namespace CitizenPortal.WebApp.G2G
{
    public partial class ServiceDetail : AdminBasePage
    {
        ServiceDetailBLL m_ServiceDetailBLL = new ServiceDetailBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string LoginID = "";
            HFServiceID.Value = "1001";
            LoginID = Session["LoginID"].ToString();
            
            if (!IsPostBack)
                GetServices();
        }

        private void GetServices()
        {
            DataTable dt = null;

            dt = m_ServiceDetailBLL.GetActiveServices();            
            ddlService.DataSource = dt;
            ddlService.DataTextField = "SvcName";
            ddlService.DataValueField = "SvcID";
            ddlService.DataBind();
            ddlService.Items.Insert(0, new ListItem("--Select Service--", "0"));
        }

        private void GetServiceDetails()
        {
            DataSet t_DS = null;
            DataTable t_DT = null;
            DataTable t_DTColName = null;
            DataTable t_DTServiceSummary = null;
            DataTable t_DTServiceSummaryColName = null;
            int t_Count = 0;

            t_DS = m_ServiceDetailBLL.GetServiceDetail(ddlService.SelectedValue, "", "");

            t_DT = t_DS.Tables[0];
            t_DTColName = t_DS.Tables[1];
            t_DTServiceSummary = t_DS.Tables[2];
            t_DTServiceSummaryColName = t_DS.Tables[3];


            //lblDeptName.Text = "SSEPD";

            grdView.Columns.Clear();

            BoundField t_BoundField;
            t_Count = t_DT.Columns.Count;
            for (int i = 0; i < t_Count; i++)
            {
                t_BoundField = new BoundField();
                t_BoundField.DataField = t_DT.Columns[i].ColumnName;

                if (t_DTColName.Columns.Contains(t_DT.Columns[i].ColumnName))
                    t_BoundField.HeaderText = t_DTColName.Rows[0][t_DT.Columns[i].ColumnName].ToString();
                else
                    t_BoundField.HeaderText = t_DT.Columns[i].ColumnName.ToString();

                grdView.Columns.Add(t_BoundField);
            }


            grdView.DataSource = t_DT;
            grdView.DataBind();


            grdViewSummary.Columns.Clear();

            t_BoundField = null;
            t_Count = t_DTServiceSummary.Columns.Count;
            for (int i = 0; i < t_Count; i++)
            {
                t_BoundField = new BoundField();
                t_BoundField.DataField = t_DTServiceSummary.Columns[i].ColumnName;

                if (t_DTServiceSummaryColName.Columns.Contains(t_DTServiceSummary.Columns[i].ColumnName))
                    t_BoundField.HeaderText = t_DTServiceSummaryColName.Rows[0][t_DTServiceSummary.Columns[i].ColumnName].ToString();
                else
                    t_BoundField.HeaderText = t_DTServiceSummary.Columns[i].ColumnName.ToString();

                grdViewSummary.Columns.Add(t_BoundField);
            }

            grdViewSummary.DataSource = t_DTServiceSummary;
            grdViewSummary.DataBind();

            divDetails.Visible = true;
            lblTotalRecords.InnerText = t_DT.Rows.Count.ToString();
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
            if (false && e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;

                TableCell Cell = GetCellByName(e.Row, "Document");
                if (Cell != null)
                {
                    t_Anchor = new HtmlAnchor();
                    t_Anchor.ID = "ViewDocument_" + e.Row.RowIndex;

                    t_Anchor.InnerHtml = "View";

                    t_Anchor.Attributes.Add("onclick", "ViewDoc('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    Cell.Controls.Add(t_Anchor);
                    Cell.Attributes.Add("Title", "View");
                    Cell.Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    t_Anchor = null;
                }

                i = 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = e.Row.Cells[1].Text+"_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = e.Row.Cells[1].Text;

                t_Anchor.Attributes.Add("onclick", "TakeAction('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", e.Row.Cells[1].Text);
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                i++;

                t_Anchor = null;
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
            GetServiceDetails();
        }
    }
}