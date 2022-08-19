<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="EnrolementForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Enrolement.EnrolementForm" %>

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
            debugger;
            $("#load").hide();

            var qs = getQueryStrings();
            var enrolementNo = qs['RollNo'];
            var branch = qs['BranchCode'];

            fnFetchUserDetails(enrolementNo, branch);

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
            $('#ddlAP').change(
               function () {
                   var CourseName = $('#ddlBranch option:selected').val();
                   if (CourseName == "SCIENCE PASS") {
                       BindCore2(CourseName);
                   }
                   else if (CourseName == "ARTS PASS") {
                       BindArtsPassCore2(CourseName);
                   }

               }
            );
            $('#ddlAP1').change(
            function () {
                var CourseName = $('#ddlBranch option:selected').val();
                if (CourseName == "SCIENCE PASS") {
                    BindCore3(CourseName);
                }

            }
            );

        });

        function BindBranch(BranchName) {
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSCourseList',
                data: '{}',
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;

                    var ddlps = $("#ddlBranch");
                    ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
                    $.each(Category, function () {
                        $("#ddlBranch").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        catCount++;

                    });
                    if (BranchName != null && BranchName != "" && BranchName != "undefined") {
                        $('#ddlBranch').val(BranchName);
                    }
                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }

        function BindSelectedSubject(Subject, Branch) {
            debugger;
            // selectByVal("ddlBranch", Branch);
            BindBranch(Branch);
            $('#ddlBranch').prop('disabled', true);
            var str = 0;
            if (Subject == null || Subject == "" || Subject == "undefined") {
                str = "0";
            }
            else {
                str = Subject;
            }

            if (str != null && str != 'undefined' && str != '') {
                var arr = str.split(',');


                // jQuery("#ddlAP1 option:contains('" + AP + "')").remove();

                var CourseName = Branch;
                if (CourseName == "ARTS PASS") {
                    var AP = arr[0];
                    var AP1 = arr[1];
                    var AP2 = "";
                    var GE = arr[2];
                    var MIL = arr[3];
                    var AECC = arr[4];
                    var SECB = arr[5];
                    BindSubject(CourseName, 'CORE', '#ddlAP', AP);
                    BindSubject(CourseName, 'CORE', '#ddlAP1', AP1);
                    BindSubject(CourseName, 'GE', '#ddlGE', GE);
                    BindSubject(CourseName, 'MIL', '#ddlMIL', MIL);
                    BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
                    BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);
                    $("#DivCore1").show();
                    $("#DivCore2").show();
                    $("#DivCore3").hide();
                    $("#DivMIL").show();
                    $("#DivGE").show();
                    $("#DivAECC").show();
                    $("#DivSEC").show();
                    $("#ddlAP1 option[value='" + AP + "']").remove();

                    $("#lblAP").html('DSC-A');
                    $("#lblAP1").html('DSC-B');
                    $("#lblGE").html('GE');
                    $("#lblMIL").html('MIL');
                    $("#AECC").html('AECC-II');
                    $("#lblSEC").html('SEC-D');
                }
                else if (CourseName == "ARTS HONOURS" || CourseName == "SCIENCE HONOURS") {
                    var AP = arr[0];
                    var GE = arr[1];
                    var AECC = arr[2];
                    var SECB = arr[3];
                    BindSubject(CourseName, 'DSC', '#ddlAP', AP);
                    BindSubject(CourseName, 'GE', '#ddlGE', GE);
                    BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
                    BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);

                    $("#DivCore1").show();
                    $("#DivCore2").hide();
                    $("#DivCore3").hide();
                    $("#DivMIL").hide();
                    $("#DivGE").show();
                    $("#DivAECC").show();
                    $("#DivSEC").show();

                    $("#lblGE").html('GE');
                    $("#lblAP").html('DSC-A');
                    $("#AECC").html('AECC-II');
                    $("#lblSEC").html('SEC-B');
                }
                else if (CourseName == "SCIENCE PASS") {
                    var AP = arr[0];
                    var AP1 = arr[1];
                    var AP2 = arr[2];
                    var AECC = arr[3];
                    var SECB = arr[4];
                    BindSubject(CourseName, 'DSC', '#ddlAP', AP);
                    BindSubject(CourseName, 'DSC', '#ddlAP1', AP1);
                    BindSubject(CourseName, 'DSC', '#ddlAP2', AP2);
                    BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
                    BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);

                    $("#DivCore1").show();
                    $("#DivCore2").show();
                    $("#DivCore3").show();
                    $("#DivMIL").hide();
                    $("#DivGE").hide();
                    $("#DivAECC").show();
                    $("#DivSEC").show();

                    $("#lblAP").html('DSC-A');
                    $("#lblAP1").html('DSC-B');
                    $("#lblAP2").html('DSC-C');
                    $("#AECC").html('AECC-II');
                    $("#lblSEC").html('SEC-D');
                }
                else if (CourseName == "COMMERCE HONOURS" || CourseName == "COMMERCE PASS") {
                    var AECC = arr[0];
                    var SECB = arr[1];
                    BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
                    BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);
                    $("#DivCore1").hide();
                    $("#DivCore2").hide();
                    $("#DivCore3").hide();
                    $("#DivMIL").hide();
                    $("#DivGE").hide();
                    $("#DivAECC").show();
                    $("#DivSEC").show();

                    $("#AECC").html('AECC-II');
                    if (CourseName == "COMMERCE HONOURS") {
                        $("#lblSEC").html('SEC-D');
                    } else { $("#lblSEC").html('SEC-B'); }

                }
                else {
                    $("#DivCore1").hide();
                    $("#DivCore2").hide();
                    $("#DivCore3").hide();
                    $("#DivMIL").hide();
                    $("#DivGE").hide();
                    $("#DivAECC").hide();
                    $("#DivSEC").hide();
                }
            }

        }
        function BindSubject(BranchName, SubjectType, ddlID, SelelctedVal) {
            var CourseName = BranchName;
            var SubType = SubjectType;
            var ControlID = ddlID;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
                data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
                dataType: "json",
                success: function (response) {

                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;

                    var ddlSubject = $(ControlID);
                    ddlSubject.empty().append('<option selected="selected" value="0">Select</option>');
                    $.each(Category, function () {
                        $(ControlID).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        catCount++;

                    });
                    if (SelelctedVal != 'undefined' && SelelctedVal != '' && SelelctedVal != null) {
                        $(ControlID).val(SelelctedVal);
                    }
                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }
        //bind core two for arts pass
        function BindArtsPassCore2(BranchName) {
            var CourseName = BranchName;// $("#ddlBranch").val();
            var SubType = "CORE";
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
                data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
                dataType: "json",
                success: function (response) {

                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;

                    var ddlSubject2 = $("[id=ddlAP1]");
                    ddlSubject2.empty().append('<option selected="selected" value="0">Select</option>');
                    $.each(Category, function () {
                        $("[id=ddlAP1]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        catCount++;
                        jQuery("#ddlAP1 option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
                    });
                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }
        //bind DSC two for science pass
        function BindCore2(BranchName) {
            var CourseName = BranchName;//$("#ddlBranch").val();
            var SubType = "DSC";
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
                data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
                dataType: "json",
                success: function (response) {

                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;

                    var ddlAP1 = $("[id=ddlAP1]");
                    ddlAP1.empty().append('<option selected="selected" value="0">Select</option>');
                    $.each(Category, function () {
                        $("[id=ddlAP1]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        catCount++;
                        jQuery("#ddlAP1 option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
                    });
                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }
        //bind DSC three for science pass
        function BindCore3(BranchName) {
            var CourseName = BranchName;// $("#ddlBranch").val();
            var SubType = "DSC";
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
                data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
                dataType: "json",
                success: function (response) {

                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;

                    var ddlAP2 = $("[id=ddlAP2]");
                    ddlAP2.empty().append('<option selected="selected" value="0">Select</option>');
                    $.each(Category, function () {
                        $("[id=ddlAP2]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        catCount++;
                        jQuery("#ddlAP2 option:contains('" + $("#ddlAP1 option:selected").text() + "')").remove();
                        jQuery("#ddlAP2 option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
                    });
                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }
       

        function ClearDropValue() {
            $("#ddlAP").empty().append('<option selected="selected" value="0">Select</option>');
            $("#ddlAP1").empty().append('<option selected="selected" value="0">Select</option>');
            $("#ddlAP2").empty().append('<option selected="selected" value="0">Select</option>');
            $("#ddlMIL").empty().append('<option selected="selected" value="0">Select</option>');
            $("#ddlGE").empty().append('<option selected="selected" value="0">Select</option>');
            $("#ddlAECC").empty().append('<option selected="selected" value="0">Select</option>');
            $("#ddlSECB").empty().append('<option selected="selected" value="0">Select</option>');
        }
    </script>

    <script type="text/javascript">



        function getQueryStrings() {
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


        function OUATDeclaration(chk) {



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

        function fnFetchUserDetails(EnrolementNo, Branch) {
            //var qs = getQueryStrings();
            //var enrolementNo = qs["RegNo"];
            //var branch = qs["BranchCode"];
            $.when(
              $.ajax({
                  type: "POST",
                  contentType: "application/json; charset=utf-8",
                  url: '/WebApp/Kiosk/Enrolement/EnrolementForm.aspx/GetStudentDetails',
                  data: '{"EnrolementNo":"' + EnrolementNo + '", "Branch":"' + Branch + '"}',
                  processData: false,
                  dataType: "json",
                  success: function (response) {

                  },
                  error: function (a, b, c) {
                      alert("1." + a.responseText);
                  }
              })
               ).then(function (data, textStatus, jqXHR) {
                   var obj = jQuery.parseJSON(data.d);
                   var AppID = obj.AppID;
                   var arr = eval(data.d);
                   var html = "";
                   //var AdmissionNo = arr[0].AdmissionNo;
                   //var AdmissionDate = arr[0].AdmissionDate;
                   var BranchCode = arr[0].BranchCode;
                   var BranchName = arr[0].BranchName;
                   var Name = arr[0].Name;
                   var mobile = arr[0].Mobile;
                   var email = arr[0].Email;
                   var Father = arr[0].Father;
                   var Mother = arr[0].Mother;
                   var Gaurdian = arr[0].Gaurdian;
                   var Relation = arr[0].Relation;
                   var DOB = arr[0].DOB;
                   var Gender = arr[0].Gender;
                   var MotherTongue = arr[0].MotherTongue;
                   var Category = arr[0].Category;
                   var UserId = arr[0].UserId;
                   var Age = arr[0].Age;
                   var name = arr[0].Name;
                   var CollegeName = arr[0].CollegeName;
                   var CollegeCode = arr[0].CollegeCode;
                   var SubjectList = arr[0].SubjectList;
                   var RegdNo = arr[0].RegdNo;

                   if (RegdNo != null && RegdNo != "") {
                       $('#txtRegdNo').val(RegdNo);
                       $('#txtRegdNo').prop('disabled', true);
                   }
                   else {
                       $('#txtRegdNo').prop('disabled', false);
                   }

                   if (CollegeName != null && CollegeName != "") {
                       $('#CollegeName').val(CollegeName);
                       $('#CollegeName').prop('disabled', true);
                   }
                   if (CollegeCode != null && CollegeCode != "") {
                       $('#CollegeCode').val(CollegeCode);
                       $('#CollegeCode').prop('disabled', true);
                   }
                   if (name != null && name != "") {
                       $('#FirstName').val(name);
                       $('#FirstName').prop('disabled', true);
                   }

                   if (email != null && email != "") {
                       $('#EmailID').val(email);
                       $('#EmailID').prop('disabled', true);
                   }

                   if (mobile != null && mobile != "") {
                       $('#MobileNo').val(mobile);
                       $('#MobileNo').prop('disabled', true);
                   }


                   if (Relation != null && Relation != "") {
                       // GetRelationList();
                       //selectByVal("ddlRelation", Relation);
                       $("#ddlRelation option:selected").text(Relation);
                       //$("[id*=" + id + "]").val(Relation);
                       $('#ddlRelation').prop('disabled', true);
                   }
                   if (DOB != null && DOB != "") {
                       $('#DOB').val(DOB);
                       $('#DOB').prop('disabled', true);
                   }
                   if (Age != null && Age != "") {
                       $('#Age').val(Age);
                       $('#Age').prop('disabled', true);
                   }
                   if (Gender != null && Gender != "") {
                       if (Gender == "W") {
                           $('#ddlGender').val("F").prop('disabled', true);
                       }
                       else if (Gender == "" || Gender == null || Gender == "undefined") {
                           $('#ddlGender').val("M").prop('disabled', true);
                       }
                       else {
                           $('#ddlGender').val("T").prop('disabled', true);
                       }
                   }
                   if (Category != null && Category != "") {
                       if (Category == "" || Category == null || Category == "undefined") {
                           $('#ddlcategory').val("General");
                       }
                       else if (Category == "OB") {
                           $('#ddlcategory').val("OBC");
                       }
                       else if (Category == "ST") {
                           $('#ddlcategory').val("ST");
                       }
                       else if (Category == "SC") {
                           $('#ddlcategory').val("SC");
                       }
                   }
                   if (UserId != null && UserId != "") {
                       $('#UserCode').val(UserId);
                       $('#UserCode').prop('disabled', true);
                   }

                   if (BranchName != "" && BranchName != null) {
                       //BindBranch(BranchName);
                      // $('#ddlBranch').prop('disabled', true);

                       BindSelectedSubject("", BranchName);
                   }
                   else {
                       BindBranch('');
                   }

               });
        }

        function SubmitData() {


            if (!ValidateForm()) {
                return false;
            }

            //$("#btnSubmit").prop('disabled', true);

            var t_Message = "";
            var result = false;

            var qs = getQueryStrings();
            var uid = qs["UID"];
            var svcid = qs["SvcID"];
            var dpt = qs["DPT"];
            var dist = qs["DIST"];
            var blk = qs["BLK"];
            var pan = qs["PAN"];
            var ofc = qs["OFC"];
            var ofr = qs["OFR"];

            var DOB = $("#DOB");

            if (DOB.val() != '') {
                var todaydate = $.datepicker.formatDate('dd/mm/yy', new Date());
                var txtDOB = DOB.val();
                var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
                var Age = calcExSerDur(txtDOB, todaydate);
                var ageToCompare = Age.years;
                var ageActual = Age.years;
            }

            var temp = "Gunwant";
            var AppID = "";
            var rtnurl = "";

            var ResponseType = "C";

            if ($("#HFUIDData").val() != "") {
                ResponseType = "";
            }

            var result = false;
            var DOBArr = $('#DOB').val().split("/");
            var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];
            //admission of date
            var AOPArr = "";
            var DOAConverted = "";
            //Mother Tongue
            var MotherTongue = "";
            if ($('#txtTongue option:selected').text() == "Other") {
                MotherTongue = $('#MTOther').val();
            }
            else {
                MotherTongue = $('#txtTongue option:selected').text()
            }

            var datavar = {

                'ProfileID': uid,
                'AadhaarNumber': $('#UID').val(),
                'AadhaarDetail': $('#ddlSearch option:selected').text(),
                'AppName': $('#FirstName').val(),
                'DOB': DOBConverted,
                'Gender': $('#ddlGender').val(),
                'MobileNo': $('#MobileNo').val(),
                'EmailId': $('#EmailID').val(),
                'MotherTongue': MotherTongue,//$('#txtTongue option:selected').text(),
                'careOf': "1",
                'careOfLocal': "1",
                'pcareOf': "1",
                'residentName': $('#FirstName').val(),
                'residentNameLocal': $('#FirstName').val(),
                'houseNumber': $("#PAddressLine1").val(),
                'houseNumberLocal': $("#PAddressLine1").val(),

                'landmark': $("#PLandMark").val(),
                'landmarkLocal': $("#PLandMark").val(),

                'locality': $("#PLocality").val(),
                'localityLocal': $("#PLocality").val(),

                'street': $("#PRoadStreetName").val(),
                'streetLocal': $("#PRoadStreetName").val(),

                'postOffice': $("#PAddressLine2").val(),
                'postOfficeLocal': $("#PAddressLine2").val(),

                'state': $('#PddlState').val(),
                'stateLocal': $('#PddlState').val(),
                'district': $('#PddlDistrict').val(),
                'districtLocal': $('#PddlDistrict').val(),
                'subDistrict': $('#PddlTaluka').val(),
                'subDistrictLocal': $('#PddlTaluka').val(),
                'Village': $('#PddlVillage').val(),
                'pincode': $('#PPinCode').val(),
                'pincodeLocal': $('#PPinCode').val(),

                'Image': $('#HFb64').val(),
                'ImageSign': $('#HFb64Sign').val(),
                'phouseNumber': $("#CAddressLine1").val(),
                'plandmark': $("#CLandMark").val(),
                'plocality': $("#CLocality").val(),
                'pstreet': $("#CRoadStreetName").val(),
                'ppincode': $("#CPinCode").val(),
                'ppostOffice': $("#CAddressLine2").val(),

                'pstate': $('#CddlState').val(),
                'pdistrict': $('#CddlDistrict').val(),
                'psubDistrict': $('#CddlTaluka').val(),
                'pvillage': $('#CddlVillage').val(),

                'JSONData': '',
                'statecode': $('#CddlState').val(),
                'districtcode': $('#CddlDistrict').val(),
                'subDistrictcode': $('#CddlTaluka').val(),
                'Villagecode': $('#CddlVillage').val(),

                'FatherName': $('#FatherName').val(),
                'MotherName': $('#MotherName').val(),
                'GuardianName': $('#GuardianName').val(),
                'Relation': $('#ddlRelation option:selected').text(),
                'Category': $('#ddlcategory option:selected').text(),
                'phone': "1",
                'ResponseType': ResponseType,
                'responseCode': "",
                'HeirsDXML': document.getElementById("hdfSuspectSave").value,
                'district': dist,
                'block': blk,
                'panchayat': pan,
                'IsActive': "1",
                'AdmissionDate': DOAConverted,
                'AdmissionNo': $('#AdmissionNo').val(),
                'Branch': $('#ddlBranch option:selected').val(),
                'CollegeCode': $('#CollegeCode').val(),
                'Subject1': $('#ddlAP option:selected').val(),
                'Subject2': $('#ddlAP1 option:selected').val(),
                'Subject3': $('#ddlAP2 option:selected').val(),
                'Subject4': $('#ddlGE option:selected').val(),
                'Subject5': $('#ddlMIL option:selected').val(),
                'Subject6': $('#ddlAECC option:selected').val(),
                'Subject7': $('#ddlSECB option:selected').val(),
                'RollNo': $('#UserID').val(),
                'RegistrationNo': $('#txtRegdNo').val(),
                'Sublbl1': $('#lblAP').text(),
                'Sublbl2': $('#lblAP1').text(),
                'Sublbl3': $('#lblAP2').text(),
                'Sublbl4': $('#lblGE').text(),
                'Sublbl5': $('#lblMIL').text(),
                'Sublbl6': $('#AECC').text(),
                'Sublbl7': $('#lblSEC').text(),
            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": $.stringify(datavar, null, 4)
            };
            $("#load").show();
            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Kiosk/Enrolement/EnrolementForm.aspx/InsertEnrolementFormData',
                    data: $.stringify(obj, null, 4),
                    processData: false,
                    dataType: "json",
                    success: function (response) {

                    },
                    error: function (a, b, c) {
                        $("#load").hide();
                        $("#btnSubmit").prop('disabled', false);
                        result = false;
                        alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
                    }
                })
                ).then(function (data, textStatus, jqXHR) {

                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    var status = obj.Status;
                    var AadhaarNo = obj.AadhaarNo;

                    AppID = obj.AppID;
                    result = true;


                    if (status == "Success") {
                        $("#load").hide();
                        alertPopup("+3 Admission Form", "Application saved successfully. Reference ID : " + obj.AppID);//+ " Please Make Payment against the Application Number."
                        //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=1456&AppID=' + obj.AppID;
                        //window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessbar.aspx?SvcID=424&AppID=' + obj.AppID;
                        window.location.href = '/WebApp/Kiosk/Enrolement/AdmissionProcessBar.aspx?SvcID=1456&AppID=' + obj.AppID;
                    }
                    else if (status == "RollNoExist") {
                        $("#load").hide();
                        alertPopup("Roll No already exist", "Roll no. already exist in the system, please login and check status !.");
                    }
                    else if (status == "Mobile") {
                        $("#load").hide();
                        alertPopup("Mobile No already exist", "Mobile no already registered. Please enter another mobile no.");
                    }
                    else if (status == "Aadhaar") {
                        $("#load").hide();
                        alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system.");
                    }
                    else {
                        $("#load").hide();
                        alertPopup("Either Aadhaar/Mobile No already exist", "Unable to save Application, Please refresh the browser and try again");
                    }


                });// end of Then function of main Data Insert Function

            return false;
        }

        function ValidateForm() {
            var text = "";
            var opt = "";

            // Basic Information 

            var FirstName = $("#FirstName");
            var MobileNo = $("#MobileNo");
            var EmailID = $("#EmailID");
            var DOB = $("#DOB");
            var Age = $("#Age");
            var AgeYear = $("#Year");
            var AgeMonth = $("#Month");
            var AgeDay = $("#Day");
            var Nationality = $("#nationality option:selected").text();
            var Gender = $("#ddlGender option:selected").text();
            //Permanent  address

            var AddressLine1 = $("#PAddressLine1");
            var AddressLine2 = $("#PAddressLine2");
            var RoadStreetName = $("#PRoadStreetName");
            var LandMark = $("#PLandMark");
            var Locality = $("#PLocality");
            var State = $("#PddlState option:selected").text();
            var District = $("#PddlDistrict option:selected").text();
            var Taluka = $("#PddlTaluka option:selected").text();
            var Village = $("#PddlVillage option:selected").text();
            var Pincode = $("#PPinCode");

            //Present  address

            var PreAddressLine1 = $("#CAddressLine1");
            var PreAddressLine2 = $("#CAddressLine2");
            var PreRoadStreetName = $("#CRoadStreetName");
            var PreLandMark = $("#CLandMark");
            var PreLocality = $("#CLocality");
            var PreState = $("#CddlState option:selected").text();
            var PreDistrict = $("#CddlDistrict option:selected").text();
            var PreTaluka = $("#CddlTaluka option:selected").text();
            var PreVillage = $("#CddlVillage option:selected").text();
            var PrePincode = $("#CPinCode");
            var AOP = $("#DOA");
            var Branch = $("#ddlBranch option:selected").text();
            var Father = $("#FatherName");
            var Mother = $("#MotherName");
            var Gaurdian = $("#GuardianName");
            var Category = $("#ddlcategory option:selected").text();
            var AdmissionNo = $("#AdmissionNo");
            var BoardType = $("#ddlBoard option:selected").val();

            if (($("#UID").val() == "" || $("#UID").val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Applicant Aadhaar Number."
                $("#UID").attr('style', 'border:1px solid #d03100 !important;');
                $("#UID").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#UID").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#UID").css({ "background-color": "#ffffff" });
            }


            if (EL("myImg").src.indexOf("photo.png") != -1) {
                text += "<BR>" + " \u002A" + " Please upload Applicant Photograph.";
                $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
                $('#myImg').css({ "background-color": "#fff2ee" });
                $('#myImg').css({ "height": "220px" });
                opt = 1;
            } else {
                $('#myImg').attr('style', 'border:0 !important;');
                $('#myImg').css({ "background-color": "" });
                $('#myImg').css({ "height": "220px" });
            }

            if (EL("mySign").src.indexOf("signature.png") != -1) {
                text += "<BR>" + " \u002A" + " Please upload Applicant Signature.";
                $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
                $('#mySign').css({ "background-color": "#fff2ee" });
                $('#mySign').css({ "height": "130px" });
                opt = 1;
            } else {
                $('#mySign').attr('style', '');
                $('#mySign').css({ "background-color": "" });
                $('#mySign').css({ "height": "130px" });
            }

            if (FirstName.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Full Name. ";
                FirstName.attr('style', 'border:1px solid #d03100 !important;');
                FirstName.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                FirstName.attr('style', '1px solid #cdcdcd !important;');
                FirstName.css({ "background-color": "#ffffff" });
            }
            if (Father.val() == '' && Gaurdian.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Father Name. ";
                Father.attr('style', 'border:1px solid #d03100 !important;');
                Father.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (Mother.val() == '' && Gaurdian.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Mother Name. ";
                Mother.attr('style', 'border:1px solid #d03100 !important;');
                Mother.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if ((Father.val() == '' || Mother.val() == '') && Gaurdian.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Gaurdian Name. ";
                Mother.attr('style', 'border:1px solid #d03100 !important;');
                Mother.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (Category != null && (Category == '' || Category == 'Select' || Category == '-Select-')) {
                text += "<BR>" + " \u002A" + " Please select Category.";
                $('#ddlcategory').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlcategory').css({ "background-color": "#fff2ee" });
                opt = 1;
            }

            if (DOB.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
                DOB.attr('style', 'border:1px solid #d03100 !important;');
                DOB.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                DOB.attr('style', 'border:1px solid #cdcdcd !important;');
                DOB.css({ "background-color": "#ffffff" });
            }

            if ((Gender == '' || Gender == 'Select' || Gender == "0")) {
                text += "<BR>" + " \u002A" + " Please Select Gender. ";
                $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
                $("#ddlGender").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#ddlGender").css({ "background-color": "#ffffff" });
            }


            if (MobileNo.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
                MobileNo.attr('style', 'border:1px solid #d03100 !important;');
                MobileNo.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                //MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
                //MobileNo.css({ "background-color": "#ffffff" });
            }

            if (EmailID.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Email ID. ";
                EmailID.attr('style', 'border:1px solid #d03100 !important;');
                EmailID.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
                EmailID.css({ "background-color": "#ffffff" });
            }



            if (AddressLine1 != null && AddressLine1.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Care of Address in Permanent Address. ";
                AddressLine1.attr('style', 'border:1px solid #d03100 !important;');
                AddressLine1.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                AddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
                AddressLine1.css({ "background-color": "#ffffff" });
            }


            if (RoadStreetName != null && RoadStreetName.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Road /Street Name in Present Address. ";
                RoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
                RoadStreetName.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                RoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
                RoadStreetName.css({ "background-color": "#ffffff" });
            }


            if (Locality != null && Locality.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Locality in Present Address. ";
                Locality.attr('style', 'border:1px solid #d03100 !important;');
                Locality.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                Locality.attr('style', 'border:1px solid #cdcdcd !important;');
                Locality.css({ "background-color": "#ffffff" });
            }


            if ($("#HFUIDData").val() == "") {// 2016-11-08 Logic altered to skip validating these details when user has fetched the details from Aadhaar.
                if (State != null && (State == '' || State == '-Select-')) {
                    text += "<BR>" + " \u002A" + " Please select State in Permanent Address.";
                    $('#PddlState').attr('style', 'border:1px solid #d03100 !important;');
                    $('#PddlState').css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $('#PddlState').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#PddlState').css({ "background-color": "#ffffff" });
                }

                if (District != null && (District == '' || District == '-Select-' || District == 'Select District')) {
                    text += "<BR>" + " \u002A" + " Please select District in Permanent Address.";
                    $('#PddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
                    $('#PddlDistrict').css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $('#PddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#PddlDistrict').css({ "background-color": "#ffffff" });
                }
            }

            if (Pincode != null && Pincode.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Pincode in Permanent Address.";
                $('#PPinCode').attr('style', 'border:1px solid #d03100 !important;');
                $('#PPinCode').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#PPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#PPinCode').css({ "background-color": "#ffffff" });
            }

            ///////////////////////
            if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Care of Address in Present Address. ";
                PreAddressLine1.attr('style', 'border:1px solid #d03100 !important;');
                PreAddressLine1.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                PreAddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
                PreAddressLine1.css({ "background-color": "#ffffff" });
            }

            if (PreRoadStreetName != null && PreRoadStreetName.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Care of Address in Present Address. ";
                PreRoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
                PreRoadStreetName.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                PreRoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
                PreRoadStreetName.css({ "background-color": "#ffffff" });
            }

            if (PreLocality != null && PreLocality.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Locality in Present Address. ";
                PreLocality.attr('style', 'border:1px solid #d03100 !important;');
                PreLocality.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                PreLocality.attr('style', 'border:1px solid #cdcdcd !important;');
                PreLocality.css({ "background-color": "#ffffff" });
            }
            if (PreState != null && (PreState == '' || PreState == '-Select-')) {
                text += "<BR>" + " \u002A" + " Please select State in Present Address.";
                $('#CddlState').attr('style', 'border:1px solid #d03100 !important;');
                $('#CddlState').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#CddlState').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#CddlState').css({ "background-color": "#ffffff" });
            }

            if (PreDistrict != null && (PreDistrict == '' || PreDistrict == '-Select-' || PreDistrict == 'Select District')) {
                text += "<BR>" + " \u002A" + " Please select District in Present Address.";
                $('#CddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
                $('#CddlDistrict').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#CddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#CddlDistrict').css({ "background-color": "#ffffff" });
            }

            if (PrePincode != null && PrePincode.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Pincode in Present Address.";
                $('#CPinCode').attr('style', 'border:1px solid #d03100 !important;');
                $('#CPinCode').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                //$('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
                //$('#CPinCode').css({ "background-color": "#ffffff" });
            }


            if (PrePincode != null && PrePincode.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Pincode in Present Address.";
                $('#CPinCode').attr('style', 'border:1px solid #d03100 !important;');
                $('#CPinCode').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                //$('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
                //$('#CPinCode').css({ "background-color": "#ffffff" });
            }

            var CourseName = $("#ddlBranch").val();
            var DSC1 = $('#ddlAP option:selected').val();
            var DSC2 = $('#ddlAP1 option:selected').val();
            var DSC3 = $('#ddlAP2 option:selected').val();
            var GE = $('#ddlGE option:selected').val();
            var MIL = $('#ddlMIL option:selected').val();
            var AECC = $('#ddlAECC option:selected').val();
            var SECB = $('#ddlSECB option:selected').val();
            var IsRequired = $("#HDFRequiredSubject").val();

            if (IsRequired == 1) {
                if (1 == 0) {
                    if (CourseName == "ARTS PASS") {
                        if (DSC1 != null && (DSC1 == '0' || DSC1 == 'Select' || DSC1 == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select DSC-1.";
                            $('#ddlAP').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAP').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (DSC2 != null && (DSC2 == '0' || DSC2 == 'Select' || DSC2 == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select DSC-2.";
                            $('#ddlAP1').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAP1').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (GE != null && (GE == '0' || GE == 'Select' || GE == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select GE.";
                            $('#ddlGE').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlGE').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (MIL != null && (MIL == '0' || MIL == 'Select' || MIL == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select MIL.";
                            $('#ddlMIL').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlMIL').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select AECC-II.";
                            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAECC').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select SEC-D.";
                            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlSECB').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                    }
                    else if (CourseName == "ARTS HONOURS") {

                        if (DSC1 != null && (DSC1 == '0' || DSC1 == 'Select' || DSC1 == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select DSC-1.";
                            $('#ddlAP').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAP').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                        if (GE != null && (GE == '0' || GE == 'Select' || GE == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select GE.";
                            $('#ddlGE').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlGE').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select AECC-II.";
                            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAECC').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select SEC-B.";
                            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlSECB').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                    }
                    else if (CourseName == "SCIENCE HONOURS") {

                        if (DSC1 != null && (DSC1 == '0' || DSC1 == 'Select' || DSC1 == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select DSC-1.";
                            $('#ddlAP').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAP').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                        if (GE != null && (GE == '0' || GE == 'Select' || GE == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select GE.";
                            $('#ddlGE').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlGE').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select AECC-II.";
                            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAECC').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select SEC-B.";
                            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlSECB').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                    }
                    else if (CourseName == "SCIENCE PASS") {

                        if (DSC1 != null && (DSC1 == '0' || DSC1 == 'Select' || DSC1 == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select DSC-1.";
                            $('#ddlAP').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAP').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (DSC2 != null && (DSC2 == '0' || DSC2 == 'Select' || DSC2 == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select DSC-2.";
                            $('#ddlAP1').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAP1').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (DSC3 != null && (DSC3 == '0' || DSC3 == 'Select' || DSC3 == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select DSC-3.";
                            $('#ddlAP2').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAP2').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select AECC-II.";
                            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAECC').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select SEC-D.";
                            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlSECB').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                    }
                    else if (CourseName == "COMMERCE HONOURS") {


                        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select AECC-II.";
                            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAECC').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select SEC-B.";
                            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlSECB').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }


                    }
                    else if (CourseName == "COMMERCE PASS") {

                        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select AECC-II.";
                            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlAECC').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
                            text += "<BR>" + " \u002A" + " Please select SEC-D.";
                            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
                            $('#ddlSECB').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }

                    }
                }
            }

            var chkdeclaration = 0;
            if ($('#chkPhysical').is(":checked")) {
                // it is checked
                chkdeclaration = 1;
            }

            //if (chkdeclaration == 0) {
            //    //chkAbility
            //    text += "<br /> - Please check Declaration and read it. ";
            //    opt = 1;
            //    $('#lblDeclaration').attr('style', 'color:red !important;');
            //    $('#lblDeclaration').css({ "color": "red" });
            //}
            //else {
            //    $('#lblDeclaration').attr('style', 'color:#000000 !important;');
            //    $('#lblDeclaration').css({ "color": "#000000 " });
            //}
            if (AdmissionNo.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Admission Number. ";
                AdmissionNo.attr('style', 'border:1px solid #d03100 !important;');
                AdmissionNo.css({ "background-color": "#fff2ee" });
                opt = 1;
            }

            if (AOP.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Date of Admission into college. ";
                AOP.attr('style', 'border:1px solid #d03100 !important;');
                AOP.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {

            }
            var Sec = $("#txtSECB").val();
            var ddlsec = $('#ddlSECB').val();
            //if (Branch != null && (Branch == '' || Branch == '-Select-')) {
            //    text += "<BR>" + " \u002A" + " Please select branch name.";
            //    $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            //    $('#ddlBranch').css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    if (Sec == null || Sec == '') {
            //        if (ddlsec != null && (ddlsec == '0' || ddlsec == '-Select-')) {
            //            text += "<BR>" + " \u002A" + " Please select SEC-B.";
            //            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
            //            $('#ddlSECB').css({ "background-color": "#fff2ee" });
            //            opt = 1;
            //        }
            //    }
            //}
            var MotherTongue = $('#txtTongue option:selected').text();
            var MTOther = $('#MTOther');

            if (MotherTongue != null && (MotherTongue == '' || MotherTongue == 'Select')) {
                text += "<BR>" + " \u002A" + " Please select MotherTongue.";
                $('#txtTongue').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtTongue').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                if (MotherTongue == 'Other') {
                    if (MTOther.val() == '') {
                        text += "<BR>" + " \u002A" + " Please enter MotherTongue other. ";
                        AOP.attr('style', 'border:1px solid #d03100 !important;');
                        AOP.css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                }

            }

            //SSc & HSc Validate

            //Education in HSC
            var BoardRollNo = $("#txtBoardRollNo");
            var BoardName = $("#txtBoardName");
            var txtExmntnName = $("#txtExmntnName");
            var txtPssngYr = $("#txtPssngYr option:selected").text(); //DropDown
            //var ddlPasstype = $("#ddlPasstype option:selected").text();
            var ddlPctgeCalclte = $("#ddlPctgeCalclte option:selected").text();
            var txtTotalMarks = $("#txtTotalMarks");
            var txtMarkSecure = $("#txtMarkSecure");
            var txtPercentage = $("#txtPercentage");

            //if (BoardRollNo != null && BoardRollNo.val() == '') {
            //    text += "<br /> -Please Enter Roll no in Educational Qualification. ";
            //    $('#txtBoardRollNo').attr('style', 'border:1px solid #d03100 !important;');
            //    $('#txtBoardRollNo').css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    $('#txtBoardRollNo').attr('style', 'border:1px solid #cdcdcd !important;');
            //    $('#txtBoardRollNo').css({ "background-color": "#ffffff" });
            //}

            if (BoardName != null && BoardName.val() == '') {
                text += "<br /> -Please enter Name of the Board Examination Passed in Educational Qualification. ";
                $('#txtBoardName').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtBoardName').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtBoardName').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtBoardName').css({ "background-color": "#ffffff" });
            }


            if (txtExmntnName != null && txtExmntnName.val() == '') {
                text += "<br /> -Please enter Name of the Examination Passed in Educational Qualification. ";
                $('#txtExmntnName').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtExmntnName').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtExmntnName').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtExmntnName').css({ "background-color": "#ffffff" });
            }
            var PssngYr = $("#txtPssngYr option:selected").val();
            if (PssngYr != null && (PssngYr == '' || PssngYr == '0')) {
                text += "<br /> -Please select Year of Passing in Educational Qualification.";
                $('#txtPssngYr').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtPssngYr').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtPssngYr').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtPssngYr').css({ "background-color": "#ffffff" });
            }

            //var Passtype = $('#ddlPasstype option:selected').val();
            //if (Passtype != null && (Passtype == '' || Passtype == '0')) {
            //    text += "<br /> -Please select Exam Cleared in Educational Qualification.";
            //    $('#ddlPasstype').attr('style', 'border:1px solid #d03100 !important;');
            //    $('#ddlPasstype').css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    $('#ddlPasstype').attr('style', 'border:1px solid #cdcdcd !important;');
            //    $('#ddlPasstype').css({ "background-color": "#ffffff" });
            //}

            //if (ddlPctgeCalclte != null && (ddlPctgeCalclte == '' || ddlPctgeCalclte == '-Select-')) {
            //    text += "<br /> -Please select Grade in Educational Qualification.";
            //    $('#ddlPctgeCalclte').attr('style', 'border:1px solid #d03100 !important;');
            //    $('#ddlPctgeCalclte').css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    $('#ddlPctgeCalclte').attr('style', 'border:1px solid #cdcdcd !important;');
            //    $('#ddlPctgeCalclte').css({ "background-color": "#ffffff" });
            //}

            if (txtTotalMarks != null && txtTotalMarks.val() == '') {
                text += "<br /> -Please enter Total Marks in Educational Qualification. ";
                $('#txtTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtTotalMarks').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtTotalMarks').css({ "background-color": "#ffffff" });
            }

            if ($("#ddlPctgeCalclte").val() != "501") {
                if (txtMarkSecure != null && txtMarkSecure.val() == '') {
                    text += "<br /> -Please enter Marks Secured in Educational Qualification. ";
                    $('#txtMarkSecure').attr('style', 'border:1px solid #d03100 !important;');
                    $('#txtMarkSecure').css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $('#txtMarkSecure').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#txtMarkSecure').css({ "background-color": "#ffffff" });
                }

            } else {
                $('#txtMarkSecure').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtMarkSecure').css({ "background-color": "#ffffff" });
            }

            if (txtPercentage != null && txtPercentage.val() == '') {
                text += "<br /> -Please calculate the Percentage in Educational Qualification. ";
                opt = 1;
            } else {
            }

            //Eduaction in 10+2
            var BoardRollNo = $("#txtBoardRollNo2");
            var BoardName = $("#txtBoardName2");
            var txtExmntnName = $("#txtExmntnName2");
            var txtPssngYr = $("#txtPssngYr2 option:selected").text(); //DropDown
            //var ddlPasstype = $("#ddlPasstype option:selected").text();
            var ddlPctgeCalclte = $("#ddlPctgeCalclte2 option:selected").text();
            var txtTotalMarks = $("#txtTotalMarks2");
            var txtMarkSecure = $("#txtMarkSecure2");
            var txtPercentage = $("#txtPercentage2");

            //if (BoardRollNo != null && BoardRollNo.val() == '') {
            //    text += "<br /> -Please enter Roll no in Educational Qualification 10+2. ";
            //    $('#txtBoardRollNo2').attr('style', 'border:1px solid #d03100 !important;');
            //    $('#txtBoardRollNo2').css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    $('#txtBoardRollNo2').attr('style', 'border:1px solid #cdcdcd !important;');
            //    $('#txtBoardRollNo2').css({ "background-color": "#ffffff" });
            //}

            if (BoardType != null && (BoardType == 'Select Board' || BoardType == '0')) {
                text += "<br /> -Please select Board of Examination in 10+2.";
                $('#ddlBoard').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlBoard').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ddlBoard').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ddlBoard').css({ "background-color": "#ffffff" });
            }

            if (BoardName != null && BoardName.val() == '') {
                text += "<br /> -Please enter Name of the Board Examination Passed in Educational Qualification 10+2. ";
                $('#txtBoardName2').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtBoardName2').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtBoardName2').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtBoardName2').css({ "background-color": "#ffffff" });
            }


            if (txtExmntnName != null && txtExmntnName.val() == '') {
                text += "<br /> -Please enter Name of the Examination Passed in Educational Qualification 10+2. ";
                $('#txtExmntnName2').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtExmntnName2').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtExmntnName2').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtExmntnName2').css({ "background-color": "#ffffff" });
            }
            var PssngYr = $("#txtPssngYr2 option:selected").val();
            if (PssngYr != null && (PssngYr == '' || PssngYr == '0')) {
                text += "<br /> -Please select Year of Passing in Educational Qualification 10+2.";
                $('#txtPssngYr2').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtPssngYr2').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtPssngYr2').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtPssngYr2').css({ "background-color": "#ffffff" });
            }

            //var Passtype = $('#ddlPasstype option:selected').val();
            //if (Passtype != null && (Passtype == '' || Passtype == '0')) {
            //    text += "<br /> -Please select Exam Cleared in Educational Qualification 10+2.";
            //    $('#ddlPasstype').attr('style', 'border:1px solid #d03100 !important;');
            //    $('#ddlPasstype').css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    $('#ddlPasstype').attr('style', 'border:1px solid #cdcdcd !important;');
            //    $('#ddlPasstype').css({ "background-color": "#ffffff" });
            //}

            //if (ddlPctgeCalclte != null && (ddlPctgeCalclte == '' || ddlPctgeCalclte == '-Select-')) {
            //    text += "<br /> -Please select Grade in Educational Qualification 10+2.";
            //    $('#ddlPctgeCalclte2').attr('style', 'border:1px solid #d03100 !important;');
            //    $('#ddlPctgeCalclte2').css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    $('#ddlPctgeCalclte2').attr('style', 'border:1px solid #cdcdcd !important;');
            //    $('#ddlPctgeCalclte2').css({ "background-color": "#ffffff" });
            //}

            if (txtTotalMarks != null && txtTotalMarks.val() == '') {
                text += "<br /> -Please enter Total Marks in Educational Qualification 10+2. ";
                $('#txtTotalMarks2').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtTotalMarks2').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtTotalMarks2').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtTotalMarks2').css({ "background-color": "#ffffff" });
            }

            if ($("#ddlPctgeCalclte2").val() != "501") {
                if (txtMarkSecure != null && txtMarkSecure.val() == '') {
                    text += "<br /> -Please enter Marks Secured in Educational Qualification 10+2. ";
                    $('#txtMarkSecure2').attr('style', 'border:1px solid #d03100 !important;');
                    $('#txtMarkSecure2').css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $('#txtMarkSecure2').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#txtMarkSecure2').css({ "background-color": "#ffffff" });
                }

            } else {
                $('#txtMarkSecure2').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtMarkSecure2').css({ "background-color": "#ffffff" });
            }

            if (txtPercentage != null && txtPercentage.val() == '') {
                text += "<br /> -Please calculate the Percentage in Educational Qualification 10+2. ";
                opt = 1;
            } else {
            }
            //END Here
            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }

        function validateUID(UIDVal) {

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

    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading mtop5"><i class="fa fa-pencil-square-o fa-fw pright10"></i>Enrollment of Batch 2016-17
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
                                    Roll No
                                </label>
                                <input type="text" id="UserID" class="form-control" placeholder="User Id" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Registration No
                                </label>
                                <input type="text" id="txtRegdNo" class="form-control" placeholder="Regd Id" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label>College Code</label>
                                <input id="CollegeCode" type="text" class="form-control" placeholder="College Code" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label>College Name</label>
                                <input id="CollegeName" type="text" class="form-control" placeholder="College Name" />
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
                                    <input class="form-control" placeholder="Enter 12 digit Aadhaar Number" name="txtAadhaar" type="text" value="" id="UID" maxlength="14" onkeypress="return isNumberKey(event);" autofocus="" />
                                </div>
                                <div class="form-group col-lg-2 text-left">
                                    <input type="submit" name="" value="Fetch Data from UID" onclick="return openWindow(1, 2, 'UIDCasteCertificate1');;" id="btnSearch" class="btn btn-verify" style="visibility: hidden" />
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
                                <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="40" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Father's Name</label>
                                <input id="FatherName" class="form-control" placeholder="Father's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="40" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Mother's Name</label>
                                <input id="MotherName" class="form-control" placeholder="Mother's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="40" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>
                                    Guardian Name</label>
                                <input id="GuardianName" class="form-control" placeholder="Guardian Name" name="Father Name" type="text" value="" autofocus="" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
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
                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="12" />
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
                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" autofocus="" style="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Branch</label>
                                <select id="ddlBranch" class="form-control" onchange="GetCBCSSubjectList();">
                                    <option value="0">Select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4" id="DivMTOther">
                            <div class="form-group">
                                <label for="MTOthers" class="manadatory">
                                    MotherTongue Other</label>
                                <input id="MTOther" class="form-control" placeholder="Mother Tongue Other" type="text" value="" maxlength="30" autofocus="" style="" />
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
        <div class="row" id="DivSubject" runat="server" style="display: none;">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Admission Details
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    
                    <%-- <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadator">
                                Branch</label>
                            <select id="ddlBranch" class="form-control" onchange="GetCBCSSubjectList();">

                                <option value="0">Select</option>
                            </select>
                        </div>
                    </div>--%>

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
                                    Choose Any one
                                </label>
                                <select id="ddlAP" class="form-control">
                                    <option value="0">Select</option>
                                </select>
                                <input id="txtAP" type="text" class="form-control" disabled="disabled" style="display: none;" />
                            </div>
                            <div class="col-xs-3" id="DivCore2">
                                <label class="manadatory" id="lblAP1">
                                    Choose Any one
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
                                GE</label>
                            <select id="ddlGE" name="GES" class="form-control">
                                <option value="0">Select</option>
                            </select>
                            <input id="txtGE" type="text" class="form-control" disabled="disabled" style="display: none;" />
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
                    <input type="button" id="btnSubmit" class="btn btn-success" value="Register &amp; Proceed" title="Proceed to Upload Necessary Document" disabled="" onclick="SubmitData();" />
                    <input type="submit" name="" value="Cancel" id="Button1" title="Refresh the page" class="btn btn-danger" />
                    <input type="submit" name="" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />
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
        <asp:HiddenField ID="HDFRequiredSubject" runat="server" />
    </div>
</asp:Content>
