using CitizenPortalLib;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G
{
    public partial class TransactionDetail : AdminBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
            }
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

        protected void Fetch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                var DT1 = DateTime.ParseExact(DateFrom.Value.ToString(), "dd-MM-yyyy", null).ToString("yyyy-MM-dd");
                var DT2 = DateTime.ParseExact(DateTo.Value.ToString(), "dd-MM-yyyy", null).ToString("yyyy-MM-dd");
                SqlCommand cmd = new SqlCommand("ServiceTransactionDetail", con);
                cmd.Parameters.AddWithValue("DateFrom", DT1);
                cmd.Parameters.AddWithValue("DateTo", DT2);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                DataGridView.DataSource = dt;
                DataGridView.DataBind();
            }
        }
    }
}