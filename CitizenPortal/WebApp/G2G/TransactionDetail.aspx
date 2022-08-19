<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionDetail.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.TransactionDetail" %>

<%@ Register Src="~/g2c/controls/tophead.ascx" TagPrefix="uc1" TagName="tophead" %>
<%@ Register Src="~/g2c/controls/mainhead.ascx" TagPrefix="uc1" TagName="mainhead" %>
<%@ Register Src="~/g2c/controls/topnavigation.ascx" TagPrefix="uc1" TagName="topnavigation" %>
<%@ Register Src="~/g2c/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../g2c/css/style.css" rel="stylesheet" />
    <link href="../../g2c/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/WebApp/Citizen/Forms/Js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <link href="/WebApp/Citizen/Forms/Css/dataTables.jqueryui.min.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {

            $('#DateFrom').datepicker({
                dateFormat: "dd-mm-yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                onSelect: function (date) {
                }
            });

            $('#DateTo').datepicker({
                dateFormat: "dd-mm-yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                onSelect: function (date) {
                }
            });


            var table = $("table[id$='DataGridView']").DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, "All"]],
                    "iDisplayLength": 10,
                    "order": [[0, "asc"]],
                    "columnDefs": [
                        { className: "dt-right", "targets": [3,4,5,6,7,8,9] }
                        //{ className: "dt-right", "targets": [4] },
                        //{ className: "dt-right", "targets": [5] },
                        //{ className: "dt-right", "targets": [6] },
                        //{ className: "dt-right", "targets": [7] },
                        //{ className: "dt-right", "targets": [8] },
                        //{ className: "dt-right", "targets": [9] }
                        //{ className: "dt-nowrap", "targets": [0, 4] }
                    ]
                    
                });

            $("div[id$='LoadingDiv']").hide(800);
            $("div[id$='DisplayGrid']").show(900);
            $("div[id$='DisplayGrid']").css("width:100% !important");

        });
    </script>

    <style type="text/css">
        .fldupload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            font-size: 200px !important;
            direction: ltr;
            cursor: pointer;
        }

        .fldupload {
            width: 100px;
            height: 30px;
        }

        .pagination {
            border: 0;
            margin: 0;
        }

            .pagination > li > a, .pagination > li > span {
                padding: 2px 5px;
            }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .sorting, .sorting_asc, .sorting_desc {
            min-width: 10%;
            font-size: 13px;
        }

        /*table{
            table-layout: fixed; 
            white-space:nowrap;
        }*/

        table.dataTable tbody td {
            font-size: 12px !important;
        }
        .dt-right{ text-align:right !important;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <uc1:tophead runat="server" ID="tophead" />
            <uc1:mainhead runat="server" ID="mainhead" />
            <uc1:topnavigation runat="server" ID="topnavigation" />
        </header>
        <div class="row mbtm10">
            <div class="w95">
                <h1>Service Transaction Details<span class="pull-right"><b>From</b><input type="text" id="DateFrom" class="mleft10" placeholder="DD/MM/YYYY" style="background-color: #fff; border: 1px solid #ccc; padding: 5px 3px; border-radius: 3px; margin-right: 15px; width: 20%;" runat="server" />
                    <b>To</b><input type="text" id="DateTo" class="mleft10" placeholder="DD/MM/YYYY" style="background-color: #fff; border: 1px solid #ccc; padding: 5px 3px; border-radius: 3px; width: 20%;" runat="server" />
                    <%--<input type="button" class="mleft15 btn btn-success" value="Fetch" onclick="ShowDataTable();" />--%>
                    <asp:Button cssclass="mleft15 btn btn-success" Text="Fetch" runat="server" OnClick="Fetch_Click" /></span></h1>
                <div class="dataTable_wrapper">
                    <div class="dataTables_wrapper form-inline dt-bootstrap no-footer divwidth" id="dataTables-example_wrapper">
                        <div class="row text-center" id="LoadingDiv" runat="server">
                            <div>Please Wait While Data Is Being Loaded...</div>
                            <img src="/WebApp/Login/Loading_hourglass_88px.gif" />
                        </div>
                        <div id="DisplayGrid" style=" display:none; height: 450px;" runat="server">
                            <asp:GridView Width="100%" ID="DataGridView" AutoGenerateColumns="true" OnPreRender="DataGridView_PreRender" runat="server"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<uc1:footer runat="server" ID="footer" />--%>
    </form>
</body>
</html>
