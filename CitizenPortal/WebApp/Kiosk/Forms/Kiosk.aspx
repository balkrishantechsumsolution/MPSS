<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Kiosk.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.Kiosk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://code.jquery.com/jquery-2.2.3.js"></script>
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
                title: 'Task Chart',
                is3D: true
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
                title: 'Revenu Chart',
                pieHole: 0.5,
                colors: ['#9C412E', '#FA8072', '#ec8f6e', '#f3b49f', '#f6c7b6']


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


                title: 'Service Chart',
                height: '500',
                colors: ['#1b9e77', '#d95f02', '#7570b3', '#fdfdfd'],

                seriesType: "bars",
                series: { 5: { type: "line" } },
                bar: { groupWidth: "30%" },
                legend: { position: "none" }


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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important; overflow: auto;">
        <br />
        <br />
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Service Chart
                       
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="flot-chart">
                        
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
                        

                    </div>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Revenu Chart                       
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    
                </div>
            </div>
            <!-- /.panel-body -->
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
                            <div class="row">
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
                                <div class="col-sm-6">
                                    <div class="dataTables_filter" id="dataTables-example_filter">
                                        <label>Search:<input aria-controls="dataTables-example" placeholder="" class="form-control input-sm" type="search"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table aria-describedby="dataTables-example_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example">
                                        <thead>
                                            <tr role="row">
                                                <th aria-label="Rendering engine: activate to sort column descending" aria-sort="ascending" style="width: 175px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting_asc">Rendering engine</th>
                                                <th aria-label="Browser: activate to sort column ascending" style="width: 203px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Browser</th>
                                                <th aria-label="Platform(s): activate to sort column ascending" style="width: 184px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Platform(s)</th>
                                                <th aria-label="Engine version: activate to sort column ascending" style="width: 150px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Engine version</th>
                                                <th aria-label="CSS grade: activate to sort column ascending" style="width: 108px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">CSS grade</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr role="row" class="gradeA odd">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Firefox 1.0</td>
                                                <td>Win 98+ / OSX.2+</td>
                                                <td class="center">1.7</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA even">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Firefox 1.5</td>
                                                <td>Win 98+ / OSX.2+</td>
                                                <td class="center">1.8</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA odd">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Firefox 2.0</td>
                                                <td>Win 98+ / OSX.2+</td>
                                                <td class="center">1.8</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA even">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Firefox 3.0</td>
                                                <td>Win 2k+ / OSX.3+</td>
                                                <td class="center">1.9</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA odd">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Camino 1.0</td>
                                                <td>OSX.2+</td>
                                                <td class="center">1.8</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA even">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Camino 1.5</td>
                                                <td>OSX.3+</td>
                                                <td class="center">1.8</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA odd">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Netscape 7.2</td>
                                                <td>Win 95+ / Mac OS 8.6-9.2</td>
                                                <td class="center">1.7</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA even">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Netscape Browser 8</td>
                                                <td>Win 98SE+</td>
                                                <td class="center">1.7</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA odd">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Netscape Navigator 9</td>
                                                <td>Win 98+ / OSX.2+</td>
                                                <td class="center">1.8</td>
                                                <td class="center">A</td>
                                            </tr>
                                            <tr role="row" class="gradeA even">
                                                <td class="sorting_1">Gecko</td>
                                                <td>Mozilla 1.0</td>
                                                <td>Win 95+ / OSX.1+</td>
                                                <td class="center">1</td>
                                                <td class="center">A</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
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
    </div>
</asp:Content>
