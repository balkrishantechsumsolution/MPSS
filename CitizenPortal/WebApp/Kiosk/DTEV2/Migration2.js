function GetInstituteMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTEV2/Migration2.aspx/GetInstituteMaster',
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
        url: '/WebApp/Kiosk/DTEV2/Migration2.aspx/GetBranchMaster',
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

        'BasicDetailType': $('#ddlSearch option:selected').val(),
        'BasicDetailNumber': $('#UID').val(),
        'RegistrationNo': $('#txtRegistration').val(),
        'BranchName': $('#ddlBranch option:selected').val(),
        'AdmissionYear': $('#ddlAdmission option:selected').val(),
        'InstituteLeavingDate': DOLConverted,
        'InstituteName': $('#ddlInstitute option:selected').val(),
        'ExaminationDetails': $('#ddlReason option:Selected').val(),
        'CertificateReason': $('#txReason').val(),
        'Title': $('#ddlSalutation').val(),
        'FullName': $('#FirstName').val(),
        'Gender': $('#ddlGender').val(),
        'FatherHusbandName': $('#FatherName').val(),
        'DOB': $('#DOB').val(),
        'Age': $('#Age').val(),
        'EmailId': $('#EmailID').val(),
        'MobileNo': $('#MobileNo').val(),
        'AltMobileNo': $('#phoneno').val(),

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
            url: '/WebApp/Kiosk/DTEV2/Migration2.aspx/InsertMigrationNew',
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

function openWindow(UIDVal, value, SessionName) {
    debugger;
    if (validateUID(UIDVal) != false) {


        //if (UIDVal == "1") {
        //code = UIDVal;
        //}

        //CheckLocalAadhar($("#UID").val());
        var UID = $("#UID").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=388&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
        ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        window.focus();
    }
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
    
    $('#ddlSearch').prop("disabled", true);

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    if ($("#HFUIDData").val() != "") {

        BindProfileV2($("#HFUIDData").val(), 0);//function to call with 1 in case of Citizen Profile Data
    }

    GetInstituteMaster();
    GetBranchMaster();
});

function ParentBindProfile() {
    if ($("#HFUIDData").val() != "") {

        BindProfileV2($("#HFUIDData").val(), 0);//function to call with 1 in case of Citizen Profile Data
    }
}

/*
New Function to Bind the Page with Citizen Details for Editing the Profile.
*/
function BindProfileV2(JSONData, ProfileType) {



    if (JSONData != "") {
        //alert($("#HFUIDData").val());
        debugger;

        $("#divNonAadhar").hide();

        $("#divSearch").show();
        $("#divBasicInfo").show();
        $("#divAddress").show();
        $("#divBtn").show();
        $("#ddlSearch").prop("disabled", true);
        $("#UID").prop("disabled", true);
        $("#btnSearch").prop("disabled", true);
        //$('#MobileNo').prop('disabled', true);
        //$('#divSearch').hide();
        if (ProfileType == 1) {
            $("#fulPhoto").show();
        }
        else {
            $("#fulPhoto").hide();
        }


        var obj = jQuery.parseJSON(JSONData);

        if (obj["dateOfBirth"] != "") {
            var t_DOB = obj["dateOfBirth"];

            if (ProfileType == 1) {

                var D1 = t_DOB.split('-');
                var calday = D1[2];
                var calmon = D1[1];
                var calyear = D1[0];


                t_DOB = calday.toString() + "/" + calmon.toString() + "/" + calyear;

            }

            t_DOB = t_DOB.replace(/-/g, "/");
            $('#DOB').val(t_DOB);
            $('#DOB').prop("disabled", true);

            debugger;
            var t_DOB = $("#DOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear(); // selected year

            //var Age = calage(S_date);
            var Age = calage(t_DOB);
            $('#Age').val(Age);
        }

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);

        
            $("#UID").val(obj["aadhaarNumber"]);
            $('#UID').prop("disabled", true);
        
        $("#FatherName").val(obj["careOf"]);
        if (obj["careOf"] != null) {
            $('#FatherName').prop("disabled", true);
        }
        else { $('#FatherName').prop("disabled", false); }
        

        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
                $('#ddlSalutation').val("1");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
                $('#ddlSalutation').val("2");
            }
            else {
                $('#ddlGender').val("T");
                $('#ddlSalutation').val("3");
            }
            $('#ddlGender').prop("disabled", true);
        }
        
        $('#phoneno').val(obj["phone"]);

        $('#MobileNo').val(obj["Mobile"]);
        if (obj["Mobile"] != null && obj["Mobile"] != "") {
            $('#MobileNo').val(obj["Mobile"]);
            $('#MobileNo').prop("disabled", true);
        }
        else { $('#MobileNo').prop("disabled", false); }

        if (obj["Mobile"] == null) {
            $('#MobileNo').val(obj["phone"]);
        }


    }//end of UID Data


}

