using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.Sambalpur.controls
{
    public partial class GridDrillDown : System.Web.UI.UserControl
    {

        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
    }
}