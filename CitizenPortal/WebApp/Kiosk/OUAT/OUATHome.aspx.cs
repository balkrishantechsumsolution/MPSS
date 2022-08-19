using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class OUATHome : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string m_AppID, m_ServiceID;

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            divPass.Visible = false;

            OUATBLL t_OUATBLL = new OUATBLL();
            DataTable dt = t_OUATBLL.VerifyPayment(m_ServiceID, m_AppID);

            if (dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["PayCount"].ToString() == "1")
                {
                    divPayment.Visible = false;
                }

                if (dt.Rows[0]["EPassCount"].ToString() == "1")
                {
                    divAgro.Visible = true;
                }

                if (dt.Rows[0]["FormB"].ToString() != "0")
                {
                    divFormBold.Visible = false;
                    divFormBAck.Visible = true;
                    divSEBC.Visible = true;
                    HFFormBAppID.Value = dt.Rows[0]["FormBAppID"].ToString();
                }
                else
                {
                    divFormBAck.Visible = false;
                    divSEBC.Visible = false;
                }

                if (dt.Rows[0]["AllowMarkEdit"].ToString() != "0")
                {
                    divPCMPCB.Visible = true;
                }
                else
                {
                    divPCMPCB.Visible = false;
                }

                if (dt.Rows[0]["RankCnt"].ToString() != "0")
                {
                    divRank.Visible = true;
                }
                else
                {
                    divRank.Visible = false;
                }

                if (dt.Rows[0]["AgroProvCnt"].ToString() != "0")
                {
                    divAgroProv.Visible = true;
                    divPM.Visible = false;
                }
                else
                {
                    divAgroProv.Visible = false;
                    
                }

                if (dt.Rows[0]["ProvMark"].ToString() != "0")
                {
                    divAgroProv.Visible = false;
                    divPM.Visible = true;
                }
                else
                {
                    
                    divPM.Visible = false;
                }

                if (dt.Rows[0]["AgroFormB"].ToString() != "0")
                {
                    divAgroFormB.Visible = false;
                    divFormBAck.Visible = false;
                    
                }

                if (dt.Rows[0]["AckAgroFormB"].ToString() != "0")
                {
                    divAgroFormB.Visible = false;
                    divFormBAck.Visible = false;
                    divAckAgroFromB.Visible = true;
                }

                if (dt.Rows[0]["AckFormB"].ToString() != "0")
                {
                    divFormBAck.Visible = true;
                }
                else
                {
                    divFormBAck.Visible = false;
                }

                if (dt.Rows[0]["AgroRankCard"].ToString() != "0")
                {
                    divAgroRC.Visible = true;
                }
                else
                {
                    divAgroRC.Visible = false;
                }

                if (dt.Rows[0]["SpotAdmission"].ToString() != "0")
                {
                    divSpot.Visible = true;
                }
                else
                {
                    divSpot.Visible = false;
                }

                divOUATRefund.Visible = false;
                if (dt.Rows[0]["OUATRefund"].ToString() != "0")
                {
                    divOUATRefund.Visible = true;
                }

                if (dt.Rows[0]["SpotRank"].ToString() != "0")
                {
                    divSpot.Visible = true;
                }
                else
                {
                    divSpot.Visible = false;
                }

            }


            /*if(m_ServiceID == "405")
            {
                divFormBAck.Visible = true;
                divAgroFromB.Visible = false;
            }
            else if(m_ServiceID == "409")
            {
                divFormBAck.Visible = false;
                divAgroFromB.Visible = true;
            }*/

            DataTable dt1 = t_OUATBLL.UploadCertificate(m_ServiceID, m_AppID);

            if (dt1 != null && dt1.Rows.Count > 0)
            {
                if (dt1.Rows[0]["DocumentCount"].ToString() == "0")
                {
                    divDomicile.Visible = false;
                }

                if (dt1.Rows[0]["DocumentCount"].ToString() == "1")
                {
                    divDomicile.Visible = true;
                }

            }
        }
    }
}