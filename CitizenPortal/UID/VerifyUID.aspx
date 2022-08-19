<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyUID.aspx.cs" Inherits="CitizenPortal.UID.VerifyUID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title></title>

    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <link href="../WebApp/Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../WebApp/Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../WebApp/Styles/style.admin.css" rel="stylesheet" />
    <script src="../WebApp/Scripts/ValidationScript.js"></script>
    <script src="../WebApp/Scripts/CommonScript.js"></script>
    <script src="Script/VerifyUID.js"></script>
    <script type="text/javascript">
        
    </script>
</head>

<body>
    <input type="hidden" id="hdnKycRequestUrl" value="<%=CitizenPortal.Common.GlobalValues.RootUrl+"KycRequest.aspx"%>" />

    <form id="frmMain" runat="server">
        <div style="padding-top: 10px; text-align: center">
            <h1></h1>
        </div>
        <div class="box-body box-body-open  mTop15">
            <div class="col-sm-6 col-md-6 col-lg-12">
                <div class="text-danger text-danger-green mt0">
                    <p class="text-justify">
                        
                    </p>
                </div>
            </div>
            <div class="clearfix">
            </div>

        </div>
        <div class="">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Lokaseba Adhikara -- Aadhaar KYC Validation
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div>
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="" for="txtAadhaarNo">
                                    Aadhaar Number
                                </label>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <input type="text" id="txtAadhaarNo" readonly />
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="" for="">&nbsp;&nbsp;
                                </label>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div id="divOTP">
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="" for="txtOTP">
                                    Enter OTP SMS on Mobile No. <span id="lblMobile"></span>
                                </label>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <input type="text" id="txtOTP" maxlength="6" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <a href="#" onclick="fnGenOTP">Regenerate OTP</a>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <div class="">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input class="btn btn-primary" id="btnOTP" type="button" onclick="fnGenOTP();" value="Generate OTP" />
                    &nbsp;<input class="btn btn-blue" id="btnProceed" type="button" onclick="fnOpenUID();" value="Validate Aadhaar Again" />
                    <input class="btn btn-success" id="btnValidateOTP" type="button" onclick="fnValidateOTP();" value="Validate OTP" />
                    &nbsp;<input type="button" id="btnCancel"
                        class="btn btn-danger" onclick="window.close();"
                        value="Cancel" /> <%--<input type="button" id="btnCancel0"
                        class="btn btn-danger" onclick="fnUIDJSonValue();"
                        value="Cancel" /></div>--%>
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
        <input type="hidden" name="HFUID1" id="HFUID1" value="{&quot;aadhaarNumber&quot;:&quot;458964734545&quot;,&quot;photo&quot;:&quot;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&quot;,&quot;dateOfBirth&quot;:&quot;10-05-1999&quot;,&quot;residentName&quot;:&quot;Ramlal Sharma&quot;,&quot;gender&quot;:&quot;M&quot;,&quot;phone&quot;:&quot;1143000420&quot;,&quot;emailId&quot;:&quot;sharmaramlal@yahoo.com&quot;,&quot;careOf&quot;:&quot;S/O Shayam Lal Sharma&quot;,&quot;landmark&quot;:null,&quot;locality&quot;:&quot;PARLIMENT STREET &quot;,&quot;vtc&quot;:&quot;DELHI&quot;,&quot;district&quot;:&quot;Nagpur&quot;,&quot;houseNumber&quot;:&quot;701&quot;,&quot;street&quot;:null,&quot;postOffice&quot;:null,&quot;subDistrict&quot;:&quot;Umred&quot;,&quot;state&quot;:&quot;Maharashtra&quot;,&quot;pincode&quot;:&quot;110420&quot;,&quot;language&quot;:&quot;06&quot;,&quot;residentNameLocal&quot;:&quot;गुनवंत सैनी&quot;,&quot;careOfLocal&quot;:&quot;S/O  जगमोहन&quot;,&quot;houseNumberLocal&quot;:&quot;७६&quot;,&quot;streetLocal&quot;:null,&quot;landmarkLocal&quot;:null,&quot;localityLocal&quot;:&quot;सैनी एन्क्लेव&quot;,&quot;vtcLocal&quot;:&quot;देल्ही&quot;,&quot;subDistrictLocal&quot;:null,&quot;districtLocal&quot;:&quot;ईस्ट देल्ही&quot;,&quot;stateLocal&quot;:&quot;देल्ही&quot;,&quot;pincodeLocal&quot;:&quot;110092&quot;,&quot;postOfficeLocal&quot;:null,&quot;responseCode&quot;:&quot;3ce2a71b6ef34430a92c265d5491d5af&quot;,&quot;action&quot;:&quot;&quot;,&quot;ttl&quot;:&quot;2017-07-25T21:30:43&quot;,&quot;timestamp&quot;:&quot;2016-07-25T21:30:43.210+05:30&quot;}" />
        
<%--        <input type="hidden" name="HFUID1" id="HFUIDData" value="" />--%>
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
                var urlToForward = 'testResponse.aspx?data=' + $('#txtAadhaarNo').val();
                window.location = urlToForward;

            }
        </script>
    </form>
</body>
</html>
