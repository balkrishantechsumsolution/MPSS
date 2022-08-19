using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.Migration
{
    public partial class Migration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetApplicationDetails(string AppID)
        {
            string text;

            MigrationBLL t_MigrationBLL = new MigrationBLL();
            System.Data.DataSet dtAppList = t_MigrationBLL.GetCBAApplicationDetails(AppID);
            //dtAppList = t_CBCSAdmissionFormBLL.GetApplicationDetails(AppID);

            text = JsonConvert.SerializeObject(dtAppList, Newtonsoft.Json.Formatting.Indented);
            return text;
        }

    }
}