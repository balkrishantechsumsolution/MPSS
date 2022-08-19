<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScoreReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.EventEntry.Reports.ScoreReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Entry Report View</title>
    <script src="../../../../../Login/js/jquery-1.12.3.js"></script>
    <script src="../../../../../Login/js/jquery.dataTables.min.js"></script>
    <link href="../../../css/allocationCenterStylesheet.css" rel="stylesheet" />
    <link href="../../../../../Login/css/bootstrap.css" rel="stylesheet" />
    <link href="../../../../../../g2c/css/hmepge.bootstrap.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    "lengthMenu": [100, 500, 1000],
                    "iDisplayLength": 100,
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


        table#DataGridView > thead > tr > th{
             width:25% !important;
        }

        table#DataGridView > tbody > tr > td{
             width:25% !important;
        }

        #DataGridView input, textarea {
            width:161px !important;
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
    </style>
    <link href="../../../../../Common/Styles/style.admin.css" rel="stylesheet" />
</head>
<body>
    <form id="form5" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Event Score Report</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Event Score Report 
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory">Center ID :</label>
                                <asp:DropDownList ID="drpCenterId" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Event :</label>
                                <asp:DropDownList ID="drpEvent" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Bio Matrix</asp:ListItem>
                                    <asp:ListItem Value="2">Physical Measurement</asp:ListItem>
                                    <asp:ListItem Value="3">Medical Fitness</asp:ListItem>
                                    <asp:ListItem Value="4">High Jump</asp:ListItem>
                                    <asp:ListItem Value="5">Broad Jump</asp:ListItem>
                                    <asp:ListItem Value="6">Rope Climbing</asp:ListItem>
                                    <asp:ListItem Value="7">Running</asp:ListItem>
                                    <asp:ListItem Value="8">Cross Country</asp:ListItem>
                                    <asp:ListItem Value="9">Swimming</asp:ListItem>
                                    <asp:ListItem Value="10">Driving</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtMobile">Batch / Date</label>
                                <asp:DropDownList ID="drpBatchDay" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-lg-2 mtop15">
                            <asp:Button ID="btnSubmit" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                            <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();" />
                        </div>
                        <div class="col-md-12 box-container">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                <asp:GridView ID="DataGridView" runat="server" Width="98%"></asp:GridView>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
