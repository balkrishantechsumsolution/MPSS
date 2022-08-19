using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Configuration;
using System.Data;
using System.Web.Configuration;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using CitizenPortalLib.SMSServiceReference;
using System.Data.SqlClient;
using System.IO;

namespace CitizenPortalLib
{
    public partial class CommonUtility
    {
        protected static string ConnectionString = "Frame";

        public static string CheckNull(string Value)
        {
            return String.IsNullOrEmpty(Value.Trim()) == true ? null : Value;
        }

        //This one is using a SMTP Server of Gmail
        public static void SendEmailWithAttachment_Gmail(string ServiceID, string AppID, string ProfileID
            , string toAddress, string cc, string bcc, string subject, string body, bool isBodyHtml, string strOriginalMsg)
        {
            string m_FromAddress = ConfigurationManager.AppSettings["FromAddress"].ToString();
            string m_DefaultEmailAddress = ConfigurationManager.AppSettings["DefaultEmailAddress"].ToString();
            string m_DefaultDisplayName = ConfigurationManager.AppSettings["EmailSenderDisplayName"].ToString();
            string result = "0";

            SmtpClient smtpClient = new SmtpClient();
            MailMessage message = new MailMessage();

            MailAddress mailaddress = new MailAddress(m_FromAddress, m_DefaultDisplayName);

            //// You can specify the host name or ipaddress of your server
            //// Default in IIS will be localhost
            //smtpClient.Host = GetAppconfigParamString("SmtpClientHost");
            smtpClient.Host = ConfigurationManager.AppSettings["SMTPHost"];
            smtpClient.Port = int.Parse(ConfigurationManager.AppSettings["SMTPPort"]);


            ////From address will be given as a MailAddress Object
            message.From = mailaddress;
            //message.Sender = new MailAddress(m_FromAddress, "MAHAEBIZ (SWC)"); 
            //// To address collection of MailAddress
            //// message.To.Add(toAddress);
            if (!string.IsNullOrEmpty(toAddress))
            {
                if (toAddress.IndexOf(';') > 0)
                {
                    string[] emailtoAddress = toAddress.Split(';');
                    foreach (string strtoAddress in emailtoAddress)
                    {
                        if (!string.IsNullOrEmpty(strtoAddress))
                        {
                            if (string.Compare(strtoAddress.Trim(), "--", true) != 0)
                            {
                                message.To.Add(strtoAddress);
                            }
                            else
                                message.To.Add(m_DefaultEmailAddress);
                        }
                    }
                }
                else
                {
                    if (string.Compare(toAddress.Trim(), "--", true) != 0)
                    {
                        message.To.Add(toAddress);
                    }
                    else
                        message.To.Add(m_DefaultEmailAddress);
                }
            }

            message.Subject = subject;
            message.SubjectEncoding = System.Text.Encoding.UTF8;

            //// CC and BCC optional
            //// MailAddressCollection class is used to send the email to various users
            // You can specify Address as new MailAddress("admin1@yoursite.com")
            if (!string.IsNullOrEmpty(cc))
            {
                if (cc.IndexOf(';') == 0)
                    cc = cc.Remove(cc.IndexOf(';'), 1);

                if (cc.IndexOf(';') > 0)
                {
                    string[] emailCC = cc.Split(';');
                    foreach (string strCC in emailCC)
                    {
                        if (!string.IsNullOrEmpty(strCC))
                        {
                            if (string.Compare(strCC.Trim(), "--", true) != 0)
                            {
                                message.CC.Add(strCC);
                            }
                            else
                                message.CC.Add(m_DefaultEmailAddress);
                        }
                    }
                }
                else
                {
                    if (string.Compare(cc.Trim(), "--", true) != 0)
                    {
                        message.CC.Add(cc);
                    }
                    else
                        message.CC.Add(m_DefaultEmailAddress);
                }
            }

            //// You can specify Address directly as string
            if (!string.IsNullOrEmpty(bcc))
            {
                if (bcc.IndexOf(';') > 0)
                {
                    string[] emailBCC = bcc.Split(';');
                    foreach (string strBCC in emailBCC)
                    {
                        if (!string.IsNullOrEmpty(strBCC))
                        {
                            if (string.Compare(strBCC.Trim(), "--", true) != 0)
                            {
                                message.Bcc.Add(strBCC.Trim());
                            }
                            else
                            {
                                message.Bcc.Add(m_DefaultEmailAddress);
                            }
                        }
                    }
                }
                else
                {
                    if (string.Compare(bcc.Trim(), "--", true) != 0)
                    {
                        message.Bcc.Add(bcc);
                    }
                    else
                        message.Bcc.Add(m_DefaultEmailAddress);
                }
            }

            ////Body can be Html or text format
            ////Specify true if it  is html message
            message.IsBodyHtml = isBodyHtml;

            //// Message body content                       
            //DataTable dt = GetValueFromEmailTemp(C2S2Constants.EmailTempFooter);
            message.Body = body;

            //encode the message body
            message.BodyEncoding = System.Text.Encoding.UTF8;

            //// Send SMTP mail
            ////smtpClient.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;

            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["SMTPUserName"], ConfigurationManager.AppSettings["SMTPPassword"]);


