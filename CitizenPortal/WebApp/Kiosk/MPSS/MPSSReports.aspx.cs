using Microsoft.Owin;
using SqlHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class MPSSReports : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // ShowData();
            }
        }
        protected void ShowData()
        {
            DataTable dt = new DataTable();
            SqlParameter[] parameter = {
                 new SqlParameter("@FinancialYr", ddlFinancialYr.SelectedValue),
                 new SqlParameter("@ReportType", ddlReportType.SelectedValue)
            };

            dt = sqlhelper.ExecuteDataTable("GetReportsdata", parameter);

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                ShowData();
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);



            }


        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            //GridViewRow row = grdValidations.Rows[];

            var appID = GridView1.Rows[id].Cells[0].Text;
            string newWin = "";

            if (ddlReportType.SelectedValue=="2")
            {
                 newWin = "window.open(\"AcknowledgementEnroll.aspx?AppID=" + appID + "&SvcID=1465\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";
            }
            else
            {
                 newWin = "window.open(\"Acknowledgement.aspx?AppID=" + appID + "&SvcID=1466\", \"_blank\", \"WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no\");";
            }

           Page.ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
        }
    }
}