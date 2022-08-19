<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthRequest.aspx.cs" Inherits="CitizenPortal.UID.AuthRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-2.2.3.min.js"></script>
</head>
<body>
    <form id="frmMain" runat="server">
    <div>
    <%
        /***** Generate the required values to pass to the Auth service  *****/
        string clientId = "ODS-AUA";
        string transactionId = Request.Params["transactionId"];
        string aadhaarNumber = Request.Params["aadhaarNumber"];
        string authTypesToUse = Request.Params["authTypesToUse"];
        bool returnOnlyOnSuccess = Convert.ToBoolean(Request.Params["ReturnOnlyOnSuccess"]);
        string udf1 = null;
        string udf2 = null;
        string udf3 = null;
        string udf4 = null;
        string udf5 = null;
        string clientKeyFile = HttpContext.Current.Server.MapPath("/UID/G2COnline_Services.cer");

        CSCAadhaarClientCryptoLib.EncryptedAuthRequestData eReq = CSCAadhaarClientCryptoLib.ClientCrypto.EncryptAuthRequestData(clientKeyFile, aadhaarNumber, transactionId,
            authTypesToUse, returnOnlyOnSuccess, udf1, udf2, udf3, udf4, udf5);
    %>
        <input id="ClientID" name="ClientID" type="hidden" value="<%=clientId%>" />
        <input id="SessionKey" name="SessionKey" type="hidden" value="<%=eReq.EncryptedSessionKey%>" />
        <input id="AadhaarNumber" name="AadhaarNumber" type="hidden" value="<%=eReq.EncryptedAadhaarNumber%>"/>
        <input id="TransactionId" name="TransactionId" type="hidden" value="<%=eReq.EncryptedTransactionId%>" />
        <input id="AuthType" name="AuthType" type="hidden" value="<%=eReq.EncryptedAuthType%>" />
        <input id="ReturnOnlyOnSuccess" name="ReturnOnlyOnSuccess" type="hidden" value="<%=eReq.EncryptedReturnOnlyOnSuccess%>" />
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
        if(!String.IsNullOrEmpty(udf3))
        {
    %>
        <input id="UDF3" name="UDF3" type="hidden" value=" <%=eReq.EncryptedUDF3%>" />
    <%
        } 
        if(!String.IsNullOrEmpty(udf4))
        {
    %>
        <input id="UDF4" name="UDF4" type="hidden" value=" <%=eReq.EncryptedUDF4%>" />
    <%
        } 
        if(!String.IsNullOrEmpty(udf5))
        {
    %>
        <input id="UDF5" name="UDF5" type="hidden" value=" <%=eReq.EncryptedUDF5%>" />
    <%
        } 
    %>
    </div>
    </form>
    <script type="text/javascript">
        //submit the form to do auth
        frmMain.action = '<%= CitizenPortal.Common.GlobalValues.AuthUrl%>';
        document.getElementById("frmMain").submit();
    </script>
</body>
</html>
