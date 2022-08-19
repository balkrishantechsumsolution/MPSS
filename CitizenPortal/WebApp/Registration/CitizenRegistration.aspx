<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CitizenRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Registration.CitizenRegistration" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>

    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <link href="../bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../Styles/timeline.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/sb-admin-2.css" rel="stylesheet" />
    <script src="../Common/Scripts/bootstrap.min.js"></script>
    <script src="../Common/Scripts/metisMenu.js"></script>
    <script src="../Common/Scripts/raphael.js"></script>
    <script src="../Common/Scripts/morris.js"></script>
    <script src="../Common/Scripts/sb-admin-2.js"></script>

    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/jquery.msgBox.js"></script>

    <script src="../../Scripts/angular.min.js"></script>
    <script src="../../PortalScripts/ServiceLanguage.js"></script>
    <script src="../../Scripts/md5.js"></script>
     <script src="/Sambalpur/js/SHA256.js"></script>

    <script src="../Scripts/CommonScript.js"></script>
    <script src="../Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Registration/CitizenRegistration.js"></script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        h1 {
            margin: 0;
        }

        hr {
            margin: 0;
            padding: 0;
            clear: both;
            border: none;
        }

        #container_lgn {
            width: 512px;
        }

        .login-wrapper {
            width: 450px;
            margin: 0 auto;
        }

        .rbt-grp {
            padding-left: 0;
        }

        .text-align-center {
            text-align: center;
        }

        .Ltitle {
            font-weight: bolder;
            color: rgb(233, 84, 0);
        }

        .sub-title {
            color: rgb(0, 62, 0);
            margin: 2px;
            font-size: 20px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .sub-sub-title {
            color: rgb(0, 29, 0);
            margin-bottom: 10px;
            font-size: 15px;
            font-weight: bold;
            letter-spacing: 1.2px;
        }

        .box-container > .box-body {
            background-color: rgba(252, 252, 252, 0.93) !important;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {

            $('#divInfo').hide();
            $('#divMsg').hide();
            $('#divDetail').hide();
            $('#divBtn').hide();
            $('#divOTP').hide();
            $('#btnProceed').show();
            $('#btnValidateOTP').hide();
            $('#btnOTP').show();
            $('#divbtnOTP').hide();
            $('#txtEmail').focus();
            //$("#btnConfirm").bind("click", function (e) { return SubmitData(); });
        });

        function fnGenOTP() {
            debugger;
            $('#divMsg').hide();
            $('#txtSMSCode').val("");
            
            if (!ValidateForm()) {
                return;
            }
            
            debugger;
            var temp = "Gunwant";

            var result = false;

            //var UID = getQueryString("aadhaarNumber");
            //var TransID = getQueryString("transactionId");

            var MobileNo = $("#txtMobile").val();
            $("#txtMobile").prop('disabled', true);
            $("#txtEmail").prop('disabled', true);
            $.when(
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Citizen/Forms/ValidateUser.aspx/GenerateOTP',
                data: '{"prefix": "","Data":"' + MobileNo + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {

                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            })).then(function (data, textStatus, jqXHR) {
                debugger;
                var obj = jQuery.parseJSON(data.d);
                var html = "";
                var strMobile = "";
                AppID = obj.AppID;
                var temp = AppID.split('_');
                strMobile = temp[3];
                result = true;

                if (result /*&& jqXHRData_IMG_result*/) {
                    alertPopup('Citizen Registration','The 6 digit OTP has been SMS to ' + strMobile + ' \Please enter the no to verify');

                    $("#txtMobile").prop('disabled', true);
                    $("#txtEmail").prop('disabled', true);
                    $('#divOTP').show();
                    $('#divbtnOTP').show();
                    $('#btnValidateOTP').show();
                    $('#btnOTP').prop('disabled', true);
                    $('#divVerify').hide();
                    $('#btnOTPLink').css("display", "block");
                    $('#btnOTP').removeClass("btn-primary");
                    $('#btnOTP').addClass("btn-link");
                    $('#txtSMSCode').focus();
                    $("#divMsgTitle").text("Information!");
                    $("#divMsgDtls").text("6 Digit OTP Code has been SMS to registered mobile no.");
                    $('#divMsg').show();
                }
                else {
                    alertPopup('Form Validation!','Sorry! Something went wrong, please try again.');
                    $("#txtMobile").prop('disabled', false);
                    $('#btnOTP').val('Re-Send OTP');
                    $("#MobileNo").val(MobileNo);
                    $("#divCitizenProfile").show();
                    $("#divSearch").hide();
                    $("#HFOTPDone").val("Y");
                    $("#HFMobileNo").val(MobileNo);

                }
                //alert("Basic detail saved from Aadhaar.");
                //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

            });// end of Then function of main Data Insert Function

            return false;
        }

        function ValidateForm() {
            debugger;
            //CheckAvability();
            var MobileNo = $("#txtMobile").val();
            var length = MobileNo.length;
            var mobmatch1 = /^[789]\d{9}$/;
            var text = "";
            var opt = "";
            //if ($("#txtMobile").val() == "") {                
            //    text = text += "<br /> - Please enter 10 digit mobile number.";
            //    opt = 1;
            //}

            //if (!mobmatch1.test(MobileNo)) {                
            //    text = text += "<br /> - Please enter valid mobile number";                
            //    opt = 1;
            //}

            var emailMatch = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
            var EmailID = $("#txtEmail").val();
            if ((!emailMatch.test(EmailID)) || EmailID == "" || EmailID == null) {                
                text = text += "<br /> - Please enter valid email id";                
                opt = 1;
            }

            //if (!emailMatch.test(EmailID)) {               
            //    text = text += "<br /> - Please enter valid email id";
            //    opt = 1;
            //}

            if ((!mobmatch1.test(MobileNo)) || MobileNo =="" || eval(length) < 10) {
                text = text += "<br /> - Please enter valid 10 digit mobile number.";    
                opt = 1;
            }

           

            if (opt == "1") {
                //$("#divMsgTitle").text("Validate Form!");
                //$('#divMsg').show();
                //$("#divMsgDtls").text(text);
                alertPopup("Please fill following information.", text);
                return false;
            }

            return true;
        }
        
        function fnValidateOTP() {

            debugger;
            var temp = "Gunwant";

            var result = false;

            if ($('#txtSMSCode').val() == "") {
                alertPopup('Form Validation!', 'OTP Validation Failed! Please enter correct 6 digit OTP received as SMS from Uttarakhand Govt.');
                return false;
            }
            //var temp = AppID.split('_');
            //var strMobile = temp[0];
            //var UID = temp[0];
            //var OTP = temp[1];
            AppID = AppID;
            $.when(
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Citizen/Forms/ValidateUser.aspx/ValidateCitizenOTP',
                data: '{"prefix": "","Data":"' + AppID + '","EnteredOTP":"' + $('#txtSMSCode').val() + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {

                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            })).then(function (data, textStatus, jqXHR) {
                debugger;
                var obj = jQuery.parseJSON(data.d);
                var html = "";
                var strMobile = "";
                var strReturn = obj.AppID;
                var temp = strReturn.split('_');
                var cnt = temp[0];
                result = true;

                if (cnt == 1) {
                    $('#divDetail').show();
                    $('#btnValidateOTP').hide();
                    $('#btnOTP').hide();
                    $('#txtSMSCode').hide();
                    $('#divOTP').hide();
                    $('#btnOTPLink').hide();
                    $('#divBtn').show();
                    $("#divMsgTitle").text("Information!");
                    $("#divMsgDtls").text("Mobile Successfully Validated, Please fill the necessary details.");
                    $('#divMsg').show();
                    $("#btnConfirm").bind("click", function (e) { return SubmitData(); });
                    
                    //alert($("#") "Basic detail saved from Aadhaar.");
                    //rtnurl = "/WebApp/Citizen/Forms/Register.aspx";
                    //window.location.href = rtnurl;
                    //fnRedirect4Profile(temp[0], temp[1]);
                }
                else {
                    alertPopup('Form Validation!','OTP Validation Failed! Please enter correct 6 digit OTP received as SMS from Lokaseba Adhikara -CAP, Odisha Govt.');

                }
                //alert("Basic detail saved from Aadhaar.");
                //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

            });// end of Then function of main Data Insert Function

            return false;
        }
        var bool = 0;
        function ckhInfo() {

            if (bool == 0) {
                bool = 1;
                $('#divInfo').show(500);
            }
            else {
                bool = 0;
                $('#divInfo').hide(500);
            }
        }

        function SubmitData() {
            
            submitForm();

            if (!ValidateForm()) {
                return;
            }

            var temp = "Gunwant";
            var AppID = "";
            var result = false;
            
            
            var datavar = {

                'FullName': $('#txtName').val(),
                'LoginID': $('#txtUserID').val(),
                'Mobile': $('#txtMobile').val(),
                'emailId': $('#txtEmail').val(),
                'Password': $('#txtConfirm').val(),
            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": $.stringify(datavar, null, 4),
                "Signature": calcMD5($.stringify(datavar, null, 4))
            };


            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/CitizenRegistration.aspx/InsertLoginDetails',
                    data: $.stringify(obj, null, 4),
                    processData: false,
                    dataType: "json",
                    success: function (response) {

                    },
                    error: function (a, b, c) {
                        result = false;
                        alert("5." + a.responseText);
                    }
                })
                ).then(function (data, textStatus, jqXHR) {
                    debugger;
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    AppID = obj.AppID;
                    result = true;

                    if (obj.intStatus == '2') {
                        result = false;
                    }

                    if (result /*&& jqXHRData_IMG_result*/) {
                        var url = "/WebApp/Citizen/Forms/Register.aspx";
                        //alertPopup("Citizen Registration","You've successfully register to LOKASEBA ADHIKARA portal, now you can avail services under ORTPSA Act 2012, after completing the profile");
                        window.location.href = url + '?UserID=' + AppID;

                    }
                    else {
                        if (obj.intStatus == '2') {
                            alert("Invalid details, please try again.");
                        }
                        else {
                            alert("Something went wrong, please try again.");
                        }

                    }
                });// end of Then function of main Data Insert Function

            return false;
        }
    </script>

    <script language="javascript" type="text/javascript">
        //Strong password
        function pwdStrength(p1) {
            var lenPwd = p1.value;
            var password = p1.value;

            if (p1.value == "") {
                alertPopup('Form Validation',"Please Enter New Password");
                p1.focus();
                return false;
            }
            if ((lenPwd.length > 6) && password.match(/[a-z]/) && password.match(/[A-Z]/) && password.match(/\d+/) && password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/)) {
                return true;
            }
            else {
                var text = "Password should be minimum of 6 Digit & it should contain combination of numeric,special character and alphabets(Both in Upper and Lower Cases)";
                alertPopup("Please fill following information.", text);
                p1.focus();
                p1.value = "";
                return false;
            }
        }

        function repass(p1, p2) {
            if (p2.value == "") {
                var text = "Please Enter Confirm password";
                alertPopup("Please fill following information.", text);
                p2.focus();
                return false;
            }

            else if (p1.value != p2.value) {
                var text = "Password do not match";
                alertPopup("Please fill following information.", text);
                p2.focus();
                p2.value = "";
                return false;
            }
            else {
                return true;
            }
        }
        //End of strong password
        // for md5 encryption
        function md5auth(seed) {

<%--            var newpwd = document.getElementById('<%=txtChangePassword.ClientID %>');
            var repwd = document.getElementById('<%=txtChangePasswordConfirm.ClientID %>');--%>
            var newpassword = newpwd.value;
            var confirmpassword = repwd.value;

            if (newpwd.value == '') {
                alertPopup('Form Validation',"Please enter New password");
                newpwd.focus();
                return false;
            }

            if (repwd.value == '') {
                alertPopup('Form Validation', "Please enter Re-confirm password");
                repwd.focus();
                return false;
            }

            var newHash = calcMD5(newpassword).toUpperCase();
            newpwd.value = newHash;

            var conhash = calcMD5(confirmpassword).toUpperCase();
            repwd.value = conhash;
            return true;


        }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="intrnlContent" ng-app="appmodule">
            <div ng-controller="ctrl">
                <div id="page-wrapper" style="margin: 0 auto; width: 80%">
                    <div class="mb20 mt20">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-3 text-left">
                            <img src="../kiosk/Images/logo_orissa.gif" style="width: 80px;" />
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-6 text-center mt10">

                            <h1 class="text-align-center Ltitle" style="font-size: 35px;"><b>LOKASEBA ADHIKARA</b></h1>
                            <div class="sub-title">Common Application Portal (CAP)</div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-3 text-right">
                            <img src="/WebApp/Kiosk/Images/depLgog.png" style="width: 100px;" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <uc1:FormTitle runat="server" ID="FormTitle" />
                    <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                    <div class="row">
                        <div class="box-container col-lg-12">
                            <p>
                                <b class="text-danger-green" style="font-size: 19px !important;">Register yourself with Lokaseba Adhikara to avail notifed service under Odisha Right to Public Services Act, 2012</b><span class="pull-right pright15"><a href="http://ortpsa.in/about_act.php" style="color: #FF9900; font-weight: bold; text-decoration: underline;" target="_blank">READ MORE <i class="fa fa-angle-double-right"></i></a>&nbsp;  <b><a href="/Download/Act.pdf" style="color: #FF9900; font-weight: bold; text-decoration: underline;" target="_blank"><i class="fa fa-file-pdf-o pright5"></i> Download ACT </a></b></span>
                            </p>
                        </div>
                    </div>
                    <div class="row" id="divApp" runat="server">
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title"><span class="col-md-6" style="padding: 0">Login Details</span> <span class="col-md-6" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i></span><span class="clearfix"></span>
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 margin-btm" id="divInfo">
                                    <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10" id="divCredential">
                                        
                                        <span style="font-weight: bold; margin-bottom: 5px">Mobile / Email Verification:</span><br />
                                        <span>1. Please enter correct Email Id and Mobile no as all the communication (of Services, notification, status) shall be made through it<br />
                                            2. Verification Code will be send to entered mobile no.
                                            <br />
                                            3. OTP will be valid for 20 minutes only.<br />
                                            2. You request another OTP on clicking on Resend OTP button.                                
                                        </span>
                                        <br />
                                        <span style="font-weight: bold; margin-bottom: 5px">Password must include:</span><br />
                                        <span>1. Minimum of Eight (8) character<br />
                                            2. One character must be in CAPS (Capital Alphabet A-Z)
                                <br />
                                            3. One character must be in Numeric&nbsp;(0-9) and<br />
                                            4. One character must be special character (!@#$%^&amp;*)
                                        </span>
                                        
                                    </div>
                                </div>
                                <div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                        <div class="alert alert-success mt0 mb10" id="divMsg" style="font-size:16px !important">
                                            <b>
                                                <p class="text-justify" id="divMsgTitle">
                                                </p>
                                            </b>
                                            <span class="text-justify" id="divMsgDtls">
                                            </span>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtEmail">
                                                        Email ID</label>
                                                    <input type="email" name="txtEmail" id="txtEmail" class="form-control" placeholder="Enter Applicant Email ID" pattern="[A-Za-z]" maxlength="35" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="lblMobileNo">
                                                        Mobile No.</label>
                                                    <input class="form-control" id="txtMobile" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" value="" maxlength="10" title="Please enter valid Mobile No" onkeypress="return isNumberKey(event);"
                                                        />
                                                </div>
                                            </div>
                                           <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <label class="manadatory" for="Village">
                                                    Verification Code
                                                </label>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                                <div>
                                                     <img src="/Account/GetCaptcha" alt="verification code" />
                                                </div>
                                            </div>
                                            <div class="col-xs-4 pright0">
                                                <asp:TextBox MaxLength="6" ID="captcha" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-xs-12 pright0 text-right">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="captcha" ErrorMessage="Captcha Required" Display="Dynamic" ForeColor="red" SetFocusOnError="True" CssClass="m0 text-right alert2 alert-danger">
                                                </asp:RequiredFieldValidator>
                                            </div>--%>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                                                <div style="margin-top: -12px;">
                                                    <label>
                                                        <%--<img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />--%>
                                                       <img src="#" id="imgCaptcha" alt="captcha" class=".gov.inform-control" />

                                                    </label>
                                                    <asp:TextBox runat="server" ID="captcha" MaxLength="6" CssClass="form-control" placeholder="Enter Captcha" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divVerify">
                                                <div class="form-group">
                                                    <label class="" for="Village">
                                                        &nbsp;
                                                    </label>
                                                    <%--<input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." onclick="fnGenOTP();" />--%>
                                                    <input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." onclick="fnCheckMobileNo();" />
                                                </div>
                                            </div>
                                             <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                                <div class="form-group">
                                                    <label class="" for="Village">
                                                        &nbsp;
                                                    </label>                                                    
                                                    <input type="button" id="btnOTPLink"  value="ReSend SMS" class="btn-link" style="display:none;" onclick="fnCheckMobileNo();" />
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divOTP">
                                                <div class="form-group">
                                                    <label class="manadatory" for="CompanyName">
                                                       OTP </label>
                                                    <input class="form-control" id="txtSMSCode" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);"
                                                        autofocus />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divbtnOTP">
                                                <div class="form-group">
                                                    <label class="" for="">
                                                        &nbsp;
                                                    </label>
                                                    <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Validate SMS Code" onclick="fnValidateOTP();" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div id="divDetail">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtName">
                                            Applicant Full Name</label>
                                        <input type="text" id="txtName" name="txtName" class="form-control" placeholder="Enter Applicant Full Name" autofocus="autofocus" maxlength="30" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtUserID">
                                            Login Id
                                        </label>
                                        <input id="txtUserID" class="form-control" name="txtUserID" type="text" value="" placeholder="Enter Login Id" maxlength="26"
                                          onchange="CheckAvability();"  autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtPassword">
                                            Password
                                        </label>
                                        <input id="txtPassword" class="form-control" name="txtPassword" placeholder="Enter Password" type="password" value="" maxlength="20"
                                            autofocus ncopy="return false;" oncut="return false;"onpaste="return false;" onchange="javascript:return pwdStrength(this);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtConfirm">
                                            Confirm Password
                                        </label>
                                        <input class="form-control" id="txtConfirm" name="txtConfirm" type="password" placeholder="Confrim Password" value="" maxlength="20" onchange="fnCompairPassword();"
                                            autofocus oncopy="return false;" oncut="return false;"
                                            onpaste="return false;" onchange="javascript:return repass(document.getElementById('txtChangePassword'), this);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group text-right">
                                        <label class="" for="">
                                            &nbsp;
                                        </label>
                                        <input type="button" id="btnAvailability" class="btn btn-link" value="Check Login Id Availability" />
                                    </div>
                                </div>
                                    </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>



                        <%---Start of Button----%>
                        <div class="col-md-12 box-container" id="divBtn">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnConfirm" class="btn btn-success" value="Register" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                    CssClass="btn btn-danger" PostBackUrl=""
                                    Text="Cancel" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>

                        <%---End of Button----%>
                        <%--<div class="col-md-12 box-container" >
                    <div class="box-heading">
                        <h4 class="box-title">
                            Verification
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 margin-btm">
                            <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10">
                                <span style="font-weight: bold; margin-bottom: 5px">Mobile / User Verification:</span><br />
                                <span>1. Please enter the verification code<br />
                                    2. Please enter the 6 Digit code send in register mobile no. <span id="mobileno"></span>
                                <br /></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="">
                                    Verification Code</label>
                                <div>
                                    <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" style="margin-left: 5px">
                                </div>
                                <div>
                                    <input type="text" id="txtVerificationCode" placeholder="Verification Code" class="form-control" style="margin-top: -31px; padding-left: 130px !important;" />
                                </div>
                                <div><i class="fa fa-refresh" style="float: left; margin-top: -24px; padding-left: 285px !important; color:forestgreen"></i>
                            </div></div>
                        </div>
                        
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="danger" id="Label1" for="" runat="server">
                                </label>
                                &nbsp;
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="danger" id="Label3" for="" runat="server">
                                </label>
                                &nbsp;<div class="text-right">                                    
                                    <button type="button" class="btn btn-success">Verify Code</button>

                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>--%>
                    </div>

                </div>
            </div>
        </div>
        <asp:HiddenField ID="HFServiceID" runat="server" Value="995" />
        <asp:HiddenField ID="HFCapID" runat="server" />
        <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="995" ng-model="ServiceID" runat="server" visible="false" />

    </form>
</body>
</html>
