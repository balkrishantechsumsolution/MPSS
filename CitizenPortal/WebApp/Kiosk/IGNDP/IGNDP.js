
function GetBPLYear() {
    debugger;
    var qs = getQueryStrings();

    //var SVID = qs["SvcID"];// 22/11/2016....logic commented as it is still untested.
    //if (SVID == null || SVID == "") {
    //    //$('#btnSubmit').attr('disabled', true);
    //    $('#btnSubmit').hide();
      
    //    return false;
      

    //}
   


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
            $("[id*=BPLIGNDPYear]").empty();
            $("[id*=BPLIGNDPYear]").append('<option value = "0">Select BPLYear</option>');
            $.each(arr, function () {
                $("[id*=BPLIGNDPYear]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                // console.log(this.Id + ',' + this.Name);
            });

        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}




$(document).ready(function () {
    console.log("ready!");
    debugger;
   
        GetBPLYear();
    

});




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

function valuedisble() {
       $('#diasbilitypercentage').val("");
}


    function validate() {
        debugger;
    var disabilityid = $('#ddldiasbility :selected').val();
    var disability = $("#diasbilitypercentage").val();

    if (disability == '' && disability == null) {
        alertPopup('Form Validation', 'Please Enter the diasbility percentage')
        return false;
    }
    if (disabilityid == '106' || disabilityid == '105') {

        return true;
    }
    else if (disability < 80) {
        alertPopup("Form Validation!", "To avail IGNDP Service,  Diasbility percentage should be equal to  80 and above.");
        $('#diasbilitypercentage').val("");
        return false;
    }

}

    function SubmitData() {
        debugger;
        document.getElementById("btnSubmit").disabled = true;
    if (!ValidateForm()) {
        return;
    }


       validate();

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
    var disabilitytext = $('#ddldiasbility :selected').text();
    var disabilityid = $('#ddldiasbility :selected').val();

    if (disabilityid == 0) {
        alertPopup('Form Validation', 'Please select Disability Type');
        return;
    }

    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,
        'DisabilityID': disabilityid,
        'DisabilityType': disabilitytext,
        'DisabilityPercentage': $('#diasbilitypercentage').val(),
        'BPLCardNo': $('#bplIGNDPcardno').val(),
        'BPLCardYear': $('#BPLIGNDPYear').val(),
        'Income': $('#txtIncome').val(),
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
                url: '/WebApp/Kiosk/IGNDP/IGNDPForm.aspx/InsertIGNDP',
                data: $.stringify(obj, null, 4),
                processData: false,
                dataType: "json",
                success: function (response) {

        },
                error: function (a, b, c) {
                result = false;
                alert("5." +a.responseText);
        }
    })
        ).then(function (data, textStatus, jqXHR) {

            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;

            if (result /*&& jqXHRData_IMG_result*/) {
                alert("Application submitted successfully. Reference ID : " +obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' +obj.AppID + '&UID=' +uid;
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


    // validate();


    // var Date4Age = dobdetails();

    //debugger;
    //var qs = getQueryStrings();
    //var uid = qs["UID"];
    ////var svc= qs["svc"]
    //var dob = "";
    //var catCount = 0;

    //$.when(
    //    $.ajax({
    //        type: "POST",
    //        contentType: "application/json; charset=utf-8",
    //        url: '/webapp/Kiosk/IGNDP/IGNDPForm.aspx/binddetails',
    //        data: '{"uid":"' + uid + '"}',
    //        processData: false,
    //        dataType: "json",
    //        success: function (response) {

    //        },
    //        error: function (a, b, c) {
    //            result = false;
    //            alert("5." + a.responseText);
    //        }
    //    })
    //    ).then(function (data, textStatus, jqXHR) {

    //        var obj = jQuery.parseJSON(data.d);
    //        var html = "";
    //        dob = obj[0].Name;

    //dob= dob.replace("-", ' /');
    // dob.replace('-', '/');
    // alert(dob);
    // result = true;
    //sss var date_current = new Date(dob.substr(6, 4), dob.substr(3, 2) - 1, dob.substr(0, 2));
    // var year = S_date.getFullYear();
    debugger;
    var dob = $('#HiddenIGNDPAGE').val();
    var age = calage1(dob);

            if (age < 18) {
                // alert(age);
                alertPopup("Form Validation!", "To avail IGNDP Services, the applicant age should be equal to 18 years and above.");
                // $('#DeceasedAge').val("");
                document.getElementById("btnSubmit").disabled = true;
                return false;
            }
            else {
                document.getElementById("btnSubmit").disabled = false;
                //return True;
}

    //alert(age);




});// end of Then function of main Data Insert Function

    //return dob;



    // $("#btnSubmit").bind("click", function (e) { return SubmitData(); });


    function ValidateForm() {
    var dob = $('#HiddenIGNDPAGE').val();
    var age = calage1(dob);

    if (age < 18) {
        // alert(age);
        alertPopup("Please Check !!", "To fill the application applicant age should be Equal to 18 years and above for this service");
        // $('#DeceasedAge').val("");
        document.getElementById("btnSubmit").disabled = true;
        return false;
    }


    var text = "";
    var opt = "";

        /// Basic Information 

    var TypeofDisability = $("#ddldiasbility option:selected").text();
    var DisabilityID = $("#ddldiasbility option:selected").val();
    var Percentageofdisability = $("#diasbilitypercentage");
    //var AnnualIncome = $("#txtIncome");

    var BPLCard = $('#bplIGNDPcardno').val();
    var BPLYear = $('#BPLIGNDPYear option:selected').val();
    var AccountHolder = $('#AccountHolder').val();
    var AccountNumber = $('#AccountNumber').val();
    var IFSCode = $('#IFSCCode').val();

    if (DisabilityID != '106' || DisabilityID != '105') {
        if($('#diasbilitypercentage').val() < 80) {
            text += "<br /> -Degree/Percentage of diasbility should be equal to 80 and  above.";
            opt = 1;
    }
    }

    if ((TypeofDisability == '' || TypeofDisability == 'Select Disability Type')) {
        text += "<br /> -Please Select Disability Type. ";
        opt = 1;
    }

    if (Percentageofdisability && Percentageofdisability.val() == '') {
        text += "<br /> -Please enter Percentage of disability. ";
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
        //if (AnnualIncome && AnnualIncome.val() == '') {
        //    text += "<br /> -Please enter  Annual Income. ";
        //    opt = 1;
        //}

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


    var curd = new Date(curyear, curmon -1, curday);
    var cald = new Date(calyear, calmon -1, calday);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) -Date.UTC(calyear, calmon, calday, 0, 0, 0);
    var dife = datediff(curd, cald);
    return dife[0];
}