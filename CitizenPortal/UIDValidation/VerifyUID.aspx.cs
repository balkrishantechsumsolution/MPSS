using CitizenPortalLib.UID;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;

namespace CitizenPortal.UIDValidation
{
    public partial class VerifyUID : System.Web.UI.Page
    {
        String strTransId = "";
        String strSubKUACode = System.Configuration.ConfigurationManager.AppSettings["SubKUACode"].ToString(); //"SAUAGOM001";
        String strKUADevice_ID = "enBIO10052012XDev09";

        //String strSubAUACode = "DITTEST001";
        //String strAUADevice_ID = "TEST";

        //String strCertExpDate = "";
        public static String strUIDAuthCerFile = "uidai_auth_preprod.cer";
        public static String strMahaCert = "maharashtra_cert.cer";

        //Thread webServiceThread = null;
        public String KUAServerURL = System.Configuration.ConfigurationManager.AppSettings["KUAServerURL"].ToString();
        public String ASAServerURL = System.Configuration.ConfigurationManager.AppSettings["ASAServerURL"].ToString();
        public String RasBerryServerURL = System.Configuration.ConfigurationManager.AppSettings["RasBerryServerURL"].ToString();

        //public String KUAServerURL = "https://kuaqa.maharashtra.gov.in/KUA/rest/kyc/";
        //public String ASAServerURL = "https://auaqa.maharashtra.gov.in/aua/rest/authreqv1";
        //public String RasBerryServerURL = "http://etreat.dnsd.me/uid?identifier=UID_DETAILS&amp;name=CITIZEN_NAME";
        //Boolean bIsConnected = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GetData_OnClick(object sender, EventArgs e)
        {
            string strEncrypted = "";
            if (Request.QueryString.Count > 0)
                strEncrypted = Request.QueryString["E"].ToString();


            Helper hpClass = new Helper();
            String strSelectedUID = Request.QueryString["UID"].ToString();//hdnfUIDValue.Value;
            if (strEncrypted == "Y")
                strSelectedUID = hpClass.DecryptString(strSelectedUID);


            if (strSelectedUID.Length != 12)
            {
                return;
            }

            string base64FingerPrint = hftxtPid.Value;

            String strNewSessionKey = hftxtencSesKey.Value;

            String hashdPid = hftxtHmac.Value;

            String strEncSessionKey = strNewSessionKey;

            String strCertExpDate = hftxtCertExp.Value;

            String strEncryptedXML = getAuthXML(base64FingerPrint, strSelectedUID, strEncSessionKey, hashdPid, true, strCertExpDate);

            callKUA_KSAService(strEncryptedXML, strSelectedUID);
        }

