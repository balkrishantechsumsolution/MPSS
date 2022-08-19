
$(document).ready(function () {


    $('#divParticulars').hide();
    //$('#divSuspect').hide();
    $('#divmore').hide();

    $("#AddressLine1").prop('disabled', true);
    $("#AddressLine2").prop('disabled', true);
    $("#RoadStreetName").prop('disabled', true);
    $("#LandMark").prop('disabled', true);
    $("#Locality").prop('disabled', true);

    $("#ddlState").prop('disabled', true);
    $("#ddlDistrict").prop('disabled', true);
    $("#ddlTaluka").prop('disabled', true);
    $("#ddlVillage").prop('disabled', true);
    $("#PinCode").prop('disabled', true);

    $("#attende_phone").prop('disabled', true);
    $("#attende_details").prop('disabled', true);

    $('#ddlAttendee').val("102");
    

    $('#date_journey').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        onSelect: function (date) {

            var t_DOB = $("#date_journey").val();

            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2), t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear();

        }
    });

    $('#date_return').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        onSelect: function (date) {

            var t_DOB = $("#date_return").val();
            var startDate = $("#date_journey").val();
            var endDate = $("#date_return").val();

            if ($("#date_journey").datepicker("getDate") >= $("#date_return").datepicker("getDate")) {
                alert('Date of Return must be greater than Date of Journey');
                $("#date_return").val("");
            }

            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2), t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear();

        }
    });
    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });


});

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }
    $("#btnSubmit").prop('disabled', true);
    var t_Message = "";
    var result = false;
        t_Message = "Please confirm to proceed.";

    if (confirm(t_Message)) {
        result = true;
    }

    if (!result) return false;

    var temp = "Gunwant";
    var AppID = "";
    var result = false;



    var startDate = $("#date_journey").val();
    var endDate = $("#date_return").val();

    if ($("#date_journey").datepicker("getDate") >= $("#date_return").datepicker("getDate")) {
        alert('Date of Return must be greater than Date of Journey');
        $("#date_return").val("");
        return false;
    }


    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    var DOJArr = $('#date_journey').val().split("/");
    var DOJConverted = DOJArr[2] + "-" + DOJArr[1] + "-" + DOJArr[0];

    var DORArr = $('#date_return').val().split("/");
    var DORConverted = DORArr[2] + "-" + DORArr[1] + "-" + DORArr[0];

    var AddressLine1 = $("#AddressLine1");
    var AddressLine2 = $("#AddressLine2");
    var RoadStreetName = $("#RoadStreetName");
    var LandMark = $("#LandMark");
    var Locality = $("#Locality");

    var State = $("#ddlState option:selected").text();
    var District = $("#ddlDistrict option:selected").text();
    var Taluka = $("#ddlTaluka option:selected").text();
    var Village = $("#ddlVillage option:selected").text();
    var Pincode = $("#PinCode");

    var str2 = "Select";

    if (State.indexOf(str2) != -1) {
        State = '0';
    }
    else { State = $("#ddlState option:selected").val(); }

    if (District.indexOf(str2) != -1) {
        District = '0';
    }
    else { District = $("#ddlDistrict option:selected").val(); }
    if (Taluka.indexOf(str2) != -1) {
        Taluka = '0';
    }
    else { Taluka = $("#ddlTaluka option:selected").val(); }
    if (Village.indexOf(str2) != -1) {
        Village = '0';
    }
    else { Village = $("#ddlVillage option:selected").val(); }
    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,
        'bpl_card_no': '',
        'bpl_year': '',
        'date_jouney': DOJConverted,
        'date_return': DORConverted,
        'disease_detail': $("#applicant_disease option:selected").text(),
        'atende_detail': $('#attende_details').val(),
        'atende_phone': $('#attende_phone').val(),
        'disease_history': $('#disease_details').val(),
        'AddressLine1': $('#AddressLine1').val(),
        'AddressLine2': $('#AddressLine2').val(),
        'StreetName': $('#RoadStreetName').val(),
        'Landmark': $('#LandMark').val(),
        'Locality': $('#Locality').val(),
        'State_Code': State,
        'District_Code': District,
        'SubDistrict_Code': Taluka,
        'Village_Code': Village,
        'PinCode': $('#PinCode').val(),
        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,





        //'SuspectDXML': document.getElementById("hdfSuspectSave").value
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/Habisha/Habisha.aspx/InsertHabisha',
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