            //Log The Content Of Mail
            Logger.LogInformation("Sent to:--> " + message.To.ToString() + "|| CC to:--> " + message.CC.ToString() + "|| Subject:--> " + subject + "<br />" + " Body:--> " + body);
            //Enable when email sending is enabled in the web config

            //bool IsEmailSendingEnabled = false;
            //IsEmailSendingEnabled = bool.Parse(ConfigurationManager.AppSettings["EnableSendEmail"]);
            //if (IsEmailSendingEnabled)
            try
            {
                //smtpClient.Credentials=new NetworkCredential("Uname","PAssword","Domain");
                smtpClient.Send(message);
                result = "1";
            }
            catch (Exception ex)
            {
                result = "0";

            }

            BLL.CommonBLL obj = new BLL.CommonBLL();
            obj.InsertMailDetails(ServiceID, AppID, ProfileID
            , toAddress, cc, bcc, subject, body, isBodyHtml.ToString());

        }

        public static void SendEmailWithAttachment(string ServiceID, string AppID, string ProfileID
           , string toAddress, string cc, string bcc, string subject, string body, bool isBodyHtml, string strOriginalMsg, string AttachmentPath = null)
        {
            string m_FromAddress = WebConfigurationManager.AppSettings["FromAddress"].ToString();
            string m_DefaultEmailAddress = WebConfigurationManager.AppSettings["DefaultEmailAddress"].ToString();
            string m_DefaultDisplayName = WebConfigurationManager.AppSettings["DisplayName"].ToString();
            string result = "0";

            SmtpClient smtpClient = new SmtpClient();

            MailMessage message = new MailMessage();

            MailAddress mailaddress = new MailAddress(m_FromAddress, m_DefaultDisplayName);

            //// You can specify the host name or ipaddress of your server
            //// Default in IIS will be localhost
            //smtpClient.Host = GetAppconfigParamString("SmtpClientHost");
            smtpClient.Host = WebConfigurationManager.AppSettings["SMTPHost"];
            smtpClient.Port = int.Parse(WebConfigurationManager.AppSettings["SMTPPort"]);

            ////From address will be given as a MailAddress Object
            message.From = mailaddress;
            //message.Sender = new MailAddress(m_FromAddress, "MAHAEBIZ (SWC)"); 
            //// To address collection of MailAddress
            //// message.To.Add(toAddress);
            if (!string.IsNullOrEmpty(toAddress))
            {
                if (toAddress.IndexOf(';') > 0)
                {
                    string[] emailtoAddress = toAddress.Split(';');
                    foreach (string strtoAddress in emailtoAddress)
                    {
                        if (!string.IsNullOrEmpty(strtoAddress))
                        {
                            if (string.Compare(strtoAddress.Trim(), "--", true) != 0)
                            {
                                message.To.Add(strtoAddress);
                            }
                            else
                                message.To.Add(m_DefaultEmailAddress);
                        }
                    }
                }
                else
                {
                    if (string.Compare(toAddress.Trim(), "--", true) != 0)
                    {
                        message.To.Add(toAddress);
                    }
                    else
                        message.To.Add(m_DefaultEmailAddress);
                }
            }

            message.Subject = subject;
            message.SubjectEncoding = System.Text.Encoding.UTF8;

            //// CC and BCC optional
            //// MailAddressCollection class is used to send the email to various users
            // You can specify Address as new MailAddress("admin1@yoursite.com")
            if (!string.IsNullOrEmpty(cc))
            {
                if (cc.IndexOf(';') == 0)
                    cc = cc.Remove(cc.IndexOf(';'), 1);

                if (cc.IndexOf(';') > 0)
                {
                    string[] emailCC = cc.Split(';');
                    foreach (string strCC in emailCC)
                    {
                        if (!string.IsNullOrEmpty(strCC))
                        {
                            if (string.Compare(strCC.Trim(), "--", true) != 0)
                            {
                                message.CC.Add(strCC);
                            }
                            else
                                message.CC.Add(m_DefaultEmailAddress);
                        }
                    }
                }
                else
                {
                    if (string.Compare(cc.Trim(), "--", true) != 0)
                    {
                        message.CC.Add(cc);
                    }
                    else
                        message.CC.Add(m_DefaultEmailAddress);
                }
            }

            //// You can specify Address directly as string
            if (!string.IsNullOrEmpty(bcc))
            {
                if (bcc.IndexOf(';') > 0)
                {
                    string[] emailBCC = bcc.Split(';');
                    foreach (string strBCC in emailBCC)
                    {
                        if (!string.IsNullOrEmpty(strBCC))
                        {
                            if (string.Compare(strBCC.Trim(), "--", true) != 0)
                            {
                                message.Bcc.Add(strBCC.Trim());
                            }
                            else
                            {
                                message.Bcc.Add(m_DefaultEmailAddress);
                            }
                        }
                    }
                }
                else
                {
                    if (string.Compare(bcc.Trim(), "--", true) != 0)
                    {
                        message.Bcc.Add(bcc);
                    }
                    else
                        message.Bcc.Add(m_DefaultEmailAddress);
                }
            }

            ////Body can be Html or text format
            ////Specify true if it  is html message
            message.IsBodyHtml = isBodyHtml;

            //// Message body content                       
            //DataTable dt = GetValueFromEmailTemp(C2S2Constants.EmailTempFooter);
            message.Body = body;

            //encode the message body
            message.BodyEncoding = System.Text.Encoding.UTF8;

            System.Net.Mail.Attachment attachment;

            if (AttachmentPath != null && AttachmentPath != "")
            {
                attachment = new System.Net.Mail.Attachment(AttachmentPath);
                message.Attachments.Add(attachment);     
            }

            //// Send SMTP mail
            ////smtpClient.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;

            // smtpClient.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = (WebConfigurationManager.AppSettings["SMTPUserName"].ToString());
            NetworkCred.Password = (WebConfigurationManager.AppSettings["SMTPPassword"].ToString());
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = NetworkCred;
            smtpClient.EnableSsl = true;
            //  smtpClient.Port = 25;


            //Log The Content Of Mail
            Logger.LogInformation("Sent to:--> " + message.To.ToString() + "|| CC to:--> " + message.CC.ToString() + "|| Subject:--> " + subject + "<br />" + " Body:--> " + body);
            //Enable when email sending is enabled in the web config

            //bool IsEmailSendingEnabled = false;
            //IsEmailSendingEnabled = bool.Parse(ConfigurationManager.AppSettings["EnableSendEmail"]);
            //if (IsEmailSendingEnabled)
            try
            {
                ServicePointManager.ServerCertificateValidationCallback =
                 delegate (object s, X509Certificate certificate,
                  X509Chain chain, SslPolicyErrors sslPolicyErrors)
                   { return true; }; 
               
                //smtpClient.Credentials=new NetworkCredential("Uname","PAssword","Domain");
                smtpClient.Send(message);
                result = "1";
            }
            catch (Exception ex)
            {
                result = "0";
                throw ex;

            }

            BLL.CommonBLL obj = new BLL.CommonBLL();
            obj.InsertMailDetails(ServiceID, AppID, ProfileID
            , toAddress, cc, bcc, subject, body, isBodyHtml.ToString());

        }

