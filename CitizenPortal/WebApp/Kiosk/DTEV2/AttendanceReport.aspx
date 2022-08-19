<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="AttendanceReport.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DTEV2.AttendanceReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../Login/js/jquery-2.2.3.min.js"></script>
    <script src="../../Login/js/jquery.dataTables.min.js"></script>
    <%--<script src="../../Login/js/JqueryDT.js"></script>--%>
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

    <script type="text/javascript">
        $(document).ready(function () {
            var table = $("table[id$='DataGridView']").DataTable({
                "processing": true,
                "ServerSide": true,
                //scrollX:        500,
                //deferRender:    true,
                scroller: {
                    loadingIndicator: true
                },
                //scroller:       true,
                "iDisplayLength": 10,
                "bDestroy": true,
                "bInfo": true,
                "bFilter": true,
                "bSort": true,
            });

            $("table[id$='DataGridView'] thead th").each(function () {
                var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
                $(this).html('<input type="text" placeholder="' + title + '" />');
            });

            $("div[id$='LoadingDiv']").hide(800);
            $("div[id$='DisplayGrid']").show(800);
            $("div[id$='DisplayGrid']").css("width:100% !important");

            table.columns().every(function () {
                var dataTableColumn = this;
                var searchTextBoxes = $(this.header()).find('input');
                searchTextBoxes.on('keyup change', function () {
                    dataTableColumn.search(this.value).draw();
                });
                searchTextBoxes.on('click', function (e) {
                    e.stopPropagation();
                });
            });
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h1>Attendance Report</h1>
            </div>
        </div>

        <div class="row text-center" id="LoadingDiv" runat="server">
            <div>Please Wait While Data Is Being Loaded...</div>
            <img src="../../Login/Loading_hourglass_88px.gif" />
        </div>

        <div class="row" id="DisplayGrid" style="display: none" runat="server">
            <div class="col-lg-12">
                <asp:GridView ID="DataGridView" AutoGenerateColumns="false" OnPreRender="DataGridView_PreRender" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
