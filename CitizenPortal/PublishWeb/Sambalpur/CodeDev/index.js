var colors = ["#6babac", "#e55253"];

//Nursing Homes
var isFirstLevel = true;
var cntFactNHMdata = [];
var cntFactNHMBardata = [];
//CLINICAL ESTABLISHMENT
var isFirstLevelCLINICAL = true;
var cntFactCLINICALBardata = [];
var cntFactCLINICALdata = [];
//Multi Speciality
var isFirstLevelMultiSpeciality = true;
var NursingHomeBySpecialitydata = [];
var MultiSpecialityDrilldata = [];

//Institute Type
var isFirstLevelInstituteType = true;
var InstituteTypedata = [];
var InstituteTypeDrilldata = [];

$(function () {
    //Nursing Homes
    GetCountByFacilityTypeNHMDrill();
    GetCountByFacilityTypeNHMBar();
    //CLINICAL ESTABLISHMENT
    GetCountByFacilityTypeCLINICALDrill();
    GetCountByFacilityTypeCLINICALBar();
    //Multi Speciality
    GetNursingHomeByMultiSpecialityDrill();
    GetNursingHomeBySpecialityBar();
    //Institute Type
    GetNursingHomeByInstituteTypeBar();

});


function GetNursingHomeByInstituteTypeBar()
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/DashBoardDrill.aspx/GetNursingHomeByInstituteTypeBar',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            InstituteTypedata = $.parseJSON(response.d);

            BarGetNursingHomeByInstituteType();

            console.log("InstituteType:-" + InstituteTypedata);
            //Blockdata = eval(jsonData.list);




        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetNursingHomeBySpecialityBar()
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/DashBoardDrill.aspx/GetNursingHomeByMultiSpecialityBar',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            NursingHomeBySpecialitydata = $.parseJSON(response.d);
            
            BarGetNursingHomeBySpecialityBar();

            console.log("Speciality:-"+NursingHomeBySpecialitydata);
            //Blockdata = eval(jsonData.list);




        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
function GetNursingHomeByMultiSpecialityDrill()
{
        $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/DashBoardDrill.aspx/GetNursingHomeByMultiSpecialityDrill',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            MultiSpecialityDrilldata = $.parseJSON(response.d);
            DrillDownChartNursingHomeByMultiSpeciality();

            console.log("3 Drill:-"+MultiSpecialityDrilldata);
            //Blockdata = eval(jsonData.list);




        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}
function GetCountByFacilityTypeCLINICALBar()
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/DashBoardDrill.aspx/GetCountByFacilityTypeNHMBar',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            cntFactCLINICALBardata = $.parseJSON(response.d);
            BarGetCountByFacilityTypeCLINICAL();

            console.log("FacilityTypeCLINICAL" + cntFactNHMBardata);
            //Blockdata = eval(jsonData.list);




        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetCountByFacilityTypeNHMBar() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/DashBoardDrill.aspx/GetCountByFacilityTypeNHMBar',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            cntFactNHMBardata = $.parseJSON(response.d);
            BarGetCountByFacilityTypeNHM();

            console.log("FacilityTypeNHM"+cntFactNHMBardata);
            //Blockdata = eval(jsonData.list);




        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetCountByFacilityTypeNHMDrill() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/DashBoardDrill.aspx/GetCountByFacilityTypeNHMDrill',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            cntFactNHMdata = $.parseJSON(response.d);
            DrillDownChartNHCountANC();

            console.log("2 Drill:-" + cntFactNHMdata);
            //Blockdata = eval(jsonData.list);




        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
