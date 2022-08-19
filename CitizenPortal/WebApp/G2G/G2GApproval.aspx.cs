using CitizenPortalLib;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G
{
    public partial class G2GApproval : AdminBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    BindDummyGridrow();
                }
            }
        }

        public void BindDummyGridrow()
        {
            DataTable dt = new DataTable();
            //dt.Columns.Add("Select");
            dt.Columns.Add("Sl. No.");
            dt.Columns.Add("Application ID");
            dt.Columns.Add("Application Date");
            dt.Columns.Add("Application Name");
            dt.Columns.Add("Service Name");
            dt.Columns.Add("Status");
            dt.Columns.Add("Delivery Date");
            dt.Columns.Add("Payment");
            dt.Columns.Add("Document");
            dt.Columns.Add("Certificate");
            dt.Columns.Add("Remark");
            dt.Columns.Add("Action");
            grdView.DataSource = dt;
            grdView.DataBind();
        }

    }
}