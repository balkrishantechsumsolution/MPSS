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
using Exception = System.Exception;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class MPSSAttachmentShows : System.Web.UI.Page
    {

        string m_AppID, m_ServiceID, m_TypeID, m_ID;
        static data sqlhelper = new data();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {               
                if (Request.QueryString["ID"] == null) return;
                if (Request.QueryString["SvcID"] != null) { m_ServiceID = Request.QueryString["SvcID"].ToString(); }

                m_AppID = Request.QueryString["AppID"].ToString();
                m_TypeID = Request.QueryString["TypeID"].ToString();
                m_ID= Request.QueryString["ID"].ToString();

                DataTable dtApp = new DataTable();
                SqlParameter[] parameter = {
                 new SqlParameter("@AppID", m_AppID),
                 new SqlParameter("@ServiceID", m_ServiceID),
                 new SqlParameter("@ID", m_ID),
                  new SqlParameter("@TypeID", m_TypeID),
                };

                dtApp = sqlhelper.ExecuteDataTable("GetAttachmentMPSSSP", parameter);

                if(m_TypeID=="1")
                {
                    pnlSamagra.Visible= false;
                }
                else
                {
                    pnlSamagra.Visible = true;
                }


                if (dtApp.Rows.Count != 0)
                {  
                    

                        var valCheque = dtApp.Rows[0]["Cheque"].ToString();
                        var valPassbook = dtApp.Rows[0]["Passbook"].ToString();

                        imgCheque.Attributes.Add("src", valCheque);
                        imgCheque.DataBind();

                        imgPassbook.Attributes.Add("src", valPassbook);
                        imgPassbook.DataBind();

                        txtAadharNo.Text = dtApp.Rows[0]["Aadhar"].ToString();
                        txtFamilyID.Text = dtApp.Rows[0]["FamilySamagraID"].ToString();
                        SamagraNo.Text = dtApp.Rows[0]["SamagraID"].ToString();
                        txtAppID.Text = m_AppID;


                }
            }

            catch(Exception ex)
            {

            }
        }
    }

}
