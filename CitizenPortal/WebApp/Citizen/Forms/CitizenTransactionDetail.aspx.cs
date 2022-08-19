using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Citizen.Forms
{
    public partial class CitizenTransactionDetail : BasePage
    {
        CitizenDashboardBLL m_CitizenDashboardBLL = new CitizenDashboardBLL();
        string UID = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = null;
            UID = Session["LoginID"].ToString();
            dt = m_CitizenDashboardBLL.ShowCitizenDashboardGrid(UID);
            DataGridView.DataSource = dt;
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

        DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
        {
            foreach (DataControlFieldCell Cell in Row.Cells)
            {
                if (Cell.ContainingField.ToString() == CellName)
                    return Cell;
            }
            return null;
        }

        protected void DataGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                string t_PaymentStatus = "U";
                string t_AckURL = "";

                TableCell Cell = GetCellByName(e.Row, "PaymentStatus");

                if (Cell != null && Cell.Text != "")
                {
                    if (Cell.Text.ToUpper() == "PAID")
                    {
                        t_PaymentStatus = "P";
                    }
                }

                Cell = GetCellByName(e.Row, "View");

                if (Cell != null && Cell.Text != "" && Cell.Text != "&nbsp;")
                {
                    t_AckURL = Cell.Text.Replace("&nbsp;", "");
                }

                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                t_Anchor.Attributes.Add("onclick", "TakeAction('" + e.Row.Cells[1].Text + "', '" + e.Row.Cells[3].Text + "', '" + t_PaymentStatus + "', '" + t_AckURL + "')");

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
                e.Row.Cells[1].Attributes.Add("style", "display:none");
                e.Row.Cells[2].Attributes.Add("style", "display:none");
            }
        }
    }
}