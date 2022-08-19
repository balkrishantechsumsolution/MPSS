<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="DashboardChart.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.DashboardChart" %>
<%@ Register Src="~/WebApp/Control/DesignatedOfficer.ascx" TagPrefix="uc1" TagName="DesignatedOfficer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="../../Styles/easy-responsive-tabs.css" rel="stylesheet" />
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>    
    <script src="../../Scripts/OfficeOfficer.js"></script>
    <script src="../../Scripts/easyResponsiveTabs.js"></script>--%>
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="../../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="../../../Scripts/jquery.msgBox.js"></script>
    <link href="../../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <%--<link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />--%>
    <link href="../../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="../../Scripts/AddressScript.js"></script>
    <script src="../../Scripts/OfficeOfficer.js"></script>

    <script>

        $(document).ready(function () {

        });

        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

        function ViewDoc(p_URL, p_ServiceID, p_AppID) {
            //var t_URL = ResolveUrl(p_URL);
            if (p_ServiceID == '101') {
                var t_URL = "../Common/HTML2PDF/HTMLToPdf.aspx";
            } else if (p_ServiceID == '103')
            { var t_URL = "../Kiosk/Birth/Preview.aspx"; }
            else if (p_ServiceID == '104') {
                var t_URL = "../Kiosk/Death/Preview.aspx";
            }
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        function TakeAction(p_ServiceID, p_AppID, p_PaymentStatus, p_AckURL) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/Forms/AppRedirect.aspx";
            
            if (p_PaymentStatus == "P") {

                t_URL = p_AckURL;
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');

            }
            else {
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
                window.location.href = t_URL;

            }

            return false;
        }

        function RedirecteKYC(p_URL) {
            debugger;
            window.location.href = p_URL + "?UID=" + $("#HFUID").val();
            //alert(p_URL + "&UID=" + $("#HFUID").val());
            return false;
        }
    </script>
    <style type="text/css">
        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 47.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
    <div id="page-wrapper" style="min-height: 500px !important; overflow: auto;">

        <div class="row mt20">
            <div class="col-lg-12">
                <div style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv">
                    <a href="OfficeOfficer.aspx">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;"/>
                    </a><a href="OfficeOfficer.aspx">Available Services</a>
                    <br/>
                    <span>List of Available Services</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv">
                    <a href="MakePayment.aspx">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;"/>
                    </a><a href="MakePayment.aspx">Make Payment</a>
                    <br/>
                </div>
                <div style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv">
                    <a href="BasicDetail.aspx">
                        <img src="/webapp/kiosk/Images/aadhaar.png" alt="" align="left" style="height: 70px;"/>
                    </a><a href="BasicDetail.aspx">Start eKYC</a>
                    <br/>
                    <span>Fetch Applicant details from Aadhar Database</span>
                </div>
                <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />
            </div>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Transaction Details
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
                                <div style="display:none" class="">
                                    <div class="col-sm-6">
                                        <div id="dataTables-example_length" class="dataTables_length">
                                            <label>
                                                Show
                                        <select class="form-control input-sm" aria-controls="dataTables-example" name="dataTables-example_length">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                                entries</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 text-right">
                                        <div class="dataTables_filter" id="dataTables-example_filter">
                                            <label>Search  : 
                                                <input aria-controls="dataTables-example" placeholder="" class="form-control input-sm" type="search"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="">
                                    <div class="col-sm-12" style="overflow: scroll; height: 200px;">
                                        <div class="row">
                                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound" AllowPaging="True">
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="display:none;">
                                    <div class="col-sm-6">
                                        <div aria-live="polite" role="status" id="dataTables-example_info" class="dataTables_info">Showing 1 to 10 of 57 entries</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div id="dataTables-example_paginate" class="dataTables_paginate paging_simple_numbers">
                                            <ul class="pagination">
                                                <li id="dataTables-example_previous" tabindex="0" aria-controls="dataTables-example" class="paginate_button previous disabled"><a href="#">Previous</a></li>
                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button active"><a href="#">1</a></li>
                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">2</a></li>
                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">3</a></li>
                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">4</a></li>
                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">5</a></li>
                                                <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">6</a></li>
                                                <li id="dataTables-example_next" tabindex="0" aria-controls="dataTables-example" class="paginate_button next"><a href="#">Next</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <div class="col-lg-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Service Chart
                       
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div id="piechartBar"></div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>


            <div class="col-lg-4">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i>Notifications Panel
                       
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <a href="#" class="list-group-item">
                                <i class="fa fa-comment fa-fw"></i>New Comment
                                   
                            <span class="pull-right text-muted small"><em>4 minutes ago</em>
                            </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-twitter fa-fw"></i>3 New Followers
                                   
                            <span class="pull-right text-muted small"><em>12 minutes ago</em>
                            </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-envelope fa-fw"></i>Message Sent
                                   
                            <span class="pull-right text-muted small"><em>27 minutes ago</em>
                            </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-tasks fa-fw"></i>New Task
                                   
                            <span class="pull-right text-muted small"><em>43 minutes ago</em>
                            </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-upload fa-fw"></i>Server Rebooted
                                   
                            <span class="pull-right text-muted small"><em>11:32 AM</em>
                            </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-bolt fa-fw"></i>Server Crashed!
                                   
                            <span class="pull-right text-muted small"><em>11:13 AM</em>
                            </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-warning fa-fw"></i>Server Not Responding
                                   
                            <span class="pull-right text-muted small"><em>10:57 AM</em>
                            </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-shopping-cart fa-fw"></i>New Order Placed
                                   
                            <span class="pull-right text-muted small"><em>9:49 AM</em>
                            </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-money fa-fw"></i>Payment Received
                                   
                            <span class="pull-right text-muted small"><em>Yesterday</em>
                            </span>
                            </a>
                        </div>
                        <!-- /.list-group -->
                        <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Task Chart
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div id="piechart"></div>
                        </div>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Revenue Chart                       
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div id="piechartdonut"></div>
                        </div>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>

    </div>
            </div>
        </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />

    <%--<script src="http://code.jquery.com/jquery-2.2.3.js"></script>--%>
    <script src="http://www.google.com/jsapi" type="text/javascript"></script>

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script type="text/javascript">
        // Global variable to hold data
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'DashboardChart.aspx/GetChartData',
                data: '{}',
                success:
                function (response) {
                    drawchart(response.d);
                },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });


            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'DashboardChart.aspx/GetChartData2',
                data: '{}',
                success:
                function (response) {

                    drawchartDONut(response.d);

                },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });

            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'DashboardChart.aspx/GetChartData3',
                data: '{}',
                success:
                function (response) {

                    drawchartBar(response.d);

                },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });




        })





        function drawchart(dataValues) {
            var options = {
                height: '400',
                title: '',
                is3D: true,
                legend: { position: "bottom" }
                //  pieStartAngle: 100
            };
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Name, dataValues[i].Count]);
            }

            new google.visualization.PieChart(document.getElementById('piechart')).
            draw(data, options);
        }

        function drawchartDONut(dataValues) {
            var options = {

                height: '400',
                title: '',
                pieHole: 0.5,
                colors: ['#9C412E', '#FA8072', '#ec8f6e', '#f3b49f', '#f6c7b6'],
                legend: { position: "bottom" }

            };
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Name, dataValues[i].Count]);
            }
            new google.visualization.PieChart(document.getElementById('piechartdonut')).
            draw(data, options);
        }


        function drawchartBar(dataValues) {
            var options = {


                title: '',
                height: '400',
                colors: ['#1b9e77', '#d95f02', '#7570b3', '#fdfdfd'],

                seriesType: "bars",
                series: { 10: { type: "line" } },
                bar: { groupWidth: "30%" },
                legend: { position: "bottom" }


            };
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Services');
            data.addColumn('number', 'Trasaction');
            data.addColumn('number', 'Approved');
            data.addColumn('number', 'Pending');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Name, dataValues[i].Count3, dataValues[i].Count1, dataValues[i].Count2]);
            }

            new google.visualization.ColumnChart(document.getElementById('piechartBar')).
            draw(data, options);
        }


    </script>
</asp:Content>
