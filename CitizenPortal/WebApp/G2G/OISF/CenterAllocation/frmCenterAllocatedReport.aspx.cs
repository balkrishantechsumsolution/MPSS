using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DAL;
using System.Data;

namespace CitizenPortal.WebApp.G2G.OISF.CenterAllocation
{
    public partial class frmCenterAllocatedReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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

                    Assign.Visible = false;
                    
                }

            }
            catch (Exception)
            {


            }
        }

        

        protected void btnSeacrh_Click(object sender, EventArgs e)
        {

            try
            {

                OISFDALReport obj = new OISFDALReport();


                DataSet ds = obj.GetOISFAppDetails("OP08", drpCenter.SelectedValue,drpday.SelectedValue, "", "", "", "", "", "", "", "");

                grdCenter.DataSource = ds.Tables[0];
                grdCenter.DataBind();
                Assign.Visible = true;
            }
            catch (Exception)
            {


            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtAssignDate.Text == "")
                {
                    throw new Exception("Please Assign Date");
                }
                OISFDALReport obj = new OISFDALReport();


                bool result = obj.UpdateOISFAppDetails("OP09", drpCenter.SelectedValue, drpday.SelectedValue,txtAssignDate.Text, "", "", "", "", "", "", "");
                if (result)
                {

                    DataSet ds = obj.GetOISFAppDetails("OP08", drpCenter.SelectedValue, drpday.SelectedValue, "", "", "", "", "", "", "", "");

                    grdCenter.DataSource = ds.Tables[0];
                    grdCenter.DataBind();
                    Assign.Visible = false;
                    txtAssignDate.Text = "";

                }
                else
                {

                }


            }
            catch (Exception)
            {

               
            }
        }
    }
}