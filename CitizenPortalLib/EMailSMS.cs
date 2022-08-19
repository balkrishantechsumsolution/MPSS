using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.SMSServiceReference;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Xml;

namespace CitizenPortalLib
{
    public class EMailSMS
    {
        public static string REQUEST_URL = "http://api.myvaluefirst.com/psms/servlet/psms.Eservice2?";
        //public static string SMS_API_USERNAME = "mponlinexml";
        //public static string SMS_API_PASSWORD = "mp123456";
        //public static string SMS_API_SENDERID = "MPONLI";
        public static string SMS_API_USERNAME = "g2cxml";
        public static string SMS_API_PASSWORD = "smju1436";
        public static string SMS_API_SENDERID = "G2CONL";

        public string SQLInjectionLocal(string str)
        {
            //string tempStr =TrimValue(str);

            //if (tempStr != null) { return tempStr.Replace("'", "''"); }
            //else { return tempStr; }

            string tempStr = str.Replace("--", "");

            if (tempStr != null) { return tempStr.Replace("'", "").Replace("/*", ""); }
            else { return tempStr; }
        }


        public string sendsms222(string mobileno, string message)
        {
            try
            {
                string SMSData = "<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>";
                //SMSData += "<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1/sms/dtd/message.dtd\" >";
                SMSData += "<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1:80/psms/dtd/messagev12.dtd\">";
                SMSData += "<MESSAGE VER=\"1.2\">";
                SMSData += "<USER USERNAME=\"demoXXXX\" PASSWORD=\"ifsYYYY\"/>";
                SMSData += "<SMS UDH=\"0\" CODING=\"1\" TEXT=\"First SMS from LMS System\" PROPERTY=\"0\" ID=\"1\">";
                SMSData += "<ADDRESS FROM=\"123456789\" TO=\"919650020439\" SEQ=\"1\" TAG=\"\" /> ";
                // SMSData += "<ADDRESS FROM=\"9812345678\" TO=\"919820487887\" SEQ=\"2\" /> ";
                SMSData += "</SMS>";
                SMSData += "</MESSAGE>";

                string str_url = HttpUtility.UrlEncode(SMSData, Encoding.UTF8);
                string url = "http://api.myvaluefirst.com/psms/servlet/psms.Eservice2?data=" + str_url.Trim() + "&action=send";


                WebRequest request = WebRequest.Create(url);
                //request.Credentials = CredentialCache.DefaultCredentials;
                NetworkCredential objnetworkcred = new NetworkCredential(SMS_API_USERNAME, SMS_API_PASSWORD, SMS_API_SENDERID);
                request.Credentials = objnetworkcred;
                HttpWebResponse response1 = (HttpWebResponse)request.GetResponse();
                Stream dataStream = response1.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                string responseFromServer = reader.ReadToEnd();
                // TextBox1.Text = responseFromServer;
                reader.Close();
                dataStream.Close();
                response1.Close();
                return responseFromServer;
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }
        public interface IService1Channel : SMSServiceReference.IPushService, System.ServiceModel.IClientChannel
        { }

        static string SendSMSTo(SMS smsDetails, string TemplateId)
        {
            bool result = false;

            string URL;
            string MobileNo = "";
            string Message = "";
            string xml = "";

            string requeststring, postData, retResponse;

            requeststring = postData = retResponse = "";

            MobileNo = smsDetails.MobileNos;
            Message = smsDetails.Message;

            var user = "Aajivika";
            var password = "Aajivika@123";
            var senderid = "CSVTUB";
            var channel = "Trans";
            var DCS = 0;
            var flashsms = 0;
            var route = "1";

            try
            {

                URL = "https://api.equence.in/pushsms?" +
                   "username=tecsm_ddrp&password=zyDT-19_" +
                   "&peId=1201162261478998529" +
                   "&tmplId=" + TemplateId +
                   "&to=91" + MobileNo +
                   "&from=CSVTUD" +
                   "&charset=auto" +
                   "&text=" + Message;

                requeststring = URL;

                //System.Net.ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;

                //ServicePointManager.ServerCertificateValidationCallback =
                //    delegate (object s, X509Certificate certificate,
                //    X509Chain chain, SslPolicyErrors sslPolicyErrors)
                //    { return true; };

                HttpWebRequest request = WebRequest.Create(URL) as HttpWebRequest;
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        StreamReader requestStream = new StreamReader(response.GetResponseStream());
                        xml = requestStream.ReadToEnd();
                    }
                }

                retResponse = xml;

                string ProfileID = smsDetails.ProfileID == null ? "" : smsDetails.ProfileID;
                string ServiceID = smsDetails.ServiceIDNew == null ? "" : smsDetails.ServiceIDNew;
                string ApplicationID = smsDetails.ApplicationIDNew == null ? "" : smsDetails.ApplicationIDNew;
                string msg = smsDetails.Message.Replace("'","");
                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    smsDetails.MobileNos + "', '" + msg + "', '" + requeststring.Replace("'", "") + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + ApplicationID + "')";

                DMLCommand(t_SQLQuery);

                result = true;

            }
            catch (WebException ex)
            {
                string pageContent = new StreamReader(ex.Response.GetResponseStream()).ReadToEnd().ToString();
                result = false;
            }

