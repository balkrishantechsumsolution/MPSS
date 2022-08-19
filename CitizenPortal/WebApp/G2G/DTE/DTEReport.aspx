<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="DTEReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DTE.DTEReport" %>

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
                    "lengthMenu": [[10, 50, 100], [10, 50, 100]],
                    "iDisplayLength": 10,
                    "order": [[1, "desc"]]
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
        function OtherView(p_URL, p_ServiceID, p_AppID, p_Status) {            
            var t_URL = "";
            if (p_ServiceID == 1449) {
                if (p_Status == "INITIATED") {
                    t_URL = "/WebApp/Kiosk/CBCS/StudentForm.aspx";
                } else if (p_Status == "UNPAID") {
                    t_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx";
                } else {
                    t_URL = "/WebApp/Kiosk/CBCS/Acknowledgement.aspx";
                }
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                //window.open(t_URL, '_blank');
                window.open(t_URL, 'Application Form', 'left=10,top=10,height=600,width=1320,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=no');
            }

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
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtFromDate">
                                    From Date
                                </label>
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtToDate">
                                    To Date
                                </label>
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Category</label>
                                <%--<select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="category" name="Category">
                                <option value="Select Category">Select</option>
                                <option value="SC">SC</option>
                                <option value="ST">ST</option>
                                <option value="SEBC">SEBC</option>
                                <option value="UR">UR</option>
                            </select>--%>
                                <asp:DropDownList ID="ddlServices" runat="server" Width="100%" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                            <div class="form-group">
                                <label class="" for="ddlGender">
                                    Service Name
                                </label>
                                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                    CssClass="form-control" ToolTip="Select City or Town name (if doesnot exist select other)">
                                    <asp:ListItem>Select Service</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                            <div class="form-group">
                                <label class="" for="state">
                                    State
                                </label>
                                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" CssClass="form-control"
                                    ToolTip="Select the State name (mandatory)">
                                    <asp:ListItem Text="Select State" Value="0"> </asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                            <div class="form-group">
                                <label class="manadatory" for="ddlDistrict">
                                    District</label>
                                <%--<select name="ddlDistrict" id="ddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                <option value="0">Select District</option>
                            </select>--%>
                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                            <div class="form-group">
                                <label class="" for="Village">
                                    Subdistrict
                                </label>
                                <asp:DropDownList ID="ddlTaluka" runat="server" AppendDataBoundItems="True" CssClass="form-control"
                                    AutoPostBack="True" ToolTip="Select Subdistrict name (mandatory)">
                                    <asp:ListItem>Select Subdistrict</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlCollege">
                                    College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" Width="100%" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlBranch">
                                    Cource Name
                                </label>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select Branch</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlBranch">
                                    Program Name
                                </label>
                                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select Branch</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSession">
                                    Exam Session
                                </label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="Apr-May 2021" Text="Apr-May 2021"></asp:ListItem>
                                    <asp:ListItem Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
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
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" AutoPostBack="True">
                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic"
                                    ErrorMessage="Please select SEMESTER." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlExamType">
                                    Exam Type
                                </label>
                                <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Regular"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Back"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Traditional"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlExamType" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select exam type." ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>

                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSemester">
                                    Semester
                                </label>
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1SEM" Text="1st SEM"></asp:ListItem>
                                    <asp:ListItem Value="2SEM" Text="2nd SEM"></asp:ListItem>
                                    <asp:ListItem Value="3SEM" Text="3rd SEM"></asp:ListItem>
                                    <asp:ListItem Value="4SEM" Text="4th SEM"></asp:ListItem>
                                    <asp:ListItem Value="5SEM" Text="5th SEM"></asp:ListItem>
                                    <asp:ListItem Value="6SEM" Text="6th SEM"></asp:ListItem>
                                    <asp:ListItem Value="Final" Text="Final"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic"
                                    ErrorMessage="Please select SEMESTER." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlPaper">
                                    Paper 
                                </label>
                                <asp:DropDownList ID="ddlPaper" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ControlToValidate="ddlPaper" Display="Dynamic"
                                    ErrorMessage="Please select PAPER." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                            <div class="form-group">
                                <label class="" for="ddlGender">
                                    Status
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
                                <label class="" for="ddlGender">
                                    Roll No
                                </label>
                                <asp:TextBox ID="TxtRollNo" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                            <div class="form-group">
                                <label class="" for="ddlGender">
                                    Application ID
                                </label>
                                <asp:TextBox ID="txt_AppID" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                            <div class="form-group">
                                <label class="" for="ddlGender">
                                    Filter Count/Total Count
                                </label>
                                <label class="form-control" for="ddlGender" style="width: 160px; float: left;">
                                    55 / 300
                                </label>
                                <a class="btn btn-darkorange green" style="float: right;" href="javascript:void(0);" title="Click to search the filtered record"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
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
                        <div style="text-align: center; color: red; font-weight: bold; padding: 3px">
                            NOTE : CNR can be downloaded in EXCEL format from REPORT section after selecting CNR option in CATEGORY drop-down.
							<br />
                            Please apply necessary filter option to bind the proper record.
							<br />
                            If any discrepancy (mis-match) in Paper, Please acknowledge @ 7749991461 or e-mail to help.ocap@gmail.com
                            <br />
                        </div>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="row col-md-12 box-container">
                            <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
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
