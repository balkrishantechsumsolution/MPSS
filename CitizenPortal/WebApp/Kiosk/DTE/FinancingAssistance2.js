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

function SubmitData2() {
    if (!ValidateForm2()) {
        return;
    }

    var temp = "Mohan";
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
        'RegistrationNumber': $('#txtRegistrationNo2').val(),
        'AdmissionYear': $('#drpAdmisionYear2').val(),
        'Semester': $('#drpSemester2').val(),
        'Branch': $('#drpBranchName2').val(),
        'TypeOfInstitute': $('#drpInstituteType2').val(),
        'InstituteName': $('#drpInstitutionName2').val(),
        'Category': $('#drpCategory2').val(),
        'AnnualIncome': $('#txtAnnualIncome2').val(),
        'FinancingGuardianName': $('#txtFinancingGuardianName').val(),
        'FinancingGuardianRelation': $('#txtFinancingGuardianRelation').val(),
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
            url: '/WebApp/Kiosk/DTE/FinancingAssistanceForm2.aspx/InsertFinancialAssistance2',
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

function ValidateForm2() {
    debugger;
    var text = "";
    var opt = "";


    var RegistrationNo = $('#txtRegistrationNo2').val();
    var AdmisionYear = $('#drpAdmisionYear2').val();
    var Semester = $('#drpSemester2').val();
    var InstituteType = $('#drpInstituteType2').val();
    var InstitutionName = $('#drpInstitutionName2').val();
    var BranchName = $('#drpBranchName2').val();
    var Category = $('#drpCategory2').val();
    var AnnualIncome = $('#txtAnnualIncome2').val();
    var FinancingGuardianName = $('#txtFinancingGuardianName').val();
    var FinancingGuardianRelation = $('#txtFinancingGuardianRelation').val();

    if (RegistrationNo == null || RegistrationNo == '') {
        text += "<br /> -Please Enter RegistrationNo ";
        $('#txtRegistrationNo2').attr('style', 'border:1px solid red !important;');
        $('#txtRegistrationNo2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRegistrationNo2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRegistrationNo2').css({ "background-color": "#ffffff" });
    }

    if (AdmisionYear == null || AdmisionYear == " " || AdmisionYear == "0") {
        text += "<br /> -Please select AdmisionYear.";
        $('#drpAdmisionYear2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpAdmisionYear2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (AdmisionYear != null) {
        $('#drpAdmisionYear2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpAdmisionYear2').css({ "background-color": "#ffffff" });
    }
    if (Semester == null || Semester == " " || Semester == "0") {
        text += "<br /> -Please select Semester.";
        $('#drpSemester2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpSemester2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Semester != null) {
        $('#drpSemester2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpSemester2').css({ "background-color": "#ffffff" });
    }
    if (InstituteType == null || InstituteType == " " || InstituteType == "0") {
        text += "<br /> -Please select InstituteType.";
        $('#drpInstituteType2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstituteType2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstituteType != null) {
        $('#drpInstituteType2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstituteType2').css({ "background-color": "#ffffff" });
    }
    if (InstitutionName == null || InstitutionName == " " || InstitutionName == "0") {
        text += "<br /> -Please select InstitutionName.";
        $('#drpInstitutionName2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstitutionName2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstitutionName != null) {
        $('#drpInstitutionName2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstitutionName2').css({ "background-color": "#ffffff" });
    }
    if (BranchName == null || BranchName == " " || BranchName == "0") {
        text += "<br /> -Please select BranchName.";
        $('#drpBranchName2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpBranchName2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (BranchName != null) {
        $('#drpBranchName2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpBranchName2').css({ "background-color": "#ffffff" });
    }
    if (FinancingGuardianName == null || FinancingGuardianName == "") {
        text += "<br /> -Please Enter Financing Guardian Name.";
        $('#txtFinancingGuardianName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFinancingGuardianName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (FinancingGuardianName != null) {
        $('#txtFinancingGuardianName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtFinancingGuardianName').css({ "background-color": "#ffffff" });
    }
    if (FinancingGuardianRelation == null || FinancingGuardianRelation == "") {
        text += "<br /> -Please Enter Financing Guardian Name.";
        $('#txtFinancingGuardianRelation').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFinancingGuardianRelation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (FinancingGuardianRelation != null) {
        $('#txtFinancingGuardianRelation').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtFinancingGuardianRelation').css({ "background-color": "#ffffff" });
    }

    if (Category == null || Category == " " || Category == "0") {
        text += "<br /> -Please select Category.";
        $('#drpCategory2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpCategory2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Category != null) {
        $('#drpCategory2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpCategory2').css({ "background-color": "#ffffff" });
    }

    if (AnnualIncome == null || AnnualIncome == '') {
        text += "<br /> -Please Enter AnnualIncome ";
        $('#txtAnnualIncome2').attr('style', 'border:1px solid red !important;');
        $('#txtAnnualIncome2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAnnualIncome2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAnnualIncome2').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function AnnualIncome() {
    debugger;
    var text = "";
    var opt = "";
    var AnnualIncome = $('#txtAnnualIncome2').val();


    if (AnnualIncome !== null || AnnualIncome !== "") {
        if (AnnualIncome <= 450000) {
            $('#txtAnnualIncome2').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtAnnualIncome2').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Annual Income should be Rs 0.00 to Re 4,50,000)";
            $('#txtAnnualIncome2').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtAnnualIncome2').css({ "background-color": "#fff2ee" });

            opt = 1;
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;

}

function RegistrationNo() {
    var text = "";
    var opt = "";
    var RegistrationNo = document.getElementById('txtRegistrationNo2').value;

    if (RegistrationNo.length > 12 || RegistrationNo.length < 12) {
        // alert("Mobile No. should be 10 digit");
        text += "<br /> -Registration No. should be 12 digit";
        $('#txtRegistrationNo2').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistrationNo2').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#txtRegistrationNo2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistrationNo2').css({ "background-color": "#ffffff" });

        if (!(RegistrationNo.charAt(0) == "F" || RegistrationNo.charAt(0) == "L" || RegistrationNo.charAt(0) == "f" || RegistrationNo.charAt(0) == "l")) {
            // alert("Mobile No. should start with 9 ,8 or 7 ");
            text += "<br /> -Registration No. should start with F and L";
            $('#txtRegistrationNo2').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistrationNo2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtRegistrationNo2').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistrationNo2').css({ "background-color": "#ffffff" });
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GetInstituteName() {
    var InstituteType = $('#drpInstituteType2').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm2.aspx/InstituteData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpInstitutionName2]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType2]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpInstitutionName2]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetBranchName() {
    var InstituteType = $('#drpInstituteType2').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm2.aspx/BranchData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpBranchName2]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType2]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpBranchName2]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function OnchangeFunction() {
    GetInstituteName();
    GetBranchName();
}