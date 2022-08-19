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
                    $("[id*=BPLYear]").empty();
                    $("[id*=BPLYear]").append('<option value = "0">Select BPLYear</option>');
                    $.each(arr, function () {
                        $("[id*=BPLYear]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        console.log(this.Id + ',' + this.Name);
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
    if (!ValidateForm()) {
        return;
    }
    
    var temp = "Gunwant";
    var AppID = "";
    var result = false;
    var DOBArr = $('#DeceasedDOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];
    var DODArr = $('#DeceasedDOD').val().split("/");
    var DODConverter = DODArr[2] + "-" + DODArr[1] + "-" + DODArr[0];

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
        'DeceasedName': $('#DeceasedName').val(),
        'DeceasedFName': $('#DeceasedFName').val(),
        'ISbplfamily' :$("input:radio[name='rblIsbpl']:checked").val(),
        'DeceasedDOB': DOBConverted,
        'DeceasedDOD': DODConverter,
        'DeceasedAge': $('#DeceasedAge').val(),
        'DeceasedGender': $('#ddlDeceasedGender').val(),
        'chkHeadFamily': 'No',
        'BPLCardNo': $('#bplcardno').val(),
        'BPLCardYear': $('#BPLYear').val(),
        'deceasedAddressLine1': $('#AddressLine1').val(),
        'deceasedAddressLine2': $('#AddressLine2').val(),
        'deceasedRoadStreetName': $('#RoadStreetName').val(),
        'deceasedLandMark': $('#LandMark').val(),
        'deceasedLocality': $('#Locality').val(),
        'deceasedState': $('#ddlState').val(),
        'deceasedDistrict': $('#ddlDistrict').val(),
        'deceasedTaluka': $('#ddlTaluka').val(),
        'deceasedVillage': $('#ddlVillage').val(),
        'deceasedPinCode': $('#PinCode').val(),
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
            url: '/WebApp/Kiosk/NFBS/NFBS.aspx/InsertNFBS',
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
var APplicantage = "";
$(document).ready(function () {
    console.log("ready!");
    $('#divinfo').show();
    debugger;
    $('#ddlState').prop('disabled', true);
    GetBPLYear();
    var dob = $('#HiddenNFBSAge').val();
    APplicantage = calage1(dob);
    //alert(APplicantage);
    /* commented by niraj as per mail on 2Nov
    if (APplicantage < 18) {
        alertPopup("Form Validation!", 'To avail NFBS Service, the applicant age should be between 18 to 59 years and under 364 days.');
        document.getElementById("btnSubmit").disabled = true;
        return false;
    }
    else {
        document.getElementById("btnSubmit").disabled = false;
        return true;
    }
    if (APplicantage > 60) {

        alertPopup("Form Validation!", 'To avail NFBS Service, the applicant age should be between 18 to 59 years and under 364 days.');
        document.getElementById("btnSubmit").disabled = true;
        return false;

    }
    else {
        document.getElementById("btnSubmit").disabled = false;
    }
    */

});

var t_DOD = new Date();
var t_DOB = new Date();

$(document).ready(function () {
    $("#liBasic").removeClass("active");
    $("#liService").removeClass("active");
    $("#liDetails").addClass("active");
    $("#liDoc").removeClass("active");
    $("#liPayment").removeClass("active");
    document.getElementById("DeceasedName").style.borderColor = "red";
    //$("#DeceasedName").css("border", "1px solid red");
    $("#step1").addClass("stepfinish");
    $("#step2").addClass("stepfinish");
    $("#step3").addClass("stepactive");
    $("#step4").addClass("active");
    $("#step5").addClass("active");
    $("#step6").addClass("active");
    $("#step7").addClass("active");
    $('#DeceasedDOD').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        maxDate: '0',
        onSelect: function (date) {
            
            t_DOD = $("#DeceasedDOD").val();            
            t_DOB = $("#DeceasedDOB").val();       

            if ($("#DeceasedDOB").datepicker("getDate") >= $("#DeceasedDOD").datepicker("getDate")) {
                alertPopup('Form Validation ','Date of Death must be greater than Date of Birth');
                $("#DeceasedDOB").val("");
                $('#DeceasedAge').val("");
                $('#DeceasedAge').prop("disabled", false);
                return;
            }
            
            if (t_DOB != "" && t_DOB != null) {
                Age = CalDOB(t_DOD, t_DOB);
                
                $('#DeceasedAge').prop("disabled", true);
                $('#DeceasedAge').val(Age);
                
            }
        }

    });

    $('#DeceasedDOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        maxDate: '0',
        onSelect: function (date) {
            debugger;
            t_DOB = $("#DeceasedDOB").val();
            t_DOD = $("#DeceasedDOD").val();

            $('#DeceasedDOD').val("");
            $('#DeceasedAge').val("");
            $('#DeceasedAge').prop("disabled", false);

        }
    });
    debugger;


         //var Age = datediff(t_DOD, t_DOB);
         //   alert(Age);
   
    // $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    //$("#PinCode").bind("change", function (e) { return fnCheckPinCode(); });
    
});

var dat = new Date();
var curday = dat.getDate();
var curmon = dat.getMonth() + 1;
var curyear = dat.getFullYear();

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

function calage2(dob) {
    debugger;
    var D1 = dob.split('/');
   
   
    var calday = D1[0];
    var calmon = D1[1];
    var calyear = D1[2];

    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calyear, calmon - 1, calday);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
    var dife = datediff(curd, cald);
    return dife[0];
}

