<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="PGDashboard.aspx.cs" Inherits="CitizenPortal.PG.PGDashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../WebApp/Login/js/jquery-2.2.3.min.js"></script>
    <script src="../WebApp/Login/js/highcharts.js"></script>
    <script src="../WebApp/Login/js/exporting.js"></script>
    <link href="../WebApp/Login/css/HighCharts.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            PGResponseCount();
            BankPaymentMode();
            BankServiceCount();
            DateWiseBankCount();
        });
    </script>

    <script type="text/javascript">

        function PGResponseCount() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/PG/PGDashboardData.asmx/PGResponseCount",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    var dataGraph = $.parseJSON(Result);
                    for (var key in dataGraph[0]) {
                        var serie = { name: key, y: dataGraph[0][key] };
                        data.push(serie);
                    }
                    ColumnChart1(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });

        };

        function ColumnChart1(series) {
            $('#ColumnChart1').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },
                title: {
                    text: null,
                },
                tooltip: {
                    pointFormat: 'Count: <b>{point.y:.f}</b>'
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
                    colorByPoint: true,
                    name: 'PG Response Count Detail',
                    data: series,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.f}',
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

    <script type="text/javascript">
        function BankPaymentMode() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/PG/PGDashboardData.asmx/BankPaymentMode",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = { name: Result[i].Name, y: Result[i].Count };
                        data.push(serie);
                    }
                    ColumnChart2(data);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        };

        function ColumnChart2(series) {
            $('#ColumnChart2').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },
                title: {
                    text: null,
                },
                tooltip: {
                    pointFormat: 'Count: <b>{point.y:.f}</b>'
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
                    colorByPoint: true,
                    name: 'Bank Payment Mode',
                    data: series,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.f}',
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

    <script type="text/javascript">
        function BankServiceCount() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/PG/PGDashboardData.asmx/BankServiceCount",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = { name: Result[i].Name, y: Result[i].Count };
                        data.push(serie);
                    }
                    ColumnChart3(data);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        };

        function ColumnChart3(series) {
            $('#ColumnChart3').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },
                title: {
                    text: null,
                },
                tooltip: {
                    pointFormat: 'Count: <b>{point.y:.f}</b>'
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
                    colorByPoint: true,
                    name: 'Bank Service Code',
                    data: series,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.f}',
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


    <script type="text/javascript">
        function DateWiseBankCount() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/PG/PGDashboardData.asmx/DateWiseBankCount",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Count);
                        data.push(serie);
                    }
                    ColumnChart4(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function ColumnChart4(series) {
            $('#ColumnChart4').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },

                title: {
                    text: null,
                },

                tooltip: {
                    pointFormat: 'Count: <b>{point.y:.f}</b>'
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
                    colorByPoint: true,
                    name: 'Bank PG Count : Date Wise',
                    data: series,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.f}',
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
    <div class="w95">
        <div class="mtop15"></div>
        <div id="ColumnChart1"></div>
        <hr />
        <div class="mtop15"></div>
        <div id="ColumnChart2"></div>
        <hr />
        <div class="mtop15"></div>
        <div id="ColumnChart3"></div>
        <hr />
        <div class="mtop15"></div>
        <div id="ColumnChart4"></div>
        <div class="mtop15"></div>
    </div>
</asp:Content>
