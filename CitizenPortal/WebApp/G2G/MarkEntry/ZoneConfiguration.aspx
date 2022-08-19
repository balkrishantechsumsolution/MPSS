<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="ZoneConfiguration.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.MarkEntry.ZoneConfiguration" %>

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
    <link href="../../Styles/bootstrap-multiselect.css" rel="stylesheet" />
    <script src="../../Scripts/bootstrap-multiselect.js"></script>
    <style type="text/css">
    .multiselect-container {
        width: 100% !important;
    }
</style>
  
    <script type="text/javascript">
        
        $(document).ready(function () {
            //datePicker
            debugger;

            $('[id*=ddlSemester]').multiselect({
                includeSelectAllOption: false,
                size: "6"
            });

            for (var i = 0; i < 7; i++) {

                $('#ContentPlaceHolder1_DataGridView_txtEndDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss', minDate: '-1'
                });

                $('#ContentPlaceHolder1_DataGridView_txtStartDate_' + i).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm:ss', minDate: '0'
                });                               
            }

            var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength'],
                    "lengthMenu": [[10, 50, 100,-1], [10, 50, 100,'All']],
                    "iDisplayLength": 100
                });

            $("div[id$='LoadingDiv']").hide(800);
            $("div[id$='DisplayGrid']").show(800);

        });

        function EnableControls(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_DataGridView_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];
            if (document.getElementById("ContentPlaceHolder1_DataGridView_chkRollNo_" + p_ID).checked) {
                //document.getElementById("ContentPlaceHolder1_DataGridView_ExamSemester_" + p_ID).disabled = false;
                //document.getElementById("ContentPlaceHolder1_DataGridView_ddlSession_" + p_ID).disabled = false;
                //document.getElementById("ContentPlaceHolder1_DataGridView_ZoneID_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtStartDate_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtEndDate_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMappedCollege_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtSubjectType_" + p_ID).disabled = false;
            }
            else {
                //document.getElementById("ContentPlaceHolder1_DataGridView_ExamSemester_" + p_ID).disabled = true;
                //document.getElementById("ContentPlaceHolder1_DataGridView_ddlSession_" + p_ID).disabled = true;
                //document.getElementById("ContentPlaceHolder1_DataGridView_ZoneID_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtStartDate_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtEndDate_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMappedCollege_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtSubjectType_" + p_ID).disabled = true;
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
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Zone Configuration</h2>
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

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlActivity">
                                    Zone</label>
                                <asp:DropDownList ID="ddlZone" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue="0" ControlToValidate="ddlZone" Display="Dynamic"
                                    ErrorMessage="Please select Zone" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSemester">
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic"
                                    ErrorMessage="Please select Semester" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSession">
                                    Exam Year
                                </label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="2016" Text="2016"></asp:ListItem>
                                    <asp:ListItem Value="2017" Text="2017"></asp:ListItem>
                                    <asp:ListItem Value="2018" Text="2018"></asp:ListItem>
                                    <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                                    <asp:ListItem Value="2020" Text="2020"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                    ErrorMessage="Select Exam Year" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlBranch">
                                    Branch 
                                </label>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged1">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="ddlBranch" Display="Dynamic"
                                    ErrorMessage="Please select Branch" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                            <div class="auto-style1">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-primary"
                                        Text="Search" OnClick="btnSearch_Click" />
                                &nbsp;
                                <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CssClass="btn btn-success"
                                    Text="Add" OnClick="btnAdd_Click" ValidationGroup="G" />
                                &nbsp;
                                <asp:Button ID="btnEdit" runat="server" CausesValidation="true" CssClass="btn btn-danger"
                                    Text="Edit" ValidationGroup="G" OnClick="btnEdit_Click" />
                            </div>
                        </div>

                        <div class="clearfix">
                        </div>

                    </div>

                    <div></div>
                    <div class="box-heading" runat="server" id="divAddH">
                        <h4 class="box-title register-num">Add Examiner
                        </h4>
                    </div>
                    <div class="box-body box-body-open" runat="server" id="divAddD">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="" for="txtCollegeCode">
                                    Enter College Code (saperated with ",")
                                </label>
                                <asp:TextBox ID="txtCollegeCode" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="" for="ddlSubject">
                                    Select Subject Type
                                </label>
                                <asp:ListBox ID="ddlSubject" runat="server" Width="200px" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save Configuration" OnClick="btnSave_Click" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="mtop15"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">Mark Entry Zone Configuration
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div style="text-align: center; color: red; font-weight: bold; padding: 3px"> </div>
                        <div class="row text-center" id="LoadingDiv" runat="server">
                            <div>Please Wait While Data Is Being Loaded...</div>
                            <img src="/WebApp/Login/Loading_hourglass_88px.gif" />
                        </div>
                        <div id="divDetails" runat="server" class="row">
                            <div class="col-md-12 box-container">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">

                                    <asp:GridView ID="DataGridView" runat="server" Width="99%" OnPreRender="DataGridView_PreRender"
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
                                            <asp:TemplateField HeaderText="Zone ID">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ZoneID" runat="server" CssClass="form-control" SelectedValue='<%# Bind("ZoneID") %>' Width="80px">
                                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="11" Text="Zone-1"></asp:ListItem>
                                                        <asp:ListItem Value="12" Text="Zone-2"></asp:ListItem>
                                                        <asp:ListItem Value="13" Text="Zone-3"></asp:ListItem>
                                                        <asp:ListItem Value="14" Text="Zone-4"></asp:ListItem>
                                                        <asp:ListItem Value="15" Text="Zone-5"></asp:ListItem>
                                                        
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exam Semester">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ExamSemester" runat="server" CssClass="form-control" SelectedValue='<%# Bind("Semester") %>' Width="75px">
                                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="1SEM" Text="1st SEM"></asp:ListItem>
                                                        <asp:ListItem Value="2SEM" Text="2nd SEM"></asp:ListItem>
                                                        <asp:ListItem Value="3SEM" Text="3rd SEM"></asp:ListItem>
                                                        <asp:ListItem Value="4SEM" Text="4th SEM"></asp:ListItem>
                                                        <asp:ListItem Value="5SEM" Text="5th SEM"></asp:ListItem>
                                                        <asp:ListItem Value="6SEM" Text="6th SEM"></asp:ListItem>                                                        
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Exam Year">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control" SelectedValue='<%# Bind("ExamYear") %>' Width="75px">
                                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="2016" Text="2016"></asp:ListItem>
                                                        <asp:ListItem Value="2017" Text="2017"></asp:ListItem>
                                                        <asp:ListItem Value="2018" Text="2018"></asp:ListItem>
                                                        <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                                                        <asp:ListItem Value="2020" Text="2020"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="branch" runat="server" CssClass="form-control" SelectedValue='<%# Bind("BranchCode") %>' Width="75px">
                                                        <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="AH" Text="AH"></asp:ListItem>
                                                        <asp:ListItem Value="AP" Text="AP"></asp:ListItem>
                                                        <asp:ListItem Value="CH" Text="CH"></asp:ListItem>
                                                        <asp:ListItem Value="CP" Text="CP"></asp:ListItem>
                                                        <asp:ListItem Value="SH" Text="SH"></asp:ListItem>
                                                        <asp:ListItem Value="SP" Text="SP"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Mapped College">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtMappedCollege" runat="server" Text='<%# Bind("MappedCollege") %>' Width="150px" CssClass="datePicker"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Subject Type">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtSubjectType" runat="server" Text='<%# Bind("SubjectType") %>' Width="150px" CssClass="datePicker"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                           

                                            <asp:TemplateField HeaderText="Start Date" Visible="false">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("StartDate") %>' Width="150px" CssClass="datePicker"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date" Visible="false">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtEndDate" runat="server" Text='<%# Bind("EndDate") %>' Width="150px"></asp:TextBox>
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
