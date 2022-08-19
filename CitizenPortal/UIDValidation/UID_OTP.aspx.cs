using CitizenPortalLib.UID;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;

namespace CitizenPortal.UIDValidation
{
    public partial class UID_OTP : System.Web.UI.Page
    {
        String strTransId = "";
        String strSubAUACode = System.Configuration.ConfigurationManager.AppSettings["SubAUACode"].ToString();//"DITTEST001";
        String strAUADevice_ID = "TEST";
        public String ASAServerURL = System.Configuration.ConfigurationManager.AppSettings["ASAServerURL"].ToString();//"https://auaqa.maharashtra.gov.in/aua/rest/authreqv1";
        public static String strMahaCert = "maharashtra_cert.cer";
        public static String strUIDAuthCerFile = "uidai_auth_prod.cer";
        String strSubKUACode = "DITPRESS01";//System.Configuration.ConfigurationManager.AppSettings["SubKUACodeTest"].ToString(); //"SAUAGOM001";"SAUAGOM001";//
        String strKUADevice_ID = "enBIO10052012XDev09";
        String strCertExpDate = "";
        public String KUAServerURL = System.Configuration.ConfigurationManager.AppSettings["KUAServerURL"].ToString();//"https://kuaqa.maharashtra.gov.in/KUA/rest/kyc/";

