<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Master/G2G.Master" AutoEventWireup="true" CodeBehind="ShowPDF.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.ShowPDF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="page-wrapper" style="overflow:auto">
        <asp:Button ID="btnBack" runat="server" CssClass="buton" Text="Back to Dashboard" OnClick="btnBack_Click"
            Style="margin: 20px auto 0; position: absolute;" Visible="false"/>
        <div style="z-index: 9999; height: auto; width: 100%; overflow: auto; padding-top: 25px;"
            id="divrpt" runat="server">
            <asp:Label ID="lblerrmsg" runat="server" Visible="false" CssClass="lbl_Validator" />
            <embed runat="server" id="iframepdf" height="500px"  width="100%" wmode="transparent"
                style="z-index: 1; cursor: none;"></embed>
        </div>
    </div>
</asp:Content>
