using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Control
{
    public partial class DesignatedOfficer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDummyGridrow();
            }
        }

        public void BindDummyGridrow()
        {
            DataTable dt = new DataTable();
            //dt.Columns.Add("Select");
            dt.Columns.Add("Service Name");
            dt.Columns.Add("Time Limit");
            dt.Columns.Add("Designated Officer");
            dt.Columns.Add("Appellate Authority");
            dt.Columns.Add("Revisional Authority");

            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }
}