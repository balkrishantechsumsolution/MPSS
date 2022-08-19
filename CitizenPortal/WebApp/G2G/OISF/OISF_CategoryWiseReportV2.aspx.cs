using CitizenPortalLib.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.OISF
{
    public partial class OISF_CategoryWiseReportV2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    OISFDALReport obj = new OISFDALReport();
                    DataSet ds = obj.GetOISFAppDetails("OP03", "ALL", "", "", "", "", "", "", "", "", "");
                    grdCategoy.DataSource = ds.Tables[0];
                    grdCategoy.DataBind();
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
                DataSet ds = obj.GetOISFAppDetails("OP03", drpCategoy.SelectedValue, "", "", "", "", "", "", "", "", "");
                grdCategoy.DataSource = ds.Tables[0];
                grdCategoy.DataBind();
            }
            catch (Exception ex)
            {


            }
        }


    }
}