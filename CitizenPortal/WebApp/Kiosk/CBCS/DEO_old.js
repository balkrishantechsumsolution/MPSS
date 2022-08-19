
function CalculateAge()
{
    if (!ValidateDate()) {
        return false;
    }

    

    var t_DOB = $("#DOB").val();

    t_DOB = t_DOB.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
    //var Age = calage(S_date);
    var Age = calage1(t_DOB);
    if (Age != null && Age < 15) {
        alertPopup("Age Validate", "Age allow minimum 15 year's");
        $("#DOB").val('');
        $('#Age').val('');
    }
    else {
        $('#Age').val(Age);
    }
}


$(document).ready(function () {
    debugger;
    $("#progressbar").hide();
    $("#DivCore1").hide();
    $("#DivCore2").hide();
    $("#DivCore3").hide();
    $("#DivMIL").hide();
    $("#DivGE").hide();
    $("#DivAECC").hide();
    $("#DivSEC").hide();
    $("#DivGEII").hide();
    $("#DivMTOther").hide();

    $('#ddlAP').change(
   function () {
       var CourseName = $('#ddlBranch option:selected').val();
       if (CourseName == "SCIENCE PASS") {
           BindCore2();
       }
       else if (CourseName == "ARTS PASS") {
           BindArtsPassCore2();
       }
       else if (CourseName == "ARTS HONOURS") {
           BindGE();
           BindGEII();
       }
       else if (CourseName == "SCIENCE HONOURS") {
           BindGE();
           BindGEII();
       }
   }
);

    $('#ddlGE').change(
   function () {
       var CourseName = $('#ddlBranch option:selected').val();
       if (CourseName == "ARTS HONOURS") {
           BindGEII();
       }
       else if (CourseName == "SCIENCE HONOURS") {
           BindGEII();
       }
   }
);

    $('#ddlAP1').change(
    function () {
        var CourseName = $('#ddlBranch option:selected').val();
        if (CourseName == "SCIENCE PASS") {
            BindCore3();
        }

    }
    );

    $('#txtTongue').change(
 function () {
     var MotherTongue = $('#txtTongue option:selected').text();
     if (MotherTongue == "Other") {
         $("#DivMTOther").show();
     }
     else {
         $("#DivMTOther").hide();
     }

 }
 );
    $('#ddlCollege').change(
    function () {
        var CollegeCode = $('#ddlCollege').val();
        $('#CollegeCode').val(CollegeCode);
    }
    );

    GetCBCSCourseList();
    GetRelationList();
    GetCollegeList();
});

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

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return false;
    }

    if(!ValidateDate()){
    return false;
    }

    if (!ValidateDOA()) {
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

    //if (DOB.val() != '') {
    //    var todaydate = $.datepicker.formatDate('dd/mm/yy', new Date());
    //    var txtDOB = DOB.val();
    //    var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
    //    var Age = calcExSerDur(txtDOB, todaydate);
    //    var ageToCompare = Age.years;
    //    var ageActual = Age.years;
    //}

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
    var AOPArr = $('#DOA').val().split("/");
    var DOAConverted = AOPArr[2] + "-" + AOPArr[1] + "-" + AOPArr[0];
    //Mother Tongue
    var MotherTongue = "";
    if ($('#txtTongue option:selected').text() == "Other") {
        MotherTongue = $('#MTOther').val();
    }
    else {
        MotherTongue = $('#txtTongue option:selected').text()
    }

    var datavar = {

        //'ProfileID': uid,
        'AadhaarNumber': $('#UID').val(),
        'AadhaarDetail': $('#ddlSearch option:selected').text(),
        'AppName': $('#FirstName').val(),
        'DOB': DOBConverted,
        'Gender': $('#ddlGender').val(),
        'MobileNo': $('#MobileNo').val(),
        'EmailId': $('#EmailID').val(),
        'MotherTongue': MotherTongue,

        'FatherName': $('#FatherName').val(),
        'MotherName': $('#MotherName').val(),
        'GuardianName': $('#GuardianName').val(),
        'Relation': $('#ddlRelation option:selected').text(),
        'Category': $('#ddlcategory option:selected').text(),

        'ResponseType': ResponseType,
        'responseCode': "",
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
        'Subject8': $('#ddlGEII option:selected').val(),
        'Sublbl1': $('#lblDSCI').text(),
        'Sublbl2': $('#lblDSCII').text(),
        'Sublbl3': $('#lblDSCIII').text(),
        'Sublbl4': $('#lblGE').text(),
        'Sublbl5': $('#lblMIL').text(),
        'Sublbl6': $('#lblAECC').text(),
        'Sublbl7': $('#lblSEC').text(),
        'Sublbl8': $('#lblGEII').text(),

    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/CBCS/DEOAdmissionForm.aspx/InsertAdmissionFormByDEO',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#progressbar").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var status = obj.Status;
            // var AadhaarNo = obj.AadhaarNo;

            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null) {
                $("#progressbar").hide();
                alertPopup("Form Validation Failed", "Error While Saving Application., <BR> Either You Have Used MobileNumber or AadhaarNumber Which Has Been Used Earlier.");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (status == "Success") {
                    $("#progressbar").hide();
                    alert("+3 Examination Enrollment Process,</br>Application with Admission No. " + $('#AdmissionNo').val() + " saved successfully. Application No.: " + obj.AppID);//+ " Please Make Payment against the Application Number."
                    window.location.href = '/WebApp/Kiosk/CBCS/DEOAdmissionForm.aspx';
                    //window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessbar.aspx?SvcID=424&AppID=' + obj.AppID;
                }
                else if (status == "AdmissionNo") {
                    $("#progressbar").hide();
                    alertPopup("+3 Examination Enrollment Process", "SORRY! </br>Entered Admission No. " + $('#AdmissionNo').val() + " already registered in the system. Please check.");
                }
                else if (status == "AadhaarMobile") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar and Mobile No already exist", "Unable to save Application,We have sent login credentials in your registered mobile no.");
                }
                else if (status == "Mobile") {
                    $("#progressbar").hide();
                    alertPopup("Mobile No already exist", "Mobile no already registered. Please enter another mobile no.");
                }
                else if (status == "Aadhaar") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar No already exist", "Your aadhaar no. Already exist in the system.");
                }
                else {
                    $("#progressbar").hide();
                    alertPopup("Either Aadhaar/Mobile No already exist", "Unable to save Application, Please refresh the browser and try again");
                }
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function ValidateForm() {
    debugger;
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
    var AOP = $("#DOA");
    var Branch = $("#ddlBranch option:selected").text();
    var Father = $("#FatherName");
    var Mother = $("#MotherName");
    var Gaurdian = $("#GuardianName");
    var Relation = $("#ddlRelation option:selected").val();
    var Category = $("#ddlcategory option:selected").text();
    var AdmissionNo = $("#AdmissionNo");


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
    else {
        Father.attr('style', 'border:1px solid #cdcdcd !important;');
        Father.css({ "background-color": "#ffffff" });
    }

    if (Mother.val() == '' && Gaurdian.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mother Name. ";
        Mother.attr('style', 'border:1px solid #d03100 !important;');
        Mother.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Mother.attr('style', 'border:1px solid #cdcdcd !important;');
        Mother.css({ "background-color": "#ffffff" });
    }

    if ((Father.val() == '' || Mother.val() == '') && Gaurdian.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Gaurdian Name. ";
        Gaurdian.attr('style', 'border:1px solid #d03100 !important;');
        Gaurdian.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Gaurdian.attr('style', 'border:1px solid #cdcdcd !important;');
        Gaurdian.css({ "background-color": "#ffffff" });
    }

    if (Gaurdian.val() != '') {
        if ((Relation == '' || Relation == 'Select' || Relation == "0")) {
            text += "<BR>" + " \u002A" + " Please Select Gender. ";
            $("#ddlRelation").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlRelation").css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $("#ddlRelation").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#ddlRelation").css({ "background-color": "#ffffff" });
        }
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

    }

    //if (EmailID.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Email ID. ";
    //    EmailID.attr('style', 'border:1px solid #d03100 !important;');
    //    EmailID.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
    //    EmailID.css({ "background-color": "#ffffff" });
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
        AOP.attr('style', 'border:1px solid #cdcdcd !important;');
        AOP.css({ "background-color": "#ffffff" });
    }

    if (Branch != null && (Branch == '' || Branch == 'Select' || Branch == '-Select-')) {
        text += "<BR>" + " \u002A" + " Please select branch name.";
        $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBranch').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlBranch").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlBranch").css({ "background-color": "#ffffff" });
    }

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
                MTOther.attr('style', 'border:1px solid #d03100 !important;');
                MTOther.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#MTOther').attr('style', 'border:1px solid #d03100 !important;');
                $('#MTOther').css({ "background-color": "#fff2ee" });
            }
        }

    }


    //var inputText = $('#DOA').val();
    //if (inputText == null || inputText =='') {
    //    text += "<BR>" + " \u002A" + " Admission Date is blank.";
    //    $('#DOA').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#DOA').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}    
    //else {
    //    $('#DOA').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#DOA').css({ "background-color": "#ffffff" });
    //}

    //Subject validate added on 22 Nov 2017 by Vibhav
    var CourseName = $("#ddlBranch").val();
    var DSC1 = $('#ddlAP option:selected').val();
    var DSC2 = $('#ddlAP1 option:selected').val();
    var DSC3 = $('#ddlAP2 option:selected').val();
    var GE = $('#ddlGE option:selected').val();
    var GEII = $('#ddlGEII option:selected').val();
    var MIL = $('#ddlMIL option:selected').val();
    var AECC = $('#ddlAECC option:selected').val();
    var SECB = $('#ddlSECB option:selected').val();
    debugger
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

        if (GEII != null && (GEII == '0' || GEII == 'Select' || GEII == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select GE-II.";
            $('#ddlGEII').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlGEII').css({ "background-color": "#fff2ee" });
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
        if (GEII != null && (GEII == '0' || GEII == 'Select' || GEII == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select GE-II.";
            $('#ddlGEII').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlGEII').css({ "background-color": "#fff2ee" });
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
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

//Admission College list
function GetCollegeList() {
    debugger;
    var UserID=$('#HDFUserID').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/DEOAdmissionForm.aspx/BindCollegeList',
        data: '{"UserID":"' + UserID + '"}',
        dataType: "json",
        success: function (response) {
            debugger;
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var Type = Category[0].DeptType;

            var ddlCollege = $("[id=ddlCollege]");
            ddlCollege.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlCollege]").append('<option value = "' + this.CollegeCode + '">' + this.CollegeName + '</option>');
                catCount++;

            });
            if (Type == 'Admin') {
                $('#ddlCollege').val(Category[0].CollegeCode);
                $('#CollegeCode').val(Category[0].CollegeCode);
                $('#ddlCollege').prop("disabled", true);
                $('#CollegeCode').prop("disabled", true);
            }
            else {
                $('#CollegeCode').prop("disabled", true);
                $('#ddlCollege').prop("disabled", false);
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//Admission Branch liat
function GetCBCSCourseList() {
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

            var ddlps = $("[id=ddlBranch]");
            ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlBranch]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//Admission course/branch subject list
function GetCBCSSubjectList() {
    debugger;
    var CourseName = $("#ddlBranch").val();
    if (CourseName == "ARTS PASS") {
        ClearDropValue();
        BindSubjectDetail();
        BindGE(); //bind GE 
        BindMIL();
        BindAECC();
        BindSEC();
        $("#DivCore1").show();
        $("#DivCore2").show();
        $("#DivCore3").hide();
        $("#DivMIL").show();
        $("#DivGE").show();
        $("#DivGEII").hide();
        $("#DivAECC").show();
        $("#DivSEC").show();

        $("#lblDSCI").html("DSC-A");
        $("#lblDSCII").html('DSC-B');
        $("#lblDSCIII").html('DSC-C');

        $("#lblGE").html('GE');
        $("#lblMIL").html('MIL');
        $("#lblAECC").html('AECC-II');
        $("#lblSEC").html('SEC-D');
    }
    else if (CourseName == "ARTS HONOURS") {

        ClearDropValue();
        BindOtherThanCore();  //bind dsc subject type data 
        BindGE(); //bind MIL 
        BindAECC();
        BindSEC();
        BindGEII();
        $("#DivCore1").show();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
        $("#lblDSCI").html('DSC-Honours (Choose any one)');
        $("#lblDSCII").html('DSC-B');
        $("#lblDSCIII").html('DSC-C');
        $("#DivGEII").show();

        $("#lblGE").html('GE');
        $("#lblMIL").html('MIL');
        $("#lblAECC").html('AECC-II');
        $("#lblSEC").html('SEC-B');
        $("#lblGEII").html('GEII (for 3rd & 4th Semester)');
    }
    else if (CourseName == "SCIENCE HONOURS") {

        ClearDropValue();
        BindOtherThanCore();  //bind dsc subject type data 
        BindGE(); //bind MIL 
        BindAECC();
        BindSEC();
        BindGEII()
        $("#DivCore1").show();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
        $("#lblDSCI").html('DSC-Honours (Choose any one)');
        $("#lblDSCII").html('DSC-B');
        $("#lblDSCIII").html('DSC-C');
        $("#DivGEII").show();
        $("#lblGE").html('GE');
        $("#lblMIL").html('MIL');
        $("#lblAECC").html('AECC-II');
        $("#lblSEC").html('SEC-B');
        $("#lblGEII").html('GEII (for 3rd & 4th Semester)');
    }
    else if (CourseName == "SCIENCE PASS") {

        ClearDropValue();
        BindOtherThanCore();  //bind dsc subject type data 
        //BindGE(); //bind MIL 
        BindAECC();
        BindSEC();
        $("#DivCore1").show();
        $("#DivCore2").show();
        $("#DivCore3").show();
        $("#DivMIL").hide();
        $("#DivGE").hide();
        $("#DivAECC").show();
        $("#DivSEC").show();
        $("#lblDSCI").html('DSC-A (Choose any one)');
        $("#lblDSCII").html('DSC-B (Choose any one)');
        $("#lblDSCIII").html('DSC-C (Choose any one)');
        $("#DivGEII").hide();
        $("#lblGE").html('GE');
        $("#lblMIL").html('MIL');
        $("#lblAECC").html('AECC-II');
        $("#lblSEC").html('SEC-D');
    }
    else if (CourseName == "COMMERCE HONOURS") {

        ClearDropValue();
        BindAECC();
        BindSEC();
        $("#DivCore1").hide();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").hide();
        $("#DivGEII").hide();
        $("#DivAECC").show();
        $("#DivSEC").show();

        $("#lblSEC").html('SEC-B');
        $("#lblAECC").html('AECC-II');
    }
    else if (CourseName == "COMMERCE PASS") {

        ClearDropValue();
        BindAECC();
        BindSEC();
        $("#DivCore1").hide();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").hide();
        $("#DivGEII").hide();
        $("#DivAECC").show();
        $("#DivSEC").show();

        $("#lblSEC").html('SEC-D');
        $("#lblAECC").html('AECC-II');
    }
    else {
        $("#DivCore1").hide();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").hide();
        $("#DivAECC").hide();
        $("#DivSEC").hide();
        $("#DivGEII").hide();
    }

}
function BindSubjectDetail() {
    var CourseName = $("#ddlBranch").val();
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

            var ddlSubject = $("[id=ddlAP]");
            ddlSubject.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAP]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//bind core two for arts pass
function BindArtsPassCore2() {
    var CourseName = $("#ddlBranch").val();
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
function BindCore2() {
    var CourseName = $("#ddlBranch").val();
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
function BindCore3() {
    var CourseName = $("#ddlBranch").val();
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
//bind other than core 
function BindOtherThanCore() {
    var CourseName = $("#ddlBranch").val();
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

            var ddlAP = $("[id=ddlAP]");
            ddlAP.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAP]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//GE Other than core for AP Branch
function BindGE() {
    var CourseName = $("#ddlBranch").val();
    var SubType = "GE";
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

            var ddlGE = $("[id=ddlGE]");
            ddlGE.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlGE]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
                if (CourseName == "ARTS HONOURS" || CourseName == "SCIENCE HONOURS") {
                    if ($("#ddlAP option:selected").val() != "0") {
                        jQuery("#ddlGE option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
                    }
                }
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//GEII for AH & SH Branch for 2SEM
function BindGEII() {
    debugger;
    var CourseName = $("#ddlBranch").val();
    var SubType = "GE";
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

            var ddlGE = $("#ddlGEII");
            ddlGE.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("#ddlGEII").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
                if (CourseName == "ARTS HONOURS" || CourseName == "SCIENCE HONOURS") {
                    if ($("#ddlAP option:selected").val() != "0") {
                        jQuery("#ddlGEII option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
                        //jQuery("#ddlGEII option:contains('" + $("#ddlGE option:selected").text() + "')").remove();
                    }
                }
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//MIL Other than core for Branch
function BindMIL() {
    var CourseName = $("#ddlBranch").val();
    var SubType = "MIL";
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

            var ddlMIL = $("[id=ddlMIL]");
            ddlMIL.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlMIL]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//AECC Other than core for Branch
function BindAECC() {
    var CourseName = $("#ddlBranch").val();
    var SubType = "AECC";
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

            var ddlAECC = $("[id=ddlAECC]");
            ddlAECC.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAECC]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


//AECC Other than core for Branch
function BindSEC() {
    var CourseName = $("#ddlBranch").val();
    var SubType = "SEC";
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

            var ddlSECB = $("[id=ddlSECB]");
            ddlSECB.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlSECB]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

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
    $("#ddlGEII").empty().append('<option selected="selected" value="0">Select</option>');
}
//below code use to bind checkboxlist with div id
function AjaxSucceeded(result) {
    BindCheckBoxList(result);
}
function AjaxFailed(result) {
    alert('Failed to load checkbox list');
}
function BindCheckBoxList(result) {

    var items = JSON.parse(result.d);
    CreateCheckBoxList(items);
}
function CreateCheckBoxList(checkboxlistItems) {
    var table = $('<table></table>');
    var counter = 0;
    $(checkboxlistItems).each(function () {
        table.append($('<tr></tr>').append($('<td></td>').append($('<input>').attr({
            type: 'checkbox', name: 'chklistitem', value: this.Id, id: 'chklistitem' + counter
        })).append(
        $('<label style="display:inline">').attr({
            for: 'chklistitem' + counter++
        }).text(this.Name))));
    });
    $('#divchklist').empty();
    $('#divchklist').append(table);
}

//bind relatin list
function GetRelationList() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetRelationList',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlrelation = $("[id=ddlRelation]");
            ddlrelation.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlRelation]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function ValidateMobile() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/DEOAdmissionForm.aspx/ValidateMobile',
        data: '{"MobileNo":"' + $('#MobileNo').val() + '"}',
        dataType: "json",
        success: function (response) {
            debugger;
            var data = eval(response.d);
            var Status = data[0].Status;
            var Message = data[0].Messeage;
            if (Status == 'True') {
                $('#MobileNo').val('');
                alertPopup("Mobile No already exist", Message);
            }


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
/*
-----------Validate date Format -------------
*/

function ValidateDate() {
    debugger;
    var inputText = $('#DOB').val();
    if (inputText != null && inputText != '') {
        var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
        // Match the date format through regular expression  
        if (dateformat.test(inputText)) {
            var DOB = inputText.split('/');
            var Y = DOB[2];
            var M = DOB[1];
            var D = DOB[0];
            if (M < 10)
            {
                if (M.length == 1) {
                    M = '0' + M;
                }
                else
                    M = M;
            }
            if (D < 10)
            {
                if (D.length == 1) {
                    D = '0' + D;
                }
                else
                    D = D;
            }
            
            var NewDOB = D + '/' + M + '/' + Y;
            $('#DOB').val(NewDOB);

            return true;
        }
        else {
            alert("Invalid date format!");
            //document.form1.text1.focus();
            $('#DOB').val('');
            return false;
        }
    }
}

function ValidateDOA() {
    debugger;
    var inputText = $('#DOA').val();
    if (inputText != null && inputText != '') {
        var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
        // Match the date format through regular expression  
        if (dateformat.test(inputText)) {
            var DOB = inputText.split('/');
            var Y = DOB[2];
            var M = DOB[1];
            var D = DOB[0];
            if (M < 10) {
                if (M.length == 1) {
                    M = '0' + M;
                }
                else
                    M = M;
            }
            if (D < 10) {
                if (D.length == 1) {
                    D = '0' + D;
                }
                else
                    D = D;
            }

            var NewDOA = D + '/' + M + '/' + Y;
            $('#DOA').val(NewDOA);

            return true;
        }
        else {
            alert("Invalid date format!");
            //document.form1.text1.focus();
            $('#DOA').val('');
            return false;
        }
    }
}