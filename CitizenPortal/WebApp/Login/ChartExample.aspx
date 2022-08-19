<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="ChartExample.aspx.cs" Inherits="CitizenPortal.WebApp.Login.ChartExample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="js/highcharts.js"></script>
    <script src="js/exporting.js"></script>
    <link href="css/HighCharts.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Login/ChartExample.aspx/FruitAnalysis",
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
                    DreawColumnChart(data);
                    DreawLineChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        });

        function DreawChart(series) {
            $('#PieChart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },
                title: {
                    text: 'Fruit Market Share : Year - 2016'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Fruit Share',
                    data: series
                }]
            });
        }

        function DreawColumnChart(series) {
            $('#ColumnChart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },

                title: {
                    text: 'Fruit Market Share : Year - 2016'
                },

                tooltip: {
                    pointFormat: 'Fruit Production: <b>{point.y:.1f} %</b>'
                },

                xAxis: {
                    type: 'category',
                    labels: {
                        style: {
                            fontSize: '10px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },

                series: [{
                    type: 'column',
                    name: 'Fruit Share',
                    data: series,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.f}',
                        rotation: -90,
                        y: 5,
                        style: {
                            fontSize: '10px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                }]
            });
        }

        function DreawLineChart(series) {
            $('#LineChart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },

                title: {
                    text: 'Fruit Market Share : Year - 2016'
                },

                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },

                yAxis: {
                    title: {
                        text: 'Fruit Market Year'
                    },
                },

                tooltip: {
                    pointFormat: '{series.name}: <b>{point.y:.1f}%</b>'
                },

                plotOptions: {
                    line: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'green'
                            }
                        }
                    }
                },

                series: [{
                    //type: 'line',
                    name: 'Fruit Share',
                    data: series
                }]
            });
        }
    </script>

    <script type="text/javascript">
        function DrilDownChartExample() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Login/ChartExample.aspx/GetRevenueByDecade",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = { name: Result[i].year, y: Result[i].amount, drilldown: Result[i].drilldown };
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
                                chart.showLoading('Loading Year wise Revenue ...');
                                var dataArr = CallChild(e.point.name);
                                chart.setTitle({
                                    text: 'Year wise Revenue Report'
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
                    text: 'Year wise Revenue Report'
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
                    name: 'Brands',
                    colorByPoint: true,
                    data: seriesArr
                }],

                drilldown: {
                    series: [{
                        name: 'Year',
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
                                chart.showLoading('Loading Year wise Revenue ...');
                                var dataArr = QCallChild(e.point.name);
                                chart.setTitle({
                                    text: 'Year wise Revenue Report'
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
                    text: 'Year wise Revenue Report'
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
                    name: 'Brands',
                    colorByPoint: true,
                    data: seriesArr
                }],

                drilldown: {
                    series: [{
                        name: 'Year',
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
                url: "/WebApp/Login/ChartExample.aspx/GetRevenueByYear",
                data: JSON.stringify({ quarter: name }),
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    for (var i in Result) {
                        var serie = { name: Result[i].year, y: Result[i].amount, drilldown: Result[i].drilldown };
                        Drilldowndata.push(serie);
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
                url: "/WebApp/Login/ChartExample.aspx/GetRevenueByQuarter",
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


        function DrilDownChartExample1() {
            debugger;
            $.ajax({
                type: "GET",
                url: "/WebApp/Login/ChartExample.json",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var dataGraph = data;
                    $('#DrilDownChart1').highcharts({
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: ''
                        },
                        xAxis: {
                            type: 'category'
                        },
                        yAxis: {
                            title: {
                                text: 'Total Count'
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        plotOptions: {
                            series: {
                                borderWidth: 0,
                                dataLabels: {
                                    enabled: true,
                                    format: '{point.y:f}'
                                }
                            }
                        },
                        tooltip: {
                            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <br/><b>{point.y:f}</b><br/>'
                        },

                        series: [
                        dataGraph.series

                        ],
                        drilldown: {
                            series: dataGraph.drilldown
                        }
                    });
                }
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="mtop15"></div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2">
            <button type="button" class="btn btn-info">Pie Chart</button>
        </div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2">
            <button type="button" class="btn btn-info">Column Chart</button>
        </div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2">
            <button type="button" class="btn btn-info">Line Chart</button>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <div id="PieChart"></div>
        </div>
        <div class="col-lg-4">
            <div id="ColumnChart"></div>
        </div>
        <div class="col-lg-4">
            <div id="LineChart"></div>
        </div>
    </div>
    <div class="mtop15"></div>
    <button type="button" class="btn btn-info" onclick="return DrilDownChartExample();">Dril Down Chart</button>
    <div class="mtop15"></div>
    <div class="row">
        <div class="col-lg-12">
            <div id="DrilDownChart"></div>
        </div>
    </div>
    <div class="mtop15"></div>
    <button type="button" class="btn btn-info" onclick="return DrilDownChartExample1();">Dril Down Chart</button>
    <div class="mtop15"></div>
    <div class="row">
        <div class="col-lg-12">
            <div id="DrilDownChart1"></div>
        </div>
    </div>
</asp:Content>
