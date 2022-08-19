using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class DocumentUpload : System.Web.UI.Page
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
            dt.Columns.Add("Sl. No.");
            dt.Columns.Add("Service Name");
            dt.Columns.Add("Time limit");
            dt.Columns.Add("Designated Officer");
            dt.Columns.Add("First Appellate Officer");
            dt.Columns.Add("Second Transaction Amount");            
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }
}