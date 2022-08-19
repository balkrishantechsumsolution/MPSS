using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;


namespace CitizenPortal.WebApp.Kiosk.PG
{
    public partial class UGAndPGMarksEntry : System.Web.UI.Page
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        public interface IService1Channel : IAddressService, IClientChannel
        { }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetStudentData(string AppID,string ServiceId)
        {
            string URL = "";
            URL = m_ServiceURL;

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {           
                    text = proxy.GetData(AppID,ServiceId);
                }
            }
            return text;
        }
    }
}