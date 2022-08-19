using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.DTEV2
{
    public partial class AttendanceReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
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

        public void GetData()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("DemoMigrationReportSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    int i;
                    for (i = 0; i < dt.Columns.Count; i++)
                    {
                        BoundField test = new BoundField();
                        test.DataField = dt.Columns[i].ToString();
                        test.HeaderText = dt.Columns[i].ToString();
                        DataGridView.Columns.Add(test);
                        test = null;
                    }
                    DataGridView.DataSource = dt;
                    DataGridView.DataBind();
                }
            }
        }
    }
}