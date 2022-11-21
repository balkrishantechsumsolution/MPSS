var Districtdata = [];
var Blockdata = [];
var strYear = "2018-19";
var colors = ["#6babac", "#e55253"];
var isFirstLevel = true;
var data=[];
//Chart and Grid 1
var Districtdata1 = [];
var Blockdata1 = [];
var isFirstLevel1 = true;
var data1 = [];
//Bar Chart
var DistrictBardata = [];
var DistrictBarCMPdata = [];

$(function () {
    BindGridANC(strYear);
    BindChatANC(strYear);
    BindChatANCCMP();
    BindBarANC(strYear);
    //Chart and Grid 1
    BindGridANC1(strYear);
    BindChatANC1(strYear);

    $('#ddlYear').change(function () {
    debugger;

        strYear = $("#ddlYear option:selected").val();
        BindGridANC(strYear);
        BindChatANC(strYear);
        BindBarANC(strYear);

        //Chart and Grid 1
        BindGridANC1(strYear);
        BindChatANC1(strYear);
    });

       
});

function BindChatANCCMP() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/departmentcharts.aspx/GetChartANCCMPData',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            var jsonData = $.parseJSON(response.d);
            DistrictBarCMPdata = eval(jsonData.listChartCMP);
            console.log(DistrictBarCMPdata);
            //Blockdata = eval(jsonData.list);

            BarChatANCCMP();


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

