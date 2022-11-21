<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SEMFEEChart.ascx.cs" Inherits="CitizenPortal.Sambalpur.controls.SEMFEEChart" %>

<%--<script src="../../../Sambalpur/CodeDev/js/jquery.js"></script>
<script src="../../../Sambalpur/CodeDev/js/cldr.min.js"></script>
<script src="../../../Sambalpur/CodeDev/js/cldr/event.min.js"></script>
<script src="../../../Sambalpur/CodeDev/js/cldr/supplemental.min.js"></script>
<script src="../../../Sambalpur/CodeDev/js/cldr/unresolved.min.js"></script>
<script src="../../../Sambalpur/CodeDev/js/globalize.min.js" type="text/javascript"></script>
<script src="../../../Sambalpur/CodeDev/js/globalize/message.min.js" type="text/javascript"></script>
<script src="../../../Sambalpur/CodeDev/js/globalize/number.min.js" type="text/javascript"></script>
<script src="../../../Sambalpur/CodeDev/js/globalize/currency.min.js" type="text/javascript"></script>
<script src="../../../Sambalpur/CodeDev/js/globalize/date.min.js" type="text/javascript"></script>
<link href="/../../../Sambalpur/CodeDev/css/dx.common.css" type="text/css" rel="stylesheet" />
<link href="/../../../Sambalpur/CodeDev/css/dx.light.css" rel="dx-theme" data-theme="generic.light" />
<script src="../../../Sambalpur/CodeDev/js/dx.all.js" type="text/javascript"></script>--%>

<style>
    #divSEMFee {
        margin: 5px;
        height: 220px;
        min-width: 314px;
        width: auto;
        border:1px solid #e9e9e9;
    }

#divSEMFee.pointer-on-bars .dxc-series rect {
    cursor: pointer;
}

.button-container {
    text-align: center;
    height: 40px;
    position: absolute;
    top: 7px;
    left: 0px;
}
</style>

