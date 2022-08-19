<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SMSTest.aspx.cs" Inherits="CitizenPortal.WebApp.SMSTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div >

        <h3>Email Test</h3>
         <asp:Label ID="Label1" runat="server" Text="To"></asp:Label>
        <asp:TextBox ID="txtMailID" runat="server"></asp:TextBox>
       <asp:Label ID="Label2" runat="server" Text="Subject"></asp:Label>
        <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
        
    </div>
      <div>   <asp:Label ID="Label3" runat="server" Text="Body"></asp:Label> 




     <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine"></asp:TextBox>    </div>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Email Send" OnClick="Button1_Click" />
        </div>
        <h3> SMS Test</h3>
        <div>
            <asp:Label ID="Label4" runat="server" Text="MobileNo"></asp:Label>
            <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="Message"></asp:Label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
        &nbsp;Template ID
            <asp:TextBox ID="txtTemplateID" runat="server"></asp:TextBox>
        </div>
         <div>
            <asp:Button ID="Button2" runat="server" Text="SMS Send" OnClick="Button2_Click" />
        </div>

       
        
    </form>
</body>
</html>
