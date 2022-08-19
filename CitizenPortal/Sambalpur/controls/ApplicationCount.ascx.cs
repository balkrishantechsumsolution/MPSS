using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.Sambalpur.controls
{
    public partial class ApplicationCount : System.Web.UI.UserControl
    {
        string LoginID = "";
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            if (!IsPostBack)
            {
                GetApplicationCount(LoginID);
            }
        }

        private void GetApplicationCount(string m_LoginID)
        {
            DataSet t_DS = null;
            t_DS = m_G2GDashboardBLL.GetApplicationCount(m_LoginID);
            DataTable t_DT = t_DS.Tables[0];
            if (t_DT.Rows.Count > 0)
            {
                lblStudent.InnerHtml = t_DT.Rows[0]["Student"].ToString();
                lblTotal.InnerHtml = t_DT.Rows[0]["StudentCount"].ToString();
                lblSEM.InnerHtml = t_DT.Rows[0]["SEMFee"].ToString();
                lblSemCount.InnerHtml = t_DT.Rows[0]["SemFeeCount"].ToString();
                lblInternal.InnerHtml = t_DT.Rows[0]["Internal"].ToString();
                lblInternalCount.InnerHtml = t_DT.Rows[0]["InternalCount"].ToString();
                lblApplication.InnerHtml = t_DT.Rows[0]["Application"].ToString();
                lblApplicationCount.InnerHtml = t_DT.Rows[0]["Pending"].ToString();
            }
        }
    }
}