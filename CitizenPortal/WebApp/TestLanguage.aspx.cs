using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp
{
    public partial class TestLanguage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CultureInfo cultureInfo = null;
            ////cultureInfo = new CultureInfo("en-GB");
            //cultureInfo = new CultureInfo("de-DE");

            //cultureInfo.DateTimeFormat.ShortDatePattern = "dd/MM/yyyy";
            //cultureInfo.DateTimeFormat.DateSeparator = "/";
            //cultureInfo.DateTimeFormat.ShortTimePattern = "";
            //cultureInfo.DateTimeFormat.LongTimePattern = "";
            //Thread.CurrentThread.CurrentCulture = cultureInfo;
            //Thread.CurrentThread.CurrentUICulture = cultureInfo;

            string culture = "en-GB";
            if(Request.QueryString["culture"] != null && Request.QueryString["culture"].ToString() != "")
            {
                culture = Request.QueryString["culture"].ToString();
            }

            //Session["CultureInfo"] = "de-DE";
            //Session["CultureInfo"] = "en-GB";
            Session["CultureInfo"] = culture;
        }
    }
}