        private void callKUA_KSAService(String strAuthXML, String strSelectedUID)
        {
            String strSessionName = Request.QueryString["SessionName"].ToString();
            if (strSessionName.Length == 0)
            {
                lblError.Text = "ERROR: Please Supply Session Name";
                lblError.Visible = true;
                return;
            }
            else
                lblError.Visible = false;
            try
            {
                Uri address = new Uri(KUAServerURL);

                HttpWebRequest request = WebRequest.Create(address) as HttpWebRequest;
                request.Method = "POST";
                request.ContentType = "application/xml";
                request.ContentLength = strAuthXML.Length;

                if (KUAServerURL.Contains("https://") == true)
                {
                    //String strCertificateFile = Directory.GetCurrentDirectory() + "\\" + strMahaCert;
                    String strCertificateFile = Server.MapPath(strMahaCert);
                    X509Certificate cert2 = X509Certificate.CreateFromCertFile(strCertificateFile); //new X509Certificate(strCertificateFile);
                    request.ClientCertificates.Add(cert2);
                }

                string requestBody = strAuthXML; //  "<searchSRDHReqv1><searchInput><uid>200000800152</uid></searchInput><searchOutputRequired><eid>Y</eid><gender>Y</gender><mobile>Y</mobile><email>Y</email><addrBuilding>Y</addrBuilding><addrCareof>Y</addrCareof><addrDistrictName>Y</addrDistrictName><addrLandmark>Y</addrLandmark><addrLocality>Y</addrLocality><addrPincode>Y</addrPincode><addrPoName>Y</addrPoName><addrStateName>N</addrStateName><addrStreet>Y</addrStreet><dob>N</dob><locallanguage>Y</locallanguage><photo>N</photo></searchOutputRequired><sourceType>eScholarship_qa</sourceType><token>ZVNjaG9sYXJzaGlwX3FhX01haGFyYXNodHJh</token></searchSRDHReqv1>";
                byte[] byteData = Encoding.UTF8.GetBytes(requestBody);
                request.ContentLength = byteData.Length;

                request.Proxy = WebRequest.GetSystemWebProxy();
                request.Proxy.Credentials = CredentialCache.DefaultCredentials;
                request.Timeout = 20000;


                using (Stream requestStream = request.GetRequestStream())
                {
                    requestStream.Write(byteData, 0, byteData.Length);
                }

                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        StreamReader requestStream = new StreamReader(response.GetResponseStream());
                        string xml = requestStream.ReadToEnd();
                        DataTable dt = new DataTable();
                        dt.Columns.Add("Name", typeof(string));
                        dt.Columns.Add("NameMR", typeof(string));
                        dt.Columns.Add("DOB", typeof(string));
                        dt.Columns.Add("addrPinCode", typeof(string));
                        dt.Columns.Add("Email", typeof(string));
                        dt.Columns.Add("Mobile", typeof(string));
                        dt.Columns.Add("AddrCareOf", typeof(string));
                        dt.Columns.Add("AddrCareOfMr", typeof(string));
                        dt.Columns.Add("AddrStreet", typeof(string));
                        dt.Columns.Add("AddrStreetMr", typeof(string));
                        dt.Columns.Add("AddrBuilding", typeof(string));
                        dt.Columns.Add("AddrBuildingMr", typeof(string));
                        dt.Columns.Add("AddrLocality", typeof(string));
                        dt.Columns.Add("AddrLocalityMr", typeof(string));
                        dt.Columns.Add("AddrLandmark", typeof(string));
                        dt.Columns.Add("AddrLandmarkMr", typeof(string));
                        dt.Columns.Add("Gender", typeof(string));
                        dt.Columns.Add("addrDistrictName", typeof(string));
                        dt.Columns.Add("addrDistrictNameMr", typeof(string));
                        dt.Columns.Add("Pht", typeof(string));
                        dt.Columns.Add("UID", typeof(string));
                        if (xml != null)
                        {
                            XmlSerializer serializer = new XmlSerializer(typeof(KuaRes));
                            KuaRes ar = (KuaRes)serializer.Deserialize(new StringReader(xml));
                            if (ar != null && ar.ret.Equals("y", StringComparison.OrdinalIgnoreCase))
                            {
                                tbl1.Visible = true;
                                StringBuilder sb = new StringBuilder();

                                String strCitiZenName = ar.UidData[0].Poi[0].name;
                                String strName1 = strCitiZenName;

                                sb.Append("CitizenName : " + strCitiZenName + "<br>");
                                lblCitizenName.Text = strCitiZenName;
                                strName1 += "\nBirth Date: " + ar.UidData[0].Poi[0].dob;
                                strName1 += "\nGender: " + ar.UidData[0].Poi[0].gender;


                                lblDOB.Text = ar.UidData[0].Poi[0].dob;
                                lblGender.Text = ar.UidData[0].Poi[0].gender;
                                sb.Append("\nBirth Date: : " + ar.UidData[0].Poi[0].dob + "<br>");
                                sb.Append("\nGender: : " + ar.UidData[0].Poi[0].gender + "<br>");

                                String strName2 = ar.UidData[0].LData[0].name;
                                sb.Append("\nName: " + ar.UidData[0].LData[0].name + "<br>");


                                String strAddress1 =
                                          ar.UidData[0].Poa[0].co + "\n"
                                        + ar.UidData[0].Poa[0].lc + "\n"
                                        + ar.UidData[0].Poa[0].vtc + "\n"
                                        + ar.UidData[0].Poa[0].dist + "\n"
                                        + ar.UidData[0].Poa[0].state + "\n"
                                        + ar.UidData[0].Poa[0].pc;
                                sb.Append("\nAddress1: " + strAddress1 + "<br>");
                                lblAddress1.Text = strAddress1;
                                String strAddress2 =
                                     ar.UidData[0].LData[0].co + "\n"
                                   + ar.UidData[0].LData[0].lc + "\n"
                                   + ar.UidData[0].LData[0].vtc + "\n"
                                   + ar.UidData[0].LData[0].dist + "\n"
                                   + ar.UidData[0].LData[0].state + "\n"
                                   + ar.UidData[0].LData[0].pc;
                                sb.Append("\nAddress2: " + strAddress2 + "<br>");
                                lblAddress2.Text = strAddress2;
                                String strContacts = ar.UidData[0].Poi[0].phone;
                                sb.Append("\nContacts: " + strContacts + "<br>");
                                lblContacts.Text = strContacts;
                                //ltrData.Text = sb.ToString();


                                String strPhotoBase64 = ar.UidData[0].Pht;
                                byte[] imageBytes = Convert.FromBase64String(strPhotoBase64);

                                //if (DateTime.Now.Date <= DateTime.Parse("01/24/2014"))
                                //{
                                //    strPhotoBase64 = System.Text.Encoding.UTF8.GetString(imageBytes);
                                //    imageBytes = Convert.FromBase64String(strPhotoBase64);
                                //}
                                string FinalImage = Convert.ToBase64String(imageBytes);
                                img1.ImageUrl = "data:image/png;base64," + FinalImage;
                                img1.Visible = true;
                                btnVerify.Visible = true;
                                //MemoryStream ms = new MemoryStream(imageBytes);
                                //Image img = Image.FromStream(ms);
                                pnlDetails.Visible = true;
                                btnClose.Visible = true;

                                dt.Rows.Add(ar.UidData[0].Poi[0].name,
                                            ar.UidData[0].LData[0].name,
                                            ar.UidData[0].Poi[0].dob,
                                            ar.UidData[0].Poa[0].pc,
                                            "",
                                            "",
                                            ar.UidData[0].Poa[0].co,
                                            ar.UidData[0].LData[0].co,
                                            "",
                                            "",
                                            ar.UidData[0].Poa[0].house,
                                            ar.UidData[0].LData[0].house,
                                            ar.UidData[0].Poa[0].lc,
                                            ar.UidData[0].LData[0].lc,
                                            ar.UidData[0].Poa[0].vtc,
                                            ar.UidData[0].LData[0].vtc,
                                            ar.UidData[0].Poi[0].gender,
                                            ar.UidData[0].Poa[0].dist,
                                            ar.UidData[0].LData[0].dist,
                                            ar.UidData[0].Pht,
                                            strSelectedUID
                                );

                                //DataSet ds = new DataSet();
                                if (Session[strSessionName] != null)
                                {
                                    //System.IO.StringReader xmlSR = new System.IO.StringReader(Session[strSessionName].ToString());
                                    //ds.ReadXml(xmlSR);
                                    Session[strSessionName] = null;
                                }
                                /*ds.Tables.Add(dt);
                                MemoryStream str = new MemoryStream();
                                dt.WriteXml(str, true);
                                str.Seek(0, SeekOrigin.Begin);
                                StreamReader sr = new StreamReader(str);
                                string xmlstr;
                                xmlstr = sr.ReadToEnd();*/
                                Session[strSessionName] = dt;
                            }
                            else
                            {
                                DataSet dsError = new DataSet();
                                dsError.ReadXml(new XmlTextReader(new StringReader(xml)));
                                //RegisterClientScriptBlock("Error", "<scrit>alert('Your Authentication failed for UID: " + strSelectedUID + "')</script>");
                                //Console.Write("Your Authentication failed for UID: " + strSelectedUID, "Error");
                                string ErrorCode = dsError.Tables[0].Rows[0]["err"].ToString();
                                lblError.Text = "Error Code : " + ErrorCode + ", Reason : " + System.Configuration.ConfigurationManager.AppSettings[ErrorCode.ToUpper()].ToString();
                                lblError.Visible = true;
                                tbl1.Visible = false;
                                img1.Visible = false;
                                btnVerify.Visible = false;
                                lblPleaseWait.Visible = false;
                                pnlDetails.Visible = false;
                                btnClose.Visible = true;

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //Console.Write(ex.Message);
                lblError.Text = ex.Message;
                lblError.Visible = true;
                tbl1.Visible = false;
                img1.Visible = false;
                btnVerify.Visible = false;
                lblPleaseWait.Visible = false;
                pnlDetails.Visible = false;
                btnClose.Visible = true;
            }
            //UseWaitCursor = false;
            lblPleaseWait.Visible = false;
            //return;
        }

        private String getAuthXML(String strEncPID, String strUID, String strSessionKey, string strhadPid, bool isBiometric, String certExpDate)
        {
            //--- In next version you have to add below two tags in xml

            String strAuthXML = @"  <KUAData  xmlns=""http://kua.maharashtra.gov.in/kyc/gom-kyc-request"">
                                <uid>MY_UID</uid>
                                <appCode>APP_CODE</appCode>  
                                <sa>MYKUA_KSA_CODE</sa>
                                <saTxn>TRANS_ID</saTxn>
                                <Data type=""X"">MY_PID_DATA</Data> 
                                <Hmac>HMAC_FROM_PID</Hmac> 
                                <Skey ci=""CERT_END_DATE"">SKEY_VALUE</Skey> 
                                <Uses otp=""OTP_VALUE"" pin=""n"" BT_VALUE bio=""BIO_VALUE"" pfa=""PFA_VALUE"" pa=""PA_VALUE""  pi=""PI_VALUE""/>
                                <tokenNumber></tokenNumber>
                                <tokenType>001</tokenType> 
                                <Meta udc=""MY_DEVICE_ID"" fdc=""FDC_VALUE"" pip=""PIP_VALUE"" lot=""P"" lov=""LOV_VALUE"" idc=""NA""/> 
                                <rc>Y</rc>
                                <lr>Y</lr>
                                <mec>Y</mec>
                                <ts>TIME_STAMP_ts</ts>    
                </KUAData>";

            //strTransId = DateTime.Now.ToString("yyyy-MM-dd") + "T" + DateTime.Now.ToString("HH:mm:ss");
            strTransId = hfTimeStamp.Value.ToString();
            strAuthXML = strAuthXML.Replace("MYKUA_KSA_CODE", strSubKUACode);
            strAuthXML = strAuthXML.Replace("REQ_TYPE", "AUTH");
            strAuthXML = strAuthXML.Replace("MY_DEVICE_ID", strKUADevice_ID);
            strAuthXML = strAuthXML.Replace("MY_UID", strUID);
            strAuthXML = strAuthXML.Replace("APP_CODE", "KYCApp");
            strAuthXML = strAuthXML.Replace("FDC_VALUE", "NC");
            strAuthXML = strAuthXML.Replace("SKEY_VALUE", strSessionKey);
            strAuthXML = strAuthXML.Replace("MY_PID_DATA", strEncPID);
            strAuthXML = strAuthXML.Replace("HMAC_FROM_PID", strhadPid);
            strAuthXML = strAuthXML.Replace("CERT_END_DATE", certExpDate /*getCertificateExpDate()*/);
            strAuthXML = strAuthXML.Replace("TIME_STAMP_ts", strTransId);
            strAuthXML = strAuthXML.Replace("TRANS_ID", "MahaOnline-" + strTransId);


            if (isBiometric == true)
            {
                strAuthXML = strAuthXML.Replace("PI_VALUE", "n");
                strAuthXML = strAuthXML.Replace("BIO_VALUE", "y");
                strAuthXML = strAuthXML.Replace("PA_VALUE", "n");
                strAuthXML = strAuthXML.Replace("PFA_VALUE", "n");
                strAuthXML = strAuthXML.Replace("BT_VALUE", "bt=\"FMR\"");
                strAuthXML = strAuthXML.Replace("PIP_VALUE", "10.186.6.29");
                strAuthXML = strAuthXML.Replace("LOV_VALUE", "110016");
                strAuthXML = strAuthXML.Replace("OTP_VALUE", "n");
            }
            else
            {
                strAuthXML = strAuthXML.Replace("PI_VALUE", "n");
                strAuthXML = strAuthXML.Replace("BIO_VALUE", "n");
                strAuthXML = strAuthXML.Replace("PA_VALUE", "n");
                strAuthXML = strAuthXML.Replace("PFA_VALUE", "n");
                strAuthXML = strAuthXML.Replace("BT_VALUE", "");
                strAuthXML = strAuthXML.Replace("PIP_VALUE", "10.186.6.29");
                strAuthXML = strAuthXML.Replace("LOV_VALUE", "110016");
                strAuthXML = strAuthXML.Replace("OTP_VALUE", "y");
            }
            // Removed ki=""

            //REQ_TYPE with AUTH

            return strAuthXML;
        }

    }
}