function BarChatANCCMP()
{
    $("#sidebarchart").dxChart({
        dataSource: DistrictBarCMPdata,
        commonSeriesSettings: {
            argumentField: "arg",
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
            { valueField: "val1", name: "2018-2019" },
            { valueField: "val2", name: "2017-2018" },
            
        ],
        tooltip: {
            enabled: true,
            customizeTooltip: function (arg) {
                return {
                    text: 'Current : ' + arg.value + '<br>' + ' ' + arg.argument
                };
            }
        },
        title: "Compare Between 2018-19- 2017-18",
        legend: {
            verticalAlignment: "bottom",
            horizontalAlignment: "center"
        },
        "export": {
            enabled: true
        },
        onPointClick: function (e) {
            e.target.select();
        }
    });
}
function BindBarANC(strYear) {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/departmentcharts.aspx/GetGridData',
        data: '{"prefix": "","strYear":"' + strYear + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            var jsonData = $.parseJSON(response.d);
            DistrictBardata = eval(jsonData.list1);
            //Blockdata = eval(jsonData.list);

            BarChartANC();


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}
function  BarChartANC()
{
    //$("#barchart").dxChart({
    //    dataSource: DistrictBardata,
    //    series: {
    //        argumentField: "District",
    //        valueField: "PercentageANCRegFirstTri",
    //        name: "Bar District",
    //        type: "bar",
    //        color: '#ffaa66'
    //    },
    //    tooltip: {
    //        enabled: true,
    //        customizeTooltip: function (arg) {
    //            return {
    //                text: 'Current : ' + arg.value + '<br>' + ' ' + arg.argument
    //            };
    //        }
    //    },
    //    "export": {
    //        enabled: true
    //    },
    //});
    $("#barchart").dxChart({
        dataSource: DistrictBardata,
        palette: "soft",
        title: {
           
        },
        commonSeriesSettings: {
            type: "bar",
            valueField: "PercentageANCRegFirstTri",
            argumentField: "District",
            ignoreEmptyPoints: true
        },
        seriesTemplate: {
            nameField: "District"
        },
            tooltip: {
                enabled: true,
                customizeTooltip: function (arg) {
                    return {
                        text: 'Current : ' + arg.value + '<br>' + ' ' + arg.argument
                    };
                }
            },
            "export": {
                enabled: true
            }
    });
}
function BindChatANC(strYear)
{

    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/departmentcharts.aspx/GetChartData',
        data: '{"prefix": "","strYear":"' + strYear + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            var jsonData = $.parseJSON(response.d);
            
            data = eval(jsonData.listChart);

            DrillDownChartANC();


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

 

function BindGridANC(strYear)
{
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/departmentcharts.aspx/GetGridData',
        data: '{"prefix": "","strYear":"' + strYear + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            var jsonData = $.parseJSON(response.d);
            Districtdata = eval(jsonData.list1);
            Blockdata = eval(jsonData.list);

            DrillDownGridANC();


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}
function BindChatANC1(strYear)
{

    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/departmentcharts.aspx/GetChartData1',
        data: '{"prefix": "","strYear":"' + strYear + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            var jsonData = $.parseJSON(response.d);
            
            data1 = eval(jsonData.listChart);

            DrillDownChartANC1();


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

 

function BindGridANC1(strYear)
{
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/departmentcharts.aspx/GetGridData1',
        data: '{"prefix": "","strYear":"' + strYear + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            var jsonData = $.parseJSON(response.d);
            Districtdata1 = eval(jsonData.list1);
            Blockdata1 = eval(jsonData.list);

            DrillDownGridANC1();


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

function DrillDownGridANC() {
    $("#gridContainer").dxDataGrid({
        dataSource: Districtdata,
        keyExpr: "DistrictCode",
        showBorders: true,
        columns: [{
            dataField: "District",
            caption: "District",
            width: 400
        },
          {
              dataField: "Year",
              caption: "Year",
              width: 70
          },
          {
              dataField: "Period",
              caption: "Period",
              width: 70
          },
           {
               dataField: "ANCIn1stTrimester",
               caption: "ANC in 1st Trimester",
               width: 70
           },
            {
                dataField: "TotalANCReg",
                caption: "Total ANC Reg",
                width: 70
            },
          {
              dataField: "PercentageANCRegFirstTri",
              caption: "PercentageANCRegFirstTri",
              width: 70
          }

        ],
        masterDetail: {
            enabled: true,
            template: function (container1, options) {
                var currentData = options.data;

                $("<div>")
                    .addClass("master-detail-caption")
                    .text(currentData.District + "'s Blocks:")
                    .appendTo(container1);

                $("<div>")
                    .dxDataGrid({
                        dataSource: new DevExpress.data.DataSource({
                            store: new DevExpress.data.ArrayStore({
                                key: "DistrictCode",
                                data: Blockdata
                            }),
                            filter: ["DistrictCode", "=", options.key]
                        }),
                        columnAutoWidth: true,
                        showBorders: true,
                        columns: [
                             {
                                 dataField: "BlocksAsPerNHM",
                                 caption: "BlocksAsPerNHM",
                                 width: 400
                             },
                             {
                                 dataField: "District",
                                 caption: "District",
                                 width: 400
                             },
                             //{
                             //    dataField: "Year",
                             //    caption: "Year",
                             //    width: 70
                             //},
                             {
                                 dataField: "Period",
                                 caption: "Period",
                                 width: 70
                             },
                                {
                                    dataField: "ANCIn1stTrimester",
                                    caption: "ANC in 1st Trimester",
                                    width: 70
                                },
                                {
                                    dataField: "TotalANCReg",
                                    caption: "Total ANC Reg",
                                    width: 70
                                },
                             {
                                 dataField: "PercentageANCRegFirstTri",
                                 caption: "PercentageANCRegFirstTri",
                                 width: 70
                             }
                        ]


                    }).appendTo(container1);
            }
        }
    });
}



function DrillDownChartANC() {
    //DrillDown
    var chartContainer = $("#chart"),
       chart = chartContainer.dxChart({
           dataSource: filterData(""),
           palette: "soft",
           //title: "Percentage of ANC registered within the first trimester",
           series: {
               type: "bar",
               color: '#000'
           },
           legend: {
               visible: false
           },
           //series: {
           //    argumentField: "arg",
           //    valueField: "val",
           //    name: "Text ",
           //    type: "bar",
           //    color: '#ffaa66'
           //},
           valueAxis: {
               showZero: false
           },
           tooltip: {
               enabled: true,
               customizeTooltip: function (arg) {
                   return {
                       text: 'Current : ' + arg.value + '<br>' + ' ' + arg.argument
                   };
               }
           },
           "export": {
               enabled: true
           },
           
           onPointClick: function (e) {
               if (isFirstLevel) {
                   isFirstLevel = false;
                   removePointerCursor(chartContainer);
                   chart.option({
                       dataSource: filterData(e.target.originalArgument)
                   });
                   $("#backButton")
                       .dxButton("instance")
                       .option("visible", true);
               }
           },
           customizePoint: function () {
               var pointSettings = {
                   color: colors[Number(isFirstLevel)]
               };

               if (!isFirstLevel) {
                   pointSettings.hoverStyle = {
                       hatching: "none"
                   };
               }

               return pointSettings;
           }
       }).dxChart("instance");

    $("#backButton").dxButton({
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
    });

    addPointerCursor(chartContainer);
}


//Grid and Chart1
function DrillDownGridANC1() {
    $("#gridContainer1").dxDataGrid({
        dataSource: Districtdata1,
        keyExpr: "DistrictCode",
        showBorders: true,
        columns: [{
            dataField: "District",
            caption: "District",
            width: 400
        },
          {
              dataField: "Year",
              caption: "Year",
              width: 70
          },
          {
              dataField: "Period",
              caption: "Period",
              width: 70
          },
           
            {
                dataField: "TotalANCReg",
                caption: "Total ANC Reg",
                width: 70
            },
            {
                dataField: "EstimatedPregnancyAnnual",
                caption: "EstimatedPregnancyAnnual",
                width: 70
            },
          {
              dataField: "PercentagePWRegAgstEstPreAnnual",
              caption: "PercentagePWRegAgstEstPreAnnual",
              width: 70
          }

        ],
        masterDetail: {
            enabled: true,
            template: function (container1, options) {
                var currentData = options.data;

                $("<div>")
                    .addClass("master-detail-caption")
                    .text(currentData.District + "'s Blocks:")
                    .appendTo(container1);

                $("<div>")
                    .dxDataGrid({
                        dataSource: new DevExpress.data.DataSource({
                            store: new DevExpress.data.ArrayStore({
                                key: "DistrictCode",
                                data: Blockdata1
                            }),
                            filter: ["DistrictCode", "=", options.key]
                        }),
                        columnAutoWidth: true,
                        showBorders: true,
                        columns: [
                             {
                                 dataField: "BlocksAsPerNHM",
                                 caption: "BlocksAsPerNHM",
                                 width: 400
                             },
                             {
                                 dataField: "District",
                                 caption: "District",
                                 width: 400
                             },
                             //{
                             //    dataField: "Year",
                             //    caption: "Year",
                             //    width: 70
                             //},
                             {
                                 dataField: "Period",
                                 caption: "Period",
                                 width: 70
                             },
                                 {
                                     dataField: "TotalANCReg",
                                     caption: "Total ANC Reg",
                                     width: 70
                                 },
                                 {
                                     dataField: "EstimatedPregnancyAnnual",
                                     caption: "EstimatedPregnancyAnnual",
                                     width: 70
                                 },
                               {
                                   dataField: "PercentagePWRegAgstEstPreAnnual",
                                   caption: "PercentagePWRegAgstEstPreAnnual",
                                   width: 70
                               }
                        ]


                    }).appendTo(container1);
            }
        }
    });
}



function DrillDownChartANC1() {
    //DrillDown
    var chartContainer = $("#chart1"),
       chart = chartContainer.dxChart({
           dataSource: filterData1(""),
           //title: "Percentage of ANC registered within the first trimester",
           series: {
               type: "bar"
           },
           legend: {
               visible: false
           },
          
           valueAxis: {
               showZero: true
           },
           tooltip: {
               enabled: true,
               customizeTooltip: function (arg) {
                   return {
                       text: 'Current : ' + arg.value + '<br>' + ' ' + arg.argument
                   };
               }
           },
           "export": {
               enabled: true
           },
           onPointClick: function (e) {
               if (isFirstLevel1) {
                   isFirstLevel1 = false;
                   removePointerCursor(chartContainer);
                   chart.option({
                       dataSource: filterData1(e.target.originalArgument)
                   });
                   $("#backButton1")
                       .dxButton("instance")
                       .option("visible", true);
               }
           },
           customizePoint: function () {
               var pointSettings = {
                   color: colors[Number(isFirstLevel1)]
               };

               if (!isFirstLevel1) {
                   pointSettings.hoverStyle = {
                       hatching: "none"
                   };
               }

               return pointSettings;
           }
       }).dxChart("instance");

    $("#backButton1").dxButton({
        text: "Back",
        icon: "chevronleft",
        visible: false,
        onClick: function () {
            if (!isFirstLevel1) {
                isFirstLevel1 = true;
                addPointerCursor(chartContainer);
                chart.option("dataSource", filterData1(""));
                this.option("visible", false);
            }
        }
    });

    addPointerCursor(chartContainer);
}

function filterData1(name) {
    return data1.filter(function (item) {
        return item.parentID === name;
    });
}
//End Grid and Chart1

function filterData(name) {
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


