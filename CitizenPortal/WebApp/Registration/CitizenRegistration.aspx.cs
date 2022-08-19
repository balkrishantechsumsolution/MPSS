using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Text;
using System.Linq;
using System.Security.Cryptography;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CitizenPortal.Services.AddressService;

namespace CitizenPortal.WebApp.Registration
{
    public partial class CitizenRegistration : System.Web.UI.Page
    {
        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string culture = "en-GB";
            if (!IsPostBack)
            {
                Session["CurrentCulture"] = culture;
                Session["UserType"] = "CITIZEN";
                
            }         
        }
        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }
        public void FillCapctha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                Session["captchatxt"] = captcha.ToString();
                // imgCaptcha.ImageUrl = "AddCapcha.aspx?" + DateTime.Now.Ticks.ToString();
            }
            catch
            {

                throw;
            }
        }

        public interface IService1Channel : IAddressService, IClientChannel
        { }

        static List<Tuple<string, string>> GetSessionValues()
        {
            List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();
            string culture = HttpContext.Current.Session["CurrentCulture"].ToString();
            string userType = HttpContext.Current.Session["UserType"].ToString();
            string ID = "";

            if (HttpContext.Current.Session["G2GID"] != null)
            {
                ID = HttpContext.Current.Session["G2GID"].ToString();
            }
            else if (HttpContext.Current.Session["KioskID"] != null)
            {
                ID = HttpContext.Current.Session["KioskID"].ToString();
            }
            else if (HttpContext.Current.Session["CitizenID"] != null)
            {
                ID = HttpContext.Current.Session["CitizenID"].ToString();
            }

            //nvc.Add(new Tuple<string, string>("G2GID", ID));
            //nvc.Add(new Tuple<string, string>("KioskID", ID));
            nvc.Add(new Tuple<string, string>("ID", ID));
            nvc.Add(new Tuple<string, string>("UserType", userType));
            nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

            return nvc;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertLoginDetails(string prefix, string Data, string Signature)
        {
            string noNewLines = Data.Replace("\n", "");
            LoginDetail_DT viewModel = ToObjectFromJSON<LoginDetail_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            string OriginalMD5 = CreateMD5(Data);
            string text;
            if (OriginalMD5.ToUpper() == Signature.ToUpper())
            {

                using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
                {
                    IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                    using (OperationContextScope scope = new OperationContextScope(proxy))
                    {
                        List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

                        MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                        System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                        OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                        text = proxy.InsertLoginDetail(viewModel);

                    }
                }
            }
            else
            {
                ServiceResult t_ServiceResult = new ServiceResult();

                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Invalid details !";
                t_ServiceResult.intStatus = 2;
                text = new JavaScriptSerializer().Serialize(t_ServiceResult);
            }

            return text;

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string CheckAvability(string prefix, string UserId)
        {
            
            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    //// Solution for Session Fixation Step 1 
                    string strAuthToken = Guid.NewGuid().ToString();
                    HttpContext.Current.Session["AuthToken"] = strAuthToken;
                    HttpContext.Current.Response.Cookies.Add(new HttpCookie("AuthToken", strAuthToken));

                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.CheckAvability(UserId);

                }
            }

            return text;
        }
        //fnCheckMobileNo
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string CheckMobileNo(string prefix, string MobileNo,string CaptchaID)
        {

            string URL = "";
            URL = m_ServiceURL;
            string text;

            if (CaptchaID == HttpContext.Current.Session["LoginCaptchaTest"].ToString())
            {
                using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
                {
                    IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                    using (OperationContextScope scope = new OperationContextScope(proxy))
                    {
                        List<Tuple<string, string>> nvc = GetSessionValues();
                        MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                        System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                        OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                        text = proxy.CheckMobileNo(MobileNo);

                    }
                }
            }
            else
            {
                ServiceResult t_ServiceResult = new ServiceResult();
              
                t_ServiceResult.AppID = "";
                t_ServiceResult.Status = "Wrong Captcha!";
                t_ServiceResult.intStatus = 4;
                text= new JavaScriptSerializer().Serialize(t_ServiceResult);
            }

            return text;
        }
        public static string CreateMD5(string input)
        {
            // Use input string to calculate MD5 hash
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }
        //Encrypt string in javascript and C# by the same way sha256 to get same results
        public static string EncryptSHA256(string value)
        {
            string p = "";
            var message = Encoding.ASCII.GetBytes(value);
            SHA256Managed hashString = new SHA256Managed();
            string hex = "";

            var hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }

            p = hex;

            return p;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod(EnableSession = true)]
        public static string CreateImage()
        {
            string guidResult = System.Guid.NewGuid().ToString();
            guidResult = guidResult.Replace("-", string.Empty);
            guidResult = guidResult.Substring(0, 6);

            HttpContext.Current.Session["LoginCaptchaTest"] = guidResult;
            string sImageText = guidResult;

            Bitmap bmpImage = new Bitmap(1, 1);

            int iWidth = 0;
            int iHeight = 0;

            Font MyFont = new Font("Arial", 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel);
            Graphics MyGraphics = Graphics.FromImage(bmpImage);
            iWidth = Convert.ToInt32(MyGraphics.MeasureString(sImageText, MyFont).Width) + 22;
            iHeight = Convert.ToInt32(MyGraphics.MeasureString(sImageText, MyFont).Height) + 6;
            bmpImage = new Bitmap(bmpImage, new Size(iWidth, iHeight));
            MyGraphics = Graphics.FromImage(bmpImage);
            MyGraphics.Clear(Color.Beige);
            MyGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            MyGraphics.DrawString(sImageText, MyFont, new SolidBrush(Color.Black), 10, 4);
            bmpImage.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            HttpContext.Current.Response.ContentType = "image/gif";
            MyGraphics.Flush();
            byte[] byteImage = ms.ToArray();
            string SigBase64 = Convert.ToBase64String(byteImage);

            return SigBase64;


        }
    }
}