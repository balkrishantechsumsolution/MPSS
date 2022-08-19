<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="AdmissionReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OUAT.AdmissionReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Data Entry Report View</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="/WebApp/KIOSK/DTE/Script/DTEDashboard.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/G2G/OISF/css/allocationCenterStylesheet.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script type="text/javascript">

        $(document).ready(function () {
            $('#txtFromDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

            $('#txtToDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });
            //var DistrictControl = "ddlDistrict";
            //GetDistrict("", "21", DistrictControl);
        });

        $(document).ready(function () {
            debugger;
            var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100], [10, 50, 100]],
                    "iDisplayLength": 10
                });

            $("table[id$='DataGridView'] thead th").each(function () {
                var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
                $(this).html('<input type="text" placeholder="' + title + '" />');
            });

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
    <style>
        tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
        }


        table#DataGridView > thead > tr > th {
            width: 25% !important;
        }

        table#DataGridView > tbody > tr > td {
            width: 25% !important;
        }

        #DataGridView input, textarea {
            min-width: 75px !important;
            width: 100% !important;
            max-width: 200px !important;
            color:#333;
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
            font-size: x-large;
        }
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
    <link href="../../../../../Common/Styles/style.admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Reports</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div class="row" style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Search Filter
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtFromDate">
                                    From Date
                                </label>                                
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtToDate">
                                    To Date
                                </label>                                
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Application Type</label>
                                <asp:DropDownList ID="ddlApplication" runat="server" Width="95%" CssClass="form-control">
                                    <asp:ListItem>-Select Status-</asp:ListItem>
                                    <asp:ListItem Value="403">OUAT UG</asp:ListItem>
                                    <asp:ListItem Value="409">OUAT UG Agro</asp:ListItem>
                                    <asp:ListItem Value="419">OUAT PG/PhD</asp:ListItem>
                                    <asp:ListItem Value="420">Diploma AgroPolytechnic</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="txtAppID">Application No.</label>
                                <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Application No" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                    type="text" value=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="txtAppID">Roll No.</label>
                                <asp:TextBox runat="server" ID="txtRoll" class="form-control" placeholder="Roll No" name="txtRollNo" MaxLength="6" onkeypress="return isNumberKey(event);"
                                    type="text" value=""></asp:TextBox>
                            </div>
                        </div>
                       
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                        Text="Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                        <div class="row col-md-12 box-container">
                            <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                <asp:GridView ID="DataGridView" runat="server" Width="98%"></asp:GridView>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>

                    </div>
                </div>
            </div>

            <%----END of Filter-----%>
        </div>
    </div>
</asp:Content>
