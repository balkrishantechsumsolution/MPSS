using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.G2G.OISF
{
    public partial class GroundDashboard : BasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsPostBack)
            //{
            //    BindDummyGridrow();
            //}

            string LoginID = "";
            int Department;
            string FromDate = "";
            string ToDate = "";
            string Status = "";
            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());
                   
            string category = "";
            string DistrictCode = "";




        }


    }
}