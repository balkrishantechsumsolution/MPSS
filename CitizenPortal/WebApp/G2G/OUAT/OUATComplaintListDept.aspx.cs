using CitizenPortalLib;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.OUAT
{
    public partial class OUATComplaintListDept : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetOUATComplaintData();
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

        public void GetOUATComplaintData()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetOUATComplaintDataSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 403);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    DataGridView.DataSource = dt;
                    DataGridView.DataBind();
                }
            }
        }
    }
}