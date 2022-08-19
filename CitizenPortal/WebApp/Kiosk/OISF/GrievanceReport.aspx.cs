using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OISF
{
    public partial class GrievanceReport : System.Web.UI.Page
    {
        OISFBLL m_OISFBLL = new OISFBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearGrid();
            }
        }

        public void LoadGridData()
        {
            DataTable dt = null;
            dt = m_OISFBLL.GetOISFGrievanceReport(txtDateFrom.Text, txtDateTo.Text);

            if (dt.Rows.Count > 0)
            {
                DataGridView.DataSource = dt;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                dt = null;
                DataGridView.DataSource = dt;
            }
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ClearGrid();
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

        public void ClearGrid()
        {
            DataTable dt=null;
            DataGridView.DataSource = dt;

            for (int i = 0; DataGridView.Columns.Count > i;)
            {
                DataGridView.Columns.RemoveAt(i);
            }
            DataGridView.AutoGenerateColumns = false;
            DataGridView.DataBind();
        }
    }
}