function GetMigrationData() {


    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTEV2/Migration2.aspx/GetMigrationData',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var obj = jQuery.parseJSON(response.d);

            var html = "";
            var catCount = 0;

            $("#txtRegistration").val(obj.RegistrationNumber);
            //$("ddlAdmission").val(obj.YearofAdmission);
            //$("ddlBranch").val(obj.Branch);
            //$("ddlInstitute").val(obj.InstituteName);

            $("#ddlAdmission option:contains(" + obj.YearofAdmission + ")").attr('selected', true);
            $("#ddlBranch option:contains(" + obj.Branch.toUpperCase() + ")").attr('selected', true);
            $("#ddlInstitute option:contains(" + obj.InstituteName.toUpperCase() + ")").attr('selected', true);

            //$("#ddlAdmission").find("option:contains('" + obj.YearofAdmission + "')").each(function () {
            //    $(this).attr("selected", "selected");
            //});

            //$("#ddlBranch").find("option:contains('" + obj.YearofAdmission + "')").each(function () {
            //    $(this).attr("selected", "selected");
            //});

            //$("#ddlInstitute").find("option:contains('" + obj.YearofAdmission + "')").each(function () {
            //    $(this).attr("selected", "selected");
            //});


            //obj.StudentName
            //obj.Session
            //obj.Status


        },
        error: function (a, b, c) {
            alert("Unable to fetch Brach Name" + a.responseText);
        }
    });

    return false;
}


