<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleCharPage.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.SampleCharPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--<script src="Script/accessibility.js"></script>
    <script src="Script/export-data.js"></script>
    <script src="Script/exporting.js"></script>
    <script src="Script/highcharts.js"></script>
    --%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script src="https://code.highcharts.com/modules/drilldown.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script>
        /*Chart showing*/
        $(document).ready(function () {
            StudentYearChart();
        });

        function StudentYearChart() {
            
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/G2G/SU/SampleCharPage.aspx/YearWiseStudent",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    BindBarChart(Result.d.series, Result.d.xAxis);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        };
        
            var chart;
            function BindBarChart_mohan(Series, XAxis) {
                debugger;

                var Data = {
                    "YrCategoty": "",
                    "YrName": "",
                    "YrCount": "",
                    "drilldown": [],
                    "YrData": [],
                };


                var YrLength = XAxis.categories.length;

                for (var i = 0; i < YrLength; i++) {
                    Data.YrName = XAxis.categories[i];
                    for (j = 0; j < Series[i].data.length; j++) {
                        if (j == 0) {
                            Data.YrCount = parseInt(Series[i].data[j]);
                        }
                        else {
                            Data.YrCount = Data.YrCount + parseInt(Series[i].data[j]);
                        }
                    }
                    Data.drilldown = [{
                        "name": Data.YrName,
                        "categories": "",
                        "data": []
                    }];
                }




                function setChart(name, categories, data, color) {
                    debugger;
                    console.log(name, categories, data, color);
                    chart.xAxis[0].setCategories(categories);
                    while (chart.series.length > 0) {
                        chart.series[0].remove(true);
                    }
                    for (var i = 0; i < data.length; i++) {
                        chart.addSeries({
                            name: name[i],
                            data: data[i],
                            color: color[i]
                        });

                    }
                }
                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'con1',
                        type: 'column'
                    },
                    title: {
                        text: 'Learner Responsive 16-18'
                    },
                    subtitle: {
                        text: 'Click the columns to view breakdown by department. Click again to view by Academic Year.'
                    },
                    xAxis: {
                        categories: categories
                        , labels: { rotation: -90, align: 'right' }
                    },
                    yAxis: {
                        title: {
                            text: 'Learner Responsive 16-18'
                        }
                    },

                    plotOptions: {
                        column: {
                            cursor: 'pointer',
                            point: {
                                events: {
                                    click: function () {
                                        var drilldown = this.drilldown;
                                        if (drilldown) { // drill down
                                            setChart([drilldown.name, drilldown.name1], drilldown.categories, [drilldown.data, drilldown.data1], [drilldown.color, drilldown.color1]);
                                        } else { // restore
                                            //setChart(name, [categories1, categories2, categories3, categories4], [data1, data2, data3, data4], 'white');
                                        }
                                    }
                                }
                            },

                            dataLabels: {
                                enabled: true,
                                color: colors[0],
                                style: {
                                    fontWeight: 'bold'
                                },
                                formatter: function () {
                                    return this.y; // +'%';
                                }
                            }
                        }
                    },

                    tooltip: {
                        formatter: function () {
                            var point = this.point,
                            series = point.series,
                            s = 'Learner Responsive 16-18' + '<br/>' + this.x + ' ' + series.name + ' is <b>' + this.y + '</b><br/>';
                            if (point.drilldown) {
                                s += 'Click to view <b>' + point.category + ' ' + series.name + ' </b>' + ' by department';
                            } else {
                                s += 'Click to return to view by academic year.';
                            }
                            return s;
                        }
                    },

                    series: [{
                        name: name1,
                        data: data1,
                        color: colors[0]
                    }, {
                        name: name2,
                        data: data2,
                        color: colors[1]
                    }, {
                        name: name3,
                        data: data3,
                        color: colors[3]
                    },
                    {
                        name: name4,
                        data: data4,
                        color: colors[4]
                    }],

                    exporting: {
                        enabled: false
                    }
                },
                function (chart) {
                    console.log(chart);
                });
            }
        
        function BindBarChart_old(Series, XAxis) {
            $('#StudentChart').highcharts({
                chart: {
                    type: 'bar'
                },
                title: {
                    text: null
                },
                xAxis: XAxis,
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Student (Count)'
                    }
                },
                //tooltip: {
                //    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                //    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                //        '<td style="padding:0"><b>{point.y:f}</b></td></tr>',
                //    footerFormat: '</table>',
                //    shared: true,
                //    useHTML: true
                //},
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true
                        }
                    },
                },
                series: Series
            });
        }
                
            var chart;
            function BindBarChart(Series, XAxis) {
                debugger;
                var colors = "";
                var dataArr = [];
                var nameArr = [];
                var colorArr = [];
                var categoryArr = [];
                var seriesArr = [];
                for (var i = 0; i < XAxis.categories.length; i++) {                                         
                        
                        //if (i == 0)
                        //    dataArr = ["data" + i + "=[{ y: " + Series[1].data[i] + ",color:color[" + i + "]}]"];
                        //else
                        //    dataArr = dataArr + [",data" + i + "=[{ y: " + Series[1].data[i] + ",color:color[" + i + "]}]"];
                   
                    nameArr[i] = ["name" + i];
                    dataArr[i] = ["data" + i + "=[{ y: " + Series[1].data[i] + ",color:color[" + i + "],"+
                        + " drilldown: {"+
                            + " name: '1011 Actual',"+
                            + " categories: ['BS', 'B', 'IT', 'C'],"+
                            + " data: [3, 32, 54, 50],"+
                            + " color: colors[0],"+

                            + " name1: '1011 Target',"+
                            + " data1: [0, 31, 50, 60],"+
                            + " color1: colors[1]"+
                        + " }}]"
                    ];
                    seriesArr[i] = ["[{ name: name" + i + ", data: " + Series[1].data[i] + ",color:color[" + i + "]}]"];
                    //Data.YrName = XAxis.categories[i];
                    //for (j = 0; j < Series[i].data.length; j++) {
                    //    if (j == 0) {
                    //        Data.YrCount = parseInt(Series[i].data[j]);
                    //    }
                    //    else {
                    //        Data.YrCount = Data.YrCount + parseInt(Series[i].data[j]);
                    //    }
                    //}
                    //Data.drilldown = [{
                    //    "name": Data.YrName,
                    //    "categories": "",
                    //    "data": []
                    //}];
                }

                var colors = Highcharts.getOptions().colors,
                categories1 = ['1011', '1112', '1213', '1415'],
                name1 = '2016',

                data1 = [
                    {
                        y: 5457,
                        color: colors[0],
                        drilldown: {
                            name: '1011 Actual',
                            categories: ['BS', 'B', 'IT', 'C'],
                            data: [3, 32, 54, 50],

                            color: colors[0],

                            name1: '1011 Target',
                            data1: [0, 31, 50, 60],
                            color1: colors[1]
                        }
                    }
                ];

                var colors = Highcharts.getOptions().colors,
                categories2 = ['1011', '1112', '1213', '1415'],
                name2 = '2017',

                data2 = [
                    {
                        y: 1234,
                        color: colors[1],
                        drilldown: {
                            name: '1011 Actual',
                            categories: ['BS', 'B', 'IT', 'C'],
                            data: [3, 32, 54, 50],

                            color: colors[0],

                            name1: '1011 Target',
                            data1: [0, 31, 50, 60],
                            color1: colors[1]
                        }
                    }
                ];

                function setChart(name, categories, data, color) {
                    debugger;
                    console.log(name, categories, data, color);
                    chart.xAxis[0].setCategories(categories);
                    while (chart.series.length > 0) {
                        chart.series[0].remove(true);
                    }
                    for (var i = 0; i < data.length; i++) {
                        chart.addSeries({
                            name: name[i],
                            data: data[i],
                            color: color[i]
                        });

                    }
                }
                debugger;
                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'con1',
                        type: 'column'
                    },
                    title: {
                        text: 'Learner Responsive 16-18'
                    },
                    subtitle: {
                        text: 'Click the columns to view breakdown by department. Click again to view by Academic Year.'
                    },
                    xAxis: {
                        categories: categories1
                        , labels: { rotation: -90, align: 'right' }
                    },
                    yAxis: {
                        title: {
                            text: 'Learner Responsive 16-18'
                        }
                    },

                    plotOptions: {
                        column: {
                            cursor: 'pointer',
                            point: {
                                events: {
                                    click: function () {
                                        var drilldown = this.drilldown;
                                        if (drilldown) { // drill down
                                            setChart([drilldown.name, drilldown.name1], drilldown.categories, [drilldown.data, drilldown.data1], [drilldown.color, drilldown.color1]);
                                        } else { // restore
                                            setChart(name, categories1, [data1, data2], 'white');
                                        }
                                    }
                                }
                            },

                            dataLabels: {
                                enabled: true,
                                color: colors[0],
                                style: {
                                    fontWeight: 'bold'
                                },
                                formatter: function () {
                                    return this.y; // +'%';
                                }
                            }
                        }
                    },

                    tooltip: {
                        formatter: function () {
                            var point = this.point,
                            series = point.series,
                            s = 'Learner Responsive 16-18' + '<br/>' + this.x + ' ' + series.name + ' is <b>' + this.y + '</b><br/>';
                            if (point.drilldown) {
                                s += 'Click to view <b>' + point.category + ' ' + series.name + ' </b>' + ' by department';
                            } else {
                                s += 'Click to return to view by academic year.';
                            }
                            return s;
                        }
                    },
                    
                    series: 
                    //    [{
                    //    name: name1,
                    //    data: data1,
                    //    color: colors[0]
                    //},
                    //{
                    //    name: name2,
                    //    data: data2,
                    //    color: colors[1]
                    //}]
                    //dataArr

(function () {
    // generate an array of random data
    var data = [],
        time = (new Date()).getTime(),
        i;

    for (i = -999; i <= 0; i += 1) {
        data.push([
            time + i * 1000,
            Math.round(Math.random() * 100)
        ]);
    }
    //for (var i = 0; i < XAxis.categories.length; i++) {
    //    data.push([
    //        Series[1].data[i],
    //    i.toString()
    //    ]);
    //}

    return data;
}())
                    ,

                    exporting: {
                        enabled: false
                    }
                },

                function (chart) {
                    console.log(chart);
                });
            }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="con1" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
            <div id="divChart" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
            <div id="StudentChart"></div>
        </div>
    </form>
</body>
</html>
