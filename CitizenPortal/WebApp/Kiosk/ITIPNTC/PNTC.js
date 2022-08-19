$(document).ready(function () {
    debugger;

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    var qs = getQueryStrings();
    var svcid = qs["SvcID"];

    GetInstituteMaster();

    GetBranchMaster();
});

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }

    var temp = "Gunwant";
    var AppID = "";
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

    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,        
        'RegistrationNo': $('#txtRegistration').val(),
        'Session': $('#ddlSession option:selected').text(), 
        'JoiningYear': "",
        'LeavingYear': $('#ddlPassing option:selected').text(),
        'Semester': $('#ddlSemester option:selected').val(),
        'ApplicantType': $('#ddlApplicantType option:selected').text(),
        'InstituteName': $('#ddlInstitute option:selected').val(),
        'BranchCode': $('#ddlBranch option:selected').val(),
        'SubjectCode': $('#ddlSubject option:selected').val(),
        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'ServiceID': svcid
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/ITIPNTC/PNTC.aspx/InsertPNTCData',
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

            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;

            if (result /*&& jqXHRData_IMG_result*/) {
                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function fnApplicantType() {
    debugger;
    if ($('#ddlApplicantType :selected').val() != 0) {
        $('#divApplicant').show();
        $('#lblApplicant').text('Name of ' + $('#ddlApplicantType :selected').text());
    }
    else { $('#divApplicant').hide(); }
}

function GetInstituteMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/ITIMigration/MigrationITI.aspx/GetInstituteMasterITI',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlInstitute").empty();
            $("#ddlInstitute").append('<option value = "0">-Select Institute Name-</option>');
            $.each(Category, function () {
                $("#ddlInstitute").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Institute Name" + a.responseText);
        }
    });
}

function GetBranchMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/ITIMigration/MigrationITI.aspx/GetCourseMasterITI',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlBranch").empty();
            $("#ddlBranch").append('<option value = "0">-Select Trade Name-</option>');
            $.each(Category, function () {
                $("#ddlBranch").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Brach Name" + a.responseText);
        }
    });
}


