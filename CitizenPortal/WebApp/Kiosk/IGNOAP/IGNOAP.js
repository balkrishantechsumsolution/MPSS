

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
            $("[id*=BPLIGNOAPYear]").empty();
            $("[id*=BPLIGNOAPYear]").append('<option value = "0">Select BPLYear</option>');
            $.each(arr, function () {
                $("[id*=BPLIGNOAPYear]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
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


$(document).ready(function () {
    console.log("ready!");
    debugger;
    GetBPLYear();

});


function SubmitData() {
    debugger;
    document.getElementById("btnSubmit").disabled = true;
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
        'Occupation': $('#txtoccupation').val(),
        //'Income': $('#txtIncome').val(),
        //'Income': ""
        'BPLCardNo': $('#bplIGNOAPcardno').val(),
        'BPLCardYear': $('#BPLIGNOAPYear').val(),
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
        url: '/WebApp/Kiosk/IGNOAP/IGNOAPForm.aspx/InsertIGNOAP',
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

    var dob = $('#HiddenIGNOP').val();
    var APplicantage = calage1(dob);
    //alert(APplicantage);
    if (APplicantage < 60) {

        alertPopup("Form Validation!", 'To avail IGNOAP Services, the applicant age should be  equal to 60 years and above.');
        document.getElementById("btnSubmit").disabled = true;
        return false;

    }
    else {
        document.getElementById("btnSubmit").disabled = false;
        return true;
    }


});

function ValidateForm() {

    var text = "";
    var opt = "";

    /// Basic Information 

    var dob = $('#HiddenIGNOP').val();
    var APplicantage = calage1(dob);
   

    var Presentoccupation = $("#txtoccupation");

    var AccountHolder = $('#AccountHolder').val();
    var AccountNumber = $('#AccountNumber').val();
    var IFSCode = $('#IFSCCode').val();

 

    var BPLCard = $('#bplIGNOAPcardno').val();
    var BPLYear = $('#BPLIGNOAPYear option:selected').val();

    var alpha = /^[a-zA-Z]*$/g;

  

    if (APplicantage < 60) {
        text += "<br /> -To fill the application applicant age should be equal to 60 years and above. ";
        opt = 1;
    }

    if (Presentoccupation && Presentoccupation.val() == '') {
        text += "<br /> -Please enter Present occupation. ";
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

    return true;

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