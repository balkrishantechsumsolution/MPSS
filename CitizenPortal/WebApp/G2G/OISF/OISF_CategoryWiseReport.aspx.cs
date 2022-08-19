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
    public partial class OISF_CategoryWiseReport : System.Web.UI.Page
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