using System;
using System.Web.UI.WebControls;
using CitizenPortalLib.DAL;
using System.Data;

namespace CitizenPortal.WebApp.G2G.OISF.PM.EventEntry.Reports
{
    public partial class ScoreReport : System.Web.UI.Page
    {
        OISFDALReport obj = new OISFDALReport();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = obj.GetOISFAppDetails("OP06", "", "", "", "", "", "", "", "", "", "");

                drpCenterId.DataSource = ds.Tables[0];
                drpCenterId.DataTextField = "CenterName";
                drpCenterId.DataValueField = "CenterCode";
                drpCenterId.DataBind();
                drpCenterId.SelectedItem.Text = "Select";

                drpBatchDay.DataSource = ds.Tables[1];

                drpBatchDay.DataTextField = "batchno";
                drpBatchDay.DataValueField = "batchno";
                drpBatchDay.DataBind();

                drpBatchDay.Items.Insert(0, "Select");
                drpBatchDay.SelectedValue = "Select";
            }
            else
            {
                //trvenue.Visible = true;
            }

            Session["LoginID"] = "ground1";
            if (Session["LoginID"] == null)
            {
                Response.Redirect("/g2c/forms/index.aspx");
            }
            else
            {
                drpCenterId.SelectedValue = Session["LoginID"].ToString().Substring(6, 1);
                drpCenterId.Enabled = false;
            }
        }

        public void LoadGridData()
        {
            DataSet ds = obj.GetOISFScoreReport(drpCenterId.SelectedValue, drpEvent.SelectedValue, drpBatchDay.SelectedValue.ToString().Substring(0, 2).Trim());

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataGridView.DataSource = ds.Tables[0];
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataTable dt = null;
                    DataGridView.DataSource = dt;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataTable dt = null;
                DataGridView.DataSource = dt;
            }
            DataGridView.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
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
    }
}