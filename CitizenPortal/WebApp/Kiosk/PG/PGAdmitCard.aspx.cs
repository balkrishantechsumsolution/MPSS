using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.ServiceModel;
using System.Web.Services;
using CitizenPortalLib.ServiceInterface;


namespace CitizenPortal.WebApp.Kiosk.PG
{
    public partial class PGAdmitCard : System.Web.UI.Page
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

            DataSet dt = m_OUATBLL.OUATGetPGAdmitCard(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            //DataTable dtTransDetail = dt.Tables[1];
            if (dtApp.Rows.Count != 0)
            {
                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAppDate.Text = Convert.ToDateTime(dtApp.Rows[0]["CreatedOn"]).ToString("dd/MM/yyyy HH:mm:ss");
                lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                
                lblCategory.Text = dtApp.Rows[0]["Religion"].ToString() + " (" + dtApp.Rows[0]["Category"].ToString() + ") ";
                //ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                lblVenue.Text = dtApp.Rows[0]["CenterName"].ToString();
                lblDate.Text = dtApp.Rows[0]["AllocationTime"].ToString();
                //lblDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AllocationTime"]).ToString("dd/MM/yyyy");
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();
                lblProgram.Text = dtApp.Rows[0]["Program"].ToString();
                lblDepartment.Text = dtApp.Rows[0]["DepartmentName"].ToString();
                lblTime.Text = dtApp.Rows[0]["ReportingTime"].ToString();
                lblInstruction.Text = dtApp.Rows[0]["Instruction"].ToString();

                divExam.Visible = true;
                divInst.Visible = true;

                if (dtApp.Rows[0]["Instruction"].ToString() != "")
                {
                    divExam.Visible = false;
                    divInst.Visible = false;
                }

                
                try
                {
                    QRCode.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }
            }
            else
            {
                string m_Message = "Sorry! Admit Card for Reference No. " + m_AppID + " not generate.";
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