using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class Services : CitizenPortalLib.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //HFServiceID.Value = "104";
            if (!IsPostBack)
            {
                if (Request.QueryString != null)
                {
                    HFUID.Value = Request.QueryString["UID"].ToString();
                    Session["UID"] = HFUID.Value;
                }

            }
            else {
                var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
                nameValues.Set("UID", Session["UID"].ToString());
                string url = Request.Url.AbsolutePath;
                Response.Redirect(url + "?" + nameValues);
            }
         
        }
    }
}