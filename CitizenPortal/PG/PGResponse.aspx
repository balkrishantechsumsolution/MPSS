<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PGResponse.aspx.cs" Inherits="CitizenPortal.PG.PGResponse" %>

<%@ Import Namespace="CitizenPortalLib" %>
<%@ Import Namespace="CitizenPortalLib.BLL" %>
<%@ Import Namespace="CitizenPortalLib.DataStructs" %>
<%@ Import Namespace="CitizenPortal.Models" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    string t_URL = "";

    protected void Page_Load_new(object sender, EventArgs e)
    {
        string ServiceID = "";
        string AppID = "";
        string RefID = "";
        string TransDate = "";
        string Amount = "";
        string PMode = "";
        string PGName = "";
        decimal DecimalAmount = 00.0M;
        ConfirmPaymentBLL m_ConfirmPaymentBLL = new ConfirmPaymentBLL();

        string data = "";

        data = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["data"]));

        System.Collections.Specialized.NameValueCollection Items = HttpUtility.ParseQueryString(data);


        string PGstatus = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["Status"]));
        if (PGstatus == "E000")
        {

            ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["SvcID"]));
            AppID = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["AppID"]));
            RefID = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["TransID"]));
            TransDate = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["Transdate"]));
            Amount = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["TransAmt"]));
            PMode = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["PaymentMode"]));
            PGName = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["PGName"]));
            DecimalAmount =Convert.ToDecimal(Amount);
        }
        else {

            ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["SvcID"]));
            AppID = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["AppID"]));
            RefID = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["TransID"]));
            TransDate = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["Transdate"]));
            PMode = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["PaymentMode"]));
            PGName = KeyClass.Decrypt(HttpUtility.UrlDecode(Items["PGName"]));

        }

        string Result = "";
        string[] AFields = {
                "ServiceID"
                , "AppID"
                ,"ReferenceNo"
                , "CreatedBy"
                , "BankResponseCode"
                , "PGName"
                , "PGStatus"
                , "Amount"
                , "ServiceTax"
               , "PortalFee"
               ,"Bank_TransDate"
                };

        PGAppResponse_DT ObjPGAppResponse_DT = new PGAppResponse_DT();
        ObjPGAppResponse_DT.AppID = AppID;
        ObjPGAppResponse_DT.ServiceID = ServiceID;
        ObjPGAppResponse_DT.ReferenceNo = RefID;
        ObjPGAppResponse_DT.PGName = PGName;
        ObjPGAppResponse_DT.BankResponseCode = PGstatus;
        ObjPGAppResponse_DT.CreatedBy = AppID;
        ObjPGAppResponse_DT.PGStatus = PGstatus;
        ObjPGAppResponse_DT.Amount = DecimalAmount;
        ObjPGAppResponse_DT.ServiceTax = 0.00M;
        ObjPGAppResponse_DT.PortalFee = 0.00M;
        ObjPGAppResponse_DT.Bank_TransDate = TransDate;
        Result = m_ConfirmPaymentBLL.PGAppResponseInsert(ObjPGAppResponse_DT, AFields);
        string URl = ConfigurationManager.AppSettings["SuccessUrl"].ToString();
        t_URL += URl+"?" + Request.QueryString.ToString();

        Response.Redirect(t_URL);

    }

    //2020-03-14 For Old PG Response Logic
    protected void Page_Load(object sender, EventArgs e)
    {
        string ServiceID = "";
        string AppID = "";
        string RefID = "";
        string TransDate = "";
        string Amount = "";
        string PMode = "";
        string PGName = "";
        decimal DecimalAmount = 00.0M;
        ConfirmPaymentBLL m_ConfirmPaymentBLL = new ConfirmPaymentBLL();
        string PGstatus = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Status"]));
        if (PGstatus == "E000")
        {

            ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["SvcID"]));
            AppID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["AppID"]));
            RefID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["TransID"]));
            TransDate = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Transdate"]));
            Amount = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["TransAmt"]));
            PMode = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PaymentMode"]));
            PGName = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PGName"]));
            DecimalAmount =Convert.ToDecimal(Amount);
        }
        else {

            ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["SvcID"]));
            AppID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["AppID"]));
            RefID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["TransID"]));
            TransDate = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["Transdate"]));
            PMode = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PaymentMode"]));
            PGName = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["PGName"]));

        }

        string Result = "";
        string[] AFields = {
                "ServiceID"
                , "AppID"
                ,"ReferenceNo"
                , "CreatedBy"
                , "BankResponseCode"
                , "PGName"
                , "PGStatus"
                , "Amount"
                , "ServiceTax"
               , "PortalFee"
               ,"Bank_TransDate"
                };

        PGAppResponse_DT ObjPGAppResponse_DT = new PGAppResponse_DT();
        ObjPGAppResponse_DT.AppID = AppID;
        ObjPGAppResponse_DT.ServiceID = ServiceID;
        ObjPGAppResponse_DT.ReferenceNo = RefID;
        ObjPGAppResponse_DT.PGName = PGName;
        ObjPGAppResponse_DT.BankResponseCode = PGstatus;
        ObjPGAppResponse_DT.CreatedBy = AppID;
        ObjPGAppResponse_DT.PGStatus = PGstatus;
        ObjPGAppResponse_DT.Amount = DecimalAmount;
        ObjPGAppResponse_DT.ServiceTax = 0.00M;
        ObjPGAppResponse_DT.PortalFee = 0.00M;
        ObjPGAppResponse_DT.Bank_TransDate = TransDate;
        Result = m_ConfirmPaymentBLL.PGAppResponseInsert(ObjPGAppResponse_DT, AFields);

        try
        {            
            if (PGstatus == "E000")
            {
                DataTable dt_SMS = new DataTable();
                dt_SMS = m_ConfirmPaymentBLL.GetPaymentSMSData(AppID, ServiceID);

                if (dt_SMS.Rows.Count > 0)
                {
                    string t_Mobile = "", t_SMSText = "";
                    CitizenPortalLib.EMailSMS SMS = new CitizenPortalLib.EMailSMS();

                    for (int i = 0; i < dt_SMS.Rows.Count; i++)
                    {
                        t_Mobile = dt_SMS.Rows[i]["Mobile"].ToString();
                        t_SMSText = dt_SMS.Rows[i]["SMSText"].ToString();

                        if (t_Mobile != "" && t_SMSText != "")
                        {
                            SMS.sendsms(t_Mobile, t_SMSText);
                        }
                    }
                }
            }
        }
        catch (Exception)
        {
        }

        string URl = ConfigurationManager.AppSettings["SuccessUrl"].ToString();
        t_URL += URl+"?" + Request.QueryString.ToString();

        Response.Redirect(t_URL);

    }



</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
