<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="PGPhdApplication.aspx.cs" Inherits="CSVTUPortal.WebApp.Kiosk.OUAT.PGPhD.PGPhdApplication" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/PhysicalTestDeclaration.ascx" TagPrefix="uc1" TagName="PhysicalTestDeclaration" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>
<%@ Register Src="~/WebApp/Control/OUATUndertaking.ascx" TagPrefix="uc1" TagName="OUATUndertaking" %>
<%@ Register Src="~/WebApp/Control/OUATDeclaration.ascx" TagPrefix="uc1" TagName="OUATDeclaration" %>
<%@ Register Src="~/WebApp/Control/PGPhDSteps.ascx" TagPrefix="uc1" TagName="PGPhDSteps" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/WebApp/Kiosk/PG/bootbox.min.js"></script>

    <%--<script src="DoctoralMasters.js"></script>--%>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Entrance/PhD/PGPhDForm.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        $(document).ready(function () {            
            $("#lblUser").hide();
            $('#divLogin').hide();
            $('#side-menu').hide();
            $('#divExempted').hide();
            $('#divPunishment').hide();
            $('#divCourse').hide();
            $('#divLang').hide();
            $('#divResi').hide();
            //$("#btnSubmit").prop('disabled', true);
            $('#divReserved').hide();
            $('#divNRIAddress').hide();
            $("#liDC").addClass("current");
            $("#divENT").hide();
            $("#divMPhil").hide();
            $("#divFellowship").hide();
            $("#divResearch").hide();
            $("#divExemption").hide();
            $('#divInfo').slideDown(500);
            $('#lblInfo').focus();
            $('#lblMobileNo').val('');
            $('#txtMobile').focus();
        });

        var bool = 0;
        function ckhInfo() {
            if (bool == 1) {
                bool = 0;
                $('#lblInfo').text('Hide');
                $('#divInfo').slideDown(500);
            }
            else {
                bool = 1;
                $('#lblInfo').text('Show');
                $('#divInfo').slideUp(500);
            }
        }

        function fuShowHideDiv(divID, isTrue) {
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID).show(500);
            }
            if (isTrue == "0") {
                //hidedive();
                $('#' + divID).hide(500);
            }
        }

        function fnLanguage(divID) {
            //alert(divID);
            if (divID == "divResi") {
                $('#divResi').show(500);
                $('#divLang').hide(500);
            }
            if (divID == "divLang") {
                $('#divResi').hide(500);
                $('#divLang').show(500);
            }
        }

        function fnClose() {
            $('#divLogin').hide();
        }

        function fnShowLogin() {
            $('#divLogin').show();
        }

        $(document).ready(function () {
            $(function () {
                $("#Photo").change(function () {
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = imageIsLoaded;
                        reader.readAsDataURL(this.files[0]);
                    }
                });
            });

            function imageIsLoaded(e) {
                $('#imgPhoto').attr('src', e.target.result);
            };
            m_ServiceID = $('#HFServiceID').val();
        });

        $(document).ready(function () { $("#divNonAadhar").hide(); });

    </script>

    <script type="text/javascript">
        window.CallParent = function () {
            ParentBindProfile();
        }
    </script>

    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {
            var t_Lang = p_Lang;
            if (p_Lang == null) t_Lang = document.getElementById('HFCurrentLang').value;
            if (t_Lang == "1") t_Lang = "2";
            else t_Lang = "1";
            document.getElementById('HFCurrentLang').value = t_Lang;
            document.forms[0].submit();
            return true;
        }
    </script>

    <style type="text/css">
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 10px !important;
        }

        .othrinfohd {
            background-color: #ececec !important;
            padding-top: 8px;
        }

        #CheckBoxList1 label {
            display: inline !important;
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

            .form-heading span {
                font-size: 25px;
                padding-left: 0;
            }

        #instn p {
            line-height: 20px;
            color: #777;
            display: flex;
        }

        #instn .mleft10 {
            margin-left: 10px !important;
        }

        #instn li {
            color: #777;
            display: flex;
        }

        .msgBox {
            width: 600px !important;
            overflow: auto;
            height: 300px;
        }

        .msgBoxContent {
            width: 100% !important;
        }

        .msgError {
            background-color: yellow;
        }

        .div.msgBoxImage {
            margin: 5px 5px 0 5px;
            display: inline-block;
            float: left;
            height: 75px;
            width: 75px;
        }

        #divOtherInfo label {
            display: inline !important;
        }

        p {
            color: #000000 !important;
            font-family: Arial !important;
        }

        .modalBackground {
            background-color: #000;
            filter: alpha(opacity=90);
            opacity: 0.6;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 10000;
            height: 1000%;
        }

        #progressbar12 {
            width: 300px;
            height: 14px;
            background-color: #00aeff;
            filter: progid:DXImageTransform.Microsoft.gradient(GradientType=1,startColorstr=#00aeff, endColorstr=#ff0000);
            background-image: -moz-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -webkit-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -o-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -ms-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -webkit-gradient(linear, left bottom, right bottom, color-stop(40%,#00aeff), color-stop(80%,#ff0000),color-stop(100%,#2fff00));
        }

        .text-danger {
            color: maroon !important;
            font-size: 20px;
            font-family: Arial;
        }

        .form-controlTemp {
            background: none repeat scroll 0 0 #fff;
            border: 1px solid #cdcdcd !important;
            border-radius: 0;
            box-shadow: 0 0 0;
            color: #333;
            padding: 3px 5px !important;
            display: block;
            width: 100%;
            height: 34px;
            font-size: 14px;
            line-height: 1.42857143;
        }

        #g207 {
            position: fixed !important;
            position: absolute;
            top: 0;
            top: expression ((t=document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop)+"px");
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #fff;
            opacity: 0.9;
            filter: alpha(opacity=90);
            display: block;
        }

            #g207 p {
                opacity: 1;
                filter: none;
                font: bold 24px Verdana,Arial,sans-serif;
                text-align: center;
                margin: 20% 0;
            }

                #g207 p a, #g207 p i {
                    font-size: 12px;
                }

        .pleft25 {
            padding-left: 25px;
        }
    </style>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="g207" style="display: none; z-index: 1000;">
        <p>
            Please Wait a Moment...<br>
            <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br>
            Submitting Your Application...
        </p>
    </div>
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 311px;">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="form-heading">
                            <span class="col-lg-12 p0" style="font-size: 23px;text-transform:capitalize !important"><i class="fa fa-pencil-square-o"></i>
                                Application form for appearing in Entrance Examination for Ph.D Programme-2022
                            </span>
                            <span class="clearfix"></span>
                        </h2>
                    </div>
                </div>
                <%----Steps-----%>
                <uc1:PGPhDSteps runat="server" ID="PGPhDSteps" />
                <div class="row">
                    <div class="col-md-12 box-container" id="">
                        <div class="box-heading">
                            <h4 class="box-title">Instruction to Fill the Form 
                                <span class="col-md-6 pull-right" style="font-style: normal; cursor: pointer; font-size: 12px; text-align: right; padding: 0;" onclick="ckhInfo();">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 15px;" title="Information">&nbsp;&nbsp;</i><span id="lblInfo">Hide</span>&nbsp;&nbsp;<i class="fa fa-eye"></i></span><span class="clearfix"></span>
                            </h4>
                        </div>
                        <div class="box-body box-body-open" id="divInfo">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <p class="text-justify" style="line-height: 25px;">
                                    <span id="spnINnfo" style="margin-bottom: 5px;">
                                        
                                        
                                        <br />
                                        <b>Dear Applicant</b>, 
                                        <br />
                                        Before proceeding, please read the university ordinance for Admission in Ph.D. courses and keep below list ready & accessible
                                        <br />

                                        <br />
                                        <b>Eligibility for registration for degree of Doctor of Philosophy</b>

<br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;The following candidates are eligible to seek admission in the Ph.D. program:

<br/><p style="margin: 0 15px;">Master’s degree / M.Phil. holders with at least 55% marks in aggregate or its equivalent grade ‘B’ in the UGC 7-point scale (or an equivalent grade in a point scale wherever grading system is followed) and successfully completing the Master’s degree shall be eligible for Ph.D.</p>
<br/><p style="margin: 0 15px;">Minimum qualification for admission to the first year Ph.D. in Engineering Stream shall be M.E./M.Tech. in appropriate branch with at least 60% marks aggregate or its equivalent CGPA from any recognized university/institutions/technical university/Deemed University or any other qualification as recommended by UGC/AICTE for a particular course.</p>
<br/><p style="margin: 0 15px;">Candidates possessing a degree considered equivalent to Master’s / M.Phil. of an Indian Institution, from a Foreign Educational Institution recognized or authorized by an authority, established or incorporated under a law in its home country or any other standard statuary authority in their country, shall be eligible for admission to Ph.D. program.</p>
<br/><p style="margin: 0 15px;">A relaxation of 5% marks for 55% to 50% or an equivalent relaxation of grade maybe allowed for those belonging to SC/ST/OBC (non-creamy layer) /differently-abled and other categories of candidates as per the decision of the commission from time to time.</p>
                                        <br />
