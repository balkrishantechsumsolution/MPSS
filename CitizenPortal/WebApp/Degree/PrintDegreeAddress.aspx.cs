using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Degree
{
    public partial class PrintDegreeAddress : System.Web.UI.Page
    {
        MigrationBLL m_MigrationBLLL = new MigrationBLL();
        DuplicateDiplomaBLL m_DuplicateDiplomaBLL = new DuplicateDiplomaBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["RegNo"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet ds = m_MigrationBLLL.DegreeAddress(m_ServiceID, m_AppID, RegNo);
            DataTable dt = ds.Tables[0];

            if (dt.Rows.Count != 0)
            {
                lblToAddress.Text = dt.Rows[0]["ToAddress"].ToString();
                lblFromAddress.Text = dt.Rows[0]["FromAddress"].ToString();

            }

        }
        
    }
}