        protected void Page_Load(object sender, EventArgs e)
        {
            form1.Action = Request.RawUrl;
            if (!Page.IsPostBack)
            {
                pnlConfirm.Visible = true;
                pnlOTP.Visible = false;

            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            String strUID = Request.QueryString["UID"].ToString();
            if (strUID.Length == 0)
            {
                lblError.Text = "ERROR: UID or Name can't be blank";
                lblError.Visible = true;
                return;
            }
            else
                lblError.Visible = false;

            String strEncryptedXML = "";
            strEncryptedXML = getOTPXML(strUID);
            callAuaASAService(strEncryptedXML, strUID);
            pnlConfirm.Visible = false;
            pnlOTP.Visible = true;
        }

        private String getOTPXML(String strUID)
        {
            String strAuthXML = @"<Auth xmlns=""http://aua.maharashtra.gov.in/auth/gom-auth-request"">
            <Txn>ConTEST:20131220043127646</Txn>
            <Ver>1.1</Ver>
            <SubAUACode>MYSUB_AUA_CODE</SubAUACode>
            <ReqType>REQ_TYPE</ReqType>
            <DeviceId>MY_DEVICE_ID</DeviceId>
            <UID>MY_UID</UID>
            <Ch>CH_VALUE</Ch>
            </Auth>";

            strTransId = DateTime.Now.ToString("yyyy-MM-dd") + "T" + DateTime.Now.ToString("HH:mm:ss");

            strAuthXML = strAuthXML.Replace("MYSUB_AUA_CODE", strSubAUACode);
            strAuthXML = strAuthXML.Replace("REQ_TYPE", "otp");
            strAuthXML = strAuthXML.Replace("MY_DEVICE_ID", strAUADevice_ID);
            strAuthXML = strAuthXML.Replace("MY_UID", strUID);
            strAuthXML = strAuthXML.Replace("CH_VALUE", "00");


            return strAuthXML;
        }

        private void callAuaASAService(String strAuthXML, String strSelectedUID)
        {
            try
            {
                Uri address = new Uri(ASAServerURL);

                HttpWebRequest request = WebRequest.Create(address) as HttpWebRequest;
                request.Method = "POST";
                request.ContentType = "application/xml";
                request.ContentLength = strAuthXML.Length;

                if (ASAServerURL.Contains("https://") == true)
                {
                    String strCertificateFile = Server.MapPath(strMahaCert);
                    X509Certificate cert2 = X509Certificate.CreateFromCertFile(strCertificateFile);
                    request.ClientCertificates.Add(cert2);
                }

                string requestBody = strAuthXML;
                byte[] byteData = Encoding.UTF8.GetBytes(requestBody);
                request.ContentLength = byteData.Length;

                request.Proxy = WebRequest.GetSystemWebProxy();
                request.Proxy.Credentials = CredentialCache.DefaultCredentials;
                request.Timeout = 30000;

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
                        if (xml != null)
                        {
                            //Console.WriteLine(xml);
                            //Console.ReadLine();

                            XmlSerializer serializer = new XmlSerializer(typeof(AuthRes));
                            AuthRes ar = (AuthRes)serializer.Deserialize(new StringReader(xml));

                            if (ar != null && ar.otpRet.Equals("y"))
                            {
                                lblStatus.ForeColor = Color.Green;
                                lblStatus.Text = "OTP has been send to registered Mobile Successfully for UID " + strSelectedUID + ". Please Wait for OTP SMS.";
                                lblStatus.Visible = true;
                                //lblError.Visible = false;
                                pnlConfirm.Visible = false;
                                pnlEnterOTP.Visible = true;
                            }
                            else
                            {
                                lblStatus.ForeColor = Color.Red;
                                lblStatus.Text = "ERROR: Failed to send OTP for UID: " + strSelectedUID + " Reason: Mobile may not be registered";
                                lblStatus.Visible = true;
                                //lblSuccess.Visible = false;
                                pnlConfirm.Visible = false;
                                pnlEnterOTP.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        lblStatus.ForeColor = Color.Red;
                        lblStatus.Text = "ERROR: AUA Server connection error. Please try again:";
                        lblStatus.Visible = true;
                        //lblSuccess.Visible = false;
                        pnlConfirm.Visible = false;
                        pnlEnterOTP.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "ERROR: AUA Server connection error. Please try again ";
                lblStatus.Visible = true;
                //lblSuccess.Visible = false;
                pnlConfirm.Visible = false;
                pnlEnterOTP.Visible = false;
            }
        }

        protected void btnValidateOTP_Click(object sender, EventArgs e)
        {
            String strOTP_PIN = txtOTP.Text.Trim();
            String strUID = Request.QueryString["UID"].ToString();

            if (strUID.Length == 0 || strOTP_PIN.Length == 0)
            {
                //lblError.Text = "ERROR: UID or OTP can't be blank";
                //lblError.Visible = true;
                return;
            }
            //else
            //lblError.Visible = false;

            String strPidXml = getPidXML_Demographic(strOTP_PIN);

            //-- Get new session Key
            String strNewSessionKey = getNewSessionKey();

            // Encrypt PID xml with Session key (AES)
            String strEncPidXML = encryptPidWithSessionKey(strPidXml, Convert.FromBase64String(strNewSessionKey));

            //--- Generate Hash and AES encrypt using session key
            String hashdPid = computeHashMacAndEncrypt(strPidXml, strNewSessionKey);

            //--- Incrypt session key using certificate public key
            String strEncSessionKey = "";
            try
            {
                strEncSessionKey = encryptWithPublicKey(strNewSessionKey);
            }
            catch (CryptographicException e2)
            {
                return;
            }

            //--- Create auth xml 
            String strEncryptedXML = "";
            strEncryptedXML = getAuthXML(strEncPidXML, strUID, strEncSessionKey, hashdPid, false);
            callKUA_KSAService(strEncryptedXML, strUID);
            pnlOTP.Visible = false;
            pnlConfirm.Visible = false;
        }

        private String getAuthXML(String strEncPID, String strUID, String strSessionKey, string strhadPid, bool isBiometric)
        {
            /*String strAuthXML = @"<kuaData>
                    <sa>MYKUA_KSA_CODE</sa>
                    <appCode>APP_CODE</appCode>  
                    <ts>TIME_STAMP_ts</ts>    
                    <rc>Y</rc>
                    <saTxn>TRANS_ID</saTxn>
                    <uid>MY_UID</uid>
                    <tokenNumber></tokenNumber>
                    <tokenType>001</tokenType> 
                    <Meta udc=""MY_DEVICE_ID"" fdc=""FDC_VALUE"" pip=""PIP_VALUE"" lot=""P"" lov=""LOV_VALUE"" idc=""NA""/> 
                    <Uses otp=""OTP_VALUE"" pin=""n"" BT_VALUE bio=""BIO_VALUE"" pfa=""PFA_VALUE"" pa=""PA_VALUE""  pi=""PI_VALUE""/>
                    <Skey ci=""CERT_END_DATE"">SKEY_VALUE</Skey> 
                    <Data type=""X"">MY_PID_DATA</Data> 
                    <Hmac>HMAC_FROM_PID</Hmac> 
                    </kuaData>";

            strTransId = DateTime.Now.ToString("yyyy-MM-dd") + "T" + DateTime.Now.ToString("HH:mm:ss");

            strAuthXML = strAuthXML.Replace("MYKUA_KSA_CODE", strSubKUACode);
            strAuthXML = strAuthXML.Replace("REQ_TYPE", "AUTH");
            strAuthXML = strAuthXML.Replace("MY_DEVICE_ID", strKUADevice_ID);
            strAuthXML = strAuthXML.Replace("MY_UID", strUID);
            strAuthXML = strAuthXML.Replace("APP_CODE", "KYCApp");
            strAuthXML = strAuthXML.Replace("FDC_VALUE", "NC");
            strAuthXML = strAuthXML.Replace("SKEY_VALUE", strSessionKey);
            strAuthXML = strAuthXML.Replace("MY_PID_DATA", strEncPID);
            strAuthXML = strAuthXML.Replace("HMAC_FROM_PID", strhadPid);
            strAuthXML = strAuthXML.Replace("CERT_END_DATE", getCertificateExpDate());
            strAuthXML = strAuthXML.Replace("TIME_STAMP_ts", strTransId);
            strAuthXML = strAuthXML.Replace("TRANS_ID", "KUA-KSA-TEST-" + strTransId);


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
             */
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

            strTransId = DateTime.Now.ToString("yyyy-MM-dd") + "T" + DateTime.Now.ToString("HH:mm:ss");
            //strTransId = hfTimeStamp.Value.ToString();
            strAuthXML = strAuthXML.Replace("MYKUA_KSA_CODE", strSubKUACode);
            strAuthXML = strAuthXML.Replace("REQ_TYPE", "AUTH");
            strAuthXML = strAuthXML.Replace("MY_DEVICE_ID", strKUADevice_ID);
            strAuthXML = strAuthXML.Replace("MY_UID", strUID);
            strAuthXML = strAuthXML.Replace("APP_CODE", "KYCApp");
            strAuthXML = strAuthXML.Replace("FDC_VALUE", "NC");
            strAuthXML = strAuthXML.Replace("SKEY_VALUE", strSessionKey);
            strAuthXML = strAuthXML.Replace("MY_PID_DATA", strEncPID);
            strAuthXML = strAuthXML.Replace("HMAC_FROM_PID", strhadPid);
            strAuthXML = strAuthXML.Replace("CERT_END_DATE", getCertificateExpDate());
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

        private String getPidXML_Demographic(String strOTP_PIN)
        {
            String strPidXML = @"<Pid ts=""TIME_STAMP"" ver=""1.0"">                
                <Pv otp=""OTP_PIN""/> 
                </Pid>";

            /* String strPidXML = @"<Pid ts=""TIME_STAMP"" ver=""1.0"">
                 <Demo >
                     <Pi ms=""MS_VALUE"" mv=""MATCHING_VAL"" name=""USER_NAME"" gender=""USER_GENDER"" />              
                 </Demo>
                 <Pv otp=""OTP_PIN""/> 
                 </Pid>";*/

            // TIME_STAMP 2013-02-22T15:53:34
            String strCurrentTime = DateTime.Now.ToString("yyyy-MM-dd") + "T" + DateTime.Now.ToString("HH:mm:ss");
            strPidXML = strPidXML.Replace("TIME_STAMP", strCurrentTime);  // E|P  exact or partial
                                                                          /*strPidXML = strPidXML.Replace("MS_VALUE", "E");  // E|P  exact or partial
                                                                          strPidXML = strPidXML.Replace("MATCHING_VAL", "100"); // ic above "E" case its 100 %
                                                                          strPidXML = strPidXML.Replace("USER_NAME", strName);    // name
                                                                          strPidXML = strPidXML.Replace("USER_GENDER", strGender);  // M / F / T
                                                                          */
            strPidXML = strPidXML.Replace("OTP_PIN", strOTP_PIN);  // M / F / T

            return strPidXML;
        }
        public static string getNewSessionKey()
        {
            using (Aes myAes = Aes.Create("AES"))
            {
                myAes.KeySize = 256;
                myAes.GenerateKey();
                return Convert.ToBase64String(myAes.Key);
            }
        }
        private static string encryptPidWithSessionKey(string pidXml, byte[] key)
        {
            byte[] keyArray = key; // UTF8Encoding.UTF8.GetBytes(key); // 256-AES key
            byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(pidXml);
            RijndaelManaged rDel = new RijndaelManaged();
            rDel.Key = keyArray;
            rDel.Mode = CipherMode.ECB; // http://msdn.microsoft.com/en-us/library/system.security.cryptography.ciphermode.aspx
            rDel.Padding = PaddingMode.PKCS7; // better lang support
            ICryptoTransform cTransform = rDel.CreateEncryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
            return Convert.ToBase64String(resultArray, 0, resultArray.Length);
        }

        public string computeHashMacAndEncrypt(string boimetric, string key)
        {
            System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            byte[] message = encoding.GetBytes(boimetric);
            SHA256 sha256 = SHA256.Create();
            byte[] final = sha256.ComputeHash(message);
            byte[] keyArray = Convert.FromBase64String(key);   // UTF8Encoding.UTF8.GetBytes(key); // 256-AES key
            RijndaelManaged rDel = new RijndaelManaged();
            rDel.Key = keyArray;
            rDel.Mode = CipherMode.ECB; // http://msdn.microsoft.com/en-us/library/system.security.cryptography.ciphermode.aspx
            rDel.Padding = PaddingMode.PKCS7; // better lang support
            ICryptoTransform cTransform = rDel.CreateEncryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(final, 0, final.Length);
            return Convert.ToBase64String(resultArray, 0, resultArray.Length);
        }

        public string encryptWithPublicKey(string stringToEncrypt)
        {
            X509Certificate2 certificate = getPublicKey();
            byte[] cipherbytes = Convert.FromBase64String(stringToEncrypt);
            RSACryptoServiceProvider rsa = (RSACryptoServiceProvider)certificate.PublicKey.Key;
            byte[] cipher = rsa.Encrypt(cipherbytes, false);
            return Convert.ToBase64String(cipher);
        }
        public X509Certificate2 getPublicKey()
        {
            RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();
            String strCertificateFile = Server.MapPath(strUIDAuthCerFile);
            X509Certificate2 cert2 = new X509Certificate2(strCertificateFile);
            String strDate = cert2.GetExpirationDateString();
            return cert2;
        }
        private String getCertificateExpDate()
        {
            if (strCertExpDate.Length != 0)
                return strCertExpDate;

            RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();
            String strCertificateFile = Server.MapPath(strUIDAuthCerFile);
            X509Certificate2 cert2 = new X509Certificate2(strCertificateFile);
            String strDate = cert2.GetExpirationDateString();
            DateTime dt = Convert.ToDateTime(strDate);
            strCertExpDate = dt.ToString("yyyyMMdd");
            return strCertExpDate;
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
                    String strCertificateFile = Server.MapPath(strMahaCert);
                    X509Certificate cert2 = X509Certificate.CreateFromCertFile(strCertificateFile);
                    request.ClientCertificates.Add(cert2);
                }

                string requestBody = strAuthXML;
                byte[] byteData = Encoding.UTF8.GetBytes(requestBody);
                request.ContentLength = byteData.Length;

                request.Proxy = WebRequest.GetSystemWebProxy();
                request.Proxy.Credentials = CredentialCache.DefaultCredentials;
                request.Timeout = 30000;

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

                                String strPhotoBase64 = ar.UidData[0].Pht;
                                byte[] imageBytes = Convert.FromBase64String(strPhotoBase64);
                                string FinalImage = Convert.ToBase64String(imageBytes);
                                img1.ImageUrl = "data:image/png;base64," + FinalImage;
                                img1.Visible = true;

                                //MemoryStream ms = new MemoryStream(imageBytes);
                                //Image img = Image.FromStream(ms);
                                pnlDetails.Visible = true;
                                //lblSuccess.Visible = false;
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
                                pnlDetails.Visible = false;
                                DataSet dsError = new DataSet();
                                dsError.ReadXml(new XmlTextReader(new StringReader(xml)));
                                //RegisterClientScriptBlock("Error", "<scrit>alert('Your Authentication failed for UID: " + strSelectedUID + "')</script>");
                                //Console.Write("Your Authentication failed for UID: " + strSelectedUID, "Error");
                                string ErrorCode = dsError.Tables[0].Rows[0]["err"].ToString();
                                lblError.Text = "Error Code : " + ErrorCode + ", Reason : " + System.Configuration.ConfigurationManager.AppSettings[ErrorCode.ToUpper()].ToString();
                                //lblError.Text = "ERROR: Your Authentication failed for UID: " + strSelectedUID;
                                lblError.Visible = true;
                            }
                        }
                    }
                    else
                    {
                        lblError.Text = "ERROR: AUA Server connection error. Please try again:";
                        lblError.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "ERROR: KUA Server connection error. ";
                lblError.Visible = true;
            }
        }
    }
}