function ValidateForm() {
    debugger;
    var text = "";
    var opt = "";

    /// Basic Information 
    var DOJ = $("#date_journey");
    var DOR = $("#date_return");
    var MobileNo = $("#attende_phone");
    var Attendee = $("#attende_details");
    var Reason = $("#disease_details");
    var Disease = $("#applicant_disease option:selected").text();

    //App address
    var AddressLine1 = $("#AddressLine1");
    var AddressLine2 = $("#AddressLine2");
    var RoadStreetName = $("#RoadStreetName");
    var LandMark = $("#LandMark");
    var Locality = $("#Locality");

    var State = $("#ddlState option:selected").text();
    var District = $("#ddlDistrict option:selected").text();
    var Taluka = $("#ddlTaluka option:selected").text();
    var Village = $("#ddlVillage option:selected").text();
    var Pincode = $("#PinCode");

    var ddlattendee = $('#ddlAttendee option:selected').val();
    if (ddlattendee == "0") {
        text += "<br /> -Please select attendee if any. ";
        opt = 1;
    }
    if (DOJ.val() == '') {
        text += "<br /> -Please enter Date of Journey. ";
        opt = 1;
    }
    if (DOR.val() == '') {
        text += "<br /> -Please enter Date of Return. ";
        opt = 1;
    }    

    if ((Disease == '' || Disease == '--Select Disease--')) {
        text += "<br /> -Please Select Disease. ";
        opt = 1;
    }
    if (Reason.val() == '') {
        text += "<br /> -Please enter Reason. ";
        opt = 1;
    }
    if (ddlattendee == '101') {

        if (MobileNo.val() == '') {
            text += "<br /> -Please enter Attendee Mobile No. ";
            opt = 1;
        }

        if (MobileNo.val() != '') {
            var mobmatch1 = /^[789]\d{9}$/;
            if (!mobmatch1.test(MobileNo.val())) {
                text += "<br /> -Please enter valid mobile Number.";
                opt = 1;
            }
        }

        if (AddressLine1.val() != null && AddressLine1.val() == '') {
            text += "<br /> -Please enter Care of Address. ";
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
        if (Pincode != null && Pincode.val() == '') {
            text += "<br /> -Please enter Pincode.";
            opt = 1;
        }

        var pinmatch = /^[0-9]\d{5}$/;
        if (Pincode != null && Pincode.val() != '') {
            if (!pinmatch.test(Pincode.val())) {
                text += "<br /> -Please enter valid pincode.";
                opt = 1;
            }
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}


function fnAttendee() {
    var attendee = $('#ddlAttendee option:selected').text();
    if (attendee == "Yes")
    {
        $("#AddressLine1").prop('disabled', false);
        $("#AddressLine2").prop('disabled', false);
        $("#RoadStreetName").prop('disabled', false);
        $("#LandMark").prop('disabled', false);
        $("#Locality").prop('disabled', false);

        $("#ddlState").prop('disabled', false);
        $("#ddlDistrict").prop('disabled', false);
        $("#ddlTaluka").prop('disabled', false);
        $("#ddlVillage").prop('disabled', false);
        $("#PinCode").prop('disabled', false);
        $("#attende_phone").prop('disabled', false);
        $("#attende_details").prop('disabled', false);
        //$("input").prop('disabled', true);
        //$("input").prop('disabled', false);
    }
    else
    {
        $("#AddressLine1").prop('disabled', true);
        $("#AddressLine2").prop('disabled', true);
        $("#RoadStreetName").prop('disabled', true);
        $("#LandMark").prop('disabled', true);
        $("#Locality").prop('disabled', true);

        $("#ddlState").prop('disabled', true);
        $("#ddlDistrict").prop('disabled', true);
        $("#ddlTaluka").prop('disabled', true);
        $("#ddlVillage").prop('disabled', true);
        $("#PinCode").prop('disabled', true);

        $("#attende_phone").prop('disabled', true);
        $("#attende_details").prop('disabled', true);
    }
}

