using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DAL;
using System.Data;

namespace CitizenPortal.WebApp.G2G.OISF
{
    public partial class OISF_DistrictWiseReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    OISFDALReport obj = new OISFDALReport();

                   
                    DataSet ds = obj.GetOISFAppDetails("OP02", "0", "", "", "", "", "", "", "", "", "");

                    grdDistrict.DataSource = ds.Tables[0];
                    grdDistrict.DataBind();

                    drpDistrict.DataSource= ds.Tables[1];
                    drpDistrict.DataTextField = "DistrictName";
                    drpDistrict.DataValueField = "DistrictCode";
                    drpDistrict.DataBind();
                    drpDistrict.SelectedItem.Text = "ALL";
                }
            }
            catch (Exception ex)
            {


            }
        }

        protected void drpDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                OISFDALReport obj = new OISFDALReport();


                DataSet ds = obj.GetOISFAppDetails("OP02", drpDistrict.SelectedValue, "", "", "", "", "", "", "", "", "");

                grdDistrict.DataSource = ds.Tables[0];
                grdDistrict.DataBind();
            }
            catch (Exception ex)
            {

               
            }
        }
    }
}