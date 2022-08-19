<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="CitizenPortal.WebApp.Enrollment.StudentForm" %>

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
    <script src="Admission.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            $('#divEvent').hide();
            $("#divEnroll").hide();
            $("#divMigration").hide();
            $("#divGap").hide();
            $("#divScoureCard").hide();
            //$('#divQuota').hide();
            //$("#btnSubmit").prop('disabled', true);

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

            debugger;
            $('#Age').attr("readonly", true);
            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {

                    var t_DOB = $("#DOB").val();
                    
                    var D1 = t_DOB.split('/');
                    var calday = D1[0];
                    var calmon = D1[1];
                    var calyear = D1[2];
    
                    /*var S_date = calyear.toString() + "/" + calmon.toString() + "/" + calday.toString();  //new Date(calyear, calmon - 1, calday);
    
                    var Age = calage(S_date);
                    */
                    t_DOB = t_DOB.replace("-", "/");
                    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    //var Age = calage(S_date);
                    //var Age = calcDobAge(t_DOB);
                    var Age = calcExSerDur(t_DOB, "01/01/2021")
                    if (Age != null && Age < 18) {
                        alertPopup("Age Validate", "Age allow 18 years or above");
                        return false;
                    }
                    else {
                        
                        $("#Year").val(Age.years + " Years");
                        $("#Month").val(Age.months + " Month");
                        $("#Day").val(Age.days + " Days");
                    }

                    if (!ValiateAge(Age.years)) {
                        return false;
                    }


                }
            });
        });



        //details
        function calage1(dob) {
            debugger;
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
        function Declaration(chk) {

            debugger;

            if (chk) {
                if ($('#FirstName').val() == "" || $('#FatherName').val() == "") {
                    //alert("Please enter the all the mandatory fields.");
                    alert("Please enter your Full Name, Father Name  to continue.");
                    document.getElementById("chkDeclaration").checked = false;
                    return false;
                }

                if ($('#CddlDistrict').val() == 0) {
                    alert("Please select Present District to continue.");
                    document.getElementById("chkDeclaration").checked = false;
                    return false;
                }
                if ($('#ddlGender').val() != '0') {
                    if ($('#ddlGender').val() == "Male") {
                        $('#lblGender').text("son of ");
                        $('#lblTitle').text("Mr.");
                    } else if ($('#ddlGender').val() == "Female") {
                        $('#lblGender').text("daughter of ");
                        $('#lblTitle').text("Ms.");
                    } else { $('#lblGender').text("transgender of"); $('#lblTitle').text("Mr./Ms."); }
                }
                else {
                    alert("Please, select Gender");
                    document.getElementById("chkDeclaration").checked = false;
                    return false;
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

            $('#EventDate').hide();
            $('#importantInfo').hide();

            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                onSelect: function (date) {

                }
            });
            //
            $('#txtCasteDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-90:+0",
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
                minDate: '0',
                yearRange: "-0:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
            
            $('#txtDomicileDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-90:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
            $('#MigrationIssue').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-50:+50",
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

            .table1 > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    padding: 3px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="progressbar" class="modalBackground" runat="server" clientidmode="Static" style="height: 700%; border: 1px solid #ccc; display: none">
        <div style="z-index: 105; left: 40%; position: absolute; top: 70%;" class="text-center">
            <img id="imgloader" alt="" runat="server" src="/WebApp/Kiosk/Images/loading.gif" style="height: 200px;" />
            <p class="text-danger">
                Please do not refresh or click back button<br />
                as Request is Processing....
            </p>
        </div>
    </div>

    <div class="col-lg-2" id="importantInfo">
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
                <h2 class="form-heading mtop5"><i class="fa fa-pencil-square-o fa-fw pright10"></i>Enrollment Form for Admission into CSVTU through DTE Counselling
                </h2>
            </div>
        </div>

        <div class="row">
                    <div class="col-md-12 box-container" id="">
                        <div class="box-heading">
                            <h4 class="box-title">Instructions for Filling the Form 
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
                                        Before proceeding, please read the university ordinance for Enrollment                                                                               
                                        <br />
                                        <b>Instructions for filling Enrollment Form</b>  
                                        <br />
                                        
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>1.	Submission </b>will complete in 2 Stage, applicant can complete each stage in one session or in separate session (session i.e login)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.	Fill the Application and accept the declaration
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.	Payment – online mode ( post payment Acknowledgement message will be generated on the screen)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>2.	Mobile No. </b>
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.	Applicant must possess their own mobile no & email id.
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.	All Communication will be made on registered Mobile no & Email ID
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c.	Only one form can be fill against one mobile no.
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>3.	Photograph & Signature</b> (as softcopy) in JPG or JPEG format size between 20KB to 50KB
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.	Recent Passport size Photograph of the applicant  size between 150px X 200px (face should be clearly visibile)
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.	Signature of the applicant dully scanned 150px X 100px (should be prominant)
                                       <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b>4.	Enrollment fees</b> is Rs.1,500.00 and need to be paid through online mode only and Rs.500 addation if you are migrated from Board/University (other than Chattisgarh Board) i.e Rs.1,500 + Rs.500 = Rs.2,000.

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

            <div class="col-md-9 p0">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">DTE Counselling Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="display: none;">
                            <div class="form-group">
                                <label class="manadatory">
                                    User Id
                                </label>
                                <input id="UserCode" type="text" class="form-control" placeholder="User Id" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">
                                    DTE Registration Number</label>
                                <input type="text" id="RegdNo" class="form-control" placeholder="" onchange="calculatepercentage();" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">
                                    DTE Roll Number</label>
                                <input type="text" id="RollNo" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">
                                    Course Name</label>
                                <input type="text" id="CourseName" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label>College Code</label>
                                <input id="CollegeCode" type="text" class="form-control" placeholder="College Code" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label>College Name</label>
                                <input id="CollegeName" type="text" class="form-control" placeholder="College Name" disabled="disabled" />
                            </div>
                        </div>   
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlEntryType">Enrollment Type</label>
                                <select name="" id="ddlEntryType" class="form-control" disabled="disabled">
                                    <option value="0">-Select-</option>
                                    <option value="1" selected="selected">Full Time</option>
                                    <option value="2">Part Time</option>
                                </select>
                            </div>
                        </div>                     
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlCourseType">Course Type</label>
                                <select name="" id="ddlCourseType" onchange="GetQuota();" class="form-control" disabled="disabled">
                                    <option value="0">-Select-</option>
                                    <option value="1">Ph.D.</option>
                                    <option value="2" selected="selected" >Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <div id="divQuota" class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlQuota">
                                    Admitted Quota</label>
                                <select class="form-control" data-val="true" data-val-number="Quota" data-val-required="Please select Admitted Quota" id="ddlQuota" name="Quota">
                                    <option value="0">Select Admitted Quota</option>
                                    <option value="1">C.G. QUOTA</option>
                                    <option value="2">O.C.G. QUOTA</option>
                                    <option value="3">MANAGEMENT QUOTA</option>
                                    <option value="4">INSTITUTE LEVEL QUOTA</option>
                                    <option value="5">General</option>
                                    <option value="6">Other</option>
                                    <%--<option value="5">P.I.O QUOTA</option>
                                    <option value="6">NOMINEE QUOTA</option>
                                    <option value="7">SPONSORED UNIVERSITY TRANSFER</option>
                                    <option value="8">J and K Quota</option>--%>
                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlYear">Admission Year</label>
                                <select name="" id="ddlYear" class="form-control">
                                    <option value="0">-Select-</option>
                                    <option  selected="selected" value="2021-2022">2021-2022</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="DOA">
                                    Date of Admission 
                                </label>
                                <input id="DOA" class="form-control" placeholder="Date of Admission" name="DOA" value="" autofocus="" maxlength="10" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlExam">Exam Type</label>
                                <select name="" id="ddlExam" class="form-control">
                                    <option value="0">-Select-</option>
                                    <option value="Level">Level</option>
                                    <option value="Semester">Semester</option>
                                    <option value="Year">Year</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label>Program Name</label>
                                <input id="ProgramName" type="text" class="form-control" placeholder="Program Name" disabled="disabled" />
                            </div>
                        </div> 
						<div class="col-xs-12 col-sm-2 col-md-3 col-lg-3" style="">
                        <div class="form-group">
                            <label class="manadatory" for="ddlAdmittedCategory">
                                Admitted Category</label>
							<select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="ddlAdmittedCategory" name="Category">
                                <option value="0">Select Admitted Category</option>
                                <option value="SC">SC</option>
                                <option value="ST">ST</option>
                                <option value="OBC">OBC</option>
                                <option value="UR">UR</option>
                            </select>
                        </div>
                    </div>
                        <%--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <div class="">
                                    <div class="col-md-2 pleft0 ptop15">
                                        <p><span class="manadatory" id="lblLebel">Select</span></p>
                                    </div>
                                    <div class="col-md-6 pleft0 pright0 ptop15">
                                        <div class="col-xs-3 pleft0 pright0">
                                            <input type="radio" name="Level" id="rbtSEML" value="Level"/>
                                            Level<label for="rbtEnrollY"></label>
                                        </div>
                                        <div class="col-xs-3 pleft0 pright0">
                                            <input type="radio" name="Level" id="rbtSEMS" value="Semester" " />
                                            Semester<label for="rbtEnrollN"></label>
                                        </div>
                                        <div class="col-xs-3 pleft0 pright0">
                                            <input type="radio" name="Level" id="rbtSEMY" value="Year"  />
                                            Year<label for="rbtSEMY"></label>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>--%>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <div class="">
                                    <div class="col-md-6 pleft0 ptop15">
                                        <p><span class="manadatory" id="lblEnroll">Have you Enrolled earlier for any course in CSVTU?</span></p>
                                    </div>
                                    <div class="col-md-2 pleft0 pright0 ptop15">
                                        <div class="col-xs-6 pleft0 pright0">
                                            <input type="radio" name="Enroll" id="rbtEnrollY" value="Yes" onclick="return fuShowHideDiv('divEnroll', 1);" />
                                            Yes<label for="rbtEnrollY"></label>
                                        </div>
                                        <div class="col-xs-6 pleft0 pright0">
                                            <input type="radio" name="Enroll" id="rbtEnrollN" value="No" onclick="return fuShowHideDiv('divEnroll', 0);" />
                                            No<label for="rbtEnrollN"></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4 pleft0 pright0" id="divEnroll">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pright0">
                                            <div class="form-group" style="margin-bottom: 0 !important">
                                                <label class="manadatory">CSVTU Enrollment No.</label>
                                                <input id="txtCSVTURegdNo" type="text" class="form-control" maxlength="6" placeholder="CSVTU Enrollment No." onchange="ValidateCSVTURegNo();" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div id="divDetails" class="col-md-12 box-container">
                    <div class="box-heading" id="Div4">
                        <h4 class="box-title">Applicant Details
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
                                <label class="manadatory">
                                    Father's Name</label>
                                <input id="FatherName" class="form-control" placeholder="Father's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Mother's Name</label>
                                <input id="MotherName" class="form-control" placeholder="Mother's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" />
                            </div>
                        </div>
                        <%--
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="category">
                                Category</label>
                            <select class="form-control" onchange="GetCaste();" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="ddlcategory" name="Category">
                                <option value="Select Category">Select</option>
                                <option value="SC">SC</option>
                                <option value="ST">ST</option>
                                <option value="OBC">OBC</option>
                                <option value="UR">General</option>
                            </select>
                        </div>
                    </div>
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    Date of Birth <span style="font-size: 11px;"></span>
                                </label>
                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="10" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlGender">
                                    Gender</label>
                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                    <option value="0">Select</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="" for="DOB">
                                    Age <span style="font-size: 11px;">(01.01.2017)</span>
                                </label>
                                <input id="Age" class="form-control" placeholder="Age (in years)" name="Age" maxlength="2" disabled="disabled" />

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
                        

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">
                                    Mobile Number</label>
                                <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event);" type="text" value="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label for="EmailID" class="manadatory">
                                    Email ID</label>
                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50" autofocus="" style="" />
                            </div>
                        </div>--%>

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
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 200px;margin: 10px 0" id="myImg" />
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
                            <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 125px;margin: 10px 0" id="mySign" />
                            <input class="camera" id="ApplicantSign" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div id="" class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Domicile Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    
                    
                    <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlDomicileState">
                                Domicile State</label>
                            <select class="form-control" data-val="true" data-val-number="DomicileState" data-val-required="Please select Domicile State" id="ddlDomicileState" name="DomicileState" onchange="GetDomosileDistrict();">
                                <option value="Select Domicile State">Select</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlDomicileDistrict">
                                Domicile District</label>
                            <select class="form-control" data-val="true" data-val-number="DomicileDistrict" data-val-required="Please Select Domicile District" id="ddlDomicileDistrict" name="DomicileDistrict"  onchange="GetDomosileBlock();">
                                <option value="Select Domicile District">Select</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="" for="ddlDomicileTehsil">
                                Domicile Tehsil</label>
                            <select class="form-control" data-val="true" data-val-number="DomicileTehsil" data-val-required="Please select Domicile Tehsil" id="ddlDomicileTehsil" name="DomicileTehsil">
                                <option value="Select Domicile Tehsil">Select</option>
                            </select>
                        </div>
                    </div>

                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label for="EmailID" class="manadatory">
                                    Domicile Certificate Issue on</label>
                                <input id="txtDomicileDate" class="form-control" placeholder="Certificate Issue Date" name="txtDomicileDate" value="" maxlength="10" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label for="txtCasteNo" class="manadatory">
                                    Domicile Certificate No</label>
                                <input id="txtDomicileNo" class="form-control" placeholder="Certificate No." name="txtDomicileNo" onkeypress="return isNumberKey(event);" value="" maxlength="20" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-9">
                            <div class="form-group">
                                <label for="txtDomicileAuthority" class="manadatory">
                                    Domicile Certificate Issuing Authority</label>
                                <input id="txtDomicileAuthority" class="form-control" placeholder="Certificate Issuing Authority" name="txtDomicileAuthority" value="" autofocus="" />
                            </div>
                        </div>   
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="row" >
            <div id="divDetails1" class="col-md-12 box-container">
                    <div class="box-heading" id="Div42">
                        <h4 class="box-title">Personal Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <%--<div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="firstname">
                                    Name of Student</label>
                                <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Father's Name</label>
                                <input id="FatherName" class="form-control" placeholder="Father's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Mother's Name</label>
                                <input id="MotherName" class="form-control" placeholder="Mother's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" />
                            </div>
                        </div>--%>
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                        <div class="form-group">
                            <label class="" for="ddlHandicap">
                                Physically Challenged</label>
                            <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlHandicap" name="Gender" style="">
                                <option value="0">Select</option>
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                            </select>
                        </div>
                    </div>
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Social Category</label>
                                <select class="form-control" onchange="GetCaste();" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="ddlcategory" name="Category">
                                    <option value="Select Category">Select</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                    <option value="OBC">OBC</option>
                                    <option value="UR">UR</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlGender">
                                    Gender</label>
                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                    <option value="0">Select</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Transgender">Transgender</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    Date of Birth <span style="font-size: 11px;"></span>
                                </label>
                                
                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="10" />
                                    
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-4">
                            <div class="form-group">
                                <label class="" id="AAO" for="AAO">
                                    Age as on 01-01-2021
                                </label>
                                <%--<input id="Age" class="form-control" placeholder="Age (in years)" name="Age" maxlength="2" disabled="disabled" />--%>

                                <div class="col-xs-4 pleft0 pright0 margin-btm">
                                    <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" maxlength="3" readonly="readonly" />
                                </div>
                                <div class="col-xs-4 pleft0 pright0">
                                    <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" maxlength="3" readonly="readonly" />
                                </div>
                                <div class="col-xs-4 pleft0 pright0">
                                    <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" maxlength="3" readonly="readonly" />
                                </div>
                                <%----%>
                            </div>
                        </div>
                        <div class="" id="lblCategory">
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label for="txtCasteDate" class="manadatory">
                                    Caste Certificate Date</label>
                                <input id="txtCasteDate" class="form-control" placeholder="Certificate Issue Date" name="txtCasteDate" value="" maxlength="10" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label for="txtCasteNo" class="manadatory">
                                    Caste Certificate No</label>
                                <input id="txtCasteNo" class="form-control" placeholder="Certificate No." name="txtCasteNo" value="" maxlength="20" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-6">
                            <div class="form-group">
                                <label for="txtAuthority" class="manadatory">
                                    Caste Certificate Issued By</label>
                                <input id="txtAuthority" class="form-control" placeholder="Certificate Issuing Authority" name="txtAuthority" value="" autofocus="" />
                            </div>
                        </div>
                    </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">
                                    Mobile Number</label>
                                <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event);" type="text" value="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label for="EmailID" class="">
                                    Email ID</label>
                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50" autofocus="" style="" />
                            </div>
                        </div><%----%>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="Nationality">Nationality</label>
                            <select class="form-control" data-val="true" data-val-number="Nationality" id="Nationality" name="Nationality">
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
                    <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                        <div class="form-group">
                            <label class="" for="ddlBloodGroup">
                                Blood Group</label>
                            <select class="form-control" data-val="true" data-val-number="BloodGroup" data-val-required="Please select your Blood Group" id="ddlBloodGroup" name="BloodGroup">
                                <option value="Select Blood Group">Select</option>
                                <option value="A">A</option>
                                <option value="A+">A+</option>
                                <option value="B">B</option>
                                <option value="B+">B+</option>
                                <option value="AB">AB</option>
                                <option value="O">O</option>
                            </select>
                        </div>
                    </div>
                    

                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
        </div>
        

        <div class="row">
            <div id="" class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Other Details
                    </h4>
                </div>
                <div class="box-body box-body-open">                    
                    

                    

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                        <div class="form-group mtop5">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-6 pleft0">
                                    <p><span id="lblEduGap"><span class="fom-Numbx">1.</span><span class="manadatory"> Do you have any gap in Educational Qualifications?</span></span></p>
                                </div>
                                <div class="col-md-2 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="EduGap" id="rbtGapY" value="Yes" onclick="return fuShowHideDiv('divGap', 1);" />
                                        Yes<label for="rbtGapY"></label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="EduGap" id="rbtGapN" value="No" onclick="return fuShowHideDiv('divGap', 0);" />
                                        No<label for="rbtGapN"></label>
                                    </div>
                                </div>
                                <div class="col-md-4 pleft0 pright0" id="divGap">
                                    <div class="col-md-6">
                                        <p>
                                            From years   
                                            <input id="FromGap" class="form-control" name="" placeholder="From Years" type="text" onkeypress="return isNumberKey(event);" maxlength="4"/>
                                        </p>
                                    </div>
                                    <div class="col-md-6">
                                        <p>
                                            To years
                                            <input id="ToGap" class="form-control" name="" placeholder="To Years" type="text" onkeypress="return isNumberKey(event);" maxlength="4"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mtop5">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-6 pleft0">
                                    <p><span id="lblMigration"><span class="fom-Numbx">2.</span><span class="manadatory"> Have you received Migration Certificate from other Board/University?</span></span></p>
                                </div>
                                <div class="col-md-2 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="Migration" id="rbtMigrationY" value="Yes" onclick="return fuShowHideDiv('divMigration', 1);" />
                                        Yes<label for="rbtGapY"></label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="Migration" id="rbtMigrationN" value="No" onclick="return fuShowHideDiv('divMigration', 0);" />
                                        No<label for="rbtGapN"></label>
                                    </div>
                                </div>
                                <div class="col-md-4 pleft0 pright0" id="divMigration">
                                    <div class="col-md-6">
                                        <p>
                                            <span class="manadatory">Migration No.</span>   
                                            <input id="MigrationNo" class="form-control" name="" placeholder="Migration No" maxlength="15" type="text" />
                                        </p>
                                    </div>
                                    <div class="col-md-6">
                                        <p>
                                            <span class="manadatory">Date of Issue</span>
                                            <input id="MigrationIssue" class="form-control" name="" placeholder="Date of Migration" type="text" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mtop5">
                            <div class="col-lg-12 othrinfohd">
                                <div class="col-md-6 pleft0">
                                    <p><span id="lblScoureCard"><span class="fom-Numbx">3.</span><span class="manadatory"> Do you have DTE Counselling Entrance Exam Score Card?</span></span></p>
                                </div>
                                <div class="col-md-2 pleft0 pright0">
                                    <div class="col-xs-6 pleft0">
                                        <input type="radio" name="ScoureCard" id="rbtScoureCardY" value="Yes" onclick="return fuShowHideDiv('divScoureCard', 1);" />
                                        Yes<label for="rbtGapY"></label>
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="radio" name="ScoureCard" id="rbtScoureCardN" value="No" onclick="return fuShowHideDiv('divScoureCard', 0);" />
                                        No<label for="rbtGapN"></label>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-lg-12 othrinfohd" id="divScoureCard">
                                <div class="col-md-3 pleft0 pright0">
                                    <div class="col-md-12">
                                        <p>
                                            <span class="manadatory">Examination Roll No</span>
                                            <input id="txtCompRollNo" class="form-control" name="" placeholder="Comp. Exam. Roll No." maxlength="15" type="text" />
                                        </p>
                                    </div>

                                </div>
                                <div class="col-md-7 pleft0 pright0">
                                    <div class="col-md-12">
                                        <p>
                                            <span class="manadatory">Name of Competitive Examination Passed</span>
                                            <input id="txtCompName" class="form-control" name="" placeholder="Name of Competitive Examination" type="text" />
                                        </p>
                                    </div>

                                </div>
                                <div class="col-md-2 pleft0 pright0">
                                    <div class="col-md-12">
                                        <p>
                                            <span class="manadatory">Marks Scored (%)</span>
                                            <input id="txtScoreCard" class="form-control" name="" placeholder="Marks Secured (%)" onkeypress="return isNumberKeyDecimal(event);" maxlength="5" type="text" />
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
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
                                <input name="" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" />
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

        <div class="row">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title" id="lblEducation">Educational Qualification
                    </h4>
                </div>

                <div class="box-body box-body-open" style="padding: 0 !important; margin: 0 !important">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0 !important">
                        <div class="form-group error" id="divmore" runat="server" style="display: none;">
                        </div>
                        <div id="divSuspect">
                        </div>
                        <div class="table-responsive">
                            <table class="table1 table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 60px">Examination</th>
                                        <th style="width: 80px;">
                                            Roll No
                                        </th>
                                        <th>Name of the Examination Passed</th>
                                        <th>Name of the Board / Council, State</th>
                                        <th>Name of School / Institution / College</th>
                                        <th style="width: 60px">Year of Passing</th>
                                        <th style="width: 60px">Total Marks</th>
                                        <th style="width: 60px">Marks Secured</th>
                                        <th style="width: 60px">Percentage</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <select name="ddlBoard" id="ddlBoard" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select." onchange="BoardOnChange();" >
                                                <option value="0">Select Board</option>
                                                <option value="Metriculation">Metriculation</option>
                                                <option value="Higher Secondary">Higher Secondary</option>
                                                <option value="Graduation">Graduation</option>
                                                <option value="Other">Other</option>
                                            </select></td>
                                        <td>
                                            <input id="txtRollNo" class="form-control" placeholder="Roll No" name="txtBoardRollNo2" type="text" maxlength="20" onkeypress="return AlphaNumericHypenNSlash(event);" />
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" placeholder="" id="txtCourseName" /></td>
                                        <td>
                                            <input type="text" class="form-control" placeholder="" id="txtBoard" /></td>
                                        <td>
                                            <input type="text" class="form-control" placeholder="" id="txtSchool" /></td>
                                        <td>
                                            <select name="ddlYOPYr" id="YOP" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                <option value="0">Select Year</option>
                                                <option value="1921">1921</option>
												<option value="1922">1922</option>
												<option value="1923">1923</option>
												<option value="1924">1924</option>
												<option value="1925">1925</option>
												<option value="1926">1926</option>
												<option value="1927">1927</option>
												<option value="1928">1928</option>
												<option value="1929">1929</option>
												<option value="1930">1930</option>
												<option value="1931">1931</option>
												<option value="1932">1932</option>
												<option value="1933">1933</option>
												<option value="1934">1934</option>
												<option value="1935">1935</option>
												<option value="1936">1936</option>
												<option value="1937">1937</option>
												<option value="1938">1938</option>
												<option value="1939">1939</option>
												<option value="1940">1940</option>
												<option value="1941">1941</option>
												<option value="1942">1942</option>
												<option value="1943">1943</option>
												<option value="1944">1944</option>
												<option value="1945">1945</option>
												<option value="1946">1946</option>
												<option value="1947">1947</option>
												<option value="1948">1948</option>
												<option value="1949">1949</option>
												<option value="1950">1950</option>
												<option value="1951">1951</option>
												<option value="1952">1952</option>
												<option value="1953">1953</option>
												<option value="1954">1954</option>
												<option value="1955">1955</option>
												<option value="1956">1956</option>
												<option value="1957">1957</option>
												<option value="1958">1958</option>
												<option value="1959">1959</option>
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
												<option value="1990">1990</option>
												<option value="1991">1991</option>
												<option value="1992">1992</option>
												<option value="1993">1993</option>
												<option value="1994">1994</option>

												
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
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>

                                            </select>
                                        </td>
                                        <td>
                                            <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTotalMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                        </td>
                                        <td>
                                            <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMarkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event);" onchange="calculatepercentage();" />
                                        </td>
                                        <td>
                                            <input id="txtPercentage" class="form-control" name="txtPercentage" type="text" readonly="true" maxlength="5" />
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-success" id="btnAdd" value="Save" onclick="AddSuspect('');" /></td>
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
            <div class="col-md-6 box-container">
                <div class="box-heading">
                    <h4 class="box-title">List of Document to be Submitted at College
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">                        
                        <table class="table table-bordered">
                            <tr>
                                <th style="width:20px;text-align:left">Select</th>
                                <th style="width:20px;text-align:left">Sl.No.</th>
                                <th style="width:200px;text-align:left">Document Name</th>
                            </tr>
                            <tr id="trClassX">
                                <td style="text-align: center"><input name="" type="checkbox" id="chkClassX" /></td>
                                <td style="text-align: center">1.</td>
                                <td>Photocopy of Class-X Mark Sheet</td>
                            </tr>
                            <tr id="trClassXII">
                                <td style="text-align: center">
                                    <input id="chkClassXII" name="" type="checkbox" /></td>
                                <td style="text-align: center">2.</td>
                                <td>Photocopy of Class-XII Mark Sheet </td>
                            </tr>
                            <tr id="trClassDiploma">
                                <td style="text-align: center">
                                    <input id="chkDiploma" name="" type="checkbox" /></td>
                                <td style="text-align: center">3.</td>
                                <td>Photocopy of Diploma Mark Sheet</td>
                            </tr>
                            <tr id="trUG">
                                <td style="text-align: center">
                                    <input id="chkUG" name="" type="checkbox" /></td>
                                <td style="text-align: center">4.</td>
                                <td>Photocopy of Graduation Mark Sheet</td>
                            </tr>
                            <tr id="trPG">
                                <td style="text-align: center">
                                    <input id="chkPG" name="" type="checkbox" /></td>
                                <td style="text-align: center">5.</td>
                                <td>Photocopy of Post Graduate Mark Sheet</td>
                            </tr>
                            <tr id="trMig">
                                <td style="text-align: center">
                                    <input id="chkMig" name="" type="checkbox" /></td>
                                <td style="text-align: center">6.</td>
                                <td>Orginal Migration Certificate</td>
                            </tr>
                            <tr id="trCaste">
                                <td style="text-align: center">
                                    <input id="chkCaste" name="" type="checkbox" /></td>
                                <td style="text-align: center">7.</td>
                                <td>Photocopy of Caste Certificate</td>
                            </tr>
                            <tr id="trDomicile">
                                <td style="text-align: center">
                                    <input id="chkDomicile" name="" type="checkbox" /></td>
                                <td style="text-align: center">8.</td>
                                <td>Photocopy of Domicile Certificate</td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <input id="chkGap" name="" type="checkbox" /></td>
                                <td style="text-align: center">9.</td>
                                <td>Original Gap in Education </td>
                            </tr>
                            <tr id="trScore">
                                <td style="text-align: center">
                                    <input id="chkScore" name="" type="checkbox" /></td>
                                <td style="text-align: center">10</td>
                                <td style="white-space:nowrap" >Photo Copy of Original Entrance Examination Score Card </td>
                            </tr>
                            <tr id="trOtherDoc">
                                <td style="text-align: center">
                                    <input id="chkOtherDoc" name="" type="checkbox" /></td>
                                <td style="text-align: center">11.</td>
                                <td>Any other Document </td>
                            </tr>
                        </table>
                        
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>  
            <div class="col-md-6 box-container" style="">
                <div class="box-heading">                    
					<h4 class="box-title">Qualifiaction Details 
                        </h4>
                        <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                            <h4 class="box-title">
                            <a href="/download/DTE Admission Rule 16.07.2021 Hindi for MPCON.pdf" target="_blank" >click here  before filling</a><span class="clearfix">
                            </span>
                    </h4>
					
                </div>

                <div class="box-body box-body-open" style="padding: 0 !important; margin: 0 !important">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0 !important">
                        
                        <div class="table-responsive col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <table class="table1 table-bordered" style="width:100%;margin:auto 0">
                                <thead>
                                    <tr>
                                        <th style="white-space:nowrap">Name of Subject</th>
                                        <th style="white-space:nowrap">Total Marks</th>
                                        <th style="white-space:nowrap">Marks Secured</th>
                                        <th style="white-space:nowrap">Percentage</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input id="txtPhySubject" class="form-control" placeholder="Subject Name" name="txtPhySubject" type="text" value="" autofocus="" /></td>
                                        <td>
                                            <input id="txtPhyTotalMarks" class="form-control" placeholder="Total Marks" name="txtPhyTotalMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                        </td>
                                        <td>
                                            <input id="txtPhyMarkSecure" class="form-control" placeholder="Marks Secure" name="txtPhyMarkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event);" />
                                        </td>
                                        <td>
                                            <input id="txtPhyPercentage" class="form-control" name="txtPhyPercentage" type="text" readonly="true" maxlength="5" />
                                        </td>
                                    </tr><tr>
                                        <td>
                                            <input id="txtCheSubject" class="form-control" placeholder="Subject Name" name="txtPhySubject0" type="text" value="" autofocus="" /></td>
                                        <td>
                                            <input id="txtCheTotalMarks" class="form-control" placeholder="Total Marks" name="txtCheTotalMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                        </td>
                                        <td>
                                            <input id="txtCheMarkSecure" class="form-control" placeholder="Marks Secure" name="txtCheMarkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event);" />
                                        </td>
                                        <td>
                                            <input id="txtChePercentage" class="form-control" name="txtChePercentage" type="text" readonly="true" maxlength="5" />
                                        </td>
                                    </tr><tr>
                                        <td>
                                            <input id="txtMatSubject" class="form-control" placeholder="Subject Name" name="txtPhySubject1" type="text" value="" autofocus="" /></td>
                                        <td>
                                            <input id="txtMatTotalMarks" class="form-control" placeholder="Total Marks" name="txtMatTotalMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                        </td>
                                        <td>
                                            <input id="txtMatMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMatMarkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event);" />
                                        </td>
                                        <td>
                                            <input id="txtMatPercentage" class="form-control" name="txtMatPercentage" type="text" readonly="true" maxlength="5" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>      
            <div class="col-md-6 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Enrollment Fees
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <ul>
                            <li>Rs.<span id="lblAmount" style="color:maroon;font-weight:bold"> 1,500.00 (Rupees One Thousand and five hundred only)</span> inclusive of taxes</li>                            
                            <li>Payment to be made online</li>   
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title manadatory" id="lblDeclaration">
                        <input name="" type="checkbox" id="chkDeclaration" onclick="javascript: Declaration(this.checked);" />Declaration
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
                            <p>
                                I also declare that at Present I am not pursuing any other courses/Studies in any institute/university/board as a regular student and I am not employed in any institute/organization/industry/any other place, discharging duties during class hours.
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
		<div class="row">
            <div class="col-md-12 box-container" style="margin-top: 5px;display:none">
                <div class="box-body box-body-open" style="text-align: center;color:red;font-size:15px">
					<b>Please recheck the filled application before submission, no correction will be entertain once the application is submitted.</b>
			</div>
			</div>
		</div>
        <div id="divBtn" class="row">
            <div class="col-md-12 box-container" style="margin-top: 5px;">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnSubmit" class="btn btn-success" value="Enroll &amp; Proceed" title="Proceed to Upload Necessary Document" disabled="" onclick="SubmitData();" />
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
		
		<asp:HiddenField ID="hdfCourseCode" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdfProgramCode" runat="server" ClientIDMode="Static" />
		
    </div>
    </span>
</asp:Content>
