<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/g2c/master/Home.Master" CodeBehind="RequestICICI.aspx.cs" Inherits="CitizenPortal.PG.RequestICICI" %>

<%-- MasterPageFile="~/g2c/master/Home.Master"--%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="CitizenPortal.Models" %>



<script runat="server">

    // this.MasterPageFile = "~/Master/Vendor.Master";
    protected void Page_PreInit(Object sender, EventArgs e)
    {
        int svc = 0;
        int ammt = 0;
        int svct = 0;
        int port = 0;
        string m_ServiceID = "";
        string m_ammt = "";
        string m_svct = "";
        string m_port = "";

        if (Request.QueryString["SvcID"] == null || Request.QueryString["SvcID"] == "" && Request.QueryString["PortalFee"] == "" || Request.QueryString["PortalFee"] == null && Request.QueryString["Amt"] == null && Request.QueryString["Amt"] == "" && Request.QueryString["ServiceTax"] == "" || Request.QueryString["ServiceTax"] == null)
        {
            this.MasterPageFile = "../WebApp/Kiosk/Master/Empty.Master";

            return;

        }
        else
        {
            m_ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["SvcID"]));
            m_port = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PortalFee"]));
            m_ammt = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Amt"]));
            m_svct = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["ServiceTax"]));
        }
        bool isNum = Int32.TryParse(m_ServiceID, out svc);
        bool isamt = Int32.TryParse(m_ammt, out ammt);
        bool issvct = Int32.TryParse(m_svct, out svct);
        bool isPort = Int32.TryParse(m_port, out port);
        if (isamt)
        {


        }
        else if (issvct)
        {

        }
        else if (isPort)
        {

        }
        else
        {
            this.MasterPageFile = "../WebApp/Kiosk/Master/Empty.Master";
        }

        if (isNum)
        {
            //Is a Number
            if (svc < 391 && svc != 0)//This is for all Odisa Servcie ID
            {
                this.MasterPageFile = "~/g2c/master/Home.Master";
            }
            else if (svc == 850) //this is for Vendor Service ID
            {
                this.MasterPageFile = "../WebApp/Kiosk/Master/Vendor.Master";
            }
            else if (svc == 851)//this is for Epay service ID
            {
                this.MasterPageFile = "../WebApp/Kiosk/Master/EPAY.Master";
            }
            else if (svc == 852)//For  PayBill Service ID
            {
                this.MasterPageFile = "../WebApp/Kiosk/Master/PayBill.Master";
            }
            else if (svc == 0) //somethimg is wrong, any request parameter is invalid
            {
                this.MasterPageFile = "../WebApp/Kiosk/Master/Empty.Master";
            }
        }


        else
        {
            // something mandtaory parameter is null 
            this.MasterPageFile = "../WebApp/Kiosk/Master/Empty.Master";

        }









        //else if (m_ServiceID == "392")// For EPay Service ID
        //{
        //    this.MasterPageFile = "../WebApp/Kiosk/Master/EPAY.Master";
        //}
        //else if (m_ServiceID == "393")//For  PayBill Service ID
        //{
        //    this.MasterPageFile = "../WebApp/Kiosk/Master/PayBill.Master";
        //}


        //Session["LoginID"] 
        // if (Session["UID"] != null && Session["UID"].ToString() != "" ||Session["LoginID"] != null && Session["UID"].ToString() != "" )
        // {
        //     this.MasterPageFile = "~/g2c/master/Home.Master";
        // }
        //else if (Session["shopname"] != null && Session["shopname"].ToString() != "")
        // {
        //     this.MasterPageFile = "../WebApp/Kiosk/Master/Vendor.Master";
        // }
        // else
        // {
        //     this.MasterPageFile = "~/g2c/master/Home.Master";

        // }
        //<a href="">../WebApp/Kiosk/Master/Vendor.Master</a>
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.MasterPageFile == "../WebApp/Kiosk/Master/Empty.Master")
        {
            lblsms.Visible = true;
            lblsms.Text = "Invalid Request Parameter";//receive null then
            DIVPayment.Visible = false;
            return;
        }


        //  Response.Write(beforeURl);

        //    if (Request.QueryString["SvcID"] == null) return;


        //    string merchantID, Paymentmode, BasicURL, returnURL, Reference_no, sub_merchant_id, pgamount, Mobile_No, city, name;
        //    name = "";
        //    string Result = "";
        //    string redirecturl = "";  // this is to check what url is coming before encryption
        //    string encryptredirecturl = ""; //after encryption
        //    string RequestHeader = "";
        //    string RequestURL = "";
        //    string PGName = "ICICI";
        //    //string ReturnURL = "";
        //    string PassKey = "";
        //    string Param1 = "";
        //    string Param2 = "";
        //    string Param3 = "";
        //    string Param4 = "";
        //    string Param5 = "";
        //    string Createdby = "";
        //    string CreatedOn = "";
        //    string Modifiedby = "";
        //    string ModifiedOn = "";
        //    int IsActive = 0;






        //    string m_AppID = Request.QueryString["AppID"].ToString();

        //    string m_ServiceID = Request.QueryString["SvcID"].ToString();
        //    Reference_no = m_AppID;
        //    Paymentmode = ConfigurationManager.AppSettings["PaymentMode"].ToString();
        //    merchantID = ConfigurationManager.AppSettings["ICIC_MerchantId"].ToString();
        //    sub_merchant_id = ConfigurationManager.AppSettings["ICICI_sub_merchant_id"].ToString();
        //    returnURL = ConfigurationManager.AppSettings["ICICI_SuccessURL"].ToString();
        //    BasicURL = ConfigurationManager.AppSettings["ICICI_BasicURL"].ToString();
        //    pgamount = "1";
        //    IsActive = 1;


        //    string AESKEY = ConfigurationManager.AppSettings["ICICI_AESKEY"].ToString();

        //    //string beforeEncryption = "https://eazypay.icicibank.com/EazyPG?merchantid=123279&mandatory fields=123|654|1&optional fields=&returnurl=http:siinnovative.in/pg/responseICICI.aspx&Reference No=123&submerchantid=654&transaction amount=1&paymode=9";

        //    // string afterEncryption = "https://eazypay.icicibank.com/EazyPG?merchantid=123279&mandatoryfields=U4C+3+t/eF38KM8tLyDVjg==&optional fields=&returnurl=oeNmC0MZhFvUlHPBMi74yNsL2+Ieb34Py3eNuqgx2JeypltuCXgkhyad1aKcE6M/&Reference No=Qy5zdN8IC8cPd7aSQWxPGQ==&submerchantid=L8B7vfXcMrz18pz8dVRNvA==&transaction amount=Tc8e/VyhIKhzXn/5A7r5yQ==&paymode=BxK4odahlyqfJapzFMhzTA==";

        //    //string beforeEncryption = "https://eazypay.icicibank.com/EazyPG?merchantid="+ merchantID +"&mandatoryfields="+Reference_no|sub_merchant_id|pgamount+"&optional fields="+" "+"&returnurl="+ returnURL +"&Reference No=" + Reference_no+"&submerchantid=" + sub_merchant_id+"&transaction amount=" +pgamount+"&paymode=" +9;

        //    //string Dncryptredirecturl = Decrypt(afterEncryption);

        //    //string  Dncryptredirecturl = BasicURL;
        //    //Dncryptredirecturl += "merchantid=" + merchantID;
        //    //Dncryptredirecturl += "&mandatory fields=" +(Reference_no + "|" + sub_merchant_id + "|" + pgamount, AESKEY);
        //    //Dncryptredirecturl += "&optional fields=";
        //    //Dncryptredirecturl += "&returnurl=" + (returnURL, AESKEY);
        //    //Dncryptredirecturl += "&Reference No=" + (Reference_no, AESKEY);
        //    //Dncryptredirecturl += "&submerchantid=" + (sub_merchant_id, AESKEY);
        //    //Dncryptredirecturl += "&transaction amount=" + (pgamount, AESKEY);
        //    //Dncryptredirecturl += "&paymode=" + (Paymentmode, AESKEY);










        //    //Mobile_No = "your value"; ;
        //    //city = "your value";
        //    //name = "your value";


        //    redirecturl += BasicURL;
        //    redirecturl += "merchantid=" + merchantID;
        //    redirecturl += "&mandatory fields=" + Reference_no + "|" + sub_merchant_id + "|" + pgamount;
        //    redirecturl += "&optional fields=" + "";
        //    redirecturl += "&returnurl=" + returnURL;
        //    redirecturl += "&Reference No=" + Reference_no;
        //    redirecturl += "&submerchantid=" + sub_merchant_id;
        //    redirecturl += "&transaction amount=" + pgamount;
        //    redirecturl += "&paymode=" + Paymentmode;


        //    encryptredirecturl += BasicURL;
        //    encryptredirecturl += "merchantid=" + merchantID;
        //    encryptredirecturl += "&mandatory fields=" + encryptFile(Reference_no + "|" + sub_merchant_id + "|" + pgamount, AESKEY);
        //    encryptredirecturl += "&optional fields=";
        //    encryptredirecturl += "&returnurl=" + encryptFile(returnURL, AESKEY);
        //    encryptredirecturl += "&Reference No=" + encryptFile(Reference_no, AESKEY);
        //    encryptredirecturl += "&submerchantid=" + encryptFile(sub_merchant_id, AESKEY);
        //    encryptredirecturl += "&transaction amount=" + encryptFile(pgamount, AESKEY);
        //    encryptredirecturl += "&paymode=" + encryptFile(Paymentmode, AESKEY);

        //    string TranRequest = encryptredirecturl;

        //    string URLAuth = "";
        //    //URLAuth = "https://eazypay.icicibank.com/EazyPG";
        //    URLAuth = encryptredirecturl;

        //    const string contentType = "application/x-www-form-urlencoded";
        //    System.Net.ServicePointManager.Expect100Continue = false;

        //    CookieContainer cookies = new CookieContainer();
        //    HttpWebRequest webRequest = WebRequest.Create(URLAuth) as HttpWebRequest;
        //    webRequest.Method = "POST";
        //    webRequest.ContentType = contentType;
        //    webRequest.CookieContainer = cookies;
        //    webRequest.ContentLength = TranRequest.Length;
        //    webRequest.UserAgent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.1) Gecko/2008070208 Firefox/3.0.1";
        //    webRequest.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";


        //    StreamWriter requestWriter = new StreamWriter(webRequest.GetRequestStream());
        //    requestWriter.Write(TranRequest);
        //    requestWriter.Close();

        //    string responseData = "";
        //    try
        //    {
        //        using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
        //        {
        //            responseData = responseReader.ReadToEnd();
        //        }
        //        webRequest.GetResponse().Close();
        //        Result = responseData;
        //    }
        //    catch (Exception ex)
        //    {
        //        if (ex is WebException)
        //        {
        //            WebResponse errResp = ((WebException)ex).Response;
        //            using (Stream respStream = errResp.GetResponseStream())
        //            {
        //                // read the error response
        //                Result = ex.Message + "< br />" + ex.StackTrace;
        //            }
        //        }
        //        else
        //        {
        //            Result = ex.Message + "< br />" + ex.StackTrace;
        //        }
        //    }
        //    //lblMsg.Text = Result;
        //    //Response.Write(Result);

        //    InsertLog(m_ServiceID,m_AppID,RequestHeader,RequestURL,PGName,Reference_no,merchantID,sub_merchant_id,pgamount,name,returnURL,PassKey,Param1,Param2,Param3,Param4,Param5,Createdby,CreatedOn,Modifiedby,ModifiedOn,redirecturl,encryptredirecturl,IsActive);


        //    Response.Redirect(URLAuth);
    }


    string encryptFile(string texttoencrypt, string key)
    {
        RijndaelManaged Rijndaelcipher = new RijndaelManaged();
        Rijndaelcipher.Mode = CipherMode.ECB;
        Rijndaelcipher.Padding = PaddingMode.PKCS7;
        Rijndaelcipher.KeySize = 0x80;
        Rijndaelcipher.BlockSize = 0x80;
        Byte[] pwdbytes = Encoding.UTF8.GetBytes(key);
        Byte[] keybytes = new byte[0x10];
        int len = pwdbytes.Length;
        if (len > keybytes.Length)
        {
            len = keybytes.Length;
        }
        Array.Copy(pwdbytes, keybytes, len);
        Rijndaelcipher.Key = keybytes;
        Rijndaelcipher.IV = keybytes;
        ICryptoTransform transform = Rijndaelcipher.CreateEncryptor();
        Byte[] plaintext = Encoding.UTF8.GetBytes(texttoencrypt);
        return Convert.ToBase64String(transform.TransformFinalBlock(plaintext, 0, plaintext.Length));
    }
 

    protected DataTable InsertLog(string ServiceID, string AppID, string RequestHeader, string RequestURL, string PGName, string ReferenceNo, string MerchantId, string SubMerchantId, string Amount, string m_ServiceTax, string m_PortalFee, string UserName, string ReturnURL, string PassKey, string Param1, string Param2, string Param3, string Param4, string Param5, string Createdby, string createdOn, string Modifiedby, string ModifiedOn, string BeforeEncryptionURL, string AfterEncryptionURL, int IsActive, string PGRetrunURL)
    {
        DataTable dt = new DataTable();

        string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

        SqlConnection con = new SqlConnection(connStr);
        //  string [] array = new  string [8] ;
        SqlCommand cmd = null;
        //  cmd = con.CreateCommand();
        cmd = new SqlCommand("PGRequestSP", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ServiceID", ServiceID);
        cmd.Parameters.AddWithValue("@AppID", AppID);
        cmd.Parameters.AddWithValue("@RequestHeader", RequestHeader);
        cmd.Parameters.AddWithValue("@RequestURL", RequestURL);
        cmd.Parameters.AddWithValue("@PGName", PGName);
        cmd.Parameters.AddWithValue("@ReferenceNo", ReferenceNo);
        cmd.Parameters.AddWithValue("@MerchantId", MerchantId);
        cmd.Parameters.AddWithValue("@SubMerchantId", SubMerchantId);
        cmd.Parameters.AddWithValue("@Amount", Amount);
        cmd.Parameters.AddWithValue("@ServiceTax", m_ServiceTax);
        cmd.Parameters.AddWithValue("@PortalFee", m_PortalFee);
        cmd.Parameters.AddWithValue("@UserName", UserName);
        cmd.Parameters.AddWithValue("@ReturnURL", ReturnURL);
        cmd.Parameters.AddWithValue("@PassKey", PassKey);
        cmd.Parameters.AddWithValue("@Param1", Param1);
        cmd.Parameters.AddWithValue("@Param2", Param2);
        cmd.Parameters.AddWithValue("@Param3", Param3);
        cmd.Parameters.AddWithValue("@Param4", Param4);
        cmd.Parameters.AddWithValue("@Param5", Param5);
        cmd.Parameters.AddWithValue("@Createdby", Createdby);
        cmd.Parameters.AddWithValue("@CreatedOn", createdOn);
        cmd.Parameters.AddWithValue("@Modifiedby", Modifiedby);
        cmd.Parameters.AddWithValue("@ModifiedOn", ModifiedOn);
        cmd.Parameters.AddWithValue("@BeforeEncryptionURL", BeforeEncryptionURL);
        cmd.Parameters.AddWithValue("@AfterEncryptionURL", AfterEncryptionURL);
        cmd.Parameters.AddWithValue("@IsActive", IsActive);
        cmd.Parameters.AddWithValue("@PGRetrunURL", PGRetrunURL);
        //SqlTransaction trans = null;
        try
        {

            con.Open();

            using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {

                dt.Load(rdr);
                //while (rdr.Read())
                //{

                //    //string  contactID = rdr[0].ToString();
                //    //string firstName = rdr[1].ToString();
                //    //Response.Write(firstName + " (" + contactID.ToString() + ")");
                //}

                //rdr.Close();
            }

            return dt;




            //string  modified = cmd.ExecuteScalar().ToString();


            // return   modified ;


        }
        //catch (Exception ex)
        //{
        //    // trans.Rollback();
        //    return ex ;

        //}
        finally
        {
            // trans.Dispose();
            // con.Dispose();
            con.Close();


        }


    }
    protected bool updatelog(string BeforeEncryptionURL, string AfterEncryptionURL, string refernceno)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

        SqlConnection con = new SqlConnection(connStr);
        string sql = "UPDATE PGRequestTB SET BeforeEncryptionURL = '" + BeforeEncryptionURL + "' , AfterEncryptionURL = '" + AfterEncryptionURL + "' Where  PGSequenceNo = '" + refernceno + "'";
        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = sql;
        cmd1.Parameters.AddWithValue("@BeforeEncryptionURL", BeforeEncryptionURL);
        cmd1.Parameters.AddWithValue("@AfterEncryptionURL", AfterEncryptionURL);

        try
        {

            con.Open();

            cmd1.ExecuteNonQuery();

            return true;



        }
        catch (Exception ex)
        {
            // trans.Rollback();
            return false;

        }
        finally
        {
            // trans.Dispose();
            // con.Dispose();
            con.Close();

        }

    }
    protected void PaymentICICI(object sender, EventArgs e)
    {
        if (Request.QueryString["AppID"] == null || Request.QueryString["SvcID"] == null || Request.QueryString["Amt"] == null || Request.QueryString["URL"] == null)
        {
            lblsms.Visible = true;
            lblsms.Text = "Invalid Request Parameter";//receive null then
            DIVPayment.Visible = false;
            return;
        }
        if (Request.QueryString["AppID"] == "" || Request.QueryString["SvcID"] == "" || Request.QueryString["Amt"] == "" || Request.QueryString["URL"] == "")
        {
            lblsms.Visible = true;
            lblsms.Text = "Blank Request Parameter";//recieve blank then
            DIVPayment.Visible = false;
            return;
        }
        //if (Request.QueryString["SvcID"] == null) return;
        //if (Request.QueryString["Amt"] == null) return;
        //if (Request.QueryString["URL"] == null) return;

        string merchantID, Paymentmode, BasicURL, returnURL, Reference_no, sub_merchant_id, pgamount, Mobile_No, city, name;
        name = "";
        string PG_Status = "";
        string NewReferenceNo = "";
        string Result = "";
        string redirecturl = "";  // this is to check what url is coming before encryption
        string encryptredirecturl = ""; //after encryption
        string RequestHeader = "";
        string RequestURL = "";
        string PGName = "ICICI";
        //string ReturnURL = "";
        string PassKey = "";
        string Param1 = "";
        string Param2 = "";
        string Param3 = "";
        string Param4 = "";
        string Param5 = "";
        string Createdby = "";
        string CreatedOn = "";
        string Modifiedby = "";
        string ModifiedOn = "";
        int IsActive = 0;
        // Decrypt(HttpUtility.UrlDecode(Request.QueryString["name"]));
        string m_AppID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["AppID"]));

        string m_ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["SvcID"]));
        string PGRetrunURL = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["URL"]));
        string Amount = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Amt"]));
        string m_PortalFee = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PortalFee"]));
        string m_ServiceTax = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["ServiceTax"]));

        Reference_no = m_AppID;

        Paymentmode = ConfigurationManager.AppSettings["PaymentMode"].ToString();
        merchantID = ConfigurationManager.AppSettings["ICIC_MerchantId"].ToString();
        sub_merchant_id = ConfigurationManager.AppSettings["ICICI_sub_merchant_id"].ToString();
        returnURL = ConfigurationManager.AppSettings["ICICI_ResponseURL"].ToString();
        BasicURL = ConfigurationManager.AppSettings["ICICI_BasicURL"].ToString();//https://eazypay.icicibank.com/EazyPG
        string AESKEY = ConfigurationManager.AppSettings["ICICI_AESKEY"].ToString();

        decimal TotalAmt = (decimal.Parse(Amount) +decimal.Parse(m_PortalFee)+ decimal.Parse(m_ServiceTax )); //(int.Parse(Amount) + (m_ServiceTax) + (m_PortalFee));
        pgamount = TotalAmt.ToString();

        IsActive = 1;

        DataTable dt2 = new DataTable();

        dt2 = InsertLog(m_ServiceID, m_AppID, RequestHeader, RequestURL, PGName, Reference_no, merchantID, sub_merchant_id, Amount, m_ServiceTax, m_PortalFee, name, returnURL, PassKey, Param1, Param2, Param3, Param4, Param5, Createdby, CreatedOn, Modifiedby, ModifiedOn, redirecturl, encryptredirecturl, IsActive, PGRetrunURL);



        PG_Status = dt2.Rows[0][0].ToString();
        NewReferenceNo = dt2.Rows[0][1].ToString();
        Reference_no = NewReferenceNo;

        if (PG_Status == "PG006")
        {
            
        string   SVCID =  HttpUtility.UrlEncode(KeyClass.Encrypt(m_ServiceID));
        string  REFNO = HttpUtility.UrlEncode(KeyClass.Encrypt(NewReferenceNo));
         string PGStatus = HttpUtility.UrlEncode(KeyClass.Encrypt(PG_Status));

            string t_URL = ConfigurationManager.AppSettings["SuccessUrl"].ToString();//"=" + ServiceID + "&AppID=" + ReferenceNo + "&Status=Y";
            string url = t_URL + "&SvcID=" + SVCID + "&PGSequence=" + REFNO + "&Status=" + PGStatus;
            Response.Redirect(url);
        }
        else
        {
            // Reference_no = NewReferenceNo;

            redirecturl += "merchantid=" + merchantID;
            redirecturl += "&mandatory fields=" + Reference_no + "|" + sub_merchant_id + "|" + pgamount;
            redirecturl += "&optional fields=" + "";
            redirecturl += "&returnurl=" + returnURL;
            redirecturl += "&Reference No=" + Reference_no;
            redirecturl += "&submerchantid=" + sub_merchant_id;
            redirecturl += "&transaction amount=" + pgamount;
            redirecturl += "&paymode=" + Paymentmode;


            encryptredirecturl += BasicURL;
            encryptredirecturl += "merchantid=" + merchantID;
            encryptredirecturl += "&mandatory fields=" + encryptFile(Reference_no + "|" + sub_merchant_id + "|" + pgamount, AESKEY);
            encryptredirecturl += "&optional fields=";
            encryptredirecturl += "&returnurl=" + encryptFile(returnURL, AESKEY);
            encryptredirecturl += "&Reference No=" + encryptFile(Reference_no, AESKEY);
            encryptredirecturl += "&submerchantid=" + encryptFile(sub_merchant_id, AESKEY);
            encryptredirecturl += "&transaction amount=" + encryptFile(pgamount, AESKEY);
            encryptredirecturl += "&paymode=" + encryptFile(Paymentmode, AESKEY);
            updatelog(redirecturl, encryptredirecturl, Reference_no);
            string TranRequest = encryptredirecturl;

            string URLAuth = "";
            //URLAuth = "https://eazypay.icicibank.com/EazyPG";
            URLAuth = encryptredirecturl;

            //const string contentType = "application/x-www-form-urlencoded";
            //System.Net.ServicePointManager.Expect100Continue = false;

            //CookieContainer cookies = new CookieContainer();
            //HttpWebRequest webRequest = WebRequest.Create(URLAuth) as HttpWebRequest;
            //webRequest.Method = "POST";
            //webRequest.ContentType = contentType;
            //webRequest.CookieContainer = cookies;
            //webRequest.ContentLength = TranRequest.Length;
            //webRequest.UserAgent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.1) Gecko/2008070208 Firefox/3.0.1";
            //webRequest.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";


            //StreamWriter requestWriter = new StreamWriter(webRequest.GetRequestStream());
            //requestWriter.Write(TranRequest);
            //requestWriter.Close();

            //string responseData = "";
            //try
            //{
            //    using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
            //    {
            //        responseData = responseReader.ReadToEnd();
            //    }
            //    webRequest.GetResponse().Close();
            //    Result = responseData;
            //}
            //catch (Exception ex)
            //{
            //    if (ex is WebException)
            //    {
            //        WebResponse errResp = ((WebException)ex).Response;
            //        using (Stream respStream = errResp.GetResponseStream())
            //        {
            //            // read the error response
            //            Result = ex.Message + "< br />" + ex.StackTrace;
            //        }
            //    }
            //    else
            //    {
            //        Result = ex.Message + "< br />" + ex.StackTrace;
            //    }
            //}
            //lblMsg.Text = Result;
            //Response.Write(Result);



            Response.Redirect(URLAuth);




        }


    }





