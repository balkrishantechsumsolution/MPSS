using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Common
{
    public partial class ChangePhoto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Imagename"]) != string.Empty)
            {
                Userpic.Src = "http://localhost:53056/Uploads/" + Session["Imagename"].ToString();
            }
            else
            {
                Userpic.Src = "../../Uploads/person.jpg";
            }
        }
    }
}