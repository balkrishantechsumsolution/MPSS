<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kycs2s.aspx.cs" Inherits="CitizenPortal.UID.kycs2s" %>

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
    string encKycTypeUsed = Request.Params["eKYCTypeUsed"];
    string encudf1 = Request.Params["UDF1"];
    string encudf2 = Request.Params["UDF2"];
    string encudf3 = Request.Params["UDF3"];
    string encudf4 = Request.Params["UDF4"];
    string encudf5 = Request.Params["UDF5"];
    string enckycData = Request.Params["KycData"];
    string encsessionKey = Request.Params["SessionKey"];

    CSCAadhaarClientCryptoLib.EKycResponseData response = null;
    try
    {
        string clientKeyFile = HttpContext.Current.Server.MapPath("/UID/G2COnline_Services.pfx");

        response = CSCAadhaarClientCryptoLib.ClientCrypto.DecryptKycResponseData(clientKeyFile, "G@C0nline", encsessionKey,
            transactionStatus, enctransactionId, enccscTransactionId, encKycTypeUsed, encudf1, encudf2, encudf3, encudf4, encudf5, enckycData);
    }
    catch { }

    if (Application["KycCache"] == null)
    {
        Application["KycCache"] = new Dictionary<string, CSCAadhaarClientCryptoLib.EKycResponseData>();
    }

    Dictionary<string, CSCAadhaarClientCryptoLib.EKycResponseData> kycCache = Application["KycCache"] as Dictionary<string, CSCAadhaarClientCryptoLib.EKycResponseData>;
    kycCache[response.TransactionId] = response;
%>
    </div>
    </form>
</body>
</html>
