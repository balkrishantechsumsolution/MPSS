<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthResponse.aspx.cs" Inherits="CitizenPortal.UID.AuthResponse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%="" %>
    <%
    string transactionstatus = Request.Params["transactionstatus"];
    string encsessionkey = Request.Params["sessionkey"];
    string enctransactionid = Request.Params["transactionid"];

    string clientKeyFile = HttpContext.Current.Server.MapPath(".\\G2COnline_Services.pfx");
    string transactionId = CSCAadhaarClientCryptoLib.ClientCrypto.DecryptTransactionId(clientKeyFile, "Welcome@3", encsessionkey, enctransactionid);
        
    if(transactionstatus== "2")
    {
%>
        <div> Transaction <%= transactionId %> is Cancelled! </div>
<%  }
    else
    {
        if (Application["AuthCache"] == null)
        {
            Application["AuthCache"] = new System.Collections.Generic.Dictionary<string, CSCAadhaarClientCryptoLib.AuthResponseData>();
        }

        System.Collections.Generic.Dictionary<string, CSCAadhaarClientCryptoLib.AuthResponseData> authCache = Application["AuthCache"] as System.Collections.Generic.Dictionary<string, CSCAadhaarClientCryptoLib.AuthResponseData>;
        if(!authCache.ContainsKey(transactionId))
        {
%>
            <div> Transaction <%= transactionId %> is unknown! </div>
<%
        }
        else
        {
            //Display Auth Results here
            CSCAadhaarClientCryptoLib.AuthResponseData response = authCache[transactionId];
            
            if(response.AuthData.isSuccess)
            {
%>
            Authentication Successful
<%                
            }
            else
            {
%>
            Authentication Failed. Reason: <%=response.AuthData.statusMessage%>
<%
            }
        }        
    }
%>
    </div>
    </form>
</body>
</html>
