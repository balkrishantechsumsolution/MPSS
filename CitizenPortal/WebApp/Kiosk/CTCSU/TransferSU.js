
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

            $("#ddlCollegeTransfer").empty();
            $("#ddlCollegeTransfer").append('<option value = "0">-Select College Name for Transfering-</option>');

            $.each(Category, function () {
                $("#ddlCollege").append('<option value = "' + this.Id + '">' + this.Name + '</option>');

                $("#ddlCollegeTransfer").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch College Name" + a.responseText);
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
    //var DOBArr = $('#txtDate').val().split("/");
    //var DOLConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

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

        'StudentType': $('#ddlStudent option:selected').text(),
        'RegistrationNo': $('#txtRegistration').val(),        
        'RollNo': $('#txtRoll').val(),
        'AdmissionYear': $('#ddlAdmission option:selected').text(),

        'CollegeCode': $('#ddlCollege option:selected').val(),
        'CollegeName': $('#ddlCollege option:selected').text(),
        'Program': $('#ddlPrograme option:selected').text(),
        'Class': $('#ddlClass option:selected').text(),

        'Subject1': $('#ddlAP option:selected').val(),
        'Subject2': $('#ddlAP1 option:selected').val(),
        'Subject3': $('#ddlAP2 option:selected').val(),
        'Subject4': $('#ddlGE option:selected').val(),
        'Subject5': $('#ddlMIL option:selected').val(),
        'Subject6': $('#ddlAECC option:selected').val(),
        'Subject7': $('#ddlSECB option:selected').val(),

        'JoiningCollegeCode': $('#ddlCollege option:selected').val(),
        'JoiningCollegeName': $('#ddlCollege option:selected').text(),
        'JoiningProgram': $('#ddlPrograme option:selected').text(),
        'JoiningClass': $('#ddlClass option:selected').text(),

        'Reason': $('#txReason').val(),
        'JoiningCollege': $('#txtCollege').val(),
        'JoiningUniversity': $('#txtUniversity').val(),

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
            url: '/WebApp/Kiosk/CTCSU/TransferSU.aspx/InsertTransferSU',
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
    
    $('#lblSubjectList').hide();

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    GetCollegeMaster();
    //GetCBCSSubjectList_CTC();
    GetCBCSSubjectList();
    GetCBCSCourseList();
    GetReasonMaster();
});


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
        $("#DivAECC").show();
        $("#DivSEC").show();

        $("#lblDSCI").val('DSC-A');
        $("#lblDSCII").val('DSC-B');
        $("#lblDSCIII").val('DSC-C');
    }
    else if (CourseName == "ARTS HONOURS") {

        ClearDropValue();
        BindOtherThanCore();  //bind dsc subject type data 
        BindGE(); //bind MIL 
        BindAECC();
        BindSEC();
        $("#DivCore1").show();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
        $("#lblDSCI").val('DSC-Honours (Choose any one)');
        $("#lblDSCII").val('DSC-B');
        $("#lblDSCIII").val('DSC-C');
    }
    else if (CourseName == "SCIENCE HONOURS") {

        ClearDropValue();
        BindOtherThanCore();  //bind dsc subject type data 
        BindGE(); //bind MIL 
        BindAECC();
        BindSEC();
        $("#DivCore1").show();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
        $("#lblDSCI").val('DSC-Honours (Choose any one)');
        $("#lblDSCII").val('DSC-B');
        $("#lblDSCIII").val('DSC-C');
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
        $("#lblDSCI").val('DSC-A (Choose any one)');
        $("#lblDSCII").val('DSC-B (Choose any one)');
        $("#lblDSCIII").val('DSC-C (Choose any one)');
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
        $("#DivAECC").show();
        $("#DivSEC").show();
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
        $("#DivAECC").show();
        $("#DivSEC").show();
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
                //if (CourseName == "ARTS HONOURS" || CourseName == "SCIENCE HONOURS") {
                //    jQuery("#ddlGE option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
                //}
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


function ValidateForm() {

    debugger;
    var text = "";
    var opt = "";

    var StudentType = $('#ddlStudent').val();
    var Registration = $('#txtRegistration').val();
    var RollNo = $('#txtRoll').val();
    var Program = $("#ddlPrograme").val();
    var ddlAdmission = $("#ddlAdmission").val();
    var Class = $("#ddlClass").val();
    var ddlpassed = $("#ddlpassed").val();
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
    /*
    if (Registration == null || Registration == "") {
        text += "<br /> -Please Enter Registration.";
        $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistration').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Registration != null) {
        $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistration').css({ "background-color": "#ffffff" });
    }*/

    if (RollNo == null || RollNo == "") {
        text += "<br /> -Please Enter Roll Number.";
        $('#txtRoll').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRoll').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (RollNo != null) {
        $('#txtRoll').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRoll').css({ "background-color": "#ffffff" });
    }

    //if (Program == null || Program == " " || Program == "0") {
    //    text += "<br /> -Please select Program.";
    //    $('#ddlPrograme').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#ddlPrograme').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else if (Program != null) {
    //    $('#ddlPrograme').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#ddlPrograme').css({ "background-color": "#ffffff" });
    //}

    //if (Class == null || Class == " " || Class == "0") {
    //    text += "<br /> -Please select Class.";
    //    $('#ddlClass').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#ddlClass').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else if (Class != null) {
    //    $('#ddlClass').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#ddlClass').css({ "background-color": "#ffffff" });
    //}
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

function GetReasonMaster() {
    debugger;
    var SvcID = '440';
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CTCSU/TransferSU.aspx/GetReasonMaster',
        data: '{"prefix":"","ServiceID":"' + SvcID + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlReason").empty();
            $("#ddlReason").append('<option value = "0">-Select Reason-</option>');

            $.each(Category, function () {
                $("#ddlReason").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Reason" + a.responseText);
        }
    });
}

function GetCBCSSubjectList_CTC() {
    debugger;
    var CourseName = $("#ddlBranch").val();
    $('#lblSubjectList').show();
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
        $("#DivAECC").show();
        $("#DivSEC").show();

        $("#lblDSCI").val('DSC-A');
        $("#lblDSCII").val('DSC-B');
        $("#lblDSCIII").val('DSC-C');
    }
    else if (CourseName == "ARTS HONOURS") {

        ClearDropValue();
        BindOtherThanCore();  //bind dsc subject type data 
        BindGE(); //bind MIL 
        BindAECC();
        BindSEC();
        $("#DivCore1").show();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
        $("#lblDSCI").val('DSC-Honours (Choose any one)');
        $("#lblDSCII").val('DSC-B');
        $("#lblDSCIII").val('DSC-C');
    }
    else if (CourseName == "SCIENCE HONOURS") {

        ClearDropValue();
        BindOtherThanCore();  //bind dsc subject type data 
        BindGE(); //bind MIL 
        BindAECC();
        BindSEC();
        $("#DivCore1").show();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
        $("#lblDSCI").val('DSC-Honours (Choose any one)');
        $("#lblDSCII").val('DSC-B');
        $("#lblDSCIII").val('DSC-C');
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
        $("#lblDSCI").val('DSC-A (Choose any one)');
        $("#lblDSCII").val('DSC-B (Choose any one)');
        $("#lblDSCIII").val('DSC-C (Choose any one)');
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
        $("#DivAECC").show();
        $("#DivSEC").show();
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
        $("#DivAECC").show();
        $("#DivSEC").show();
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