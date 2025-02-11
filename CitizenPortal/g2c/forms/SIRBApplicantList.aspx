﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="SIRBApplicantList.aspx.cs" Inherits="CitizenPortal.g2c.forms.SIRBApplicantList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="../../WebApp/Login/js/JqueryDT.js"></script>--%>
     <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
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
            var MobileNo = $('#txtMobile');
            var AppID = $('#txtAppID');
            var DOB = $('#txtBirthDate');
            var LoginID = $('#txtName');

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

            if (AppID.val() == "" && RollNo.val() == "" && LoginID.val() == "") {
                text += "<br /> -Please enter either one of the Reference ID OR Applicant Name";
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
            
            if (AppID.val() != '') {
               
                if (AppID.val().length != 12) {
                    text += "<br /> -Please enter valid 12 digit Reference ID.";
                    AppID.attr('style', 'border:1px solid #d03100 !important;');
                    AppID.css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    AppID.attr('style', 'border:1px solid #cdcdcd !important;');
                    AppID.css({ "background-color": "#ffffff" });
                }
            }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);

                return false;
            }

            return true;
        }
    </script>
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>List of Applicant whose Application is Approved</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Applicant Details 
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div runat="server" class="danger error bg-warning" id="divErr">
                        To search, please enter Date of Birth, Mobile Number (Mandatory) and any one either Reference ID or Applicant Name.
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
                            <label class="" for="txtAppID">
                                Reference ID</label>
                            <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Reference ID" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                type="text" value=""></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="txtLogin">
                                Applicant Name</label>
                            <asp:TextBox runat="server" ID="txtName" class="form-control" placeholder="Enter Applicant Name" name="txtLogin" value="" onkeypress="return AlphaNumeric(event);"></asp:TextBox>

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
        <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="DataGridView" style="width: 100%" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>