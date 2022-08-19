<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="auths2s.aspx.cs" Inherits="CitizenPortal.UID.auths2s" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%
    /***** Generate the required values to pass to the e-KYC service  *****/
    string transactionStatus = Request.Params["TransactionStatus"];
    string enccscTransactionId = Request.Params["CSCTransactionId"];
    string enctransactionId = Request.Params["TransactionId"];
    string encAuthTypeUsed = Request.Params["AuthTypeUsed"];
    string encudf1 = Request.Params["UDF1"];
    string encudf2 = Request.Params["UDF2"];
    string encudf3 = Request.Params["UDF3"];
    string encudf4 = Request.Params["UDF4"];
    string encudf5 = Request.Params["UDF5"];
    string encauthData = Request.Params["AuthData"];
    string encsessionKey = Request.Params["SessionKey"];

    CSCAadhaarClientCryptoLib.AuthResponseData response = null;
    try
    {
        string clientKeyFile = HttpContext.Current.Server.MapPath(".\\G2COnline_Services.pfx");

        response = CSCAadhaarClientCryptoLib.ClientCrypto.DecryptAuthResponseData(clientKeyFile, "G@C0nline", encsessionKey,
            transactionStatus, enctransactionId, enccscTransactionId, encAuthTypeUsed, encudf1, encudf2, encudf3, encudf4, encudf5, encauthData);
    }
    catch { }

    if (Application["AuthCache"] == null)
    {
        Application["AuthCache"] = new System.Collections.Generic.Dictionary<string, CSCAadhaarClientCryptoLib.AuthResponseData>();
    }

    System.Collections.Generic.Dictionary<string, CSCAadhaarClientCryptoLib.AuthResponseData> authCache = Application["AuthCache"] as System.Collections.Generic.Dictionary<string, CSCAadhaarClientCryptoLib.AuthResponseData>;
    authCache[response.TransactionId] = response;
%>
    </div>
    </form>
</body>
</html>
