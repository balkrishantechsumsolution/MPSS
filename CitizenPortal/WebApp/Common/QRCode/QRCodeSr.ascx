<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QRCodeSr.ascx.cs" Inherits="CitizenPortal.WebApp.Common.QRCode.QRCodeSr" %>
            <asp:PlaceHolder ID="plBarCode" runat="server" />
            <%--<asp:Image ID="imgQRCode" runat="server" ImageUrl="/Quick Links/PortalImages/no-image-available.jpg" Width="90px" />--%>
             <asp:HiddenField ID="HdnImageBytes" runat="server" />