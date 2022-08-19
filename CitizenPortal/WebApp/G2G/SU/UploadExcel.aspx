<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="UploadExcel.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.UploadExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Data Entry Report View</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>

    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />

    <script type="text/javascript">



        $(document).ready(function () {
            debugger;
            //$('#ContentPlaceHolder1_lbtnSample').innerHTML = "SampleRefundFile.xlsx";
            $("#ContentPlaceHolder1_ddlType").bind("change", function (e) { return ReportChange(); });

            document.getElementById('<%= lbtnSample.ClientID %>').text = "SampleExcelFile.xlsx";           

            var table = $("table[id$='gvDetail']").DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength','excel', 'print'],
                    "lengthMenu": [[10, 50, 100], [10, 50, 100]],
                    "iDisplayLength": 100
                });

            $("div[id$='LoadingDiv']").hide(800);
            $("div[id$='DisplayGrid']").show(800);

        });
       

        function ReportChange() {
            debugger;
            var ReportType = $('#ContentPlaceHolder1_ddlType option:selected').val();
            
            if (ReportType == "College") {
                document.getElementById('<%= lbtnSample.ClientID %>').text  = 'CollegeMasterSampleFile.xlsx'
            } else if (ReportType == "Subject") {
                document.getElementById('<%= lbtnSample.ClientID %>').text  = "SubjectMasterSampleFile.xlsx"
            } else if (ReportType == "Paper") {
                document.getElementById('<%= lbtnSample.ClientID %>').text  = "PaperMasterSampleFile.xlsx"
            } else if (ReportType == "Result") {
                document.getElementById('<%= lbtnSample.ClientID %>').text  = "ResultSampleFile.xlsx"
            } else if (ReportType == "Refund") {
                document.getElementById('<%= lbtnSample.ClientID %>').text  = "RefundSampleFile.xlsx"
            } else { document.getElementById('<%= lbtnSample.ClientID %>').text  = "SampleRefundFile.xlsx" }

        }

        function downloadSample() {
            var ReportType = $('#ContentPlaceHolder1_ddlType option:selected').val();

            if (ReportType == "College") {
                window.open("../../../Uploads/CollegeMasterSampleFile.xlsx");
            } else if (ReportType == "Subject") {
                window.open("../../../Uploads/SubjectMasterSampleFile.xlsx");
            } else if(ReportType == "Paper") {
                window.open("../../../Uploads/PaperMasterSampleFile.xlsx");
            } else if (ReportType == "Result") {
                window.open("../../../Uploads/ResultSampleFile.xlsx");
            } else if (ReportType == "Refund") {
                window.open("../../../Uploads/RefundSampleFile.xlsx");
            } else { window.open("../../../Uploads/SampleRefundFile.xlsx"); }

        }

        function ConfirmSubmit() {
            debugger;
            if (confirm("Please Confirm! You want to Send the Marks for Approval to SOEC?")) {
                //confirm_value.value = "Yes";
                return true;
            } else {
                //confirm_value.value = "No";
                return false;
            }

        }

        function ValidateUploadFile() {
            debugger;
            if ($('#ContentPlaceHolder1_ddlType option:selected').val() == 0)
            {
                alert('Please select Upload Type');
                return false;
            }

            if ($('#ContentPlaceHolder1_ddlType option:selected').val() == "Paper") {
                if ($('#ContentPlaceHolder1_ddlSemester option:selected').val() == 0) {
                    alert('Please select Semester');
                    return false;
                }
            }

            if ($('#ContentPlaceHolder1_ddlType option:selected').val() == "Result") {
                if ($('#ContentPlaceHolder1_ddlSemester option:selected').val() == 0) {
                    alert('Please select Semester');
                    return false;
                }

                if ($('#ContentPlaceHolder1_ddlSession option:selected').val() == 0) {
                    alert('Please select Exam Year');
                    return false;
                }

                if ($('#ContentPlaceHolder1_ddlBranch option:selected').val() == 0) {
                    alert('Please select Branch');
                    return false;
                }
            }

            if ($('#ContentPlaceHolder1_FU1').length == 0) {
                alert('Please select Excel File Upload!');
                return false;
            }

        }

    </script>
    <style>
        /**/ .ui-widget-header {
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

        table.dataTable thead .sorting, table.dataTable thead .sorting_asc, table.dataTable thead .sorting_desc, table.dataTable thead .sorting_asc_disabled, table.dataTable thead .sorting_desc_disabled {
            background-color: #2f4e6c !important;
        }

        div.dataTables_wrapper div.dataTables_info {
            color: #2f4e6c !important;
        }

        #DataGridView .current {
            background-color: #2f4e6c !important;
            color: #fff !important;
        }

        #tamt {
            display: inline-block;
            font-size: 1.2em;
            color: #fff;
            vertical-align: middle;
        }

        .bootstrap-datetimepicker-widget {
            position: static;
            z-index: 10000;
            width: 20em !important;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Upload Excel File</h2>
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
                                <label class="" for="ddlType">
                                    Upload Type
                                </label>
                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="College" Text="College Master"></asp:ListItem>
                                    <asp:ListItem Value="Subject" Text="Subject Master"></asp:ListItem>
                                    <asp:ListItem Value="Paper" Text="Paper Master"></asp:ListItem>
                                    <asp:ListItem Value="Result" Text="University Result"></asp:ListItem>
                                    <asp:ListItem Value="Refund" Text="Refund Report"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSemester">
                                    Semester
                                </label>
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1SEM" Text="1st SEM"></asp:ListItem>
                                    <asp:ListItem Value="2SEM" Text="2nd SEM"></asp:ListItem>
                                    <asp:ListItem Value="3SEM" Text="3rd SEM"></asp:ListItem>
                                    <asp:ListItem Value="4SEM" Text="4th SEM"></asp:ListItem>
                                    <asp:ListItem Value="5SEM" Text="5th SEM"></asp:ListItem>
                                    <asp:ListItem Value="6SEM" Text="6th SEM"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSession">
                                    Exam Year
                                </label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="2016" Text="2016"></asp:ListItem>
                                    <asp:ListItem Value="2017" Text="2017"></asp:ListItem>
                                    <asp:ListItem Value="2018" Text="2018"></asp:ListItem>
                                    <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlBranch">
                                   Branch</label>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="AH" Text="Arts Honours"></asp:ListItem>
                                    <asp:ListItem Value="AP" Text="Arts Pass"></asp:ListItem>
                                    <asp:ListItem Value="CH" Text="Commerce Honours"></asp:ListItem>
                                    <asp:ListItem Value="CP" Text="Commerce Pass"></asp:ListItem>
                                    <asp:ListItem Value="SH" Text="Science Honours"></asp:ListItem>
                                    <asp:ListItem Value="SP" Text="Science Pass"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 text-right">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-primary"
                                    Text="Report" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                        <div class="clearfix"></div>                        
                        <div class="col-xs-12 col-sm-2 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="" for="FU1">
                                    Select Excel File
                                </label>
                                <asp:FileUpload ID="FU1" runat="server" TabIndex="3" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 text-right">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Upload Excel" OnClick="btnSave_Click" OnClientClick="javascript:return ValidateUploadFile();" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-1 col-lg-1"></div>
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3 text-right">
                            <div class="form-group">
                                <label class="" for="ddlBranch">
                                    Check Sample Excel File</label>
                                <asp:LinkButton ID="lbtnSample" ToolTip="Download Sample Template" runat="server" OnClientClick="return downloadSample();" CssClass="btn btn-grey"></asp:LinkButton>
                            </div>
                        </div>
                        
                        <div class="clearfix">
                        </div>
                    </div>

                    <div id="divDetails" runat="server"></div>
                    <div class="mtop15"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">File Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="row text-center" id="LoadingDiv" runat="server">
                            <div>Please Wait While Data Is Being Loaded...</div>
                            <img src="/WebApp/Login/Loading_hourglass_88px.gif" />
                        </div>
                        <div id="DisplayGrid" style="" runat="server" class="row">
                            <div class="col-md-12 box-container">
                                <asp:Panel class="col-xs-12 col-sm-12 col-md-12 col-lg-12" ID="Panel1" runat="server" ScrollBars="Auto" Style="margin: 0 auto">
                                    <asp:GridView ID="gvDetail" runat="server" EmptyDataText="There is no data to display" CssClass="table table-responsive" OnPreRender="gvDetail_PreRender">                                        
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="mtop15"></div>
                    <div class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Insert Data" OnClick="btnInsert_Click" />
                                &nbsp;
                                <asp:Button ID="btn_Reset" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btn_Reset_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
