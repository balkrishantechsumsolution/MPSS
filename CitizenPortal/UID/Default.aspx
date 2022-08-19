<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CitizenPortal.UID.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title></title>

    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <link href="../WebApp/Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../WebApp/Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../WebApp/Styles/style.admin.css" rel="stylesheet" />
    <script src="../Scripts/angular.min.js"></script>
    <script src="../PortalScripts/ServiceLanguage.js"></script>
    <script type="text/javascript">
        function getQueryStrings() {
            debugger;
            var assoc = {};
            var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
            var queryString = location.search.substring(1);
            var keyValues = queryString.split('&');

            for (var i in keyValues) {
                var key = keyValues[i].split('=');
                if (key.length > 1) {
                    assoc[decode(key[0])] = decode(key[1]);
                }
            }

            return assoc;
        }

        function ekycAcceptance(chk) {
            //alert(chk);
            debugger;
            if (chk) {
                $('#btnProceed').prop('disabled', false);
            }
            else
                $('#btnProceed').prop('disabled', true);
        }

        $(document).ready(function () {
            $('#btnProceed').prop('disabled', true);
        });
    </script>

    <style type="text/css">
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
            font-weight: bold;
        }

        .h2, h2 {
            font-size: 20px;
        }
    </style>
</head>

<body>
    <input type="hidden" id="hdnKycRequestUrl" value="<%=CitizenPortal.Common.GlobalValues.RootUrl+"KycRequest.aspx"%>" />

    <form id="frmMain" runat="server">
        <div id="intrnlContent" ng-app="appmodule">
            <div ng-controller="ctrl">
                <div class="col-md-12" style="padding-top: 10px; text-align: center">
                    <h2 class="form-heading">Aadhaar Authentication <span id="lblService">{{ServiceNameData.lblSvcName}}</span>
                    </h2>
                </div>

                <div class="">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Aadhaar KYC Validation
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div>
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="ddlYearTerm">
                                            Aadhaar Number
                                        </label>
                                    </div>
                                </div>
                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                    <div class="form-group">
                                        <input type="text" id="txtAadhaarNo" />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="ddlYearTerm">
                                            KYC Type
                                        </label>
                                    </div>
                                </div>
                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                    <div class="form-group">
                                        <label class="col-lg-4" for="chkOTP">
                                            <input type="radio" id="chkOTP" name="kyc" value="OTP" />One Time Password
                                        </label>
                                        <label class="col-lg-4" for="chkFP">
                                            <input type="radio" id="chkFP" name="kyc" value="FMR" />Finger Impression
                                        </label>

                                        <label class="col-lg-4" for="chkIris">

                                            <input type="radio" id="chkIris" name="kyc" value="IIR" />

                                            IRIS

                                        </label>

                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Acceptance for Using Aadhar No.
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="text-danger text-danger-green mt0">
                                <p class="text-justify">
                                    <input type="checkbox" runat="server" id="disclaimercheck" onclick="javascript: ekycAcceptance(this.checked);" />

                                    <span id="spndecl" style="font-weight: bold; text-transform: uppercase;"></span>
                                    I hereby state that I have no objection in authenticating myself with Aadhaar based authentication system and consent to provide my Aadhaar Number, Biometric for Aadhaar based know your customer for {{ServiceNameData.lblSvcName}}, Govt of Odisha. I also give my explicit consent for accessing the mobile number and email address from Aadhaar System.
                                </p>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>

                <div class="">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <%--<input class="" id="btnsample" type="button" onclick="onTest()" value="Proceed" style="display:block" />--%>
                            <input class="btn btn-success" id="btnProceed" type="button" onclick="onProceed()" value="Proceed" />
                            <input type="button" id="btnCancel"
                                class="btn btn-danger" onclick="window.close();"
                                value="Cancel" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>

                </div>

                <div style="padding-top: 20px; display: none;">

                    <table style="margin-left: auto; margin-right: auto">

                        <tr>

                            <td style="padding-right: 10px">Aadhaar Number: 

                            </td>

                            <td></td>

                        </tr>

                        <tr>

                            <td style="padding-top: 10px">

                                <span style="font-family: Arial, Helvetica, sans-serif; color: #000000; font-size: 14px;">Kyc Type : </span>

                            </td>

                            <td style="padding-top: 10px">Iris

                            </td>

                        </tr>

                        <tr>

                            <td></td>

                            <td>Fingerprint

                            </td>

                        </tr>

                        <tr>

                            <td></td>

                            <td>One Time Password
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <script src="../Scripts/jquery-2.2.3.min.js"></script>

        <script type="text/javascript">

            /**
           
           * Get the value of a querystring
           
           * @param {String} field The field to get the value of
           
           * @param {String} url The URL to get the value from (optional)
           
           * @return {String} The field value
           
           */

            var getQueryString = function (field, url) {

                var href = url ? url : window.location.href;

                var reg = new RegExp('[?&]' + field + '=([^&#]*)', 'i');

                var string = reg.exec(href);

                return string ? string[1] : null;

            };

            $(document).ready(function () {
                var UID = getQueryString("aadhaarNumber");
                $("#txtAadhaarNo").val(UID);
            });

            function onProceed() {
                var kycTypesToUse = GetKycTypesToUse();
                if (!kycTypesToUse.trim()) {
                    alert('Please select atleast one kyc type to use');
                    return;
                }

                var urlToForward = $('#hdnKycRequestUrl').val() + '?aadhaarNumber=' + $('#txtAadhaarNo').val() + '&kycTypesToUse=' + GetKycTypesToUse() + '&transactionId=<%=Guid.NewGuid().ToString()%>';

                window.location = urlToForward;

            }

            function GetKycTypesToUse() {
                var kycTypesToUse = "";
                if ($('#chkIris').is(':checked'))
                    kycTypesToUse = "IIR,";

                if ($('#chkFP').is(':checked'))
                    kycTypesToUse = kycTypesToUse + "FMR,";

                if ($('#chkOTP').is(':checked'))
                    kycTypesToUse = kycTypesToUse + "OTP,";

                kycTypesToUse = kycTypesToUse.slice(0, -1);
                return kycTypesToUse;

            }

            function onTest() {
                var SvcID = getQueryString("SvcID");
                var urlToForward = 'testResponse.aspx?data=' + $('#txtAadhaarNo').val() + "&SvcID=" + SvcID;
                window.location = urlToForward;
            }
        </script>
        <asp:HiddenField ID="HFServiceID" runat="server" Value="" />
    </form>
</body>
</html>

