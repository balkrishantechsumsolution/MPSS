<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="MasterDataTable.aspx.cs" Inherits="CitizenPortal.WebApp.Login.MasterDataTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script src="js/jquery-1.12.3.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/dataTables.jqueryui.min.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet" />--%>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />

    <script type="text/javascript" lang="javascript">
        $(function () {
            debugger;
            $("#DataGridView").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
            $('#DataGridView').DataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1">
        <title></title>
    </head>
    <body>
        <div>
            <asp:GridView ID="DataGridView" Font-Names="Calibri" Font-Size="11pt" AutoGenerateColumns="false" OnPreRender="DataGridView_PreRender" runat="server"></asp:GridView>
        </div>
    </body>
    </html>
</asp:Content>