<b>The requirements of entrance test is relaxed for</b>
                                        <br />
<p style="margin: 0 15px;">i. Candidates with valid score card of UGC/CSIR NET (including JRF) examination, SLET, GATE or GPAT.</p>
<p style="margin: 0 15px;">ii. Candidates possessing M.Phil. degree through a regular programme from a University, a deemed university or any other university incorporated by any law for the time being in force and recognized by the university.</p>
<p style="margin: 0 15px;">iii. Teacher fellowship holder and University/College teachers holding a regular position (regular appointment) and has completed two years of service as teacher in a department of the University/affiliated college/Institution.</p>
<p style="margin: 0 15px;">iv. Scientist of State/National/International Govt. Institutions/R&amp;D Laboratories having at least three (3) years of research experience and relevant publications.</p>
<p style="margin: 0 15px;">V. Candidates having fifteen(15) years of industrial/field experience</p>
                                        
                                        <br />
                                        <br />
                                        <b>Prerequisite before filling the Application Form</b>  
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>1.	Prerequisite </b>– 
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.	Applicant should be greater than 23 years (as on 31-07-2022)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.	Must have cleared Post Graduation or Master Degree
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>2.	Application </b>will complete in 4 Stage, applicant can complete each stage in one session or in separate session (session i.e login)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.	Mobile No Validation & Password word Creation and upload photograph & signature and fill the Application and accept the declaration
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.	Attaching necessary Document 
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c.	Payment – online mode
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.	Acknowledgement of Filled form
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>3.	Mobile No. </b>
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.	Applicant must possess their own mobile no.
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.	Mobile no will be used as User Id to login into the application
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c.	Only one form can be fill against one mobile no.
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>4.	Photograph & Signature</b> (as softcopy) in JPG or JPEG format size between 20KB to 50KB
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.	Recent Passport size Photograph of the applicant  size between 150px X 200px (face should be clearly visibile)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.	Signature of the applicant dully scanned 150px X 100px (should be prominant)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>5.	Document </b>– necessary document need to upload in PDF or JPG format size between 20KB to 100KB (visibility of the document must be readable and clear)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.	Age Proof document - 10th Certificate mentioning Date of Birth 
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.	Proof of Differently Abled Person (PwD) if want to avail relaxation - Certificate Authorized by State or Central Government
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c.	Result of Post Graduation 
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.	If wants to avail Exemption in Entrance then proper document must be uploaded (please read para 4 in Ordinance)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>6.	Application fees</b> is Rs.2000.00 and need to be paid through online mode only

                                        <br />
                                    </span>
                                </p>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        <%--<uc1:ServiceInformation runat="server" ID="ServiceInformation" />--%>
                    </div>
                </div>

                
                

                
                <div class="row">
                    <div class="col-md-12 box-container">

                        <%----Start of MobileValidation-----%>

                        <div class="row" id="divSearch" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Mobile Number Authentication / Registration
                                    </h4>
                                </div>

                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                        <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10 mb10" id="divCredential">
                                            <span style="font-weight: bold; margin-bottom: 5px">Instruction:</span><br />
                                            <span>Before filling the APPLICATION, you need to authenticate your mobile number.</span>
                                            <br />
                                            <span>Please enter valid mobile number, as all the communications shall be made on the regisered mobile number.
                                                <br />
                                                <b style="color: red">MOBILE No. will be Login ID for the Applicant</b>
                                                <br />
                                                OTP authentication code shall be SMS to validate the mobile number.</span>

                                        </div>
                                        <div class="alert alert-success" id="divMsg">
                                            <b>
                                                <p class="text-justify" id="divMsgTitle" style="">
                                                </p>
                                            </b>
                                            <p class="text-justify" id="divMsgDtls">
                                            </p>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtMobile">
                                                        Applicant Mobile No.</label>
                                                    <input class="form-control" id="txtMobile" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" value="" maxlength="10" title="Please enter valid Mobile No" onkeypress="return isNumberKey(event);" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                                <div class="form-group">
                                                    <label class="" for="">
                                                        &nbsp;
                                                    </label>
                                                    <input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." onclick="ValidateUserM();" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divOTP">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtSMSCode">
                                                        OTP Verification Code</label>
                                                    <input class="form-control" id="txtSMSCode" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);"
                                                        autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divbtnOTP">
                                                <div class="form-group">
                                                    <label class="" for="">
                                                        &nbsp;
                                                    </label>
                                                    <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Verify OTP Code" onclick="fnValidateOUATOTP();" />
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-----End of MobileValidation------%>

                        <%----Start of Login Credential-----%>
                        <div class="row" id="divLogin" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Applicant Login Details
                                    </h4>
                                </div>

                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                        <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10 mb10" id="">
                                            <span style="font-weight: bold; margin-bottom: 5px">Password must include:</span><br />
                                            <span>1. Minimum of Eight (8) character<br />
                                                2. One character must be in CAPS (Capital Alphabet A-Z)<br />
                                                3. One character must be in Numeric&nbsp;(0-9) and<br />
                                                4. One character must be special character (!@#$%^&amp;*)
                                            </span>
                                        </div>
                                        <div class="alert alert-success" id="divMsg1">
                                            <p class="text-justify" id="divMsgTitle1" style="font-weight: bold">
                                            </p>
                                            <p class="text-justify" id="divMsgDtls1">
                                            </p>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtUserID">
                                                        Login Id
                                                    </label>
                                                    <input id="txtUserID" class="form-control" name="txtUserID" type="text" disabled="disabled" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtPassword">
                                                        Password
                                                    </label>
                                                    <input id="txtPassword" class="form-control" name="txtPassword" placeholder="Enter Password" type="password" value="" maxlength="20"
                                                        autocomplete="off" autofocus ncopy="return false;" oncut="return false;" onpaste="return false;" onchange="javascript:return pwdStrength(this);"  />
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtConfirm">
                                                        Confirm Password
                                                    </label>
                                                    <input class="form-control" id="txtConfirm" name="txtConfirm" type="password" placeholder="Confirm Password" value="" maxlength="20" onchange="fnCompairPassword();"
                                                        oncopy="return false;" oncut="return false;"
                                                        onpaste="return false;" onchange="javascript:return repass(document.getElementById('txtPassword'), this);" autocomplete="off" />
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-----End of Login Credential------%>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title manadatory">Entrance Test Exemption</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-5 ptop20">
                                    <p>
                                        <span id="lblEntrance" class="manadatory"><b>Want to get Exempted from Entrance?</b> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>
                                            <input type="radio" name="Exemption" id="rbtnEntY" value="Yes" onclick="return fuShowHideDiv('divExempted', 1);" />Yes</span>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>
                                            <input type="radio" name="Exemption" id="rbtnEntN" value="No" onclick="return fuShowHideDiv('divExempted', 0);" />No</span>
                                    </p>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                    <div class="col-xs-6 pleft0">
                                        <label for="rbtnReservedY"></label>
                                    </div>
                                    <div class="col-xs-6">
                                        <label for="rbtnReservedN"></label>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-7" id="divExempted">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlExempted">Relaxtion of Test Exemption</label>
                                        <select name="" id="ddlExempted" class="form-control" onchange="fnEntranceExempted();">
                                            <option value="0">-Select Category in which Extrance Test will be Relaxed-</option>
                                            <option value="EX001">Candidate with valid score card of UFC/CSIR NET (including JFR) examination, SLET, GATE or GPAT</option>
                                            <option value="EX002">Candidate posses M.Phil. degree through a regular programme from a Univeristy, a deemed university or any other university incorporated by any law for the time being force and recognised by the university.</option>
                                            <option value="EX003">Teacher fellowship holder and University/College teacher holding a regular position (regular appointment) and has completed two years of service as teacher in a department of the University/affiliated College/Institution.</option>
                                            <option value="EX004">Scientist of State/National/International Govt. Institutions /R&D Laboratories having at least three (3) years of research experience and relevant publications.</option>
                                            <option value="EX005">Teacher fellowship holder from Government Engineering College/Government polytechnic College and has completed two years of service as teacher in a department of the University/affiliated College/Institution.</option>
                                            <option value="EX006">Candidates having fifteen(15) years of industrial/field experience.</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pleft0 pright0" style="">
                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Exemption in Entrance Test - please read the section <b>4.5 (i) to 4.5 (iv)</b> mentioned in the ordinance for exempted criteria<span style="color: red;"></span></p>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-lg-12 box-container" id="divExemption">
                        <div class="box-heading">
                            <h4 class="box-title manadatory">Entrance Exemption Details</h4>
                        </div>
                        <div class="box-body box-body-open p0">
                            <div id="divENT" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="">
                                <div class="form-group" style="margin-bottom: 0;">
                                    <div class="table-responsive">
                                        <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <td colspan="5" style="background-color: #37495f;border:1px solid #37495f;" class="auto-style1">Qualifying Entrance Details (for getting Exemption from Entrance Test)</td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <th style="width: 15%;" class="manadatory">Qualified Entrance (select)</th>
                                                    <th style="width: 10%;" class="manadatory">Qualifying Year
                                                    </th>

                                                    <th style="width: 10%;" class="manadatory">
                                                        Percentage Secured
                                                    </th>
                                                    <th style="width: 10%;" class="manadatory">
                                                        Valid Til (year)
                                                    </th>
                                                    <th style="width: 15%;">
                                                        Details
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select name="" id="ddlEntrance" class="form-control" onchange="fnValidateEntrance();">
                                                            <option value="0">-Select Qualified Entrance-</option>
                                                            <option value="CSIR">UGC/CSIR Examination</option>
                                                            <option value="JRF">JRF Examination</option>
                                                            <option value="NET">NET Examination</option>
                                                            <option value="SLET">SLET Examination</option>
                                                            <option value="GATE">GATE Examination</option>
                                                            <option value="GPAT">GPAT Examination</option>
                                                        </select></td>
                                                    <td>
                                                        <input id="txtCETYear" class="form-control" placeholder="Qualifying Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);" />
                                                    </td>
                                                    <td>
                                                        <input id="txtCETPercentage" class="form-control" placeholder="% Secured" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateMark(this);"/>
                                                    </td>
                                                    <td>
                                                        <input id="txtCETValid" class="form-control" placeholder="Validity Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" />
                                                    </td>
                                                    <td>
                                                        <input id="txtCETDetail" class="form-control" placeholder="Details" name="" type="text" maxlength="50" />
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-lg-12">
                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>As per Ordianance section <b>4.5 (i)</b> you need to upload valid Score Card</p>
                                    </div>
                                </div>
                            </div>

                            <div id="divMPhil" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="">
                                <div class="form-group" style="margin-bottom: 0;">
                                    <div class="table-responsive">
                                        <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr style="color:#fff">
                                                    <td colspan="4" style="background-color: #37495f;border:1px solid #37495f;">MPhil Course Details (for getting Exemption from Entrance)</td>
                                                    <td colspan="2" style="background-color: #37495f;border:1px solid #37495f;" ></td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <th colspan="2" style="width: 5%;">
                                                        Duration</th>
                                                    <th style="width: 10%;" rowspan="2">Mode of Education</th>

                                                    <th style="width: 15%;" rowspan="2">Course Detail
                                                    </th>

                                                    <th style="width: 15%;" rowspan="2">
                                                        University
                                                        / Institute</th>
                                                    <th style="width: 15%;" rowspan="2">
                                                        Details
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 7%;">From Year</th>
                                                    <th style="width: 7%;">To Year</th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtMPhilFrom" class="form-control" placeholder="From Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);"/></td>
                                                    <td>
                                                        <input id="txtMPhilTo" class="form-control" placeholder="To Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);"/></td>
                                                    <td>
                                                        <select name="" id="ddlMode" class="form-control" onchange="ValidateMPhilMode();">
                                                            <option value="0">-Select Education Mode-</option>
                                                            <option value="R">Regular</option>
                                                            <option value="C">correspondence</option>
                                                            <option value="D">Distance</option>
                                                        </select></td>
                                                    <td>
                                                        <input id="txtMPhilCourse" class="form-control" placeholder="Name of Course" name="" type="text" maxlength="50" />
                                                    </td>
                                                    <td>
                                                        <input id="txtMPhilUniv" class="form-control" placeholder="Name of the University" name="" type="text" maxlength="25" />
                                                    </td>
                                                    <td>
                                                        <input id="txtMPhilDetail" class="form-control" placeholder="Details" name="" type="text" />
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-lg-12">
                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>As per Ordianance section <b>4.5 (ii)</b> you need to upload valid MPhil Certificate</p>
                                        <p id="lblMphilMode" style="display:none;" class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>As per Ordianance section <b>4.5 (ii)</b> MPhil with Distance / Correspondance Education Mode are not eligible for Exemption from Entrance Test</p>
                                    </div>
                                </div>
                            </div>

                            <div id="divFellowship" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="">
                                <div class="form-group" style="margin-bottom: 0;">
                                    <div class="table-responsive">
                                        <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr style="color:#fff">
                                                    <td colspan="5" style="background-color: #37495f;border:1px solid #37495f;">Fellowship Details (for getting Exemption from Entrance Test)</td>
                                                    <td colspan="3" style="background-color: #37495f;border:1px solid #37495f;text-align:right;color: #fff;">
                                                        <i class="fa fa-hand-o-up" style="padding: 4px 5px 0 5px;  "></i><span style="line-height: 18px; padding-top: 3px;"><a href="https://csvtu.ac.in/ew/seniority-list/" target="_blank" style="color: #fff; cursor:pointer;">Check CSVTU - Seniority List as on 01-07-2020</a></span>
                                                        </td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <th colspan="2" style="width: 5%;">
                                                        <span>Duration of Fellowship</span></th>
                                                    <th style="width: 10%;" rowspan="2">Name of the College where Fellowship was pursued</th>

                                                    <th style="width: 10%;" rowspan="2"class="manadatory">
                                                        Name of University
                                                        / Institute
                                                    </th>

                                                    <th style="width: 15%;" rowspan="2"class="manadatory" colspan="3">
                                                        CSVTU, Bhilai Updated Seniority List Serial No. with Year
                                                        <br />
                                                        (latest updated as on 01-07-2020)</th>

                                                    <th style="width: 12%;" rowspan="2"class="manadatory">
                                                        Post</th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 7%;">From Year</th>
                                                    <th style="width: 7%;">To Year</th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtFellowFrom" class="form-control" placeholder="From Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);" /></td>
                                                    <td>
                                                        <input id="txtFellowTo" class="form-control" placeholder="To Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);" /></td>
                                                    <td>
                                                        <input id="txtFellowCollege" class="form-control" placeholder="Name of College" name="" type="text" maxlength="50" />
                                                    </td>
                                                    <td>
                                                        <input id="txtFellowUniv" class="form-control" placeholder="Name of the University" name="" type="text" maxlength="25" />
                                                    </td>
                                                    <td style="width: 7%;" colspan="2">
                                                        <select name="" id="ddlSerYear" class="form-control" ">
                                                            <option value="0">-Year-</option>
                                                            <option value="2021">2021</option>
                                                            <option value="2022">2022</option>
                                                        </select></td>
                                                    <td style="width: 10%;">
                                                        <input id="txtSeniorityNo" class="form-control" placeholder="Fellowship Seniority No" name="" type="text" maxlength="5" onkeypress="return isNumberKey(event);"/></td>
                                                    <td>
                                                        <input id="txtFellowPost" class="form-control" placeholder="Post" name="" type="text" /></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-lg-12">
                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>As per Ordianance section <b>4.5 (iii)</b> you need to upload valid Fellowship Certificate</p>
                                        <p id="lblStatute" class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>As per Statute-19, University ratification Dated 10-05-2010 <b>Teacher Fellowship completion year must be 2 years and above</b> for getting Exempted from Entrance Test</p>
                                        <p id="lblFelloshipNo" class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i><a href="https://csvtu.ac.in/ew/seniority-list/" target="_blank" style="color: #000; cursor:pointer;">Enter the Updated Serial No. of Teacher Fellowship / Seniority List as on 01-07-2020 to avail the Exemption from Entrance Test</a> </p>
                                    </div>
                                </div>
                            </div>

                            <div id="divResearch" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="">
                                <div class="form-group" style="margin-bottom: 0;">
                                    <div class="table-responsive">
                                        <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <td colspan="6" style="background-color: #37495f;border:1px solid #37495f;" class="auto-style1">Detail of Research Experiance (for getting Exemption from Entrance Test)</td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <th colspan="2" style="width: 15%;">
                                                        <span>Duration of </span>Research</th>
                                                    <th style="width: 20%;" rowspan="2">Name of the 
                                                Labrotories where Research was pursued</th>

                                                    <th style="width: 20%;" rowspan="2">
                                                        <label>Name of Organisation / Institute</label>
                                                    </th>
                                                    <th style="width: 15%;" rowspan="2">
                                                        Post</th>
                                                    <th style="width: 15%;" rowspan="2">
                                                        <label>Nature</label>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 7%;">From Year</th>
                                                    <th style="width: 7%;">To Year</th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtResearchFrom" class="form-control" placeholder="From Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);" /></td>
                                                    <td>
                                                        <input id="txtResearchTo" class="form-control" placeholder="To Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);" /></td>
                                                    <td>
                                                        <input id="txtLaboratry" class="form-control" placeholder="Name of Laboratories" name="" type="text" maxlength="50" />
                                                    </td>
                                                    <td>
                                                        <input id="txtResearchOrg" class="form-control" placeholder="Name of Organisation" name="" type="text" maxlength="25" />
                                                    </td>
                                                    <td>
                                                        <input id="txtResearchPost" class="form-control" placeholder="Details" name="" type="text" /></td>
                                                    <td>
                                                        <input id="txtResearchNature" class="form-control" placeholder="Details" name="" type="text" />
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-lg-12">
                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>As per Ordianance section <b>4.5 (iv)</b> you need to upload valid Research Certificate from Authorised Government Department</p>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Programme Details</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlCourseType">Course Type</label>
                                    <select name="" id="ddlCourseType" class="form-control">
                                        <option value="0">-Select-</option>
                                        <option value="1">Full Time</option>
                                        <option value="2">Part Time</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" style="display:none">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlResearch">Research Center</label>
                                    <select name="" id="ddlResearch" class="form-control" onchange="GetDiscipline();">
                                        <option value="0">-Select Research Center-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDiscipline">Discipline</label>
                                    <select id="ddlDiscipline" class="form-control" onchange="GetSpecialization();">
                                        <option value="0">-Select Discipline-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlSpecialization">Specialization</label>
                                    <select id="ddlSpecialization" class="form-control">
                                        <option value="0">-Select Specialization-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div id="divPGApplication" runat="server">
                        <div class="col-lg-9 p0">
                            <div id="divDetails" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Applicant Details</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">Name of Applicant (As per academic record)</label>
                                            <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" maxlength="40" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">Date of Birth <span style="font-size: 9px; white-space: nowrap">(as in X Certificate)</span> <span style="font-size: 11px;"></span></label>
                                            <input id="DOB" class="form-control" placeholder="DOB" name="DOB" maxlength="12" readonly />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 pright0">
                                        <div class="form-group">
                                            <label id="lblAgeAsOn" for="Age">Age as on 31.07.2022</label>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" maxlength="3" readonly="readonly" />
                                            </div>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" maxlength="3" readonly="readonly" />
                                            </div>
                                            <div class="col-xs-4 pleft0 ">
                                                <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" maxlength="3" readonly="readonly" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="MotherName">Mother's Name</label>
                                            <input id="MotherName" class="form-control" placeholder="Mother's Name" name="Mother Name" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">Father's/Husband's Name</label>
                                            <input id="FatherName" class="form-control" placeholder="Father's/Husband's Name" name="Father Name" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                Gender</label>
                                            <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender">
                                                <option value="0">-Select-</option>
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                                <option value="Transgender">Transgender</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="category">Category</label>
                                            <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="Category">
                                                <option value="0">-Select-</option>
                                                <option value="SC">SC</option>
                                                <option value="ST">ST</option>
                                                <option value="OBC">OBC</option>
                                                <option value="GN">General, Unreserved</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="Nationality">Nationality</label>
                                            <select class="form-control" data-val="true" data-val-number="Nationality" id="Nationality" name="Nationality" onchange="GetNRIAddress();">
                                                <option value="Indian">Indian</option>
                                                <option value="Afghan">Afghan</option>
                                                <option value="Albanian">Albanian</option>
                                                <option value="Algerian">Algerian</option>
                                                <option value="American">American</option>
                                                <option value="Andorran">Andorran</option>
                                                <option value="Angolan">Angolan</option>
                                                <option value="Anguillan">Anguillan</option>
                                                <option value="CitizenofAntiguaandBarbuda">Citizen of Antigua and Barbuda</option>
                                                <option value="Argentine">Argentine</option>
                                                <option value="Armenian">Armenian</option>
                                                <option value="Australian">Australian</option>
                                                <option value="Austrian">Austrian</option>
                                                <option value="Azerbaijani">Azerbaijani</option>
                                                <option value="Bahamian">Bahamian</option>
                                                <option value="Bahraini">Bahraini</option>
                                                <option value="Bangladeshi">Bangladeshi</option>
                                                <option value="Barbadian">Barbadian</option>
                                                <option value="Belarusian">Belarusian</option>
                                                <option value="Belgian">Belgian</option>
                                                <option value="Belizean">Belizean</option>
                                                <option value="Beninese">Beninese</option>
                                                <option value="Bermudian">Bermudian</option>
                                                <option value="Bhutanese">Bhutanese</option>
                                                <option value="Bolivian">Bolivian</option>
                                                <option value="CitizenofBosniaandHerzegovina">Citizen of Bosnia and Herzegovina</option>
                                                <option value="Botswanan">Botswanan</option>
                                                <option value="Brazilian">Brazilian</option>
                                                <option value="British">British</option>
                                                <option value="BritishVirginIslander">British Virgin Islander</option>
                                                <option value="Bruneian">Bruneian</option>
                                                <option value="Bulgarian">Bulgarian</option>
                                                <option value="Burkinan">Burkinan</option>
                                                <option value="Burmese">Burmese</option>
                                                <option value="Burundian">Burundian</option>
                                                <option value="Cambodian">Cambodian</option>
                                                <option value="Cameroonian">Cameroonian</option>
                                                <option value="Canadian">Canadian</option>
                                                <option value="CapeVerdean">Cape Verdean</option>
                                                <option value="CaymanIslander">Cayman Islander</option>
                                                <option value="CentralAfrican">Central African</option>
                                                <option value="Chadian">Chadian</option>
                                                <option value="Chilean">Chilean</option>
                                                <option value="Chinese">Chinese</option>
                                                <option value="Colombian">Colombian</option>
                                                <option value="Comoran">Comoran</option>
                                                <option value="Congolese(Congo)">Congolese (Congo)</option>
                                                <option value="Congolese(DRC)">Congolese (DRC)</option>
                                                <option value="CookIslander">Cook Islander</option>
                                                <option value="CostaRican">Costa Rican</option>
                                                <option value="Croatian">Croatian</option>
                                                <option value="Cuban">Cuban</option>
                                                <option value="Cymraes">Cymraes</option>
                                                <option value="Cymro">Cymro</option>
                                                <option value="Cypriot">Cypriot</option>
                                                <option value="Czech">Czech</option>
                                                <option value="Danish">Danish</option>
                                                <option value="Djiboutian">Djiboutian</option>
                                                <option value="Dominican">Dominican</option>
                                                <option value="CitizenoftheDominicanRepublic">Citizen of the Dominican Republic</option>
                                                <option value="Dutch">Dutch</option>
                                                <option value="EastTimorese">East Timorese</option>
                                                <option value="Ecuadorean">Ecuadorean</option>
                                                <option value="Egyptian">Egyptian</option>
                                                <option value="Emirati">Emirati</option>
                                                <option value="English">English</option>
                                                <option value="EquatorialGuinean">Equatorial Guinean</option>
                                                <option value="Eritrean">Eritrean</option>
                                                <option value="Estonian">Estonian</option>
                                                <option value="Ethiopian">Ethiopian</option>
                                                <option value="Faroese">Faroese</option>
                                                <option value="Fijian">Fijian</option>
                                                <option value="Filipino">Filipino</option>
                                                <option value="Finnish">Finnish</option>
                                                <option value="French">French</option>
                                                <option value="Gabonese">Gabonese</option>
                                                <option value="Gambian">Gambian</option>
                                                <option value="Georgian">Georgian</option>
                                                <option value="German">German</option>
                                                <option value="Ghanaian">Ghanaian</option>
                                                <option value="Gibraltarian">Gibraltarian</option>
                                                <option value="Greek">Greek</option>
                                                <option value="Greenlandic">Greenlandic</option>
                                                <option value="Grenadian">Grenadian</option>
                                                <option value="Guamanian">Guamanian</option>
                                                <option value="Guatemalan">Guatemalan</option>
                                                <option value="CitizenofGuinea-Bissau">Citizen of Guinea-Bissau</option>
                                                <option value="Guinean">Guinean</option>
                                                <option value="Guyanese">Guyanese</option>
                                                <option value="Haitian">Haitian</option>
                                                <option value="Honduran">Honduran</option>
                                                <option value="HongKonger">Hong Konger</option>
                                                <option value="Hungarian">Hungarian</option>
                                                <option value="Icelandic">Icelandic</option>
                                                <%--<option selected="selected" value="Indian">Indian</option>--%>
                                                <option value="Indonesian">Indonesian</option>
                                                <option value="Iranian">Iranian</option>
                                                <option value="Iraqi">Iraqi</option>
                                                <option value="Irish">Irish</option>
                                                <option value="Israeli">Israeli</option>
                                                <option value="Italian">Italian</option>
                                                <option value="Ivorian">Ivorian </option>
                                                <option value="Jamaican">Jamaican</option>
                                                <option value="Japanese">Japanese</option>
                                                <option value="Jordanian">Jordanian</option>
                                                <option value="Kazakh">Kazakh</option>
                                                <option value="Kenyan">Kenyan</option>
                                                <option value="Kittitian">Kittitian</option>
                                                <option value="CitizenofKiribati">Citizen of Kiribati</option>
                                                <option value="Kosovan">Kosovan</option>
                                                <option value="Kuwaiti">Kuwaiti</option>
                                                <option value="Kyrgyz">Kyrgyz</option>
                                                <option value="Lao">Lao</option>
                                                <option value="Latvian">Latvian</option>
                                                <option value="Lebanese">Lebanese</option>
                                                <option value="Liberian">Liberian</option>
                                                <option value="Libyan">Libyan</option>
                                                <option value="Liechtenstein">Liechtenstein </option>
                                                <option value="citizenLithuanian">citizen Lithuanian</option>
                                                <option value="Luxembourger">Luxembourger</option>
                                                <option value="Macanese">Macanese</option>
                                                <option value="Macedonian">Macedonian</option>
                                                <option value="Malagasy">Malagasy</option>
                                                <option value="Malawian">Malawian</option>
                                                <option value="Malaysian">Malaysian</option>
                                                <option value="Maldivian">Maldivian</option>
                                                <option value="Malian">Malian</option>
                                                <option value="Maltese">Maltese</option>
                                                <option value="Marshallese">Marshallese</option>
                                                <option value="Martiniquais">Martiniquais</option>
                                                <option value="Mauritanian">Mauritanian</option>
                                                <option value="Mauritian">Mauritian</option>
                                                <option value="Mexican">Mexican</option>
                                                <option value="Micronesian">Micronesian</option>
                                                <option value="Moldovan">Moldovan</option>
                                                <option value="Monegasque">Monegasque</option>
                                                <option value="Mongolian">Mongolian</option>
                                                <option value="Montenegrin">Montenegrin</option>
                                                <option value="Montserratian">Montserratian</option>
                                                <option value="Moroccan">Moroccan</option>
                                                <option value="Mosotho">Mosotho</option>
                                                <option value="Mozambican">Mozambican</option>
                                                <option value="Namibian">Namibian</option>
                                                <option value="Nauruan">Nauruan</option>
                                                <option value="Nepalese">Nepalese</option>
                                                <option value="NewZealander">New Zealander</option>
                                                <option value="Nicaraguan">Nicaraguan</option>
                                                <option value="Nigerian">Nigerian</option>
                                                <option value="Nigerien">Nigerien</option>
                                                <option value="Niuean">Niuean</option>
                                                <option value="NorthKorean">North Korean</option>
                                                <option value="NorthernIrish">Northern Irish</option>
                                                <option value="Norwegian">Norwegian</option>
                                                <option value="Omani">Omani</option>
                                                <option value="Pakistani">Pakistani</option>
                                                <option value="Palauan">Palauan</option>
                                                <option value="Palestinian">Palestinian</option>
                                                <option value="Panamanian">Panamanian</option>
                                                <option value="PapuaNewGuinean">Papua New Guinean</option>
                                                <option value="Paraguayan">Paraguayan</option>
                                                <option value="Peruvian">Peruvian</option>
                                                <option value="PitcairnIslander">Pitcairn Islander</option>
                                                <option value="Polish">Polish</option>
                                                <option value="Portuguese">Portuguese</option>
                                                <option value="Prydeinig">Prydeinig</option>
                                                <option value="PuertoRican">Puerto Rican</option>
                                                <option value="Qatari">Qatari</option>
                                                <option value="Romanian">Romanian</option>
                                                <option value="Russian">Russian</option>
                                                <option value="Rwandan">Rwandan</option>
                                                <option value="Salvadorean">Salvadorean</option>
                                                <option value="Sammarinese">Sammarinese</option>
                                                <option value="Samoan">Samoan</option>
                                                <option value="SaoTomean">Sao Tomean</option>
                                                <option value="SaudiArabian">Saudi Arabian</option>
                                                <option value="Scottish">Scottish</option>
                                                <option value="Senegalese">Senegalese</option>
                                                <option value="Serbian">Serbian</option>
                                                <option value="CitizenofSeychelles">Citizen of Seychelles</option>
                                                <option value="SierraLeonean">Sierra Leonean</option>
                                                <option value="Singaporean">Singaporean </option>
                                                <option value="Slovak">Slovak</option>
                                                <option value="Slovenian">Slovenian</option>
                                                <option value="SolomonIslander">Solomon Islander</option>
                                                <option value="Somali">Somali</option>
                                                <option value="SouthAfrican">South African</option>
                                                <option value="SouthKorean">South Korean</option>
                                                <option value="SouthSudanese">South Sudanese</option>
                                                <option value="Spanish">Spanish</option>
                                                <option value="SriLankan">Sri Lankan</option>
                                                <option value="StHelenian">St Helenian</option>
                                                <option value="StLucian">St Lucian</option>
                                                <option value="Stateless">Stateless</option>
                                                <option value="Sudanese">Sudanese</option>
                                                <option value="Surinamese">Surinamese</option>
                                                <option value="Swazi">Swazi</option>
                                                <option value="Swedish">Swedish</option>
                                                <option value="Swiss">Swiss</option>
                                                <option value="Syrian">Syrian</option>
                                                <option value="Taiwanese">Taiwanese</option>
                                                <option value="Tajik">Tajik</option>
                                                <option value="Tanzanian">Tanzanian</option>
                                                <option value="Thai">Thai</option>
                                                <option value="Togolese">Togolese</option>
                                                <option value="Tongan">Tongan</option>
                                                <option value="Trinidadian">Trinidadian</option>
                                                <option value="Tristanian">Tristanian</option>
                                                <option value="Tunisian">Tunisian</option>
                                                <option value="Turkish">Turkish</option>
                                                <option value="Turkmen">Turkmen</option>
                                                <option value="TurksandCaicosIslander">Turks and Caicos Islander</option>
                                                <option value="TuvaluanUgandan">TuvaluanUgandan</option>
                                                <option value="Ukrainian">Ukrainian</option>
                                                <option value="Uruguayan">Uruguayan</option>
                                                <option value="Uzbek">Uzbek</option>
                                                <option value="Vaticancitizen">Vatican citizen</option>
                                                <option value="CitizenofVanuatu">Citizen of Vanuatu</option>
                                                <option value="Venezuelan">Venezuelan</option>
                                                <option value="Vietnamese">Vietnamese</option>
                                                <option value="Vincentian">Vincentian</option>
                                                <option value="Wallisian">Wallisian</option>
                                                <option value="Welsh">Welsh</option>
                                                <option value="Yemeni">Yemeni</option>
                                                <option value="Zambian">Zambian</option>
                                                <option value="Zimbabwean">Zimbabwean</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="MobileNo">Mobile Number</label>
                                            <input id="MobileNo" class="form-control" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event); " type="text" autocomplete="off" onchange="MobileValidation('MobileNo');" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label for="EmailID" class="manadatory ">Email ID</label>
                                            <input type="email" id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" maxlength="30" onchange="ValiateEmail();" />
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>

                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title pleft0">Physically Challenged Details</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfohd">
                                                <div class="col-md-9 pleft0">
                                                    <p><span id="lblreservedseat">Are you Physically Challenged Person? <b>(Person with Disability (PwD))</b> </span></p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-6 pleft0">
                                                        <input type="radio" name="Reserved" id="rbtnReservedY" value="Yes" onclick="return fuShowHideDiv('divReserved', 1);" />Yes
                                            <label for="rbtnReservedY"></label>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <input type="radio" name="Reserved" id="rbtnReservedN" value="No" onclick="return fuShowHideDiv('divReserved', 0);" />
                                                        No
                                            <label for="rbtnReservedN"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="clearfix"></div>--%>
                                        <div id="divReserved" class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-8 ptop5 pleft0">
                                                    <p class="ptop10 pleft manadatory" id="lblQuota"><i class="fa fa-arrow-right pright5"></i>In case of physically challenged indicate type of disability</></p>
                                                </div>
                                                <div class="col-md-4 pleft0 pright0">
                                                    <div class="col-xs-12 ptop15 pleft0 pright0">
                                                        <div class="col-xs-4 pleft0 pright0">
                                                            <input type="checkbox" name="DPDDP" id="rbtnOrtho" value="Ortho"/>Ortho
                                                        </div>
                                                        <div class="col-xs-4 pleft0 pright0">
                                                            <input type="checkbox" name="DPDDP" id="rbtnVisual" value="Visual"/>Visual
                                                        </div>
                                                        <div class="col-xs-4 pleft0 pright0">
                                                            <input type="checkbox" name="DPDDP" id="rbtnHearing" value="Hearing"/>Hearing
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-lg-12 othrinfosubhd2 ptop10 pleft0 pright0" id="DivPHNote">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pleft0 pright0" style="">
                                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Self-Attested scan copy of valid certificate from the Medical Board in proof of <b>Physically Disability</b>. <span style="color: red;"></span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-3 p0">
                            <div id="divPhoto" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title manadatory">Applicant Photograph</h4>
                                </div>
                                <div class="box-body box-body-open p0">
                                    <div class="col-lg-12">
                                        <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                                        <input class="camera" id="ApplicantImage" name="Photoupload" type="file" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div id="divSign" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title manadatory">Applicant Signature
                                    </h4>
                                </div>
                                <div class="box-body box-body-open p0">
                                    <div class="col-lg-12">
                                        <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
                                        <input class="camera" id="ApplicantSign" name="Photoupload" type="file" />
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="divAddress" class="">
                            <%-- for NRI Address --%>
                            <div class="col-md-6 box-container mTop15" id="divNRIAddress">
                                <div class="box-heading">
                                    <h4 class="box-title">Permanent Address for NRI Applicant 
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="AddressLine1">Address Line-1 (Care of)</label>
                                                <input name="" type="text" id="NAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                            <div class="form-group">
                                                <label for="AddressLine2">Address Line-2 (Building/Road/Street)</label>
                                                <input name="" type="text" id="NAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="txtCountry">Country</label>
                                                <input name="" type="text" id="txtCountry" class="form-control" placeholder="Country" maxlength="25" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="txtCity">Town / City</label>
                                                <input name="" type="text" id="txtCity" class="form-control" placeholder="City" maxlength="25" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="PIN">Pin Code</label>
                                                <input name="" type="text" id="NPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" onchange="return PinCodeValidation('CPinCode');" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                            <div class="col-md-6 box-container mTop15" id="divPermanent">
                                <div class="box-heading">
                                    <h4 class="box-title">Permanent Address</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="AddressLine1">Address Line-1 (Care of)</label>
                                                <input type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">Address Line-2 (Building)</label>
                                                <input name="" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="" for="RoadStreetName">Road/Street Name</label>
                                                <input name="" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="LandMark">Landmark</label>
                                                <input name="" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="Locality">Locality</label>
                                                <input name="" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">State</label>
                                                <select name="" id="PddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetOUATDistrict();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">District</label>
                                                <select id="PddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." onchange="GetOUATBlock();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Block/Taluka</label>
                                                <select id="PddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." onchange="GetOUATPanchayat();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="text-nowrap">Panchayat/Village/City</label>
                                                <select id="PddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="PIN">Pin Code</label>
                                                <input name="" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6 box-container mTop15" id="divPresent">
                                <div class="box-heading">
                                    <h4 class="box-title">Present Address <span style="font-size: 13px; padding-right: 0">(For correspondence)</span>
                                        <span id="lblCopyAddress" class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                                            <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="javascript: fnCopyAddress(this.checked);" />Same as Permanent Address</span>
                                        <span class="clearfix"></span></h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="AddressLine1">Address Line-1 (Care of)</label>
                                                <input name="" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">Address Line-2 (Building)</label>
                                                <input name="" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="" for="RoadStreetName">Road/Street Name</label>
                                                <input name="" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="LandMark">
                                                    Landmark
                                                </label>
                                                <input name="" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="Locality">
                                                    Locality
                                                </label>
                                                <input name="" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="40" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">State</label>
                                                <select name="" id="CddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetOUATDistrict2();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">District</label>
                                                <select name="" id="CddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." onchange="GetOUATBlock2();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Block/Taluka</label>
                                                <select name="" id="CddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." onchange="GetOUATPanchayat2();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="text-nowrap" for="ddlVillage">Panchayat/Village/City</label>
                                                <select name="" id="CddlVillage" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select panchayat">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="PIN">Pin Code</label>
                                                <input name="" type="text" id="CPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" onchange="return PinCodeValidation('CPinCode');" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                            
                        </div>

                        <%-- Academic Achievements Panel--%>
                        <div class="">
                            <div class="col-lg-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Academic &amp; Professional Achievements</h4>
                                </div>
                                <div class="box-body box-body-open p0">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                                        <div class="form-group" style="margin-bottom: 0;">
                                            <div class="table-responsive">
                                                <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                    <tbody>
                                                        <tr>
                                                            <td style="background-color: #37495f;border:1px solid #37495f; color: #fff; font-size: 15px;" colspan="8">Education Qualification (12th / Graduation / PG)</td>
                                                        </tr>
                                                    </tbody>
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 2%;">Sl.</th>
                                                            <th style="width: 15%;">Educational Qualification</th>
                                                            <th style="width: 15%;">
                                                                <label class="manadatory">Name of the Institute/College (with Address) </label>
                                                            </th>
                                                            <th style="width: 15%;">
                                                                <label class="manadatory">
                                                                    Name of the Board
                                                                    <br />
                                                                    / University</label>
                                                            </th>
                                                            <th style="width: 10%;">
                                                                <span>Discipline
                                                                    <br />
                                                                    / Subject</span></th>
                                                            <th style="width: 5%;">
                                                                <span>Specialization 
                                                                    <br />
                                                                    (if any)</span></th>
                                                            <th style="width: 5%;">
                                                                <label class="manadatory">
                                                                    Passing 
                                                                    <br />
                                                                    Year</label>
                                                            </th>
                                                            <th style="width: 5%;">
                                                                <label class="manadatory">
                                                                    Percentage 
                                                                    <br />
                                                                    of Marks</label>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>1.</td>
                                                            <td>
                                                                <span id="txtEdu12" >Higher Secondary Examination +2 (12th Exam)</span></td>
                                                            <td>
                                                                <textarea rows="2" id="txtInst12" class="form-control" placeholder="Institute/College Name & Address" name="" maxlength="100"></textarea>
                                                            </td>
                                                            <td>
                                                                <textarea rows="2" id="txtBoard12" class="form-control" placeholder="Name of the Board/University" name="" maxlength="100" cols="20"></textarea>
                                                            </td>
                                                            <td>
                                                                <input id="txtSubject12" class="form-control" placeholder="Name of Discipline / Subject" name="" type="text" maxlength="50" /></td>
                                                            <td>
                                                                <input id="txtSpecialization12" class="form-control" placeholder="Specialization" name="" type="text" maxlength="25" /></td>
                                                            <td>
                                                                <input id="txtPassYear12" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" /></td>
                                                            <td>
                                                                <input id="txtPercentage12" class="form-control" placeholder="%" type="text" maxlength="6" onkeypress="return IsNumericDecimal(event);" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>2.</td>
                                                            <td>
                                                                <span>Graduation Examination or +3 Equivalent</span></td>
                                                            <td>
                                                                <textarea rows="2" id="txtInstG" class="form-control" placeholder="Institute/College Name & Address" name="" maxlength="100" cols="20"></textarea></td>
                                                            <td>
                                                                <textarea rows="2" id="txtBoardG" class="form-control" placeholder="Name of the Board/University" name="" maxlength="100" cols="20"></textarea>
                                                            </td>
                                                            <td>
                                                                <input id="txtSubjectG" class="form-control" placeholder="Name of Discipline / Subject" name="" type="text" maxlength="50" /></td>
                                                            <td>
                                                                <input id="txtSpecializationG" class="form-control" placeholder="Specialization" name="" type="text" maxlength="25" /></td>
                                                            <td>
                                                                <input id="txtPassYearG" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" /></td>
                                                            <td>
                                                                <input id="txtPercentageG" class="form-control" placeholder="%" type="text" maxlength="6" onkeypress="return IsNumericDecimal(event);" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>3.</td>
                                                            <td>Master Degree/ Post Graduate / Equivalent</td>
                                                            <td>
                                                                <textarea rows="2" id="txtInstPG" class="form-control" placeholder="Institute/College Name & Address" name="" maxlength="100" cols="20"></textarea></td>
                                                            <td>
                                                                <textarea rows="2" id="txtBoardPG" class="form-control" placeholder="Name of the Board/University" name="" maxlength="100" cols="20"></textarea>
                                                            </td>
                                                            <td>
                                                                <input id="txtSubjectPG" class="form-control" placeholder="Name of Discipline / Subject" name="" type="text" maxlength="50" /></td>
                                                            <td>
                                                                <input id="txtSpecializationPG" class="form-control" placeholder="Specialization" name="" type="text" maxlength="25" /></td>
                                                            <td><input id="txtPassYearPG" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtPercentagePG" class="form-control" placeholder="%" type="text" maxlength="6" onkeypress="return IsNumericDecimal(event);" onchange="return fnValidateMinMark();" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="">
                                        <div class="form-group" style="margin-bottom: 0;">
                                            <div class="table-responsive">
                                                <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                    <tbody>
                                                        <tr>
                                                            <td style="background-color: #37495f;border:1px solid #37495f; color: #fff; font-size: 15px;" colspan="5">UGC/CSIR (JRF)/NET/GATE/SLET/GPAT, other Fellowship Examination Details</td>
                                                        </tr>
                                                    </tbody>
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 5%;">Sl.</th>
                                                            <th style="width: 25%;">
                                                                <label>Name of the Examination</label>
                                                            </th>
                                                            <th style="width: 25%;">
                                                                <label>Examination Discipline</label>
                                                            </th>
                                                            <th style="width: 8%;">
                                                                <label>Year</label>
                                                            </th>
                                                            <th style="width: 8%;">
                                                                <label>Result</label>
                                                            </th>

                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="txtNo" class="form-control" placeholder="Serial No." name="" type="text" maxlength="1" /></td>
                                                            <td>
                                                                <input id="txtExam" class="form-control" placeholder="Name Of Examination" name="" type="text" maxlength="20" />
                                                            </td>
                                                            <td>
                                                                <input id="txtDisc" class="form-control" placeholder="Examination Discipline" name="" type="text" maxlength="20" />
                                                            </td>
                                                            <td>
                                                                <input id="txtYear" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/>
                                                            </td>
                                                            <td>
                                                                <input id="txtResult" class="form-control" placeholder="Result" name="" type="text" maxlength="4" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="txtNo1" class="form-control" placeholder="Serial No." name="" type="text" maxlength="1" /></td>
                                                            <td>
                                                                <input id="txtExam1" class="form-control" placeholder="Name Of Examination" name="" type="text" maxlength="20" />
                                                            </td>
                                                            <td>
                                                                <input id="txtDisc1" class="form-control" placeholder="Examination Discipline" name="" type="text" maxlength="20" />
                                                            </td>
                                                            <td>
                                                                <input id="txtYear1" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/>
                                                            </td>
                                                            <td>
                                                                <input id="txtResult1" class="form-control" placeholder="Result" name="" type="text" maxlength="4" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="txtNo2" class="form-control" placeholder="Serial No." name="" type="text" maxlength="1" /></td>
                                                            <td>
                                                                <input id="txtExam2" class="form-control" placeholder="Name Of Examination" name="" type="text" maxlength="20" />
                                                            </td>
                                                            <td>
                                                                <input id="txtDisc2" class="form-control" placeholder="Examination Discipline" name="" type="text" maxlength="20" />
                                                            </td>
                                                            <td>
                                                                <input id="txtYear2" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/>
                                                            </td>
                                                            <td>
                                                                <input id="txtResult2" class="form-control" placeholder="Result" name="" type="text" maxlength="4" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="txtNo3" class="form-control" placeholder="Serial No." name="" type="text" maxlength="1" /></td>
                                                            <td>
                                                                <input id="txtExam3" class="form-control" placeholder="Name Of Examination" name="" type="text" maxlength="20" />
                                                            </td>
                                                            <td>
                                                                <input id="txtDisc3" class="form-control" placeholder="Examination Discipline" name="" type="text" maxlength="20" />
                                                            </td>
                                                            <td>
                                                                <input id="txtYear3" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/>
                                                            </td>
                                                            <td>
                                                                <input id="txtResult3" class="form-control" placeholder="Result" name="" type="text" maxlength="4" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="">
                                        <div class="form-group" style="margin-bottom: 0;">
                                            <div class="table-responsive">
                                                <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                    <tbody>
                                                        <tr>
                                                            <td colspan="7" style="background-color: #37495f;border:1px solid #37495f; color: #fff; font-size: 15px;">Working/Research Experience/Teaching Experience/Industrial Experience</td>
                                                        </tr>
                                                    </tbody>
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 5%;" rowspan="2">Sl.</th>
                                                            <th colspan="2" style="width: 15%;">
                                                                <span>Duration</span></th>
                                                            <th style="width: 20%;" rowspan="2">
                                                                <span>Employer Details</span>
                                                            </th>

                                                            <th style="width: 10%;" rowspan="2">
                                                                <label>Post</label>
                                                            </th>
                                                            <th style="width: 15%;" rowspan="2">
                                                                <label>Nature of Appointment</label>
                                                            </th>
                                                            <th style="width: 15%;" rowspan="2">
                                                                <label>CSVTU, Bhilai Updated seniority list sr. no. with year</label>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 7%;">From Year</th>
                                                            <th style="width: 7%;">To Year</th>

                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="txtSl" class="form-control" placeholder="Serial No." name="" type="text" maxlength="1" /></td>
                                                            <td>
                                                                <input id="txtFrom" class="form-control" placeholder="From Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtTo" class="form-control" placeholder="To Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtEmployeer" class="form-control" placeholder="Name Of Examination" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <input id="txtPost" class="form-control" placeholder="Post" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <input id="txtAppt" class="form-control" placeholder="Nature of Appointment" name="" type="text" maxlength="25" />
                                                            </td>
                                                            <td>
                                                                <input id="txtList" class="form-control" placeholder="Details" name="" type="text" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="txtSl1" class="form-control" placeholder="Serial No." name="" type="text" maxlength="1" /></td>
                                                            <td>
                                                                <input id="txtFrom1" class="form-control" placeholder="From Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtTo1" class="form-control" placeholder="To Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtEmployeer1" class="form-control" placeholder="Name Of Examination" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <input id="txtPost1" class="form-control" placeholder="Post" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <input id="txtAppt1" class="form-control" placeholder="Nature of Appointment" name="" type="text" maxlength="25" />
                                                            </td>
                                                            <td>
                                                                <input id="txtList1" class="form-control" placeholder="Details" name="" type="text" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="txtSl2" class="form-control" placeholder="Serial No." name="" type="text" maxlength="1" /></td>
                                                            <td>
                                                                <input id="txtFrom2" class="form-control" placeholder="From Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtTo2" class="form-control" placeholder="To Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtEmployeer2" class="form-control" placeholder="Name Of Examination" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <input id="txtPost2" class="form-control" placeholder="Post" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <input id="txtAppt2" class="form-control" placeholder="Nature of Appointment" name="" type="text" maxlength="25" />
                                                            </td>
                                                            <td>
                                                                <input id="txtList2" class="form-control" placeholder="Details" name="" type="text" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="txtSl3" class="form-control" placeholder="Serial No." name="" type="text" maxlength="1" /></td>
                                                            <td>
                                                                <input id="txtFrom3" class="form-control" placeholder="From Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtTo3" class="form-control" placeholder="To Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);"/></td>
                                                            <td>
                                                                <input id="txtEmployeer3" class="form-control" placeholder="Name Of Examination" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <input id="txtPost3" class="form-control" placeholder="Post" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <input id="txtAppt3" class="form-control" placeholder="Nature of Appointment" name="" type="text" maxlength="25" />
                                                            </td>
                                                            <td>
                                                                <input id="txtList3" class="form-control" placeholder="Details" name="" type="text" />
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="">
                                        <div class="form-group" style="margin-bottom: 0;">
                                            <div class="table-responsive">
                                                <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                    <tbody>
                                                        <tr>
                                                            <td colspan="4" style="background-color: #37495f;border:1px solid #37495f; color: #fff; font-size: 15px;">Research papers published (Please provide detail in a separate sheet)</td>
                                                        </tr>
                                                    </tbody>
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 5%;">
                                                                <span>1.</span></th>
                                                            <th style="text-align: left">
                                                                <span>No. of Research Papers published in Journal</span>
                                                            </th>
                                                            <td style="width: 10%;">
                                                                <input id="txtPublished" class="form-control" placeholder="Research Papers presented" name="" type="text" maxlength="2" onkeypress="return isNumberKey(event);"/>
                                                            </td>
                                                            <td style="width: 50%;">
                                                                <input id="txtPublishedDetail" class="form-control" placeholder="Details" name="" type="text" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <span>2.</span></th>
                                                            <th style="text-align: left">
                                                                <span>No. of Research Papers presented in Conference</span>
                                                            </th>
                                                            <td>
                                                                <input id="txtPresented" class="form-control" placeholder="Research Papers presented" name="" type="text" maxlength="2" onkeypress="return isNumberKey(event);"/>
                                                            </td>
                                                            <td>
                                                                <input id="txtPresentedDetail" class="form-control" placeholder="Details" name="" type="text" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="">
                            <div class="col-lg-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Other Information </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                        <div class="form-group mtop5">
                                            <div class="col-lg-12 othrinfohd">
                                                <div class="col-md-9 pleft0">
                                                    <p><span id="lblOtherCourse"><span class="fom-Numbx">1.</span> Are you pursuing any course currently?</span></p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-6 pleft0">
                                                        <input type="radio" name="OtherCourse" id="rbtCourseY" value="Yes" onclick="return fuShowHideDiv('divCourse', 1);" />
                                                        Yes<label for="rbtCourseY"></label>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <input type="radio" name="OtherCourse" id="rbtCourseN" value="No" onclick="return fuShowHideDiv('divCourse', 0);" />
                                                        No<label for="rbtCourseN"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="divCourse" class="form-group" style="display: block;">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <%--<div class="col-md-6 pleft0 ptop10">
                                                    <p class="ptop5 pleft15"><i class="fa fa-arrow-right pright5"></i>Give details of pursuing course</p>
                                                </div>--%>
                                                <div class="col-md-12 pleft0 pright0 ptop15">
                                                    <div class="col-xs-12 pleft0 pright0">

                                        <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <td colspan="7" style="background-color: #37495f;border:1px solid #37495f;" class="auto-style1">Course Detail</td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <th colspan="2" style="width: 5%;">
                                                        Duration</th>
                                                    <th style="width: 10%;" rowspan="2">Mode of Education</th>

                                                    <th style="width: 10%;" rowspan="2">Course Name
                                                    </th>

                                                    <th style="width: 15%;" rowspan="2">
                                                        College / Institute Name</th>

                                                    <th style="width: 15%;" rowspan="2">
                                                        University / Board</th>
                                                    <th style="width: 5%;" rowspan="2">
                                                        Roll No
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 7%;">From Year</th>
                                                    <th style="width: 7%;">To Year</th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtCourseFrom" class="form-control" placeholder="From Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);"/></td>
                                                    <td>
                                                        <input id="txtCourseTo" class="form-control" placeholder="To Year" name="" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="fnValidateYear(this);"/></td>
                                                    <td>
                                                        <select name="" id="ddlCourseMode" class="form-control">
                                                            <option value="0">-Select Education Mode-</option>
                                                            <option value="R">Regular</option>
                                                            <option value="C">correspondence</option>
                                                            <option value="D">Distance</option>
                                                        </select></td>
                                                    <td>
                                                        <input id="txtCourseName" class="form-control" placeholder="Name of Course" name="" type="text" maxlength="50" />
                                                    </td>
                                                    <td>
                                                        <input id="txtCourseCollege" class="form-control" placeholder="Name of College / Institute" name="" type="text" maxlength="50" /></td>
                                                    <td>
                                                        <input id="txtCourseUniversity" class="form-control" placeholder="Name of the University" name="" type="text" maxlength="25" />
                                                    </td>
                                                    <td>
                                                        <input id="txtCourseRollNo" class="form-control" placeholder="Roll No" name="" type="text" />
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>

                                                        <input id="txtCourseDetail" class="form-control" name="txtCourseDetail" placeholder="Details of pursuing course" type="text" style="display:none"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="form-group">
                                                <div class="form-group">
                                                    <div class="col-lg-12 othrinfosubhd2">
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                            <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Please upload the necessary documents as per clause 2.3.2 of prospectus.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div id="SpecialClaim" style="">
                                            <div class="form-group mtop5">
                                                <div class="col-lg-12 othrinfohd">
                                                    <div class="col-md-9 pleft0">
                                                        <p><span id="lblPunishment"><span class="fom-Numbx">2.</span> Whether any disciplinary action has been taken against you? If so, state reasons, the punishment awarded and reference of authority awarding the punishment?</span></p>
                                                    </div>
                                                    <div class="col-md-3 pleft0 pright0">
                                                        <div class="col-xs-6 pleft0">
                                                            <input type="radio" name="Punishment" id="OthrInfo2Y" value="Yes" onclick="return fuShowHideDiv('divPunishment', 1);" />
                                                            Yes<label for="rbtnLeeseY"></label>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <input type="radio" name="Punishment" id="OthrInfo2N" value="No" onclick="return fuShowHideDiv('divPunishment', 0);" />
                                                            No<label for="rbtnLeeseN"></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="divPunishment" class="form-group">
                                                <div class="col-lg-12 othrinfosubhd2">
                                                    <div class="col-md-6 pleft0 ptop10 pright0">
                                                        <p class="ptop5 pleft15"><i class="fa fa-arrow-right"></i>Give details of disciplinary action & punishment awarded.</p>
                                                    </div>

                                                    <div class="col-md-6 pleft0 ptop10 pright0">
                                                        <p class="ptop5 pleft27">
                                                            <input id="txtPunishment" class="form-control" name="" placeholder="Details of disciplinary action & punishment awarded" type="text" />
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                        <div class="">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title manadatory" id="lblDeclaration">
                                        <input type="checkbox" runat="server" id="chkDeclaration" onclick="javascript: Declaration(this.checked);" />Declaration
                                    </h4>
                                </div>
                                <div class="box-body box-body-open" id="divDeclaration">
                                    <div class="col-sm-12 col-md-12 col-lg-12">
                                        <div class="text-danger text-danger-green mt0">
                                            <p class="text-justify">
                                                I <b>
                                                    <span id="lblName" style="text-transform: uppercase;"></span>
                                                </b>, <span id="lblGender" style="font-size: 1.1em;"></span><b><span id="lblPhsclFthrName" style="text-transform: uppercase;"></span></b>
                                                do solemnly affirm that I have not been punished for any act of indiscipline nor I have adopted any unfair means in any examination nor involved myself in any other offense whatsoever. I further solemnly affirm that information furnished by me in this application form are true; and that the certificates and the Photostat copies of the documents I have submitted, are genuine and that I have not concealed any relevant information. I further affirm that if at any stage hereafter it is found that the information and the undertaking furnished by me were not true then:- 
                                                <br />
                                                • My registration be immediately cancelled without any notice.
                                                <br />
                                                • That I shall be liable to refund the scholarship/any financial aid received from the University/any other source during my Ph.D. programme. 
                                                <br />
                                                • That I shall be debarred from future admission in any academic course and employment at this University and if already employed I shall be dismissed without any notice.
                                I shall upload all the necessary document
                                            </p>
                                            <p>
                                                I also solemnly affirm that as per the CSVTU Modified Ordinances I shall not concurrently pursue any other full time
