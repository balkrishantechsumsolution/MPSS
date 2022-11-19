<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="MPSSDashboard.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.MPSS.MPSSDashboard" %>

<%@ Register src="../../../Sambalpur/controls/MainMenu.ascx" tagname="MainMenu" tagprefix="uc1" %>
<%@ Register Src="~/Sambalpur/controls/NoticeBoard.ascx" TagPrefix="uc1" TagName="NoticeBoard" %>
<%@ Register Src="~/Sambalpur/controls/ActiveServices.ascx" TagPrefix="uc1" TagName="ActiveServices" %>
<%@ Register Src="~/Sambalpur/controls/GridDrillDown.ascx" TagPrefix="uc1" TagName="GridDrillDown" %>
<%@ Register Src="~/Sambalpur/controls/ApplicationCount.ascx" TagPrefix="uc1" TagName="ApplicationCount" %>
<%@ Register Src="~/Sambalpur/controls/SEMFEEChart.ascx" TagPrefix="uc1" TagName="SEMFEEChart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="../../../Sambalpur/CodeDev/js/dx.all.js"></script>
    <link href="../../../Sambalpur/css/homestyle.css" rel="stylesheet" />
    
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../../Common/Styles/style.admin.css" rel="stylesheet" />
    <script src="../SU/Script/SUDashboard.js"></script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .pagination {
            color: #000 !important;
            display: block !important;
            margin: 0 !important;
            padding: 10px;
        }

            .pagination label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
            }


        .SrvDivContainer {
            display: inline-block;
            width: 24% !important;
            height: 4.55em !important;
            max-height: 100%;
        }

            .SrvDivContainer img {
                width: 65px !important;
                height: auto !important;
            }

        .SrvDiv {
            background-color: #fce9d147;
            border: solid 1px #F9D0A1;
            color: #045abc;
            width: 24%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #B65838;
            min-height: 2.66em;
            z-index: -760;
            line-height: 20px;
        }

            .SrvDiv a {
                color: maroon;
                font-size: .9em;
                text-decoration: none;
                /*font-weight: bold;*/
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
                height: 45px;
                width: 55px;
                background-image: url('/webapp/kiosk/CBCS/img/sambalpur-university-logo.png');
                background-repeat: no-repeat;
                background-size: 55px 45px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 5px 0 0 0;
                color: #212121;
                font-size: .65em;
                font-weight: bold;
            }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            
            $('#txtFromDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

            $('#txtToDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

        });


    </script>
    <style>
        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

        .dropdown-menu > li > a {
            color: #333 !important;
            line-height: 22px;
        }
    </style>
    <style>
        .tblActivity {
        border:1px solid #333;        
        }
        .tblActivity td, .tblActivity th {
        border:1px solid #333; padding:5px;       
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <%--Notice Board Modal START Here--%>
    <uc1:NoticeBoard runat="server" ID="NoticeBoard" />
    <%--Notice Board Modal END Here--%>
    <div id="page-wrapper" style="min-height: 500px !important;">        
        <%--ApplicationCount--%>
        <div class="row">
            <uc1:ApplicationCount runat="server" ID="ApplicationCount" />
        </div>
        <%--Graph & Charts--%>
        <div>
            <div id="StudentChart"></div>
        </div>        
        <div class="row">
            <%--DrillDownReport--%>
            <div class="col-md-4 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Student Count <span style="font-size:20px;font-weight:bold;padding-left:25%"><a href="#" onclick="GetStudentChart('0');">CHART</a>  |  <a href="#" onclick="GetStudentCount('0','0','0','0','0','0');">GRID</a></span>
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 250px; overflow: auto;">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group p0">
                            <uc1:GridDrillDown runat="server" ID="GridDrillDown" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <%--DrillDownReport--%>
            <div class="col-md-4 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Semester Fee Count <span style="font-size:20px;font-weight:bold;padding-left:10%"><a href="#" onclick="GetDrillSEMFEEChart('0');">CHART</a>  |  <a href="#" onclick="GetSEMFEECount('','0','','','','','0');">GRID</a></span>
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 250px; overflow: auto;">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group p0">
                            <uc1:SEMFEEChart runat="server" ID="SEMFEEChart" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <%--Activity--%>
            <div class="col-md-4 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Active Services
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 250px; overflow: auto;">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group p0">
                            <uc1:ActiveServices runat="server" ID="ActiveServices" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        
        
        <%--Role Based Menu--%>
        <br />
        <uc1:MainMenu ID="MainMenu1" runat="server" />
        <br />
        <%---<div class="">
            <div class="SrvDiv" id="Div1" runat="server">
                <a href="/WebApp/G2G/DTE/StudentHistory.aspx" target="_blank">
                    <img alt="" align="left" />                
                    <b>Student History</b><br />
                <span>View Student Detail Data</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivLegacy" runat="server" style="display:none" visible="false">
                <a href="/WebApp/Kiosk/DTE/legacy/LegacyDataInterface.aspx" target="_blank">
                    <img alt="" align="left"/><b >Legacy Data</b>
                <br />
                <span>View Student Detail 2003-2007</span>
            </a></div>
            <div class="SrvDiv" id="DivReport" runat="server">
                <a href="/WebApp/G2G/DTE/DTEReport.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Reports</b><br />
                    <span>View Reports & Export Data</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivAdmission" runat="server">
                <a href="/WebApp/Kiosk/CBCS/DEOAdmissionForm.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>+3 Exam. Enrollment (CBCS)</b><br />
                    <span>New Student Enrollment</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivRollNo" runat="server">
                <a href="/WebApp/G2G/SU/SURollNumber.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Generate Roll No</b>
                    <span>Generate Roll No For +3 Admission</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivRegNo" runat="server">
                <a href="/WebApp/G2G/SU/SURegNumber.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Generate Registration No</b><br />
                    <span>Generate Reg No For +3 Admission</span>
                </a>
            </div>
            <div class="SrvDiv" id="divBulk" runat="server">
                <a href="/WebApp/G2G/SU/BulkApproval.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Bulk Approval</b><br />
                    <span>Approve Application in Bulk</span>
                </a>
            </div>
            <div class="SrvDiv" id="divBulkPayment" runat="server">
                <a href="/WebApp/G2G/BulkPayment/BulkPayAppList.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Bulk Payment</b><br />
                    <span>Payment of Bulk Application</span></a>
            </div>
            <div class="SrvDiv" id="divPayment" runat="server">
                <a href="/WebApp/G2G/DTE/PGSummary.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Payment Summary</b><br />
                    <span>Payment Detail & Summary</span></a>
            </div>
            <div class="SrvDiv" id="divMark" runat="server">
                <a href="/WebApp/G2G/MarkEntry/InternalMarks.aspx" target="_blank">
                    <img alt="" align="left" />
                <b>Internal Marks Entry</b> <br />               
                <span>Internal Marks Entry</span></a>
            </div>
            <div class="SrvDiv" id="divAttendance" runat="server">
                <a href="/WebApp/G2G/SU/AttendanceSheet.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Attendance Sheet</b>
                    <br />
                    <span>Examination Attendance Sheet</span></a>
            </div>
            <div class="SrvDiv" id="divEdit" runat="server">
                <a href="/WebApp/G2G/MarkEntry/SubjectEdit.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Change Subject (Edit)</b>
                    <br />
                    <span>Change Subject in Bulk</span></a>
            </div>
            <div class="SrvDiv" id="divReg" runat="server">
                <a href="/WebApp/G2G/MarkEntry/RegistrationUpdate.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Univ. Registration No (2016)</b>
                    <br />
                    <span>Update University Registration No.</span></a>
            </div>
             <div class="SrvDiv" id="divTheory" runat="server">
                <a href="/WebApp/G2G/MarkEntry/TheoryMarks.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Mark Entry</b>
                    <br />
                    <span>Theory Mark Entry</span></a>
            </div>
            <div class="clearfix"></div>
        </div>
        Start of Filter----%>
        <div class="row" style="">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Search Filter
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtFromDate">&nbsp;Paid
                                From Date
                            </label>
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtToDate">
                                Paid
                                To Date
                            </label>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="category">
                                Category</label>
                            <asp:DropDownList ID="ddlServices" runat="server" Width="95%" CssClass="form-control">
                                <asp:ListItem Value="0">--Select Application Type--</asp:ListItem>
                                <asp:ListItem Value="1467">Enrollment Application</asp:ListItem>
                                <asp:ListItem Value="1468">Examination Form</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                District</label>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="ddlStatus">
                                Application Status
                            </label>
                            <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True"
                                CssClass="form-control" ToolTip="Select Status">
                                <asp:ListItem>-Select Status-</asp:ListItem>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="A">Approved</asp:ListItem>
                                <asp:ListItem Value="R">Rejected</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="txtAppID">Application No.</label>
                            <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Application No" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                type="text" value=""></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                        <div class="form-group">
                            <label>
                                &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                    Text="Search" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>

                </div>
            </div>
        </div>

        <%----END of Filter-----%>


        <%---Start of Application Details----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">List of Application
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 250px; overflow: auto;">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group p0">
                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="text-center col-md-12 col-sm-12 col-xs-12">

                <ul class="pagination">

                    <li class="col-md-2 col-sm-2 text-center">
                        <label for="TotalRecords">Total Records</label>
                        <label id="lblTotalRecords" runat="server" for="TotalRecords"></label>
                        <input type="hidden" id="TotalRecords" name="TotalRecords" value="2" /></li>
                    <li class="col-md-2 col-sm-2 text-center">
                        <label for="CurrentPage">Page:</label>
                        1
    <input type="hidden" id="CurrentPage" name="CurrentPage" value="1" />
                        <label for="TotalPages">of</label>
                        1
                    </li>
                    <li class="col-md-4 col-sm-4 text-center">
                        <input type="hidden" id="TotalPages" name="TotalPages" value="1" />

                        <button class="btn btn-primary " type="submit" id="btnFirst" name="Command" value="First" disabled="disabled">
                            First</button>
                        <button class="btn btn-default " type="submit" id="btnPrevious" name="Command" value="Previous" disabled="disabled">
                            Previous</button>
                        <button class="btn btn-default " type="submit" id="btnNext" name="Command" value="Next" disabled="disabled">
                            Next</button>
                        <button class="btn btn-primary " type="submit" id="btnLast" name="Command" value="Last" disabled="disabled">
                            Last</button>
                        <button class="btn btn-success " type="submit" id="btnRefresh" name="Command" style="display: none" value="Refresh">
                            Refresh</button>
                    </li>
                    <li class="col-md-2 col-sm-2">
                        <input class="form-control text-align-center" data-val="true" data-val-number="The field PageSize must be a number." placeholder="Search..." data-val-required="The PageSize field is required." id="PageSize" name="PageSize" type="text" value="" autocomplete="off" />
                        <div class="clearfix"></div>
                    </li>
                    <li class="col-md-2 col-sm-2">
                        <button class="btn btn-success " type="submit" id="btnExcel" name="Command" value="Last" disabled="disabled">
                            Export to Excel</button>
                        <div class="clearfix"></div>
                    </li>
                    <div class="clearfix"></div>
                </ul>

            </div>
        </div>
        <%----END of Application Details-----%>
    </div>
</asp:Content>
