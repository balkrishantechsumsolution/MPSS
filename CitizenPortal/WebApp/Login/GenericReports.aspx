<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="GenericReports.aspx.cs" Inherits="CitizenPortal.WebApp.Login.GenericReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../WebApp/Login/js/JqueryDT.js" type="text/javascript"></script>
    <style>
        .dataTables_empty {
            display: none !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h1>CSC Center List<%--<span style="float: right;">
                    <asp:Button ID="link_1" runat="server" CssClass="success" Text="Link 1" style="margin-right: 20px; " OnClick="link_1_Click"/>
                    <asp:Button ID="Link_2" runat="server" CssClass="success" Text="Link 2" style="margin-right:20Px; "/>
                </span>--%>
                </h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="DataGridView" AutoGenerateColumns="false" OnPreRender="DataGridView_PreRender" runat="server">
                    <EmptyDataTemplate>
                        <div style="font-size: 18px; color:#ffffff; text-align: center">
                            No records found!!!.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
