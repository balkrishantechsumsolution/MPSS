using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Charts
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DEPTOISF.Visible = false;
            SSEPDept.Visible = false;
            DTEDept.Visible = false;
            OUATDept.Visible = false;
            OUATPGDept.Visible = false;
        }

        protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string message = ddlDept.SelectedItem.Text + " - " + ddlDept.SelectedItem.Value;
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);

            if (ddlDept.SelectedValue == "ALL")
            {
                DEPTOISF.Visible = false;
                SSEPDept.Visible = false;
                DTEDept.Visible = false;
                OUATDept.Visible = false;
                OUATPGDept.Visible = false;
            }
            else if(ddlDept.SelectedValue == "OISF")
            {
                SSEPDept.Visible = false;
                DTEDept.Visible = false;
                OUATDept.Visible = false;
                DEPTOISF.Visible = true;
                OUATPGDept.Visible = false;
            }
            else if (ddlDept.SelectedValue == "SSEPD")
            {
                DEPTOISF.Visible = false;
                DTEDept.Visible = false;
                OUATDept.Visible = false;
                SSEPDept.Visible = true;
                OUATPGDept.Visible = false;
            }
            else if (ddlDept.SelectedValue == "DTE")
            {
                DEPTOISF.Visible = false;
                SSEPDept.Visible = false;
                OUATDept.Visible = false;
                DTEDept.Visible = true;
                OUATPGDept.Visible = false;
            }
            else if (ddlDept.SelectedValue == "OUAT")
            {
                DTEDept.Visible = false;
                DEPTOISF.Visible = false;
                SSEPDept.Visible = false;
                OUATDept.Visible = true;
                OUATPGDept.Visible = false;
                GetOUATDatatABLE();
            }
            else if (ddlDept.SelectedValue == "OUATPG")
            {
                DTEDept.Visible = false;
                DEPTOISF.Visible = false;
                SSEPDept.Visible = false;
                OUATDept.Visible = false;
                OUATPGDept.Visible = true;
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

        public void GetOUATDatatABLE()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Report_GetReportDataOUATSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 105);
                    cmd.Parameters.AddWithValue("@FromDate", "");
                    cmd.Parameters.AddWithValue("@ToDate", "");
                    cmd.Parameters.AddWithValue("@Flag", 5);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    DataGridView.DataSource = dt;
                    DataGridView.DataBind();
                }
            }
        }
    }
}