function ValidateForm() {

    debugger;
    var text = "";
    var opt = "";

    var qs = getQueryStrings();
    var svcid = qs["SvcID"];


    if (svcid == "372") {

        var Registration = $('#txtRegistration').val();
        var Session = $("#ddlSession").val();
        var Passingyr = $("#ddlPassing").val();
        var Branchname = $("#ddlBranch").val();


        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }


        if (Session == null || Session == " " || Session == "0") {
            text += "<br /> -Please select Session.";
            $('#ddlSession').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSession').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Session != null) {
            $('#ddlSession').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSession').css({ "background-color": "#ffffff" });
        }

        if (Passingyr == null || Passingyr == " " || Passingyr == "0") {
            text += "<br /> -Please select Passing Year.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Passingyr != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }


        if (Branchname == null || Branchname == " " || Branchname == "0") {
            text += "<br /> -Please select Branch Name.";
            $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Branchname != null) {
            $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlBranch').css({ "background-color": "#ffffff" });
        }
    }


    if (svcid == "373") {
        var Registration = $('#txtRegistration').val();
        var Session = $("#ddlSession").val();
        var YearOfexamintion = $("#ddlPassing").val();
        var semester = $("#ddlSemester").val();


        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }


        if (Session == null || Session == " " || Session == "0") {
            text += "<br /> -Please select Session.";
            $('#ddlSession').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSession').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Session != null) {
            $('#ddlSession').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSession').css({ "background-color": "#ffffff" });
        }

        if (YearOfexamintion == null || YearOfexamintion == " " || YearOfexamintion == "0") {
            text += "<br /> -Please select Year Of Examintion.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (YearOfexamintion != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }


        //if (semester == null || semester == " " || semester == "0") {
        //    text += "<br /> -Please select semester.";
        //    $('#ddlSemester').attr('style', 'border:1px solid #d03100 !important;');
        //    $('#ddlSemester').css({ "background-color": "#fff2ee" });
        //    opt = 1;
        //} else if (semester != null) {
        //    $('#ddlSemester').attr('style', 'border:1px solid #cdcdcd !important;');
        //    $('#ddlSemester').css({ "background-color": "#ffffff" });
        //}
    }


    if (svcid == '374') {
        var Registration = $('#txtRegistration').val();
        var Session = $("#ddlSession").val();
        var YearOfExamination = $("#ddlPassing").val();
        var Branchname = $("#ddlBranch").val();
        var semester = $("#ddlSemester").val();
        var subject = $("#ddlSubject").val();

        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }


        if (Session == null || Session == " " || Session == "0") {
            text += "<br /> -Please select Session.";
            $('#ddlSession').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSession').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Session != null) {
            $('#ddlSession').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSession').css({ "background-color": "#ffffff" });
        }

        if (YearOfExamination == null || YearOfExamination == " " || YearOfExamination == "0") {
            text += "<br /> -Please select Year Of Examination.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (YearOfExamination != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }


        if (Branchname == null || Branchname == " " || Branchname == "0") {
            text += "<br /> -Please select Branch Name.";
            $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Branchname != null) {
            $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlBranch').css({ "background-color": "#ffffff" });
        }

        //if (semester == null || semester == " " || semester == "0") {
        //    text += "<br /> -Please select semester.";
        //    $('#ddlSemester').attr('style', 'border:1px solid #d03100 !important;');
        //    $('#ddlSemester').css({ "background-color": "#fff2ee" });
        //    opt = 1;
        //} else if (semester != null) {
        //    $('#ddlSemester').attr('style', 'border:1px solid #cdcdcd !important;');
        //    $('#ddlSemester').css({ "background-color": "#ffffff" });
        //}


        if (subject == null || subject == " " || subject == "0") {
            text += "<br /> -Please select subject.";
            $('#ddlSubject').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSubject').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (subject != null) {
            $('#ddlSubject').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSubject').css({ "background-color": "#ffffff" });
        }




    }


    if (svcid == '371') {

        var Registration = $('#txtRegistration').val();
        var YearOfExamination = $("#ddlPassing").val();
        var Nameofinstitude = $("#ddlInstitute").val();
        var Branchname = $("#ddlBranch").val();
        var semester = $("#ddlSemester").val();
        var subject = $("#ddlSubject").val();

        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }


        if (Nameofinstitude == null || Nameofinstitude == " " || Nameofinstitude == "0") {
            text += "<br /> -Please select Nameofinstitude.";
            $('#ddlInstitute').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlInstitute').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Nameofinstitude != null) {
            $('#ddlInstitute').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlInstitute').css({ "background-color": "#ffffff" });
        }

        if (YearOfExamination == null || YearOfExamination == " " || YearOfExamination == "0") {
            text += "<br /> -Please select Year Of Examination.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (YearOfExamination != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }


        if (Branchname == null || Branchname == " " || Branchname == "0") {
            text += "<br /> -Please select Branch Name.";
            $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Branchname != null) {
            $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlBranch').css({ "background-color": "#ffffff" });
        }

        //if (semester == null || semester == " " || semester == "0") {
        //    text += "<br /> -Please select semester.";
        //    $('#ddlSemester').attr('style', 'border:1px solid #d03100 !important;');
        //    $('#ddlSemester').css({ "background-color": "#fff2ee" });
        //    opt = 1;
        //} else if (semester != null) {
        //    $('#ddlSemester').attr('style', 'border:1px solid #cdcdcd !important;');
        //    $('#ddlSemester').css({ "background-color": "#ffffff" });
        //}


        if (subject == null || subject == " " || subject == "0") {
            text += "<br /> -Please select subject.";
            $('#ddlSubject').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSubject').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (subject != null) {
            $('#ddlSubject').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSubject').css({ "background-color": "#ffffff" });
        }




    }




   

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}