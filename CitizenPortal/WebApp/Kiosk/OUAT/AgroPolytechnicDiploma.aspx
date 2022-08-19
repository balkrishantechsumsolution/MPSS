<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="AgroPolytechnicDiploma.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.AgroPolytechnicDiploma" %>

<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>
<%@ Register Src="~/WebApp/Control/OUATDeclaration.ascx" TagPrefix="uc1" TagName="OUATDeclaration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>

    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#RecptHasMedal').hide();
            $('#WantClaim').hide();
            $('#applicantEmplyDtl').hide();
            $('#divLang').hide();
            $('#divResi').hide();
            $('#divInstruction').hide();
            $('#divDeclaration').hide();
        

            $('#divEmplyeeCase').hide();

            $('#divAgro').hide();
            $('#divResevation').hide();
            $("#divMarks").hide();
            $("#DivICARCollegeList").hide();
            $("#divPGApplication").hide();

            $("#divWO").hide();
        });

        var bool = 0;
        function ckhInfo() {
            if (bool == 1) {
                bool = 0;
                $('#divInfo').slideDown(500);
            }
            else {
                bool = 1;
                $('#divInfo').slideUp(500);
            }
        }

        function fuShowHideDiv(divID, isTrue) {
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID).show(500);
            }
            if (isTrue == "0") {
                hidedive();
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
                $("#readOdiya").prop('checked', false);
                $("#writeOdiya").prop('checked', false);
                $("#spkOdiya").prop('checked', false);
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
    <script type="text/javascript">
        function OUATDeclaration(chk) {

            debugger;

            if (chk) {
                if ($('#FirstName').val() == "" || $('#FatherName').val() == "") {
                    //alert("Please enter the all the mandatory fields.");
                    alert("Please enter your Full Name, Father Name  to continue.");
                    chkPhysical.checked = false;
                    return false;
                }

                if ($('#CddlDistrict').val() == 0) {
                    alert("Please select Present District to continue.");
                    chkPhysical.checked = false;
                    return false;
                }
                if ($('#ddlGender').val() != '0') {
                    if ($('#ddlGender').val() == "M") {
                        $('#lblGender').text("son of ");
                        $('#lblTitle').text("Mr.");
                    } else if ($('#ddlGender').val() == "F") {
                        $('#lblGender').text("daughter of ");
                        $('#lblTitle').text("Ms.");
                    } else { $('#lblGender').text("transgender of"); $('#lblTitle').text("Mr./Ms."); }
                }
                else {
                    alert("Please, select Gender");
                }

                var name = $('#FirstName').val();
                var fname = $('#FatherName').val();
                var place = $("#CddlDistrict option:selected").text();//$('#CddlDistrict').val();
                //alert(name);
                $("#lblName").text(name);
                $("#lblApplicant").text(name);
                $("#lblNameAadhaar").text(name);
                $("#lblPhsclFthrName").text(fname);
                //$("#lblPhsclDstName").text(fname);
                $("#cndidteplce").text(place);

                $('#btnSubmit').prop('disabled', false);


                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!

                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                var today = dd + '/' + mm + '/' + yyyy;
                $("#currntdte").text(today);
                $('#divDeclaration').show();
            }
            else {
                $("#lblName").text("");
                $("#lblNameAadhaar").text("");
                $("#lblApplicant").text("");
                $("#lblPhsclFthrName").text("");
                $("#lblPhsclDstName").text("");
                $('#btnSubmit').prop('disabled', true);
                $('#divDeclaration').hide();
            }
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
            width: 468px !important;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 311px;">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="form-heading">
                            <span class="col-lg-12 p0" style="font-size: 23px;"><i class="fa fa-pencil-square-o"></i>APPLICATION FORM FOR DIPLOMA IN AGRO-POLYTECHNIC 2017-18</span>
                            <span class="clearfix"></span>
                        </h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 box-container" id="">
                        <div class="box-heading">
                            <h4 class="box-title">Instruction to Fill the Form 
                                <span class="col-md-6 pull-right" style="font-style: normal; cursor: pointer; font-size: 12px; text-align: right; padding: 0;" onclick="ckhInfo();">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 15px;" title="Information">&nbsp;&nbsp;</i>Help&nbsp;&nbsp;<i class="fa fa-hand-o-up"></i></span><span class="clearfix"></span>
                            </h4>
                        </div>
                        <uc1:ServiceInformation runat="server" ID="ServiceInformation" />

                    </div>
                </div>

                <div class="row">
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
                                        OTP authentication code shall be SMS to validate the mobile number.</span>
                                </div>
                                <div class="alert alert-success" id="divMsg" style="display: none;">

                                    <p class="text-justify" id="divMsgTitle" style=""></p>

                                    <p class="text-justify" id="divMsgDtls">
                                    </p>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="lblMobileNo">Applicant Mobile No.</label>
                                            <input class="form-control" id="txtMobile" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" value="" maxlength="10" title="Please enter valid Mobile No" onkeypress="return isNumberKey(event);" onchange="MobileValidation('txtMobile');" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="" for="Village">
                                                &nbsp;
                                            </label>
                                            <input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." onclick="fnGenOTP();" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divOTP">
                                        <div class="form-group">
                                            <label class="manadatory" for="CompanyName">OTP Verification Code</label>
                                            <input class="form-control" id="txtSMSCode" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);" disabled="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divbtnOTP">
                                        <div class="form-group">
                                            <label class="" for="">
                                                &nbsp;
                                            </label>
                                            <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Verify OTP Code" onclick="fnValidateOUATOTP();" disabled="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12 box-container">
                        <div class="box-heading ">
                            <h4 class="box-title manadatory">Aadhaar Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="row">
                                    <div class="form-group col-lg-4">
                                        <select class="form-control" data-val="true" data-val-number="search application" data-val-required="Please select search type" id="ddlSearch" name="Search">
                                            <option value="0">Select Search Type</option>
                                            <option selected="" value="Aadhaar Enrollment Number">Aadhaar Enrollment Number</option>
                                            <option selected="" value="Aadhaar Number">Aadhaar Number</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <input class="form-control" placeholder="Enter 12 digit Aadhaar Number" name="txtAadhaar" type="text" value="" id="UID" maxlength="12" onkeypress="return isNumberKey(event);" onchange="AadhaarValidation('UID');" />
                                    </div>
                                    <%--<div class="form-group col-lg-2 text-left">
                                <input type="submit" name="ctl00$ContentPlaceHolder1$SearchRecord$btnSearch" value="Fetch Data from UID" onclick="return openWindow(1, 2, 'UIDCasteCertificate1');" id="btnSearch" class="btn btn-primary" />
                            </div>--%>
                                    <div id="divNonAadhar" class="form-group col-lg-3 text-right" style="white-space: nowrap; margin-top: 10px; display: none;"><a href="#" onclick="fnNonUID();" title="Click if Aadhaar UID is not available">I don't have Aadhaar No.</a></div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <%--Applicant Details START Here--%>
                    <div class="col-lg-9 p0">
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Applicant Details</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label class="manadatory" for="firstname">Name of the Candidate</label>
                                        <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" maxlength="40" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="MotherName">Mother's Name</label>
                                        <input id="MotherName" class="form-control" placeholder="Mother's Name" name="Mother Name" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">Father's Name</label>
                                        <input id="FatherName" class="form-control" placeholder="Father's Name" name="Father Name" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="DOB">Date of Birth <span style="font-size: 11px;"></span></label>
                                        <input id="DOB" class="form-control" placeholder="DOB" name="DOB" maxlength="12" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 pright0">
                                    <div class="form-group">
                                        <label for="Age">Age as on 31.12.2017</label>
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
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
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
                                        <label class="manadatory" for="Religion">Religion</label>
                                        <select class="form-control" data-val="true" data-val-number="Religion" data-val-required="Please select your Category" id="religion" name="Religion">
                                            <option value="0">-Select-</option>
                                            <option value="Hindu">Hindu</option>
                                            <option value="Jain">Jain</option>
                                            <option value="Sikh">Sikh</option>
                                            <option value="Muslim">Muslim</option>
                                            <option value="Budhist">Budhist</option>
                                            <option value="Christian">Christian</option>
                                            <option value="Other">Other's</option>
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
                                            <option value="GN">General</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtTongue">Marital Status</label>
                                        <select class="form-control" data-val="true" data-val-number="MaritalStatus" id="MaritalStatus" name="MaritalStatus">
                                            <option value="0">-Select-</option>
                                            <option value="Married">Married</option>
                                            <option value="Unmarried">Unmarried</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory">Mother Tongue</label>
                                        <select class="form-control" data-val="true" data-val-number="MotherTongue" name="MotherTongue" id="MotherTongue">
                                            <option value="0">-Select-</option>
                                            <option value="Assamese (Asamiya)">Assamese (Asamiya)</option>
                                            <option value="Bengali (Bangla)">Bengali (Bangla)</option>
                                            <option value="Bodo">Bodo</option>
                                            <option value="Dogri">Dogri</option>
                                            <option value="English">English</option>
                                            <option value="Gujarati">Gujarati</option>
                                            <option value="Hindi">Hindi</option>
                                            <option value="Kannada">Kannada</option>
                                            <option value="Kashmiri">Kashmiri</option>
                                            <option value="Konkani">Konkani</option>
                                            <option value="Maithili">Maithili</option>
                                            <option value="Malayalam">Malayalam</option>
                                            <option value="Marathi">Marathi</option>
                                            <option value="Meitei (Manipuri)">Meitei (Manipuri)</option>
                                            <option value="Nepali">Nepali</option>
                                            <option value="Odia">Odia</option>
                                            <option value="Punjabi">Punjabi</option>
                                            <option value="Sanskrit">Sanskrit</option>
                                            <option value="Santali">Santali</option>
                                            <option value="Sindhi">Sindhi</option>
                                            <option value="Tamil">Tamil</option>
                                            <option value="Telugu">Telugu</option>
                                            <option value="Urdu">Urdu</option>
                                            <option value="Other">Other's</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label for="nationality">Nationality</label>
                                        <select class="form-control" data-val="true" data-val-number="Nationality" id="Nationality" name="Nationality">
                                            <option selected="" value="Indian">Indian</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="MobileNo">Mobile Number</label>
                                        <input id="MobileNo" class="form-control" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event); " type="text" autocomplete="off" onchange="MobileValidation('MobileNo');" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="EmailID">Email ID</label>
                                        <input type="email" id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" maxlength="30" onchange="ValiateEmail();" />
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
                    <%--Applicant Details END Here--%>

                    <%--Applicant Address Details START Here--%>
                    <div id="divAddress" class="row">
                        <div class="col-md-6 box-container mTop15">
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
                                            <label class="manadatory" for="RoadStreetName">Road/Street Name</label>
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
                        <div class="col-md-6 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title">Present Address <span style="font-size: 13px; padding-right: 0">(For correspondence)</span>
                                    <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
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
                                            <label class="manadatory" for="RoadStreetName">Road/Street Name</label>
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
                    <%--Applicant Address Details END Here--%>

                    <div class="row">
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title pleft0">Reservation Quota Details</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                    <div class="form-group">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span id="lblreservedseat"><span class="fom-Numbx">1.</span> {{resourcesData.reservedseat}}</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="ReservedQuota" id="rbtnReservedY" value="Yes" onclick="return fuShowHideDiv('divReserved', 1);" />{{resourcesData.yes}}
                                            <label for="rbtnReservedY"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="ReservedQuota" id="rbtnReservedN" value="No" onclick="return fuShowHideDiv('divReserved', 0);" />
                                                    {{resourcesData.no}}
                                            <label for="rbtnReservedN"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="clearfix"></div>--%>
                                    <div id="divReserved" class="form-group">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-4 pleft0">
                                                <p class="pleft27 manadatory" id="lblQuota"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.seatcategory}}</></p>
                                            </div>
                                            <div class="col-md-8 pleft0 pright0">
                                                <div class="col-xs-12 pleft0 pright0">
                                                    <asp:CheckBoxList ID="CheckBoxList1" runat="Server" RepeatDirection="Vertical" onchange="fnReservationQuota();">
                                                        <asp:ListItem Text="Physically Challenged" Value="203"></asp:ListItem>
                                                        <asp:ListItem Text="GCH(Green Card Holder)" Value="204"></asp:ListItem>

                                                    </asp:CheckBoxList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--StartPhysical Handicap Detail--%>
                                    <div id="divPH">
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfohd">
                                                <div class="col-md-9 pleft0">
                                                    <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Reservation details under Physically Challenged quota</b></span></p>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0 pright0">
                                                    <p class="ptop5 pleft27 manadatory"><i class="fa fa-arrow-right pright "></i>Physical Challenged type?</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0">
                                                        <div class="col-xs-6 pleft0">
                                                            <input type="radio" name="HandicapType" id="rbtnHandicapTypeY" value="Permanent" onclick="return percentdiv('divPCPercent', 1);" />Permanent
                                                        </div>
                                                        <div class="col-xs-6 pleft0">
                                                            <input type="radio" name="HandicapType" id="rbtnHandicapTypeN" value="Temporary" onclick="return percentdiv('divPCPercent', 1);" />Temporary     
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0 pright0">
                                                    <p class="ptop5 pleft27 manadatory"><i class="fa fa-arrow-right pright "></i>Which part of the body is Handicapped?</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0">
                                                        <input id="txtHandicappedPart" class="form-control" name="txtHandicappedPart" type="text" placeholder="Handicapped Body Part" onkeypress="return ValidateAlpha(event);" maxlength="20" autofocus="" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2" id="divPCPercent" runat="server">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27 manadatory"><i class="fa fa-arrow-right pright5"></i>Percentage of Handicapped.</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-3 pleft0 text-right">
                                                        <input id="txtHandiPercent" class="form-control mtop0" placeholder="%" name="txtHandiPercent" value="" maxlength="2" style="text-align: right" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                    <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Handicapped Candidate need to upload <b>Physical Challenged certificate from Competent Medical Authority</b> in attachment page.Please refer <b>Clause no 4.4 OUAT Diploma  in agro Polytechnic Prospectus 2017</b> <span style="color: red;"></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--End Physical Handicap Details--%>
                                    <%--Start GCH Detail--%>
                                    <div class="form-group" id="divGCH">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Reservation details under Green Card Holder (GCH) quota</b></span></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <div class="col-lg-12 othrinfosubhd2">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Green Card Holder candidate needs to upload <b>Scanned copy of GREEN CARD depicting the name of the candidate and his/her parents</b> in attachment page. Please refer <b>Clause 4.4 of OUAT Diplomain in Agro Polytechnic Prospectus - 2017</b> <span style="color: red;">*</span></p>
                                                    </div>
                                                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 text-right" style="display: none">
                                                        <p class="">
                                                            <i class="fa fa-file-pdf-o"></i>
                                                            <input type="button" id="Button2" class="btn-link" runat="server" onclick="javascript: return downloadAnnexure3();" value="Download ANNEXURE-III" />
                                                            <i class="fa fa-download"></i>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--End of GCH Details--%>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="display: none">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Details of Bank Chalan </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 fltleft">
                                    <div class="form-group">
                                        <div class="col-lg-4 pleft0">
                                            <label class="manadatory">
                                                Bank Name <span style="font-size: 11px;"></span>
                                            </label>
                                            <input id="txtBankName" class="form-control" placeholder="Bank Name" maxlength="30" />
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="manadatory" for="WitnessNme2">Issue Date</label>
                                            <input id="txtIssueDate" class="form-control inputbox_bluebdr" maxlength="30" name="" placeholder="Chalan Issue Date" type="text" />
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="manadatory" for="AddWtness2">Branch</label>
                                            <input id="txtBankBranch" class="form-control inputbox_bluebdr" maxlength="50" name="" placeholder="Bank Branch" type="text" />
                                        </div>
                                        <div class="col-xs-6">
                                            <label class="manadatory">Chalan Number</label>
                                            <input id="txtChalanNumber" class="form-control inputbox_bluebdr" maxlength="15" name="" placeholder="Chalan Number" />
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Academic Profile of Applicant
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                                    <div class="form-group" style="margin-bottom: 0;">
                                        <div class="table-responsive">
                                            <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                <tr>
                                                    <td colspan="6" style="background-color: #415670; color: #fff; font-size: 15px;">Educational Qualification of High School Certificate H.S.C/Equivalent (H.S.C)</td>
                                                </tr>
                                                <tbody>
                                                    <tr>
                                                        <th style="width: 25%;">
                                                            <label class="manadatory">Name of the Board/University</label>
                                                        </th>
                                                        <th style="width: 12%;">
                                                            <label class="manadatory">Grade System</label>
                                                        </th>
                                                        <th style="width: 8%;">
                                                            <label class="manadatory">Passing Year</label>
                                                        </th>

                                                        <th style="width: 8%;">
                                                            <label class="manadatory" id="lblHscTotalMarks">Total Marks/CGPA</label>
                                                        </th>
                                                        <th style="width: 8%;">
                                                            <label class="manadatory" id="lblHscMarksGot">Total Marks/CGPA Scored</label>
                                                        </th>
                                                        <th style="width: 8%;">
                                                            <label class="manadatory">Percentage of Marks</label>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="HscName" class="form-control" placeholder="Name Of Board/University" name="" type="text" maxlength="30" onkeypress="return AlphaNumeric(event);" />
                                                        </td>
                                                        <td>
                                                            <select name="HscDivision" id="HscDivision" class="form-control">
                                                                <option value="0">-Select-</option>
                                                                <option value="501">CGPA</option>
                                                                <option value="502">Percentage</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <input id="HscPassingYear" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                        </td>

                                                        <td>
                                                            <input id="HscTotalMarks" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'HscTotalMarks'); " />
                                                        </td>
                                                        <td>
                                                            <input id="HscMarksGot" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'HscMarksGot');" />
                                                        </td>

                                                        <td>
                                                            <input id="HscPercentage" readonly="true" class="form-control" placeholder="%" type="text" maxlength="3" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                                        <div class="form-group" style="margin-bottom: 0;">
                                            <div class="table-responsive">
                                                <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                    <tr>
                                                        <td colspan="6" style="background-color: #415670; color: #fff; font-size: 15px;">Educational Qualification of Higher Secondary Examination +2 Science/Equivalent (excluding extra optional)</td>
                                                    </tr>
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 25%;">
                                                                <label class="manadatory">Name of the Board/University</label>
                                                            </th>
                                                            <th style="width: 12%;">
                                                                <label class="manadatory">Grade System</label>
                                                            </th>
                                                            <th style="width: 8%;">
                                                                <label class="manadatory">Passing Year</label>
                                                            </th>

                                                            <th style="width: 8%;">
                                                                <label class="manadatory" id="lblSscTotalMarks">Total Marks/CGPA</label>
                                                            </th>
                                                            <th style="width: 8%;">
                                                                <label class="manadatory" id="lblSscMarksGot">Total Marks/CGPA Scored</label>
                                                            </th>

                                                            <th style="width: 8%;">
                                                                <label class="manadatory">Percentage of Marks</label>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="SscName" class="form-control" placeholder="Name Of Board/University" name="" type="text" maxlength="30" onkeypress="return AlphaNumeric(event);" />
                                                            </td>
                                                            <td>
                                                                <select name="SscDivision" id="SscDivision" class="form-control">
                                                                    <option value="0">-Select-</option>
                                                                    <%--<option value="501">OGPA</option>--%>
                                                                    <option value="502">Percentage</option>
                                                                </select></td>
                                                            <td>
                                                                <input id="SscPassingYear" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                            </td>
                                                            <td>
                                                                <input id="SscTotalMarks" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'SscTotalMarks'); " />
                                                            </td>
                                                            <td>
                                                                <input id="SscMarksGot" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'SscMarksGot'); " />
                                                            </td>

                                                            <td>
                                                                <input id="SscPercentage" class="form-control" placeholder="%" readonly="true" type="text" maxlength="3" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div id="divDomicileInfo" class="col-md-12 box-container pleft0 pright0">
                        <div class="box-heading">
                            <h4 class="box-title pleft0">Domicile Information
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <div class="form-group">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0 ">
                                            <p>
                                                <span class="dplyflex">
                                                    <span id="isOdia" class="manadatory">Has the Candidate passed Odia as one of the subject in HSC Examination?</span>
                                                </span>
                                            </p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio4" id="Yes" value="Yes" onclick="return fnLanguage('divLang');" />Yes
                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio4" id="No" value="No" onclick="return fnLanguage('divResi');" />No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd2" id="divLang" style="display: none;">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><span id="chkAbility">Ability to read, write and speak Odia langugae</span></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-4 pleft0" style="white-space: nowrap;">
                                                <input type="checkbox" name="readOdiya" id="readOdiya" />Read
                                            </div>
                                            <div class="col-xs-4" style="white-space: nowrap;">
                                                <input type="checkbox" name="writeOdiya" id="writeOdiya" />Write
                                            </div>
                                            <div class="col-xs-4" style="white-space: nowrap;">
                                                <input type="checkbox" name="spkOdiya" id="spkOdiya" />Speak
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd2" id="divResi" style="display: block;">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Residence Type (Need to provide valid document when asked)</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pleft0 pright0 mb10">
                                                <select name="ddlResidence" id="ddlResidence" class="form-control" data-val="true" data-val-number="ddlResidence" data-val-required="Please select Residence Type">
                                                    <option value="0">--Select Residence Type--</option>
                                                    <option value="200">Permanent resident of Odisha.</option>
                                                    <option value="201">Odia candidate residing outside Odisha.</option>
                                                    <option value="202">Outside state Candidate's whose parents are serverving in Odisha</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd2" id="divInstruction" style="display: none;">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                            <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Candidate needs to upload the <b>Domicile Certificate</b> with OUAT Diploma (in attachment page). Please refer <b>Clause no 3.2 OUAT Diploma  in agro Polytechnic Prospectus 2017</b> <span style="color: red;">*</span></p>
                                        </div>
                                    </div>
                                      <div class="row">
                           
                        </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <uc1:OUATDeclaration runat="server" ID="OUATDeclaration" ClientIDMode="Static" />

                    <div class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <span style="color: maroon; font-size: 20px; font-weight: bold">Please Recheck The Application Form  Before Submitting. Once Submitted, No Edit Or Correction Shall Be Entertained.</span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 box-container" id="divBtn">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Register & Proceed" onclick="SubmitData();" />
                                <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Cancel" id="btnCancel" class="btn btn-danger" />
                                <input type="submit" name="ctl00$ContentPlaceHolder1$btnHome" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFUIDData" runat="server" />
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
</asp:Content>