        //Working one using a proper SMTP Server instead of Gmail One
        public static void SendEmailWithAttachment_old(string ServiceID, string AppID, string ProfileID
            , string toAddress, string cc, string bcc, string subject, string body, bool isBodyHtml, string strOriginalMsg)
        {
            string m_FromAddress = ConfigurationManager.AppSettings["FromAddress"].ToString();
            string m_DefaultEmailAddress = ConfigurationManager.AppSettings["DefaultEmailAddress"].ToString();
            string m_DefaultDisplayName = ConfigurationManager.AppSettings["EmailSenderDisplayName"].ToString();

            SmtpClient smtpClient = new SmtpClient();
            MailMessage message = new MailMessage();

            MailAddress mailaddress = new MailAddress(m_FromAddress, m_DefaultDisplayName);

            //// You can specify the host name or ipaddress of your server
            //// Default in IIS will be localhost
            //smtpClient.Host = GetAppconfigParamString("SmtpClientHost");
            smtpClient.Host = ConfigurationManager.AppSettings["SMTPHost"];
            smtpClient.Port = int.Parse(ConfigurationManager.AppSettings["SMTPPort"]);


            ////From address will be given as a MailAddress Object
            message.From = mailaddress;
            //message.Sender = new MailAddress(m_FromAddress, "MAHAEBIZ (SWC)"); 
            //// To address collection of MailAddress
            //// message.To.Add(toAddress);
            if (!string.IsNullOrEmpty(toAddress))
            {
                if (toAddress.IndexOf(';') > 0)
                {
                    string[] emailtoAddress = toAddress.Split(';');
                    foreach (string strtoAddress in emailtoAddress)
                    {
                        if (!string.IsNullOrEmpty(strtoAddress))
                        {
                            if (string.Compare(strtoAddress.Trim(), "--", true) != 0)
                            {
                                message.To.Add(strtoAddress);
                            }
                            else
                                message.To.Add(m_DefaultEmailAddress);
                        }
                    }
                }
                else
                {
                    if (string.Compare(toAddress.Trim(), "--", true) != 0)
                    {
                        message.To.Add(toAddress);
                    }
                    else
                        message.To.Add(m_DefaultEmailAddress);
                }
            }

            message.Subject = subject;
            message.SubjectEncoding = System.Text.Encoding.UTF8;

            //// CC and BCC optional
            //// MailAddressCollection class is used to send the email to various users
            // You can specify Address as new MailAddress("admin1@yoursite.com")
            if (!string.IsNullOrEmpty(cc))
            {
                if (cc.IndexOf(';') == 0)
                    cc = cc.Remove(cc.IndexOf(';'), 1);

                if (cc.IndexOf(';') > 0)
                {
                    string[] emailCC = cc.Split(';');
                    foreach (string strCC in emailCC)
                    {
                        if (!string.IsNullOrEmpty(strCC))
                        {
                            if (string.Compare(strCC.Trim(), "--", true) != 0)
                            {
                                message.CC.Add(strCC);
                            }
                            else
                                message.CC.Add(m_DefaultEmailAddress);
                        }
                    }
                }
                else
                {
                    if (string.Compare(cc.Trim(), "--", true) != 0)
                    {
                        message.CC.Add(cc);
                    }
                    else
                        message.CC.Add(m_DefaultEmailAddress);
                }
            }

            //// You can specify Address directly as string
            if (!string.IsNullOrEmpty(bcc))
            {
                if (bcc.IndexOf(';') > 0)
                {
                    string[] emailBCC = bcc.Split(';');
                    foreach (string strBCC in emailBCC)
                    {
                        if (!string.IsNullOrEmpty(strBCC))
                        {
                            if (string.Compare(strBCC.Trim(), "--", true) != 0)
                            {
                                message.Bcc.Add(strBCC.Trim());
                            }
                            else
                            {
                                message.Bcc.Add(m_DefaultEmailAddress);
                            }
                        }
                    }
                }
                else
                {
                    if (string.Compare(bcc.Trim(), "--", true) != 0)
                    {
                        message.Bcc.Add(bcc);
                    }
                    else
                        message.Bcc.Add(m_DefaultEmailAddress);
                }
            }

            ////Body can be Html or text format
            ////Specify true if it  is html message
            message.IsBodyHtml = isBodyHtml;

            //// Message body content                       
            //DataTable dt = GetValueFromEmailTemp(C2S2Constants.EmailTempFooter);
            message.Body = body;

            //encode the message body
            message.BodyEncoding = System.Text.Encoding.UTF8;

            //// Send SMTP mail
            ////smtpClient.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;

            //Log The Content Of Mail
            Logger.LogInformation("Sent to:--> " + message.To.ToString() + "|| CC to:--> " + message.CC.ToString() + "|| Subject:--> " + subject + "<br />" + " Body:--> " + body);
            //Enable when email sending is enabled in the web config

            //bool IsEmailSendingEnabled = false;
            //IsEmailSendingEnabled = bool.Parse(ConfigurationManager.AppSettings["EnableSendEmail"]);
            //if (IsEmailSendingEnabled)
            try
            {
                //smtpClient.Credentials=new NetworkCredential("Uname","PAssword","Domain");
                smtpClient.Send(message);
            }
            catch (Exception ex)
            { }

        }

