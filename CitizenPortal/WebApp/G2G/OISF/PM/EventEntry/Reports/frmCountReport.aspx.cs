using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.OISF.PM.EventEntry.Reports
{
    public partial class frmCountReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                OISFDALReport obj = new OISFDALReport();


                DataSet ds = obj.GetOISFAppDetails("OP06", "", "", "", "", "", "", "", "", "", "");

                drpCenter.DataSource = ds.Tables[0];
                drpCenter.DataTextField = "CenterName";
                drpCenter.DataValueField = "CenterCode";
                drpCenter.DataBind();
                drpCenter.SelectedItem.Text = "Select";

                drpday.DataSource = ds.Tables[1];

                drpday.DataTextField = "batchno";
                drpday.DataValueField = "batchno";
                drpday.DataBind();

                drpday.Items.Insert(0, "Select");
                drpday.SelectedValue = "Select";
                if (Session["LoginID"] == null)
                {


                    // Response.Redirect("/g2c/forms/index.aspx");
                }
                else
                {
                    drpCenter.SelectedValue = Session["LoginID"].ToString().Substring(6, 1);
                    drpCenter.Enabled = false;
                }
            }

        }

        protected void drpday_SelectedIndexChanged(object sender, EventArgs e)
        {
            OISFDALReport obj = new OISFDALReport();


            DataSet ds = obj.GetOISFAppDetails("OP101", drpCenter.SelectedValue,drpday.SelectedValue, "", "", "", "", "", "", "", "");

            if(ds!=null)
            {

                grdAttendanceData.DataSource = ds.Tables[0];
                grdAttendanceData.DataBind();
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataTable dt = null;
                grdAttendanceData.DataSource = dt;

            }

            grdAttendanceData.DataBind();

        }
    }
}