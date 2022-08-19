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

function SubmitData() {
    debugger;
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
        'InstituteName': $('#ddlInstitute option:selected').val(),
        'RegistrationNo': $('#txtRegistration').val(),
        'ExaminationDetails': $('#ddlReason option:Selected').text(),
        'LeavingDate': DOLConverted,
        'Reason': $('#txReason').val(),
        'AdmissionYear': $('#ddlAdmission option:selected').text(),
        'BranchCode': $('#ddlBranch option:selected').val(),
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
            url: '/WebApp/Kiosk/DTE/Migration.aspx/InsertMigration',
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

function ValidateForm() {

    debugger;
    var text = "";
    var opt = "";


    var Registration = $('#txtRegistration').val();
    var Branch = $("#ddlBranch").val();
    var ddlAdmission = $("#ddlAdmission").val();
    var ddlpassed = $("#ddlReason").val();
    var dateofleaving = $("#txtDate").val();


    if (Registration == null || Registration == "") {
        text += "<br /> -Please Enter Registration.";
        $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistration').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Registration != null) {
        $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistration').css({ "background-color": "#ffffff" });
    }


    if (Branch == null || Branch == " " || Branch == "0") {
        text += "<br /> -Please select Branch.";
        $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBranch').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Branch != null) {
        $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlBranch').css({ "background-color": "#ffffff" });
    }

    if (ddlAdmission == null || ddlAdmission == " " || ddlAdmission == "0") {
        text += "<br /> -Please select Admission";
        $('#ddlAdmission').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlAdmission').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (ddlAdmission != null) {
        $('#ddlAdmission').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlAdmission').css({ "background-color": "#ffffff" });
    }

    if (dateofleaving == null || dateofleaving == "") {
        text += "<br /> -Please Enter Date of leaving.";
        $('#txtDate').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDate').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (dateofleaving != null) {
        $('#txtDate').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDate').css({ "background-color": "#ffffff" });
    }

    if (ddlpassed == null || ddlpassed == " " || ddlpassed == "0") {
        text += "<br /> -Please select Examination passed /Appeared";
        $('#ddlReason').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlReason').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (ddlAdmission != null) {
        $('#ddlReason').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlReason').css({ "background-color": "#ffffff" });
    }





    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}