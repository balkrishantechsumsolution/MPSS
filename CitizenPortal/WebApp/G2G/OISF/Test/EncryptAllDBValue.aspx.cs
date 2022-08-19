using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.DAL;
using System.Data;

namespace CitizenPortal.WebApp.G2G.OISF.Test
{
    public partial class EncryptAllDBValue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnAllData_Click(object sender, EventArgs e)
        {
            try
            {
                OISFDALReport obj = new OISFDALReport();


                DataSet ds = obj.GetOISFAppDetails("OPS", "", "", "", "", "", "", "", "", "", "");
                if (ds.Tables[0].Rows.Count>0)
                {
                    grdUser.DataSource = ds.Tables[0];
                    grdUser.DataBind();
                }

                }
            catch (Exception)
            {

            }

        }

        protected void btnEncrypt_Click(object sender, EventArgs e)
        {
            try
            {

                OISFDALReport obj = new OISFDALReport();

                DataSet ds = obj.GetOISFAppDetails("OPS", "", "", "", "", "", "", "", "", "", "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        bool result = obj.UpdateOISFAppDetails("OPE", dr["USERID"].ToString(),Encryption.Encrypt( dr["PASSWORD"].ToString()), "", "", "", "", "", "", "", "");
                        if (result)
                        {


                        }
                        else
                        {
                        }
                    }
                }
            }




            catch (Exception)
            {


            }
        }
    }
}