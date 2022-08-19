<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="StudentExam.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DTE.StudentExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Data Entry Report View</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>
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
                    "iDisplayLength": 10
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

        function ExamDetail(p_RollNo, p_Semester, p_ExamYear) {
            debugger;
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/G2G/SU/StudentExamDetail.aspx";
            t_URL = t_URL + "?RollNo=" + p_RollNo + "&Semester=" + p_Semester + "&ExamYear=" + p_ExamYear;
            window.open(t_URL, 'Student Exam Detail', 'height=800,width=1200,top=75,left=100,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
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
            min-width: 25%;
        }

        table#DataGridView > tbody > tr > td {
            min-width: 25%;
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
            width: 25% !important;
        }

        table#DataGridView > tbody > tr > td {
            width: 25% !important;
        }

        #DataGridView input, textarea {
            /*min-width: 75px !important;
            width: 100% !important;
            max-width: 200px !important;*/
            color: #333;
        }

        table.dataTable thead th, table.dataTable thead td {
            padding: 10px;
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
    </style>
    <link href="../../../../../Common/Styles/style.admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Student EXAMINATION DETAIL</h2>
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
                                <label class="manadatory" for="txtFromDate">
                                    From Date
                                </label>
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
                            <div class="form-group">
                                <label class="manadatory" for="txtToDate">
                                    To Date
                                </label>
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlProgram" Display="Dynamic"
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ControlToValidate="ddlSubProgram" Display="Dynamic"
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

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSession">
                                    Exam Session
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic"
                                    ErrorMessage="Please select Semester" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="category">
                                    Roll No.</label>
                                <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlGender">
                                    Enrollment No.
                                </label>
                                <asp:TextBox ID="txtReg" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>


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

                        <div class="row col-md-12 box-container">
                            <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                <asp:GridView CssClass="table" ID="DataGridView" runat="server" Width="100%" OnRowDataBound="grdView_RowDataBound"></asp:GridView>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>

                    </div>
                </div>
            </div>

            <%----END of Filter-----%>
        </div>
    </div>
</asp:Content>
