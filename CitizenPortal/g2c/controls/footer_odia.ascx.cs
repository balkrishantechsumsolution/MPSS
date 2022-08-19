using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.g2c.controls
{
    public partial class footer_odia : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TotalVisitor.Text = "Total Visitors " + Application["TotalUser"].ToString();
            TodayVisitor.Text = "Today Visitors " + Application["OnlineUser"].ToString();

        }
    }
}