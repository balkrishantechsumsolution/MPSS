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
    public partial class DocketMPSOS : System.Web.UI.Page
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

                dtApp = sqlhelper.ExecuteDataTable("[GetDocketMPSOSSP]", parameter);


                if (dtApp.Rows.Count != 0)
                {
                    ItemsList.DataSource = dtApp;
                    ViewState["Data"] = dtApp;
                    ItemsList.DataBind();
                }
            }

            catch
            {

            }
        }
        protected void ItemsList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
             DataTable dtApp = new DataTable();
                dtApp = (DataTable)ViewState["Data"];
             
            if (e.Item.ItemType == ListItemType.Header)
            {
               

                Label txtCentreName = (Label)e.Item.FindControl("txtCentreName");
                txtCentreName.Text = dtApp.Rows[0]["EXAMCENTERNAME"].ToString();

               

                m_ID = Request.QueryString["ID"].ToString();
               
                Label TXTCentre_Code = (Label)e.Item.FindControl("TXTCentre_Code");
                TXTCentre_Code.Text = m_ID;

             
                Label LBLCLASS = (Label)e.Item.FindControl("LBLCLASS");
                LBLCLASS.Text = dtApp.Rows[0]["CLASS"].ToString();

            }
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.ItemIndex <= 1)
                {                 
                }
            }
        }
    }


}
