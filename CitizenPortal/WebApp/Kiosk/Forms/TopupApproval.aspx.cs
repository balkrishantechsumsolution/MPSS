using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class TopupApproval : System.Web.UI.Page
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
            dt.Columns.Add("Kisok ID");
            dt.Columns.Add("Kisok Name");
            dt.Columns.Add("Transaction ID");
            dt.Columns.Add("Transaction Type");
            dt.Columns.Add("Transaction Date");
            dt.Columns.Add("Transaction Amount");
            dt.Columns.Add("Receipt");
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }
}