function SubmitData() {

    if (!ValidateForm()) {
        return;
    }

    var temp = "Gunwant";
    var AppID = "";
    var result = false;

    var DOBArr = $('#txtDate').val().split("/");
    var DOLConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

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

        'StudentType': $('#ddlStudent option:selected').val(),
        'RegistrationNo': $('#txtRegistration').val(),
        'RollNo': $('#txtRoll').val(),

        'AdmissionYear': $('#ddlAdmission option:selected').text(),
        'LastExamDate': DOLConverted,
        'PassingYear': $('#ddlPassing option:selected').text(),

        'CollegeCode': $('#ddlCollege option:selected').val(),
        'CollegeName': $('#ddlCollege option:selected').text(),
        'Program': $('#ddlProgram option:selected').text(),
        'Result': $('#ddlResult option:selected').text(),
        'ExaminationDetails': $('#ddlResult option:selected').text,
        'Subject1': $('#txtSubject1').val(),
        'Subject2': $('#txtSubject2').val(),
        'Subject3': $('#txtSubject3').val(),
        'Subject4': $('#txtSubject4').val(),              

        'Reason': $('#txReason').val(),

        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/DegreeSU/DuplicateDegree.aspx/InsertDuplicateDegree',
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

$(document).ready(function () {

    $('#txtDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {

            var t_DOB = $("#txtDate").val();

            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear();

        }
    });

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    GetCollegeMaster();

});

function GetCollegeMaster() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/MigrationSU/MigrationSU.aspx/GetCollegeMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlCollege").empty();
            $("#ddlCollege").append('<option value = "0">-Select College Name-</option>');

            $.each(Category, function () {
                $("#ddlCollege").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch College Name" + a.responseText);
        }
    });
}

function ValidateForm() {

    debugger;
    var text = "";
    var opt = "";


    var StudentType = $('#ddlStudent').val();
    var Registration = $('#txtRegistration').val();
    var RollNo = $('#txtRoll').val();
    var Program = $("#ddlPrograme").val();
    var ddlAdmission = $("#ddlAdmission").val();

    var ddlpassed = $("#ddlReason").val();
    var College = $("#ddlCollege").val();



    if (StudentType == null || StudentType == " " || StudentType == "0") {
        text += "<br /> -Please select Student Type.";
        $('#ddlStudent').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlStudent').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (StudentType != null) {
        $('#ddlStudent').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlStudent').css({ "background-color": "#ffffff" });
    }

    if (Registration == null || Registration == "") {
        text += "<br /> -Please Enter Registration.";
        $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistration').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Registration != null) {
        $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistration').css({ "background-color": "#ffffff" });
    }

    if (RollNo == null || RollNo == "") {
        text += "<br /> -Please Enter Roll Number.";
        $('#txtRoll').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRoll').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (RollNo != null) {
        $('#txtRoll').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRoll').css({ "background-color": "#ffffff" });
    }

    if (Program == null || Program == " " || Program == "0") {
        text += "<br /> -Please select Program.";
        $('#ddlPrograme').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPrograme').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Program != null) {
        $('#ddlPrograme').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlPrograme').css({ "background-color": "#ffffff" });
    }

    if (ddlAdmission == null || ddlAdmission == " " || ddlAdmission == "0") {
        text += "<br /> -Please select Year of Admission";
        $('#ddlAdmission').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlAdmission').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (ddlAdmission != null) {
        $('#ddlAdmission').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlAdmission').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}