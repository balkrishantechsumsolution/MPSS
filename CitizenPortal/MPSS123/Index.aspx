<%@ Page Title="" Language="C#" MasterPageFile="~/MPSS/Masters/Default.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CitizenPortal.MPSS.Index" %>

<%@ Register Src="~/MPSS/Controls/TopHeader.ascx" TagPrefix="uc1" TagName="TopHeader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <uc1:topheader runat="server" id="TopHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Hello
</asp:Content>
