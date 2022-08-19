function SubmitData() {

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
        'InstituteName': $('#ddlInstitute option:selected').val(),
        'RegistrationNo': $('#txtRegistration').val(),
        'Session': $('#ddlSession option:selected').text(),
        'JoiningYear': $('#ddlJoining option:selected').text(),
        'LeavingYear': $('#ddlPassing option:selected').text(),
        'BranchCode': $('ddlBranch option:selected').val(),
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
            url: '/WebApp/Kiosk/Diploma/DuplicateDiploma.aspx/InsertDuplicateDiploma',
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
    $("#liBasic").removeClass("active");
    $("#liService").removeClass("active");
    $("#liDetails").addClass("active");
    $("#liDoc").removeClass("active");
    $("#liPayment").removeClass("active");

    $("#step1").addClass("stepfinish");
    $("#step2").addClass("stepfinish");
    $("#step3").addClass("stepactive");
    $("#step4").addClass("active");
    $("#step5").addClass("active");
    $("#step6").addClass("active");
    $("#step7").addClass("active");

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

    GetInstituteMaster();

    GetBranchMaster();
});

function GetInstituteMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTE/Migration.aspx/GetInstituteMaster',
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
        url: '/WebApp/Kiosk/DTE/Migration.aspx/GetBranchMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlBranch").empty();
            $("#ddlBranch").append('<option value = "0">-Select Branch Name-</option>');
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


    var Registration = $('#txtRegistration').val();
    var Session = $("#ddlSession").val();
    var Passingyr = $("#ddlPassing").val();
    var Branchname = $("#ddlBranch").val();
    var admissionyr = $("#ddlJoining").val();


    if (admissionyr < Passingyr) {
        $('#ddlJoining').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlJoining').css({ "background-color": "#ffffff" });
    }
    else {
        text += "<br /> -Year of addmision should be less than year of passing.";
        $('#ddlJoining').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlJoining').css({ "background-color": "#fff2ee" });
        opt = 1;
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

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}