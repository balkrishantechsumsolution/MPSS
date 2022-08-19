<%@ Page Title="Student Registration Update" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="RegistrationUpdate.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.MarkEntry.RegistrationUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Student Registration Update</title>
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
        $(document).ready(function ()
        {
            var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength'],
                    "lengthMenu": [[10, 50, 100], [10, 50, 100]],
                    "iDisplayLength": 100
                });

            $("div[id$='LoadingDiv']").hide(800);
            $("div[id$='DisplayGrid']").show(800);

        });

        function IsNumericWithSlah(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            var txt = String.fromCharCode(charCode)
            if (txt.match(/^[0-9/\b]+$/)) {
                return true;
            }
            return false;


        }

        function EnableControls(p_RowID)
        {
            var t_Id = "ContentPlaceHolder1_DataGridView_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];
            if (document.getElementById("ContentPlaceHolder1_DataGridView_chkRollNo_" + p_ID).checked)
            {
                document.getElementById("ContentPlaceHolder1_DataGridView_txtRegNo_" + p_ID).disabled = false;            
            }
            else
            {
                document.getElementById("ContentPlaceHolder1_DataGridView_txtRegNo_" + p_ID).disabled = true;
            }

        }

        function IsAbsent(p_RowID)
        {
            var t_Id = "ContentPlaceHolder1_DataGridView_" + p_RowID;
            //CPH_gvDetail_chk_TopUp_0
            var strText = p_RowID.id.split('_');
            var p_ID = strText[3];
            if (document.getElementById("ContentPlaceHolder1_DataGridView_chkIsAbsent_" + p_ID).checked)
            {
                document.getElementById("ContentPlaceHolder1_DataGridView_txtRegNo_" + p_ID).disabled = true;
                document.getElementById("ContentPlaceHolder1_DataGridView_txtRegNo_" + p_ID).value = "0";
            }
            else
            {
                document.getElementById("ContentPlaceHolder1_DataGridView_txtRegNo_" + p_ID).disabled = false;
            }

        }

        function ConfirmSubmit()
        {
            if (confirm("Please Confirm! You want to Send the Marks for Approval to SOEC?"))
            {
                //confirm_value.value = "Yes";
                return true;
            } else
            {
                //confirm_value.value = "No";
                return false;
            }

        }


        function isNumberKeySlash(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            //alert(charCode);
            if ((charCode == 65 || charCode == 66 || charCode == 97 || charCode == 98 ||charCode == 47))
            { return true; }
            else if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;

        }

        function CheckRegEnter(sender, args) {
            debugger;
            //alert(sender, args);
            var ctrlID = sender.id.split('_');
            var i = ctrlID[3];
            var idRegNo = "#ContentPlaceHolder1_DataGridView_txtRegNo_" + i;
            var RegNo = $(idRegNo).text();
            var regx = "^[/0-9]+$";

            var isValid = false;
            var t_Message = "";

            var t_Checked = false;
            //ContentPlaceHolder1_DataGridView_chkRollNo_0
            t_Checked = document.getElementById("ContentPlaceHolder1_DataGridView_chkRollNo_" + i).checked;

            if (!t_Checked) {
                return args.isvalid = true;
            }

            if (args.Value.indexOf('/')!=-1) {
                args.IsValid = true;
                isValid = true;
            }

            if (args.Value.indexOf('/') != -1) {
                var t_Year = args.Value.split('/');

                if (t_Year[0].length != 5) {
                    t_Message = 'Invalid Registration No.(' + args.Value + ')! Enter first 5 digit (sequence No) as 00123/16.';
                    args.IsValid = false;
                    isValid = false;
                }

                if (t_Year[1].length != 2) {
                    t_Message = 'Invalid Registration No. (' + args.Value + ')! Enter Last 2 digit of Admission Year as 12345/16.'
                    args.IsValid = false;
                    isValid = false;
                }
            }
            if (!isValid && (parseInt(args.Value.length) != 8)) {
                //alert('marks cannot be grater then total marks (' + RegNo + ')');
                t_Message = 'Invalid Registration No. (' + args.Value + ')! Total length of University Registration No. should be 8 as 23456/16';
                args.isvalid = false;
                isValid = false;
            }


            if (isValid) {
                return args.isvalid = true;
            }
            else {

                if (t_Message == '') {
                    t_Message = 'Invalid Registration No. (' + args.Value + '), it should be 5 digit followed by / and Admission Year as 54321/16';
                }

                alert(t_Message);
                return args.IsValid = false;
            }

            return isValid;

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
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>REGISTRATION UPDATE</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div class="row" style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Search Filter</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="" for="ddlCollege">College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCollege" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select College." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlBranch">Branch</label>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="ddlBranch" Display="Dynamic"
                                    ErrorMessage="Please select branch." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlSession">Session</label>
                                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="2016" Text="2016"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                    ErrorMessage="Please select SESSION" ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="txtRollNo">Roll No</label>
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
                        <div class="clearfix"></div>
                    </div>
                    <div id="divDetails" runat="server"></div>
                    <div class="mtop15"></div>
                    <div class="box-heading">
                        <h4 class="box-title register-num">Application List</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div style="text-align: center; color: red; font-weight: bold; padding: 3px">Please: Enter valid University Registration No.<br />
                            University Registration No should be : 5 digit number followed by / and last 2 digit of Admission Year.</div>
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
                                            <asp:TemplateField HeaderText="Select">
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
                                            
                                            <asp:BoundField DataField="RegdNo" HeaderText="Univ. Reg. No" />
                                            
                                            <asp:TemplateField HeaderText="Enter Univ. Reg. No.">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtRegNo" runat="server" MaxLength="8" Width="70" Text='<%#Eval("RegNo") %>' onkeypress="return isNumberKeySlash(event);" Enabled="false"></asp:TextBox>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtRegNo" ErrorMessage="Invalid Reg.No! Enter:(5 digit followed by / and last 2 digit of Admission Year)" ClientValidationFunction="CheckRegEnter"></asp:CustomValidator>
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
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary"
                                    Text="Update Reg. No." OnClick="btnSave_Click" />
                                <asp:Button ID="btnSubmit" runat="server" style="display:none" Text="Send for Approval" CssClass="btn btn-success" OnClick="btnSubmit_Click" OnClientClick="javascript:return ConfirmSubmit();" Visible="false" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>