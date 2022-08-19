<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="TheoryMarks.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.MarkEntry.TheoryMarks" %>

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
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100,-1], [10, 50, 100, 'All']],
                    "iDisplayLength": 100
                });

            $("div[id$='LoadingDiv']").hide(800);
            $("div[id$='DisplayGrid']").show(800);

        });

        function EnableControls(p_RowID) {
            var t_Id = "ContentPlaceHolder1_DataGridView_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];
            if (document.getElementById("ContentPlaceHolder1_DataGridView_chkRollNo_" + p_ID).checked) {
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMarks_" + p_ID).disabled = false;
                document.getElementById("ContentPlaceHolder1_DataGridView_chkIsAbsent_" + p_ID).disabled = false;
            }
            else {
                document.getElementById("ContentPlaceHolder1_DataGridView_txtMarks_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_chkIsAbsent_" + p_ID).disabled = true;
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
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="ddlZone">
                                    Zone
                                </label>
                                <asp:DropDownList ID="ddlZone" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue="0" ControlToValidate="ddlZone" Display="Dynamic"
                                    ErrorMessage="Please select Zone" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSession">
                                    Exam Year
                                </label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                    
                                    <asp:ListItem Value="2020" Text="2020"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                    ErrorMessage="Select Exam Year" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSemester">
                                    Semester
                                </label>
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                    
                                    <asp:ListItem Value="5SEM" Text="5th SEM"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic"
                                    ErrorMessage="Please select Semester" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
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
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSubject">
                                    Subject Type 
                                </label>
                                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="0" ControlToValidate="ddlSubject" Display="Dynamic"
                                    ErrorMessage="Select Subject Type" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true"/>
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="ddlPaper">
                                    Paper 
                                </label>
                                <asp:DropDownList ID="ddlPaper" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlPaper_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ControlToValidate="ddlPaper" Display="Dynamic"
                                    ErrorMessage="Please select Paper" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true"/>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="" for="ddlExaminer">
                                    Examiner 
                                </label>
                                <asp:DropDownList ID="ddlExaminer" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="0" ControlToValidate="ddlExaminer" Display="Dynamic"
                                    ErrorMessage="Please select Examiner" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true"/>--%>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                            <div class="form-group">
                                <label class="" for="ddlCollege">
                                    College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control" >
                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlCollege" Display="Dynamic"
                                    ErrorMessage="Please select College" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true"/>AutoPostBack="True" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"--%>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2" style="display:none">
                            <div class="form-group">
                                <label class="" for="ddlExamType">
                                    Exam Type
                                </label>
                                <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Regular"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Back"></asp:ListItem>
                                </asp:DropDownList>                                
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-3 col-md-6 col-lg-4" style="display:none">
                            <div class="form-group">
                                <label class="manadatory" for="ddlRange">
                                    Range of Roll No
                                </label>
                                <asp:DropDownList ID="ddlRange" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" InitialValue="0" ControlToValidate="ddlRange" Display="Dynamic"
                                    ErrorMessage="Please select Range" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true"/>--%>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
                            <div class="form-group">
                                <label class="" for="txtRollNo">
                                    Roll No
                                </label>
                                <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 text-right">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-success"
                                        Text="Search" OnClick="btnSearch_Click" ValidationGroup="G" />
                                
                                <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CssClass="btn btn-danger"
                                    Text="Add New Examiner" OnClick="btnAdd_Click" visible="false"/>
                            </div>
                        </div>

                        <div class="clearfix">
                        </div>

                    </div>

                    <div class="mtop15"></div>

                    <div class="box-heading" runat="server" id="divAddH" visible="false">
                        <h4 class="box-title register-num">Add Examiner
                        </h4>
                    </div>
                    <div class="box-body box-body-open" runat="server" id="divAddD" visible="false">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="txtExaminerCode">
                                    Examiner Code
                                </label>
                                <asp:TextBox ID="txtExaminerCode" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="" for="txtExaminerName">
                                    Examiner Name
                                </label>
                                <asp:TextBox ID="txtExaminerName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSaveExaminer" runat="server" CssClass="btn btn-primary" Text="Save Examiner" OnClick="btnSaveExaminer_Click" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div></div>
                    <div class="mtop15"></div>
                    <div class="box-heading" id="divDetailH" runat="server">
                        <h4 class="box-title register-num">Application List
                        </h4>
                    </div>
                    <div class="box-body box-body-open" id="divDetail" runat="server">
                        <div style="text-align: center; color: red; font-weight: bold; padding: 3px">Note: After submission of Marks, take print out of the submitted marks by clicking on "PRINT ACKNOWLEDGEMENT" button </div>
                        <div class="row text-center" id="LoadingDiv" runat="server">
                            <div>Please Wait While Data Is Being Loaded...</div>
                            <img src="/WebApp/Login/Loading_hourglass_88px.gif" />
                        </div>
                        <div id="DisplayGrid" style="" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">

                                    <asp:GridView ID="DataGridView" runat="server" Width="98%" OnPreRender="DataGridView_PreRender"
                                        AutoGenerateColumns="false" OnRowDataBound="grdView_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sr.No">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("RowID")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Select" Visible="false">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkRollNo" runat="server" onclick="return EnableControls(this);" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Roll No">
                                                <ItemTemplate>
                                                    <asp:Label ID="RollNo" runat="server" Text='<%#Eval("RollNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" Visible="false"/>
                                            <asp:BoundField DataField="ExamType" HeaderText="Exam_Type" Visible="false"/>

                                            <asp:TemplateField HeaderText="Paper Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="PaperCode" runat="server" Text='<%# Bind("PaperCode") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="PaperName" HeaderText="Paper Name" Visible="false"/>
                                            <asp:TemplateField HeaderText="Total Marks">
                                                <ItemTemplate>
                                                    <asp:Label ID="TotalMarks" runat="server" Text='<%# Bind("TotalMarks") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Marks Obtain">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtMarks" runat="server" MaxLength="2" Width="70" Text='<%#Eval("MarksObtained") %>' onkeypress="return isNumberKeyAB(event);" Enabled="false"></asp:TextBox>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtMarks" ErrorMessage="Invalid Entry! Enter:(<= Total Marks or AB or ab)" ClientValidationFunction="CheckMarksEnter"></asp:CustomValidator>
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
                                            <asp:BoundField DataField="ExaminerID" HeaderText="Examiner" />
                                        </Columns>
                                    </asp:GridView>
                                </div>


                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                    <!---------------Remarks Fields----------->
                    <div class="mtop15"></div>
                    <div class="row" id="divButton" runat="server">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save Marks" OnClick="btnSave_Click" />
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit to Verification" CssClass="btn btn-danger" OnClick="btnSubmit_Click" OnClientClick="javascript:return ConfirmSubmit();" />
                                <asp:Button ID="btnPrint" runat="server" Text="Print Acknowledgement" CssClass="btn btn-success" OnClick="btnPrint_Click" />

                            </div>
                        </div>

                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>


    </div>


</asp:Content>
