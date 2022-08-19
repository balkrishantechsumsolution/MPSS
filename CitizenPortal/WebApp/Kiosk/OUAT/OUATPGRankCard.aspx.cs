using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.ServiceModel;
using System.Web.Services;
using CitizenPortalLib.ServiceInterface;


namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class OUATPGRankCard : System.Web.UI.Page
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        public interface IService1Channel : IAddressService, IClientChannel
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_OUATBLL.OUATGetPGRankCard(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtRank = dt.Tables[1];
            DataTable dtCouncel = dt.Tables[2];
            
            if (dtApp.Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAadhaarNo.Text = dtApp.Rows[0]["aadhaarNumber"].ToString();
                lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblAge.Text = dtApp.Rows[0]["Age"].ToString() + "years";
                lblCategory.Text = dtApp.Rows[0]["Category"].ToString();
                //ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                
                lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                lblVenue.Text = dtApp.Rows[0]["CenterName"].ToString();
                
               
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();
                // lblCenter.Text = dtApp.Rows[0]["centre"].ToString();
                lblStream.Text = dtApp.Rows[0]["stream"].ToString();
                lblSubject.Text = dtApp.Rows[0]["SubjectName"].ToString();

                if (dtRank.Rows.Count != 0)
                {

                    if (dtRank.Rows[0]["Rank_General"].ToString() != "" || dtRank.Rows[0]["Rank_General"].ToString() == null)
                        lblRank.Text = dtRank.Rows[0]["Rank_General"].ToString();
                    else
                        lblRank.Text = dtRank.Rows[0]["Rank_GCH"].ToString();

                    lblMarks.Text = dtRank.Rows[0]["Entrance Marks"].ToString();

                    lblRankGen.Text = dtRank.Rows[0]["Rank_General"].ToString();
                    lblRankST.Text = dtRank.Rows[0]["Rank_ST"].ToString();
                    lblRankSC.Text = dtRank.Rows[0]["Rank_SC"].ToString();
                    lblRankHoti.Text = dtRank.Rows[0]["Rank_Horticulture"].ToString();

                    if (dtRank.Rows[0]["Rank_GCH"].ToString() != "0")
                    {
                        lblRankGCH.Text = dtRank.Rows[0]["Rank_GCH"].ToString();
                        lblRankGen.Text = "-";
                        lblRank.Text = dtRank.Rows[0]["Rank_GCH"].ToString();
                    }
                    else
                    {
                        lblRankGCH.Text = dtRank.Rows[0]["Rank_GCH"].ToString();
                    }

                    lblRankPH.Text = dtRank.Rows[0]["Rank_PH"].ToString();

                    lblRankNRI.Text = dtRank.Rows[0]["Rank_NRI"].ToString();
                }
                else
                {
                    string m_Message = "Sorry! Rank Card for Application No. " + m_AppID + " not generated.";
                    lblMsg.Text = m_Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
                }

                try
                {
                    QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }
            }
            else
            {
                string m_Message = "Sorry! Rank Card for Reference No. " + m_AppID + " not generated.";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
            }
        }


        [WebMethod]
        public static string PrintPGAdmitLog(string prefix, string RollNo, string AppID)
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

                    text = proxy.PrintPGAdmitLog(RollNo, AppID);
                }
            }
            return text;
        }
    }
}