            return result.ToString();
        }
        static string SendSMSTo(SMS smsDetails)
        {
            bool result = false;

            string URL;
            string MobileNo = "";
            string Message = "";
            string xml = "";

            string requeststring, postData, retResponse;

            requeststring = postData = retResponse = "";

            MobileNo = smsDetails.MobileNos;
            Message = smsDetails.Message;

            var user = "Aajivika";
            var password = "Aajivika@123";
            var senderid = "CSVTUB";
            var channel = "Trans";
            var DCS = 0;
            var flashsms = 0;
            var route = "1";

            try
            {

                URL = "http://sms.technoitsolution.co.in/api/mt/SendSMS?" +
  "user=" + user
+ "&password=" + password
+ "&senderid=" + senderid
+ "&channel=" + channel
+ "&DCS=" + DCS
+ "&flashsms=" + flashsms
+ "&number=91" + MobileNo
+ "&text=" + Message
+ "&route=" + route;
                requeststring = URL;

                //System.Net.ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;

                //ServicePointManager.ServerCertificateValidationCallback =
                //    delegate (object s, X509Certificate certificate,
                //    X509Chain chain, SslPolicyErrors sslPolicyErrors)
                //    { return true; };

                HttpWebRequest request = WebRequest.Create(URL) as HttpWebRequest;
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        StreamReader requestStream = new StreamReader(response.GetResponseStream());
                        xml = requestStream.ReadToEnd();
                    }
                }

                retResponse = xml;

                string ProfileID = smsDetails.ProfileID == null ? "" : smsDetails.ProfileID;
                string ServiceID = smsDetails.ServiceIDNew == null ? "" : smsDetails.ServiceIDNew;
                string ApplicationID = smsDetails.ApplicationIDNew == null ? "" : smsDetails.ApplicationIDNew;

                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    smsDetails.MobileNos + "', '" + smsDetails.Message + "', '" + requeststring + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + ApplicationID + "')";

                DMLCommand(t_SQLQuery);

