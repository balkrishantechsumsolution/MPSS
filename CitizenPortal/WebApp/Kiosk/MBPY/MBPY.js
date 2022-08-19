function validateIncome() {
    var pensiontext = $('#ddlPension :selected').text();
    var pensiontid = $('#ddlPension :selected').val();
    var disability = $("#diasbilityMPYpercentage").val();
    var Income = $("#txtIncome").val();
    var dob = $('#HiddenAge').val();
    var gender = $('#Hiddengender').val();
    var age = calage1(dob);
    if (pensiontid == '103' && Income > 24000) {
        // document.getElementById("btnSubmit").disabled = true;
        alertPopup("Form Validation!", "To fill the application, the applicant Income should be less than eqauls to Rs.24000");
        $('#txtIncome').val("");
        return false;
    }
    else if (pensiontid == '101' && Income > 24000) {
        //document.getElementById("btnSubmit").disabled = true;
        alertPopup("Form Validation!", "To fill the application, the applicant Income should be less than eqauls to Rs.24000");
        $('#txtIncome').val("");
        return false;
    }
    else if (pensiontid == '102' && Income > 24000) {
        //document.getElementById("btnSubmit").disabled = true;
        alertPopup("Form Validation!", "To fill the application, the applicant Income should be less than eqauls to Rs.24000");
        $('#txtIncome').val("");
        return false;
    }
    else if (pensiontid == '104' && Income > 24000) {
        //document.getElementById("btnSubmit").disabled = true;
        alertPopup("Form Validation!", "To fill the application, the applicant Income should be less than eqauls to Rs.24000");
        $('#txtIncome').val("");
        return false;
    }
    else if (pensiontid == '105' && Income > 24000) {
        alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant Income  should be Below 24000.");
        $('#txtIncome').val("");
        return false;
    }
    else if (pensiontid == '106' && Income > 24000) {
        alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant Income  should be Below 24000.");
        $('#txtIncome').val("");
        return false;
    }

}
function validatedisablity() {
    var pensiontext = $('#ddlPension :selected').text();
    var pensiontid = $('#ddlPension :selected').val();
    var disability = $("#diasbilityMPYpercentage").val();
    var Income = $("#txtIncome").val();
    var dob = $('#HiddenAge').val();
    var gender = $('#Hiddengender').val();
    var age = calage1(dob);

    if (pensiontid == '103' && disability < 40) {
        if (disability != "") {
            alertPopup("Please fill following information.", "To fill the application, applicant Diasbility Percentage should be greater than 40%.");
            $('#diasbilityMPYpercentage').val("");
            return false;
        }
    }
        //else if (pensiontid == '101' && age >= 80) {

        //    return true;
        //}
    else if (pensiontid == '105' && disability < 60) {
        alertPopup("Form Vaidation!", "To fill the application  Diasbility Percentage should be greater than 60%.");
        $('#diasbilityMPYpercentage').val("");
        return false;
    }

}

function GetBPLYear() {
    debugger;
    var qs = getQueryStrings();
    var state = "22";
    var svcid = qs["SvcID"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];

    var catCount = 0;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Kiosk/NFBS/NFBS.aspx/BindBPLYear',
        data: '{"ServiceId":"' + svcid + '","State":"' + state + '","District":"' + dist + '","Taluka":"' + blk + '","Village":"' + pan + '"}',

        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            $("[id*=BPLMPBYear]").empty();
          
            $("[id*=BPLMPBYear]").append('<option value = "0">Select BPLYear</option>');
            $.each(arr, function () {
                $("[id*=BPLMPBYear]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                // console.log(this.Id + ',' + this.Name);
            });

        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}
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

function fnNext() {
    SubmitData();
}

function SubmitData() {
    debugger;
    document.getElementById("btnSubmit").disabled = true;
    // fnPensionType();
    if (!ValidateForm()) {
        return;
    }



    //

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
    var pensiontext = "";
    var diasbilitytext = "";
    var pensionid = $('#ddlPension :selected').val();
    BPLMPBYear = $('#BPLMPBYear :selected').val();
    bplMBPYcardno = $('#bplMBPYcardno').val();
    ddlwidow = $('#ddlwidow :selected').val();
    disabilitypercentage= $('#diasbilityMPYpercentage').val();
    var diasbilityid = $('#ddldiasbility :selected').val();
    if (pensionid != 0) {
        pensiontext = $('#ddlPension :selected').text();
    }
    if (diasbilityid != 0) {
        diasbilitytext = $('#ddldiasbility :selected').text();
    }
  

    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,
        'PensionID': pensionid,
        'PensionType': pensiontext,
        'DisabilityID': diasbilityid,
        'DisabilityType': diasbilitytext,
        'BPLMPBYear': BPLMPBYear,
        'bplMBPYcardno': bplMBPYcardno,
        'ddlwidow': ddlwidow,
        'disabilitypercentage': disabilitypercentage,
        'MonthlyIncome': $('#txtIncome').val(),
        'AccountHolder': $('#AccountHolder').val(),
        'AccountNumber': $('#AccountNumber').val(),
        'IFSCCode': $('#IFSCCode').val(),
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
            url: '/WebApp/Kiosk/MBPY/PensionForm.aspx/InsertMBPY',
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
    $("#divDisability").hide();
    $('#divwidow').hide();
    $('#divpercentage').hide();
    GetBPLYear();

});