function ValidateForm() {

    var text = "";
    var opt = "";

    var txtRegistrationNo = $('#txtRegistration').val();
    if (txtRegistrationNo == null || txtRegistrationNo == "") {
        text += "<br /> -Please Enter Registration Number.";
        $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistration').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtRegistrationNo != null) {
        $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistration').css({ "background-color": "#ffffff" });
    }


    var txtAdmissionYear = $('#ddlAdmission option:selected').val();
    if (txtAdmissionYear == null || txtAdmissionYear == " " || txtAdmissionYear == "0") {
        text += "<br /> -Please Select Admission Year.";
        $('#ddlAdmission').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlAdmission').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtAdmissionYear != null) {
        $('#ddlAdmission').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlAdmission').css({ "background-color": "#ffffff" });
    }


    var drpBranchName = $('#ddlBranch option:selected').val();
    if (drpBranchName == null || drpBranchName == " " || drpBranchName == "0") {
        text += "<br /> -Please Select Branch Name.";
        $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBranch').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (drpBranchName != null) {
        $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlBranch').css({ "background-color": "#ffffff" });
    }


    var drpInstituteLeavingDate = $('#txtDate').val();
    if (drpInstituteLeavingDate == null || drpInstituteLeavingDate == "") {
        text += "<br /> -Please Enter Date of Leaving Institute.";
        $('#txtDate').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDate').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (drpInstituteLeavingDate != null) {
        $('#txtDate').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDate').css({ "background-color": "#ffffff" });
    }


    var drpInstituteName = $('#ddlInstitute option:selected').val();
    if (drpInstituteName == null || drpInstituteName == "" || drpInstituteName == "0") {
        text += "<br /> -Please Select Institute Name.";
        $('#ddlInstitute').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlInstitute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (drpInstituteName != null) {
        $('#ddlInstitute').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlInstitute').css({ "background-color": "#ffffff" });
    }


    var drpExaminationDetails = $('#ddlReason option:Selected').val();
    if (drpExaminationDetails == null || drpExaminationDetails == " " || drpExaminationDetails == "0") {
        text += "<br /> -Please Select Examination Passed/Appeared.";
        $('#ddlReason').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlReason').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (drpExaminationDetails != null) {
        $('#ddlReason').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlReason').css({ "background-color": "#ffffff" });
    }


    var txtCertificateReason = $('#txReason').val();
    if (txtCertificateReason == null || txtCertificateReason == "") {
        text += "<br /> -Please Enter Reason Of Migration Certificate.";
        $('#txReason').attr('style', 'border:1px solid #d03100 !important;');
        $('#txReason').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtCertificateReason != null) {
        $('#txReason').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txReason').css({ "background-color": "#ffffff" });
    }


    var drpBasicDetailType = $('#ddlSearch option:selected').val();
    if (drpBasicDetailType == null || drpBasicDetailType == "" || drpBasicDetailType == "0") {
        text += "<br /> -Please Select Option From Basic Detail.";
        $('#ddlSearch').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlSearch').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (drpBasicDetailType != null) {
        $('#ddlSearch').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlSearch').css({ "background-color": "#ffffff" });
    }


    var txtBasicDetailNumber = $('#UID').val();
    if (txtBasicDetailNumber == null || txtBasicDetailNumber == "") {
        text += "<br /> -Please Enter Basic Detail Number.";
        $('#UID').attr('style', 'border:1px solid #d03100 !important;');
        $('#UID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtBasicDetailNumber != null) {
        $('#UID').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#UID').css({ "background-color": "#ffffff" });
    }


    var drpTitle = $('#ddlSalutation').val();
    if (drpTitle == null || drpTitle == "" || drpTitle == "0") {
        text += "<br /> -Please Select Options From Title/Initial.";
        $('#ddlSalutation').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlSalutation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (drpTitle != null) {
        $('#ddlSalutation').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlSalutation').css({ "background-color": "#ffffff" });
    }


    var txtFullName = $('#FirstName').val();
    if (txtFullName == null || txtFullName == "") {
        text += "<br /> -Please Enter Full Name.";
        $('#FirstName').attr('style', 'border:1px solid #d03100 !important;');
        $('#FirstName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtFullName != null) {
        $('#FirstName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#FirstName').css({ "background-color": "#ffffff" });
    }


    var drpGender = $('#ddlGender').val();
    if (drpGender == null || drpGender == "" || drpGender == "S") {
        text += "<br /> -Please Select Gender Option.";
        $('#ddlGender').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlGender').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (drpGender != null) {
        $('#ddlGender').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlGender').css({ "background-color": "#ffffff" });
    }


    var txtFatherHusbandName = $('#FatherName').val();
    if (txtFatherHusbandName == null || txtFatherHusbandName == "") {
        text += "<br /> -Please Enter Father's Name.";
        $('#FatherName').attr('style', 'border:1px solid #d03100 !important;');
        $('#FatherName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtFatherHusbandName != null) {
        $('#FatherName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#FatherName').css({ "background-color": "#ffffff" });
    }


    var drpDOB = $('#DOB').val();
    if (drpDOB == null || drpDOB == "") {
        text += "<br /> -Please Enter Date Of Birth.";
        $('#DOB').attr('style', 'border:1px solid #d03100 !important;');
        $('#DOB').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (drpDOB != null) {
        $('#DOB').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#DOB').css({ "background-color": "#ffffff" });
    }


    var txtAge = $('#Age').val();
    if (txtAge == null || txtAge == "") {
        text += "<br /> -Please Enter Age.";
        $('#Age').attr('style', 'border:1px solid #d03100 !important;');
        $('#Age').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtAge != null) {
        $('#Age').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#Age').css({ "background-color": "#ffffff" });
    }


    var txtEmailId = $('#EmailID').val();
    if (txtEmailId == null || txtEmailId == "") {
        text += "<br /> -Please Enter Email-ID.";
        $('#EmailID').attr('style', 'border:1px solid #d03100 !important;');
        $('#EmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtEmailId != null) {
        $('#EmailID').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#EmailID').css({ "background-color": "#ffffff" });
    }


    var txtMobileNo = $('#MobileNo').val();
    if (txtMobileNo == null || txtMobileNo == "") {
        text += "<br /> -Please Enter Mobile Number.";
        $('#MobileNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#MobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtMobileNo != null) {
        $('#MobileNo').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#MobileNo').css({ "background-color": "#ffffff" });
    }


    var txtAltMobileNo = $('#phoneno').val();
    if (txtAltMobileNo == null || txtAltMobileNo == "") {
        text += "<br /> -Please Enter Altername Number.";
        $('#phoneno').attr('style', 'border:1px solid #d03100 !important;');
        $('#phoneno').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtAltMobileNo != null) {
        $('#phoneno').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#phoneno').css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}