<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="LiveChartDashBoard.aspx.cs" Inherits="CitizenPortal.WebApp.Login.LiveChartDashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="js/highcharts.js"></script>
    <script src="js/exporting.js"></script>
    <link href="css/HighCharts.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function (e) {
            DrilDownChartExample();
            TotalServices();
        });
    </script>

    <script type="text/javascript">
        function DrilDownChartExample() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Login/LiveChartDashBoard.aspx/GetDepartment",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = { name: Result[i].DeptName, y: Result[i].DeptCount, drilldown: Result[i].drilldown };
                        data.push(serie);
                    }
                    BindChart(data);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        };

        function BindChart(seriesArr) {
            $('#DrilDownChart').highcharts({
                chart: {
                    type: 'column',
                    backgroundColor: '#CCE6FF',
                    borderColor: '#6495ED',
                    borderWidth: 2,
                    className: 'dark-container',
                    plotBackgroundColor: '#F0FFF0',
                    plotBorderColor: '#6495ED',
                    plotBorderWidth: 1,
                    events: {
                        drilldown: function (e) {
                            if (!e.seriesOptions) {
                                var chart = this;
                                chart.showLoading('Loading ... Please Wait!!!');
                                var dataArr = CallChild(e.point.name);
                                chart.setTitle({
                                    text: 'List Of Departments'
                                });
                                data = {
                                    name: e.point.name,
                                    data: dataArr
                                }
                                //setTimeout(function () {
                                //    chart.hideLoading();
                                //    chart.addSeriesAsDrilldown(e.point, data);
                                //}, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: 'List Of Departments'
                },

                xAxis: {
                    type: 'category'
                },

                plotOptions: {
                    series: {
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true
                        }
                    }
                },

                series: [{
                    name: 'Department Count',
                    colorByPoint: true,
                    data: seriesArr
                }],

                drilldown: {
                    series: [{
                        name: 'Department',
                        colorByPoint: true,
                    }]
                }
            });
        }

        function QBindChart(seriesArr) {
            $('#DrilDownChart').highcharts({
                chart: {
                    type: 'column',
                    backgroundColor: '#CCE6FF',
                    borderColor: '#6495ED',
                    borderWidth: 2,
                    className: 'dark-container',
                    plotBackgroundColor: '#F0FFF0',
                    plotBorderColor: '#6495ED',
                    plotBorderWidth: 1,
                    events: {
                        drilldown: function (e) {
                            if (!e.seriesOptions) {
                                var chart = this;
                                chart.showLoading('Loading ... Please Wait!!!');
                                var dataArr = QCallChild(e.point.name);
                                chart.setTitle({
                                    text: 'Department : Application Count'
                                });
                                data = {
                                    name: e.point.name,
                                    data: dataArr
                                }
                            }
                        }
                    }
                },

                title: {
                    text: 'Department : Application Status'
                },

                xAxis: {
                    type: 'category'
                },

                plotOptions: {
                    series: {
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true
                        }
                    }
                },

                series: [{
                    name: 'Application List',
                    colorByPoint: true,
                    data: seriesArr
                }],

                drilldown: {
                    series: [{
                        name: 'Application Count',
                        colorByPoint: true,
                    }]
                }
            });
        }

        function CallChild(name) {
            var Drilldowndata = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Login/LiveChartDashBoard.aspx/GetApplication",
                data: JSON.stringify({ DeptName: name }),
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    for (var i in Result) {
                        var AppCount = { name: "Application Count", y: Result[i].AppCount, drilldown: Result[i].drilldown };
                        var AppDisp = { name: "Application Disposed", y: Result[i].AppDisp, drilldown: Result[i].drilldown };
                        var AppPend = { name: "Application Pending", y: Result[i].AppPend, drilldown: Result[i].drilldown };
                        var AppAprov = { name: "Application Approve", y: Result[i].AppAprov, drilldown: Result[i].drilldown };
                        var AppRejct = { name: "Application Rejected", y: Result[i].AppRejct, drilldown: Result[i].drilldown };
                        Drilldowndata.push(AppCount, AppDisp, AppPend, AppAprov, AppRejct);
                    }
                    BindChart(Drilldowndata);
                    QBindChart(Drilldowndata);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            })
            return Drilldowndata;
        }

        function QCallChild(name) {
            var Drilldowndata = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Login/LiveChartDashBoard.aspx/GetRevenueByQuarter",
                data: JSON.stringify({ year: name }),
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    for (var i in Result) {
                        var serie = { name: Result[i].year, y: Result[i].amount };
                        Drilldowndata.push(serie);
                    }
                    BindChart(Drilldowndata);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            })
            return Drilldowndata;
        }
    </script>

<script type="text/javascript">
function TotalServices() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Login/LiveChartDashBoard.aspx/ServiceList",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    DreawChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        }

        function DreawChart(series) {
            $('#BarChart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },

                title: {
                    text: 'Lokaseba Odisha Services : Year - 2017'
                },

                tooltip: {
                    pointFormat: 'Application Received: <b>{point.y:.f}</b>'
                },

                xAxis: {
                    type: 'category',
                    labels: {
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },

                series: [{
                    type: 'column',
                    name: 'Services : Applications Count',
                    data: series,
                    colorByPoint: true,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.f}',
                        //rotation: -90,
                        y: 5,
                        style: {
                            fontSize: '10px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                }]
            });
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="mtop15"></div>
        <div class="row text-center" style="margin: 0 auto">
            <div class="col-lg-8 col-md-push-2">
                <div id="DrilDownChart"></div>
            </div>
        </div>
        <div class="mtop15"></div>
        <div class="row text-center" style="margin: 0 auto">
            <div class="col-lg-8 col-md-push-2" style="border:3px solid rgb(100, 149, 237);">
                <div id="BarChart"></div>
            </div>
        </div>
        <div class="mtop15"></div>
    </div>
</asp:Content>