function fnPensionType() {
    debugger;
    var pensiontext = $('#ddlPension :selected').text();
    var pensiontid = $('#ddlPension :selected').val();
    var disability = $("#diasbilityMPYpercentage").val();
    var Income = $("#txtIncome").val("");
    //var bplyear=$("#BPLMPBYear").val("");
    var dob = $('#HiddenAge').val();
    var gender = $('#Hiddengender').val();


    var age = calage1(dob);
    //$('#txtIncome').val("");

    if (pensiontid != 0) {
        if (pensiontid == '103') {
            $("#divDisability").show();
            $('#divpercentage').show();
            if (age < 5) {
                alertPopup("Please fill following information.", "To avail " + pensiontext + ", applicant age should be equal to 5 years and above");
                return false;
            }
            //if (disability == "" || disability == null) {
            //    alertPopup("Validate Forms!", 'Please enter the Diasbility Percentage.')
            //    return false;
            //}
            //if (Income == "" || Income == null) {
            //    alertPopup("Form Validation", 'Please Enter the Income')
            //    return false;
            //}
        }
        else {
            $("#divDisability").hide();
            $('#divpercentage').hide();
        }

        if (pensiontid == '101') {
            if (age < 60) {
                alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant age should equal to 60 years and above");
                return false;
            }
        }

        if (pensiontid == '102') {
            $('#divwidow').show();
            if (gender == "M") {
                $('#divwidow').hide();
                alertPopup("Please Check!! ", "This Form Applicable  for  " + pensiontext + "  only");
                return false;
            }
            if (age < 18) {
                alertPopup("Please fill following information.", "To fill the application applicant age should equal to 18 years and above");
                return false;
            }

        }
        else {
            $('#divwidow').hide();
        }
        if (pensiontid == '104') {
            // $('#divwidow').show();
            if (gender == "M") {

                alertPopup("Please Check!! ", "This is applicable for " + pensiontext + "  and age should be 30 years and above");
                return false;
            }
            if (age < 30) {
                alertPopup("Please fill following information.", "To fill the application applicant age should be  equal to 30 years And Above.");
                return false;
            }

        }
        else {
            $('#divwidow').hide();
        }
        if (pensiontid == '105') {
            $('#divpercentage').show();
            if (age < 5) {
                alertPopup("Please fill following information.", "This is applicable for " + pensiontext + "applicant age should be  equal to 5 years and above.");
                return false;
            }
            //else {
            //    $('#divpercentage').hide();
            //}
        }
        if (pensiontid == '106') {
            if (age < 5) {
                alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant age should be  equal to 5 years and above.");
                return false;
            }
        }
        if (pensiontid == '107') {
            if (age < 80) {
                alertPopup("Please fill following information.", "This is applicable for " + pensiontext + "");
                return false;
            }
        }

    }

}

