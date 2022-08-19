<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="EnrollmentData.aspx.cs" Inherits="CitizenPortal.WebApp.Report.EnrollmentData" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/G2G/OISF/css/allocationCenterStylesheet.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />
    <style>
         tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
        }


        table#gvDetail > thead > tr > th {
        }

        table#gvDetail > tbody > tr > td {
        }

        #gvDetail input, textarea {
        }
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

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 32.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #B65838;
        }

            .SrvDiv a {
                color: #472A26;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
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
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }

        .GridPager a, .GridPager span {
            display: block;
            padding: 5px 15px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f0f0f0;
            color: #545454;
            border: 1px solid #ddd;
        }

            .GridPager a:hover {
                background-color: #37495f;
                color: #fff;
            }

        .GridPager span {
            background-color: #B65838;
            color: #fff;
            border: 1px solid #B65838;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
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

                var table = $("table[id$='gvDetail']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
        ({
            dom: 'Bfrtip',
            buttons: ['pageLength', 'excel', 'print'],
            "lengthMenu": [[10, 50, 100,-1], [10, 50, 100, 'All']],
            "iDisplayLength": 100
        });

        });

        function TakeAction(p_URL, p_AppID, p_Flag) {

            //var t_URL = ResolveUrl(p_URL);
            var t_URL = p_URL.replace("|", "&");
            t_URL = t_URL;
            window.open(t_URL, 'View', 'height=' + screen.height + ',width=1400,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

       
    </script>
    <script type="text/javascript">
        $("[id*=RowID_ChkHdr]").live("click", function () {
            var chkHeader = $(this);
            var grid = $(this).closest("table");
            $("input[type=checkbox]", grid).each(function () {
                if (chkHeader.is(":checked")) {
                    $(this).attr("checked", "checked");
                    $("td", $(this).closest("tr")).addClass("selected");
                } else {
                    $(this).removeAttr("checked");
                    $("td", $(this).closest("tr")).removeClass("selected");
                }
            });
        });
        $("[id*=CheckBox1]").live("click", function () {
            var grid = $(this).closest("table");
            var chkHeader = $("[id*=RowID_ChkHdr]", grid);
            if (!$(this).is(":checked")) {
                $("td", $(this).closest("tr")).removeClass("selected");
                chkHeader.removeAttr("checked");
            } else {
                $("td", $(this).closest("tr")).addClass("selected");
                if ($("[id*=CheckBox1]", grid).length == $("[id*=CheckBox1]:checked", grid).length) {
                    chkHeader.attr("checked", "checked");
                }
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="container-fluid">
        <div class="row" id="page-wrapper" style="min-height: 500px !important;">
            <div class="row" id="div1" runat="server">
                <div class="row">
                    <div class="col-lg-12 cscPgehd">
                        <h2 class="form-heading">Enrollment Data</h2>
                    </div>
                </div>
                <%---Start of Filter----%>
                <div class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Search Filter
                            </h4>
                        </div>
                        <div class="box-body box-body-open">                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="" for="category">
                                        College</label>
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ControlToValidate="ddlCollege" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select College" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Report Type</label>                              
                                <asp:DropDownList ID="ddlServices" runat="server" Width="100%" CssClass="form-control" onchange="fnReportType();">
                                    <asp:ListItem Value="0" Text="--Select Report--"></asp:ListItem>
                                    <asp:ListItem Value="CR001" Text="Student Master"></asp:ListItem>
                                    <asp:ListItem Value="CR002" Text="DTE Councelling Data"></asp:ListItem>
                                    <asp:ListItem Value="CR003" Text="Enrollment Data"></asp:ListItem>
                                    <asp:ListItem Value="CR004" Text="Eligible Student for Semester Form Fill-up"></asp:ListItem>
									<asp:ListItem Value="CR005" Text="Semester Form Fill-up Data"></asp:ListItem>
									<asp:ListItem Value="CR006" Text="Student Login ID & Password"></asp:ListItem>
									<asp:ListItem Value="CR007" Text="Elective Subject Summary Report"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                                <div class="form-group">
                                    <label class="" for="ddlDepartment">
                                        Department 
                                    </label>
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                        
                                    </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlDepartment" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select Department" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />--%>

                                </div>
                            </div>                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="" for="ddlCourse">
                                        Course 
                                    </label>
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ControlToValidate="ddlCourse" Display="Dynamic"
                                        ErrorMessage="Please select Course" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />--%>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="" for="ddlProgram">
                                        Program
                                    </label>
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0">Select Program</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" InitialValue="0" ControlToValidate="ddlProgram" Display="Dynamic"
                                        ErrorMessage="Please select Program" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
                                <div class="form-group">
                                    <label class="" for="ddlSession">
                                        Exam Session
                                    </label>
                                    <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                        <asp:ListItem Value="Apr-May 2021" Text="Apr-May 2021"></asp:ListItem>
                                        <asp:ListItem Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlAdmission">
                                        Admitted Session
                                    </label>
                                    <asp:DropDownList ID="ddlAdmission" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                        <asp:ListItem Value="2021-2020" Selected="True" Text="2021-2020"></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2"  style="display:none">
                                <div class="form-group">
                                    <label class="" for="ddlSemester">
                                        Semester
                                    </label>
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" AutoPostBack="true">
                                        
                                    </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select Semester" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="display:none">
                                <div class="form-group">
                                    <label class="">Subject</label>
                                    <div class="col-xs-12 pleft0 pright0">
                                        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select Subject--</asp:ListItem>
                                        </asp:DropDownList>
                                        <%--<asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlSubject" InitialValue="0" Display="Dynamic"
                                            ErrorMessage="Please select Subject" ValidationGroup="A" ForeColor="Red" />--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="" for="ddlStatus">
                                        Status
                                    </label>
                                    <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True"
                                        CssClass="form-control" ToolTip="Select Status">
                                        <asp:ListItem Value="0">-Select Status-</asp:ListItem>
                                        <asp:ListItem Value="P">Pending</asp:ListItem>
                                        <asp:ListItem Value="A">Approved</asp:ListItem>
                                        <asp:ListItem Value="R">Rejected</asp:ListItem>
                                        <asp:ListItem Value="Z">All Data</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlStatus" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select Status" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="" for="ddlCategory">
                                        Social Category
                                    </label>
                                    <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True"
                                        CssClass="form-control" ToolTip="Select Status">
                                        <asp:ListItem Value="0">-Select Status-</asp:ListItem>
                                        <asp:ListItem Value="SC">SC</asp:ListItem>
                                        <asp:ListItem Value="ST">ST</asp:ListItem>
                                        <asp:ListItem Value="OBC">OBC</asp:ListItem>
                                        <asp:ListItem Value="UR">UR</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlStatus" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select Status" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="" for="txtRollNo">Application No.</label>
                                    <asp:TextBox runat="server" ID="txtRollNo" class="form-control" placeholder="Regd. No" name="ApplicationNo" MaxLength="20"
                                        type="text" value=""></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                <div class="form-group">
                                    <label class="" for="txtFromDate">
                                        From Date
                                    </label>
                                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                <div class="form-group">
                                    <label class="" for="txtToDate">
                                        To Date
                                    </label>
                                    <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 text-right">
                                <div class="form-group"><label class="" for="txtToDate">
                                        &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-success" ValidationGroup="A"
                                Text="Search" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>

                    <%---Start of Button----%>

                    <div class="col-md-12 box-container" style="display:none">
                        <div class="box-body box-body-open" style="text-align: center;">
                            
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container">

                        <div id="divApp" class="row" runat="server">
                            <div class="col-md-12 box-container mtop20">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">List of Applications
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div style="text-align: center;color:red; padding: 3px 3px 10px">Please Note: Edit Functionality will work for <b>Pending </b>Application, if action has been taken on application <br />i.e. <b>Approved/Rejected</b> then the<b> Edit & Action </b>functionality will not work </div>

                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="99%" Style="margin: 0 auto">
                                        <asp:GridView ID="gvDetail" CssClass="table table-striped table-bordered" runat="server" 
                                            Style="margin: 0 auto;" DataKeyNames="rowid" EmptyDataText="There is no data to display" 
                                            Width="100%" AutoGenerateColumns="False" OnRowCreated="gvDetail_RowCreated" OnRowDataBound="gvDetail_RowDataBound">
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                                <asp:HiddenField ID="HFRowID" runat="server" />
                                <asp:HiddenField ID="HFTabID" runat="server" />
                                <div class="clearfix"></div>
                            </div>



                        </div>
                    </div>
                </div>

            </div>

            <%----END of Filter-----%>
        </div>
    </div>
</asp:Content>
