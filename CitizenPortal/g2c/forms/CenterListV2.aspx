<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="CenterListV2.aspx.cs" Inherits="CitizenPortal.g2c.forms.CenterListV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../WebApp/Login/js/JqueryDT.js"></script>
    <style>
        tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
        }
        #cphbody_DataGridView {
            width: 100% !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h1>CSC Center List</h1>
            </div>
        </div>

        <div class="row text-center" id="LoadingDiv" runat="server">
            <div>Please Wait While Data Is Being Loaded...</div>
            <img src="../../WebApp/Login/Loading_hourglass_88px.gif" />
        </div>

        <div class="row" id="DisplayGrid" style="display: none" runat="server">
            <div class="col-lg-12">
                <asp:GridView ID="DataGridView" AutoGenerateColumns="false" OnPreRender="DataGridView_PreRender" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