function calage1(dob) {
    debugger;
    var D1 = dob.split('/');
    var calyear = D1[0];
    var calmon = D1[1];
    var calday = D1[2];


    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calyear, calmon - 1, calday);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
    var dife = datediff(curd, cald);
    return dife[0];
}
function ValidateForm() {
    debugger;
    var pensiontext = $('#ddlPension option:selected').text();
    //var widow = $('#ddlwidow').val();
    var pensiontid = $('#ddlPension option:selected').val();
    var disability = $("#diasbilityMPYpercentage").val();
    var Income = $("#txtIncome").val();
    var dob = $('#HiddenAge').val();
    var gender = $('#Hiddengender').val();
    var age = calage1(dob);
    debugger;
    var text = "";
    var opt = "";

    var PensionType = $("#ddlPension option:selected").text();
    var BPLCard = $('#bplMBPYcardno').val();
    var BPLYear = $('#BPLMPBYear option:selected').val();
    
    var AccountHolder = $('#AccountHolder').val();
    var AccountNumber = $('#AccountNumber').val();
    var IFSCode = $('#IFSCCode').val();
    var TotalIncome = $("#txtIncome");

    var alpha = /^[a-zA-Z]*$/g;

    if ((PensionType == '' || PensionType == 'Select Pension Type')) {
        text += "<br /> -Please Select Pension Type ";
        opt = 1;
    }


    if (BPLCard != null && BPLCard == '') {
        text += "<br /> -Please enter BPL Card No. ";
        opt = 1;
    }

    if ((BPLYear == null || BPLYear == '0')) {
        text += "<br /> -Please Select BPL Year. ";
        opt = 1;
    }


    if (TotalIncome && TotalIncome.val() == '') {
        text += "<br /> -Please enter  Income Per Month. ";
        opt = 1;
    }

    if (AccountHolder == null || AccountHolder == '') {
        text += "<br /> -Please enter Account Holder Name.";
        opt = 1;
    }

    if (AccountNumber == null || AccountNumber == '') {
        text += "<br /> -Please enter Account Number.";
        opt = 1;
    }

    if (IFSCode == null || IFSCode == '') {
        text += "<br /> -Please enter IFSC Code.";
        opt = 1;
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }


    if (pensiontid == '103') {
        if (age < 5) {
            alertPopup("Please fill following information.", "This is applicable for " + pensiontext + "applicant age should be equal to 5 years and above");
            return false;
        }

        if (disability == "" || disability == 0 || disability == '') {
            alertPopup("Please fill following information.", "Please enter the disablity Percentage");
            $("#diasbilityMPYpercentage").focus();
            return false;
        }
        if (Income == "" || Income == 0 || Income == '') {
            alertPopup("Please fill following information.", "Please enter the Income");
            $("#txtIncome").focus();
            return false;

        }

    }

    else if (pensiontid == '101') {
        if (age < 60) {
            alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant age should be equal to  60 years and above");
            return false;
        }
        if (Income == "" || Income == 0 || Income == '') {
            alertPopup("Please fill following information.", "Please enter the Income");
            $("#txtIncome").focus();
            return false;
        }





    }


    else if (pensiontid == '102') {
        if (gender == "M") {


            alertPopup("Please Check!! ", "This Form Applicable only for " + pensiontext + "");
            return false;
        }

        if (age < 18) {

            alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant age should be equal to 18 years and above");
            return false;
        }
        if (Income == "" || Income == 0 || Income == '') {
            alertPopup("Please fill following information.", "Please enter the Income");
            $("#txtIncome").focus();
            return false;
        }
        //if (widow == "" || widow == 0 || widow == '') {
        //    alertPopup("Please fill following information.", "Please select widow");
        //    $("#widow").focus();
        //    return false;
        //}

    }
    else if (pensiontid == '104') {
        if (gender == "M") {
            debugger;
            alertPopup("Please Check!! ", "This Form Applicable only for " + pensiontext + "");
            return false;
        }
        if (age < 30) {
            alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant age should be equal to 30 years and above");
            return false;
        }
        if (Income == "" || Income == 0 || Income == '') {
            alertPopup("Please fill following information.", "Please enter the Income");
            $("#txtIncome").focus();
            return false;

        }


    }
    else if (pensiontid == '105') {
        if (age < 5) {
            alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant age should be equal to 5 years and above");
            return false;
        }
        if (Income == "" || Income == 0 || Income == '') {
            alertPopup("Please fill following information.", "Please enter the Income");
            $("#txtIncome").focus();
            return false;

        }
        if (disability == "" || disability == 0 || disability == '') {
            alertPopup("Please fill following information.", "Please enter the disablity Percentage");
            $("#diasbilityMPYpercentage").focus();
            return false;
        }

    }


    else if (pensiontid == '106') {

        if (age < 5) {
            alertPopup("Please fill following information.", "This is applicable for " + pensiontext + " applicant age should be  equal to  5 years and above");
            return false;
        }
        if (Income == "" || Income == 0 || Income == '') {
            alertPopup("Please fill following information.", "Please enter the Income");
            $("#txtIncome").focus();
            return false;

        }

    }
    else if (pensiontid == '107') {

        if (age < 80) {
            alertPopup("Please fill following information.", "This is applicable for " + pensiontext + "");
            return false;
        }

    }



    return true;

}