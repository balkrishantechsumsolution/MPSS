<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="AdmissionForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CBCS.AdmissionForm" %>

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
    <script src="/WebApp/Kiosk/CBCS/Admission.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        $(document).ready(function () {
           
            
            $("#btnSubmit").prop('disabled', true);
            var User = $("#HDFUserID").val();
            $("#UserID").val(User);
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
           
           
        });
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
    <script type="text/javascript">
        $(document).ready(function () {
            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                onSelect: function (date) {

                }
            });
            $('#YOP').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
            $('#DOA').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
           
        });

    </script>
    <script type="text/javascript">
        function validateUID(UIDVal) {
            debugger;
            if (UIDVal == "1") {
                var UID = $("#UID").val();
                var length = UID.length;

                if ($("#UID").val() == "") {
                    alert("Please enter Aadhaar UID number.");
                    //$("#UID").focus();
                    return false;
                }
                if (eval(length) < 12) {
                    alert("Aadhaar UID should be 12 digit");
                    $("#UID").val("");

                    return false;
                }

            }
        }

        function openWindow_old(UIDVal, value, SessionName) {
            debugger;
            var qs = getQueryStrings();
            var SvcID = qs["SvcID"];

            if (validateUID(UIDVal) != false) {

                var code = "";
                if (UIDVal == "1") {
                    code = $("#UID").val();
                }

                var t_Result = false;//CheckUID(code);

                if (t_Result) {
                    var EID = "0";
                    var left = (screen.width / 2) - (560 / 2);
                    var top = (screen.height / 2) - (400 / 2);

                    window.open('/UID/VerifyUID.aspx?aadhaarNumber=' + code + '&SvcID=' + SvcID, 'open_window',
                               ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
                    window.focus();

                }
                else {

                    var EID = "0";
                    var left = (screen.width / 2) - (560 / 2);
                    var top = (screen.height / 2) - (400 / 2);

                    window.open('/UID/Default.aspx?aadhaarNumber=' + code + '&kycTypesToUse=OTP&SvcID=' + SvcID, 'open_window',
                               ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
                    window.focus();
                }
                return false;
            }
            return false;
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading mtop5"><i class="fa fa-pencil-square-o fa-fw pright10"></i>+3 Examination Enrollment (CBCS)
                </h2>
            </div>
        </div>
        <div class="row">

            <div class="col-md-9 p0">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">College Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">
                                    User Id
                                </label>
                                <input type="text" id="UserID" class="form-control" placeholder="User Id" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label>College Code</label>
                                <input id="CollegeCode" type="text" class="form-control" placeholder="College Code" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label>College Name</label>
                                <input id="CollegeName"  type="text" class="form-control" placeholder="College Name" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-12 box-container">
                    <div class="box-heading ">
                        <h4 class="box-title">Aadhaar Details
                        </h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="row">
                                <div class="form-group col-lg-4">
                                    <select class="form-control" data-val="true" data-val-number="search application" data-val-required="Please select search type" id="ddlSearch" name="Search">
                                        <option value="0">Select Search Type</option>
                                        <option selected="" value="R">Aadhaar Enrollment Number</option>
                                        <option selected="" value="U">Aadhaar Number</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-4">
                                    <input class="form-control" placeholder="Enter 12 digit Aadhaar Number" name="txtAadhaar" type="text" value="" id="UID" maxlength="12" onkeypress="return isNumberKey(event);" autofocus="" />
                                </div>
                                <div class="form-group col-lg-2 text-left">
                                    <input type="submit" name="" value="Fetch Data from UID" onclick="return openWindow(1, 2, 'UIDCasteCertificate1');;" id="btnSearch" class="btn btn-verify" />
                                </div>
                                <div id="divNonAadhar" class="form-group col-lg-3 text-right" style="white-space: nowrap; margin-top: 10px; display: none;"><a href="#" onclick="fnNonUID();" title="Click if Aadhaar UID is not available">I don't have Aadhaar No.</a></div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>

                </div>
                <div id="divDetails" class="col-md-12 box-container">
                    <div class="box-heading" id="Div4">
                        <h4 class="box-title">Student Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="firstname">
                                    Name of Student</label>
                                <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="40" autocomplete="off" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Father's Name</label>
                                <input id="FatherName" class="form-control" placeholder="Father's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="40" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Mother's Name</label>
                                <input id="MotherName" class="form-control" placeholder="Mother's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="40" autocomplete="off" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>
                                    Guardian Name</label>
                                <input id="GuardianName" class="form-control" placeholder="Guardian Name" name="Father Name" type="text" value="" autofocus="" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label>
                                    Relation
                                </label>
                               <select id="ddlRelation" class="form-control">
                                   <option value="Select">Select</option>
                               </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    Date of Birth <span style="font-size: 11px;"></span>
                                </label>
                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="12" autocomplete="off" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlGender">
                                    Gender</label>
                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                    <option value="0">Select</option>
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                    <option value="T">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtTongue">
                                    Mother Tongue</label>

                                <select class="form-control" data-val="true" data-val-number="mothertongue" id="txtTongue" name="txtTongue">
                                    <option value="0">Select</option>
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

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Category</label>
                                <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="ddlcategory" name="Category">
                                    <option value="Select Category">Select</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                    <option value="OBC">OBC</option>
                                    <option value="General">General</option>
                                </select>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">
                                    Mobile Number</label>
                                <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event); " type="text" value="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label for="EmailID" class="manadatory">
                                    Email ID</label>
                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" autofocus="" style="" autocomplete="off" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4" id="DivMTOther">
                            <div class="form-group">
                                <label for="MTOthers" class="manadatory">
                                    MotherTongue Other</label>
                                <input id="MTOther" class="form-control" placeholder="Mother Tongue Other" type="text" value="" maxlength="30" autofocus="" style="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12" style="display: none">
                            <p class="ptop10"><i class="fa fa-info-circle pright5" style="color: #000;"></i>SC,ST SEBC candidates should attach self attested copy of respective Caste Certificate.<span style="color: red;">*</span></p>

                        </div>

                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>

            <div class="col-md-3 p0">

                <div id="divPhoto" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Applicant Photograph
                        </h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                            <input class="camera" id="ApplicantImage" name="Photoupload" type="file" />
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
                            <input class="camera" id="ApplicantSign" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="divAddress" class="row">
                            <div class="col-md-6 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Permanent Address
                                    </h4>
                                </div>

                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="AddressLine1">
                                                    Address Line-1 (Care of)
                                                </label>
                                                <input name="" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">
                                                    Address Line-2 (Building)
                                                </label>
                                                <input name="" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="RoadStreetName">
                                                    Road/Street Name
                                                </label>
                                                <input name="" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="LandMark">
                                                    Landmark
                                                </label>
                                                <input name="" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="Locality">
                                                    Locality
                                                </label>
                                                <input name="" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">
                                                    State
                                                </label>
                                                <select name="" id="PddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetOUATDistrict();">
                                                    </select>
                                                <input name="" type="text" id="txtState" class="form-control" placeholder="Enter State Name" autofocus="" style="display: none;"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    District
                                                </label>
                                                <select name="" id="PddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." onchange="GetOUATBlock();">
                                                    <option value="0">Select District</option>
                                                </select>
                                                <input name="" type="text" id="txtDistrict" class="form-control" placeholder="Enter District Name" autofocus="" style="display: none;"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="ddlTaluka">
                                                    Block/Taluka
                                                </label>
                                                <select name="" id="PddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." onchange="GetOUATPanchayat();">
                                                    <option value="0">Select Block</option>
                                                </select>
                                                <input name="" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" autofocus="" style="display: none;"/>
                                            </div>
                                        </div>
                                       <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory text-nowrap" for="ddlVillage">
                                                    Panchayat/Village/City
                                                </label>
                                                <select name="" id="PddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                                    <option value="0">Select Panchayat</option>
                                                </select>
                                                <input name="" type="text" id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" autofocus="" style="display: none;"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="PIN">
                                                    Pin Code
                                                </label>
                                                <input name="" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" onchange="return PermanentPinCode();" onkeypress="return isNumberKey(event);" autofocus="" autocomplete="off"/>
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
                                    <h4 class="box-title">Present Address <span style="font-size: 13px; padding-right: 0" >(For correspondence)</span>
                                        <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                                            <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="javascript: fnCopyAddress(this.checked);"/>Same as Permanent Address</span><span class="clearfix">
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
                                                <input name="" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">
                                                    Address Line-2 (Building)
                                                </label>
                                                <input name="" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="RoadStreetName">
                                                    Road/Street Name
                                                </label>
                                                <input name="" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="LandMark">
                                                    Landmark
                                                </label>
                                                <input name="" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="Locality">
                                                    Locality
                                                </label>
                                                <input name="" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="40" autofocus="" autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">
                                                    State
                                                </label>
                                                <select name="" id="CddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetOUATDistrict2();">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory ng-binding" for="ddlDistrict">
                                                    District
                                                </label>
                                                <select name="" id="CddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." onchange="GetOUATBlock2();">
                                                    <option value="0">Select District</option>
                                                </select>
                                                <input id="CtxtDistrict" class="form-control" placeholder="Current District" name="Current District" value="" maxlength="30" autofocus="" style="display: none;"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="ddlTaluka">
                                                    Block/Taluka
                                                </label>
                                                <select name="" id="CddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." onchange="GetOUATPanchayat2();">
                                                    <option value="0">Select Block</option>
                                                </select>
                                                <input id="CtxtTaluka" class="form-control" placeholder="Current Block" name="Current Block" value="" maxlength="30" autofocus="" style="display: none;"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory text-nowrap" for="ddlVillage">
                                                    Panchayat/Village/City
                                                </label>
                                                <select name="" id="CddlVillage" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select panchayat">
                                                    <option value="0">Select Panchayat</option>
                                                </select>
                                                <input id="CtxtVillage" class="form-control" placeholder="Current Panchayat" name="Current Panchayat" value="" maxlength="30" autofocus="" style="display: none;"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    Pin Code
                                                </label>
                                                <input name="" type="text" id="CPinCode" class="form-control" onchange="return PresentPinCode();" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" autocomplete="off"/>
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
        <div class="row">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Last Course Attended By Student
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                         <div class="form-group error" id="divmore" runat="server" style="display: none;">
                    </div>
                        <div id="divSuspect">
                       </div>
                        <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Course Name / Last Examination Passed</th>
                                    <th>University / Council / Board Name</th>
                                    <th>Institution Last Attended</th>
                                    <th>Year of Passing</th>
                                     <th>University / Council / Board Registration No</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td> <input type="text" class="form-control" placeholder="" id="txtCourseName" autocomplete="off" /></td>
                                    <td> <input type="text" class="form-control" placeholder="" id="txtBoard" autocomplete="off" /></td>
                                    <td><input type="text" class="form-control" placeholder="" id="txtLastAttend" autocomplete="off" /></td>
                                    <td> <input type="text" id="YOP" class="form-control" placeholder="" autocomplete="off" style="width:70px"/></td>
                                    <td><input type="text" class="form-control" placeholder="" id="txtRegNo" autocomplete="off" /></td>
                                    <td><input type="button" class="btn btn-verify" id="btnAdd" value="Save" onclick="AddSuspect('');" /></td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    </div>
                   <%-- <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Course Name/Last Examination Passed</label>
                            <select name="" id="ddlCourseName" class="form-control">
                                <option value="0">Select</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">
                                University/Council/Board Name</label>
                            <input type="text" class="form-control" placeholder="" />

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Institution Last Attended</label>
                            <input type="text" class="form-control" placeholder="" />

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Year of Passing</label>
                            <input type="text" id="YOP" class="form-control" placeholder="" />

                        </div>
                    </div>--%>

                    <div class="clearfix"></div>
                    <%--<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label>
                                University Registration No</label>
                            <input type="text" class="form-control" placeholder="" />

                        </div>
                    </div>--%>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p class="alert alert-info"><b>Note :</b> If the student has a registration no of Chhattisgarh Swami Vivekanad Technical university and has not taken migration certificate, he needs to enter.This is not a mandatory field.</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Admission Details
                    </h4>
                </div>

                <div class="box-body box-body-open">
                     <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Admission Number</label>
                            <input type="text" id="AdmissionNo" class="form-control" placeholder="" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Date of Admission into the College</label>
                            <input type="text" id="DOA" class="form-control" placeholder="" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadator">
                                Branch</label>
                            <select id="ddlBranch" class="form-control" onchange="GetCBCSSubjectList();">

                                <option value="0">Select</option>                                
                            </select>

                        </div>
                    </div>
                    
                    <div class="clearfix"></div>
                    <hr />
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label class="manadator" style="font-weight:bold;">
                                <span id="SubjectName"></span></label>
                            <div class="col-xs-3 pleft0" id="DivCore1">
                               <%-- <div id="divchklist"></div>--%>
                                <label class="manadatory">
                                Choose Any one</label>
                            <select id="ddlAP" class="form-control"> 
                                <option value="0">Select</option>
                            </select>
                                </div>
                            <div class="col-xs-3" id="DivCore2">
                                 <label class="manadatory">
                                Choose Any one</label>
                            <select id="ddlAP1" class="form-control">
                                <option value="0">Select</option>
                            </select>
                                </div>
                            <div class="col-xs-3" id="DivCore3">
                                 <label class="manadatory">
                                Choose Any one</label>
                            <select id="ddlAP2" class="form-control">
                                <option value="0">Select</option>
                            </select>
                                </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivGE">
                        <div class="form-group">
                            <label class="manadatory">
                                GE-II</label>
                            <select id="ddlGE" class="form-control">
                                <option value="0">Select</option>  
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-5 col-lg-3" id="DivMIL">
                        <div class="form-group">
                            <label class="manadatory">
                                MIL</label>
                            <select id="ddlMIL" class="form-control">
                                <option value="0">Select</option>    
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivAECC">
                        <div class="form-group">
                            <label class="manadatory">
                                AECC</label>
                            <select id="ddlAECC" class="form-control">
                                <option value="0">Select</option>   
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivSEC">
                        <div class="form-group">
                            <label class="manadatory">
                                SEC</label>
                            <select id="ddlSECB" class="form-control">
                                <option value="0">Select</option>    
                            </select>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title manadatory" id="lblDeclaration">
                        <input name="" type="checkbox" id="chkPhysical" onclick="javascript: OUATDeclaration(this.checked);" />Declaration
                    </h4>
                </div>
                <div class="box-body box-body-open" id="divDeclaration" style="display: none;">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="text-danger text-danger-green mt0">
                            <p class="text-justify">
                                I <b>
                                    <span id="lblName" style="text-transform: uppercase;"></span>
                                </b>,
                <span id="lblGender" style="font-size: 1.1em;"></span><b>
                    <span id="lblPhsclFthrName" style="text-transform: uppercase;"></span>
                </b>
                                hereby affirm that the information given by me in the application is complete and true to the best of my knowledge and belief and that I have made the application with the consent and approval of my parents/guardian.
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
                    <div class="clearfix">
                    </div>

                </div>
            </div>
        </div>
        <div id="divBtn" class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Register &amp; Proceed" title="Proceed to Upload Necessary Document" disabled="" onclick="SubmitData();"/>
                                <input type="submit" name="" value="Cancel" id="Button1" title="Refresh the page" class="btn btn-danger"/>
                                <input type="submit" name="" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary"/>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
         <!---new fields added here-->
          <asp:HiddenField ID="hdfSuspect" runat="server" />
          <asp:HiddenField ID="hdfSuspectSave" runat="server" />
          <asp:HiddenField ID="hdfSuspectString" runat="server" />

    <!--End here-->

    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HDFDistrict" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HDFPS" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="HDFUserID" runat="server" ClientIDMode="Static" />
    </div>
</asp:Content>
