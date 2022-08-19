<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Decoder.aspx.cs" Inherits="CitizenPortal.WebApp.Common.QRCode.Decoder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-bottom: 10px;
            margin-top: 30px; width: 500px;">
            <tr>
                <td width="26" style="height: 25px">
                    <img width="26" height="26" /></td>
                <td style="height: 25px">
                    &nbsp;</td>
                <td width="26" style="height: 25px">
                    <img width="26" height="26" /></td>
            </tr>
            <tr>
                <td width="26">
                    &nbsp;</td>
                <td>
                    <table border="1" bordercolor="#cdcdcd" cellpadding="3" cellspacing="0" style="border-collapse: collapse"
                        width="100%">
                        <tr>
                            <td>
                                Upload QR Code Image</td>
                            <td>
                                <asp:FileUpload ID="QRFileUpload" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:TextBox ID="txtDecodedData" runat="server" Height="66px" TextMode="MultiLine"
                                    Width="630px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="btnDecode" runat="server" Text="Decode" OnClick="btnDecode_Click" /></td>
                        </tr>
                    </table>
                </td>
                <td width="26">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="26">
                    <img width="26" height="26" /></td>
                <td>
                    &nbsp;</td>
                <td width="26">
                    <img width="26" height="26" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
