<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="SchoolProfile.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.MPSS.CollegeProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>

    <%--<script src="bootstrap-datetimepicker.min.js"></script>--%>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <%--<link href="bootstrap-datetimepicker.css" rel="stylesheet" />
    <link href="bootstrap-datetimepicker.min.css" rel="stylesheet" />--%>

    <script type="text/javascript">
        $(document).ready(function () {
            //datePicker
            debugger;
            $('#ContentPlaceHolder1_txtIssueDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });
        });


        function ValidateDate(p_Date) {
            debugger;
            var inputText = p_Date;
            if (inputText != null && inputText != '') {
                var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
                // Match the date format through regular expression  
                if (dateformat.test(inputText)) {
                    var DOB = inputText.split('/');
                    var Y = DOB[2];
                    var M = DOB[1];
                    var D = DOB[0];
                    if (M < 10) {
                        if (M.length == 1) {
                            M = '0' + M;
                        }
                        else
                            M = M;
                    }
                    if (D < 10) {
                        if (D.length == 1) {
                            D = '0' + D;
                        }
                        else
                            D = D;
                    }

                    var NewDOB = D + '/' + M + '/' + Y;
                    $('#ContentPlaceHolder1_txtIssueDate').val(NewDOB);

                    return true;
                }
                else {
                    alert("Invalid date format!");
                    //document.form1.text1.focus();
                    $('#ContentPlaceHolder1_txtIssueDate').val('');
                    return false;
                }
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Update School Profile</h2>
            </div>
        </div>
        <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" runat="server" id="divCollege">
                <div class="box-heading">
                    <h4 class="box-title register-num">School Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">School Code</label>
                            <asp:TextBox ID="txtSchoolCode" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">School Name (English)</label>
                            <asp:TextBox ID="txtSchoolE" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtSchoolE" Display="Dynamic"
                                    ErrorMessage="Please enter School name in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">School Name (Hindi)</label>
                            <asp:TextBox ID="txtSchoolH" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSchoolH" Display="Dynamic"
                                    ErrorMessage="Please enter school name in Hindi." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">School Type</label>
                            <asp:DropDownList ID="ddlSchoolType" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select Affilation Type--</asp:ListItem>
                                <asp:ListItem Value="Government">Government</asp:ListItem>
                                <asp:ListItem Value="Private">Private</asp:ListItem>
                                <asp:ListItem Value="Traditional Private">Traditional Private</asp:ListItem>
                            </asp:DropDownList>

                            <div class="col-xs-12 pleft0 ">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlSchoolType" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select School Type." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Affiliation Type</label>
                            <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select Affilation Type--</asp:ListItem>
                                <asp:ListItem Value="N">New</asp:ListItem>
                                <asp:ListItem Value="R">Renew</asp:ListItem>
                            </asp:DropDownList>


                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlType" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select Affiliation Type." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Certificate No.</label>
                            <asp:TextBox ID="txtCertificateNo" CssClass="form-control" runat="server" MaxLength="10" placeholder="Enter Certificate No."></asp:TextBox>

                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCertificateNo" Display="Dynamic"
                                    ErrorMessage="Please Enter Certificate No." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Certificate Issue Date</label>
                            <asp:TextBox ID="txtIssueDate" CssClass="form-control" runat="server" MaxLength="10" placeholder="dd/MM/YYYY" onkeypress="return ValidateAlpha(event);"
                                onkeydown=" return allowBackspace(event);" onchange="CalculateExperiance();"></asp:TextBox>
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtIssueDate" InitialValue="" Display="Dynamic"
                                    ErrorMessage="Please select Certificate Issue Date." ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">School Website URL</label>

                            <asp:TextBox ID="txtURL" CssClass="form-control" runat="server" MaxLength="70" placeholder="Website URL"></asp:TextBox>

                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtURL" Display="Dynamic"
                                    ErrorMessage="Please College Email ID." ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label>School Fax No.</label>
                            <asp:TextBox ID="txtFax" CssClass="form-control" runat="server" MaxLength="15" placeholder="Fax No."></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">District</label>

                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select District--</asp:ListItem>
                            </asp:DropDownList>

                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfvCollege" runat="server" ControlToValidate="ddlDistrict" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select District." ValidationGroup="G" ForeColor="Red" />
                            </div>


                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
                        <div class="form-group">
                            <label>Address</label>
                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" MaxLength="100" placeholder="Full Address"></asp:TextBox>

                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Display="Dynamic"
                                    ErrorMessage="Please College Address" ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Pin No.</label>

                            <asp:TextBox ID="txtPin" CssClass="form-control" runat="server" MaxLength="10" placeholder="Mobile No."></asp:TextBox>

                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPin" Display="Dynamic"
                                    ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container" runat="server" id="divPrincipal">
                <div class="box-heading">
                    <h4 class="box-title register-num">Principal Details
                    </h4>
                </div>
                <div class="box-body box-body-open fls">

                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Principal Name</label>
                            <asp:TextBox ID="txtPrincipal" CssClass="form-control" runat="server" MaxLength="70" placeholder="Principal Name"></asp:TextBox>

                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrincipal" Display="Dynamic"
                                    ErrorMessage="Please enter Principal Name" ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Mobile No.</label>
                            <div class="col-xs-12 pleft0">
                                <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" MaxLength="10" placeholder="Mobile No."></asp:TextBox>
                            </div>
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic"
                                    ErrorMessage="Please enter College Contact No." ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Email ID</label>
                            <div class="col-xs-12 pleft0">
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" MaxLength="70" placeholder="School Email ID"></asp:TextBox>
                            </div>
                            <div class="col-xs-12 pleft0 p5">
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                                    ErrorMessage="Please College Email ID." ValidationGroup="G" ForeColor="Red" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container" runat="server" id="div1">
                <div class="box-heading">
                    <h4 class="box-title register-num">Other Details
                    </h4>
                </div>
                <div class="box-body box-body-open fls">

                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Paid Affiliation Details</label>
                            <asp:DropDownList ID="ddlPaidAffiliation" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select Paid Affiliation Details--</asp:ListItem>
                                <asp:ListItem Value="1">LKG</asp:ListItem>
                                <asp:ListItem Value="2">UKG</asp:ListItem>
                                <asp:ListItem Value="3">Class 1 to 4</asp:ListItem>
                                <asp:ListItem Value="4">Entrance</asp:ListItem>
                                <asp:ListItem Value="5">First</asp:ListItem>
                                <asp:ListItem Value="6">Intermediate First Section</asp:ListItem>
                                <asp:ListItem Value="7">Intermediate Final Section</asp:ListItem>
                                <asp:ListItem Value="8">Madhyamik First Section</asp:ListItem>
                                <asp:ListItem Value="9">Madhyamik Final Section</asp:ListItem>


                            </asp:DropDownList>

                            <div class="col-xs-12 pleft0 ">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlPaidAffiliation" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select Paid Affiliation Details." ValidationGroup="G" ForeColor="Red" />

                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Education Medium</label>
                            <asp:DropDownList ID="ddlMedium" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select Medium Type--</asp:ListItem>
                                <asp:ListItem Value="Sanskrit">Sanskrit</asp:ListItem>
                                <asp:ListItem Value="Hindi">Hindi</asp:ListItem>

                            </asp:DropDownList>

                            <div class="col-xs-12 pleft0 ">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlMedium" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select Medium." ValidationGroup="G" ForeColor="Red" />

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container" runat="server" id="div2">
                <div class="box-heading">
                    <h4 class="box-title register-num">Number of Students
                    </h4>
                </div>
                <div class="box-body box-body-open fls">

                   <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">LKG</label>
                            <asp:TextBox ID="txtLKG" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                       <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">UKG</label>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                       <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Class 1 to 4</label>
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                       <div class="clearfix"></div>
                       <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Entrance</label>
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                       <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">First</label>
                            <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                       <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Intermediate First Section</label>
                            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                       <div class="clearfix"></div>
                       <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Intermediate Final Section</label>
                            <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                       <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Madhyamik First Section</label>
                            <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                       <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Madhyamik Final Section</label>
                            <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>

                            <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtLKG" Display="Dynamic"
                                    ErrorMessage="Please enter LKG in English" ValidationGroup="G" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <%---Start of Button----%>
            <div class="col-md-12 box-container" runat="server" id="divBtn">
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
            <%---End of Button----%>
        </div>
    </div>
    <%--<link href="../../Common/Styles/style.admin.css" rel="stylesheet" />
    <link href="../../../g2c/css/style.admin.css" rel="stylesheet" />--%>
</asp:Content>
