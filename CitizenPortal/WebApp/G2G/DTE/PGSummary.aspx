<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true"
    CodeBehind="PGSummary.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DTE.PGSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
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
    </style>
    <script>

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

        $(document).ready(function () {
            debugger;
            var table = $("table[id$='grdView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100], [10, 50, 100]],
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

        function TakeAction(p_URL, p_ServiceID, p_AppID, p_Semester, p_ExamYear) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/G2G/DTE/PGDetail.aspx";
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&SEM=" + p_Semester + "&YEAR=" + p_ExamYear;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row mt20">
            <div class="col-lg-12">
            </div>
        </div>
        <%--   <uc1:G2GInfomation runat="server" ID="G2GInfomation" />--%>

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
                            <%--<input id="txtFromDate" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOB" type="text" value="" />--%>
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtToDate">
                                To Date
                            </label>
                            <%--<input id="txtToDate" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOD" type="text" value="" />--%>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlSemester">
                                Semester</label>
                            <asp:DropDownList ID="ddlSemester" runat="server" Width="95%" CssClass="form-control">
                                <asp:ListItem>-Select Semester-</asp:ListItem>
                                <asp:ListItem Value="1st">1st SEM</asp:ListItem>
                                <asp:ListItem Value="2nd">2nd SEM</asp:ListItem>
                                <asp:ListItem Value="3rd">3rd SEM</asp:ListItem>
                                <asp:ListItem Value="4th">4th SEM</asp:ListItem>
                                <asp:ListItem Value="5th">5th SEM</asp:ListItem>
                                <asp:ListItem Value="6th">6th SEM</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlExamYear">
                                Category</label>                            
                            <asp:DropDownList ID="ddlExamYear" runat="server" Width="95%" CssClass="form-control">
                            <asp:ListItem>-Select Exam Year-</asp:ListItem>
                                <asp:ListItem Value="2018">2018</asp:ListItem>
                                <asp:ListItem Value="2017">2017</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
                        <div class="form-group">
                            <label class="manadatory" for="category">
                                Category</label>                           
                            <asp:DropDownList ID="ddlServices" runat="server" Width="95%" CssClass="form-control">
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Village
                            </label>
                            <asp:DropDownList ID="ddlVillage" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select City or Town name (if doesnot exist select other)">
                                <asp:ListItem>Select Village / City / Town</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Application Status
                            </label>
                            <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True"
                                CssClass="form-control" ToolTip="Select Status">
                                <asp:ListItem>-Select Status-</asp:ListItem>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="A">Approved</asp:ListItem>
                                <asp:ListItem Value="R">Rejected</asp:ListItem>
                                <asp:ListItem Value="S">Send Back to Applicant</asp:ListItem>
                            </asp:DropDownList>
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
                                    Text="Search" />
                            <label>
                                &nbsp;</label><asp:Button ID="BtnDownload" runat="server" CausesValidation="False" CssClass="btn btn-success" Visible="false"
                                    Text="Export To Excel" OnClick="BtnDownload_Click" />
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
                    <h4 class="box-title register-num">Transaction Summary
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 500px; overflow: auto;">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group p0">
                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="text-center col-md-12 col-sm-12 col-xs-12" style="display:none">

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