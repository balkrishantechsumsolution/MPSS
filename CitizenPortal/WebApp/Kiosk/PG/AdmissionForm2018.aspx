<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="AdmissionForm2018.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.PG.AdmissionForm2018" %>

<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../../Scripts/jquery-ui-1.11.4.min.js" type="text/javascript"></script>
    <link href="../../../PortalStyles/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Kiosk/PG/bootbox.min.js"></script>
    <%--<script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>--%>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <%--<script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>--%>
    <script type="text/javascript" src="/WebApp/Kiosk/PG/AdmissionForm.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

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
            debugger;
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID).show(800);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(800);
            }
        }

    </script>
    <style type="text/css">
        .othrinfohd {
            background-color: #ececec !important;
            padding: 10px 12px;
        }

        #divOtherInfo label {
            display: inline !important;
        }

        .othrinfosubhd2 {
            padding-left: 0;
            padding-right: 0;
            background-color: #f4f4f4;
            border-right: 1px solid #e8e8e8;
            border-bottom: 1px solid #e8e8e8;
            border-left: 1px solid #e8e8e8;
            padding-top: 10px;
        }

        .msgBoxContainer {
            height: auto;
            max-height: 400px;
            overflow-y: scroll;
        }

        #AppcntFatherName, #AppcntMotherName {
            text-transform: uppercase;
        }
          #LoadingDiv {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: #000;
            right: 0;
            z-index: 1000;
        }

        #load {
            width: 100%;
            height: 100%;
            position: fixed;
            font-size: 20px;
            padding-top: 420px;
            top: 5px;
            text-align: center;
            color: #fff;
            z-index: 9999;
            background: url("/g2c/img/loading.gif") no-repeat;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-color: rgba(0,0,0,0.5);
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="load">Please Wait While Processing Your Request...</div>
    <!----Modal popup show confirmation/acceptance message in eligibility criteria---->
    <div id="PopupModal" class="modal" data-easein="flipBounceXIn" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>--%>
                    <h4 class="modal-title mdlHd-txt text-center" style="background-color: #dc4444 !important;">Eligibility Criteria </h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12 text-center">
                        <label id="lblMsg"></label>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop15"></div>
                </div>
                <div class="modal-footer" style="text-align: center !important;">
                    <input type="button" id="btnyes" class="btn btn-primary" value="OK" data-dismiss="modal" aria-hidden="true" />
                    <%-- <input type="button" id="btnno" class="btn btn-danger" value="NO" data-dismiss="modal" aria-hidden="true" />--%>
                    <%--<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">
                        Close
                    </button>--%>
                </div>
            </div>
        </div>
    </div>

    <div id="page-wrapper" style="min-height: 367px;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading mtop5" style="text-transform: none;"><i class="fa fa-pencil-square-o fa-fw pright10"></i>Admission Form
                </h2>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container" id="">
                <div class="box-heading">
                    <h4 class="box-title">Instruction to Fill the Form 
                                <span class="col-md-6 pull-right" style="font-style: normal; cursor: pointer; font-size: 12px; text-align: right; padding: 0;" onclick="ckhInfo();">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 15px;" title="Information">&nbsp;&nbsp;</i>Help&nbsp;&nbsp;<i class="fa fa-hand-o-up"></i></span><span class="clearfix"></span>
                    </h4>
                </div>
                <div class="box-body box-body-open" id="divInfo">
                    <uc1:ServiceInformation runat="server" ID="ServiceInformation" />
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <!----Mobile OTP Verification------->
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
                            <span>Please enter valid mobile number, as all the communications shall be made on the registered mobile number.
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
                                    <label class="manadatory" for="lblMobileNo">
                                        Applicant Mobile No.</label>
                                    <input class="form-control" id="txtMobile" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" value="" autofocus="" maxlength="10" title="Please enter valid Mobile No" onkeydown="return isNumberKey(event);" onchange="MobileValidation('txtMobile');" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="" for="Village">
                                        &nbsp;
                                    </label>
                                    <input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." onclick="ValidateUserM();" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divOTP">
                                <div class="form-group">
                                    <label class="manadatory" for="CompanyName">
                                        OTP Verification Code</label>
                                    <input class="form-control" id="txtSMSCode" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divbtnOTP">
                                <div class="form-group">
                                    <label class="" for="">
                                        &nbsp;
                                    </label>
                                    <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Verify OTP Code" onclick="fnValidateOTP();" />
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <!----------End Here----------->
            <div class="clearfix"></div>
            <!--Programme and subject details-->
            <div class="col-md-12 box-container" id="">
                <div class="box-heading">
                    <h4 class="box-title">Select Programme</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label id="lblDegree" class="manadatory">Select Department</label>
                            <select id="ddlDepartment" class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label id="lblCourseType" class="manadatory">Select Course</label>
                            <select id="ddlCourseType" class="form-control" onchange="GetSUProgrammList();">
                                <option value="0">-Select-</option>
                                <option value="Regular">Regular</option>
                                <option value="Self Financing">Self Financing</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="ddlApplication">Select Programme</label>
                            <select name="" id="ddlProgram" class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>


                    <%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" id="divSubject">
                        <div class="form-group">
                            <label id="lblSubject" class="manadatory">Select Subject</label>
                            <select name="ddlAppPref" id="ddlSubject" class="form-control" data-val="true" data-val-number="">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>--%>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!--End Here-->
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 p0">
                <%--<div class="col-md-12 box-container">
                    <div class="box-heading ">
                        <h4 class="box-title manadatory">Aadhaar Details
                        </h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="row">
                                <div class="form-group col-lg-4">
                                    <select class="form-control" data-val="true" data-val-number="search application" data-val-required="Please select search type" id="ddlSearch" name="Search" disabled="">
                                        <option value="0">Select Search Type</option>
                                        <option value="R">Aadhaar Enrollment Number</option>
                                        <option value="U" selected="selected">Aadhaar Number</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-4">
                                    <input class="form-control" placeholder="Enter 12 digit Aadhaar Number" name="txtAadhaar" type="text" value="" />
                                </div>
                                <div class="form-group col-lg-4">
                                    <input class="form-control" placeholder="Enter 14 digit Enrollment Number" name="txtEnrollment" type="text" maxlength="14" />
                                </div>
                                <div class="form-group col-lg-2 text-left">
                                    <input type="submit" value="Fetch Data from UID" id="btnSearch" class="btn btn-primary" style="display: none;" />

                                </div>

                                <div id="divNonAadhar" class="form-group col-lg-3 text-right" style="white-space: nowrap; margin-top: 10px; display: none;"><a href="#">I don't have Aadhaar No.</a></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>--%>
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title" style="padding-top: 8px;">Applicant Details
                        </h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="AppcntFullName">
                                    Name of the Applicant</label>
                                <input id="AppcntFullName" class="form-control" placeholder="Applicant Full Name" name="FirstName" type="text" maxlength="40" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    Date of Birth <span style="font-size: 11px;"></span>
                                </label>
                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" maxlength="12" onkeydown="return false;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 pright0">
                            <div class="form-group">
                                <label for="Age">
                                    Age as on 31.12.2018</label>
                                <div class="col-xs-4 pleft0 pright0">
                                    <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" value="" maxlength="3" readonly="readonly" />
                                </div>
                                <div class="col-xs-4 pleft0 pright0">
                                    <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" value="" maxlength="3" readonly="readonly" />
                                </div>
                                <div class="col-xs-4 pleft0 ">
                                    <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" value="" maxlength="3" readonly="readonly" />
                                </div>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="FatherName">
                                    Father's Name</label>
                                <input id="AppcntFatherName" class="form-control" placeholder="Father's Name" name="Father Name" type="text" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="MotherName">
                                    Mother's Name</label>
                                <input id="AppcntMotherName" class="form-control" placeholder="Mother's Name" name="Mother Name" type="text" maxlength="40" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="FatherOccupation">
                                    Father's Occupation</label>
                                <input id="FatherOccupation" class="form-control" placeholder="Father's Occupation" name="Father's Occupation" type="text" maxlength="140" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="MotherOccupation">
                                    Mother's Occupation</label>
                                <input id="MotherOccupation" class="form-control" placeholder="Mother's Occupation" name="Mother's Occupation" type="text" maxlength="140" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="" for="GuardianName">
                                    Guardian's Name</label>
                                <input id="GuardianName" class="form-control" placeholder="Guardian's Occupation" name="Guardian's Occupation" type="text" maxlength="140" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="" for="GuardianOccupation">
                                    Guardian's Occupation</label>
                                <input id="GuardianOccupation" class="form-control" placeholder="Guardian's Occupation" name="Mother's Occupation" type="text" maxlength="140" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlGender">
                                    Gender</label>
                                <select class="form-control" id="ddlGender" name="Gender" style="">
                                    <option value="0">--Select--</option>
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                    <option value="T">Transgender</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">
                                    Religion</label>
                                <select class="form-control" id="religion" name="Religion">
                                    <option value="Select Religion">Select</option>
                                    <option value="Hindu">Hindu</option>
                                    <option value="Islam">Islam</option>
                                    <option value="Jain">Jain</option>
                                    <option value="Sikh">Sikh</option>
                                    <option value="Christian">Christian</option>
                                    <option value="Budhist">Budhist</option>
                                    <option value="Othr">Other's</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Marital Status</label>
                                <select class="form-control" id="ddlMaritalStatus" name="Category">
                                    <option value="Select">--Select--</option>
                                    <option value="Married">Married</option>
                                    <option value="Unmarried">Unmarried</option>
                                    <option value="Widow">Widow</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Category</label>
                                <select class="form-control" id="category" name="Category">
                                    <option value="Select Category">Select</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                    <option value="SEBC">SEBC</option>
                                    <option value="OBC">OBC</option>
                                    <option value="General">General</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="txtTongue">
                                    Mother Tongue</label>

                                <select class="form-control" id="ddlTongue" name="txtTongue">
                                    <option value="0">--Select--</option>
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
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="nationality">
                                    Nationality</label>
                                <select class="form-control" data-val="true" data-val-number="Nationality" id="nationality" name="Nationality">

                                    <option value="Indian">Indian</option>
                                    <option value="Others">Others</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">
                                    Mobile Number</label>
                                <input type="text" id="MobileNo" class="form-control" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeydown="return isNumberKey(event);" onchange="MobileValidation('txtMobile');" />
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label for="AadhaarNo" class="">
                                    Aadhaar No</label>
                                <input type="text" id="AadhaarNo" class="form-control" placeholder="Aadhaar No" name="Aadhaar No" value="" maxlength="12" onkeydown="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="EmailID" class="manadatory">
                                    Email ID</label>
                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50" onchange="ValiateEmail();" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="UniversityRegNo" class="">
                                    Chhattisgarh Swami Vivekanad Technical University Registration No</label>
                                <input type="text" id="UniversityRegNo" class="form-control" placeholder="University Regd No" name="University Regd No" value="" maxlength="18" />
                            </div>
                        </div>
                        <%--<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label>
                                    Physically Handicapped</label>
                                <select class="form-control">
                                    <option value="Select">Select</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>--%>
                        <div class="col-xs-12" style="display: none;">
                            <p class="ptop10"><i class="fa fa-info-circle pright5" style="color: #000;"></i>University Registration No (for students who passed from this univesity) | For Physically Handicapped (40% Disability, attach Certificate)<span style="color: red;">*</span></p>

                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 pleft0 pright0">
                <div id="divPhoto" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Applicant Photograph
                        </h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                            <input class="camera" id="File1" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
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
                            <input class="camera" id="File2" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div id="divAddress">
                <div class="col-md-6 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Permanent Address
                        </h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="AddressLine1">
                                    Address Line-1 (Care of)
                                </label>
                                <input name="AddressLine1" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="AddressLine2">
                                    Address Line-2 (Building)
                                </label>
                                <input name="AddressLine2" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="" for="RoadStreetName">
                                    Road/Street Name
                                </label>
                                <input name="RoadStreetName" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="LandMark">
                                    Landmark
                                </label>
                                <input name="LandMark" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="" for="Locality">
                                    Locality
                                </label>
                                <input name="" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="ddlState">
                                    State
                                </label>
                                <select name="ddlState" id="PddlState" class="form-control">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="ddlDistrict">
                                    District
                                </label>
                                <select name="ddlDistrict" id="PddlDistrict" class="form-control">
                                    <option value="0">Select District</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="ddlTaluka">
                                    Block/Taluka
                                </label>
                                <select name="ddlTaluka" id="PddlTaluka" class="form-control">
                                    <option value="0">Select Block</option>
                                </select>
                                <input name="txtBlock" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="ddlVillage">
                                    Panchayat/Village/City
                                </label>
                                <select name="ddlVillage" id="PddlVillage" class="form-control">
                                    <option value="0">Select Panchayat</option>
                                </select>
                                <input name="txtPanchayat" type="text" id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="PIN">
                                    Pin Code
                                </label>
                                <input name="Address1PinCode" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeydown="return isNumberKey(event);" onchange="return PinCodeValidation('PPinCode');" />
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
                                <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="javascript: fnCopyAddress(this.checked);" />Same as Permanent Address</span><span class="clearfix">
                                </span>
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="AddressLine1">
                                        Address Line-1 (Care of)
                                    </label>
                                    <input name="AddressLine1" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="AddressLine2">
                                        Address Line-2 (Building)
                                    </label>
                                    <input name="AddressLine2" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="RoadStreetName">
                                        Road/Street Name
                                    </label>
                                    <input name="RoadStreetName" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="LandMark">
                                        Landmark
                                    </label>
                                    <input name="LandMark" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="40" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="" for="Locality">
                                        Locality
                                    </label>
                                    <input name="Locality" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="40" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlState">
                                        State
                                    </label>
                                    <select name="ddlState" id="CddlState" class="form-control">
                                        <option value="0">-Select-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDistrict">
                                        District
                                    </label>
                                    <select name="ddlDistrict" id="CddlDistrict" class="form-control">
                                        <option value="0">Select District</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label for="ddlTaluka">
                                        Block/Taluka
                                    </label>
                                    <select name="ddlTaluka" id="CddlTaluka" class="form-control">
                                        <option value="0">Select Block</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label for="ddlVillage">
                                        Panchayat/Village/City
                                    </label>
                                    <select name="CddlVillage" id="CddlVillage" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select panchayat">
                                        <option value="0">Select Panchayat</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="PIN">
                                        Pin Code
                                    </label>
                                    <input name="PinCode" type="text" id="CPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeydown="return isNumberKey(event);" onchange="return PinCodeValidation('CPinCode');" />
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
            <div class="clearfix"></div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Educational Qualification of High School Certificate (HSC)/Equivalent
                    </h4>
                </div>
                <div class="box-body box-body-open p0">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                        <div class="form-group" style="margin-bottom: 0">
                            <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                <tbody>
                                    <tr>

                                        <th style="width: 200px">
                                            <label class="manadatory">
                                                Name of the Board / Council, State</label></th>
                                        <th style="width: 200px">
                                            <label class="manadatory">
                                                Name of the Examination Passed (HSC &amp; Equivalent)</label>
                                        </th>
                                        <th style="width: 75px;">
                                            <label class="manadatory">
                                                Board Roll No.</label></th>
                                        <th style="width: 75px;">
                                            <label class="manadatory">
                                                Year of Passing</label>
                                        </th>
                                        <%-- <th style="width: 75px;">
                                            <label class="manadatory">
                                                Exam Cleared</label>
                                        </th>--%>
                                        <th style="width: 75px;">
                                            <label class="manadatory">
                                                Division</label>
                                        </th>
                                        <th style="width: 75px;">
                                            <label class="manadatory">
                                                Grade System</label>
                                        </th>
                                        <th style="width: 79px;">
                                            <label class="manadatory" id="lblTotalMarks">
                                                Total Marks</label><small style="font-size: 8px; color: #fff;">(without Optional)</small></th>
                                        <th style="width: 75px;">
                                            <label class="manadatory">
                                                Mark Secured</label></th>
                                        <th style="width: 75px;">
                                            <label>
                                                Percentage (%)</label></th>
                                    </tr>
                                    <tr>

                                        <td>
                                            <select name="ddlBoard" id="ddlBoard" class="form-control">
                                                <option value="0">-Select-</option>
                                                <%--<option value="Odisha Board">Odisha Board</option>--%>
                                                <option value="State Board">State Board</option>
                                                <option value="CBSE Board">CBSE Board</option>
                                                <option value="ICSE Board">ICSE Board</option>
                                                <option value="Other State">Other State</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="txtExmntnName" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" maxlength="30" />
                                        </td>
                                        <td>
                                            <input id="txtRoll10" class="form-control" placeholder="Roll Name" name="txtRoll10" type="text" maxlength="30" /></td>
                                        <td>
                                            <select name="txtPssngYr" id="txtPssngYr" class="form-control">
                                                <option value="0">Select Year</option>
                                                <option value="1960">1960</option>
                                                <option value="1961">1961</option>
                                                <option value="1962">1962</option>
                                                <option value="1963">1963</option>
                                                <option value="1964">1964</option>
                                                <option value="1965">1965</option>
                                                <option value="1966">1966</option>
                                                <option value="1967">1967</option>
                                                <option value="1968">1968</option>
                                                <option value="1969">1969</option>
                                                <option value="1970">1970</option>
                                                <option value="1971">1971</option>
                                                <option value="1972">1972</option>
                                                <option value="1973">1973</option>
                                                <option value="1974">1974</option>
                                                <option value="1975">1975</option>
                                                <option value="1976">1976</option>
                                                <option value="1977">1977</option>
                                                <option value="1978">1978</option>
                                                <option value="1979">1979</option>
                                                <option value="1980">1980</option>
                                                <option value="1981">1981</option>
                                                <option value="1982">1982</option>
                                                <option value="1983">1983</option>
                                                <option value="1984">1984</option>
                                                <option value="1985">1985</option>
                                                <option value="1986">1986</option>
                                                <option value="1987">1987</option>
                                                <option value="1988">1988</option>
                                                <option value="1989">1989</option>
                                                <option value="1998">1998</option>
                                                <option value="1999">1999</option>
                                                <option value="2000">2000</option>
                                                <option value="2001">2001</option>
                                                <option value="2002">2002</option>
                                                <option value="2003">2003</option>
                                                <option value="2004">2004</option>
                                                <option value="2005">2005</option>
                                                <option value="2006">2006</option>
                                                <option value="2007">2007</option>
                                                <option value="2008">2008</option>
                                                <option value="2009">2009</option>
                                                <option value="2010">2010</option>
                                                <option value="2011">2011</option>
                                                <option value="2012">2012</option>
                                                <option value="2013">2013</option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                            </select>
                                        </td>
                                        <td>
                                            <%--<select name="ddlPasstype" id="ddlPasstype" class="form-control">
                                                <option value="0">Select Passing Type</option>
                                                <option value="101">First attempt</option>
                                                <option value="102">Compartmental</option>
                                                <option value="103">Supplementary</option>
                                            </select>--%>
                                            <select name="ddlPasstype" id="ddlPasstype" class="form-control">
                                                <option value="0">Select Division</option>
                                                <option value="1st">1st </option>
                                                <option value="2nd">2nd </option>
                                                <option value="3rd">3rd </option>
                                                <option value="Compartmental">Compartmental</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select name="ddlPctgeCalclte" id="ddlPctgeCalclte" class="form-control">
                                                <option value="0">-Select-</option>
                                                <option value="502">Percentage</option>
                                                <option value="501">CGPA</option>

                                            </select>
                                        </td>
                                        <td>
                                            <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTMarks"
                                                type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'txtTotalMarks');" />
                                        </td>
                                        <td>
                                            <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMkSecure"
                                                type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'txtMarkSecure');" />
                                        </td>
                                        <td>
                                            <input id="txtPercentage" class="form-control" name="txtPrcntge" type="text" maxlength="5" readonly="true" />
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>

                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Education Qualification of Higher Secondary Examination +2 /Equivalent
                    </h4>
                </div>
                <div class="box-body box-body-open" style="">
                    <div class="auto-style1" style="padding: 0px; margin-top: -15px">
                        <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                            <tbody>
                                <tr>

                                    <th style="width: 166px;">
                                        <label class="manadatory">
                                            Name of the Board / Council, State</label></th>
                                    <th style="width: 160px;">
                                        <label class="manadatory">
                                            Name of the Examination Passed (10+2)</label>
                                    </th>
                                    <th style="width: 75px;">
                                        <label>
                                            Board Roll No.</label></th>
                                    <th style="width: 75px;">
                                        <label class="manadatory">
                                            Year of Passing</label>
                                    </th>
                                    <th style="width: 65px;">
                                        <label class="manadatory">
                                            Division
                                        </label>
                                    </th>
                                    <th style="width: 50px;">
                                        <label class="manadatory">
                                            Grade System</label>
                                    </th>
                                    <th style="width: 79px; white-space: normal;">
                                        <label id="lblTotalMarks2">
                                            Total Marks
                                        </label>
                                        <span style="font-size: 8px; color: #fff;">(without Optional)</span></th>
                                    <th style="width: 75px;">
                                        <label class="manadatory">
                                            Mark Secured</label></th>
                                    <th style="width: 75px;">
                                        <label>
                                            Percentage (%)</label></th>

                                </tr>
                                <tr>

                                    <td>
                                        <select name="ddlBoard" id="SSCddlBoard" class="form-control">
                                            <option value="Select">-Select-</option>
                                            <%--<option value="Odisha Board">Odisha Board</option>--%>
                                            <option value="State Board">State Board</option>
                                            <option value="CBSE Board">CBSE Board</option>
                                            <option value="ICSE Board">ICSE Board</option>
                                            <option value="Other State">Other State</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input id="txtExmntnName2" class="form-control" placeholder="Examination Name" name="txtExmntnName2" type="text" value="" maxlength="30" />
                                    </td>
                                    <td style="width: 75px;">
                                        <input id="txtBoardRollNo2" class="form-control" placeholder="Roll of Board" name="txtBoardRollNo2" type="text" maxlength="30"/></td>
                                    <td style="width: 75px;">
                                        <select name="txtPssngYr2" id="txtPssngYr2" class="form-control">
                                                <option value="0">Select Year</option>
                                                <option value="1960">1960</option>
                                                <option value="1961">1961</option>
                                                <option value="1962">1962</option>
                                                <option value="1963">1963</option>
                                                <option value="1964">1964</option>
                                                <option value="1965">1965</option>
                                                <option value="1966">1966</option>
                                                <option value="1967">1967</option>
                                                <option value="1968">1968</option>
                                                <option value="1969">1969</option>
                                                <option value="1970">1970</option>
                                                <option value="1971">1971</option>
                                                <option value="1972">1972</option>
                                                <option value="1973">1973</option>
                                                <option value="1974">1974</option>
                                                <option value="1975">1975</option>
                                                <option value="1976">1976</option>
                                                <option value="1977">1977</option>
                                                <option value="1978">1978</option>
                                                <option value="1979">1979</option>
                                                <option value="1980">1980</option>
                                                <option value="1981">1981</option>
                                                <option value="1982">1982</option>
                                                <option value="1983">1983</option>
                                                <option value="1984">1984</option>
                                                <option value="1985">1985</option>
                                                <option value="1986">1986</option>
                                                <option value="1987">1987</option>
                                                <option value="1988">1988</option>
                                                <option value="1989">1989</option>
                                                <option value="1998">1998</option>
                                                <option value="1999">1999</option>
                                                <option value="2000">2000</option>
                                                <option value="2001">2001</option>
                                                <option value="2002">2002</option>
                                                <option value="2003">2003</option>
                                                <option value="2004">2004</option>
                                                <option value="2005">2005</option>
                                                <option value="2006">2006</option>
                                                <option value="2007">2007</option>
                                                <option value="2008">2008</option>
                                                <option value="2009">2009</option>
                                                <option value="2010">2010</option>
                                                <option value="2011">2011</option>
                                                <option value="2012">2012</option>
                                                <option value="2013">2013</option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                        </select>
                                    </td>
                                    <td style="width: 65px;">
                                        <select name="ddlSSCDivision" id="ddlSSCDivision" class="form-control">
                                            <option value="0">Select Division</option>
                                            <option value="1st">1st </option>
                                            <option value="2nd">2nd </option>
                                            <option value="3rd">3rd </option>
                                            <option value="Compartmental">Compartmental</option>
                                        </select>
                                    </td>
                                    <td style="width: 50px;">
                                        <select name="ddlPctgeCalclte2" id="ddlPctgeCalclte2" class="form-control" style="width: 50px;">
                                            <option value="Select">-Select-</option>
                                            <option value="Percentage">Percentage</option>
                                        </select>
                                    </td>

                                    <td style="width: 79px;">
                                        <input id="txtTotalMarks2" class="form-control" placeholder="Total Marks"
                                            name="txtTotalMarks2" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'txtTotalMarks2');" />
                                    </td>
                                    <td style="width: 75px;">
                                        <input id="txtMarkSecure2" class="form-control" placeholder="Marks Secure"
                                            name="txtMarkSecure2" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'txtMarkSecure2');" />
                                    </td>
                                    <td style="width: 75px;">
                                        <input id="txtPercentage2" class="form-control" name="txtPercentage2" type="text" readonly="true" maxlength="5" />
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="clearfix"></div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title" style="padding-top: 8px;">Education Qualification of Graduation (+3)/Equivalent
                        <span class="pull-right" style="display: block;">
                            <%--Whether Appearing / Passed of Graduation/Equivalent --%>
                            Qualifying Exam Passed
                            <input type="radio" name="RadioBSC" id="rdYes" value="Yes" />
                            Appeared
                            <input type="radio" name="RadioBSC" id="rdNo" value="No" />
                        </span>
                    </h4>
                </div>
                <div class="box-body box-body-open" id="DivBSCTab">
                    <!----------------Message for doc-------------->

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="MsgInfo">
                        <div class="alert alert-danger">
                            <i class="fa fa-hand-o-right"></i>
                            <b><span id="txtMsgInfo"></span></b>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="QualifyingExamDiv">
                        <div class="form-group">
                            <label class="manadatory" for="ddlApplication">Select Qualifying Exam</label>
                            <select name="" id="ddlApplyFor" class="form-control">
                                <option value="0">-Select-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsCourse">
                        <div class="form-group">
                            <label for="">
                                Graduate Under 3 Yrs LL.B. Course
                            </label>
                            <select id="ddlLLM3YrsCourse" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="Honours graduate with LLB">Honours graduate with LLB</option>
                                <option value="Pass Graduate/Equivalent with LLB">Pass Graduate /Equivalent with LLB</option>
                            </select>
                        </div>
                    </div>
                    <%--Other than LLB & MBA--%>
                    <!---------------Only for Honours---------------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="GrdDivHons1">
                        <div class="form-group">
                            <label for="">
                                Total Marks in Honours
                            </label>
                            <input type="text" id="txtMarksHons" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMarksHons');" onchange="return MarksValidate('txtMarksHons', 'txtMarksSecuredHons');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="GrdDivHons2">
                        <div class="form-group">
                            <label for="">
                                Total Secured Marks in Honours
                            </label>
                            <input type="text" id="txtMarksSecuredHons" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMarksSecuredHons');" onchange="return MarksValidate('txtMarksHons', 'txtMarksSecuredHons');" />
                        </div>
                    </div>
                    <!---------------Only for Pass---------------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="GrdDivPass1">
                        <div class="form-group">
                            <label for="">
                                Total Marks in Pass
                            </label>
                            <input type="text" id="txtMarksPass" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMarksPass');" onchange="return MarksValidate('txtMarksPass', 'txtMarksSecuredPass');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="GrdDivPass2">
                        <div class="form-group">
                            <label for="">
                                Total Secured Marks in Pass
                            </label>
                            <input type="text" id="txtMarksSecuredPass" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMarksSecuredPass');" onchange="return MarksValidate('txtMarksPass', 'txtMarksSecuredPass');" />
                        </div>
                    </div>
                    <!--------Self Finacing Work Exp for MBA--------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="WorkExp_MBA">
                        <div class="form-group">
                            <label for="">
                                Work Experience in Year
                            </label>
                            <input type="text" id="txtWorkExp_MBA" class="form-control" placeholder="Work Experience" maxlength="2"
                                onkeypress="return isNumberKeyDecimal(event,'txtWorkExp_MBA');" />
                        </div>
                    </div>
                    <!--------Self Finacing M.Tech Division--------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivMTech_GraduateDivision">
                        <div class="form-group">
                            <label for="">
                                +3 Honours Division
                            </label>
                            <select id="ddlMTechGrdDivision" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                                <option value="2nd Division">2nd Division</option>
                                <option value="3rd Division">3rd Division</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivMTech_MscDivision">
                        <div class="form-group">
                            <label for="">
                                M.Sc. Division
                            </label>
                            <select id="ddlMTechMscDivision" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                                <option value="2nd Division">2nd Division</option>
                                <option value="3rd Division">3rd Division</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivMTech_BTechDivision">
                        <div class="form-group">
                            <label for="">
                                B.E/B.Tech Division
                            </label>
                            <select id="ddlMTechBTechDivision" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Class Hons">1st Class Hons</option>
                                <option value="1st Class">1st Class</option>
                                <option value="2nd Class">2nd Class</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivMTech_PG_RSAndGIS">
                        <div class="form-group">
                            <label for="" id="lblPGDivision">
                                PG Diploma Division
                            </label>
                            <select id="ddlMTech_PG_RSAndGIS" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                                <option value="2nd Division">2nd Division</option>
                                <%--<option value="3rd Division">3rd Division</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivBEBTechBscTotalMark">
                        <div class="form-group">
                            <label for="">
                                Total Marks in Aggregate
                            </label>
                            <input type="text" id="txtBEBTechBscTotalMark" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtBEBTechBscTotalMark');" onchange="return MarksValidate('txtBEBTechBscTotalMark', 'txtBEBTechBscMarkSecure');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivBEBTechBscMarkSecure">
                        <div class="form-group">
                            <label for="">
                                Marks Secured in Aggregate
                            </label>
                            <input type="text" id="txtBEBTechBscMarkSecure" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtBEBTechBscMarkSecure');" onchange="return MarksValidate('txtBEBTechBscTotalMark', 'txtBEBTechBscMarkSecure');" />
                        </div>
                    </div>
                    <!------------Msc Nanoo Science Division---------------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivHonsDivision">
                        <div class="form-group">
                            <label for="">
                                Hons Division
                            </label>
                            <select id="ddlHonsDiv" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                                <option value="2nd Division">2nd Division</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="DivPassDivision">
                        <div class="form-group">
                            <label for="">
                                Pass Division
                            </label>
                            <select id="ddlPassDiv" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Division">1st Division</option>
                            </select>
                        </div>
                    </div>
                    <%--Only for LLB & MBA--%>

                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv5Yrs1">
                        <div class="form-group">
                            <label for="">
                                Total Marks in 5 Yrs.
                            </label>
                            <input type="text" id="txtLLMTotalMarks5Yrs" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLMTotalMarks5Yrss');" onchange="return MarksValidate('txtLLMTotalMarks5Yrs', 'txtLLMmarksSecured5Yrs');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv5Yrs2">
                        <div class="form-group">
                            <label for="">
                                Max.Marks Secured in Aggregate
                            </label>
                            <input type="text" id="txtLLMmarksSecured5Yrs" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLMmarksSecured5Yrs');" onchange="return MarksValidate('txtLLMTotalMarks5Yrs', 'txtLLMmarksSecured5Yrs');" />
                        </div>
                    </div>


                    <%--Only for LLB Graduate with 3 Years--%>

                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsDivision">
                        <div class="form-group">
                            <label for="">
                                Division In Graduation
                            </label>
                            <select id="ddlLLBHonsDivision" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="1st Div">1st Division</option>
                                <option value="2nd Div">2nd Division</option>
                            </select>
                        </div>
                    </div>
                    <!-------LLB Honours---------->
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsHons1">
                        <div class="form-group">
                            <label for="">
                                Total Mark in LLB 
                            </label>
                            <input type="text" id="txtLLBHonsTotalMark" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLBHonsTotalMark');" onchange="return MarksValidate('txtLLBHonsTotalMark', 'txtLLBHonsMarksSecured');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsHons2">
                        <div class="form-group">
                            <label for="">
                                Max. Mark Secured in LLB
                            </label>
                            <input type="text" id="txtLLBHonsMarksSecured" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLBHonsMarksSecured');" onchange="return MarksValidate('txtLLBHonsTotalMark', 'txtLLBHonsMarksSecured');" />
                        </div>
                    </div>
                    <!-------------LLB Pass------------>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsPass1">
                        <div class="form-group">
                            <label for="">
                                Total Mark in LLB 
                            </label>
                            <input type="text" id="txtLLBPassTotalMark" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLBPassTotalMark');" onchange="return MarksValidate('txtLLBPassTotalMark', 'txtLLBPassMarksSecured');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="LLBDiv3YrsPass2">
                        <div class="form-group">
                            <label for="">
                                Max. Mark Secured in LLB
                            </label>
                            <input type="text" id="txtLLBPassMarksSecured" class="form-control" placeholder="Secured Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtLLBPassMarksSecured');" onchange="return MarksValidate('txtLLBPassTotalMark', 'txtLLBPassMarksSecured');" />
                        </div>
                    </div>

                    <%--Only for MBA Students--%>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="MBADivMark">
                        <div class="form-group">
                            <label for="">
                                Total Mark in Grad./equivalent
                            </label>
                            <input type="text" id="txtMBA_GrdTotalMarks" class="form-control" placeholder="Total Marks" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMBA_GrdTotalMarks');" onchange="return MarksValidate('txtMBA_GrdTotalMarks', 'txtMBA_GrdTotalMarksSecure');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="MBADivMarkSecure">
                        <div class="form-group">
                            <label for="">
                                Max. Mark Secured in Graduation 
                            </label>
                            <input type="text" id="txtMBA_GrdTotalMarksSecure" class="form-control" placeholder="Marks Secured" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMBA_GrdTotalMarksSecure');" onchange="return MarksValidate('txtMBA_GrdTotalMarks', 'txtMBA_GrdTotalMarksSecure');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="MBADivMATScore">
                        <div class="form-group">
                            <label for="">
                                MAT Score</label>
                            <input type="text" id="txtMBA_MATScore" class="form-control" placeholder="MAT Secured" maxlength="4"
                                onkeypress="return isNumberKeyDecimal(event,'txtMBA_MATScore');" />
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-1 col-lg-12 p0" style="display: none;">
                        <table cellpadding="0" cellspacing="0" class="table table-bordered" style="width: 100%; margin: 0 auto;">
                            <thead>
                                <tr>
                                    <%-- <th>S.No.</th>--%>
                                    <th>Degree/Diploma</th>
                                    <th>Board/University</th>
                                    <th style="width: 7%;">Max.Marks</th>
                                    <th style="width: 10%;">Marks Secured</th>
                                    <th style="width: 7%;">Grade</th>
                                    <th style="width: 7%;">Division</th>
                                    <th style="width: 10%;">Year of Passing</th>
                                    <th>Main/Optional Subjects Offered</th>
                                    <%--<th>Action</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <%-- <td>1.</td>--%>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Degree/Diploma" id="DegreeDiploma" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Board/University" id="BoardUniversity" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Max.Marks" id="MaxMarks" onkeypress="return isNumberKeyDecimal(event,'txtMarkSecure2');" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Marks Secured" id="MarksSecured" onkeypress="return isNumberKeyDecimal(event,'txtMarkSecure2');" /></td>
                                    <td>
                                        <%--<input type="text" class="form-control" placeholder="Grade" id="Grade" />--%>
                                        <select id="Grade" name="Grade" class="form-control">
                                            <option value="">-Select-</option>
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Division" id="Division" /></td>
                                    <td>
                                        <%--<input type="text" class="form-control" placeholder="DD/MM/YYYY" id="Passyear" />--%>
                                        <select name="txtPssngYr" id="Passyear" class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="1998">1998</option>
                                            <option value="1999">1999</option>
                                            <option value="2000">2000</option>
                                            <option value="2001">2001</option>
                                            <option value="2002">2002</option>
                                            <option value="2003">2003</option>
                                            <option value="2004">2004</option>
                                            <option value="2005">2005</option>
                                            <option value="2006">2006</option>
                                            <option value="2007">2007</option>
                                            <option value="2008">2008</option>
                                            <option value="2009">2009</option>
                                            <option value="2010">2010</option>
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Course Studied" id="MainOptionalSubject" /></td>
                                    <%-- <td>
                                        <input type="button" class="btn btn-primary" value="ADD" />
                                    </td>--%>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="clearfix"></div>
            <%--Experience Details--%>
            <%--<div class="col-md-12 box-container">
                <div class="box-heading ">
                    <h4 class="box-title manadatory">Experience Details
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                        <label class="manadatory">Details of Organisation</label>
                        <input type="text" class="form-control" placeholder="Details of Organisation" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                        <label class="manadatory">Place of Organisation</label>
                        <input type="text" class="form-control" placeholder="Place of Organisation" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <label class="manadatory">Total Experience</label>
                        <input type="text" class="form-control" placeholder="Total Experience" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <label class="manadatory">Designation of the post held</label>
                        <input type="text" class="form-control" placeholder="Designation of the post held" />
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>--%>
            <div class="clearfix"></div>
            <%--Other Information Details--%>
            <div id="divOtherInfo">
                <div class="col-md-12 box-container">
                    <div class="box-heading ">
                        <h4 class="box-title manadatory">Other Information</h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="alert alert-danger">
                                <i class="fa fa-hand-o-right"></i>
                                <b>Except hostel and distinction for all other information if select yes the candidate need to upload relevant document for the same.</b>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-9 pleft0">
                                    <p><span><span class="fom-Numbx">1.</span>   Whether the Candidate is Physically Handicapped? </span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio4" id="PhysHandicapYes" value="yes" onclick="return fuShowHideDiv('PhysHandicapDtl', 1);" />
                                        <label>Yes</label>

                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio4" id="PhysHandicapNo" value="no" onclick="return fuShowHideDiv('PhysHandicapDtl', 0);" />
                                        <label>No</label>

                                    </div>
                                </div>


                            </div>

                            <div class="clearfix"></div>
                            <div id="PhysHandicapDtl" style="display: block;">

                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Type of Handicap</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <input type="text" name="" id="TypeofHandicap" class="form-control" placeholder="" />
                                    </div>

                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Percentage of Disability</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <input type="text" name="" id="DisabilityPercent" class="form-control" placeholder="" maxlength="2" onkeypress="return isNumberKeyDecimal(event,'DisabilityPercent');" />
                                    </div>

                                </div>

                            </div>
                        </div>




                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <div class="col-lg-12 othrinfohd mtop5">
                                <div class="col-md-9 pleft0">
                                    <p><span><span class="fom-Numbx">2.</span>   Whether the parent of candidate are ex-defence personnel? </span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio5" id="ParentExDefenceYes" value="yes" onclick="return fuShowHideDiv('ParentExDefenceDtl', 1);" />
                                        <label>Yes</label>

                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio5" id="ParentExDefenceNo" value="no" onclick="return fuShowHideDiv('ParentExDefenceDtl', 0);" />
                                        <label>No</label>

                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div id="ParentExDefenceDtl" style="display: block;">

                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Name of the Department</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <input type="text" name="" id="NameOfDepartment" class="form-control" placeholder="" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Name of the Post</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <input type="text" name="" id="NameOfPost" class="form-control" placeholder="" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>

                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <div class="col-lg-12 othrinfohd mtop5">
                                <div class="col-md-9 pleft0">
                                    <p><span><span class="fom-Numbx">3.</span>   Whether the candidate played in Inter University & State Tournament approved by National Organisation? </span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio6" id="PlayedTounamentYes" value="yes" onclick="return fuShowHideDiv('PlayedTournamentDtl', 1);" />
                                        <label>Yes</label>

                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio6" id="PlayedTounamentNo" value="no" onclick="return fuShowHideDiv('PlayedTournamentDtl', 0);" />
                                        <label>No</label>

                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div id="PlayedTournamentDtl" style="display: block;">

                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Name of the Tournament</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <input type="text" name="" id="TournamentName" class="form-control" placeholder="" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Year of the Tounament</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <%-- <input type="text" name="" id="TournamentYear" class="form-control" placeholder="" />--%>
                                        <select id="TournamentYear" name="" class="form-control">
                                            <option value="0">Select Year</option>
                                            <option value="1998">1998</option>
                                            <option value="1999">1999</option>
                                            <option value="2000">2000</option>
                                            <option value="2001">2001</option>
                                            <option value="2002">2002</option>
                                            <option value="2003">2003</option>
                                            <option value="2004">2004</option>
                                            <option value="2005">2005</option>
                                            <option value="2006">2006</option>
                                            <option value="2007">2007</option>
                                            <option value="2008">2008</option>
                                            <option value="2009">2009</option>
                                            <option value="2010">2010</option>
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                        </select>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>

                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <div class="col-lg-12 othrinfohd mtop5">
                                <div class="col-md-9 pleft0">
                                    <p><span><span class="fom-Numbx">4.</span> Whether the candidate possesses NCC B Certificate?</span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio7" id="JoinNCCYes" value="yes" onclick="return fuShowHideDiv('HvngCertificateNCCDtl', 1);" />
                                        <label>Yes</label>

                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio7" id="JoinNCCNo" value="no" onclick="return fuShowHideDiv('HvngCertificateNCCDtl', 0);" />
                                        <label>No</label>

                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div id="HvngCertificateNCCDtl" style="display: block;">

                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Passing Year</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <%--<input type="text" name="" id="PassingYear" class="form-control" placeholder="" />--%>
                                        <select id="PassingYear" name="" class="form-control">
                                            <option value="0">Select Year</option>
                                            <option value="1998">1998</option>
                                            <option value="1999">1999</option>
                                            <option value="2000">2000</option>
                                            <option value="2001">2001</option>
                                            <option value="2002">2002</option>
                                            <option value="2003">2003</option>
                                            <option value="2004">2004</option>
                                            <option value="2005">2005</option>
                                            <option value="2006">2006</option>
                                            <option value="2007">2007</option>
                                            <option value="2008">2008</option>
                                            <option value="2009">2009</option>
                                            <option value="2010">2010</option>
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2016">2017</option>
                                            <option value="2016">2018</option>
                                        </select>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Name of the approved authority</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <input type="text" name="" id="authorityName" class="form-control" placeholder="" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>

                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <div class="col-lg-12 othrinfohd mtop5">
                                <div class="col-md-9 pleft0">
                                    <p><span><span class="fom-Numbx">5.</span>   Whether the Candidate is a Kashmiri Migrant? </span></p>
                                </div>
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="radio8" id="KashmirMigrantYes" value="yes" onclick="return fuShowHideDiv('KMigrantDetail', 1);" />
                                        <label for="HsCerfte">Yes</label>

                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="radio8" id="KashmirMigrantNo" value="no" onclick="return fuShowHideDiv('KMigrantDetail', 0);" />
                                        <label for="NtHvgCerfte">No</label>

                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div id="KMigrantDetail" style="display: block;">

                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Migration Year</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <%-- <input type="text" name="" id="MigrationYear" class="form-control" placeholder="" />--%>
                                        <select id="MigrationYear" name="" class="form-control">
                                            <option value="0">Select Year</option>
                                            <option value="1998">1998</option>
                                            <option value="1999">1999</option>
                                            <option value="2000">2000</option>
                                            <option value="2001">2001</option>
                                            <option value="2002">2002</option>
                                            <option value="2003">2003</option>
                                            <option value="2004">2004</option>
                                            <option value="2005">2005</option>
                                            <option value="2006">2006</option>
                                            <option value="2007">2007</option>
                                            <option value="2008">2008</option>
                                            <option value="2009">2009</option>
                                            <option value="2010">2010</option>
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                        </select>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Address</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0 pbottom5">
                                        <input type="text" name="" id="MigrationAddress" class="form-control" placeholder="" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <div class="col-lg-12 othrinfohd mtop5">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">6.</span>   Whether the Candidate is working in State Odisha for M.Lib & Info.Science Course </span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio9" id="HsCerfte" value="yes" onclick="return fuShowHideDiv('ncccrtfcte', 1);" />
                                            <label for="HsCerfte">Yes</label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio9" id="NtHvgCerfte" value="no" onclick="return fuShowHideDiv('ncccrtfcte', 0);" />
                                            <label for="NtHvgCerfte">No</label>

                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div id="ncccrtfcte" style="display: block;">

                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Organisation Details & Place</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0 pbottom5">
                                            <div class="col-xs-6 pleft0">
                                                <input type="text" id="OrganisationDetails" class="form-control" placeholder="Organisation Name" />
                                            </div>
                                            <div class="col-xs-6 pright0">
                                                <input type="text" id="OgranisationPlace" class="form-control" placeholder="Place" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Total Experience & Designation</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0 pbottom5">
                                            <div class="col-xs-6 pleft0">
                                                <input type="text" id="TotalExperience" class="form-control" placeholder="Experience in yrs" />
                                            </div>
                                            <div class="col-xs-6 pright0">
                                                <input type="text" id="Designation" class="form-control" placeholder="Designation" />

                                            </div>

                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div class="clearfix"></div>
                            <%--change 6A to 7--%>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <div class="col-lg-12 othrinfohd mtop5">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">7.</span>   Whether the candidate is having a MBA Degree. </span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio10" id="HvngMBAYes" value="yes" onclick="return fuShowHideDiv('HavingMBDDegree', 1);" />
                                            <label for="HsCerfte">Yes</label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio10" id="HvngMBANo" value="no" onclick="return fuShowHideDiv('HavingMBDDegree', 0);" />
                                            <label for="NtHvgCerfte">No</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div id="HavingMBDDegree" style="display: block;">

                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Name of the Examination</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0 pbottom5">
                                            <input type="text" name="" id="NameOfExamination" class="form-control" placeholder="" />
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Year of the Examination & Marks Secured</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0 pbottom5">
                                            <div class="col-xs-6">
                                                <%--  <input type="text" name="" id="MBAPassedYear" class="form-control" placeholder="DD/MM/YYYY" />--%>
                                                <select id="MBAPassedYear" name="" class="form-control">
                                                    <option value="0">Select Year</option>
                                                    <option value="1998">1998</option>
                                                    <option value="1999">1999</option>
                                                    <option value="2000">2000</option>
                                                    <option value="2001">2001</option>
                                                    <option value="2002">2002</option>
                                                    <option value="2003">2003</option>
                                                    <option value="2004">2004</option>
                                                    <option value="2005">2005</option>
                                                    <option value="2006">2006</option>
                                                    <option value="2007">2007</option>
                                                    <option value="2008">2008</option>
                                                    <option value="2009">2009</option>
                                                    <option value="2010">2010</option>
                                                    <option value="2011">2011</option>
                                                    <option value="2012">2012</option>
                                                    <option value="2013">2013</option>
                                                    <option value="2014">2014</option>
                                                    <option value="2015">2015</option>
                                                    <option value="2016">2016</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-6">
                                                <input type="text" name="" id="MBAMarkSecured" class="form-control" placeholder="Marks Secured" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <!-----------Section 7--------------->
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <div class="col-lg-12 othrinfohd mtop5">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">8.</span>   Whether the Candidate avail NSS best volunteer certificate? </span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio11" id="NSSYes" value="yes" />
                                            <label for="HsCerfte">Yes</label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio11" id="NSSNo" value="no" />
                                            <label for="NtHvgCerfte">No</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                            <!-----------Section 8--------------->
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <div class="col-lg-12 othrinfohd mtop5">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">9.</span>   Whether the Candidate Interested to stay in hostel if selected? </span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio12" id="HostelYes" value="yes" />
                                            <label for="HostelYes">Yes</label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio12" id="HostelNo" value="no" />
                                            <label for="HostelNo">No</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>

                            </div>
                            <!-----------Section 9--------------->
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="DivSection10">

                                <div class="col-lg-12 othrinfohd mtop5">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">10.</span>   Whether the Candidate has passed graduation with distinction? </span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio13" id="DistinctionYes" value="yes" />
                                            <label for="HostelYes">Yes</label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio13" id="DistinctionNo" value="no" />
                                            <label for="HostelNo">No</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title manadatory" id="lblDeclaration">
                        <input name="chkPhysical" type="checkbox" id="chkPhysical" onclick="javascript: PGDeclaration(this.checked);" />Declaration
                    </h4>
                </div>
                <div class="box-body box-body-open" id="divDeclaration">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="text-danger text-danger-green mt0">
                            <p class="text-justify">
                                I,<b>
                                    <span id="lblName" style="text-transform: uppercase;"></span>
                                </b>
                                <span id="lblGender" style="font-size: 1.1em;"></span><b>
                                    <span id="lblPhsclFthrName" style="text-transform: uppercase;"></span>
                                </b>
                                do hereby, undertake that in the event of my admission, I shall abide by the rules of Univeristy and the Hostels attached to it. I also hereby undertake that in case of my indiscipline/disobedience of violation on my part of the rules laid down by the University or any authority empowered by them in this regard or should my conduct in the University be found not satisfacoty, my name will automatically be removed from the University Register, I also undertake to abide by the decision of the authorities regarding examination fixed by the authorities of the University.
                            </p>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">Place :</span>
                                            <label id="cndidteplce" style="font-weight: bold"></label>
                                        </b>
                                            <br />
                                        </td>

                                        <td rowspan="2"><span class="pull-right" style="color: #000;"><span id="lblApplicant" style="text-transform: uppercase; float: right; color: #777; padding-right: 50px;"></span>
                                            <br />
                                            Full Name of the Candidate</span></td>
                                    </tr>
                                    <tr>
                                        <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">Date : </span>
                                            <label id="currntdte" style="font-weight: bold"></label>
                                        </b></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                </div>
                                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <span style="color: maroon; font-size: 20px; font-weight: bold">Please Recheck The Application Form  Before Submitting. Once Submitted, No Edit Or Correction Shall Be Entertained.</span>
                            </div>
                        </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12  text-center mtop15 mbtm20">
                <input type="button" id="btnSubmit" class="btn btn-verify" value="SUBMIT" style="min-width: 180px;" />
            </div>
        </div>
        <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
        <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
    </div>

</asp:Content>
