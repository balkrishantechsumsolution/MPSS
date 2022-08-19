using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class SeniorCetizenCertificate : CitizenPortalLib.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string culture = "en-GB";
            //if (Session["CurrentCulture"].ToString() == "1")
            //{
            //    culture = "en-GB";
            //}
            //else if (Session["CurrentCulture"].ToString() == "2")
            //{
            //    culture = "hi-IN";
            //}
            culture = Session["CurrentCulture"].ToString();
        }
    }
}