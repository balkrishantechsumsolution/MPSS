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
    public partial class frmCenterAllocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    OISFDALReport obj = new OISFDALReport();
                    DataSet ds = obj.GetOISFAppDetails("OP04", "", "", "", "", "", "", "", "", "", "");



                    grdCandidatesDtls.DataSource = ds.Tables[0];
                    grdCandidatesDtls.DataBind();

                    grdbeforeallocate.DataSource = ds.Tables[1];
                    grdbeforeallocate.DataBind();

                    after.Visible = false;
                    before.Visible = true;

                }
            }
            catch (Exception)
            {

                
            }
           
        }

        protected void btnAllocate_Click(object sender, EventArgs e)
        {
            try
            {
                OISFDALReport obj = new OISFDALReport();
                DataSet ds = obj.GetOISFAppDetails("OP05", "", "", "", "", "", "", "", "", "", "");
             

                drpday.DataSource = ds.Tables[0];

                drpday.DataTextField = "batchno";
                drpday.DataValueField = "batchno";
    
                drpday.DataBind();

                drpday.Items.Insert(0, "Select");
                drpday.SelectedValue = "Select";


                grdafterallocateCapacity.DataSource= ds.Tables[1];
                grdafterallocateCapacity.DataBind();
                after.Visible = true;
                before.Visible = false;


            }
            catch (Exception)
            {
                after.Visible = false;
                before.Visible = true;

            }
        }

        protected void drpCenter_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                OISFDALReport obj = new OISFDALReport();
                DataSet ds = obj.GetOISFAppDetails("OP05N", drpday.SelectedValue, "", "", "", "", "", "", "", "", "");
                grdafterallocate.DataSource = ds.Tables[0];
                grdafterallocate.DataBind();

                drpday.DataSource = ds.Tables[1];

                drpday.DataTextField = "batchno";
                drpday.DataValueField = "batchno";
                drpday.DataBind();

            }
            catch (Exception)
            {

                
            }
        }
    }
}