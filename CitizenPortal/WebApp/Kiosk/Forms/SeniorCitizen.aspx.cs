using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class SeniorCitizen : CitizenPortalLib.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string culture = "en-GB";

            if (((HiddenField)Page.Master.FindControl("HFLang")).Value != "")
            {
                if (((HiddenField)Page.Master.FindControl("HFLang")).Value == "1")
                {
                    culture = "en-GB";
                }
                else if (((HiddenField)Page.Master.FindControl("HFLang")).Value == "2")
                {
                    culture = "hi-IN";
                }
            }

            Session["CurrentCulture"] = culture;
            HFServiceID.Value = "101";
            ngServiceID.Value = "101";

            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            test.sendsms("9650020439", "Hello test Senior Citizen. " + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

        }
    }
}