academic course either at this or any other University. If found doing so I shall be liable to the aforesaid actions and punishment.

                                            </p>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">Place :</span>
                                                        <label id="cndidteplce" style="font-weight: bold"></label>
                                                    </b>
                                                        <br />
                                                    </td>

                                                    <td rowspan="2"><span class="pull-right" style="color: #000;"><span id="lblApplicant" style="text-transform: uppercase; float: right; color: #777; padding-right: 50px;"></span>
                                                        <br />
                                                        Signature</span></td>
                                                </tr>
                                                <tr>
                                                    <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">Date : </span>
                                                        <label id="currntdte" style="font-weight: bold"></label>
                                                    </b></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="">
                            <div class="col-md-12 box-container" style="margin-top: 5px;">
                                <div class="box-body box-body-open" style="text-align: center;">
                                    <span style="color: maroon; font-size: 18px; font-weight: bold">Please Recheck The Application Form  Before Submitting. Once Submitted, No Edit Or Correction Shall Be Entertained.</span>
                                    <br /><span style="color: red; font-size: 18px; font-weight: bold">Note:Submit NOC/Declaration at the time of admission.</span>
                                </div>
                            </div>
                        </div>

                        <div class="">
                            <div class="col-md-12 box-container" id="divBtn">
                                <div class="box-body box-body-open" style="text-align: center;">
                                    <input type="button" id="btnSubmit" class="btn btn-success" value="Submit Application" onclick="SubmitData();" />
                                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Cancel" id="btnCancel" class="btn btn-danger" />
                                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnHome" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnLoginID" runat="server" ClientIDMode="Static" />
</asp:Content>
