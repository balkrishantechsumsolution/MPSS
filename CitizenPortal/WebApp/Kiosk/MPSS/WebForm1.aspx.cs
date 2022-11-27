using CitizenPortalLib.DataStructs;
using DocumentFormat.OpenXml.Bibliography;
using iTextSharp.text.pdf;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Org.BouncyCastle.Asn1.Pkcs;
using Org.BouncyCastle.Ocsp;
using SqlHelper;
using sun.net.www.content.text;
using sun.security.jca;
using sun.swing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Helpers;
using System.Web.Http.Results;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button1_Click(object sender, EventArgs e)
        {

            string url = "http://labour.mp.gov.in/WebServices/MPBOC.asmx";
            string method = "";
            string responseText = "";


            var param = new Dictionary<string, string>();
            param.Add("UniquePortalCode", "SB2382300");
            param.Add("SCode", "$MPBOC$^%&@123");



            //string responseText;
            method = "GetCardHoderDetailsByUniqueCode";

            var responseStatusCode = CallWebService(url, "http://tempuri.org/", method, param, out responseText);

            string jsonData = responseText;
            char[] delimiterChars = { '<' };
            string[] sList = jsonData.Split(delimiterChars);


            string data = sList[0];



            dynamic stuff = JObject.Parse(data);
            

            var SUCCESS = JTokenToArray<string>(stuff.Value<JToken>("SUCCESS"));

            

            var st = JsonConvert.DeserializeObject<SuccessData>(Convert.ToString(SUCCESS));

            string SamagraFamilyID = st.SamagraFamilyID;
            string SamagraMemberID = st.SamagraMemberID;
            string CardHolderName = st.CardHolderName;
            string UniqueCode = st.UniqueCode;
            //var a = "a";

        }
        public static JObject JTokenToArray<T>(JToken jToken)
        {
            JObject parent=null;
            foreach (JToken jItem in jToken)
            {
                parent = (JObject)jItem;
                return parent;
            }
            return parent;
        }

        
        public class SuccessData
        {
            public string SamagraFamilyID;
            public string SamagraMemberID;
            public string CardHolderName;
            public string UniqueCode;
            

        }

        public static HttpStatusCode CallWebService(string webWebServiceUrl,
                                    string webServiceNamespace,
                                    string methodName,
                                    Dictionary<string, string> parameters,
                                    out string responseText)
        {
            const string soapTemplate =
        @"<?xml version=""1.0"" encoding=""utf-8""?>
<soap12:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:soap12=""http://www.w3.org/2003/05/soap-envelope"">
  <soap12:Body>
    <{0} xmlns=""{1}"">
      {2}    </{0}>
  </soap12:Body>
</soap12:Envelope>";

            var req = (HttpWebRequest)WebRequest.Create(webWebServiceUrl);
            req.Headers.Add("SOAPAction", "\"http://tempuri.org/GetCardHoderDetailsByUniqueCode\"");
            req.ContentType = "application/soap+xml;charset=\"utf-8\"";
            req.Accept = "text/xml";
            req.Method = "POST";

            string parametersText;

            if (parameters != null && parameters.Count > 0)
            {
                var sb = new StringBuilder();
                foreach (var oneParameter in parameters)
                    sb.AppendFormat("  <{0}>{1}</{0}>\r\n", oneParameter.Key, System.Security.SecurityElement.Escape(oneParameter.Value));

                parametersText = sb.ToString();
            }
            else
            {
                parametersText = "";
            }

            string soapText = string.Format(soapTemplate, methodName, webServiceNamespace, parametersText);


            using (Stream stm = req.GetRequestStream())
            {
                using (var stmw = new StreamWriter(stm))
                {
                    stmw.Write(soapText);
                }
            }

            var responseHttpStatusCode = HttpStatusCode.Unused;
            responseText = null;

            using (var response = (HttpWebResponse)req.GetResponse())
            {
                responseHttpStatusCode = response.StatusCode;

                if (responseHttpStatusCode == HttpStatusCode.OK)
                {
                    int contentLength = (int)response.ContentLength;

                    if (contentLength > 0)
                    {
                        int readBytes = 0;
                        int bytesToRead = contentLength;
                        byte[] resultBytes = new byte[contentLength];

                        using (var responseStream = response.GetResponseStream())
                        {
                            while (bytesToRead > 0)
                            {
                                // Read may return anything from 0 to 10. 
                                int actualBytesRead = responseStream.Read(resultBytes, readBytes, bytesToRead);

                                // The end of the file is reached. 
                                if (actualBytesRead == 0)
                                    break;

                                readBytes += actualBytesRead;
                                bytesToRead -= actualBytesRead;
                            }

                            responseText = Encoding.UTF8.GetString(resultBytes);
                            //responseText = Encoding.ASCII.GetString(resultBytes);
                        }
                    }
                }
            }



            return responseHttpStatusCode;
        }

    }
}