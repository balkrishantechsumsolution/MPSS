<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GridDrillDown.ascx.cs" Inherits="CitizenPortal.Sambalpur.controls.GridDrillDown" %>
<%--<script src="../../../Scripts/jquery-2.2.3.min.js"></script>
<script src="/Scripts/jquery-ui-1.11.4.min.js"></script>--%>

<style>
    #divStudentChart {
        margin: 5px;
        height: 220px;        
        width: auto;
        border:1px solid #e9e9e9;
    }
    #divStudentChart.pointer-on-bars .dxc-series rect {
        cursor: pointer;
    }
    </style>
<script>
    var t_College = "";
    var t_ReportType = "0"
    var t_AdmissionYear = "0";
    var t_BranchCode = "0";
    var t_HonsCode = "0";
    var t_LoginID = "0";
    var t_HTML = "";
    var Slevel = 0;
    var Scolors = ["#6babac", "#e55253"];
    var isFirstSlevel = true;
    var cntAdmission = [];

    $(document).ready(function () {        
       /* GetStudentCount(t_LoginID,t_AdmissionYear,t_College,t_BranchCode,t_HonsCode, t_ReportType);*/
        //GetStudentChart(Slevel);
    });    

    function GetStudentChart(Slevel) {
        debugger;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/G2G/Sample/SampleDrillDownReport.aspx/GetStudentChart',
            data: '{}',
            processData: false,
            dataType: "json",
            success: function (response) {
                debugger;
                cntAdmission = $.parseJSON(response.d);
                GetStudentChartDrill(Slevel);
                console.log("2 Drill:-" + cntAdmission);
                //Blockdata = eval(jsonData.list);
            },
            error: function (a, b, c) {
               /* alert("2." + a.responseText);*/
            }
        });
    }

    function GetStudentChartDrill(Slevel) {
        
        debugger;
        $('#divStudentChart').show();
        $('#DataGrid').html("");
        $('#DataGrid').hide();
        //DrillDown
        var SchartContainer = $("#divStudentChart"),
           chart = SchartContainer.dxChart({
               dataSource: SfilterData(""),
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
               "export": {
                   enabled: false
               },
               onPointClick: function (e) {
                       if (Slevel == 0) {
                           Slevel = 1;
                           //removePointerCursor(SchartContainer);
                           chart.option({
                               dataSource: SfilterData(e.target.originalArgument)
                           });
                           /*$("#backButton")
                               .dxButton("instance")
                               .option("visible", true);*/
                       }
                   else if (Slevel == 1) {
                       Slevel = 2;
                       //removePointerCursor(SchartContainer);
                       chart.option({
                           dataSource: SfilterData(e.target.originalArgument)
                       });
                   }
                   else if (Slevel == 2) {
                       Slevel = 3;
                       //chart.option("dataSource", SfilterData(""));
                       chart.option({
                           dataSource: SfilterData(e.target.originalArgument)
                       });
                   }
                   else if (Slevel == 3) {
                       Slevel = 4;
                       //chart.option("dataSource", SfilterData(""));
                       
                       if (e.target.data["BranchCode"] == 'AP' || e.target.data["BranchCode"] == 'SP' || e.target.data["BranchCode"] == 'CP') {
                           Slevel = 0;
                           $('#divStudentChart').hide();
                           $('#DataGrid').show();
                           dataSource: SfilterData(e.target.originalArgument)
                           GetStudentCount(t_LoginID, e.target.data["AdmissionYear"], e.target.data["CollegeCode"], e.target.data["BranchCode"], e.target.data["Code"], 4);
                       } else if (e.target.data["BranchCode"] == 'AH' || e.target.data["BranchCode"] == 'SH' || e.target.data["BranchCode"] == 'CH') {
                           Slevel = 0;
                           $('#divStudentChart').hide();
                           $('#DataGrid').show();
                           dataSource: SfilterData(e.target.originalArgument)
                           GetStudentCount(t_LoginID, e.target.data["AdmissionYear"], e.target.data["CollegeCode"], e.target.data["BranchCode"], e.target.data["Code"], 4);
                       }
                       else {
                           chart.option({
                               dataSource: SfilterData(e.target.originalArgument)
                           });
                       }
                   }
                   else if (Slevel == 4) {
                       Slevel = 0;
                       //chart.option("dataSource", SfilterData(""));
                       //chart.option({
                       //    dataSource: SfilterData(e.target.originalArgument)
                       //});               
                       $('#divStudentChart').hide();
                       $('#DataGrid').show();
                       dataSource: SfilterData(e.target.originalArgument)
                       GetStudentCount(t_LoginID, e.target.data["AdmissionYear"], e.target.data["CollegeCode"], e.target.data["BranchCode"], e.target.data["Code"], 4);
                   
                   }
                   else if (Slevel == 5) {
                       Slevel = 6;
                       //chart.option("dataSource", SfilterData(""));
                       chart.option({
                           dataSource: SfilterData(e.target.originalArgument)
                       });
                       //$('#divStudentChart').hide();
                       //$('#DataGrid').show();
                       //dataSource: SfilterData(e.target.originalArgument)
                       //GetStudentCount(t_LoginID, e.target.data["AdmissionYear"], e.target.data["CollegeCode"], e.target.data["BranchCode"], e.target.data["Code"], 4);

                   }
               },
               tooltip: {
                   enabled: true,
                   customizeTooltip: function (arg) {
                       return {
                           text: 'Student : ' + arg.value + '<br>' + ' ' + arg.argument
                       };
                   }
               },
               customizePoint: function () {
                   var pointSettings = {
                       color: "#0086c1"
                   };

                   if (!isFirstSlevel) {
                       pointSettings.hoverStyle = {
                           hatching: "none"
                       };
                   }

                   return pointSettings;
               }
           }).dxChart("instance");

        //$("#backButton").dxButton({
        //    text: "Back",
        //    icon: "chevronleft",
        //    visible: false,
        //    onClick: function () {
        //        if (!isFirstSlevel) {
        //            isFirstSlevel = true;
        //            addPointerCursor(SchartContainer);
        //            chart.option("dataSource", filterData(""));
        //            this.option("visible", false);
        //        }
        //    }
        //});

        addPointerCursor(SchartContainer);
    }

    function SfilterData(name) {

        if (Slevel > 4) {
            debugger;
            return cntAdmission.filter(function (item) {
                return item.arg === name;
            });
        }

        return cntAdmission.filter(function (item) {
            return item.parentid === name;
        });
    }

    function addPointerCursor(container) {
        container.addClass("pointer-on-bars");
    }

    function GetStudentCount(t_LoginID,t_AdmissionYear,t_College,t_BranchCode,t_HonsCode, t_ReportType) {
        debugger;
        $('#divStudentChart').hide();
        $('#DataGrid').show();
        //var t_LoginID = ""; var t_AdmissionYear = "0"; var t_College = "0"; var t_BranchCode = "0"; var t_ReportType = "0";
        $.when(
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/G2G/Sample/SampleDrillDownReport.aspx/GetStudentCount',
                //url: '/Sambalpur/controls/GridDrillDown.ascx/GetStudentCount',
                //string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType
                data: '{"prefix":"","LoginID":"","AdmissionYear":"' + t_AdmissionYear + '","CollegeCode":"' + t_College + '","BranchCode":"' + t_BranchCode + '","HonsCode":"' + t_HonsCode + '","ReportType":"' + t_ReportType + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {

                },
                error: function (a, b, c) {
                  /*  alert("1." + a.responseText);*/
                }
            })
        )
        .then(function (data, textStatus, jqXHR) {
            debugger;
            var JSONData = jQuery.parseJSON(data.d);
            if (JSONData.length == 0) {
                //alert('No Record Found');
            }
            else {
                if (t_ReportType == 0) {                    
                    $('#DataGrid').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>Student</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "0";
                        t_AdmissionYear = JSONData[i]["AdmissionYear"];
                        t_College = "0";
                        t_BranchCode = "0";
                        t_HonsCode = '0';
                        t_ReportType = "1";
                        t_HTML = t_HTML + "<tr>";
                       //$('#divReportLink').empty();
                       //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span></div>');
                       //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Year Wise Student Count</div>');
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["AdmissionYear"] + "</a></td>";//Year
                        t_HTML = t_HTML + "<td>" + JSONData[i]["StdCount"] + "</td>"//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGrid').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 1) {
                    $('#DataGrid').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>College</b></th>";
                    t_HTML = t_HTML + "<th><b>Student</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "0";
                        t_AdmissionYear = JSONData[i]["AdmissionYear"];
                        t_College = JSONData[i]["CollegeCode"];;
                        t_BranchCode = "0";
                        t_HonsCode = "0";
                        t_ReportType = "2";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span></div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : College Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["AdmissionYear"] + "</a></td>";
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["StdCount"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGrid').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 2) {
                    $('#DataGrid').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>College</b></th>";
                    t_HTML = t_HTML + "<th><b>Branch</b></th>";
                    t_HTML = t_HTML + "<th><b>Student</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "SuSuperAdmin";
                        t_AdmissionYear = JSONData[i]["AdmissionYear"];
                        t_College = JSONData[i]["CollegeCode"];
                        t_BranchCode = JSONData[i]["BranchCode"];
                        t_HonsCode = "0";
                        t_ReportType = "3";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;2&quot;);">Branch Wise</span></div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Branch Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["AdmissionYear"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["BranchCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td>" + JSONData[i]["StdCount"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGrid').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 3) {
                    $('#DataGrid').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>College</b></th>";
                    t_HTML = t_HTML + "<th><b>Branch</b></th>";
                    t_HTML = t_HTML + "<th><b>Honours</b></th>";
                    t_HTML = t_HTML + "<th><b>Student</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "0";
                        t_AdmissionYear = JSONData[i]["AdmissionYear"];
                        t_College = JSONData[i]["CollegeCode"];
                        t_BranchCode = JSONData[i]["BranchCode"];
                        t_HonsCode = JSONData[i]["Code"];;
                        t_ReportType = "4";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;2&quot;);">Branch Wise</span> = > Course Wise </div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Course Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["AdmissionYear"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["BranchCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["Code"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td>" + JSONData[i]["StdCount"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGrid').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 4) {
                    $('#DataGrid').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>College</b></th>";
                    t_HTML = t_HTML + "<th><b>Branch</b></th>";
                    t_HTML = t_HTML + "<th><b>Code</b></th>";
                    t_HTML = t_HTML + "<th><b>Roll No</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "0";
                        t_AdmissionYear = JSONData[i]["AdmissionYear"];
                        t_College = JSONData[i]["CollegeCode"];
                        t_BranchCode = JSONData[i]["BranchCode"];
                        t_HonsCode = JSONData[i]["Code"];;
                        t_ReportType = "0";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;2&quot;);">Branch Wise</span> = > Course Wise </div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Course Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["AdmissionYear"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["BranchCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetStudentCount('" + t_LoginID.trim() + "','" + t_AdmissionYear + "','" + t_College + "','" + t_BranchCode + "','" + t_HonsCode + "','" + t_ReportType + "');>" + JSONData[i]["Code"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td>" + JSONData[i]["Rollno"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGrid').append(t_HTML.replace(/(&quot\;)/g, "\""));
                }
            }
        }); // end of Then function of main Data Insert Function

    }
</script>

    <div id="divStudentChart"></div>
    <div id="DataGrid"></div>

