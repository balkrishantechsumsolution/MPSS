<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncryptAllDBValue.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.Test.EncryptAllDBValue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <table style="width:50%"><tr><td>Get All Values </td><td>
           <asp:Button ID="btnAllData" runat="server" Text="Get All UserId/Password" OnClick="btnAllData_Click"  />
           <asp:Button ID="btnEncrypt" runat="server" Text="EncryptAll" OnClick="btnEncrypt_Click"    />
                                                            </td>
           </tr>
           <tr><td>

               <asp:GridView ID="grdUser" runat="server"></asp:GridView>
               </td></tr>
           </table>
        
    </form>
</body>
</html>
