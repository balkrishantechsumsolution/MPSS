<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="MarkEntry.aspx.cs" 
    Inherits="CitizenPortal.WebApp.Faculty.MarkEntry" %>

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
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>


    <script type="text/javascript">
        $(document).ready(function () {


            debugger;
            var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength'],
                    "lengthMenu": [[10, 50, 100, '-1'], [10, 50, 100, 'All']],
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
                //if (document.getElementById("ContentPlaceHolder1_DataGridView_TotalMarks_" + p_ID).innerHTML != '0')
                //    document.getElementById("ContentPlaceHolder1_DataGridView_txtMarks_" + p_ID).disabled = false;
                //else
                //    document.getElementById("ContentPlaceHolder1_DataGridView_txtMarks_" + p_ID).disabled = true;

                if ((document.getElementById("ContentPlaceHolder1_DataGridView_TheoryMark_CT_" + p_ID).innerHTML == '0')
                    || (document.getElementById("ContentPlaceHolder1_DataGridView_TheoryMark_CT_" + p_ID).innerHTML == ''))
                    document.getElementById("ContentPlaceHolder1_DataGridView_txtTheoryMO_CT_" + p_ID).disabled = true;
                else
                    document.getElementById("ContentPlaceHolder1_DataGridView_txtTheoryMO_CT_" + p_ID).disabled = false;

                if ((document.getElementById("ContentPlaceHolder1_DataGridView_SessionalMark_TA_" + p_ID).innerHTML == '0')
                    || (document.getElementById("ContentPlaceHolder1_DataGridView_SessionalMark_TA_" + p_ID).innerHTML == ''))
                    document.getElementById("ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + p_ID).disabled = true;
                else
                    document.getElementById("ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + p_ID).disabled = false;

                if ((document.getElementById("ContentPlaceHolder1_DataGridView_PracticalMark_" + p_ID).innerHTML == '0')
                    || (document.getElementById("ContentPlaceHolder1_DataGridView_PracticalMark_" + p_ID).innerHTML == ''))
                    document.getElementById("ContentPlaceHolder1_DataGridView_txtPracticalMarkObtain_" + p_ID).disabled = true;
                else
                    document.getElementById("ContentPlaceHolder1_DataGridView_txtPracticalMarkObtain_" + p_ID).disabled = false;
            }
            else {
                //document.getElementById("ContentPlaceHolder1_DataGridView_txtMarks_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtTheoryMO_CT_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtPracticalMarkObtain_" + p_ID).disabled = true;
            }

        }

        function SelectAllNew(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_DataGridView_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];

            //Get the CheckAll Checkbox object
            var chkAllControl = document.getElementById('ContentPlaceHolder1_DataGridView_chkAll');
            //Check if checkbox is checked or not
            if (chkAllControl.checked) {
                //if checked then check all the checkboxes in GridView
                $("#ContentPlaceHolder1_DataGridView input[name$='chkRollNo']").each(function (index) {
                    //$(this).attr('disabled', false);
                    $(this).prop('checked', 'checked');


                    strText = "";
                    p_ID = "";

                });
            }
            else {
                //if unchecked then un check all the checkboxes in GridView
                $("#ContentPlaceHolder1_DataGridView input[name$='chkRollNo']").each(function (index) {
                    //$(this).attr('disabled', true);
                    //$(this).attr('checked', false);
                    $(this).removeAttr("checked");

                    strText = $(this)[0].id.split('_');
                    p_ID = strText[3];
                    //--if IsSubmitted = Y the check no action
                    //if (document.getElementById("ContentPlaceHolder1_DataGridView_IsSubmitted_" + p_ID).innerHTML != 'Y') {
                    if (document.getElementById("ContentPlaceHolder1_DataGridView_TheoryMark_CT_" + p_ID).innerHTML == '0'
                            || document.getElementById("ContentPlaceHolder1_DataGridView_TheoryMark_CT_" + p_ID).innerHTML == '')
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtTheoryMO_CT_" + p_ID).disabled = true;
                    else
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtTheoryMO_CT_" + p_ID).disabled = false;

                    if (document.getElementById("ContentPlaceHolder1_DataGridView_SessionalMark_TA_" + p_ID).innerHTML == '0'
                            || document.getElementById("ContentPlaceHolder1_DataGridView_SessionalMark_TA_" + p_ID).innerHTML == '')
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + p_ID).disabled = true;
                    else
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + p_ID).disabled = false;

                    if (document.getElementById("ContentPlaceHolder1_DataGridView_PracticalMark_" + p_ID).innerHTML == '0'
                                || document.getElementById("ContentPlaceHolder1_DataGridView_PracticalMark_" + p_ID).innerHTML == '')
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtPracticalMarkObtain_" + p_ID).disabled = true;
                    else
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtPracticalMarkObtain_" + p_ID).disabled = false;


                    strText = "";
                    p_ID = "";
                });
            }

        }

        function SelectAll(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_DataGridView_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];

              //Get the CheckAll Checkbox object
            var chkAllControl = document.getElementById('ContentPlaceHolder1_DataGridView_chkAll');
            //Check if checkbox is checked or not
            if (chkAllControl.checked) {
            //if checked then check all the checkboxes in GridView
                $("#ContentPlaceHolder1_DataGridView input[name$='chkRollNo']").each(function (index) {
                    //$(this).attr('disabled', false);
                    $(this).prop('checked', 'checked');

                    strText = $(this)[0].id.split('_');
                    p_ID = strText[3];
                    //--if IsSubmitted = Y the check no action
                    //if (document.getElementById("ContentPlaceHolder1_DataGridView_IsSubmitted_" + p_ID).innerHTML != 'Y') {
                    if (document.getElementById("ContentPlaceHolder1_DataGridView_TheoryMark_CT_" + p_ID).innerHTML == '0'
                            || document.getElementById("ContentPlaceHolder1_DataGridView_TheoryMark_CT_" + p_ID).innerHTML == '')
                            document.getElementById("ContentPlaceHolder1_DataGridView_txtTheoryMO_CT_" + p_ID).disabled = true;
                        else
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtTheoryMO_CT_" + p_ID).disabled = false;

                    if (document.getElementById("ContentPlaceHolder1_DataGridView_SessionalMark_TA_" + p_ID).innerHTML == '0'
                            || document.getElementById("ContentPlaceHolder1_DataGridView_SessionalMark_TA_" + p_ID).innerHTML == '')
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + p_ID).disabled = true;
                        else
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + p_ID).disabled = false;

                    if (document.getElementById("ContentPlaceHolder1_DataGridView_PracticalMark_" + p_ID).innerHTML == '0'
                                || document.getElementById("ContentPlaceHolder1_DataGridView_PracticalMark_" + p_ID).innerHTML == '')
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtPracticalMarkObtain_" + p_ID).disabled = true;
                        else
                        document.getElementById("ContentPlaceHolder1_DataGridView_txtPracticalMarkObtain_" + p_ID).disabled = false;

                        strText = "";
                        p_ID = "";
                    
                });
            }
            else {
                //if unchecked then un check all the checkboxes in GridView
                $("#ContentPlaceHolder1_DataGridView input[name$='chkRollNo']").each(function (index) {
                    //$(this).attr('disabled', true);
                    //$(this).attr('checked', false);
                    $(this).removeAttr("checked");

                    strText = $(this)[0].id.split('_');
                    p_ID = strText[3];

                    document.getElementById("ContentPlaceHolder1_DataGridView_txtTheoryMO_CT_" + p_ID).disabled = true;
                    document.getElementById("ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + p_ID).disabled = true;
                    document.getElementById("ContentPlaceHolder1_DataGridView_txtPracticalMarkObtain_" + p_ID).disabled = true;

                    strText = "";
                    p_ID = "";
                });
            }

        }
		
        function IsAbsent(p_RowID) {
            debugger;
            var t_Id = "ContentPlaceHolder1_DataGridView_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];
            if (document.getElementById("ContentPlaceHolder1_DataGridView_chkIsAbsent_" + p_ID).checked) {
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMarks_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMarks_" + p_ID).value = "0";
            }
            else {
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMarks_" + p_ID).disabled = false;
            }

        }

        function ConfirmSubmit() {
            debugger;
            if (confirm("Please Confirm! Do you want to Submit the Save Mark?")) {
                //confirm_value.value = "Yes";
                return true;
            } else {
                //confirm_value.value = "No";
                return false;
            }

        
        }

    </script>
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>MARKS ENTRY</h2>
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
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="" for="ddlCollege">
                                    College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCollege" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select College." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlCourse">
                                    Course 
                                </label>
                                <asp:dropdownlist id="ddlCourse" runat="server" cssclass="form-control" onselectedindexchanged="ddlCourse_SelectedIndexChanged" autopostback="true">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:dropdownlist>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" initialvalue="0" controltovalidate="ddlCourse" display="Dynamic"
                                    errormessage="Please select Course" validationgroup="G" forecolor="Red" setfocusonerror="true" enableclientscript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlProgram">
                                    Program
                                </label>
                                <asp:dropdownlist id="ddlProgram" runat="server" cssclass="form-control" onselectedindexchanged="ddlProgram_SelectedIndexChanged" autopostback="True">
                                    <asp:ListItem Value="0">Select Program</asp:ListItem>
                                </asp:dropdownlist>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator29" runat="server" initialvalue="0" controltovalidate="ddlProgram" display="Dynamic"
                                    errormessage="Please select Program" validationgroup="G" forecolor="Red" setfocusonerror="true" enableclientscript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlExamType">
                                    Exam Type
                                </label>
                                <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control" >
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Regular" Selected="True" ></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Backlog"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlExamType" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select exam type." ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSession">
                                    Session
                                </label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                    ErrorMessage="Please select SESSION" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSemester">
                                    Semester
                                </label>
                                <asp:dropdownlist id="ddlSemester" runat="server" cssclass="form-control" onselectedindexchanged="ddlSemester_SelectedIndexChanged" autopostback="true">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                    
                                </asp:dropdownlist>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic" Style="white-space: nowrap"
                                    ErrorMessage="Please select Semester" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Subject</label>
                                <div class="col-xs-12 pleft0 pright0">
                                    <asp:dropdownlist id="ddlSubject" runat="server" cssclass="form-control">
                                        <asp:ListItem Value="0">--Select Subject--</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:requiredfieldvalidator id="rfv" runat="server" controltovalidate="ddlSubject" initialvalue="0" display="Dynamic"
                                        errormessage="Please select Subject" validationgroup="G" forecolor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="txtRollNo">
                                    Roll No
                                </label>
                                <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 text-right">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-success"
                                        Text="Search" OnClick="btnSearch_Click" ValidationGroup="G" />
                            </div>
                        </div>

                        <div class="clearfix">
                        </div>

                    </div>

                    <div id="divDetails" runat="server"></div>
                    <div class="mtop15"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">Application List
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div style="text-align: center; color: red; padding: 3px">Note: After submission of Marks, take print out of the submitted marks by clicking on "PRINT SUNMITTED MARK" button </div>
                        <div class="row text-center" id="LoadingDiv" runat="server">
                            <div>Please Wait While Data Is Being Loaded...</div>
                            <img src="/WebApp/Login/Loading_hourglass_88px.gif" />
                        </div>
                        <div id="DisplayGrid" style="" runat="server" class="row">
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
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkAll" runat="server" onclick="return SelectAll(this);" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkRollNo" runat="server" onclick="return EnableControls(this);" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Roll No">
                                                <ItemTemplate>
                                                    <asp:Label ID="RollNo" runat="server" Text='<%#Eval("RollNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" />
                                            <asp:BoundField DataField="ExamType" HeaderText="Exam Type" Visible="false" />

                                            <asp:TemplateField HeaderText="Subject Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="SubjectCode" runat="server" Text='<%# Bind("SubjectCode") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" Visible="false" />
                                            <asp:TemplateField HeaderText="Total CT" >
                                                <ItemTemplate>
                                                    <asp:Label ID="TheoryMark_CT" runat="server" Text='<%# Bind("TheoryMark_CT") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Marks Obtain CT">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtTheoryMO_CT" runat="server" MaxLength="2" Width="70" Text='<%#Eval("TheoryMO_CT") %>' onkeypress="return isNumberKeyAB(event);" Enabled="false"></asp:TextBox>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtTheoryMO_CT" ErrorMessage="Invalid Entry! Enter:(<= Total Marks or AB or ab)" ClientValidationFunction="CheckMarksEnter"></asp:CustomValidator>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Sessional Mark TA">
                                                <ItemTemplate>
                                                    <asp:Label ID="SessionalMark_TA" runat="server" Text='<%# Bind("SessionalMark_TA") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sessional MO TA">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtSessionalMO_TA" runat="server" MaxLength="3" Width="70" Text='<%#Eval("SessionalMO_TA") %>' onkeypress="return isNumberKeyAB(event);" Enabled="false"></asp:TextBox>
                                                    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtSessionalMO_TA" ErrorMessage="Invalid Entry! Enter:(Min. Mark <= Total Marks or AB or MP or)" ClientValidationFunction="CheckMarksEnter2"></asp:CustomValidator>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Min Sessional Mark TA">
                                                <ItemTemplate>
                                                    <asp:Label ID="MinSessionalMark_TA" runat="server" Text='<%# Bind("Sessional_TA_Min") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Practical Total Marks" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PracticalMark" runat="server" Text='<%# Bind("PracticalMark") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Practical Marks Obtain" Visible="false">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtPracticalMarkObtain" runat="server" MaxLength="2" Width="70" Text='<%#Eval("PracticalMarkObtain") %>' onkeypress="return isNumberKeyAB(event);" Enabled="false"></asp:TextBox>
                                                    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtPracticalMarkObtain" ErrorMessage="Invalid Entry! Enter:(<= Total Marks or AB or MP)" ClientValidationFunction="CheckMarksEnter3"></asp:CustomValidator>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Theory Total Marks" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="TheoryTM" runat="server" Text='<%# Bind("TheoryMark") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Theory Marks Obtain" Visible="false">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtTheoryMarkObtain" runat="server" MaxLength="2" Width="70" Text='<%#Eval("TheoryMarkObtain") %>' onkeypress="return isNumberKeyAB(event);" Enabled="false"></asp:TextBox>
                                                    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtTheoryMarkObtain" ErrorMessage="Invalid Entry! Enter:(<= Total Marks or AB or MB)" ClientValidationFunction="CheckMarksEnter4"></asp:CustomValidator>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Is Absent" Visible="false">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkIsAbsent" runat="server" Enabled="false" onclick="return IsAbsent(this);"
                                                        Checked='<%# isAbsent(Eval("IsAbsent").ToString())%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Is Submitted" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="IsSubmitted" runat="server" Text='<%# Bind("IsSubmitted") %>' />
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
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save Marks" OnClick="btnSave_Click" />
                                <asp:Button ID="btnSubmit" runat="server" Text="Send for Approval" CssClass="btn btn-danger" OnClick="btnSubmit_Click" OnClientClick="javascript:return ConfirmSubmit();" />
                                <asp:Button ID="btnPrint" runat="server" Text="Print Sunmitted Mark" CssClass="btn btn-success" OnClick="btnPrint_Click" />

                            </div>
                        </div>

                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>


    </div>


</asp:Content>
