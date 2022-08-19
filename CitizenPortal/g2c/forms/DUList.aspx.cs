using System;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.WebControls;
namespace CitizenPortal.g2c.forms
{
    public partial class DUList : System.Web.UI.Page
    {
        KioskRegistrationBLL m_KioskRegistrationBLL = new KioskRegistrationBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = null;
            dt = m_KioskRegistrationBLL.GetDUList();
            DataGridView.DataSource = dt;
            int i;

            for (i = 0; i < dt.Columns.Count; i++)
            {
                BoundField test = new BoundField();
                test.DataField = dt.Columns[i].ToString();
                test.HeaderText = dt.Columns[i].ToString();
                DataGridView.Columns.Add(test);
                test = null;
            }
            DataGridView.DataBind();
        }

        protected void DataGridView_PreRender(object sender, EventArgs e)
        {
            DataGridView.UseAccessibleHeader = false;
            DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
            int CellCount = DataGridView.FooterRow.Cells.Count;
            DataGridView.FooterRow.Cells.Clear();
            DataGridView.FooterRow.Cells.Add(new TableCell());
            DataGridView.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
            DataGridView.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
            DataGridView.FooterRow.Cells.Add(new TableCell());

            TableFooterRow tfr = new TableFooterRow();
            for (int i = 0; i < CellCount; i++)
            {
                tfr.Cells.Add(new TableCell());
                //tfr.Cells[i].i
                //tfr.Cells[i].ColumnSpan = CellCount;
                //tfr.Cells[0].Text = "Footer 2";
            }
            DataGridView.FooterRow.Controls[1].Controls.Add(tfr);
        }

    }
}