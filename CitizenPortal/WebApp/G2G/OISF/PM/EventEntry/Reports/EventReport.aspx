<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.EventEntry.Reports.EventReport" %>

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
            $("table[id$='DataGridView']").DataTable();
            $('#DataGridView').DataTable();
        });
    </script>
    <style>
        tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
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
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Event Score Sheet</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Event Score Details 
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    Venue</label>
                                <asp:DropDownList ID="drpCenter" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="txtMobile">
                                    Batch / Date</label>
                                <asp:DropDownList ID="drpday" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpday_SelectedIndexChanged"></asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group col-lg-4 text-right">
                            <label class="" for="">
                                &nbsp;
                            </label>
                            <asp:Button ID="btnSubmit" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" class="btn btn-success" />
                            <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();" />
                        </div>
                        <div class="col-md-12 box-container">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="width:1200px;overflow-y:auto;">
                        <asp:GridView ID="DataGridView" runat="server" OnPreRender="DataGridView_PreRender" Width="100%">
                        </asp:GridView>
                    </div>
                </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                
            </div>
            <asp:DropDownList ID="drpEventType" runat="server" Height="28px" Width="192px" OnSelectedIndexChanged="drpEventType_SelectedIndexChanged" AutoPostBack="True" Visible="False">
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
        <div id="page-iframe" style="min-height: 500px !important;">
            
        </div>
    </form>
</body>
</html>
<script src="../js/jquery.dataTables.min.js"></script>
<link href="../css/jquery-ui.css" rel="stylesheet" />
<script src="js/jquery.dataTables.min.js"></script>
<link href="css/jquery-ui.css" rel="stylesheet" />
