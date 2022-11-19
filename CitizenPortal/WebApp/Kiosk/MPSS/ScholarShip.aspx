<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/MPSSMaster.Master" AutoEventWireup="true" CodeBehind="ScholarShip.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.ScholarShip" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

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
    <script src="../../Scripts/ServiceLanguage.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            //datePicker

            $('#ContentPlaceHolder1_txtBirthdate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });
            $('#ContentPlaceHolder1_txtDateAdmisCurrSch').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });
            $('#ContentPlaceHolder1_txtDateAdmisCurrClass').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });
        });
        function ValidateMobile() {
            var opt = "";
            var text = "";


            var txtMobieNoParent = $('#ContentPlaceHolder1_txtMobieNoParent').val();
            if (txtMobieNoParent == null || txtMobieNoParent == "") {
                //text += "<br />" + " \u002A" + " Please Enter Mobile No.";
                text += "<br /> -Please Enter Mobile No. ";
                $('#ContentPlaceHolder1_txtMobieNoParent').attr('style', 'border:1px solid #d03100 !important;');
                $('#ContentPlaceHolder1_txtMobieNoParent').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else if (txtMobieNoParent != null) {
                $('#ContentPlaceHolder1_txtMobieNoParent').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtMobieNoParent').css({ "background-color": "#ffffff" });

                if (txtMobieNoParent != '' || txtMobieNoParent != null) {
                    var mobmatch1 = /^[6789]\d{9}$/;
                    if (!mobmatch1.test(txtMobieNoParent)) {
                        text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
                        $("#ContentPlaceHolder1_txtMobieNoParent").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ContentPlaceHolder1_txtMobieNoParent").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                }
            }
            if (opt == "1") {
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }

        function ValidateDate(p_Date) {

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


        function CheckIFSC() {
            debugger;
            var opt = "";
            var text = "";
            text = "";

           

            var txtIFSC = $('#ContentPlaceHolder1_txtBankIFSCCode');
            var reg = /[A-Z|a-z]{4}[0][a-zA-Z0-9]{6}$/;

            if (txtIFSC.val() != '') {
                if (txtIFSC.val().match(reg)) {
                    txtIFSC.attr('style', '1px solid #cdcdcd !important;');
                    txtIFSC.css({ "background-color": "#ffffff" });
                }
                else {
                    
                    text += "\n -IFSC code should be count 11.";
                    text += "\n -Starting 4 should be only alphabets[A-Z].";
                    text += "\n -Remaining 7 should be accepting only alphanumeric.";
                    $('#ContentPlaceHolder1_txtBankIFSCCode').val('');
                    txtIFSC.attr('style', 'border:1px solid #d03100 !important;');
                    txtIFSC.css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
            }

         

            if (opt == "1") {
                alert(text);
                //document.form1.text1.focus();
                $('#ContentPlaceHolder1_txtBankIFSCCode').val('');
                return false;
            }
            return true;
        }
        function Validate() {
            var txtBankAccNo = $('#ContentPlaceHolder1_txtBankAccNo');
            var txtConfirmBankAccNo = $('#ContentPlaceHolder1_txtConfirmBankAccNo');

            if (txtBankAccNo.val() != txtConfirmBankAccNo.val()) {
                $("#ContentPlaceHolder1_txtBankAccNo").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtBankAccNo").css({ "background-color": "#fff2ee" });
                $("#ContentPlaceHolder1_txtConfirmBankAccNo").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtConfirmBankAccNo").css({ "background-color": "#fff2ee" });
                alert("Bank Account Number do not match.");
                return false;
            }
            else {

                $('#ContentPlaceHolder1_txtBankAccNo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtBankAccNo').css({ "background-color": "#ffffff" });

                $('#ContentPlaceHolder1_txtConfirmBankAccNo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtConfirmBankAccNo').css({ "background-color": "#ffffff" });
            }
            return true;
        }

    </script>
    <style>
        #ContentPlaceHolder1_ddlStudenID_ddlStudenID_TextBox {
            background-color: #ADD8E6;
            border: solid 1px Blue;
            border-right: 0px none;
            width: 100% !important;
            height: 33px !important;
        }

        .ContentPlaceHolder1_ddlStudenID_ddlStudenID_Button {
            background-color: #ADD8E6;
            border: solid 1px Blue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p0" id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <%-- <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>ScholarShip Form</h2>
            </div>
        </div>--%>


            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-md-12 box-container" runat="server" id="div5">

                        <div class="box-heading form_hd">
                            <div class="box-heading form_hd">
                                <h2>{{resourcesData.lblScName}}</h2>

                            </div>
                        </div>

                    </div>
                    <div class="col-lg-12">
                        <div class="alert alert-success">
                            <p><b>{{resourcesData.lblInstruction}}</b></p>

                        </div>
                    </div>
                </div>



            

                    <div class="box-body box-body-open">


                        <div id="smartwizard">
                            <ul>
                                <li><a href="#step-1">Step 1<br />
                                    <small id="lblsearch">{{resourcesData.lblScStDtls}}</small></a></li>
                                <li><a href="#step-2">Step 2<br />
                                    <small>{{resourcesData.lblScStInform}}</small></a></li>
                                <li><a href="#step-3">Step 3<br />
                                    <small>{{resourcesData.lblScStInformation}}</small></a></li>
                                <li><a href="#step-4">Step 4<br />
                                    <small>{{resourcesData.lblScStBankInfo}}</small></a></li>

                            </ul>
                            <div class="mt-4">
                                <div id="step-1">
                                    <div class="row">
                                        <fieldset id="divStudentInnfo" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblScStDtls}}</legend>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStID}}</label>
                                                <%--<asp:DropDownList ID="ddlStudenID" runat="server" CssClass="form-control">
                            </asp:DropDownList>--%>
                                                <triggers>




                                                    <ajaxToolkit:ComboBox ID="ddlStudenID" runat="server"
                                                        AutoPostBack="true"
                                                        DropDownStyle="DropDownList"
                                                        AutoCompleteMode="SuggestAppend"
                                                        CaseSensitive="False"
                                                        CssClass=""
                                                        ItemInsertLocation="Append" OnSelectedIndexChanged="ddlStudenID_SelectedIndexChanged" />

                                                    <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlStudenID" Display="Dynamic"
                                    ErrorMessage="Please enter Student ID" ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStName}}</label>
                                                <asp:TextBox ID="txtStudentName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtStudentName" Display="Dynamic"
                                                        ErrorMessage="Please enter Student name in English" ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>



                                        <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblStGender}}</label>
                                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="M">Male</asp:ListItem>
                                                    <asp:ListItem Value="F">Female</asp:ListItem>
                                                </asp:DropDownList>


                                                <div class="col-xs-12 pleft0 p5">
                                                    <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlGender" InitialValue="0" Display="Dynamic"
                                                        ErrorMessage="Please select Gender." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblStDOB}}</label>
                                                <asp:TextBox ID="txtBirthdate" CssClass="form-control" runat="server" MaxLength="10" placeholder="dd/MM/YYYY" onkeypress="return ValidateAlpha(event);"
                                                    onkeydown=" return allowBackspace(event);" onchange="CalculateExperiance();">
                                                </asp:TextBox>
                                                <div class="col-xs-12 pleft0 p5">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBirthdate" InitialValue="" Display="Dynamic"
                                                        ErrorMessage="Please select Birth Date." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStClass}}</label>
                                                <asp:TextBox ID="txtClass" CssClass="form-control" runat="server" MaxLength="10" placeholder="Enter Class"></asp:TextBox>

                                                <div class="col-xs-12 pleft0 p5">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClass" Display="Dynamic"
                                                        ErrorMessage="Please Enter Class" ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>


                                        <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStSection}} </label>

                                                <asp:TextBox ID="txtSection" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Section"></asp:TextBox>

                                                <div class="col-xs-12 pleft0 p5">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSection" Display="Dynamic"
                                                        ErrorMessage="Please College Section." ValidationGroup="G" ForeColor="Red" />
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStSchool}}</label>
                                                <asp:TextBox ID="txtSchool" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School"></asp:TextBox>
                                                <div class="col-xs-12 pleft0 p5">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSchool" Display="Dynamic"
                                                        ErrorMessage="Please Enter School." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStSubject}}</label>
                                                <asp:TextBox ID="txtSubject" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Subject"></asp:TextBox>
                                                <div class="col-xs-12 pleft0 p5">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSubject" Display="Dynamic"
                                                        ErrorMessage="Please Enter Subject." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStFather}}</label>
                                                <asp:TextBox ID="txtFatherName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtFatherName" Display="Dynamic"
                                                        ErrorMessage="Please enter Father's Name." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStFatherOcc}}</label>
                                                <asp:TextBox ID="txtFatherOcc" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtFatherOcc" Display="Dynamic"
                                                        ErrorMessage="Please enter Father's Occupation." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                            <label>
                                                {{resourcesData.lblScStFatherDead}}
                                        
                                            </label>

                                            <asp:CheckBox ID="IsFatherDead" runat="server" />

                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStMother}}</label>
                                                <asp:TextBox ID="txtMotherName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtMotherName" Display="Dynamic"
                                                        ErrorMessage="Please enter Mother's Name." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStMotherOcc}}</label>
                                                <asp:TextBox ID="txtMotherOcc" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtMotherOcc" Display="Dynamic"
                                    ErrorMessage="Please enter Mother's Occupation." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                            </fieldset>
                                        <div class="clearfix"></div>
                                    </div>
                                    <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>
                                </div>
                                
                                <div id="step-2">
                                    <fieldset id="divStudentIfo" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblScStInform}}</legend>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStFIncome}}</label>
                                                <asp:TextBox ID="txtFamiyIncome" CssClass="form-control" runat="server" MaxLength="8" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFamiyIncome" Display="Dynamic"
                                                        ErrorMessage="Please enter Family Income." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStCaste}}</label>
                                                <asp:TextBox ID="txtCaste" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCaste" Display="Dynamic"
                                                        ErrorMessage="Please enter Cast." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStSubCaste}}</label>
                                                <asp:TextBox ID="txtSubCaste" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtSubCaste" Display="Dynamic"
                                    ErrorMessage="Please enter Sub Cast." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStDigitalCasteNo}}</label>
                                                <asp:TextBox ID="txtDigitalCasteNo" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--   <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDigitalCasteNo" Display="Dynamic"
                                    ErrorMessage="Please enter Digital Caste Cetrtificate Number." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStReligion}}</label>
                                                <asp:DropDownList ID="ddlReligion" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">Hindu</asp:ListItem>
                                                    <asp:ListItem Value="2">Muslim</asp:ListItem>
                                                    <asp:ListItem Value="3">Sikh</asp:ListItem>
                                                    <asp:ListItem Value="4">Christian</asp:ListItem>
                                                    <asp:ListItem Value="999 Private">Traditional Private</asp:ListItem>
                                                </asp:DropDownList>


                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlReligion" Display="Dynamic"
                                                        ErrorMessage="Please enter Regilion." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStNative}}</label>
                                                <asp:CheckBox ID="IsMPOrigin" runat="server" />
                                            </div>
                                        </div>


                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStExamBoardName}}</label>
                                                <asp:TextBox ID="txtExamBoardName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStMonthlyFee}}</label>
                                                <asp:TextBox ID="txtMonthlyFee" CssClass="form-control" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                                <%--   <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtMonthlyFee" Display="Dynamic"
                                    ErrorMessage="Please enter MonthlyFee." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>




                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStDateAdmisCurrSch}}</label>
                                                <asp:TextBox ID="txtDateAdmisCurrSch" CssClass="form-control" runat="server"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtDateAdmisCurrSch" Display="Dynamic"
                                                        ErrorMessage="Please enter Date of admission in current school." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStDateAdmisCurrClass}}</label>
                                                <asp:TextBox ID="txtDateAdmisCurrClass" CssClass="form-control" runat="server"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtDateAdmisCurrClass" Display="Dynamic"
                                                        ErrorMessage="Please enter Date of Admission to class (DD/MM/YYYY)." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>



                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStNoOfSibling}}</label>
                                                <asp:TextBox ID="txtNoOfSibling" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtNoOfSibling" Display="Dynamic"
                                                        ErrorMessage="Please enter How many brothers/sisters." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStAdmissionNo}}</label>
                                                <asp:TextBox ID="txtAdmissionNo" CssClass="form-control" runat="server"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtAdmissionNo" Display="Dynamic"
                                                        ErrorMessage="Please enter Student's School admission number." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStCurrentCls}}</label>
                                                <asp:TextBox ID="txtCurrentCls" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtCurrentCls" Display="Dynamic"
                                    ErrorMessage="Please enter Current Class." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLastCls}}</label>
                                                <asp:TextBox ID="txtLastCls" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtLastCls" Display="Dynamic"
                                    ErrorMessage="Please enter Last year's class." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStPreAttDays}}</label>
                                                <asp:TextBox ID="txtPreAttDays" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtPreAttDays" Display="Dynamic"
                                    ErrorMessage="Please enter Student's attendance day in the previous year." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStMediums}}</label>
                                                <asp:TextBox ID="txtMediums" CssClass="form-control" runat="server"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtMediums" Display="Dynamic"
                                                        ErrorMessage="Please enter Student's medium of instruction." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStDisability}}</label>
                                                <asp:TextBox ID="txtDisability" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtDisability" Display="Dynamic"
                                    ErrorMessage="Please enter Type of disability." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStEquipDisability}}</label>
                                                <asp:TextBox ID="txtEquipDisability" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtEquipDisability" Display="Dynamic"
                                    ErrorMessage="Please enter Equipment given to students with disabilities." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStFreeUniform}}</label>
                                                <asp:TextBox ID="txtFreeUniform" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtFreeUniform" Display="Dynamic"
                                    ErrorMessage="Please enter FreeUniform." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>


                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStYrLastExam}}</label>
                                                <asp:TextBox ID="txtYrLastExam" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="txtYrLastExam" Display="Dynamic"
                                    ErrorMessage="Please enter Year of last class exam." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLastAnnualResult}}</label>
                                                <asp:TextBox ID="txtLastAnnualResult" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtLastAnnualResult" Display="Dynamic"
                                    ErrorMessage="Please enter last annual result." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStPassPercentage}}</label>
                                                <asp:TextBox ID="txtPassPercentage" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtPassPercentage" Display="Dynamic"
                                    ErrorMessage="Please enter Pass Percentage." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLastClsInt}}</label>
                                                <asp:TextBox ID="txtLastClsInt" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="txtLastClsInt" Display="Dynamic"
                                    ErrorMessage="Please enter Name of last class institution." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStStudentStatus}}</label>
                                                <asp:TextBox ID="txtStudentStatus" CssClass="form-control" runat="server"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="txtStudentStatus" Display="Dynamic"
                                                        ErrorMessage="Please enter StudentStatus." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStCodeFacultySt}}</label>
                                                <asp:TextBox ID="txtCodeFacultySt" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="txtCodeFacultySt" Display="Dynamic"
                                    ErrorMessage="Please enter >Code of Faculty/Stream." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>


                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStCodeTradeVocationalPrg}}</label>
                                                <asp:TextBox ID="txtCodeTradeVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="txtCodeTradeVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter Code of trade taken by the student in vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStTypeJobRoleVocationalPrg}}</label>
                                                <asp:TextBox ID="txtTypeJobRoleVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" ControlToValidate="txtTypeJobRoleVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter What type of job roles are expected in vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLvlNSFQ}}</label>
                                                <asp:TextBox ID="txtLvlNSFQ" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="txtLvlNSFQ" Display="Dynamic"
                                    ErrorMessage="Please enter >Which level of NSFQ has been completed by the student?." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStObjVocationalPrg}}</label>
                                                <asp:TextBox ID="txtObjVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtObjVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter Objectives of student to take vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStJobStaus}}</label>
                                                <asp:TextBox ID="txtJobStaus" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtJobStaus" Display="Dynamic"
                                    ErrorMessage="Please enter Job / Placement Status." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStJobSalary}}</label>
                                                <asp:TextBox ID="txtJobSalary" CssClass="form-control" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtJobSalary" Display="Dynamic"
                                    ErrorMessage="Please enter JobSalary." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStMobieNoParent}}</label>
                                                <asp:TextBox ID="txtMobieNoParent" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidateMobile();" MaxLength="10"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtMobieNoParent" Display="Dynamic"
                                                        ErrorMessage="Please enter MobieNo Parent." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLadliLaxmiNo}}</label>
                                                <asp:TextBox ID="txtLadliLaxmiNo" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtLadliLaxmiNo" Display="Dynamic"
                                    ErrorMessage="Please enter Ladli Laxmi No." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <div class="clearfix"></div>
                                    <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>
                                </div>
                                <div id="step-3">
                                    <fieldset id="divStudentOther" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblScStInformation}}</legend>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStParentIcomeTaxPayer}}</label>
                                                <asp:CheckBox ID="IsParentIcomeTaxPayer" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsAnyHaveScholarShip}}</label>
                                                <asp:CheckBox ID="IsAnyHaveScholarShip" runat="server" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsHosteller}}</label>
                                                <asp:CheckBox ID="IsHosteller" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsFamilyBPL}}</label>
                                                <asp:CheckBox ID="IsFamilyBPL" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsDisadvantagedgroup}}</label>
                                                <asp:CheckBox ID="IsDisadvantagedgroup" runat="server" />
                                            </div>
                                        </div>


                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsRTE}}</label>
                                                <asp:CheckBox ID="IsRTE" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsClsFirstEnrollStatus}}</label>
                                                <asp:CheckBox ID="IsClsFirstEnrollStatus" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsDGSCaste}}</label>
                                                <asp:CheckBox ID="IsDGSCaste" runat="server" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsFreeTextbooks}}</label>
                                                <asp:CheckBox ID="IsFreeTextbooks" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsFreeTransport}}</label>
                                                <asp:CheckBox ID="IsFreeTransport" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScSIsFreeEscortDis}}</label>


                                                <asp:CheckBox ID="IsFreeEscortDis" runat="server" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStFreeBicycle}}</label>
                                                <asp:CheckBox ID="FreeBicycle" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsResidingHostel}}</label>
                                                <asp:CheckBox ID="IsResidingHostel" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsRecSpecialTraining}}</label>
                                                <asp:CheckBox ID="IsRecSpecialTraining" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIshomeless}}</label>
                                                <asp:CheckBox ID="Ishomeless" runat="server" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStIsRegVocationalPrg}}</label>
                                                <asp:CheckBox ID="IsRegVocationalPrg" runat="server" />
                                            </div>
                                        </div>

                                    </fieldset>
                                    <%--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>

                                    <div class="clearfix"></div>
                                </div>
                                <div id="step-4">

                                    <legend>&nbsp {{resourcesData.lblScStBankInfo}}</legend>
                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStBankAccount}}</label>
                                            <asp:TextBox ID="txtBankAccNo" CssClass="form-control" runat="server" maxlength="20" onkeydown="return AllowOnlyNumeric(event);"  placeholder="Bank Account No"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtBankAccNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStCBankAccount}}</label>
                                            <%--<label >Weight of Child(kg)</label>--%>
                                            <asp:TextBox ID="txtConfirmBankAccNo" CssClass="form-control" runat="server"  placeholder="Confirm Bank Account No."  maxlength="20" onkeydown="return AllowOnlyNumeric(event);" onchange="Validate();"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtConfirmBankAccNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStCBankIFSC}}</label>
                                            <%--<label >Weight of Child(kg)</label>--%>
                                            <asp:TextBox ID="txtBankIFSCCode" CssClass="form-control" runat="server" MaxLength="11" placeholder="Bank IFSC Code" onchange="CheckIFSC();"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtBankIFSCCode" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank IFSC Code." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <%---Start of Button----%>
                                   
                                        <div class="box-body box-body-open" style="text-align: center;">
                                            <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip=" Proceed to Payment"
                                                CssClass="btn btn-success" Text="Submit" ValidationGroup="G" OnClick="btnSubmit_Click" />
                                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                                CssClass="btn btn-danger" PostBackSection=""
                                                Text="Cancel" />
                                        </div>
                                 

                                    <asp:ValidationSummary runat="server" ID="ValidationSummary1"
                                        DisplayMode="BulletList"
                                        ShowMessageBox="False" ValidationGroup="G" ShowSummary="True" CssClass="alert alert-danger" />





                                </div>
                            </div>
                        </div>


                    </div>
              
            </div>
        </div>
    </div>


    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
    <link href="/WebApp/Styles/smart_wizard.min.css" rel="stylesheet" />
    <link href="/WebApp/Styles//smart_wizard_theme_arrows.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts//jquery.smartWizard.min.js" type="text/javascript"></script>

    <script>
        $(document).ready(function () {

            $('#smartwizard').smartWizard({
                selected: 0,
                theme: 'arrows',
                autoAdjustHeight: true,
                transitionEffect: 'fade',
                showStepURLhash: false

            });
            //$('#smartwizard').append("<button class='btn btn-info'>Save Draft</button>")

        });


    </script>
    <style>
        .sw-theme-arrows .step-content {
            padding: 20px 13px 8px;
            border: 0 solid #d4d4d4;
            background-color: #fbfbfb;
            text-align: left;
        }

            .sw-theme-arrows .step-content .input-group {
                display: block;
            }

            .sw-theme-arrows .step-content .input-group-addon {
                height: auto;
            }

        .sw-theme-arrows > ul.step-anchor > li > a small, .sw-theme-arrows > ul.step-anchor > li > a small {
            font-size: 17px;
        }

        .sw-theme-arrows > ul.step-anchor > li > a, .sw-theme-arrows > ul.step-anchor > li > a {
            padding: 5px 0 5px 45px;
        }

            .sw-theme-arrows > ul.step-anchor > li > a:hover, .sw-theme-arrows > ul.step-anchor > li > a:hover {
                padding: 5px 0 5px 45px;
            }

        .sw-theme-arrows > ul.step-anchor {
            display: flex;
            width: 100%;
            -ms-flex-direction: row;
            flex-direction: row;
        }

        .nav-tabs > li {
            /* float: left; */
            margin-bottom: -1px;
            flex: auto;
        }

        .sw-theme-arrows #step-4.step-content .input-group-addon {
            height: auto;
        }

        .sw-theme-arrows #step-5.step-content .input-group-addon {
            height: 50px;
        }

        .sw-toolbar-bottom .btn-group.mr-2.sw-btn-group {
            float: none;
            display: block;
        }

        .sw-toolbar-bottom button.btn.btn-secondary.sw-btn-next {
            float: right;
            background: #ff7124;
            color: #fff;
            font-size: 15px;
            border-top-left-radius: 4px !important;
            border-bottom-left-radius: 4px !important;
        }

        .sw-toolbar-bottom button.btn.btn-secondary.sw-btn-prev {
            background: #682e2e;
            color: #fff;
            font-size: 15px;
            border-radius: 4px !important;
        }

        .sw-theme-arrows > ul.step-anchor > li.active > a {
            border-color: #37495f !important;
            color: #fff !important;
            background: #37495f !important;
        }

            .sw-theme-arrows > ul.step-anchor > li.active > a:after {
                border-left: 30px solid #37495f !important;
            }

        .sw-theme-arrows > ul.step-anchor > li.done > a {
            border-color: #37495f !important;
            color: #fff !important;
            background: #37495f !important;
        }

            .sw-theme-arrows > ul.step-anchor > li.done > a:after {
                border-left: 30px solid #37495f;
            }
    </style>



</asp:Content>