                result = true;

            }
            catch (WebException ex)
            {
                string pageContent = new StreamReader(ex.Response.GetResponseStream()).ReadToEnd().ToString();
                result = false;
            }

            return result.ToString();
        }
        public string sendsms(string MobileNo, string Message)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetDistrict("", StateCode);
            //return text;
            string URL = "";

            //if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
            //    URL = "http://localhost:52349/AddressService.svc";
            //else
            //    URL = "http://citizenportalservice.azurewebsites.net/AddressService.svc";

            //URL = "http://5.79.69.78:8081/PushService.svc";
            URL = System.Configuration.ConfigurationManager.AppSettings["SMSService"].ToString();


            //SMSServiceReference.SMS objSMS = new SMSServiceReference.SMS();
            //objSMS.MobileNos = MobileNo;
            //objSMS.Message = Message;

            //SMSServiceReference.SMS objSMS = new SMSServiceReference.SMS();
            //objSMS.MobileNos = MobileNo;
            //objSMS.Message = Message;

            string text;

            SMSServiceReference.SMS objSMS = new SMSServiceReference.SMS();
            objSMS.MobileNos = MobileNo;
            objSMS.Message = Message;
            text = SendSMSTo(objSMS);

            ////using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new WSHttpBinding(SecurityMode.None, false)))
            //using (System.ServiceModel.ChannelFactory<IService1Channel> factory = new System.ServiceModel.ChannelFactory<IService1Channel>(new System.ServiceModel.BasicHttpBinding()))
            //{
            //    IService1Channel proxy = factory.CreateChannel(new System.ServiceModel.EndpointAddress(URL));
            //    using (System.ServiceModel.OperationContextScope scope = new System.ServiceModel.OperationContextScope(proxy))
            //    {
            //        text = proxy.SendSMSTo(objSMS);

            //    }
            //}

            //text = SendSMSTo(objSMS);

            return text;
        }

        public string sendsms(string MobileNo, string Message, string TemplateId)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetDistrict("", StateCode);
            //return text;
            string URL = "";

            //if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
            //    URL = "http://localhost:52349/AddressService.svc";
            //else
            //    URL = "http://citizenportalservice.azurewebsites.net/AddressService.svc";

            //URL = "http://5.79.69.78:8081/PushService.svc";
            URL = System.Configuration.ConfigurationManager.AppSettings["SMSService"].ToString();


            //SMSServiceReference.SMS objSMS = new SMSServiceReference.SMS();
            //objSMS.MobileNos = MobileNo;
            //objSMS.Message = Message;

            //SMSServiceReference.SMS objSMS = new SMSServiceReference.SMS();
            //objSMS.MobileNos = MobileNo;
            //objSMS.Message = Message;

            string text;

            SMSServiceReference.SMS objSMS = new SMSServiceReference.SMS();
            objSMS.MobileNos = MobileNo;
            objSMS.Message = Message;
            text = SendSMSTo(objSMS, TemplateId);

            ////using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new WSHttpBinding(SecurityMode.None, false)))
            //using (System.ServiceModel.ChannelFactory<IService1Channel> factory = new System.ServiceModel.ChannelFactory<IService1Channel>(new System.ServiceModel.BasicHttpBinding()))
            //{
            //    IService1Channel proxy = factory.CreateChannel(new System.ServiceModel.EndpointAddress(URL));
            //    using (System.ServiceModel.OperationContextScope scope = new System.ServiceModel.OperationContextScope(proxy))
            //    {
            //        text = proxy.SendSMSTo(objSMS);

            //    }
            //}

            //text = SendSMSTo(objSMS);

            return text;
        }
        public string sendsms(string MobileNo, string Message, string ServiceID, string ApplicationID, string ProfileID)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetDistrict("", StateCode);
            //return text;
            string URL = "";

            //if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
            //    URL = "http://localhost:52349/AddressService.svc";
            //else
            //    URL = "http://citizenportalservice.azurewebsites.net/AddressService.svc";

            //URL = "http://5.79.69.78:8081/PushService.svc";
            URL = System.Configuration.ConfigurationManager.AppSettings["SMSService"].ToString();

            SMSServiceReference.SMS objSMS = new SMSServiceReference.SMS();
            objSMS.MobileNos = MobileNo;
            objSMS.Message = Message;
            objSMS.ServiceIDNew = ServiceID;
            objSMS.ApplicationIDNew = ApplicationID;
            objSMS.ProfileID = ProfileID;

            string text;
            ////using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new WSHttpBinding(SecurityMode.None, false)))
            //using (System.ServiceModel.ChannelFactory<IService1Channel> factory = new System.ServiceModel.ChannelFactory<IService1Channel>(new System.ServiceModel.BasicHttpBinding()))
            //{
            //    IService1Channel proxy = factory.CreateChannel(new System.ServiceModel.EndpointAddress(URL));
            //    using (System.ServiceModel.OperationContextScope scope = new System.ServiceModel.OperationContextScope(proxy))
            //    {
            //        text = proxy.SendSMSTo(objSMS);

            //    }
            //}

            text = SendSMSTo(objSMS);

            return text;
        }

        public string sendsms_working(string MobileNo, string Message)
        {
            bool strResult = false;
            try
            {
                string retResponse = null;

                StringBuilder sbsmsreq = new StringBuilder();
                sbsmsreq.Append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
                sbsmsreq.Append("<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1:80/psms/dtd/messagev12.dtd\">");
                sbsmsreq.Append("<MESSAGE VER=\"1.2\">");
                sbsmsreq.Append("<USER USERNAME=\"g2cxml\" PASSWORD=\"smju1436\"/>");
                sbsmsreq.Append("<SMS UDH=\"0\" CODING=\"1\" TEXT=\"" + Message + "\" PROPERTY=\"0\" ID=\"1\">");
                sbsmsreq.Append("<ADDRESS FROM=\"CSCSPV\" TO=\"" + MobileNo + "\" SEQ=\"1\" TAG=\"SMS from Windows Communication Foundation\"/>");
                sbsmsreq.Append("</SMS>");
                sbsmsreq.Append("</MESSAGE>");

                string requeststring = sbsmsreq.ToString();
                string url = "http://api.myvaluefirst.com/psms/servlet/psms.Eservice2?";

                string postData = "data=" + System.Web.HttpUtility.UrlEncode(requeststring) + "&action=send";


                var data = Encoding.ASCII.GetBytes(postData);
                var request = (HttpWebRequest)WebRequest.Create(url);

                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;
                request.Method = WebRequestMethods.Http.Post;

                using (var stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                var response = (HttpWebResponse)request.GetResponse();
                retResponse = new StreamReader(response.GetResponseStream()).ReadToEnd();

                XmlDocument xDoc = new XmlDocument();
                xDoc.LoadXml(retResponse);

                string error = "";
                string guid = null;
                string submitdate = null;
                string id = null;

                if (xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE") != null)
                {
                    error = xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE").InnerText.ToString();
                }

                guid = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@GUID").InnerText.ToString();
                submitdate = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@SUBMITDATE").InnerText.ToString();
                id = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@ID").InnerText.ToString();

                xDoc = null;
                request = null;

                SMS_DT t_SMSDT = new SMS_DT();
                SMSBLL t_SMSBLL = new SMSBLL();

                t_SMSDT.MobileNo = MobileNo;
                t_SMSDT.SMSText = Message;
                t_SMSDT.SMSRequestXML = requeststring;
                t_SMSDT.SMSPostData = postData;
                t_SMSDT.SMSResponseXML = retResponse;
                t_SMSDT.CreatedBy = "";
                t_SMSDT.ClientIP = "";

                t_SMSBLL.Insert(t_SMSDT, new string[] { "MobileNo", "SMSText", "SMSRequestXML", "SMSPostData", "SMSResponseXML", "CreatedBy", "ClientIP" });


                return strResult.ToString();

            }

            catch (Exception ex)
            {
                return strResult.ToString();
            }
        }
        public string sendsms_gs(string MobileNo, string Message)
        {

            try
            {
                MobileNo = "91" + MobileNo;

                string retResponse = null;
                string SMSData = "<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>";

                StringBuilder sbsmsreq = new StringBuilder();
                sbsmsreq.Append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
                sbsmsreq.Append("<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1:80/psms/dtd/messagev12.dtd\">");
                sbsmsreq.Append("<MESSAGE VER=\"1.2\">");
                sbsmsreq.Append("<USER USERNAME=\"" + SMS_API_USERNAME + "\" PASSWORD=\"" + SMS_API_PASSWORD + "\"/>");
                sbsmsreq.Append("<SMS UDH=\"0\" CODING=\"1\" TEXT=\"" + Message + "\" PROPERTY=\"0\" ID=\"1\">");
                sbsmsreq.Append("<ADDRESS FROM=\"" + SMS_API_SENDERID + "\" TO=\"" + MobileNo + "\" SEQ=\"1\" TAG=\"SMS from Windows Communication Foundation\"/>");
                sbsmsreq.Append("</SMS>");
                sbsmsreq.Append("</MESSAGE>");

                string requeststring = sbsmsreq.ToString();
                string url = "http://api.myvaluefirst.com/psms/servlet/psms.Eservice2?";

                string postData = "data=" + System.Web.HttpUtility.UrlEncode(requeststring) + "&action=send";


                var data = Encoding.ASCII.GetBytes(postData);
                var request = (HttpWebRequest)WebRequest.Create(url);

                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;
                request.Method = WebRequestMethods.Http.Post;

                using (var stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                var response = (HttpWebResponse)request.GetResponse();
                retResponse = new StreamReader(response.GetResponseStream()).ReadToEnd();

                XmlDocument xDoc = new XmlDocument();
                xDoc.LoadXml(retResponse);

                string error = "";
                string guid = null;
                string submitdate = null;
                string id = null;

                if (xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE") != null)
                {
                    error = xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE").InnerText.ToString();
                }

                guid = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@GUID").InnerText.ToString();
                submitdate = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@SUBMITDATE").InnerText.ToString();
                id = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@ID").InnerText.ToString();

                xDoc = null;
                request = null;

                SMS_DT t_SMSDT = new SMS_DT();
                SMSBLL t_SMSBLL = new SMSBLL();

                t_SMSDT.MobileNo = MobileNo;
                t_SMSDT.SMSText = Message;
                t_SMSDT.SMSRequestXML = requeststring;
                t_SMSDT.SMSPostData = postData;
                t_SMSDT.SMSResponseXML = retResponse;
                t_SMSDT.CreatedBy = "";
                t_SMSDT.ClientIP = "";

                t_SMSBLL.Insert(t_SMSDT, new string[] { "MobileNo", "SMSText", "SMSRequestXML", "SMSPostData", "SMSResponseXML", "CreatedBy", "ClientIP" });

                return "";
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }

        public string sendsms_old1(string mobileno, string message)
        {
            try
            {
                mobileno = "91" + mobileno;

                string SMSData = "<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>";
                //SMSData += "<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1/sms/dtd/message.dtd\" >";
                SMSData += "<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1:80/psms/dtd/messagev12.dtd\">";
                SMSData += "<MESSAGE VER=\"1.2\">";
                SMSData += "<USER USERNAME=\"" + SMS_API_USERNAME + "\" PASSWORD=\"" + SMS_API_PASSWORD + "\"/>";
                //SMSData += "<SMS UDH=\"0\" CODING=\"1\" TEXT=\"First SMS from LMS System\" PROPERTY=\"0\" ID=\"1\">";
                SMSData += "<SMS UDH=\"0\" CODING=\"1\" TEXT=\"Test\" PROPERTY=\"0\" ID=\"1\">";
                //SMSData += "<ADDRESS FROM=\"" + SMS_API_SENDERID + "\" TO=\"" + mobileno + "\" SEQ=\"1\" TAG=\"\" /> ";
                SMSData += "<ADDRESS FROM=\"" + SMS_API_SENDERID + "\" TO=\"919650020439\" SEQ=\"1\" TAG=\"\" /> ";
                // SMSData += "<ADDRESS FROM=\"9812345678\" TO=\"919820487887\" SEQ=\"2\" /> ";
                SMSData += "</SMS>";
                SMSData += "</MESSAGE>";

                string str_url = HttpUtility.UrlEncode(SMSData, Encoding.UTF8);
                string url = "http://api.myvaluefirst.com/psms/servlet/psms.Eservice2?data=" + str_url.Trim() + "&action=send";


                WebRequest request = WebRequest.Create(url);
                //request.Credentials = CredentialCache.DefaultCredentials;
                NetworkCredential objnetworkcred = new NetworkCredential(SMS_API_USERNAME, SMS_API_PASSWORD, SMS_API_SENDERID);
                request.Credentials = objnetworkcred;
                HttpWebResponse response1 = (HttpWebResponse)request.GetResponse();
                Stream dataStream = response1.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                string responseFromServer = reader.ReadToEnd();
                // TextBox1.Text = responseFromServer;
                reader.Close();
                dataStream.Close();
                response1.Close();
                return responseFromServer;
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }

        public string sendsms_mpo(string mobileno, string message)
        {

            mobileno = SQLInjectionLocal(mobileno);
            message = SQLInjectionLocal(message);

            bool saveResult = true;

            //SqlConnection conn = null;
            //SqlTransaction tx = null;
            string res = "-1";
            if (mobileno.Length != 10)
            {
                res = "0";
            }
            else if (mobileno.ToString().Trim() == "8888888888" || mobileno.ToString().Trim() == "7777777777" || mobileno.ToString().Trim() == "9999999999")
            {
                res = "0";
            }
            else
            {
                //Value First SMS API
                bool retValue = false;
                try
                {
                    //retValue = obj.SendSingleSMSValueFirst(mobileno, message);
                    retValue = SendSMSValueFirst(mobileno, message);
                    saveResult = false;
                    res = "0";
                }
                catch (Exception ex)
                {
                    retValue = false;
                }
                finally
                {

                }

                if (!retValue)
                {
                    //res = SMSHelper.sendSingleMPOnline(mobileno, message);
                }


            }

            //if (saveResult)
            //{
            //    try
            //    {
            //        conn = Connection.GetConnection("MPOSMSGATEWAY");
            //        conn.Open();
            //        SMSHelper.SavelogMPOdatabase(mobileno, message, res, conn, tx);
            //        conn.Close();
            //        if (res.ToUpper().Contains("STATUS=SUCCESS"))
            //        {
            //            res = "0";
            //        }
            //        else
            //        {
            //            res = sendsms_vyas27052014(mobileno, message);
            //        }
            //    }
            //    catch
            //    {
            //        if (conn.State == ConnectionState.Open && conn != null) { conn.Close(); }
            //    }
            //    finally
            //    {
            //        if (conn.State == ConnectionState.Open && conn != null) { conn.Close(); }
            //    }
            //}
            return res;

        }

        private bool SendSMSValueFirst(string mobileno, string sms_text, string unicodesmstext = "")
        {
            bool retValue = false;
            string retResponse = null;
            try
            {


                mobileno = "91" + mobileno;

                StringBuilder sbsmsreq = new StringBuilder();
                //sbsmsreq.Append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
                //sbsmsreq.Append("<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1:80/psms/dtd/messagev12.dtd\">");
                //sbsmsreq.Append("<MESSAGE VER=\"1.2\">");
                //sbsmsreq.Append("<USER USERNAME=\"" + SMS_API_USERNAME + "\" PASSWORD=\"" + SMS_API_PASSWORD + "\"/>");
                //sbsmsreq.Append("<SMS  UDH=\"0\" CODING=\"2\" TEXT=\"" + sms_text + "\" PROPERTY=\"0\" ID=\"\" >");
                //sbsmsreq.Append("<ADDRESS FROM=\"" + SMS_API_SENDERID + "\" TO=\"" + mobileno + "\" SEQ=\"1\" TAG=\"SMS from Windows Communication Foundation\"/>");
                //sbsmsreq.Append("</SMS>");
                //sbsmsreq.Append("</MESSAGE>");
                sbsmsreq.Append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
                sbsmsreq.Append("<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1/psms/dtd/message.dtd\">");
                sbsmsreq.Append("<MESSAGE>");
                sbsmsreq.Append("<USER USERNAME=\"" + SMS_API_USERNAME + "\" PASSWORD=\"" + SMS_API_PASSWORD + "\"/>");
                sbsmsreq.Append("<SMS  UDH=\"0\" CODING=\"1\" TEXT=\"" + sms_text + "\" PROPERTY=\"0\" ID=\"\" >");
                sbsmsreq.Append("<ADDRESS FROM=\"" + SMS_API_SENDERID + "\" TO=\"" + mobileno + "\" SEQ=\"1\" TAG=\"SMS from Windows Communication Foundation\"/>");
                sbsmsreq.Append("</SMS>");
                sbsmsreq.Append("</MESSAGE>");

                string requeststring = sbsmsreq.ToString();

                string postData = "data=" + System.Web.HttpUtility.UrlEncode(requeststring) + "&action=send";


                var data = Encoding.ASCII.GetBytes(postData);
                var request = (HttpWebRequest)WebRequest.Create(REQUEST_URL);

                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;
                request.Method = WebRequestMethods.Http.Post;

                using (var stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                var response = (HttpWebResponse)request.GetResponse();
                retResponse = new StreamReader(response.GetResponseStream()).ReadToEnd();

                XmlDocument xDoc = new XmlDocument();
                xDoc.LoadXml(retResponse);

                string error = "";
                string guid = null;
                string submitdate = null;
                string id = null;

                if (xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE") != null)
                {
                    error = xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE").InnerText.ToString();
                }

                guid = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@GUID").InnerText.ToString();
                submitdate = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@SUBMITDATE").InnerText.ToString();
                id = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@ID").InnerText.ToString();

                xDoc = null;
                retResponse = null;
                request = null;

                string savetext = "";
                if (unicodesmstext == "")
                {
                    savetext = sms_text;
                }
                else
                {
                    savetext = unicodesmstext;
                }

                //bool saveresponse = SaveValueFirstResponse(mobileno, savetext, guid, submitdate, id, error, "", "", "MPOnline");
                if (error == "")
                { retValue = true; }
            }
            catch (Exception ex)
            {
                retValue = false;
            }
            finally
            {

            }

            return retValue;
        }
        /*
        public bool SaveValueFirstResponse(string MobileNo, string SMSText, string GUID, string SubmitDate, string SEQ, string ERROR, string DoneDate, string ReasonCode, string UserName)
        {
            bool retValue = false;

            SqlConnection conn = null;
            SqlTransaction tx = null;

            try
            {

                conn = Connection.GetConnection("MPOSMSGATEWAY");
                conn.Open();
                tx = conn.BeginTransaction();

                SqlCommand ocmd = new SqlCommand("SMSLogValueFirstSp");
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Parameters.AddWithValue("@MobileNo", MobileNo);
                ocmd.Parameters.AddWithValue("@SMSText", SMSText);
                ocmd.Parameters.AddWithValue("@GUID", GUID);
                ocmd.Parameters.AddWithValue("@SubmitDate", SubmitDate);
                ocmd.Parameters.AddWithValue("@SEQ", SEQ);
                ocmd.Parameters.AddWithValue("@ERROR", ERROR);
                ocmd.Parameters.AddWithValue("@DoneDate", DoneDate);
                ocmd.Parameters.AddWithValue("@ReasonCode", ReasonCode);
                ocmd.Parameters.AddWithValue("@UserName", UserName);

                retValue = ExecuteNonQuery(ocmd, "MPOSMSGATEWAY", conn, tx);

                if (retValue)
                {
                    tx.Commit();
                    if (conn != null) { conn.Close(); }
                }
                else
                {
                    tx.Rollback();
                    if (conn != null) { conn.Close(); }
                }
            }
            catch (Exception ex)
            {
                if (tx != null)
                { tx.Rollback(); }

                if (conn != null) { conn.Close(); }
                throw ex;
            }
            finally
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }

            return retValue;
        }


        public string sendsms_Old(string mobileno, string message)
        {

            SqlConnection conn = null;
            SqlTransaction tx = null;
            string res = "-1";
            if (mobileno.Length != 10)
            { res = "0"; }
            else if (mobileno.ToString().Trim() == "8888888888" || mobileno.ToString().Trim() == "7777777777" || mobileno.ToString().Trim() == "9999999999")
            {
                res = "0";
            }

            else
            {
                res = SMSHelper.sendSingleMPOnline(mobileno, message);
            }

            try
            {
                conn = Connection.GetConnection("MPOSMSGATEWAY");
                conn.Open();
                SMSHelper.SavelogMPOdatabase(mobileno, message, res, conn, tx);
                conn.Close();
                if (res.ToUpper().Contains("STATUS=SUCCESS"))
                {
                    res = "0";
                }
                else
                {
                    res = sendsms_vyas27052014(mobileno, message);
                }
            }
            catch (Exception ex)
            {
                if (conn.State == ConnectionState.Open && conn != null) { conn.Close(); }
            }
            finally
            {
                if (conn.State == ConnectionState.Open && conn != null) { conn.Close(); }
            }
            return res;

        }
        
        public string sendsms_vyas27052014(string mobileno, string message)
        {

            string output = null;
            string strRequest = null;
            string url = null;
            DataTable dt = ExecuteQuery("Select * from sms_credentials where misc_desc_01 in ('SMS','SMS1') and misc_desc_02 = 'Y'");
            if (dt.Rows.Count > 0)
            {
                string urlr = dt.Rows[0]["url"].ToString();
                string username = dt.Rows[0]["username"].ToString();
                string apipass = dt.Rows[0]["apipass"].ToString();
                string senderid = dt.Rows[0]["senderid"].ToString();
                string mobile = dt.Rows[0]["mobile"].ToString();
                string msg = dt.Rows[0]["message"].ToString();
                string priority = dt.Rows[0]["priority"].ToString();
                strRequest = username + "&" + apipass + "&" + senderid + "&" + mobile + mobileno + "&" + msg + message + "&" + priority;
                url = urlr;
            }
            else
            {
                strRequest = "username=mponline&api_password=38c1aj48e68yjhuyy&sender=MPONLI&to=" + mobileno + "&message=" + message + "&priority=8";
                url = "http://mp.viasgroups.com/pushsms.php?";
            }


            //string strRequest = "username=mpon&api_password=38c1alsopxoykvxed&sender=MPONLI&to=" + mobileno + "&message=" + message + "&priority=8";
            //string url = "http://mp.viastechns.com/pushsms.php?";



            string Result_FromSMS = "";
            StreamWriter myWriter = null;
            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url + strRequest);
            objRequest.Method = "POST";
            objRequest.ContentLength = strRequest.Length;
            objRequest.ContentType = "application/x-www-form-urlencoded";
            myWriter = new StreamWriter(objRequest.GetRequestStream());
            myWriter.Write(strRequest);
            myWriter.Close();
            HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
            using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
            {
                Result_FromSMS = sr.ReadToEnd();
                sr.Close();
            }
            output = Result_FromSMS;
            //output = url + strRequest;
            return output;
        }
        
        public string SendEmail(string To, string Cc, string Bcc, string sub, string body)
        {


            string Host = string.Empty;
            string Emailuser = string.Empty;
            string pass = string.Empty;
            string Portno = string.Empty;

            DataTable dt = ExecuteQuery("Select * from sms_credentials where misc_desc_01 = 'MPOnline_Email'");
            if (dt.Rows.Count > 0)
            {
                Host = dt.Rows[0]["url"].ToString();
                Emailuser = dt.Rows[0]["username"].ToString();
                pass = dt.Rows[0]["apipass"].ToString();
                Portno = dt.Rows[0]["senderid"].ToString();
            }

            SmtpClient client = new SmtpClient(Host, Convert.ToInt16(Portno));
            NetworkCredential credential = new NetworkCredential(Emailuser, pass);
            client.Credentials = credential;
            client.EnableSsl = false;
            client.Timeout = 3000;

            MailMessage message = new MailMessage();
            if (!string.IsNullOrEmpty(To))
            { message.To.Add(To); }

            if (!string.IsNullOrEmpty(Cc))
            { message.CC.Add(Cc); }

            if (!string.IsNullOrEmpty(Bcc))
            { message.Bcc.Add(Bcc); }

            message.From = new MailAddress(Emailuser);
            message.Subject = sub;
            message.IsBodyHtml = true;
            message.Body = "<b>" + body + "</b>";
            client.Send(message);
            return "0";
        }

        
        public static DataTable ExecuteQuery(string select)
        {

            DataTable dt = new DataTable();

            SqlDataAdapter adapter = null;
            SqlConnection conn = null;

            try
            {
                conn = Connection.GetConnection("mponlinetest2");
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                adapter = new SqlDataAdapter(select, conn);
                adapter.Fill(dt);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {

                if (conn.State == ConnectionState.Open) { conn.Close(); }
            }
            return dt;
        }
        public static string ExecuteScalar(string select, string database)
        {
            string result = string.Empty;
            using (SqlConnection conn = Connection.GetConnection(database))
            {
                try
                {
                    result = ExecuteScalar(select, database, conn, null);
                    if (conn.State == ConnectionState.Open) { conn.Close(); }
                }
                catch (Exception ex)
                {
                    //throw new Exception();

                    return string.Empty;

                }
            }
            return result;
        }

        public static string ExecuteXMLReader(string selectStatement, string database)
        {
            string result = string.Empty; ;
            using (SqlConnection conn = Connection.GetConnection(database))
            {
                if (conn.State == ConnectionState.Closed) { conn.Open(); }
                if ((conn != null) && (!conn.Database.Equals(database)))
                {
                    conn.ChangeDatabase(database);
                }
                using (SqlTransaction tx = conn.BeginTransaction())
                {
                    try
                    {
                        using (SqlCommand cmd = new SqlCommand(selectStatement, conn, tx))
                        {
                            XmlReader rdr = cmd.ExecuteXmlReader();
                            rdr.Read();
                            while (rdr.ReadState != ReadState.EndOfFile)
                            {
                                result += rdr.ReadOuterXml();
                            }
                            rdr.Close();
                        }

                    }
                    catch (Exception ex)
                    {
                        //throw new Exception();

                        return result;

                    }
                }
            }

            return result;
        }


        public static string ExecuteScalar(string selectStatement, string database, SqlConnection conn, SqlTransaction tx)
        {
            SqlCommand cmd = null;

            string result = null;


            try
            {
                if (conn.State == ConnectionState.Closed)
                { conn.Open(); }
                if ((conn != null) && (!conn.Database.Equals(database)))
                {
                    conn.ChangeDatabase(database);
                }

                cmd = conn.CreateCommand();
                cmd.CommandText = selectStatement;
                cmd.Transaction = tx;
                result = Convert.ToString(cmd.ExecuteScalar());



                if (cmd != null)
                    cmd.Dispose();
            }
            catch (Exception ex)
            {

                //throw new Exception();
                return null;

            }
            return result;
        }
        public static DataSet ExecuteQueryDatasetSp(SqlCommand cmd, string Database)
        {

            DataSet ds = new DataSet();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = null;
            SqlConnection conn = null;
            conn = Connection.GetConnection(Database);

            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd.Connection = conn;


                adapter = new SqlDataAdapter(cmd);
                //adapter.SelectCommand.Transaction = tx;
                adapter.Fill(ds);
            }
            catch (Exception ex)
            {
                //throw new Exception();

                throw ex;

            }
            finally
            {
                if (cmd != null) { cmd.Dispose(); }
                if (conn != null && conn.State == ConnectionState.Open) { conn.Close(); }

            }
            return ds;
        }

        public static bool ExecuteNonQuery(SqlCommand cmd, string Database, SqlConnection conn, SqlTransaction tx)
        {
            bool result = false;
            int recordsAffected = 0;

            try
            {
                if ((conn != null) && (!conn.Database.Equals(Database)))
                {
                    conn.ChangeDatabase(Database);
                }
                cmd.Connection = conn;

                cmd.Transaction = tx;
                recordsAffected = cmd.ExecuteNonQuery();
                result = (recordsAffected > 0) ? true : false;

            }
            catch (Exception ex)
            {
                //throw new Exception();
                //Functions.LogError(ex, selectStatement);
                throw ex;

            }
            finally
            {
                if (cmd != null) { cmd.Dispose(); }

            }
            return result;

        }
        */


        static string SMS_USERNAME = "g2cxml";
        static string SMS_PASSWORD = "smju1436";
        static string SMS_ADDRESS = "CSCeGO";
        //static string SMS_ADDRESS = "SSBJNK";

        static string SendSMSTo1(SMS smsDetails)
        {
            bool result = false;

            string URL;
            string MobileNo = "";
            string MessageType = "text", Message = "";
            string xml = "";
            string senderID = "";

            string requeststring, postData, retResponse;

            requeststring = postData = retResponse = "";

            MobileNo = smsDetails.MobileNos;
            Message = smsDetails.Message;


            senderID = "CSCeGO";
            try
            {

                //URL = "https://bulksmsapi.vispl.in/?username=cscotpapi&password=cscotpapi@123&messageType=text&mobile=" + MobileNo + "&senderId=" + senderID + "&message=" + Message;

                URL = "https://bulksmsapi.vispl.in/?username=cscotpapi&password=cscotpapi@123&messageType=" + MessageType + "&mobile=" + MobileNo + "&senderId=" + senderID + "&message=" + Message + "&ContentID=1707160760081632765&EntityID=1301157363501533886";

                requeststring = URL;


                ServicePointManager.ServerCertificateValidationCallback =
                    delegate (object s, X509Certificate certificate,
                    X509Chain chain, SslPolicyErrors sslPolicyErrors)
                    { return true; };

                HttpWebRequest request = WebRequest.Create(URL) as HttpWebRequest;
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        StreamReader requestStream = new StreamReader(response.GetResponseStream());
                        xml = requestStream.ReadToEnd();
                    }
                }

                retResponse = xml;

                string ProfileID = smsDetails.ProfileID == null ? "" : smsDetails.ProfileID;
                string ServiceID = smsDetails.ServiceIDNew == null ? "" : smsDetails.ServiceIDNew;
                string ApplicationID = smsDetails.ApplicationIDNew == null ? "" : smsDetails.ApplicationIDNew;

                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    smsDetails.MobileNos + "', '" + smsDetails.Message + "', '" + requeststring + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + ApplicationID + "')";

                DMLCommand(t_SQLQuery);

                result = true;

            }
            catch (Exception ex)
            {
                result = false;
            }

            return result.ToString();
        }
        static string SendSMSTo_old(SMS smsDetails)
        {

            //string SMSActivated = "N";

            //SMSActivated = ConfigurationManager.AppSettings["SMSActivated"].ToString();

            //if (SMSActivated == "N") return "";


            bool strResult = false;
            try
            {
                string retResponse = null;

                StringBuilder sbsmsreq = new StringBuilder();
                sbsmsreq.Append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
                sbsmsreq.Append("<!DOCTYPE MESSAGE SYSTEM \"http://127.0.0.1:80/psms/dtd/messagev12.dtd\">");
                sbsmsreq.Append("<MESSAGE VER=\"1.2\">");
                sbsmsreq.Append("<USER USERNAME=\"" + SMS_USERNAME + "\" PASSWORD=\"" + SMS_PASSWORD + "\"/>");
                sbsmsreq.Append("<SMS UDH=\"0\" CODING=\"1\" TEXT=\"" + smsDetails.Message + "\" PROPERTY=\"0\" ID=\"1\">");
                sbsmsreq.Append("<ADDRESS FROM=\"" + SMS_ADDRESS + "\" TO=\"" + smsDetails.MobileNos + "\" SEQ=\"1\" TAG=\"SMS from Windows Communication Foundation\"/>");
                sbsmsreq.Append("</SMS>");
                sbsmsreq.Append("</MESSAGE>");

                string requeststring = sbsmsreq.ToString();
                string url = "http://api.myvaluefirst.com/psms/servlet/psms.Eservice2?";

                string postData = "data=" + System.Web.HttpUtility.UrlEncode(requeststring) + "&action=send";


                var data = Encoding.ASCII.GetBytes(postData);
                var request = (HttpWebRequest)WebRequest.Create(url);

                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;
                request.Method = WebRequestMethods.Http.Post;

                using (var stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                var response = (HttpWebResponse)request.GetResponse();
                retResponse = new StreamReader(response.GetResponseStream()).ReadToEnd();

                XmlDocument xDoc = new XmlDocument();
                xDoc.LoadXml(retResponse);

                string error = "";
                string guid = null;
                string submitdate = null;
                string id = null;

                if (xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE") != null)
                {
                    error = xDoc.SelectSingleNode("/MESSAGEACK/GUID/ERROR/@CODE").InnerText.ToString();
                }

                guid = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@GUID").InnerText.ToString();
                submitdate = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@SUBMITDATE").InnerText.ToString();
                id = xDoc.SelectSingleNode("/MESSAGEACK/GUID/@ID").InnerText.ToString();

                xDoc = null;
                request = null;

                string ProfileID = smsDetails.ProfileID == null ? "" : smsDetails.ProfileID;
                string ServiceID = smsDetails.ServiceIDNew == null ? "" : smsDetails.ServiceIDNew;
                string ApplicationID = smsDetails.ApplicationIDNew == null ? "" : smsDetails.ApplicationIDNew;

                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    smsDetails.MobileNos + "', '" + smsDetails.Message + "', '" + requeststring + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + ApplicationID + "')";

                DMLCommand(t_SQLQuery);

                return strResult.ToString();

            }

            catch (Exception ex)
            {
                return strResult.ToString();
            }
        }

        private static void DMLCommand(string SQLStatement)
        {
            string t_ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
            SqlCommand t_SQLCmd;
            SqlConnection t_DB = new SqlConnection(t_ConnectionString);

            //try
            {
                t_SQLCmd = new SqlCommand(SQLStatement, t_DB);
                t_DB.Open();
                t_SQLCmd.ExecuteNonQuery();
                t_DB.Close();
                t_SQLCmd.Dispose();
            }
            //catch (SqlException t_exception)
            {
                //Response.Write(t_exception.Message);
            }
        }
    }
}
