using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.NFBS
{
    public partial class NFBSForm : BasePage
    {
        string UID = "";
        ServicesBLL m_ServicesBLL = new ServicesBLL();
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
            UID = Request.QueryString["UID"];
            DataTable dt = m_ServicesBLL.binddetails(UID);
            HiddenNFBSAge.Value = dt.Rows[0]["dateOfBirth"].ToString();
            HiddenNFBSGender.Value = dt.Rows[0]["gender"].ToString();


            Session["CurrentCulture"] = culture;
            HFServiceID.Value = "102";
            ngServiceID.Value = "102";

            //CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            //test.sendsms("9650020439", "Hello test NFBS Form." + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

            if(Session["json"]!=null)
            {
                HFUIDData.Value = Session["json"].ToString();                
            }


        }
    }
}