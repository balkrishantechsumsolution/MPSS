<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="EditStudentInfo.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.EditStudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Student Information</title>

    <script src="/Scripts/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="/Scripts/angular.min.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="../../../Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script src="/PortalScripts/Wallet.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="../../Styles/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/bootstrap.min.css" type="text/css"  rel="stylesheet" />
    <link href="../../../Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" type="text/css" rel="stylesheet" />

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
    <script src="/WebApp/G2G/SU/Script/EditStudentInfo.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            //$("#btnSubmit").prop('disabled', true);

            // var User = $("#HDFUserID").val();
            // var CollegeName = $("#HDFCName").val();
            // var CollegeCode = $("#HDFCCode").val();

            //// $("#UserID").val(User);
            // $("#CollegeCode").val(CollegeCode);
            // $("#CollegeName").val(CollegeName);

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
        //bind age and application details
        $(document).ready(function () {

            $('#Age').attr("readonly", true);
            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {

                    var t_DOB = $("#DOB").val();
                    /*
                    var D1 = t_DOB.split('/');
                    var calday = D1[0];
                    var calmon = D1[1];
                    var calyear = D1[2];
    
                    var S_date = calyear.toString() + "/" + calmon.toString() + "/" + calday.toString();  //new Date(calyear, calmon - 1, calday);
    
                    var Age = calage(S_date);
                    */
                    t_DOB = t_DOB.replace("-", "/");
                    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    //var Age = calage(S_date);
                    var Age = calage1(t_DOB);
                    if (Age != null && Age < 15) {
                        alertPopup("Age Validate", "Age allow 15 years or above");
                        $("#DOB").val('');
                        $('#Age').val('');
                    }
                    else {
                        $('#Age').val(Age);
                    }


                }
            });
        });



        //details
        function calage1(dob) {
            var D1 = dob.split('/');
            var calday = D1[0];
            var calmon = D1[1];
            var calyear = D1[2];

            var curd = new Date(curyear, curmon - 1, curday);
            var cald = new Date(calyear, calmon - 1, calday);
            var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
            var dife = datediff(curd, cald);
            return dife[0];
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

    <style type="text/css">
        .imprtnt_links {
            position: absolute;
            width: 88%;
            border-right: 1px solid #868695;
            border-bottom: 1px solid #868695;
            border-left: 1px solid #868695;
            border-radius: 2px;
        }

            .imprtnt_links ul li {
                line-height: 28px;
                padding-left: 10px;
                padding-right: 10px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-lg-2" id="importantInfo" style="display:none;">
            <div class="imprtnt_links">
                <h4 style="background-color: #868695; font-size: 1.071428571428571em; color: #fff; padding: 8px; margin-top: 0;">Help Manuals</h4>
                <ul>
                    <li><a href="/Sambalpur/pdf/student_usermanual.pdf" target="_blank"><i class="fa fa-file-pdf-o fa-fw"></i>Student User Manual For +3 Examination Enrollment</a></li>
                    <li><a href="/Sambalpur/pdf/ResizeImage.pdf" target="_blank"><i class="fa fa-file-pdf-o fa-fw"></i>How to check and resize image</a></li>
                </ul>
            </div>
        </div>
        <div id="page-wrapper" class="container-fluid home-contentbox" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="form-heading mtop5"><i class="fa fa-pencil-square-o fa-fw pright10"></i> Edit Studet Information (CBCS)
                    </h2>
                </div>
            </div>
            <div class="row">

                <div class="col-md-9 p0">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Search Student Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label>Roll No</label>
                                    <input id="txtRollNo" type="text" class="form-control" placeholder="Roll No" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-1 text-left">
                                <div class="form-group">
                                    <label class="">
                                       
                                    &nbsp;</label><input type="button" name="" value="Search" onclick="fnFetchUserDetails();" id="btnSearch" class="btn btn-primary" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-4">
                                <div class="form-group">
                                    <label>College</label>                                    
                                    <select name="" id="ddlCollege" class="form-control" data-val="true" data-val-number="College." data-val-required="Please select College">
                                        <option value="0">Select College</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label>Application No.</label>
                                    <input id="txtAppID" type="text" class="form-control" placeholder="AppID" disabled />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label>Aadhar/Profile No.</label>
                                    <input id="UID" type="text" class="form-control" placeholder="Aadhar No" disabled />
                                </div>
                            </div>
                            
                            <div class="clearfix"></div>
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
                                    <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>
                                        Father's Name</label>
                                    <input id="FatherName" class="form-control" placeholder="Father's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>
                                        Mother's Name</label>
                                    <input id="MotherName" class="form-control" placeholder="Mother's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label>
                                        Guardian Name</label>
                                    <input id="GuardianName" class="form-control" placeholder="Guardian Name" name="Father Name" type="text" value="" autofocus="" maxlength="100" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
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
                                    <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" onkeypress="return ValidateAlpha(event);"
                                        onkeydown=" return allowBackspace(event);" maxlength="12" onchange="ValidateDate();" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="DOB" style="font-size: 10px;">
                                        Age on(01.01.2017) <span style="font-size: 10px;"></span>
                                    </label>
                                    <input id="Age" class="form-control" placeholder="Age (in years)" name="Age" maxlength="2" disabled="disabled" />
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
                                    <label for="EmailID" class="">
                                        Email ID</label>
                                    <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" autofocus="" style="" />
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
                                    <input name="" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="AddressLine2">
                                        Address Line-2 (Building)
                                    </label>
                                    <input name="" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="RoadStreetName">
                                        Road/Street Name
                                    </label>
                                    <input name="" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="LandMark">
                                        Landmark
                                    </label>
                                    <input name="" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="Locality">
                                        Locality
                                    </label>
                                    <input name="" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlState">
                                        State
                                    </label>
                                    <select name="" id="PddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetOUATDistrict();">
                                    </select>
                                    <input name="" type="text" id="txtState" class="form-control" placeholder="Enter State Name" autofocus="" style="display: none;" />
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
                                    <input name="" type="text" id="txtDistrict" class="form-control" placeholder="Enter District Name" autofocus="" style="display: none;" />
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
                                    <input name="" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" autofocus="" style="display: none;" />
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
                                    <input name="" type="text" id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" autofocus="" style="display: none;" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="PIN">
                                        Pin Code
                                    </label>
                                    <input name="" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" onchange="return PermanentPinCode();" onkeypress="return isNumberKey(event);" autofocus="" />
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
                                    <input name="" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="AddressLine2">
                                        Address Line-2 (Building)
                                    </label>
                                    <input name="" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="RoadStreetName">
                                        Road/Street Name
                                    </label>
                                    <input name="" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="LandMark">
                                        Landmark
                                    </label>
                                    <input name="" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="Locality">
                                        Locality
                                    </label>
                                    <input name="" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="40" autofocus="" />
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
                                    <input id="CtxtDistrict" class="form-control" placeholder="Current District" name="Current District" value="" maxlength="30" autofocus="" style="display: none;" />
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
                                    <input id="CtxtTaluka" class="form-control" placeholder="Current Block" name="Current Block" value="" maxlength="30" autofocus="" style="display: none;" />
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
                                    <input id="CtxtVillage" class="form-control" placeholder="Current Panchayat" name="Current Panchayat" value="" maxlength="30" autofocus="" style="display: none;" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">
                                        Pin Code
                                    </label>
                                    <input name="" type="text" id="CPinCode" class="form-control" onchange="return PresentPinCode();" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" />
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
            <!--Start Tab for High School 10th pass details-->
            <div class="row">
                <div class="col-md-12 box-container" id="divHSC">
                    <div class="box-heading">
                        <h4 class="box-title">Educational Qualification Of SSC (10th)</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                    <tbody>
                                        <tr>
                                            <th style="width: 80px;">
                                                <label class="">Roll No</label>
                                            </th>
                                            <th style="width: 300px;">
                                                <label class="manadatory">
                                                    Name of the Board / Council, State</label></th>
                                            <th style="width: 300px;">
                                                <label class="manadatory">Name of the Examination Passed</label>
                                            </th>
                                            <th style="width: 75px;">
                                                <label class="manadatory">
                                                    Year Of Passing</label>
                                            </th>
                                            <th style="width: 100px;">
                                                <label class="manadatory">Grade Type</label>
                                            </th>
                                            <th style="width: 75px; white-space: normal;">
                                                <label class="manadatory">Total Marks/CGPA</label>
                                            </th>
                                            <th style="width: 75px;">
                                                <label class="manadatory">Marks/CGPA Secured</label>
                                            </th>
                                            <th style="width: 75px;">
                                                <label>
                                                    Percentage</label>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input id="txtBoardRollNo" class="form-control" placeholder="Roll No" name="txtBoardRollNo" type="text" maxlength="20" onkeypress="return AlphaNumericHypenNSlash(event);" />
                                            </td>
                                            <td>
                                                <input id="txtBoardName" class="form-control" placeholder="Name of the Board / Council, State" name="txtBoardName" type="text" value="" autofocus="" maxlength="30" /></td>
                                            <td>
                                                <input id="txtExmntnName" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" value="" autofocus="" maxlength="30" />

                                            </td>
                                            <td>
                                                <select name="ddlPassYr" id="txtPssngYr" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                    <option value="0">Select Year</option>                                                    
                                                    <option value="1994">1994</option>
                                                    <option value="1995">1995</option>
                                                    <option value="1996">1996</option>
                                                    <option value="1997">1997</option>
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
                                                    <option value="2017">2017</option>
                                                    <option value="2018">2018</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="ddlPctgeCalclte" id="ddlPctgeCalclte" class="form-control" data-val-required="Please Select.">
                                                    <option value="0">-Select-</option>
                                                    <option value="502">Percentage</option>
                                                    <option value="501">CGPA</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                            </td>
                                            <td>
                                                <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event);" />
                                            </td>
                                            <td>
                                                <input id="txtPercentage" class="form-control" name="txtPrcntge" type="text" readonly="true" maxlength="5" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <%-- Start Subject Details of Class 12 --%>
            <div class="row" id="divHSc2">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Educational Qualification Of HSC (12th)</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                    <tbody>
                                        <tr>
                                            <th style="width: 80px;">
                                                <label class="manadatory">
                                                    Board Type</label></th>
                                            <th style="width: 80px;">
                                                <label class="">Roll No</label>
                                            </th>
                                            <th style="width: 300px;">
                                                <label class="manadatory">
                                                    Name of the Board / Council, State</label></th>
                                            <th style="width: 300px;">
                                                <label class="manadatory">Name of the Examination Passed</label>
                                            </th>
                                            <th style="width: 75px;">
                                                <label class="manadatory">
                                                    Year Of Passing</label>
                                            </th>
                                            <th style="width: 100px;">
                                                <label class="manadatory">Grade Type</label>
                                            </th>
                                            <th style="width: 75px; white-space: normal;">
                                                <label class="manadatory" id="lblTotalMarks2">Total Marks</label>
                                            </th>
                                            <th style="width: 75px;">
                                                <label class="manadatory">Marks Secured</label>
                                            </th>
                                            <th style="width: 75px;">
                                                <label class="">Percentage</label></th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <select name="ddlBoard" id="ddlBoard" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                    <option value="0">Select Board</option>
                                                    <option value="CHSE">CHSE</option>
                                                    <option value="ICSE">ICSE</option>
                                                    <option value="CBSE">CBSE</option>
                                                    <option value="Other">Other</option>
                                                </select></td>
                                            <td>
                                                <input id="txtBoardRollNo2" class="form-control" placeholder="Roll No" name="txtBoardRollNo2" type="text" maxlength="20" onkeypress="return AlphaNumericHypenNSlash(event);" />
                                            </td>
                                            <td>
                                                <input id="txtBoardName2" class="form-control" placeholder="Name of the Board / Council, State" name="txtBoardName2" type="text" value="" autofocus="" maxlength="30" /></td>
                                            <td>
                                                <input id="txtExmntnName2" class="form-control" placeholder="Examination Name" name="txtExmntnName2" type="text" value="" autofocus="" maxlength="30" />
                                            </td>
                                            <td>
                                                <select name="txtPssngYr2" id="txtPssngYr2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                    <option value="0">Select Year</option>
                                                    <option value="1994">1994</option>
                                                    <option value="1995">1995</option>
                                                    <option value="1996">1996</option>
                                                    <option value="1997">1997</option>
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
                                                    <option value="2017">2017</option>
                                                    <option value="2018">2018</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="ddlPctgeCalclte2" id="ddlPctgeCalclte2" class="form-control" data-val-required="Please Select.">
                                                    <option value="0">-Select-</option>
                                                    <option value="502">Percentage</option>
                                                     <option value="501">CGPA</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input id="txtTotalMarks2" class="form-control" placeholder="Total Marks" name="txtTotalMarks2" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                            </td>
                                            <td>
                                                <input id="txtMarkSecure2" class="form-control" placeholder="Marks Secure" name="txtMarkSecure2" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />
                                            </td>
                                            <td>
                                                <input id="txtPercentage2" class="form-control" name="txtPercentage2" type="text" readonly="true" maxlength="5" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Details Of Any Other Course Attended
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
                                            <td>
                                                <input type="text" class="form-control" placeholder="" id="txtCourseName" /></td>
                                            <td>
                                                <input type="text" class="form-control" placeholder="" id="txtBoard" /></td>
                                            <td>
                                                <input type="text" class="form-control" placeholder="" id="txtLastAttend" /></td>
                                            <td>
                                                <%-- <input type="text" id="YOP" class="form-control" placeholder="" />--%>
                                                <select name="ddlYOPYr" id="YOP" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                    <option value="0">Select Year</option>
                                                    <option value="1994">1994</option>
                                                    <option value="1995">1995</option>
                                                    <option value="1996">1996</option>
                                                    <option value="1997">1997</option>
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
                                                <input type="text" class="form-control" placeholder="" id="txtRegNo" /></td>
                                            <td>
                                                <input type="button" class="btn btn-verify" id="btnAdd" value="Save" onclick="AddSuspect('');" /></td>
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
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p class="alert alert-info"><b>Note :</b> If the student has a registration no of Sambalpur university and has not taken migration certificate, he needs to enter.This is not a mandatory field.</p>
                    </div>--%>
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
                                <input type="text" id="AdmissionNo" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">
                                    Date of Admission into the College</label>
                                <input type="text" id="DOA" class="form-control" placeholder="" />
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
                                <label class="manadator" style="font-weight: bold;">
                                    <span id="SubjectName"></span>
                                </label>
                                <div class="col-xs-3 pleft0" id="DivCore1">
                                    <%-- <div id="divchklist"></div>--%>
                                    <label class="manadatory" id="lblAP">
                                    </label>
                                    <select id="ddlAP" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                    <input id="txtAP" type="text" class="form-control" disabled="disabled" style="display: none;" />
                                </div>
                                <div class="col-xs-3" id="DivCore2">
                                    <label class="manadatory" id="lblAP1">
                                    </label>
                                    <select id="ddlAP1" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                    <input id="txtAP1" type="text" class="form-control" disabled="disabled" style="display: none;" />
                                </div>
                                <div class="col-xs-3" id="DivCore3">
                                    <label class="manadatory" id="lblAP2">
                                        Choose Any one</label>
                                    <select id="ddlAP2" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                    <input id="txtAP2" type="text" class="form-control" disabled="disabled" style="display: none;" />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivGE">
                            <div class="form-group">
                                <label class="manadatory" id="lblGE">
                                    GE-II</label>
                                <select id="ddlGE" name="GES" class="form-control">
                                    <option value="0">Select</option>
                                </select>
                                <input id="txtGE" type="text" class="form-control" disabled="disabled" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivGEII">
                            <div class="form-group">
                                <label class="" id="lblGEII">
                                    GE-II</label>
                                <select id="ddlGEII" name="GES" class="form-control" >
                                    <option value="0">Select</option>
                                </select>
                                <input id="txtGEII" type="text" class="form-control" disabled="disabled" style="display: none;"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-3" id="DivMIL">
                            <div class="form-group">
                                <label class="manadatory" id="lblMIL">
                                    MIL</label>
                                <select id="ddlMIL" class="form-control">
                                    <option value="0">Select</option>
                                </select>
                                <input id="txtMIL" type="text" class="form-control" disabled="disabled" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivAECC">
                            <div class="form-group">
                                <label class="manadatory" id="AECC">
                                    AECC</label>
                                <select id="ddlAECC" class="form-control">
                                    <option value="0">Select</option>
                                </select>
                                <input id="txtAECC" type="text" class="form-control" disabled="disabled" style="display: none;" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivSEC">
                            <div class="form-group">
                                <label class="manadatory" id="lblSEC">
                                    SEC</label>
                                <select id="ddlSECB" class="form-control">
                                    <option value="0">Select</option>
                                </select>
                                <input id="txtSECB" type="text" class="form-control" disabled="disabled" style="display: none;" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            
            <div id="divBtn" class="row">
                <div class="col-md-12 box-container" style="margin-top: 5px;">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory text-left">
                                    Enter Update Remarks</label>
                                <input id="txtRemarks" type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <input type="button" id="btnSubmit" class="btn btn-success" value="Update" title="Update the Student details" onclick="EditStudentData();" />
                        <input type="submit" name="" value="Cancel" id="Button1" title="Refresh the page" class="btn btn-danger" />
                        <%-- <input type="submit" name="" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary"/>--%>
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
            <asp:HiddenField ID="HDFCCode" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="HDFCName" runat="server" ClientIDMode="Static" />
        </div>
    </form>
</body>

</html>