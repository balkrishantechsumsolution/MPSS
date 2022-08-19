<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CitizenPortal.WebApp.Charts.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="http://code.highcharts.com/modules/drilldown.js"></script>--%>

    <script src="/WebApp/Login/js/highcharts.js"></script>
    <script src="/WebApp/Login/js/exporting.js"></script>
    <link type="text/css" href="/WebApp/Login/css/HighCharts.css" rel="stylesheet" />

    <style type="text/css">
        .chartHD { /*text-shadow: 0 2px 2px #ccc, 0 2px 2px #ccc;*/
            font-size: 20px;
        }

        .oisfHD {
            width: 100%;
            background-color: #0D47A1;
            color: #fff;
            font-size: 22px;
            /* margin-bottom: 20px; */
            padding: 10px 10px;
        }

        .chartHoldBox {
            margin: 15px 5px;
            -webkit-box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.2);
            -moz-box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.2);
            box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.2);
            margin: 0 0 15px 0;
        }

        .headingChart {
            background-color: #64B5F6;
            color: #fff;
            font-size: 16px;
            width: 100%;
            padding: 10px;
            margin: 15px 0 0 0;
        }

        /*#DrilDownChart,*/ #BarChart, #BarChartNew, #BarChartOld, #DistrictWiseChart, #DateWiseChart, #CenterWiseChart, #PieChart, #QualifiedTestChart, #SCQWrittenChart,
        #STQWrittenChart, #SEBCQWrittenChart, #URQWrittenChart, #EventReportChart, #CompleteChart, #INCompleteChart, #OUATAppCountChart, #OUATDistAppCountChart, 
        #OUATPaymentCountChart, #OUATPaymentCount2Chart, #OUATDateCountChart, #OUATDateCount2Chart, #OUATExamCenter2Chart, #OUATExamCenter2Chart, #DisplayGrid,
        #OUATDistAgroCountChart,#PGApplicationChart,#OUATPGPaidAppChart,#OUATPGTotalPaidAppChart,#OUATPGDateChart {
            border: 1px solid #64B5F6;
        }

        #LoadingDiv {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: #000;
            right: 0;
            z-index: 1000;
        }

        #load {
            width: 100%;
            height: 100%;
            position: fixed;
            font-size: 20px;
            padding-top: 420px;
            top: 5px;
            text-align: center;
            color: #fff;
            z-index: 9999;
            background: url("/g2c/img/loading.gif") no-repeat;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-color: rgba(0,0,0,0.5);
        }

        tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
        }
    </style>

    <script type="text/javascript">
        document.onreadystatechange = function () {
            var state = document.readyState
            if (state == 'complete') {
                setTimeout(function () {
                    document.getElementById('interactive');
                    document.getElementById('load').style.visibility = "hidden";
                }, 10000);
            }
        }

        $(document).ready(function () {
            var DeptList = $("#ddlDept").val();

            if (DeptList == "OUAT") {
                OUATServiceList();
                OUATDistWiseAppCount();
                OUATDistWiseAppCount2();
                OUATAppPaymentCount();
                OUATAppPaymentCount2();
                OUATDateWiseReport();
                OUATDateWiseReport2();
                OUATExamCenter1();
                OUATExamCenter2();
                OUATDataTable();
            }
            else if (DeptList == "DTE") {
                GetDTEDepartment();
                DTEServiceList();
            }
            else if (DeptList == "OISF") {
                GetList();
                ServiceName();
                DateWiseReport();
                CenterWiseReport();
                ApplicationCount();
                DistrictWiseReport();
                URWrittenQualifiedReport();
                SCWrittenQualifiedReport();
                STWrittenQualifiedReport();
                SEBCWrittenQualifiedReport();
                QualifiedCandidateEventWise();
                DistrictWrittenQualifiedReport();
            }
            else if (DeptList == "SSEPD") {
                GetDepartment();
                SSEPDServiceList();
            }
            else if (DeptList == "OUATPG") {
                OUATPGTotalApplication();
                OUATPGDateWiseReport();
                OUATPGPaidReport();
                OUATPGTotalPaidReport();
            }
            else if (DeptList == "OuatAgroDiploma") {

            }
            else {
                return false;
            }
        });
    </script>

    <%-- CHART OF SSEPD --%>

    <script type="text/javascript">
        function GetDepartment() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetDepartment",
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
                                    text: 'Department Giving Services Through "Common Application Portal (CAP)'
                                });
                                data = {
                                    name: e.point.name,
                                    data: dataArr
                                }
                                setTimeout(function () {
                                    chart.hideLoading();
                                    chart.addSeriesAsDrilldown(e.point, data);
                                }, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: null,
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
                                setTimeout(function () {
                                    chart.hideLoading();
                                    chart.addSeriesAsDrilldown(e.point, data);
                                }, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: null,
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
                url: "/WebApp/Charts/DashboardData.asmx/GetApplication",
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
                url: "/WebApp/Charts/DashboardData.asmx/GetRevenueByQuarter",
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
        function SSEPDServiceList() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/SSEPDServiceList",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    debugger;
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = { name: Result[i].SvcName, ID: Result[i].SvcID, y: Result[i].SvcCount, drilldown: Result[i].drilldown };
                        data.push(serie);
                    }
                    BindSSEPDDeptChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function BindSSEPDDeptChart(seriesArr) {

            $('#SSEPDBarChart').highcharts({
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
                                var dataArr = CallSSEPDDeptList(e.point.ID);
                                chart.setTitle({
                                    text: 'Department Giving Services Through "Common Application Portal (CAP)'
                                });
                                data = {
                                    ID: e.point.name,
                                    data: dataArr
                                }
                                setTimeout(function () {
                                    chart.hideLoading();
                                    chart.addSeriesAsDrilldown(e.point, data);
                                }, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: null,
                },

                xAxis: {
                    type: 'category'
                },

                yAxis: {
                    title: {
                        text: 'Application Count'
                    },
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
                    name: 'District Wise Count',
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

        function BindSSEPDQChart(seriesArr) {

            $('#SSEPDBarChart').highcharts({
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
                                var dataArr = BindSSEPDDeptDist(e.point.name);
                                chart.setTitle({
                                    text: 'Department : Application Count'
                                });
                                data = {
                                    ID: e.point.name,
                                    data: dataArr
                                }
                                setTimeout(function () {
                                    chart.hideLoading();
                                    chart.addSeriesAsDrilldown(e.point, data);
                                }, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: null,
                },

                xAxis: {
                    type: 'category'
                },

                yAxis: {
                    title: {
                        text: 'Application Count'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
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

        function CallSSEPDDeptList(ID) {

            var SSEPDDrilldowndata = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetSSEPDDeptApplication",
                data: JSON.stringify({ SvcID: ID }),
                dataType: "json",
                success: function (Result) {

                    Result = Result.d;
                    for (var i in Result) {
                        var AppCount = { name: "Total Application", y: Result[i].AppCount, drilldown: Result[i].drilldown };
                        var AppDisp = { name: "Application Disposed", y: Result[i].AppDisp, drilldown: Result[i].drilldown };
                        var AppPend = { name: "Application Pending", y: Result[i].AppPend, drilldown: Result[i].drilldown };
                        var AppAprov = { name: "Application Approve", y: Result[i].AppAprov, drilldown: Result[i].drilldown };
                        var AppRejct = { name: "Application Rejected", y: Result[i].AppRejct, drilldown: Result[i].drilldown };
                        $('#HDNSVCID').val(Result[i].SvcID);
                        SSEPDDrilldowndata.push(AppCount, AppDisp, AppPend, AppAprov, AppRejct);
                    }
                    BindSSEPDDeptChart(SSEPDDrilldowndata);
                    BindSSEPDQChart(SSEPDDrilldowndata);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            })
            return SSEPDDrilldowndata;
        }

        function BindSSEPDDeptDist(name) {

            var SSEPDDrilldowndata = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetSSEPDDeptDistrict",
                data: JSON.stringify({ year: name, SvcID: $('#HDNSVCID').val() }),
                dataType: "json",
                success: function (Result) {

                    Result = Result.d;
                    for (var i in Result) {
                        var serie = { name: Result[i].year, y: Result[i].amount };
                        SSEPDDrilldowndata.push(serie);
                    }
                    BindSSEPDDeptChart(SSEPDDrilldowndata);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            })
            return SSEPDDrilldowndata;
        }
    </script>

    <%-- CHART OF OISF --%>

    <script type="text/javascript">

        function ApplicationCount() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/ConvertDataTabletoString",
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
                    ColumnChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });

        };

        function ColumnChart(series) {
            $('#BarChartNew').highcharts({
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
                    name: 'Total Category',
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
        function ServiceName() {
            //    $.ajax({
            //        type: "POST",
            //        contentType: "application/json; charset=utf-8",
            //        url: "/WebApp/Charts/DashboardData.asmx/ServiceName",
            //        data: "{}",
            //        dataType: "json",
            //        success: function (Result) {
            //            Result = Result.d;
            //            var data = [];
            //            for (var i in Result) {
            //                var serie = { name: Result[i].Name, y: Result[i].Count };
            //                data.push(serie);
            //            }
            //            BindBarChart(data);
            //        },
            //        error: function (xhr, status, error) {
            //            alert(xhr.responseText);
            //        }
            //    });
            //};

            //function BindBarChart(series) {
            $('#BarChartOld').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: null
                },
                xAxis: {
                    categories: [
                        'SC',
                        'ST',
                        'SEBC',
                        'UR'
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Category (Count)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.f}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [
                    {
                        name: 'Total',
                        data: [25666, 30889, 35717, 11289]
                    },
                    {
                        name: 'Complete',
                        data: [17758, 22478, 24990, 7539]
                    },
                    {
                        name: 'InComplete',
                        data: [7908, 8411, 10727, 3750]
                    }]
            });
        }
    </script>

    <script type="text/javascript">
            function CompleteApplication() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "/WebApp/Charts/DashboardData.asmx/CompleteApplication",
                    data: "{}",
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;
                        var data = [];
                        for (var i in Result) {
                            var serie = { name: Result[i].Name, y: Result[i].Count };
                            data.push(serie);
                        }
                        TACompleteChart(data);
                    },
                    error: function (xhr, status, error) {
                        alert(xhr.responseText);
                    }
                });
            };

            function TACompleteChart(series) {
                $('#CompleteChart').highcharts({
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
                        name: 'All Category : Complete Count',
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
        function InCompleteApplication() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/InCompleteApplication",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = { name: Result[i].Name, y: Result[i].Count };
                        data.push(serie);
                    }
                    TINCompleteChart(data);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        };

        function TINCompleteChart(series) {
            $('#INCompleteChart').highcharts({
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
                    name: 'All Category : InComplete Count',
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
        function GetList() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetList",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Count);
                        data.push(serie);
                    }
                    DrawPieChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function DrawPieChart(series) {
            $('#PieChart').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    style: {
                        display: 'none'
                    }
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.y:.f}</b>'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45,
                        allowPointSelect: true,
                        //cursor: 'pointer',
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
                    name: 'Total',
                    data: series
                }]
            });
        }
    </script>

    <script type="text/javascript">
        function DistrictWiseReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/DistrictWiseReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    DistrictChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function DistrictChart(series) {
            $('#DistrictWiseChart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },

                title: {
                    text: null,
                },

                tooltip: {
                    pointFormat: 'Count: <b>{point.y:.1f} %</b>'
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
                    name: 'Total District',
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
        function DateWiseReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/DateWiseReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    DateChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function DateChart(series) {
            $('#DateWiseChart').highcharts({
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
                    name: 'Date : Count',
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
        function CenterWiseReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/CenterWiseReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    CenterChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function CenterChart(series) {
            $('#CenterWiseChart').highcharts({
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
                    name: 'Center : Count',
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
        function DistrictWrittenQualifiedReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/DistrictWrittenQualifiedReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    QualifiedWrittenChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function QualifiedWrittenChart(series) {
            $('#QualifiedTestChart').highcharts({
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
                    name: 'District Count : Qualified For Written Test',
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
        function SCWrittenQualifiedReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/SCWrittenQualifiedReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    SCQualifiedWrittenChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function SCQualifiedWrittenChart(series) {
            $('#SCQWrittenChart').highcharts({
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
                    name: 'SC - Count : Qualified For Written Test',
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
        function STWrittenQualifiedReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/STWrittenQualifiedReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    STQualifiedWrittenChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function STQualifiedWrittenChart(series) {
            $('#STQWrittenChart').highcharts({
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
                    name: 'ST - Count : Qualified For Written Test',
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
        function SEBCWrittenQualifiedReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/SEBCWrittenQualifiedReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    SEBCQualifiedWrittenChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function SEBCQualifiedWrittenChart(series) {
            $('#SEBCQWrittenChart').highcharts({
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
                    name: 'SEBC - Count : Qualified For Written Test',
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
        function URWrittenQualifiedReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/URWrittenQualifiedReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    URQualifiedWrittenChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function URQualifiedWrittenChart(series) {
            $('#URQWrittenChart').highcharts({
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
                    name: 'UR - Count : Qualified For Written Test',
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
        function QualifiedCandidateEventWise() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/QualifiedCandidateEventWise",
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
                    EventQualifiedCandidate(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function EventQualifiedCandidate(series) {
            $('#EventReportChart').highcharts({
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
                        rotation: -45,
                        style: {
                            fontSize: '10px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },
                series: [{
                    type: 'column',
                    colorByPoint: true,
                    name: 'Total Event',
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

    <%--<script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetLine",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Count);
                        data.push(serie);
                    }
                    DrawLineChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        });

        function DrawLineChart(series) {
            $('#EventReportChart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },
                title: {
                    text: 'Fruit Market Share : Year - 2016'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.y:.f}</b>'
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
                    type: 'Line',
                    name: 'Percentage',
                    data: series
                }]
            });
        }
    </script>--%>

    <%--CHART OF DTE--%>

    <script type="text/javascript">
        function GetDTEDepartment() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetDTEDepartment",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = { name: Result[i].DeptName, y: Result[i].DeptCount, drilldown: Result[i].drilldown };
                        data.push(serie);
                    }
                    DTEBindChart(data);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        };

        function DTEBindChart(seriesArr) {
            $('#DTEDrilDownChart').highcharts({
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
                                var dataArr = DTECallChild(e.point.name);
                                chart.setTitle({
                                    text: 'Department Giving Services Through "Common Application Portal (CAP)'
                                });
                                data = {
                                    name: e.point.name,
                                    data: dataArr
                                }
                                setTimeout(function () {
                                    chart.hideLoading();
                                    chart.addSeriesAsDrilldown(e.point, data);
                                }, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: null,
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

        function DTEQBindChart(seriesArr) {
            $('#DTEDrilDownChart').highcharts({
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
                                var dataArr = DTEQCallChild(e.point.name);
                                chart.setTitle({
                                    text: 'Department : Application Count'
                                });
                                data = {
                                    name: e.point.name,
                                    data: dataArr
                                }
                                setTimeout(function () {
                                    chart.hideLoading();
                                    chart.addSeriesAsDrilldown(e.point, data);
                                }, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: null,
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

        function DTECallChild(name) {
            var DTEDrilldowndata = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetDTEApplication",
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
                        DTEDrilldowndata.push(AppCount, AppDisp, AppPend, AppAprov, AppRejct);
                    }
                    DTEBindChart(DTEDrilldowndata);
                    DTEQBindChart(DTEDrilldowndata);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            })
            return DTEDrilldowndata;
        }

        function DTEQCallChild(name) {
            var DTEDrilldowndata = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetDTERevenueByQuarter",
                data: JSON.stringify({ year: name }),
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    for (var i in Result) {
                        var serie = { name: Result[i].year, y: Result[i].amount };
                        DTEDrilldowndata.push(serie);
                    }
                    DTEBindChart(DTEDrilldowndata);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            })
            return DTEDrilldowndata;
        }
    </script>

    <script type="text/javascript">
        function DTEServiceList() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/DTEServiceList",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = { name: Result[i].SvcName, ID: Result[i].SvcID, y: Result[i].SvcCount, drilldown: Result[i].drilldown };
                        data.push(serie);
                    }
                    BindDTEDeptChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        //Highcharts.setOptions({
        //    lang: {
        //        drillUpText: '<< Back To Service List'
        //    }
        //});

        //$(document).on('click', '#drillup', function () {
        //    var data = { categories: categories, series: series };
        //    setChart('new title', categories, data, chart.type);
        //});

        function BindDTEDeptChart(seriesArr) {
            //Highcharts.chart("DTEBarChart",{

            $('#DTEBarChart').highcharts({
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
                                var dataArr = CallDTEDeptList(e.point.ID);
                                chart.setTitle({
                                    text: 'Department Giving Services Through "Common Application Portal (CAP)'
                                });
                                data = {
                                    ID: e.point.name,
                                    data: dataArr
                                }
                                setTimeout(function () {
                                    chart.hideLoading();
                                    chart.addSeriesAsDrilldown(e.point, data);
                                    //$('.highcharts - button highcharts- drillup - button highcharts- button - normal').show();
                                }, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: null,
                },

                xAxis: {
                    type: 'category'
                },

                yAxis: {
                    title: {
                        text: 'Application Count'
                    },
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
                    name: 'District Wise Count',
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

        function BindDTEQChart(seriesArr) {

            $('#DTEBarChart').highcharts({
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
                                var dataArr = BindDTEDeptDist(e.point.name);
                                chart.setTitle({
                                    text: 'Department : Application Count'
                                });
                                data = {
                                    ID: e.point.name,
                                    data: dataArr
                                }
                                setTimeout(function () {
                                    chart.hideLoading();
                                    chart.addSeriesAsDrilldown(e.point, data);
                                    //$('.highcharts - button highcharts- drillup - button highcharts- button - normal').show();
                                }, 1000);
                            }
                        }
                    }
                },

                title: {
                    text: null,
                },

                xAxis: {
                    type: 'category'
                },

                yAxis: {
                    title: {
                        text: 'Application Count'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
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

        function CallDTEDeptList(ID) {

            var DTEDrilldowndata = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetDTEDeptApplication",
                data: JSON.stringify({ SvcID: ID }),
                dataType: "json",
                success: function (Result) {

                    Result = Result.d;
                    for (var i in Result) {
                        var AppCount = { name: "Total Application", y: Result[i].AppCount, drilldown: Result[i].drilldown };
                        var AppDisp = { name: "Application Disposed", y: Result[i].AppDisp, drilldown: Result[i].drilldown };
                        var AppPend = { name: "Application Pending", y: Result[i].AppPend, drilldown: Result[i].drilldown };
                        var AppAprov = { name: "Application Approve", y: Result[i].AppAprov, drilldown: Result[i].drilldown };
                        var AppRejct = { name: "Application Rejected", y: Result[i].AppRejct, drilldown: Result[i].drilldown };
                        $('#HDNSVCID').val(Result[i].SvcID);
                        DTEDrilldowndata.push(AppCount, AppDisp, AppPend, AppAprov, AppRejct);
                    }
                    BindDTEDeptChart(DTEDrilldowndata);
                    BindDTEQChart(DTEDrilldowndata);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            })
            return DTEDrilldowndata;
        }

        function BindDTEDeptDist(name) {

            var DTEDrilldowndata = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/GetDTEDeptDistrict",
                data: JSON.stringify({ year: name, SvcID: $('#HDNSVCID').val() }),
                dataType: "json",
                success: function (Result) {

                    Result = Result.d;
                    for (var i in Result) {
                        var serie = { name: Result[i].year, y: Result[i].amount };
                        DTEDrilldowndata.push(serie);
                    }
                    BindDTEDeptChart(DTEDrilldowndata);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            })
            return DTEDrilldowndata;
        }

        //function DTEDreawChart(series) {
        //    $('#DTEBarChart').highcharts({
        //        chart: {
        //            plotBackgroundColor: null,
        //            plotBorderWidth: 1,
        //            plotShadow: false
        //        },

        //        title: {
        //            text: null,
        //        },

        //        tooltip: {
        //            pointFormat: 'Application Received: <b>{point.y:.f}</b>'
        //        },

        //        xAxis: {
        //            type: 'category',
        //            labels: {
        //                style: {
        //                    fontSize: '13px',
        //                    fontFamily: 'Verdana, sans-serif'
        //                }
        //            }
        //        },
        //        series: [{
        //            type: 'column',
        //            name: 'Services : Applications Count',
        //            data: series,
        //            colorByPoint: true,
        //            dataLabels: {
        //                enabled: true,
        //                format: '{point.y:.f}',
        //                //rotation: -90,
        //                y: 5,
        //                style: {
        //                    fontSize: '10px',
        //                    fontFamily: 'Verdana, sans-serif'
        //                }
        //            }
        //        }]
        //    });
        //}
    </script>

    <%--CHART OF OUAT--%>

    <script type="text/javascript">
        function OUATDataTable() {
            var table = $("table[id$='DataGridView']").DataTable
                ({
                    "order": [[4, "desc"]]
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
        }
    </script>

    <script type="text/javascript">
        function OUATServiceList() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATServiceList",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATDrawChart1(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATDrawChart1(series) {
            $('#OUATAppCountChart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false
                },

                title: {
                    text: null,
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

    <script type="text/javascript">
        function OUATDistWiseAppCount() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATDistWiseAppCount",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATDrawChart2(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATDrawChart2(series) {
            $('#OUATDistAppCountChart').highcharts({
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
                    name: 'Application From District',
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
        function OUATDistWiseAppCount2() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATDistWiseAppCount2",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATDrawChart3(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATDrawChart3(series) {
            $('#OUATDistAgroCountChart').highcharts({
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
                    name: 'Application From District',
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
        function OUATAppPaymentCount() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATAppPaymentCount",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATDrawChart4(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATDrawChart4(series) {
            $('#OUATPaymentCountChart').highcharts({
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
                    name: 'Application From District',
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
        function OUATAppPaymentCount2() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATAppPaymentCount2",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATDrawChart5(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATDrawChart5(series) {
            $('#OUATPaymentCount2Chart').highcharts({
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
                    name: 'Payment List',
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
        function OUATDateWiseReport() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATDateWiseReport",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATDateChart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATDateChart(series) {
            $('#OUATDateCountChart').highcharts({
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
                    name: 'Date : Count',
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
        function OUATDateWiseReport2() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATDateWiseReport2",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATDateChart1(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATDateChart1(series) {
            $('#OUATDateCount2Chart').highcharts({
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
                    name: 'Date : Count',
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
        function OUATExamCenter1() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATExamCenter1",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATCenter1Chart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATCenter1Chart(series) {
            $('#OUATExamCenter1Chart').highcharts({
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
                    name: 'Exam Center : Count',
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
        function OUATExamCenter2() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Charts/DashboardData.asmx/OUATExamCenter2",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];
                    for (var i in Result) {
                        var serie = new Array(Result[i].Name, Result[i].Value);
                        data.push(serie);
                    }
                    OUATCenter2Chart(data);
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        };

        function OUATCenter2Chart(series) {
            $('#OUATExamCenter2Chart').highcharts({
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
                    name: 'Exam Center : Count',
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

<%-- ******** Chart Of OUAT Master / Doctoral ********--%>

        <script type="text/javascript">
            function OUATPGTotalApplication() {
                debugger;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "/WebApp/Charts/DashboardData.asmx/OUATPGTotalApplication",
                    data: "{}",
                    dataType: "json",
                    success: function (Result) {
                        debugger;
                        Result = Result.d;
                        var data = [];
                        var dataGraph = $.parseJSON(Result);
                        for (var key in dataGraph) {
                            var serie = { name: dataGraph[0].Text, y: dataGraph[0].Value,drilldown:true };
                            data.push(serie);
                        }
                        OUATPGTotalApp(data);
                    },
                    error: function (Result) {
                        alert(Result);
                    }
                });
            };

        function OUATPGTotalApp(series) {
            $('#PGApplicationChart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 1,
                    plotShadow: false,

                    events: {
                        drilldown: function (e) {
                            debugger;
                            if (!e.seriesOptions) {
                                var chart = this;
                                chart.showLoading('Loading Chart ... Please Wait!!!');
                                var dataArr = BindOUATPGDistrict(e.point.name);
                               
                                data = {
                                    name: e.point.name,
                                    data: dataArr
                                }
                                setTimeout(function () {
                                    chart.hideLoading();
                                    //chart.addSeriesAsDrilldown(e.point, data);
                                    //$('.highcharts - button highcharts- drillup - button highcharts- button - normal').show();
                                }, 1000);
                            }
                        }
                    }
                },

                    title: {
                        text: null,
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

                    yAxis: {
                        title: {
                            text: 'District Wise : Application Count'
                        },
                    },

                    series: [{
                        type: 'column',
                        name: 'PG : Applications Count',
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
                    }],
                         drilldown: {
                        series: [{
                            name: series.name,
                            colorByPoint: true,
                        }],
                    }
                });
            }

            function BindOUATPGDistrict() {

                var DTEDrilldowndata = [];
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "/WebApp/Charts/DashboardData.asmx/OUATPGDistrict",
                    data: "{}",
                    dataType: "json",
                    success: function (Result) {

                        Result = Result.d;
                        for (var i in Result) {
                            var serie = { name: Result[i].Name, y: Result[i].Count };
                            DTEDrilldowndata.push(serie);
                        }
                        OUATPGTotalApp(DTEDrilldowndata);
                    },
                    error: function (xhr, status, error) {
                        alert(xhr.responseText);
                    }
                })
                //return DTEDrilldowndata;
            }
            
    </script>

            <script type="text/javascript">
                function OUATPGPaidReport() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "/WebApp/Charts/DashboardData.asmx/OUATPGPaidReport",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            Result = Result.d;
                            var data = [];
                            for (var i in Result) {
                                var serie = new Array(Result[i].Name, Result[i].Count);
                                data.push(serie);
                            }
                            OUATPGPaidAppChart(data);
                        },
                        error: function (Result) {
                            alert(Result);
                        }
                    });
                };

                function OUATPGPaidAppChart(series) {
                    $('#OUATPGPaidAppChart').highcharts({
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
                                    fontSize: '13px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        },

                        yAxis: {
                            title: {
                                text: 'Total Application Paid'
                            },
                        },

                        series: [{
                            type: 'column',
                            colorByPoint: true,
                            name: 'Total Application Paid',
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
                function OUATPGTotalPaidReport() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "/WebApp/Charts/DashboardData.asmx/OUATPGTotalPaidReport",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            Result = Result.d;
                            var data = [];
                            for (var i in Result) {
                                var serie = new Array(Result[i].Name, Result[i].Count);
                                data.push(serie);
                            }
                            OUATPGTotalPaidAppChart(data);
                        },
                        error: function (Result) {
                            alert(Result);
                        }
                    });
                };

                function OUATPGTotalPaidAppChart(series) {
                    $('#OUATPGTotalPaidAppChart').highcharts({
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
                                    fontSize: '13px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        },

                        yAxis: {
                            title: {
                                text: 'Total Application Paid : Citizen - CSC'
                            },
                        },

                        series: [{
                            type: 'column',
                            colorByPoint: true,
                            name: 'Total Application Paid : Citizen - CSC',
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
                function OUATPGDateWiseReport() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "/WebApp/Charts/DashboardData.asmx/OUATPGDateWiseReport",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            Result = Result.d;
                            var data = [];
                            for (var i in Result) {
                                var serie = new Array(Result[i].Name, Result[i].Count);
                                data.push(serie);
                            }
                            OUATPGDateChart(data);
                        },
                        error: function (Result) {
                            alert(Result);
                        }
                    });
                };

                function OUATPGDateChart(series) {
                    $('#OUATPGDateChart').highcharts({
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
                                    fontSize: '13px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        },

                        yAxis: {
                            title: {
                                text: 'Date Wise : Application Count'
                            },
                        },

                        series: [{
                            type: 'column',
                            colorByPoint: true,
                            name: 'Date Wise : Count',
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

    <div class="mtop15"></div>
    <div style="min-height: 350px;">
        <%--<div class="row text-center" id="LoadingDiv" runat="server">
        <div class="loadfadeBg">

            <img src="../../WebApp/Login/Loading_hourglass_88px.gif" />
             <div style="opacity:1 !important;">Please Wait While Data Is Being Loaded...</div>
        </div>
        </div>--%>
        <div id="load">Please Wait While Chart Gets Prepared...</div>
        <div class="w95">
            <h1>Chart Dashboard</h1>
            <div class="col-lg-12 p0">
                <%--<p>Select the department to know the list of Services under Odisha Right to Public Services Act, 2012.</p>--%>
                <div style="background-color: rgba(217, 217, 217, 0.9); width: auto; height: 55px; border-radius: 5px; padding: 12px 10px 10px 10px;">
                    <div class="col-xs-4 mbtm20 pleft0"><b style="color: #000; line-height: 32px">Please Select</b></div>
                    <div class="col-xs-4 mbtm20">
                        <asp:DropDownList ID="ddlDept" ClientIDMode="Static" runat="server" Style="font-size: 13px; width: 500px; height: 32px; border: 2px solid #d8d8d8; margin-left: -310px;" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="-Select Department-" Value="ALL"></asp:ListItem>
                            <asp:ListItem Text="OUAT Admission" Value="OUAT"></asp:ListItem>
                            <asp:ListItem Text="OUAT Master Or Doctoral Program" Value="OUATPG"></asp:ListItem>
                            <asp:ListItem Text="OUAT Agro Diploma Program" Value="OUATAgroDiploma"></asp:ListItem>
                            <asp:ListItem Text="SIRB Recruitment" Value="OISF"></asp:ListItem>
                            <asp:ListItem Text="Skill Development and Technical Education Department (DTE)" Value="DTE"></asp:ListItem>
                            <asp:ListItem Text="Social Securities and Empowerment of Person with Disabilities (SSEPD)" Value="SSEPD"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div id="SSEPDept" runat="server">
            <div class="w95" id="CAPDEPT" runat="server">
                <div class="mtop15"></div>
                <div class="oisfHD ">Data Reports Under "Common Application Portal (CAP)</div>
                <div class="col-lg-12 p0" id="CAPDept001" runat="server">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Social Security and Empowerment of Person with Disabilities (SSEPD) Service Through (CAP)</div>
                    <div id="DrilDownChart"></div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95" id="CAPDept002" runat="server">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Services under SSEP Department : Year - 2017</div>
                    <div id="SSEPDBarChart"></div>
                </div>
            </div>
        </div>

        <div id="DEPTOISF" runat="server">
            <div class="mtop15"></div>
            <div class="w95">
                <div class="clearfix"></div>
                <div class="oisfHD" id="OISFDEPT" runat="server">Data Reports Under OISF Recruitment</div>
                <div class="clearfix"></div>
                <div class="col-lg-6  pleft0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Applications Count Report</div>
                    <div class="chartHoldBox">
                        <div id="BarChartNew"></div>
                    </div>
                </div>
                <div class="col-lg-6 pright0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Application Count : Category Wise Count Report</div>
                    <div class="chartHoldBox">
                        <div id="BarChartOld"></div>
                    </div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>District Wise Report Candidates Who Applied</div>
                    <div id="DistrictWiseChart"></div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Date Wise Count Report : Candidates Who Applied</div>
                    <div id="DateWiseChart"></div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-6  pleft0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Center Wise Report : On  Ground Physical Measurement</div>
                    <div class="chartHoldBox">
                        <div id="CenterWiseChart"></div>
                    </div>
                </div>
                <div class="col-lg-6 pright0">
                    <div class="headingChart"><i class="fa fa-pie-chart "></i>Category Wise Count : Percentage Report</div>
                    <div class="chartHoldBox">
                        <div id="PieChart"></div>
                    </div>
                </div>
            </div>
            <div class="w95">
                <div class="mtop15"></div>
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>District Wise Count : Qualified For Written Test</div>
                    <div id="QualifiedTestChart"></div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>SC Category - District Wise Count : Qualified For Written Test</div>
                    <div id="SCQWrittenChart"></div>
                </div>
            </div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>ST Category - District Wise Count : Qualified For Written Test</div>
                    <div id="STQWrittenChart"></div>
                </div>
            </div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>SEBC Category - District Wise Count : Qualified For Written Test</div>
                    <div id="SEBCQWrittenChart"></div>
                </div>
            </div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>UR Category - District Wise Count : Qualified For Written Test</div>
                    <div id="URQWrittenChart"></div>
                </div>
            </div>
            <div class="w95">
                <div class="row" style="margin: 0 auto">
                    <div class="col-lg-12 chartHoldBox p0">
                        <div class="headingChart"><i class="fa fa-bar-chart"></i>Event Wise Report : Candidate Who Qualified For Recruitement Events</div>
                        <div id="EventReportChart"></div>
                    </div>
                </div>
            </div>
        </div>

        <div id="DTEDept" runat="server">
            <div class="w95">
                <div class="mtop15"></div>
                <div class="oisfHD ">Data Reports Under "Common Application Portal (CAP)</div>
                <div class="col-lg-12 p0" id="Div3" runat="server">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Skill Development and Technical Education Department (DTE) Service Through (CAP)</div>
                    <div id="DTEDrilDownChart"></div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Services under DTE Department : Year - 2017</div>
                    <div id="DTEBarChart"></div>
                </div>
            </div>
        </div>

        <div id="OUATDept" runat="server">
            <div class="w95">
                <div class="mtop15"></div>
                <div class="oisfHD ">ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY (OUAT)</div>
                <div class="col-lg-12 p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Application Count</div>
                    <div id="OUATAppCountChart"></div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Application From All District : Form A - Year - 2017</div>
                    <div id="OUATDistAppCountChart"></div>
                </div>
            </div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Application From All District : Agro From  - Year - 2017</div>
                    <div id="OUATDistAgroCountChart"></div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-6  pleft0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>OUAT Total Payment Count</div>
                    <div class="chartHoldBox">
                        <div id="OUATPaymentCountChart"></div>
                    </div>
                </div>
                <div class="col-lg-6 pright0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>OUAT Total Payment Type </div>
                    <div class="chartHoldBox">
                        <div id="OUATPaymentCount2Chart"></div>
                    </div>
                </div>
            </div>
            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>OUAT Total Application Count : Date Wise - Form A </div>
                    <div id="OUATDateCountChart"></div>
                </div>
            </div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>OUAT Total Application Count : Date Wise - Agro From  </div>
                    <div id="OUATDateCount2Chart"></div>
                </div>
            </div>

            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>District Wise : First Choice Of Examanation Center </div>
                    <div id="OUATExamCenter1Chart"></div>
                </div>
            </div>
            <div class="w95">
                <div class="col-lg-12 chartHoldBox p0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>District Wise : Second Choice Of Examanation Center  </div>
                    <div id="OUATExamCenter2Chart"></div>
                </div>
            </div>

            <div class="clearfix"></div>
            <div class="mtop15"></div>
            <div class="w95" style="display: none">
                <div class="dataTable_wrapper" style="width: 100%; margin: 0 auto">
                    <div id="DisplayGrid" clientidmode="Static" class="chartHoldBox ptop5" runat="server">
                        <asp:GridView ID="DataGridView" ClientIDMode="Static" AutoGenerateColumns="true" OnPreRender="DataGridView_PreRender" runat="server"></asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="mtop15"></div>
        <div id="OUATPGDept" runat="server">
            <div class="w95">
                <div class="col-lg-12  pleft0" runat="server">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Application Count : Post Graduation</div>
                    <div class="chartHoldBox">
                        <div id="PGApplicationChart"></div>
                    </div>
                </div>

                            <div class="mtop15"></div>
            <div class="w95">
                <div class="col-lg-6  pleft0">
                    <div class="headingChart"><i class="fa fa-bar-chart "></i>Total Application Received</div>
                    <div class="chartHoldBox">
                        <div id="OUATPGPaidAppChart"></div>
                    </div>
                </div>
                <div class="col-lg-6 pright0">
                    <div class="headingChart"><i class="fa fa-pie-chart "></i>Total Application Paid</div>
                    <div class="chartHoldBox">
                        <div id="OUATPGTotalPaidAppChart"></div>
                    </div>
                </div>
            </div>

                <div class="col-lg-12 pright0" id="OISFDept004" runat="server">
                    <div class="headingChart"><i class="fa fa-pie-chart "></i>Total Application Count : Date Wise Application Count</div>
                    <div class="chartHoldBox">
                        <div id="OUATPGDateChart"></div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="HDNSVCID" ClientIDMode="Static" runat="server" />
    </div>
    <div class="clearfix"></div>
</asp:Content>