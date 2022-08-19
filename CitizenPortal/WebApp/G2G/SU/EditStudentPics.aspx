<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="EditStudentPics.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.EditStudentPics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Student Information</title>

    <script src="/Scripts/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="/Scripts/angular.min.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="../../../Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script src="/PortalScripts/Wallet.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="../../Styles/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
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
    <script src="/WebApp/G2G/SU/Script/EditStudentPics.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
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
        <div class="col-lg-2" id="importantInfo" style="display: none;">
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
                    <h2 class="form-heading mtop5"><i class="fa fa-pencil-square-o fa-fw pright10"></i>Edit Studet Information (CBCS)
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
                                    <label class="manadatory" for="MobileNo">
                                        Mobile Number</label>
                                    <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event); " type="text" value="" autocomplete="off" />
                                </div>
                            </div>


                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div id="divBtn" class="">
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
            <!--Start Tab for High School 10th pass details-->

            <%-- Start Subject Details of Class 12 --%>


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
