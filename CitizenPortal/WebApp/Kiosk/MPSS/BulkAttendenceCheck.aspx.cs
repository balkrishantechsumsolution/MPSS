using CitizenPortal.WebApp.Common.QRCode;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using java.lang;
using javax.security.auth;
using Org.BouncyCastle.Asn1.IsisMtt.X509;
using SqlHelper;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class BulkAttendenceCheck : System.Web.UI.Page
    {
        string m_ID, m_Class;
        static data sqlhelper = new data();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["ID"] == null) return;


                m_ID = Request.QueryString["ID"].ToString();
                m_Class = Request.QueryString["Class"].ToString();


                DataTable dtApp = new DataTable();
                SqlParameter[] parameter = {
                 new SqlParameter("@Centre_Code", m_ID),
                  new SqlParameter("@Class", m_Class)
                 };

                dtApp = sqlhelper.ExecuteDataTable("[GetBulkAttendenceCheckSP]", parameter);


                if (dtApp.Rows.Count != 0)
                {
                    RepterDetails.DataSource = dtApp;
                    RepterDetails.DataBind();
                }
            }

            catch
            {

            }
        }
    }


}
