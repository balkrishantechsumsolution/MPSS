<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="PaymentAcceptance.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.PaymentAcceptance" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>

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
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];

            $('#AppID').val(AppID);
            $('#txtPaymentDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });



        });

        function ValidateForm() {

            if ($('#txtSBIRef').val() == "") {
                alert("Please enter SBI Reference Number to continue.");
                return false;
            }

            if ($('#txtPaymentDate').val() == "") {
                alert("Please enter Payment Date to continue.");
                return false;
            }

            return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 311px;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                <div class="clearfix">
                    <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i> 
                        RECRUITMENT OF CONSTABLES IN 9TH INDIA RESERVE BATTALION (SPECIALISED)
    </h2>
                </div>
                <div class="row" id="divCitizenProfile">

                    <div class="row">
                        <div id="" class="col-md-12">
                            <div runat="server" class="danger error bg-warning" id="divErr">
                            Please Select Payment Type to continue                            
                        </div>
                            <div class="col-md-12 box-container" style="display: none">
                                <div class="box-heading">
                                    <h4 class="box-title">Search Applicant Details 
                                    </h4>
                                </div>

                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">
                                                Application ID</label>
                                            <input id="txtAppID" class="form-control" placeholder="Application ID" name="txtAppID"
                                                type="text" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">
                                                Applicant Date of Birth</label>
                                            <input id="DOB" class="form-control" placeholder="DD/MM/YYYY" name="DOB" value="" maxlength="8" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-2 text-left">
                                        <label class="" for="">
                                            &nbsp;
                                        </label>
                                        <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                            Text="Fetch Detail" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div id="divDetails" class="col-md-12 box-container" style="display: none">
                                <div class="box-heading" id="Div4">
                                    <h4 class="box-title">Applicant Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div style="margin: 10px 20px;">

                                        <table class="">
                                            <tr>
                                                <td style="vertical-align: top">
                                                    <img alt="" src="" style="height: 158px; width: 134px" /></td>
                                                <td style="vertical-align: top; width: 10px"></td>
                                                <td style="vertical-align: top">
                                                    <table class="">
                                                        <tr>
                                                            <td>
                                                                <table class="">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label1" runat="server" Text="Applicant Name"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center; width: 10px">:</td>
                                                                        <td class="auto-style1">
                                                                            <asp:Label ID="lblName" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center" class="auto-style2">|</td>
                                                                        <td>
                                                                            <asp:Label ID="Label3" runat="server" Text="DOB"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">:</td>
                                                                        <td>
                                                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">|</td>
                                                                        <td>
                                                                            <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">:</td>
                                                                        <td>
                                                                            <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table class="">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label11" runat="server" Text="Father Name"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">:</td>
                                                                        <td class="auto-style1">
                                                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center" class="auto-style2">|</td>
                                                                        <td>&nbsp;</td>
                                                                        <td style="text-align: center">&nbsp;</td>
                                                                        <td class="auto-style1">&nbsp;</td>
                                                                        <td style="text-align: center">&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                        <td style="text-align: center">&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                        <td style="text-align: center">&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                        <td style="text-align: center">&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table class="">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label6" runat="server" Text="Mobile No."></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">:</td>
                                                                        <td>
                                                                            <asp:Label ID="lblMobileNo" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">|</td>
                                                                        <td>
                                                                            <asp:Label ID="Label7" runat="server" Text="Email ID"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">:</td>
                                                                        <td>
                                                                            <asp:Label ID="lblEmailID" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">|</td>
                                                                        <td>
                                                                            <asp:Label ID="Label8" runat="server" Text="Profile / Aadhar No."></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: center">:</td>
                                                                        <td>
                                                                            <asp:Label ID="lblProfileID" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Payment Details 
                                    </h4>
                                </div>

                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">
                                                Reference ID</label>
                                            <input id="AppID" class="form-control" placeholder="Application ID" name="txtAppID" readonly
                                                type="text" value="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">
                                                State Bank Collect Reference No.</label>
                                            <input runat="server" id="txtSBIRef" class="form-control" placeholder="Payment Refrence No." name="txtSBIRef" value="" autofocus="" maxlength="12"  onkeypress="return AlphaNumeric(event); " />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">
                                                Payment Date</label>
                                            <input id="txtPaymentDate" class="form-control" placeholder="DD/MM/YYYY" name="txtPaymentDate" value="" maxlength="8" />
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-3 text-right">
                                        <label class="" for="">
                                            &nbsp;
                                        </label>
                                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-primary" OnClientClick="isJavaScriptEnabled:return ValidateForm();"
                                            Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnHome" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                            Text="Home" OnClick="btnHome_OnClick" />
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
