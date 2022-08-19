<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleDrillDownReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.Sample.SampleDrillDownReport" %>

<%@ Register Src="~/Sambalpur/controls/SEMFEEChart.ascx" TagPrefix="uc1" TagName="SEMFEEChart" %>
<%@ Register Src="~/Sambalpur/controls/GridDrillDown.ascx" TagPrefix="uc1" TagName="GridDrillDown" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    
    <script src="../../../Sambalpur/CodeDev/js/jquery.js"></script>
    <%--<script src="../../../Sambalpur/CodeDev/js/cldr.min.js"></script>
    <script src="../../../Sambalpur/CodeDev/js/cldr/event.min.js"></script>
    <script src="../../../Sambalpur/CodeDev/js/cldr/supplemental.min.js"></script>
    <script src="../../../Sambalpur/CodeDev/js/cldr/unresolved.min.js"></script>
    <script src="../../../Sambalpur/CodeDev/js/globalize.min.js" type="text/javascript"></script>
    <script src="../../../Sambalpur/CodeDev/js/globalize/message.min.js" type="text/javascript"></script>
    <script src="../../../Sambalpur/CodeDev/js/globalize/number.min.js" type="text/javascript"></script>
    <script src="../../../Sambalpur/CodeDev/js/globalize/currency.min.js" type="text/javascript"></script>
    <script src="../../../Sambalpur/CodeDev/js/globalize/date.min.js" type="text/javascript"></script>
    <link href="/../../../Sambalpur/CodeDev/css/dx.common.css" type="text/css" rel="stylesheet" />
    <link href="/../../../Sambalpur/CodeDev/css/dx.light.css" rel="dx-theme" data-theme="generic.light" />--%>
    <script src="../../../Sambalpur/CodeDev/js/dx.all.js" type="text/javascript"></script>
   
    <script>
        var ilevel = 0;        
        var isFirstleveli = true;
        var cntInternal = [];
        var chart = "";
        $(document).ready(function () {
            //GetStudentCount(t_LoginID,t_AdmissionYear,t_College,t_BranchCode,t_HonsCode, t_ReportType);
            GetStudentInternal(ilevel);
        });

        function GetStudentInternal(ilevel) {
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/G2G/Sample/SampleDrillDownReport.aspx/GetStudentInternal',
                data: '{}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    debugger;
                    cntInternal = $.parseJSON(response.d);
                    GetStudentInternalChart(ilevel);
                    console.log("2 Drill:-" + cntInternal);
                    //Blockdata = eval(jsonData.list);
                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }

        function GetStudentInternalChart(ilevel) {
            var ichartContainer = $("#chart"),
            chart = ichartContainer.dxChart({
                dataSource: cntInternal,// ifilterData(""), //dataSource,
                commonSeriesSettings: {
                    argumentField: "BranchCode",
                    type: "bar",
                    hoverMode: "allArgumentPoints",
                    selectionMode: "allArgumentPoints",
                    label: {
                        visible: true,
                        format: {
                            type: "fixedPoint",
                            precision: 0
                        }
                    }
                },
                series: [
                    { valueField: "SEM", name: "Paid Fee" },
                    { valueField: "TH", name: "Internal" },
                    { valueField: "PM", name: "Practical" }
                ],
                title: "Student Count of Internal Assessment",
                legend: {
                    verticalAlignment: "bottom",
                    horizontalAlignment: "center"
                },
                "export": {
                    enabled: true
                },
                onPointClick: function (e) {
                    debugger;
                    e.target.select();                    
                    if (ilevel == 0) {
                        ilevel = 1;
                        chart.option({
                            dataSource: ifilterData(e.target.originalArgument)
                        });
                        //alert(dataSource);
                    } else if (ilevel == 1) {
                        ilevel = 2;
                        //removePointerCursor(SchartContainer);
                        chart.option({
                            dataSource: ifilterData(e.target.originalArgument)
                        });
                    }
                }
            }).dxChart("instance");

            addPointerCursor(ichartContainer);
        }

        function ifilterData(name) {

            if (ilevel > 2) {
                debugger;
                return cntInternal.filter(function (item) {
                    return item.arg === name;
                });
            }

            return cntInternal.filter(function (item) {
                return item.parentid === name;
            });
        }

        function addPointerCursor(container) {
            container.addClass("pointer-on-bars");
        }

    </script>

    
    <%--<script>

        var level = 0;

        $(function () {
            var chartContainer = $("#chart"),
            chart = chartContainer.dxChart({
                dataSource: filterData(""),
                title: "The Most Populated Countries by Continents",
                series: {
                    type: "bar"
                },
                legend: {
                    visible: false
                },
                valueAxis: {
                    showZero: false
                },
                onPointClick: function (e) {


                    if (level == 0) {
                        level = 1;
                        //removePointerCursor(chartContainer);
                        chart.option({
                            dataSource: filterData(e.target.originalArgument)
                        });

                        /*$("#backButton")
                            .dxButton("instance")
                            .option("visible", true);*/
                    }
                    else if (level == 1) {

                        level = 2;
                        //removePointerCursor(chartContainer);
                        chart.option({
                            dataSource: filterData(e.target.originalArgument)
                        });
                    }

                    else if (level == 2) {
                        level = 0;
                        chart.option("dataSource", filterData(""));
                    }


                },
                /*customizePoint: function () {
                    var pointSettings = {
                        color: colors[Number(isFirstLevel)]
                    };
    
                    if (level) {
                        pointSettings.hoverStyle = {
                            hatching: "none"
                        };
                    }
    
                    return pointSettings;
                }*/
            }).dxChart("instance");

            /* $("#backButton").dxButton({
                 text: "Back",
                 icon: "chevronleft",
                 visible: false,
                 onClick: function () {
                     if (!isFirstLevel) {
                         isFirstLevel = true;
                         addPointerCursor(chartContainer);
                         chart.option("dataSource", filterData(""));
                         this.option("visible", false);
                     }
                 }
             });*/

            addPointerCursor(chartContainer);
        });

        function filterData(name) {

            if (level > 1) {
                debugger;
                return data.filter(function (item) {
                    return item.arg === name;
                });
            }

            return data.filter(function (item) {
                return item.parentID === name;
            });
        }

        function addPointerCursor(container) {
            container.addClass("pointer-on-bars");
        }

        function removePointerCursor(container) {
            container.removeClass("pointer-on-bars");
        }


        var colors = ["#6babac", "#e55253"];

        var data = [
            { arg: "Asia", val: 3007613498, parentID: "" },
            { arg: "North America", val: 493603615, parentID: "" },
            { arg: "Europe", val: 438575293, parentID: "" },
            { arg: "Africa", val: 381331438, parentID: "" },
            { arg: "South America", val: 331126555, parentID: "" },
            { arg: "Nigeria", val: 181562056, parentID: "Africa" },
            { arg: "Egypt", val: 88487396, parentID: "Africa" },
            { arg: "Congo", val: 77433744, parentID: "Africa" },
            { arg: "Morocco", val: 33848242, parentID: "Africa" },
            { arg: "China", val: 1380083000, parentID: "Asia" },
            { arg: "India", val: 1306687000, parentID: "Asia" },
            { arg: "Pakistan", val: 193885498, parentID: "Asia" },
            { arg: "Japan", val: 126958000, parentID: "Asia" },
            { arg: "Russia", val: 146804372, parentID: "Europe" },
            { arg: "Germany", val: 82175684, parentID: "Europe" },
            { arg: "Turkey", val: 79463663, parentID: "Europe" },
            { arg: "France", val: 66736000, parentID: "Europe" },
            { arg: "United Kingdom", val: 63395574, parentID: "Europe" },
            { arg: "United States", val: 325310275, parentID: "North America" },
            { arg: "Mexico", val: 121005815, parentID: "North America" },
            { arg: "Canada", val: 36048521, parentID: "North America" },
            { arg: "Cuba", val: 11239004, parentID: "North America" },
            { arg: "Brazil", val: 205737996, parentID: "South America" },
            { arg: "Colombia", val: 48400388, parentID: "South America" },
            { arg: "Venezuela", val: 30761000, parentID: "South America" },
            { arg: "Peru", val: 28220764, parentID: "South America" },
            { arg: "Chile", val: 18006407, parentID: "South America" }
        ];
    </script>--%>
  
    <style>#chart {
    height: 440px;
}</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="demo-container">
            <div id="chart"></div>
        </div>
    </form>
</body>
</html>
