using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //D:\1\visual studio 2015\Projects\CitizenPortal\CitizenPortal\Areas\Portal\Views\Home\Index.cshtml
            //Response.Redirect("/Portal/Home/Index");
            Response.Redirect("/mpss/mpss/index.html");
            //Response.Redirect("~/WebApp/Kiosk/MPSS/MPSOSPage.aspx");
        }
    }
}