        public static string SendSMS(string Textmessage, long UserID)
        {
            //CommonApplicationBLL oCommonApplicationBLL = new CommonApplicationBLL();
            DataTable CommonApplicationDT = new DataTable();
            //CommonApplicationDT = oCommonApplicationBLL.GetUserInfo(UserID);                                    
            string ContactMobile = string.Empty;
            string t_Result = "";
            //if (CommonApplicationDT != null && CommonApplicationDT.Rows.Count > 0)
            //{
            //    //IsAppliedForSMSAlerts = Convert.ToBoolean((CommonApplicationDT.Rows[0]["ReceiveSMSAlerts"]));
            //    ContactMobile = CommonApplicationDT.Rows[0]["ContactMobile"].ToString();
            //}

            //Log The Content Of SMS
            Logger.LogInformation("SMS To:" + ContactMobile + " Text:" + Textmessage);

            if (!string.IsNullOrEmpty(ContactMobile))
            {
                //Call SendSMS Method
                try
                {
                    MOLSendSMS(ContactMobile, Textmessage);
                    t_Result = "message Sent";
                }
                catch (Exception ex)
                {
                    Logger.LogException("Send SMS To Customer Error:", ex);
                    t_Result = "Send SMS To Customer Error";
                }
            }

            return t_Result;
        }


