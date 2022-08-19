<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CitizenPortal.WebApp.Common.QRCode.index" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" language="javascript" src="/Portal/headers/printFunction.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="PrintContent">
            <table align="center" width="30%">
                <tr>
                    <td align="center" colspan="2" style="width: 10px">
                        <uc1:QRCode ID="QRCode1" runat="server"></uc1:QRCode>
                    </td>
                </tr>
                <tr>
                    <td>SERVICE  :</td>
                    <td>
                        <asp:TextBox ID="txtServiceName" runat="server" MaxLength="15"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>APP NO :</td>
                    <td>
                        <asp:TextBox ID="txtAppNo" runat="server" MaxLength="10"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>ID :</td>
                    <td>
                        <asp:TextBox ID="txtTransId" runat="server" MaxLength="10"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>DATE :</td>
                    <td>
                        <asp:TextBox ID="txtTransdt" runat="server" MaxLength="10"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>AMOUNT :</td>
                    <td>
                        <asp:TextBox ID="txtTransAmt" runat="server" MaxLength="4"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>KIOSK ID :</td>
                    <td>
                        <asp:TextBox ID="txtChannelId" runat="server" MaxLength="10"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">OR</td>
                </tr>
                <tr>
                    <td>Enter Code</td>
                    <td>
                        <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div align="center">
            <asp:Button ID="lblQRCode" runat="server" Text="Generate QR" OnClick="lblQRCode_Click" />
            <input id="btnPrint" runat="server" onclick="javascript: PrintWithCSS('/Portal/Examinations/OpenSchool/OSPrintform.css');"
                style="width: 150px;" type="submit" value="Print" class="button" />
        </div>
    </form>
</body>
</html>
