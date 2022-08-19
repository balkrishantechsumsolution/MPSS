<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KycRequest.aspx.cs" Inherits="CitizenPortal.UID.KycRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script src="../Scripts/jquery-2.2.3.min.js"></script>
<form id="frmMain" runat="server" method="post">
    <%
        /***** Generate the required values to pass to the e-KYC service  *****/
        string clientId = "ODS-AUA";
        string transactionId = Request.Params["transactionId"];
        string aadhaarNumber = Request.Params["aadhaarNumber"];
        string kycTypesToUse = Request.Params["kycTypesToUse"];
        string udf1 = null;
        string udf2 = null;
        string udf3 = null;
        string udf4 = null;
        string udf5 = null;
        bool returnAadhaarResponseFormat = false;
        string clientKeyFile = HttpContext.Current.Server.MapPath("/UID/CSC SPV.cer");

        CSCAadhaarClientCryptoLib.EncryptedEKycRequestData eReq = CSCAadhaarClientCryptoLib.ClientCrypto.EncryptKycRequestData(clientKeyFile, aadhaarNumber, transactionId,
            kycTypesToUse, udf1, udf2, udf3, udf4, udf5, returnAadhaarResponseFormat);
    %>
        <input id="ClientID" name="ClientID" type="hidden" value="<%=clientId%>" />
        <input id="SessionKey" name="SessionKey" type="hidden" value="<%=eReq.EncryptedSessionKey%>" />
        <input id="AadhaarNumber" name="AadhaarNumber" type="hidden" value="<%=eReq.EncryptedAadhaarNumber%>"/>
        <input id="TransactionId" name="TransactionId" type="hidden" value="<%=eReq.EncryptedTransactionId%>" />
        <input id="KycType" name="KycType" type="hidden" value="<%=eReq.EncryptedKycType%>" />
        <input id="ReturnAadhaarResponseFormat" name="ReturnAadhaarResponseFormat" type="hidden" value="<%=eReq.EncryptedReturnAadhaarResponseFormat%>" />
    <%
        if(!String.IsNullOrEmpty(udf1))
        {
    %>
        <input id="UDF1" name="UDF1" type="hidden" value="<%=eReq.EncryptedUDF1%>" />
    <%
        } 

        if(!String.IsNullOrEmpty(udf2))
        {
    %>
        <input id="UDF2" name="UDF2" type="hidden" value=" <%=eReq.EncryptedUDF2%>" />
    <%
        } 
    %>
    </form>
    <script type="text/javascript">
        //submit the form to do kyc
        frmMain.action = '<%=CitizenPortal.Common.GlobalValues.KycUrl%>';
        document.getElementById("frmMain").submit();
    </script>
</body>
</html>