<script>
    var level = 0;
    var colors = ["#6babac", "#e55253"];
    var isFirstLevel = true;
    var cntStudent = [];

    var t_College = "";
    var t_ReportType = "0"
    var t_ExamYear = "0";
    var t_BranchCode = "0";
    var t_Semester = "0";
    var t_ExamType = "0";
    var t_LoginID = "0";
    var t_HTML = "";

    $(document).ready(function () {
        GetDrillSEMFEEChart(t_LoginID, t_ExamYear, t_College, t_Semester, t_BranchCode, t_ExamType, t_ReportType);
    });
    function GetDrillSEMFEEChart() {
        debugger;        
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/G2G/Sample/SampleDrillDownReport.aspx/GetDrillSemFee',
            data: '{}',
            processData: false,
            dataType: "json",
            success: function (response) {
                debugger;
                cntStudent = $.parseJSON(response.d);
                GetDrillSemFee();
                console.log("2 Drill:-" + cntStudent);
                //Blockdata = eval(jsonData.list);
            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        });
    }

    function GetDrillSemFee() {
        debugger;
        $('#divSEMFee').show();
        $('#DataGridSemFee').html("");
        $('#DataGridSEMFee').hide();
        //DrillDown
        var chartContainer = $("#divSEMFee"),
           chart = chartContainer.dxChart({
               dataSource: filterData(""),  
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
                       level = 3;
                       //chart.option("dataSource", filterData(""));
                       chart.option({
                           dataSource: filterData(e.target.originalArgument)
                       });
                   }
                   else if (level == 3) {
                       level = 4;
                       //chart.option("dataSource", filterData(""));
                       //chart.option({
                       //    dataSource: filterData(e.target.originalArgument)
                       //});
                       $('#divSEMFee').hide();
                       $('#DataGridSEMFee').show();
                       dataSource: filterData(e.target.originalArgument)
                       GetSEMFEECount(t_LoginID, e.target.data["ExamYear"], e.target.data["CollegeCode"], e.target.data["Semester"], e.target.data["BranchCode"], e.target.data["ExamType"], 4);

                   }
                   else if (level == 4) {
                       level = 5;
                       //chart.option("dataSource", filterData(""));
                       //chart.option({
                       //    dataSource: filterData(e.target.originalArgument)
                       //});
                       //$('#divSEMFee').hide();
                       //$('#DataGridSEMFee').show();
                       //dataSource: filterData(e.target.originalArgument)
                       //GetSEMFEECount(t_LoginID, e.target.data["ExamYear"], e.target.data["CollegeCode"], e.target.data["Semester"], e.target.data["BranchCode"], e.target.data["ExamType"], 4);
                       //GetSEMFEECount(t_LoginID, t_ExamYear, t_College, t_Semester, t_BranchCode, t_ExamType, t_ReportType)
                   }
                   else if (level == 5) {
                       level = 0;
                       chart.option("dataSource", filterData(""));
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

                   if (!isFirstLevel) {
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
        //        if (!isFirstLevel) {
        //            isFirstLevel = true;
        //            addPointerCursor(chartContainer);
        //            chart.option("dataSource", filterData(""));
        //            this.option("visible", false);
        //        }
        //    }
        //});

        addPointerCursor(chartContainer);
    }

    function filterData(name) {

        if (level > 5) {
            debugger;
            return cntStudent.filter(function (item) {
                return item.arg === name;
            });
        }

        return cntStudent.filter(function (item) {
            return item.parentid === name;
        });
    }

    function addPointerCursor(container) {
        container.addClass("pointer-on-bars");
    }

    function GetSEMFEECount(t_LoginID,t_ExamYear,t_College,t_Semester,t_BranchCode,t_ExamType,t_ReportType) {
        debugger;
        //var t_LoginID = ""; var t_ExamYear = 0; var t_College = ""; var t_Semester = ""; var t_BranchCode = ""; var t_ExamType = ""; var t_ReportType = 0;
        $('#divSEMFee').hide();
        $('#DataGridSEMFee').show();
        $.when(
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/G2G/Sample/SampleDrillDownReport.aspx/GetSemFeeCount',
                //url: 'GridDrillDown.ascx/GetStudentCount',
                //string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType
                data: '{"prefix":"","LoginID":"","ExamYear":"' + t_ExamYear + '","CollegeCode":"' + t_College + '","Semester":"' + t_Semester + '","BranchCode":"' + t_BranchCode + '","ExamType":"' + t_ExamType + '","ReportType":"' + t_ReportType + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {

                },
                error: function (a, b, c) {
                    alert("1." + a.responseText);
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
                    $('#DataGridSemFee').html("");
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
                        t_ExamYearYear = JSONData[i]["ExamYear"];
                        t_College = "0";
                        t_BranchCode = "0";
                        t_ReportType = "1";
                        t_HTML = t_HTML + "<tr>";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span></div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Year Wise Student Count</div>');
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["ExamYear"] + "</a></td>";//Year
                        t_HTML = t_HTML + "<td>" + JSONData[i]["Student"] + "</td>"//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGridSemFee').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 1) {
                    $('#DataGridSemFee').html("");
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
                        t_ExamYear = JSONData[i]["ExamYear"];
                        t_College = JSONData[i]["CollegeCode"];
                        t_Semester = "0";
                        t_BranchCode = "0";
                        t_ExamType = "0";
                        t_ReportType = "2";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span></div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : College Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["ExamYear"] + "</a></td>";
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["Student"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGridSemFee').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 2) {
                    $('#DataGridSemFee').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>College</b></th>";
                    t_HTML = t_HTML + "<th><b>Semester</b></th>";
                    t_HTML = t_HTML + "<th><b>Student</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "0";
                        t_ExamYear = JSONData[i]["ExamYear"];
                        t_College = JSONData[i]["CollegeCode"];
                        t_Semester = JSONData[i]["Semester"];
                        t_BranchCode = "0";
                        t_ExamType = "0";
                        t_ReportType = "3";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;2&quot;);">Branch Wise</span></div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Branch Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["ExamYear"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["Semester"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td>" + JSONData[i]["Student"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGridSemFee').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 3) {
                    $('#DataGridSemFee').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>College</b></th>";
                    t_HTML = t_HTML + "<th><b>Semester</b></th>";
                    t_HTML = t_HTML + "<th><b>Branch</b></th>";
                    t_HTML = t_HTML + "<th><b>Student</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "0";
                        t_AdmissionYear = JSONData[i]["ExamYear"];
                        t_College = JSONData[i]["CollegeCode"];
                        t_BranchCode = JSONData[i]["BranchCode"];
                        t_Semester = JSONData[i]["Semester"];                        
                        t_ExamType = "0";
                        t_ReportType = "4";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;2&quot;);">Branch Wise</span> = > Course Wise </div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Course Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["ExamYear"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["Semester"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["BranchCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td>" + JSONData[i]["Student"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGridSemFee').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 4) {
                    $('#DataGridSemFee').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>College</b></th>";
                    t_HTML = t_HTML + "<th><b>Branch</b></th>";
                    t_HTML = t_HTML + "<th><b>Semester</b></th>";
                    t_HTML = t_HTML + "<th><b>ExamType</b></th>";
                    t_HTML = t_HTML + "<th><b>Student</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "0";
                        t_AdmissionYear = JSONData[i]["ExamYear"];
                        t_College = JSONData[i]["CollegeCode"];
                        t_BranchCode = JSONData[i]["BranchCode"];
                        t_Semester = JSONData[i]["Semester"];                        
                        t_ExamType = JSONData[i]["ExamType"];
                        t_ReportType = "5";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;2&quot;);">Branch Wise</span> = > Course Wise </div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Course Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["ExamYear"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["Semester"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["BranchCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["ExamType"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td>" + JSONData[i]["Student"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGridSemFee').append(t_HTML.replace(/(&quot\;)/g, "\""));
                } else if (t_ReportType == 5) {
                    $('#DataGridSemFee').html("");
                    t_HTML = "";
                    t_HTML = t_HTML + "<table class='tblActivity table table-bordered'>";
                    t_HTML = t_HTML + "<thead>";
                    t_HTML = t_HTML + "<tr>";
                    t_HTML = t_HTML + "<th><b>S.No.</b></th>";
                    t_HTML = t_HTML + "<th><b>Year</b></th>";
                    t_HTML = t_HTML + "<th><b>College</b></th>";
                    t_HTML = t_HTML + "<th><b>Branch</b></th>";
                    t_HTML = t_HTML + "<th><b>Semester</b></th>";
                    t_HTML = t_HTML + "<th><b>ExamType</b></th>";
                    t_HTML = t_HTML + "<th><b>Roll No</b></th>";
                    t_HTML = t_HTML + "<th><b>Pay</b></th>";
                    t_HTML = t_HTML + "</tr>";
                    t_HTML = t_HTML + "</thead>";
                    t_HTML = t_HTML + "<tbody>";
                    for (var i = 0; i < JSONData.length; i++) {
                        t_LoginID = "0";
                        t_AdmissionYear = JSONData[i]["ExamYear"];
                        t_College = JSONData[i]["CollegeCode"];
                        t_BranchCode = JSONData[i]["BranchCode"];
                        t_Semester = JSONData[i]["Semester"];
                        t_ExamType = JSONData[i]["ExamType"];
                        t_ReportType = "0";
                        //$('#divReportLink').empty();
                        //$('#divReportLink').append('<div><span onclick="GetStudentCount(&quot;' + t_LoginID + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;0&quot;);">Student</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;1&quot;);">College Wise</span> => <span onclick="GetStudentCount(&quot;' + t_LoginID.trim() + '&quot;,&quot;' + t_AdmissionYear + '&quot;,&quot;' + t_College + '&quot;,&quot;' + t_BranchCode + '&quot;,&quot;2&quot;);">Branch Wise</span> = > Course Wise </div>');
                        //$('#divReportName').empty();
                        //$('#divReportName').append('<div>Report Name : Course Wise Student Count</div>');
                        t_HTML = t_HTML + "<tr>";
                        t_HTML = t_HTML + "<td>" + JSONData[i]["SNo"] + "</td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["ExamYear"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["CollegeCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["Semester"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["BranchCode"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td><a href='#' onclick=GetSEMFEECount('" + t_LoginID.trim() + "','" + t_ExamYear + "','" + t_College + "','" + t_Semester + "','" + t_BranchCode + "','" + t_ExamType + "','" + t_ReportType + "');>" + JSONData[i]["ExamType"] + "</a></td>";//Serial No
                        t_HTML = t_HTML + "<td>" + JSONData[i]["RollNo"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "<td>" + JSONData[i]["Payment"] + "</td>";//Notice Date
                        t_HTML = t_HTML + "</tr>";
                    }
                    t_HTML = t_HTML + "</tbody>";
                    t_HTML = t_HTML + "</table>";
                    $('#DataGridSemFee').append(t_HTML.replace(/(&quot\;)/g, "\""));
                }
            }
        }); // end of Then function of main Data Insert Function

    }

</script>

<div id="divSEMFee"></div>
<div id="DataGridSemFee"></div>


