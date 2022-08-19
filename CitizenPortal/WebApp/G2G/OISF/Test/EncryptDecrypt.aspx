<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncryptDecrypt.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.Test.EncryptDecrypt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <table style="width:50%"><tr><td>&nbsp;Enter Clear Text Value</td><td>
       <asp:TextBox ID="txtEncrypt" runat="server"></asp:TextBox>
       <asp:Button ID="btnEncyptConvert" runat="server" Text="Convert to Encrypt" OnClick="btnEncyptConvert_Click" />
       <asp:Label ID="lblEncrypt" runat="server" Text=""></asp:Label>
       </td></tr>
       <tr><td>Enter Encrypted Value</td><td>  <asp:TextBox ID="txtDecrypt" runat="server"></asp:TextBox>
       <asp:Button ID="btnDecryptConvert" runat="server" Text="Convert to Decrypt" OnClick="btnDecryptConvert_Click" />
            <asp:Label ID="lblDecrypt" runat="server" Text=""></asp:Label>
                                         </td></tr>
   </table>
    </form>
</body>
</html>