</script>

<asp:content id="Content1" contentplaceholderid="head" runat="server">
    <link href="../g2c/css/style.admin.css" rel="stylesheet" />
 <link href="../g2c/css/style.css" rel="stylesheet" />
    <link href="../g2c/css/hmepge.bootstrap.css" rel="stylesheet" />


    <style>
        #cphbody_lblsms {
            text-align: center;
            position: absolute;
            bottom: 2;
            color: red;
            font-size: 17px;
        }
    </style>
</asp:content>
<asp:content id="Content2" contentplaceholderid="cphbody" runat="server">
  <%--  --%>
    <div class="row mbtm10">
          
         
              <div class="container mtop15 mbtm15">
                  
              <div class="pymntbox_hd">Choose Payment Options</div>
                  <div class="col-lg-12 pymntbox_bdr3 pleft0 pright0 pbottom15">
              <div class="pymntbox_subhd">
                  <div class="col-xs-10 ptop10"><p>Debit / Credit Card</p></div>
                 
                  <div class="col-xs-2 ptop15">
                      
                      <img src="../g2c/img/payment_prvdr.png"/>
                         
                  </div>
                  
              </div>
                      <div class="w98">
                           <asp:Label ID="lblsms"  runat="server" Visible="false"></asp:Label>
                          <a href="#">
                          <div id="DIVPayment" runat="server" class="col-md-8 bnklstbox pymntbox_bdr2 mtop20 mbtm20">
                              <div class="col-xs-3 bnklogo_rghtbdr ptop5 pbottom10">
                                   
                                  <asp:LinkButton ID="lnk" runat="server" OnClick="PaymentICICI">
                                  <img src="../g2c/img/icici_bnklogo.png" />
                                       </asp:LinkButton>
                                      </div>
                              <div class="col-xs-9 ptop10" style="color:#212121;">
                                  Debit Card - (Below INR 2000/-) - 0.75% Processing Fee, (Above INR 2000/-) - 1.00% Processing Fee<br />
Credit Card - 1.05% Processing Fee
                              </div>
                             <%--  <div class="col-xs-3 bnklogo_rghtbdr ptop5 pbottom10">
                                  <asp:LinkButton ID="LinkButton1" runat="server" OnClick="PaymentKOTAK">
                                  <img src="../g2c/img/KOTAK_BNK_logo.png" />
                                       </asp:LinkButton>
                                      </div>
                              <div class="col-xs-9 ptop10" style="color:#212121;">
                                  Debit Card - (Below INR 2000/-) - 0.75% Processing Fee, (Above INR 2000/-) - 1.00% Processing Fee<br />
Credit Card - 1.05% Processing Fee
                              </div>--%>
                          </div>
                          </a>
                      </div>
               </div>
                  </div>
           
          
</div>
</asp:content>
