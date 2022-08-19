<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultAuth.aspx.cs" Inherits="CitizenPortal.UID.DefaultAuth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <input type="hidden" id="hdnAuthRequestUrl" value="<%=CitizenPortal.Common.GlobalValues.RootUrl+"AuthRequest.aspx"%>" />
    <form id="form1" runat="server">
    <div>
    <div style="padding-top:10px;text-align:center">
            <h1>Auth WebForms Test Application</h1>
        </div>

        <div style="padding-top:20px">
            <table style="margin-left:auto;margin-right:auto">
                <tr>
                    <td style="padding-right:10px">
                        Aadhaar Number: 
                    </td>
                    <td>
                        <input type="text" id="txtAadhaarNo"/>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top:10px">
                        <span style="font-family:Arial, Helvetica, sans-serif; color:#000000; font-size:14px;"> Auth Type : </span>
                    </td>
                    <td style="padding-top:10px">
                        <input type="checkbox" id="chkIris" name="chkIris" value="IIR"/>Iris
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="checkbox" id="chkFP" name="chkFP" value="FMR"/>Fingerprint
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="checkbox" id="chkOTP" name="chkOTP" value="OTP"/>One Time Password
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="checkbox" id="chkReturnOnlyOnSuccess" name="chkReturnOnlyOnSuccess"/>Return Only on Successful Authentication
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input id="btnProceed" type="button" onclick="onProceed()" value="Proceed"/>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>        
        <script src="/Scripts/jquery-2.2.3.min.js"></script>
        <script type="text/javascript">
            function onProceed() {
                //var urlToForward = '/UID/' + $('#hdnAuthRequestUrl').val() + '?aadhaarNumber=' + $('#txtAadhaarNo').val() + '&authTypesToUse=' + GetAuthTypesToUse() + '&ReturnOnlyOnSuccess=' + getReturnOnlyOnSuccess() + '&transactionId=<%=Guid.NewGuid().ToString()%>';
                var urlToForward = '/UID/AuthRequest.aspx' + '?aadhaarNumber=' + $('#txtAadhaarNo').val() + '&authTypesToUse=' + GetAuthTypesToUse() + '&ReturnOnlyOnSuccess=' + getReturnOnlyOnSuccess() + '&transactionId=<%=Guid.NewGuid().ToString()%>';
                window.location = urlToForward;
            }

            function GetAuthTypesToUse() {
                var authTypesToUse = "";
                if ($('#chkIris').is(':checked'))
                    authTypesToUse = "IIR,";
                if ($('#chkFP').is(':checked'))
                    authTypesToUse = authTypesToUse + "FMR,";
                if ($('#chkOTP').is(':checked'))
                    authTypesToUse = authTypesToUse + "OTP,";

                authTypesToUse = authTypesToUse.slice(0, -1);

                return authTypesToUse;
            }

            function getReturnOnlyOnSuccess() {
                if ($('#chkReturnOnlyOnSuccess').is(':checked'))
                    return "True";
                return "False";
            }
        </script>
    </div>
    </form>
</body>
</html>
