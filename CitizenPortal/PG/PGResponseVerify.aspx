<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PGResponseVerify.aspx.cs" Inherits="CitizenPortal.PG.PGResponseVerify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .btn-btn-primary {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button  ID="btnUpdate" runat="server" CssClass="btn-btn-primary" Text="Update In Response"  OnClick="btnUpdate_Click"/>
        </div>
        <div>

     <asp:Button  ID="BtnUpdateRequest" runat="server" CssClass="btn-btn-primary" Text="Update In Request" Width="176px" OnClick="BtnUpdateRequest_Click"/>
    </div>
    </form>
</body>
</html>
