using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.CSVTU
{
    public partial class UTDEnrollment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1469");
        }
    }
}