function GetCountByFacilityTypeCLINICALDrill() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/NHMDashboard/DashBoardDrill.aspx/GetCountByFacilityTypeCLINICALDrill',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;

            cntFactCLINICALdata = $.parseJSON(response.d);
            DrillDownChartCLINICALCountANC();

            console.log("2 Drill:-" + cntFactNHMdata);
            //Blockdata = eval(jsonData.list);




        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function BarGetNursingHomeByInstituteType() {

    $("#barInstituteType").dxChart({
        dataSource: InstituteTypedata,
        palette: "soft",
        title: "Facility/Hospital- Allopathic ",
        commonSeriesSettings: {
            type: "bar",
            valueField: "Count",
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

function BarGetNursingHomeBySpecialityBar() {

    $("#barGetNursingHomeBySpecialityBar").dxChart({
        dataSource: NursingHomeBySpecialitydata,
        palette: "soft",
        title: "Hospital Categorization Multi Specialist-District Wise",
        commonSeriesSettings: {
            type: "bar",
            valueField: "Count",
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

function BarGetCountByFacilityTypeCLINICAL() {
    
    $("#barFacilityTypeCLINICALchart").dxChart({
        dataSource: cntFactCLINICALBardata,
        palette: "soft",
        title: {

        },
        commonSeriesSettings: {
            type: "bar",
            valueField: "Count",
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

function BarGetCountByFacilityTypeNHM() {

    $("#barFacilityTypeNHMchart").dxChart({
        dataSource: cntFactNHMBardata,
        palette: "soft",
        title: {

        },
        commonSeriesSettings: {
            type: "bar",
            valueField: "Count",
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

function DrillDownChartNHCountANC() {
    //DrillDown
    var chartContainer = $("#drillNHCountchart"),
       chart = chartContainer.dxChart({
           dataSource: filterData(""),
           palette: "soft",

           title: "No of Facilities (NURSING HOME)",
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

function filterData(name) {
    return cntFactNHMdata.filter(function (item) {
        return item.parentID === name;
    });
}

function DrillDownChartCLINICALCountANC() {
    //DrillDown
    var chartContainer = $("#drillCLINICALCountchart"),
       chart = chartContainer.dxChart({
           dataSource: filterCLINICALData(""),
           palette: "soft",

           title: "No of Facilities (CLINICAL ESTABLISHMENT)",
           series: {
               type: "bar",
               color: '#000'
           },
           legend: {
               visible: false
           },
          
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
               if (isFirstLevelCLINICAL) {
                   isFirstLevelCLINICAL = false;
                   removePointerCursor(chartContainer);
                   chart.option({
                       dataSource: filterCLINICALData(e.target.originalArgument)
                   });
                   $("#CLINICALbackButton")
                       .dxButton("instance")
                       .option("visible", true);
               }
           },
           customizePoint: function () {
               var pointSettings = {
                   color: colors[Number(isFirstLevelCLINICAL)]
               };

               if (!isFirstLevelCLINICAL) {
                   pointSettings.hoverStyle = {
                       hatching: "none"
                   };
               }

               return pointSettings;
           }
       }).dxChart("instance");

    $("#CLINICALbackButton").dxButton({
        text: "Back",
        icon: "chevronleft",
        visible: false,
        onClick: function () {
            if (!isFirstLevelCLINICAL) {
                isFirstLevelCLINICAL = true;
                addPointerCursor(chartContainer);
                chart.option("dataSource", filterCLINICALData(""));
                this.option("visible", false);
            }
        }
    });

    addPointerCursor(chartContainer);
}




function filterCLINICALData(name) {
    return cntFactCLINICALdata.filter(function (item) {
        return item.parentID === name;
    });
}


function DrillDownChartNursingHomeByMultiSpeciality() {
    //DrillDown
    var chartContainer = $("#drillNHMultiSpeciality"),
       chart = chartContainer.dxChart({
           dataSource: filterNHMultiSpecialityData(""),
           palette: "soft",

           title: "Hospital Categorization Multi Specialist Drill Down",
           series: {
               type: "bar",
               color: '#000'
           },
           legend: {
               visible: false
           },

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
               if (isFirstLevelMultiSpeciality) {
                   isFirstLevelMultiSpeciality = false;
                   removePointerCursor(chartContainer);
                   chart.option({
                       dataSource: filterNHMultiSpecialityData(e.target.originalArgument)
                   });
                   $("#NHMultiSpecialitybackButton")
                       .dxButton("instance")
                       .option("visible", true);
               }
           },
           customizePoint: function () {
               var pointSettings = {
                   color: colors[Number(isFirstLevelMultiSpeciality)]
               };

               if (!isFirstLevelMultiSpeciality) {
                   pointSettings.hoverStyle = {
                       hatching: "none"
                   };
               }

               return pointSettings;
           }
       }).dxChart("instance");

    $("#NHMultiSpecialitybackButton").dxButton({
        text: "Back",
        icon: "chevronleft",
        visible: false,
        onClick: function () {
            if (!isFirstLevelMultiSpeciality) {
                isFirstLevelMultiSpeciality = true;
                addPointerCursor(chartContainer);
                chart.option("dataSource", filterNHMultiSpecialityData(""));
                this.option("visible", false);
            }
        }
    });

    addPointerCursor(chartContainer);
}




function filterNHMultiSpecialityData(name) {
    return MultiSpecialityDrilldata.filter(function (item) {
        return item.parentID === name;
    });
}

function addPointerCursor(container) {
    container.addClass("pointer-on-bars");
}

function removePointerCursor(container) {
    container.removeClass("pointer-on-bars");
}
