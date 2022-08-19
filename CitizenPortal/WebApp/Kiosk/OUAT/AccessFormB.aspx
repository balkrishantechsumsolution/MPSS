<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AccessFormB.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.AccessFormB" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

        .divError {
            font-family: Arial;
            font-size: 20px;
            text-align: center;
            margin: 10px auto;
        }

            .divError img {
                float: left;
                width: 50px;
                margin: 0 20px 0 10px;
            }

            .divError div {
                float: left;
                color: red;
                font-size: .8em;
            }

            .divError h1 {
                float: left;
                margin: 0;
                padding: 0;
                font-size: .9em;
                color: maroon;
            }

        .info, .success, .warning, .error, .validation {
            /*border: 1px solid;*/
            margin: 10px 0px;
            padding: 15px 10px 15px 15px;
            background-repeat: no-repeat;
            background-position: 10px left;
            text-align: left;
            font: 13px Tahoma,sans-serif;
        }

        .success {
            color: #4F8A10;
            background-color: #DFF2BF;
        }

        .error {
            color: #D8000C;
            background-color: #FFBABA;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {

            $('#txtBirthDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

        });

        function ValidateForm() {
            debugger;
            var text = "";
            var opt = "";
            var RollNo = $('#txtRollNO');
            var MobileNo = $('#txtMobile');
            var AppID = $('#txtAppID');
            var DOB = $('#txtBirthDate');
            var LoginID = $('#txtLogin');
            var AgroFormA = $('#rbtAgroFormA');
            var FormA = $('#rbtFormA');
            var Captcha = $("#captcha");

            //if (!$("#rbtFormA").is(":checked") && !$("#rbtAgroFormA").is(":checked")) {
            //    text += "<br /> -Please select Examination Type";
            //    $("#lblOUAT").attr('style', 'color:red !important;');
            //    $("#lblOUAT").css({ "color": "red" });
            //    $("#lblAgro").attr('style', 'color:red !important;');
            //    $("#lblAgro").css({ "color": "red" });
            //    opt = 1;
            //} else {
            //    $("#lblOUAT").attr('style', 'color:#000000 !important;');
            //    $("#lblOUAT").css({ "color": "#000000" });
            //    $("#lblAgro").attr('style', 'color:#000000 !important;');
            //    $("#lblAgro").css({ "color": "#000000" });
            //}

            if (MobileNo.val() == '' || DOB.val() == "") {
                text += "<br /> -Please enter Date of Birth, Registered 10 digit mobile number of Applicant.";
                MobileNo.attr('style', 'border:1px solid #d03100 !important;');
                MobileNo.css({ "background-color": "#fff2ee" });
                //RollNo.attr('style', 'border:1px solid #d03100 !important;');
                //RollNo.css({ "background-color": "#fff2ee" });
                DOB.attr('style', 'border:1px solid #d03100 !important;');
                DOB.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
                MobileNo.css({ "background-color": "#ffffff" });
                DOB.attr('style', 'border:1px solid #cdcdcd !important;');
                DOB.css({ "background-color": "#ffffff" });
                //RollNo.attr('style', 'border:1px solid #cdcdcd !important;');
                //RollNo.css({ "background-color": "#ffffff" });
            }

            if (RollNo.val() == '' && AppID.val() == "" && RollNo.val() == "" && LoginID.val() == "") {
                text += "<br /> -Please enter either one of the Roll Number or Application No OR Aadhaar Number";
                opt = 1;
            }

            if (MobileNo.val() != '') {
                var mobmatch1 = /^[789]\d{9}$/;
                if (!mobmatch1.test(MobileNo.val())) {
                    text += "<br /> -Please enter valid 10 digit mobile Number.";
                    MobileNo.attr('style', 'border:1px solid #d03100 !important;');
                    MobileNo.css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
                    MobileNo.css({ "background-color": "#ffffff" });
                }
            }
            if (RollNo.val() != '') {
                if (RollNo.val().length > 7) {
                    text += "<br /> -Please enter valid Roll No.";
                    RollNo.attr('style', 'border:1px solid #d03100 !important;');
                    RollNo.css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    RollNo.attr('style', 'border:1px solid #cdcdcd !important;');
                    RollNo.css({ "background-color": "#ffffff" });
                }
            }
            if (AppID.val() != '') {

                if (AppID.val().length < 8) {
                    text += "<br /> -Please enter Application No.";
                    AppID.attr('style', 'border:1px solid #d03100 !important;');
                    AppID.css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    AppID.attr('style', 'border:1px solid #cdcdcd !important;');
                    AppID.css({ "background-color": "#ffffff" });
                }
            }

            if ($("#captcha").val() == "" || $("#captcha").val() == '') {
                text += "<br /> -Please Enter Captcha Value";
                Captcha.attr('style', 'border:1px solid #d03100 !important;');
                Captcha.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                Captcha.attr('style', 'border:1px solid #cdcdcd !important;');
                Captcha.css({ "background-color": "#ffffff" });
            }


            if (opt == "1") {
                alertPopup("Please fill following information.", text);

                return false;
            }

            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 311px; width: 80%; margin: 0 auto;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                <div class="clearfix">
                    <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                        Access Application AGRO FORM-B for OUAT UG Course Admission - 2017
                    </h2>
                </div>
                <div class="row" id="divCitizenProfile">
                    <div id="" class="col-md-12">

                        <div runat="server" class="danger error bg-warning" id="divErr">
                            Please enter Date of Birth, Mobile Number (Mandatory) and any one of Roll Number or Application No or Aadhaar Number fields to access the OUAT Application FORM-B.
                        </div>
                        <div class="row">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Applicant Details 
                                    </h4>
                                </div>

                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <table style="width: 100%; margin: 0;">
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rbtFormA" Style="font-weight: bold" GroupName="grpExam" runat="server" Visible="False" /><span id="lblOUAT" runat="server" visible="false">Admit Card for OUAT UG Course Examination 2017</span>

                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rbtAgroFormA" Style="font-weight: bold" GroupName="grpExam" runat="server" Visible="false" Checked="True" /><span id="lblAgro" runat="server" visible="false">Admit Card for OUAT CEE - 2017 for Agro Polytechnic Student </span>

                                                    </td>
                                                </tr>
                                            </table>
                                            <hr class="row" />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">
                                                Date of Birth</label>

                                            <asp:TextBox runat="server" ID="txtBirthDate" CssClass="form-control" placeholder="DD/MM/YYYY" name="txtBirthDate" value="" MaxLength="10"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtMobile">
                                                Mobile Number</label>
                                            <asp:TextBox runat="server" ID="txtMobile" class="form-control" placeholder="Registered mobile no" name="txtMobile" value="" MaxLength="10" onkeypress="return isNumberKey(event);"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="" for="txtRollNO">
                                                Roll Number</label>
                                            <asp:TextBox runat="server" ID="txtRollNO" CssClass="form-control" placeholder="Enter Roll No" name="txtBirthDate" value="" MaxLength="7"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="" for="txtAppID">
                                                Application Number</label>
                                            <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Application No" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                                type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="" for="txtLogin">
                                                Aadhaar Number</label>
                                            <asp:TextBox runat="server" ID="txtLogin" class="form-control" placeholder="Enter Aadhaar Number" name="txtLogin" value="" onkeypress="return isNumberKey(event);" MaxLength="14"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                                        <div style="margin-top: -12px;">
                                            <label>
                                                <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />
                                            </label>
                                            <asp:TextBox runat="server" ID="captcha" MaxLength="6" CssClass="form-control" placeholder="Enter Captcha" />
                                        </div>
                                    </div>

                                    <div class="form-group col-lg-2 text-right">
                                        <label class="" for="">
                                            &nbsp;
                                        </label>
                                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-primary" OnClientClick="isJavaScriptEnabled:return ValidateForm();"
                                            Text="Submit" OnClick="btnSubmit_Click" />
                                        <input id="btnHome" type="button" class="btn btn-danger"
                                            value="Close" onclick="window.close();" />

                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
