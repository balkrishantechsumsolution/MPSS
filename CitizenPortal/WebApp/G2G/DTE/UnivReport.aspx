<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="UnivReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DTE.UnivReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Data Entry Report View</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <%--<script src="/WebApp/Scripts/CommonScript.js"></script>--%>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="Script/DTEDashboard.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/G2G/OISF/css/allocationCenterStylesheet.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, 'All']],
                    "iDisplayLength": 100
                });

            //$("table[id$='DataGridView'] thead th").each(function () {
            //    var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
            //    $(this).html('<input type="text" placeholder="' + title + '" />');
            //});

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
        });

        function fnReportType() {
            debugger;
            var Report = $('#ddlServices option:selected').text();
            $('#lblReportType').innerHTML = Report;
        }
        function EditOutput(p_URL, p_ServiceID, p_AppID) {
            //alert(p_AppID);
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "";
            if (p_ServiceID == 1451) {
                t_URL = p_URL;// "/WebApp/Kiosk/BackExam/StudentForm.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.open(t_URL, '_blank')

            }
            else if (p_ServiceID == "1456") {
                t_URL = p_URL;// "/WebApp/Kiosk/BackExam/StudentForm.aspx";
                t_URL = t_URL + "&SvcID=" + p_ServiceID;
                window.open(t_URL, 'ViewDoc', 'left=100,top=100,height=500,width=1200,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=no');
            }
            else {
                t_URL = "/WebApp/Kiosk/CBCS/EditStudentForm.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.open(t_URL, 'ViewDoc', 'left=100,top=100,height=500,width=1200,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=no');
            }

            window.focus();
            return false;
        }

        function ExamForm(p_URL, p_ServiceID, p_AppID, p_Branch) {
            //alert(p_AppID);
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "";
            if (p_ServiceID == 1451) {
                t_URL = p_URL;// "/WebApp/Kiosk/BackExam/StudentForm.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&BID=" + p_Branch;
                window.open(t_URL, '_blank');
            }
            else {
                t_URL = "/WebApp/Kiosk/CBCS/EditStudentForm.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.open(t_URL, 'ViewDoc', 'left=100,top=100,height=500,width=1200,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=no');
            }

            window.focus();
            return false;
        }

        function AdmitCard(p_URL, p_AppID) {
            debugger;
            var p_ServiceID = '1234'
            //alert(p_URL,p_AppID);
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "";
            if (p_ServiceID == 1451) {
                t_URL = p_URL;// "/WebApp/Kiosk/BackExam/StudentForm.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&BID=" + p_Branch;
                window.open(t_URL, '_blank');
            }
            else {
                t_URL = "/webapp/kiosk/cbcs/AdmitCard.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.open(t_URL, 'ViewDoc', 'left=100,top=100,height=500,width=900,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=no');
            }

            window.focus();
            return false;
        }

        function EditSubject(p_URL, p_AppID) {
            debugger;
            var p_ServiceID = '1458'
            //alert(p_URL,p_AppID);
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "";
            if (p_ServiceID == 1451) {
                t_URL = p_URL;// "/WebApp/Kiosk/BackExam/StudentForm.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&BID=" + p_Branch;
                window.open(t_URL, '_blank');
            }
            else {
                t_URL = "/WebApp/Kiosk/BackExam/EditSubject.aspx";
                t_URL = t_URL + "?UserID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.open(t_URL, 'ViewDoc', 'left=100,top=100,height=500,width=900,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=no');
            }

            window.focus();
            return false;
        }

        function ShowScore(p_URL, p_ServiceID, p_AppID, p_Branch) {
            //alert(p_AppID);
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "";
            if (p_ServiceID == 1455) {
                t_URL = p_URL;// "/WebApp/Kiosk/BackExam/StudentForm.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&BID=" + p_Branch;
                window.open(t_URL, '_blank');
            }

            window.focus();
            return false;
        }

        function ViewOutput(p_URL, p_ServiceID, p_AppID) {
            debugger;
            //alert(p_AppID);
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "";
            if (p_ServiceID == "1449") {
                t_URL = "/WebApp/Kiosk/CBCS/Acknowledgement.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            } else if (p_ServiceID == "1450") {
                t_URL = "/WebApp/Kiosk/CBCS/AdmitCard.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            }
            else if (p_ServiceID == "1456") {
                t_URL = p_URL//"/WebApp/Kiosk/Enrolement/Acknowledgment.aspx";
                t_URL = t_URL + "&SvcID=" + p_ServiceID;
            }

            window.open(t_URL, 'ViewDoc', 'left=100,top=100,height=500,width=900,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=no');
            window.focus();
            return false;
        }
    </script>
    <style>
        tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
        }


        table#DataGridView > thead > tr > th {
        }

        table#DataGridView > tbody > tr > td {
        }

        #DataGridView input, textarea {
        }

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
    </style>
    <style>
        tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
        }


        table#DataGridView > thead > tr > th {
        }

        table#DataGridView > tbody > tr > td {
        }

        #DataGridView input, textarea {
            /*min-width: 75px !important;
            width: 100% !important;
            max-width: 200px !important;*/
            color: #333;
        }

        table.dataTable thead th, table.dataTable thead td {
            padding: 2px !important;
            white-space: nowrap;
        }

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

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        #btnSearch {
            height: 34px;
        }
    </style>
    <link href="../../../../../Common/Styles/style.admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Reports</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div class="row" style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Search Filter
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
                            <div class="form-group">
                                <label class="" for="txtFromDate">
                                    From Date
                                </label>
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
                            <div class="form-group">
                                <label class="" for="txtToDate">
                                    To Date
                                </label>
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Report Type</label>                              
                                <asp:DropDownList ID="ddlServices" runat="server" Width="100%" CssClass="form-control" onchange="fnReportType();">
                                    <asp:ListItem Value="0" Text="--Select Report--"></asp:ListItem>
                                    <asp:ListItem Value="UR001" Text="Student Strength (Year & College wise)"></asp:ListItem>
                                    <asp:ListItem Value="UR002" Text="Student Strength (College & Branch wise)"></asp:ListItem>
                                    <asp:ListItem Value="UR003" Text="Student Strength (Year, College & Branch wise)"></asp:ListItem>
                                    <asp:ListItem Value="UR004" Text="Exam Data (College, Branch, Semester & Session Wise)"></asp:ListItem>
                                    <asp:ListItem Value="UR006" Text="Exam Data (Branch Wise)"></asp:ListItem>
                                    <asp:ListItem Value="UR005" Text="Student Exam Data (Student, College, Branch, Semester & Session Wise)"></asp:ListItem>
                                    <asp:ListItem Value="UR007" Text="Complete Exam Data (Student, College, Branch, Semester, Session Wise - with Paper)"></asp:ListItem>
                                    <asp:ListItem Value="UR008" Text="DTE Councelling Data"></asp:ListItem>
                                    <asp:ListItem Value="UR009" Text="Enrollment Data 2021-2022"></asp:ListItem>
                                    <asp:ListItem Value="UR010" Text="Eligible Student for Semester Form Fill-up"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="" for="ddlCollege">
                                    College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" Width="100%" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlProgram">
                                    Course 
                                </label>
                                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="ddlProgram" Display="Dynamic"
                                    ErrorMessage="Please select Program." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSubProgram">
                                    Branch
                                </label>
                                <asp:DropDownList ID="ddlSubProgram" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSubProgram_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="0" ControlToValidate="ddlSubProgram" Display="Dynamic"
                                    ErrorMessage="Please select Sub-Program." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlCourse">
                                    Program
                                </label>
                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select Course</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                            <div class="form-group">
                                <label class="manadatory" for="ddlBranch">
                                    Branch/Cource Name
                                </label>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select Branch</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlExamType">
                                    Exam Type
                                </label>
                                <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                    <asp:ListItem Value="Backlog" Text="Backlog"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlExamType" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select exam type." ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSession">
                                    Exam Year
                                </label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="Apr-May 2018" Text="Apr-May 2018"></asp:ListItem>
                                    <asp:ListItem Value="Apr-May 2017" Text="Apr-May 2017"></asp:ListItem>
                                    <asp:ListItem Value="Nov-Dec 2019" Text="Nov-Dec 2019"></asp:ListItem>
                                    <asp:ListItem Value="Apr-May 2019" Text="Apr-May 2019"></asp:ListItem>
                                    <asp:ListItem Value="Apr-May 2021" Text="Apr-May 2021"></asp:ListItem>
                                    <asp:ListItem Value="Nov-Dec 2018" Text="Nov-Dec 2018"></asp:ListItem>
                                    <asp:ListItem Value="Nov-Dec 2016" Text="Nov-Dec 2016"></asp:ListItem>
                                    <asp:ListItem Value="Apr-May 2020" Text="Apr-May 2020"></asp:ListItem>
                                    <asp:ListItem Value="Nov-Dec 2020" Text="Nov-Dec 2020"></asp:ListItem>
                                    <asp:ListItem Value="Nov-Dec 2017" Text="Nov-Dec 2017"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                    ErrorMessage="Please select SESSION" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSemester">
                                    Semester
                                </label>
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="Semester 1" Text="1st Semester"></asp:ListItem>
                                    <asp:ListItem Value="Semester 2" Text="2nd Semester"></asp:ListItem>
                                    <asp:ListItem Value="Semester 3" Text="3rd Semester"></asp:ListItem>
                                    <asp:ListItem Value="Semester 4" Text="4th Semester"></asp:ListItem>
                                    <asp:ListItem Value="Semester 5" Text="5th Semester"></asp:ListItem>
                                    <asp:ListItem Value="Semester 6" Text="6th Semester"></asp:ListItem>
                                    <asp:ListItem Value="YEAR 1" Text="1st YEAR"></asp:ListItem>
                                    <asp:ListItem Value="YEAR 2" Text="2nd YEAR"></asp:ListItem>
                                    <asp:ListItem Value="YEAR 3" Text="3rd YEAR"></asp:ListItem>
                                    <asp:ListItem Value="YEAR 4" Text="4th YEAR"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic"
                                    ErrorMessage="Please select SEMESTER." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="category">
                                    Roll No.</label>
                                <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 text-right">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                        Text="Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>

                        <div class="clearfix">
                        </div>

                    </div>                    
                    <div class="box-body box-body-open">
                        <div class="row col-md-12 box-container">
                            <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                <div style="text-align:center" id="lblReportType"></div>
                                <asp:GridView ID="DataGridView" runat="server" Width="98%" OnRowDataBound="grdView_RowDataBound"></asp:GridView>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <%----END of Filter-----%>
        </div>
    </div>
</asp:Content>