function checkleapyear(datea) {
    if (datea.getYear() % 4 == 0) {
        if (datea.getYear() % 10 != 0) {
            return true;
        } else {
            if (datea.getYear() % 400 == 0)
                return true;
            else
                return false;
        }
    }
    return false;
}

function ValidateForm() {

    var dob = $('#HiddenNFBSAge').val();
    var APplicantage = calage1(dob);
    //alert(APplicantage);
    






    var text = "";
    var opt = "";

    /// Basic Information 
    /// Basic Information 
    var DeceasedName = $("#DeceasedName").val();
    var DeceasedFName = $("#DeceasedFName").val();
    //var rblisbpl = $("input:radio[name='rblIsbpl']:checked").val();
    var AccountHolder = $('#AccountHolder').val();
    var AccountNumber = $('#AccountNumber').val();
    var IFSCode = $('#IFSCCode').val();
    var DOB = $("#DeceasedDOB");
    var Age = $("#DeceasedAge");
    var Gender = $("#ddlDeceasedGender option:selected").text();
    var dod = $("#DeceasedDOD").val();


    var AddressLine1 = $("#AddressLine1").val();
    var AddressLine2 = $("#AddressLine2").val();
    var RoadStreetName = $("#RoadStreetName").val();
    var LandMark = $("#LandMark").val();
    var Locality = $("#Locality").val();

    var State = $("#ddlState option:selected").text();
    var District = $("#ddlDistrict option:selected").text();
    var Taluka = $("#ddlTaluka option:selected").text();
    var Village = $("#ddlVillage option:selected").text();
    var Pincode = $("#PinCode").val();

    var BPLCard = $('#bplcardno').val();
    var BPLYear = $('#BPLYear option:selected').val();

    if (APplicantage < 18 && APplicantage > 60) {

        text += "<br /> -To fill the application applicant age should be Equal 18 years and Above. ";
        opt = 1;
        //alertPopup("Please fill following information.", 'To fill the application applicant age should be Equal 18 years and Above');
        //document.getElementById("btnSubmit").disabled = true;
        //return false;

    }
    //if (datea.getYear() % 4 == 0) {
    //    if (datea.getYear() % 10 != 0) {
    //        return true;
    //    } else {
    //        if (datea.getYear() % 400 == 0)
    //            return true;
    //        else
    //            return false;
    //    }
    //}
    //return false;
    
    /* commented by niraj as per mail on 2Nov
    if (APplicantage >= 60) {
        text += "<br /> -To fill the application applicant maximum age should be under 59  years and 364 days. ";
        opt = 1;
        //alertPopup("Please fill following information.", 'To fill the application applicant maximum age should be under 59  years and 364 days');
        //document.getElementById("btnSubmit").disabled = true;
        //return false;

    }
    */
    if (DeceasedName == null || DeceasedName == '') {
        $("#DeceasedName").css("border", "1px solid red");
        text += "<br /> -Please enter Deceased Name. ";
        $("#DeceasedName").parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter name</div>");
        opt = 1;
    }

    if (DeceasedFName == null || DeceasedFName == '') {
        text += "<br /> -Please enter Deceased Father Name. ";
        opt = 1;
    }

    if (DOB.val()  == null || DOB.val() == '') {
        text += "<br /> -Please enter Date of Birth. ";
        opt = 1;
    }    
    if (dod == null || dod == '') {
        text += "<br /> -Please enter Date of Death.";
        opt = 1;
    }
    if ((Age.val() == null || Age.val() == '')) {
        text += "<br /> -Please Select Age. ";
        opt = 1;
    }
    
    if (Age.val() < 18 || Age.val() > 60) {
        text += "<br /> -The deceased age should be between 18 years and 60 years (under 59  years and 364 days). ";
        opt = 1;
        //alertPopup("Please fill following information.", 'To fill the application applicant maximum age should be under 59  years and 364 days');
        //document.getElementById("btnSubmit").disabled = true;
        //return false;

    }

    //if ((rblisbpl == '' || rblisbpl == null)) {
    //    text += "<br /> -Please Select Is form  BPL family. ";
    //    opt = 1;
    //}
    if ((Gender == '' || Gender == 'Select Gender')) {
        text += "<br /> -Please Select Gender. ";
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

    if (AddressLine1 != null && AddressLine1 == '') {
        text += "<br /> -Please enter Care of Address. ";
        opt = 1;
    }
    
    if (RoadStreetName != null && RoadStreetName == '') {
        text += "<br /> -Please enter Road/Street Name in Address. ";
        opt = 1;
    }
    
    if (Locality != null && Locality == '') {
        text += "<br /> -Please enter Locality in Address. ";
        opt = 1;
    }
    if (State != null && (State == '' || State == '-Select-')) {
        text += "<br /> -Please select State.";
        opt = 1;
    }

    if (District != null && (District == '' || District == '-Select-')) {
        text += "<br /> -Please select District.";
        opt = 1;
    }

    if (Taluka != null && (Taluka == '' || Taluka == '-Select-')) {
        text += "<br /> -Please select Taluka.";
        opt = 1;
    }

    if (Village != null && (Village == '' || Village == '-Select-')) {
        text += "<br /> -Please select Village.";
        opt = 1;
    }
    if (Pincode == '') {
        text += "<br /> -Please enter PIN. ";
        opt = 1;
    }
    
    
    var alpha = /^[a-zA-Z]*$/g;

    //var pinmatch = /^[0-9]\d{5}$/;
    //if (Pincode != null && Pincode.val() != '') {
    //    if (!pinmatch.test(Pincode.val())) {
    //        text += "<br /> -Please enter valid pincode.";
    //        opt = 1;
    //    }
    //}
    if (DOB.val() == null || DOB.val() == '') {
        text += "<br /> -Please enter Date of Birth. ";
        opt = 1;
    }

    if (dod == null || dod == '') {
        text += "<br /> -Please enter Date of Death.";
        opt = 1;
    }
    var pinmatch = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
    if (DOB != null && DOB != "")
        {
        if (!pinmatch.test(DOB.val())) {
            text += "<br /> -Please enter Invalid Format.";
            opt = 1;
        }
    }
    //var pinmath = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
    if (dod != null && dod != "")
    {
        if (!pinmatch.test(dod)) {
            text += "<br /> -Please enter Invalid Date Format.";
            opt = 1;
        }
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

    
    //if (DeceasedName != null && DeceasedName != '')
    //{
    //    if(!alpha.test(DeceasedName.val()))
    //    {
    //        text += "<br /> -Please enter alphabet character only .";
    //    }
    //}

   


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}

//$('#PinCode').on("change", function () {
//    debugger
//    var state = $('#ddlState').val()
//    if (state == 21) {
//        var pinmatch = /^[567]\d{7}$/;
//        if (!pinmatch.test(PinCode.val())) {
//            text += "<br /> -Please enter valid PinCode starting with 7";
//            opt = 1;

//        }
//    }
//});

function datediff(date1, date2) {
    var dt;
    var dd;
    //if (date1 != null && date1 != "")
    //{ }
    dt= new Date(date1);
    dd= new Date(date2);
    var y1 = dt.getFullYear(),
    m1 = dt.getMonth(),
    d1 = dt.getDate(),
    y2 = dd.getFullYear(),
    m2 = dd.getMonth(),
    d2 = dd.getDate();
    if (d1 < d2) {
        m1--;
        d1 += DaysInMonth(y2, m2);
    }
    if (m1 < m2) {
        y1--;
        m1 += 12;
    }
    //return [y1 - y2, m1 - m2, d1 - d2];
    return [y1 - y2];
}


function CalDOB(DOD, DOB) {

    var D = DOD.split('/');
    var DODday = D[0];
    var DODmon = D[1];
    var DODyear = D[2];

    var D1 = DOB.split('/');
    var DOBday = D1[0];
    var DOBmon = D1[1];
    var DOByear = D1[2];

    var m_DOD = new Date(DODyear, DODmon - 1, DODday);
    var m_DOB = new Date(DOByear, DOBmon - 1, DOBday);
    var diff = Date.UTC(DODyear, DODmon, DODday, 0, 0, 0) - Date.UTC(DOByear, DOBmon, DOBday, 0, 0, 0);
    var dife = datediff(m_DOD, m_DOB);
    return dife[0];


}
//function isNumber(evt) {
//    evt = (evt) ? evt : window.event;
//    var charCode = (evt.which) ? evt.which : evt.keyCode;
//    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
//        return false;
//    }
//    return true;
//}



//function fnCheckPinCode() {
//    debugger;
//    var PinCode = $('#ddlState').val()
//    var state = $('#ddlState').val()
//    if (state == 21) {
//        var pinmatch = /^[567]\d{7}$/;
//        if (!pinmatch.test(PinCode)) {
//            alertPopup("Form Validation","Please enter valid PinCode, starting with 7");
//            opt = 1;

//        }
//    }
//}