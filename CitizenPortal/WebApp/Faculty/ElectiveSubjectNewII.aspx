<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="ElectiveSubjectNewII.aspx.cs"
    Inherits="CitizenPortal.WebApp.Faculty.ElectiveSubjectNewII" %>

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

                    strText = "";
                    p_ID = "";
                });
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
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Elective Subject</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div class="row" style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Subject Change Detail
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
                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ControlToValidate="ddlCourse" Display="Dynamic"
                                    ErrorMessage="Please select Course" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlProgram">
                                    Program
                                </label>
                                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="0">Select Program</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" InitialValue="0" ControlToValidate="ddlProgram" Display="Dynamic"
                                    ErrorMessage="Please select Program" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlExamType">
                                    Exam Type
                                </label>
                                <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control" >
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="Regular" Text="Regular" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="Backlog" Text="Backlog"></asp:ListItem>
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
                                    <asp:ListItem Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Apr-May 2022" Text="Apr-May 2022"></asp:ListItem>
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
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic" Style="white-space: nowrap"
                                    ErrorMessage="Please select Semester" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 text-right">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-success"
                                        Text="Search" OnClick="btnSearch_Click" ValidationGroup="G" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                            <div class="form-group">
                                <label class="" for="txtRollNo">
                                    Roll No
                                </label>
                                <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>

                    </div>

                    <%---Start of Elective Subject----%>
                    <div class="row">
                        <div class="col-md-12 box-container">

                            <div id="divSubject" class="row" runat="server">
                                <div class="col-md-12 box-container mtop20">
                                    <div class="box-heading">
                                        <h4 class="box-title register-num">Subject Change Detail
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">

                                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">Elective Type</label>
                                                <div class="col-xs-12 pleft0 pright0">
                                                    <asp:DropDownList ID="ddlElective" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select Elective--</asp:ListItem>
                                                        <asp:ListItem Value="ES01">1st Elective Subject</asp:ListItem>
                                                        <asp:ListItem Value="ES02">2nd Elective Subject</asp:ListItem>
                                                        <asp:ListItem Value="ES03">3rd Elective Subject</asp:ListItem>
                                                        <asp:ListItem Value="ES04">4th Elective Subject</asp:ListItem>
                                                        <asp:ListItem Value="ES05">5th Elective Subject</asp:ListItem>
                                                        <asp:ListItem Value="ES06">6th Elective Subject</asp:ListItem>
                                                        
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlElective" InitialValue="0" Display="Dynamic"
                                                        ErrorMessage="Please select Subject" ValidationGroup="S" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">Elective Subject</label>
                                                <div class="col-xs-12 pleft0 pright0">
                                                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select Subject--</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlSubject" InitialValue="0" Display="Dynamic"
                                                        ErrorMessage="Please select Subject" ValidationGroup="S" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                                                               
                                    <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%---End of Elective Subject----%>

                    <div id="divDetails" runat="server"></div>
                    <div class="mtop15"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">Student Detail
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div style="text-align: center; color: red; padding: 3px; display: none">Note: After submission of Marks, take print out of the submitted marks by clicking on "PRINT SUNMITTED MARK" button </div>
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

                                            <asp:TemplateField HeaderText="Enrol. No">
                                                <ItemTemplate>
                                                    <asp:Label ID="EnrollmentNo" runat="server" Text='<%#Eval("EnrollmentNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Roll No">
                                                <ItemTemplate>
                                                    <asp:Label ID="RollNo" runat="server" Text='<%#Eval("RollNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" />
                                            <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                                            <asp:TemplateField HeaderText="CourseCode" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="CourseCode" runat="server" Text='<%# Bind("CourseCode") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ProgramName" HeaderText="Program Name" />
                                            <asp:TemplateField HeaderText="ProgramCode" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ProgramCode" runat="server" Text='<%# Bind("ProgramCode") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Semester">
                                                <ItemTemplate>
                                                    <asp:Label ID="Semester" runat="server" Text='<%# Bind("Semester") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Subject Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="SubjectCode" runat="server" Text='<%# Bind("SubjectCode") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ElectiveSubject" HeaderText="Elective Subject" />--%>
                                            <asp:BoundField DataField="1" HeaderText="Elective Subject-I" />
                                            <asp:BoundField DataField="2" HeaderText="Elective Subject-II" />
                                            <asp:BoundField DataField="3" HeaderText="Elective Subject-III" />
                                            <asp:BoundField DataField="4" HeaderText="Elective Subject-IV" />

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
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Update Elective" OnClick="btnSave_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_Cancel" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" PostBackUrl="" Text="Cancel" />

                            </div>
                        </div>

                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>


    </div>


</asp:Content>
