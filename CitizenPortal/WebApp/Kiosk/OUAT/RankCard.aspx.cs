using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel;
using System.Web.Services;
using CitizenPortalLib.ServiceInterface;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class RankCard : System.Web.UI.Page
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_OUATBLL.OUATUGRankCard(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtRank = dt.Tables[1];
            DataTable dtCouncel = dt.Tables[2];

            if (dtApp.Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblAge.Text = dtApp.Rows[0]["Age"].ToString() + " years";
                lblCategory.Text = dtApp.Rows[0]["Religion"].ToString() + " (" + dtApp.Rows[0]["Category"].ToString() + ") ";
                //ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                lblVenue.Text = dtApp.Rows[0]["CenterName"].ToString();
                
                lblDate.Text = dtApp.Rows[0]["AllocationTime"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();

                lblRankGen.Text = dtRank.Rows[0]["Rank_General"].ToString();
                lblRankST.Text = dtRank.Rows[0]["Rank_ST"].ToString();
                lblRankSC.Text = dtRank.Rows[0]["Rank_SC"].ToString();
                lblRankGCH.Text = dtRank.Rows[0]["Rank_GCH"].ToString();
                lblRankPH.Text = dtRank.Rows[0]["Rank_PH"].ToString();
                lblRankWOSC.Text = dtRank.Rows[0]["Rank_WO_SC"].ToString();
                lblRankWOST.Text = dtRank.Rows[0]["Rank_WO_ST"].ToString();
                lblRankWOGCH.Text = dtRank.Rows[0]["Rank_WO_GCH"].ToString();
                lblRankWOGen.Text = dtRank.Rows[0]["Rank_WO"].ToString();
                lblRankOE.Text = dtRank.Rows[0]["Rank_OE"].ToString();
                lblRankNRI.Text = dtRank.Rows[0]["Rank_NRI"].ToString();

                if(dtCouncel.Rows[0]["Date_General"].ToString()!= "0") { 
                lblDateGen.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_General"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_ST"].ToString() != "0")
                {
                    lblDateST.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_ST"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_SC"].ToString() != "0")
                {
                    lblDateSC.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_SC"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_GCH"].ToString() != "0")
                { lblDateGCH.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_GCH"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_PH"].ToString() != "0")
                { lblDatePH.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_PH"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_WO_SC"].ToString() != "0")
                { lblDateWOSC.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_WO_SC"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_WO_ST"].ToString() != "0")
                { lblDateWOST.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_WO_ST"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_WO_GCH"].ToString() != "0")
                { lblDateWOGCH.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_WO_GCH"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_WO"].ToString() != "0")
                { lblDateWO.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_WO"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_OE"].ToString() != "0")
                { lblDateOE.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_OE"]).ToString("dd/MM/yyyy");
                }
                if (dtCouncel.Rows[0]["Date_NRI"].ToString() != "0")
                {
                    lblDateNRI.Text = Convert.ToDateTime(dtCouncel.Rows[0]["Date_NRI"]).ToString("dd/MM/yyyy");
                }

                lblTimeGen.Text = dtCouncel.Rows[0]["Time_General"].ToString();
                lblTimeST.Text = dtCouncel.Rows[0]["Time_ST"].ToString();
                lblTimeSC.Text = dtCouncel.Rows[0]["Time_SC"].ToString();
                lblTimeGCH.Text = dtCouncel.Rows[0]["Time_GCH"].ToString();
                lblTimePH.Text = dtCouncel.Rows[0]["Time_PH"].ToString();
                lblTimeWOSC.Text = dtCouncel.Rows[0]["Time_WO_SC"].ToString();
                lblTimeWOST.Text = dtCouncel.Rows[0]["Time_WO_ST"].ToString();
                lblTimeWOGCH.Text = dtCouncel.Rows[0]["Time_WO_GCH"].ToString();
                lblTimeWOGen.Text = dtCouncel.Rows[0]["Time_WO"].ToString();
                lblTimeOE.Text = dtCouncel.Rows[0]["Time_OE"].ToString();
                lblTimeNRI.Text = dtCouncel.Rows[0]["Time_NRI"].ToString();

                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }
            }
            else
            {
                string m_Message = @"Sorry! Your are not in merit list.";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
            }
        }


        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        public interface IService1Channel : IAddressService, IClientChannel
        { }
        [WebMethod]
        public static string PrintAdmitLog(string prefix, string RollNo, string AppID)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    //List<Tuple<string, string>> nvc = GetSessionValues();

                    //MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    //System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.PrintAdmitLog(RollNo, AppID);

                }
            }

            return text;

        }
    }
}