        public static string SendSMSTo(string MobileNo, string SMSText, string AppID, string ServiceID, string ProfileID)
        {
            bool result = false;

            string URL;
            string xml = "";

            string requeststring, postData, retResponse;

            requeststring = postData = retResponse = "";


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
+ "&text=" + SMSText
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


                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    MobileNo + "', '" + SMSText + "', '" + requeststring + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + AppID + "')";

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

        public static string SendSMS_o(string Textmessage, string MobileNo)
        {
            string ContactMobile = string.Empty;
            ContactMobile = MobileNo;
            Logger.LogInformation("SMS To:" + ContactMobile + " Text:" + Textmessage);
            string t_Result = "";

            if (!string.IsNullOrEmpty(ContactMobile))
            {
                //Call SendSMS Method
                try
                {
                    MOLSendSMS(ContactMobile, Textmessage);
                    t_Result = "message Sent";
                }
                catch (Exception ex)
                {
                    Logger.LogException("Send SMS To Customer Error:", ex);
                    t_Result = "Send SMS To Customer Error";
                }
            }

            return t_Result;
        }

        public static void MOLSendSMS(string MobileNo, string Textmessage)
        {

            //PushService.PushServiceClient client = new PushService.PushServiceClient();
            //PushService.SMS objSMS = new PushService.SMS();

            //string username = ConfigurationManager.AppSettings["SMSUser"].ToString();
            //string password = ConfigurationManager.AppSettings["SMSPass"].ToString();

            //string mobno = MobileNo;

            //objSMS.ApplicationUserName = username;
            //objSMS.ApplicationUserPassword = password;

            //objSMS.Message = Textmessage;
            //objSMS.MobileNos = mobno;

            //string strMessage = client.SendSMSTo(objSMS);
        }

        public static string GetHashEncodedPassword(string Password)
        {
            System.Security.Cryptography.HashAlgorithm hashAlg = new System.Security.Cryptography.SHA1Managed();
            string HashedPassword = string.Empty;
            using (hashAlg)
            {
                byte[] pwordData = Encoding.Default.GetBytes(Password);

                byte[] hash = hashAlg.ComputeHash(pwordData);

                HashedPassword = BitConverter.ToString(hash);
            }
            return HashedPassword;
        }

        public static string EncodeSpecialCharacters(string SourceString)
        {
            string[] EncodedString = { "<", ">", "\\", "&", "(", ")", ";", "%", "^", "\"", "`", "[", "]" };
            string[] DecodedString = { "_LT_", "_GT_", "_RS_", "_AD_", "_LP_", "_RP_", "_SC_", "_PT_", "_CA_", "_QM_", "_QS_", "_LSB_", "_RSB_" };

            for (int i = 0; i < EncodedString.Length; i++)
            {
                if (SourceString.Contains(EncodedString[i]))
                {
                    SourceString = SourceString.Replace(EncodedString[i], DecodedString[i]);
                }

            }
            return SourceString.Trim();

        }

        public static string DecodeSpecialCharacters(string SourceString)
        {
            string[] EncodedString = { "<", ">", "\\", "&", "(", ")", ";", "%", "^", "\"", "`", "[", "]" };
            string[] DecodedString = { "_LT_", "_GT_", "_RS_", "_AD_", "_LP_", "_RP_", "_SC_", "_PT_", "_CA_", "_QM_", "_QS_", "_LSB_", "_RSB_" };

            for (int i = 0; i < DecodedString.Length; i++)
            {
                if (SourceString.Contains(DecodedString[i]))
                {
                    SourceString = SourceString.Replace(DecodedString[i], EncodedString[i]);
                }
            }
            return SourceString;

        }


        public static string SendSMSSU(string Mobile, string SMSText)
        {
            bool result = false;

            string URL;
            string MobileNo = "";
            string MessageType = "", Message = "";
            string xml = "";
            string senderID = "";

            string requeststring, postData, retResponse;

            requeststring = postData = retResponse = "";

            SMS t_SMS = new SMS();

            MobileNo = t_SMS.MobileNos;
            Message = t_SMS.Message;


            senderID = "CSCSPV";
            try
            {

                URL = "https://bulksmsapi.videoconsolutions.com/?username=cscotpapi&password=cscotpapi@123&messageType=text&mobile=" +
    MobileNo + "&senderId=" + senderID + "&message=" + Message;

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

                string ProfileID = t_SMS.ProfileID == null ? "" : t_SMS.ProfileID;
                string ServiceID = t_SMS.ServiceIDNew == null ? "" : t_SMS.ServiceIDNew;
                string ApplicationID = t_SMS.ApplicationIDNew == null ? "" : t_SMS.ApplicationIDNew;

                string t_SQLQuery = "Insert Into SMSDetailTb (MobileNo, SMSText, SMSRequestXML, SMSPostData, SMSResponseXML, CreatedBy, CreatedOn, ClientIP, ProfileID, ServiceID, AppID) Values ('" +
                    MobileNo + "', '" + Message + "', '" + requeststring + "', '" + postData + "', '" + retResponse + "', Null, GetDate(), Null, '" + ProfileID + "', '" + ServiceID + "', '" + ApplicationID + "')";

                DMLCommand(t_SQLQuery);

                result = true;

            }
            catch (Exception ex)
            {
                result = false;
            }

            return result.ToString();
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
