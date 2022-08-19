using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CitizenPortal.UID.VerifyUID;

namespace CitizenPortal.WebApp.Control
{
    public partial class ServiceInformation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

    }
}