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
    if (!ValidateForm())
    {
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

        'VesselName': $('#FhngVslNme').val(),
        'VesselRegNo': $('#VslRegNo').val(),
        'VesselWhere': $('#WhereVslSeurd').val(),
        'VesselWhen': $('#WhnVslSeurd').val(),
        'VesselBoatType': $('#BoatType').val(),
        'VesselMaterials': $('#BoatMaterialUsed').val(),
        'VesselSheathing': $('#BoatShtngUsed').val(),
        'BoatLength': $('#BoatLngth').val(),
        'BoatBreadth': $('#BoatBrdth').val(),
        'EngineVHP': $('#EngneVHP').val(),
        'EngineNo': $('#EngneNo').val(),
        'TradeMark': $('#TradeMrk').val(),
        'VesselType': $('#VslType').val(),
        'VesselGearType': $('#VslGearType').val(),
        'VesselBoatPlace': $('#VslConstructedPlce').val(),
        'VesselBoatName': $('#NmeBBYard').val(),
        'VesselBaseYear': $('#VslCnstrtnYear').val(),
        'VesselConsYear': $('#OperateBase').val(),
        'NofCrews': $('#CrewsNo').val(),
        'CrewsDesignation': $('#CrewsDesignation').val(),

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
            url: '/WebApp/Kiosk/DOF/RegistrationForm.aspx/InsertFisheriesRegistration',
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
    debugger;
    console.log("ready!");
    VesselDetailValidation();
    document.getElementById("btnSubmit").disabled = false;
});

function VesselDetailValidation() {
    debugger;
    var VesselBoatType = $('#BoatType :selected').val();

    if (VesselBoatType == 0) {
        $('#BoatMaterialUsed').prop('disabled', true);
        $('#BoatShtngUsed').prop('disabled', true);
        $('#BoatLngth').prop('disabled', true);
        $('#BoatBrdth').prop('disabled', true);
    }
    else if (VesselBoatType == 'Mechanized' || VesselBoatType == 'NonMechanized') {
        $('#BoatMaterialUsed').prop('disabled', false);
        $('#BoatShtngUsed').prop('disabled', false);
        $('#BoatLngth').prop('disabled', false);
        $('#BoatBrdth').prop('disabled', false);
    }
}

