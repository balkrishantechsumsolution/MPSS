<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="TeacherDetails.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CBCS.TeacherDetails" %>

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
    <script src="TeacherDetails.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <%--<script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>--%>


    <script type="text/javascript">        

       

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
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>College Teachers Profile</h2>
                </div>
            </div>
            <div class="row" runat="server" id="divSearch">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Teachers Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-md-12 box-container">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">College Name</label>
                                    <div class="col-xs-12 pleft0 pright0">
                                        <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCollege" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select College" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>

                            <%--<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label class="">Search Text</label>
                                    <div class="col-xs-12 pleft0 pright0">
                                        <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server" placeholder="Search Text" ToolTip=""></asp:TextBox>
                                    </div>
                                    <div class="col-xs-12 pleft0 p5">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlSubject" InitialValue="0" Display="Dynamic"
                                            ErrorMessage="Please select Subject" ValidationGroup="E" ForeColor="Red" />
                                    </div>
                                </div>
                            </div>--%>


                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 text-right">
                                <div class="form-group">
                                    <label>
                                        &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-primary"
                                            Text="Teachers List" OnClick="btnSearch_Click" />
                                    &nbsp;
                                    <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CssClass="btn btn-success"
                                        Text="Add Teacher" OnClick="btnAdd_Click" />
                                    &nbsp;
                                    <asp:Button ID="btnEdit" runat="server" CausesValidation="true" CssClass="btn btn-danger"
                                        Text="Edit Record" ValidationGroup="E" OnClick="btnEdit_Click" />
                                    &nbsp;
                                    <asp:Button ID="btnRemove" runat="server" CausesValidation="true" CssClass="btn btn-default" Visible="false"
                                        Text="Remove" ValidationGroup="G" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;" id="divGrid" runat="server">
                                <asp:GridView ID="grdView" runat="server" Width="100%" OnRowDataBound="grdView_RowDataBound" OnPreRender="grdView_PreRender" OnSelectedIndexChanged="grdView_SelectedIndexChanged" AutoGenerateSelectButton="True"></asp:GridView>
                            </div>


                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row" runat="server" id="divTeacher">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Add / Edit / Remove Teachers Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">


                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Subject</label>
                                <div class="col-xs-12 pleft0 pright0">
                                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select Subject--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlSubject" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Subject" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Teacher's Designation</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select Subject--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlDesignation" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please enter Designation of the Teacher" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Teacher's Name</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtTeacher" CssClass="form-control" runat="server" placeholder="Teacher's Name"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTeacher" Display="Dynamic"
                                        ErrorMessage="Please enter Name of the Teacher" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="">Univ. Reg. No. as College Teacher</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtRedgNo" CssClass="form-control" runat="server" MaxLength="10" placeholder="Univ. Regd. No." ToolTip="University Registration No. as College Teacher"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="DOJ">
                                    Date of Joining in the Service <span style="font-size: 11px;"></span>
                                </label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="DOJ" CssClass="form-control" runat="server" MaxLength="10" placeholder="dd/MM/YYYY" onkeypress="return ValidateAlpha(event);"
                                        onkeydown=" return allowBackspace(event);" onchange="CalculateExperiance();"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DOJ" Display="Dynamic"
                                        ErrorMessage="Please select Service Joining Date" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="" id="lbldate" runat="server" for="DOJ">                                    
                                </label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtExperiance" CssClass="form-control" runat="server" disabled="disabled"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Specialization</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtSpecilization" CssClass="form-control" runat="server" placeholder="Teacher's Specilization"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSpecilization" Display="Dynamic"
                                        ErrorMessage="Please enter Specialization of the Teacher" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Mobile No.</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" MaxLength="10" placeholder="Mobile No."></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic"
                                        ErrorMessage="Please enter Teacher's Mobile No" ValidationGroup="G" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobile" ValidationGroup="G" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid Mobile No" ValidationExpression="\d{10}" EnableTheming="True" ></asp:RegularExpressionValidator>
                                </div>

                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Email ID</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" MaxLength="70" placeholder="Email ID"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                                        ErrorMessage="Please enter Email ID." ValidationGroup="G" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ValidationGroup="G" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                                </div>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label>Phone No.</label>
                                <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" MaxLength="15" placeholder="Phone No."></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3" id="divStatus" runat="server">
                            <div class="form-group">
                                <label for="ddlStatus">
                                    Teacher Status
                                </label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                                    <asp:ListItem Value="">--Select Status--</asp:ListItem>
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="0">InActive</asp:ListItem>

                                </asp:DropDownList>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlStatus" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Status." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory">Address</label>
                                <div class="col-xs-12 pleft0 pright0">
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" MaxLength="100" placeholder="Full Address"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Display="Dynamic"
                                        ErrorMessage="Please Enter Address of the teacher" ValidationGroup="G" ForeColor="Red" />
                                </div>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">District</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="ddlDistrict" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select District." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label for="ddlTaluka">
                                    Block/Taluka
                                </label>
                                <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                </asp:DropDownList>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvBlock" runat="server" ControlToValidate="ddlBlock" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Block." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory text-nowrap" for="ddlVillage">
                                    Panchayat/Village/City
                                </label>
                                <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                </asp:DropDownList>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvVillage" runat="server" ControlToValidate="ddlVillage" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Village/City." ValidationGroup="G" ForeColor="Red" />
                                </div>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="txtPin">
                                    Pin Code
                                </label>
                                <asp:TextBox ID="txtPin" CssClass="form-control" runat="server" MaxLength="6" placeholder="Pin No."></asp:TextBox>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvPin" runat="server" ControlToValidate="txtPin" Display="Dynamic"
                                        ErrorMessage="Please select Pin Code." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Remark</label>
                                <div class="col-xs-12 pleft0 pright0">
                                    <asp:TextBox ID="txtRemark" CssClass="form-control" runat="server" MaxLength="300" placeholder="Remark if any"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                </div>

                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>


            <%---Start of Button----%>
            <div class="row" runat="server" id="divBtn">
                <div class="col-md-12 box-container">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip=" Proceed to Payment"
                            CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="G" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                            CssClass="btn btn-danger" PostBackUrl=""
                            Text="Cancel" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <%---End of Button----%>
        </div>
    </div>

    <asp:HiddenField ID="hdnProfileID" runat="server" />
    <asp:HiddenField ID="hdnTeacherID" runat="server" />
    <asp:HiddenField ID="hdnExperience" runat="server" />
    <asp:HiddenField ID="hdnFlag" runat="server" />

</asp:Content>
