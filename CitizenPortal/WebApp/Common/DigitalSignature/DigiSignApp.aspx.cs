using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Common
{
    public partial class DigiSignApp : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            SignPDF(100, 350, m_AppID, m_ServiceID, "", "");
        }

        private void SignPDF(int t_SignatureOffsetX, int t_SignatureOffsetY, string AppID, string Service_ID, string ProfileID, string UserName)
        {
            try
            {
                string filename = AppID + System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss") + ".pdf";


                byte[] byt = ConvertPDFtoByte(Server.MapPath("/Uploads/" + m_AppID + "/AppForm.pdf"));

                string RequestURL = ConfigurationManager.AppSettings["DS_RequestURL"];
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(RequestURL);
                request.ProtocolVersion = HttpVersion.Version10;
                request.Method = "POST";

                string strByte = Convert.ToBase64String(byt);
                string strReturnURL = ConfigurationManager.AppSettings["App_ReturnURL"];
                int PosX = t_SignatureOffsetX;
                int PosY = t_SignatureOffsetY;
                int PageNo = 1;
                string IsLive = ConfigurationManager.AppSettings["DS_IsLive"];

                //if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
                //    strReturnURL= "http://localhost:53056/WebApp/Common/DigitalSignature/DigiSignAppResponse.aspx";
                //else
                //    strReturnURL= "http://citizenportal.menetech.com/WebApp/Common/DigitalSignature/DigiSignAppResponse.aspx";                

                //string IsLive = "true";
                string APPID = AppID; // //"APP123"; //ConfigurationManager.AppSettings["DS_AppID"];
                string userName = UserName; // //"Guest";
                string SignedBy = userName.ToString();
                string ServiceID = "";  //////"DSC123"; //"123456";
                ServiceID = Service_ID;
                string postData = string.Format("PDFFile={0}&AppName={1}&ReturnURL={2}&PosX={3}&PosY={4}&pageNo={5}&IsLive={6}&APPID={7}&SignedBy={8}&ServiceID={9}",
                    strByte, "FDA", strReturnURL, PosX, PosY, PageNo, IsLive, APPID, SignedBy, ServiceID);
                byte[] byteArray = Encoding.UTF8.GetBytes(postData);

                request.ContentType = "application/x-www-form-urlencoded";
                request.UserAgent = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)";
                request.ContentLength = byteArray.Length;
                Stream dataStream = request.GetRequestStream();
                dataStream.Write(byteArray, 0, byteArray.Length);
                dataStream.Close();
                WebResponse response = request.GetResponse();
                Console.WriteLine(((HttpWebResponse)response).StatusDescription);
                dataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                string responseFromServer = reader.ReadToEnd();
                Console.WriteLine(responseFromServer);
                reader.Close();
                dataStream.Close();
                response.Close();
                Response.Redirect(responseFromServer, false);
            }
            catch (WebException ex)
            {
                //string fileName = "ErrorLog.txt";
                //string Paths = HttpContext.Current.Server.MapPath("~/Uploads/" + fileName);
                ////BL.WriteIntoErrorLog(Paths, fileName, ex);
                throw ex;
            }
        }

        public static byte[] ConvertPDFtoByte(string FilePathName)
        {
            byte[] ImageData;
            try
            {
                FileStream fs = new FileStream(FilePathName, FileMode.Open, FileAccess.Read);
                ImageData = new byte[fs.Length];
                fs.Read(ImageData, 0, System.Convert.ToInt32(fs.Length));
                fs.Close();
                return ImageData;
            }
            catch (Exception ex)
            {
                string fileName = "ErrorLog.txt";
                //BL.WriteIntoErrorLog(Paths, fileName, ex);
                ImageData = new byte[0];
                return ImageData;
            }
        }
    }
}