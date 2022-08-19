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
    public partial class SpotAdmissionRank : System.Web.UI.Page
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_OUATBLL.OUATUGSpotRank(m_ServiceID, m_AppID);
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
                lblCategory.Text = dtApp.Rows[0]["Religion"].ToString();
                //ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                lblVenue.Text = dtApp.Rows[0]["CenterName"].ToString();
                
                lblDate.Text = dtApp.Rows[0]["AllocationTime"].ToString();
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();

                lblRankGen.Text = dtRank.Rows[0]["Rank_General"].ToString();
                lblProvisional.Text = dtRank.Rows[0]["TotalWeightage"].ToString();
                lblSpotRank.Text = dtCouncel.Rows[0]["SpotRank"].ToString();

                lblCourseName.Text = dtCouncel.Rows[0]["CourseFirstPreferance"].ToString();
                lblCourseName0.Text = dtCouncel.Rows[0]["CourseSecondPreferance"].ToString();
                lblCourseName1.Text = dtCouncel.Rows[0]["CourseThirdPreferance"].ToString();

                lblCollegeName.Text = dtCouncel.Rows[0]["CollegeFirstPreferance"].ToString();
                lblCollegeName0.Text = dtCouncel.Rows[0]["CollegeSecondPreferance"].ToString();
                lblCollegeName1.Text = dtCouncel.Rows[0]["CollegeThirdPreferance"].ToString();
                lblStatus.Text = dtCouncel.Rows[0]["paid_status"].ToString();

                if (dtCouncel.Rows[0]["paid_status"].ToString() == "UNPAID")
                {
                    lblStatusMsg.Text = "Payment towards SPOT ADMISSION Application Fee has not been received, your candidature for Spot Counselling & Admission will be considered only on production of valid payment details at the time of counselling.";
                }
                else
                {
                    lblStatusMsg.Text = "";
                }

                if (dtRank.Rows[0]["IsCommunityScience"].ToString() == "1")
                {
                    divPref.Visible = false;
                    lblCourseName.Text = "B.Sc.(Hons.) Community Science";
                    lblCollegeName.Text = "College of Community Science, Bhubaneswar";
                    
                }
                else
                {
                    divPref.Visible = true;
                }

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