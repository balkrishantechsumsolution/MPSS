using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Kiosk.PG
{
    public partial class PGHomePage : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string m_AppID, m_ServiceID;

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            //divPass.Visible = false;

            OUATBLL t_OUATBLL = new OUATBLL();
            DataTable dt = t_OUATBLL.VerifySUPGPayment(m_ServiceID, m_AppID);

            if (dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["ViewPGApp"].ToString() == "1")
                {
                    DivViewPGApp.Visible = true;
                }
                else
                    DivViewPGApp.Visible = false;

                if (dt.Rows[0]["PayCount"].ToString() == "0")
                {
                    DivPayment.Visible = true;
                }
                else
                    DivPayment.Visible = false;

                if (dt.Rows[0]["AdmitCount"].ToString() == "1")
                {
                    divPass.Visible = false;
                }
                else
                    divPass.Visible = true;

                if (dt.Rows[0]["DocCount"].ToString() == "1")
                {
                    DivDocument.Visible = false;
                }
                else
                {
                    DivDocument.Visible = true;
                }

                divIntimationLetter.Visible = false;

                if(dt.Rows[0]["IntimationLetter"].ToString() == "1")
                {
                    divIntimationLetter.Visible = true;
                    HFILetterPath.Value = dt.Rows[0]["IntimationLetterPath"].ToString();
                }

                //if (dt.Rows[0]["UGPGMarksEntry"].ToString() == "1")
                //{
                //    DivUGMarksEntry.Visible = true;
                //}
                //else
                //{
                //    DivUGMarksEntry.Visible = false;
                //}


                //if (dt.Rows[0]["RankCount"].ToString() == "1")
                //{
                //    divRankCard.Visible = true;
                //}
                //else
                //{
                //    divRankCard.Visible = false;
                //}
            }
        }
    }
}