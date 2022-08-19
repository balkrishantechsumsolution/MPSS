<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="ActivityConfiguration.aspx.cs" Inherits="CitizenPortal.WebApp.Activity.ActivityConfiguration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Data Entry Report View</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="moment.min.js"></script>

    <script src="bootstrap-datetimepicker.min.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <%--<link href="bootstrap-datetimepicker.css" rel="stylesheet" />--%>
    <link href="bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function () {
            //datePicker
            debugger;
            for (var i = 0; i < 1; i++) {

                $('#ContentPlaceHolder1_DataGridView_txtSEMEndDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss',  minDate: "0"
                });

                $('#ContentPlaceHolder1_DataGridView_txtStartDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss', minDate: '0'
                });

                $('#ContentPlaceHolder1_DataGridView_txtAttendanceEndDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss', minDate: '0'
                });

                $('#ContentPlaceHolder1_DataGridView_txtElectiveSubjectEndDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss', minDate: '0'
                });

                $('#ContentPlaceHolder1_DataGridView_txtMarkEntryEndDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss', minDate: '0'
                });

                $('#ContentPlaceHolder1_DataGridView_txtOfflineEndDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss', minDate: '0'
                });

                $('#ContentPlaceHolder1_DataGridView_txtResultDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss', minDate: '0'
                });
            }

            var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100], [10, 50, 100]],
                    "iDisplayLength": 100
                });

            $("div[id$='LoadingDiv']").hide(800);
            $("div[id$='DisplayGrid']").show(800);

            //document.getElementById("ContentPlaceHolder1_DataGridView_ExamSemester_" + p_ID).disabled = true;
            //document.getElementById("ContentPlaceHolder1_DataGridView_ExamYear_" + p_ID).disabled = true;
            ////document.getElementById("ContentPlaceHolder1_DataGridView_Activity_" + p_ID).disabled = false;
            //document.getElementById("ContentPlaceHolder1_DataGridView_txtStartDate_" + p_ID).disabled = true;
            //document.getElementById("ContentPlaceHolder1_DataGridView_txtSEMEndDate_" + p_ID).disabled = true

            //document.getElementById("ContentPlaceHolder1_DataGridView_txtAttendanceEndDate_" + p_ID).disabled = true;
            //document.getElementById("ContentPlaceHolder1_DataGridView_txtElectiveSubjectEndDate_" + p_ID).disabled = true;
            //document.getElementById("ContentPlaceHolder1_DataGridView_txtMarkEntryEndDate_" + p_ID).disabled = true;
            //document.getElementById("ContentPlaceHolder1_DataGridView_txtOfflineEndDate_" + p_ID).disabled = true;
            //document.getElementById("ContentPlaceHolder1_DataGridView_txtResultDate_" + p_ID).disabled = true;

        });

        function EnableControls(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_DataGridView_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];
            if (document.getElementById("ContentPlaceHolder1_DataGridView_chkRollNo_" + p_ID).checked) {
                document.getElementById("ContentPlaceHolder1_DataGridView_ExamSemester_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_ExamYear_" + p_ID).disabled = false;
                //document.getElementById("ContentPlaceHolder1_DataGridView_Activity_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtStartDate_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtSEMEndDate_" + p_ID).disabled = false;

                document.getElementById("ContentPlaceHolder1_DataGridView_txtAttendanceEndDate_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtElectiveSubjectEndDate_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMarkEntryEndDate_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtOfflineEndDate_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtResultDate_" + p_ID).disabled = false;
            }
            else {
                document.getElementById("ContentPlaceHolder1_DataGridView_ExamSemester_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_ExamYear_" + p_ID).disabled = true;
                //document.getElementById("ContentPlaceHolder1_DataGridView_Activity_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtStartDate_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtSEMEndDate_" + p_ID).disabled = true

                document.getElementById("ContentPlaceHolder1_DataGridView_txtAttendanceEndDate_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtElectiveSubjectEndDate_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMarkEntryEndDate_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtOfflineEndDate_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtResultDate_" + p_ID).disabled = true;

            }

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

        .usetwentyfour {
        }

        .auto-style1 {
            margin-left: 40px;
            margin-bottom: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Activity Configuration</h2>
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

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2" style="display:none">
                            <div class="form-group">
                                <label class="manadatory" for="ddlActivity">
                                    Activity</label>
                                <asp:DropDownList ID="ddlActivity" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1473" Text="Semester Form Fill-up"></asp:ListItem>
                                    <asp:ListItem Value="1042" Text="Elective Subject Change"></asp:ListItem>
                                    <asp:ListItem Value="1045" Text="Attendance"></asp:ListItem>
                                    <asp:ListItem Value="1043" Text="Mark Entry (CT/TA/Prctical & Sessional)"></asp:ListItem>
                                    <asp:ListItem Value="1473" Text="Offline Form Fill-up"></asp:ListItem>
                                    <asp:ListItem Value="1027" Text="Result Declaration"></asp:ListItem>
                                    <asp:ListItem Value="1474" Text="RT/RV"></asp:ListItem>
                                    <asp:ListItem Value="1475" Text="RRV"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="ddlActivity" Display="Dynamic"
                                    ErrorMessage="Please select Activity" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlCourse">
                                    Course 
                                </label>
                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ControlToValidate="ddlCourse" Display="Dynamic"
                                    ErrorMessage="Please select Course" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSession">
                                    Exam Year
                                </label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="Apr-May 2022" Text="Apr-May 2022"></asp:ListItem>
                                    <asp:ListItem Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2" style="display: none">
                            <div class="form-group">
                                <label class="manadatory" for="ddlExamType">
                                    Exam Type
                                </label>
                                <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="Regular" Text="Regular" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="Backlog" Text="Backlog"></asp:ListItem>
                                    <asp:ListItem Value="AggBacklog" Text="AggBacklog"></asp:ListItem>
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
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic" Style="white-space: nowrap"
                                    ErrorMessage="Please select Semester" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 text-right">
                            <div class="auto-style1">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-primary"
                                        Text="Search" OnClick="btnSearch_Click" />
                                &nbsp;
                                <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CssClass="btn btn-success"
                                    Text="Add" OnClick="btnAdd_Click" />
                                &nbsp;
                                <asp:Button ID="btnEdit" runat="server" CausesValidation="true" CssClass="btn btn-danger"
                                    Text="Edit" ValidationGroup="G" OnClick="btnEdit_Click" />
                            </div>
                        </div>

                        <div class="clearfix">
                        </div>

                    </div>

                    <div id="divDetails" runat="server"></div>
                    <div class="mtop15"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">Actvity Configuration
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                                                
                        <div id="DisplayGrid" style="" runat="server" class="row">
                            <div class="col-md-12 box-container">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">

                                    <asp:GridView ID="DataGridView" runat="server" Width="99%" OnPreRender="DataGridView_PreRender"  CssClass="table table-striped table-bordered" 
                                        AutoGenerateColumns="false" OnRowDataBound="grdView_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl. No">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("RowID")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkRollNo" runat="server" onclick="return EnableControls(this);" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Course" HeaderStyle-Width="150">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exam Semester">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ExamSemester" runat="server" CssClass="form-control" SelectedValue='<%# Bind("Semester") %>' Width="100px">
                                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="1 SEMESTER" Text="1 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="2 SEMESTER" Text="2 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="3 SEMESTER" Text="3 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="4 SEMESTER" Text="4 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="5 SEMESTER" Text="5 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="6 SEMESTER" Text="6 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="7 SEMESTER" Text="7 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="8 SEMESTER" Text="8 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="9 SEMESTER" Text="9 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="10 SEMESTER" Text="10 Semester"></asp:ListItem>
                                                        <asp:ListItem Value="1 Year" Text="1 Year"></asp:ListItem>
                                                        <asp:ListItem Value="2 Year" Text="2 Year"></asp:ListItem>
                                                        <asp:ListItem Value="Session 1" Text="Session 1"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exam Year">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ExamYear" runat="server" CssClass="form-control" SelectedValue='<%# Bind("ExamYear") %>' Width="100px">
                                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="APR-MAY 2022" Text="Apr-May 2022"></asp:ListItem>
                                                        <asp:ListItem Value="NOV-DEC 2021" Text="Nov-Dec 2021"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Date">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("StartDate") %>' Width="120px" CssClass="datePicker form-control" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Form Fill-up End Date">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtSEMEndDate" runat="server" Text='<%# Bind("EndDate") %>' Width="120px" CssClass="datePicker form-control" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Attendance End Date">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtAttendanceEndDate" runat="server" Text='<%# Bind("AttendanceEndDate") %>' Width="120px" CssClass="datePicker form-control" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Elective End Date">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtElectiveSubjectEndDate" runat="server" Text='<%# Bind("ElectiveSubjectEndDate") %>' Width="120px" CssClass="datePicker form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mark Entry End Date">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtMarkEntryEndDate" runat="server" Text='<%# Bind("MarkEntryEndDate") %>' Width="120px" CssClass="datePicker form-control" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Offline End Date">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtOfflineEndDate" runat="server" Text='<%# Bind("OfflineEndDate") %>' Width="120px" CssClass="datePicker form-control" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Result Date">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtResultDate" runat="server" Text='<%# Bind("ResultDate") %>' Width="120px" CssClass="datePicker form-control" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Created On">
                                                <ItemTemplate>
                                                    <asp:Label ID="CreatedOn" runat="server" Text='<%# Bind("CreatedOn") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>


                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                    <!---------------Remarks Fields----------->
                    <div class="mtop15"></div>
                    <div class="row">
                        <div id="divBtn" runat="server" class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save Configuration" OnClick="btnSave_Click" />

                            </div>
                        </div>

                    </div>
                </div>

                <div class="clearfix"></div>
            </div>

        </div>


    </div>

    <asp:HiddenField ID="hdfActionType" runat="server" />
</asp:Content>