function ValidateForm() {
    debugger;

    var text = "";
    var opt = "";

    var VesselName = $('#FhngVslNme').val();
    if (VesselName == null || VesselName == '') {
        text += "<br /> -Please enter Vessel Name ";
        $('#FhngVslNme').attr('style', 'border:1px solid red !important;');
        $('#FhngVslNme').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#FhngVslNme').attr('style', 'border:1px solid #ddd !important;');
        $('#FhngVslNme').css({ "background-color": "#ffffff" });
    }

    var BoatRegNo = $('#VslRegNo').val();
    if (BoatRegNo == null || BoatRegNo == '') {
        text += "<br /> -Please enter Vessel Registration Number ";
        $('#VslRegNo').attr('style', 'border:1px solid red !important;');
        $('#VslRegNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#VslRegNo').attr('style', 'border:1px solid #ddd !important;');
        $('#VslRegNo').css({ "background-color": "#ffffff" });
    }

    var VesselWhere= $('#WhereVslSeurd').val();
    if (VesselWhere == null || VesselWhere == '') {
        text += "<br /> -Please enter Where Fishing Vessel Was Secured ";
        $('#WhereVslSeurd').attr('style', 'border:1px solid red !important;');
        $('#WhereVslSeurd').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#WhereVslSeurd').attr('style', 'border:1px solid #ddd !important;');
        $('#WhereVslSeurd').css({ "background-color": "#ffffff" });
    }


    var VesselWhen = $('#WhnVslSeurd').val();
    if (VesselWhen == null || VesselWhen == '') {
        text += "<br /> -Please enter When Fishing Vessel Was Secured ";
        $('#WhnVslSeurd').attr('style', 'border:1px solid red !important;');
        $('#WhnVslSeurd').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#WhnVslSeurd').attr('style', 'border:1px solid #ddd !important;');
        $('#WhnVslSeurd').css({ "background-color": "#ffffff" });
    }

    var Boat_Type = $('#BoatType').val();
    if (Boat_Type == "0") {
        text += "<br /> -Please select Vessel Boat Type ";
        $('#BoatType').attr('style', 'border:1px solid red !important;');
        $('#BoatType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#BoatType').attr('style', 'border:1px solid #ddd !important;');
        $('#BoatType').css({ "background-color": "#ffffff" });
    }

    var VesselMaterials = $('#BoatMaterialUsed').val();
    if (VesselMaterials == "0") {
        text += "<br /> -Please select Vessel Boat Material ";
        $('#BoatMaterialUsed').attr('style', 'border:1px solid red !important;');
        $('#BoatMaterialUsed').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#BoatMaterialUsed').attr('style', 'border:1px solid #ddd !important;');
        $('#BoatMaterialUsed').css({ "background-color": "#ffffff" });
    }

    var VesselSheathing = $('#BoatShtngUsed').val();
    if (VesselSheathing == "0") {
        text += "<br /> -Please select Vessel Boat Sheating ";
        $('#BoatShtngUsed').attr('style', 'border:1px solid red !important;');
        $('#BoatShtngUsed').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#BoatShtngUsed').attr('style', 'border:1px solid #ddd !important;');
        $('#BoatShtngUsed').css({ "background-color": "#ffffff" });
    }

    var BoatLength = $('#BoatLngth').val();
    if (BoatLength == '' || BoatLength == null) {
        text += "<br /> -Please select Vessel Boat Length ";
        $('#BoatLngth').attr('style', 'border:1px solid red !important;');
        $('#BoatLngth').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#BoatLngth').attr('style', 'border:1px solid #ddd !important;');
        $('#BoatLngth').css({ "background-color": "#ffffff" });
    }

    var BoatBreadth = $('#BoatBrdth').val();
    if (BoatBreadth == '' || BoatBreadth == null) {
        text += "<br /> -Please select Vessel Boat Breadth ";
        $('#BoatBrdth').attr('style', 'border:1px solid red !important;');
        $('#BoatBrdth').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#BoatBrdth').attr('style', 'border:1px solid #ddd !important;');
        $('#BoatBrdth').css({ "background-color": "#ffffff" });
    }

    var EngineVHP = $('#EngneVHP').val();
    if (EngineVHP == '' || EngineVHP == null) {
        text += "<br /> -Please enter Vessel Engine VHP ";
        $('#EngneVHP').attr('style', 'border:1px solid red !important;');
        $('#EngneVHP').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#EngneVHP').attr('style', 'border:1px solid #ddd !important;');
        $('#EngneVHP').css({ "background-color": "#ffffff" });
    }

    var EngineNo = $('#EngneNo').val();
    if (EngineNo == '' || EngineNo == null) {
        text += "<br /> -Please enter Vessel Engine No ";
        $('#EngneNo').attr('style', 'border:1px solid red !important;');
        $('#EngneNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#EngneNo').attr('style', 'border:1px solid #ddd !important;');
        $('#EngneNo').css({ "background-color": "#ffffff" });
    }

    var TradeMark = $('#TradeMrk').val();
    if (TradeMark == '' || TradeMark == null) {
        text += "<br /> -Please enter Vessel Engine Trade Mark ";
        $('#TradeMrk').attr('style', 'border:1px solid red !important;');
        $('#TradeMrk').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#TradeMrk').attr('style', 'border:1px solid #ddd !important;');
        $('#TradeMrk').css({ "background-color": "#ffffff" });
    }

    var VesselType = $('#VslType').val();
    if (VesselType == '' || VesselType == null||VesselType == '0') {
        text += "<br /> -Please enter Vessel Engine Type ";
        $('#VslType').attr('style', 'border:1px solid red !important;');
        $('#VslType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#VslType').attr('style', 'border:1px solid #ddd !important;');
        $('#VslType').css({ "background-color": "#ffffff" });
    }
    
    var VesselGearType = $('#VslGearType').val();
    if (VesselGearType == '' || VesselGearType == null||VesselGearType =='0') {
        text += "<br /> -Please enter Vessel Engine Gear Type ";
        $('#VslGearType').attr('style', 'border:1px solid red !important;');
        $('#VslGearType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#VslGearType').attr('style', 'border:1px solid #ddd !important;');
        $('#VslGearType').css({ "background-color": "#ffffff" });
    }

    var VesselBoatPlace = $('#VslConstructedPlce').val();
    if (VesselBoatPlace == '' || VesselBoatPlace == null||VesselBoatPlace == '0') {
        text += "<br /> -Please enter Vessel Engine Constructed Placce ";
        $('#VslConstructedPlce').attr('style', 'border:1px solid red !important;');
        $('#VslConstructedPlce').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#VslConstructedPlce').attr('style', 'border:1px solid #ddd !important;');
        $('#VslConstructedPlce').css({ "background-color": "#ffffff" });
    }

    var VesselBoatName = $('#NmeBBYard').val();
    if (VesselBoatName == '' || VesselBoatName == null) {
        text += "<br /> -Please enter Vessel Boat Name ";
        $('#NmeBBYard').attr('style', 'border:1px solid red !important;');
        $('#NmeBBYard').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#NmeBBYard').attr('style', 'border:1px solid #ddd !important;');
        $('#NmeBBYard').css({ "background-color": "#ffffff" });
    }

    var VesselBaseYear = $('#VslCnstrtnYear').val();
    if (VesselBaseYear == '' || VesselBaseYear == null) {
        text += "<br /> -Please enter Vessel Base Year ";
        $('#VslCnstrtnYear').attr('style', 'border:1px solid red !important;');
        $('#VslCnstrtnYear').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#VslCnstrtnYear').attr('style', 'border:1px solid #ddd !important;');
        $('#VslCnstrtnYear').css({ "background-color": "#ffffff" });
    }

    var VesselConsYear = $('#OperateBase').val();
    if (VesselConsYear == '' || VesselConsYear == null) {
        text += "<br /> -Please enter Vessel Contruction Year ";
        $('#OperateBase').attr('style', 'border:1px solid red !important;');
        $('#OperateBase').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#OperateBase').attr('style', 'border:1px solid #ddd !important;');
        $('#OperateBase').css({ "background-color": "#ffffff" });
    }

    var NofCrews = $('#CrewsNo').val();
    if (NofCrews == '' || NofCrews == null) {
        text += "<br /> -Please enter No Of Vessel Crew Members ";
        $('#CrewsNo').attr('style', 'border:1px solid red !important;');
        $('#CrewsNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CrewsNo').attr('style', 'border:1px solid #ddd !important;');
        $('#CrewsNo').css({ "background-color": "#ffffff" });
    }

    var CrewsDesignation = $('#CrewsDesignation').val();
    if (CrewsDesignation == '' || CrewsDesignation == null) {
        text += "<br /> -Please enter Vessel Crew Designation ";
        $('#CrewsDesignation').attr('style', 'border:1px solid red !important;');
        $('#CrewsDesignation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CrewsDesignation').attr('style', 'border:1px solid #ddd !important;');
        $('#CrewsDesignation').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}