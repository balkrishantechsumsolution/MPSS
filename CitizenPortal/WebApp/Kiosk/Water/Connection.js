
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
    $('#divConn').hide();

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

});


function chkClick(Ctrl, txtCtrl) {
    debugger;
    var t_SelectedVal = $('#' + Ctrl).val();
    if (t_SelectedVal == 1) {
        $('#divConn').show(500);
    }
    else {
        $('#divConn').hide(500);
    }

}

function SubmitData() {
    debugger;
    //if (!ValidateForm()) {
    //    return;
    //}

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

    var Categorytext = $('#ddlCategory :selected').text();
    var Categoryid = $('#ddlCategory :selected').val();

    var Facilitytext = $('#ddlFacility :selected').text();
    var Facilityid = $('#ddlFacility :selected').val();

    var Purposetext = $('#ddlPurpose :selected').text();
    var Purposeid = $('#ddlPurpose :selected').val();

    var datavar = {

        'aadhaarNumber': uid,
        'CustomerID': $('#DeceasedName').val(),
        'CategoryID': Categoryid,
        'CategoryType': Categorytext,
        'FacilityID': Facilityid,
        'FacilityType': Facilitytext,
        'PurposeID': Purposeid,
        'PurposeType': Purposetext,
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
            url: '/WebApp/Kiosk/Water/Connection.aspx/InsertWaterConnection',
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
                alert("Application submitted successfully. Reference No. : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
}
