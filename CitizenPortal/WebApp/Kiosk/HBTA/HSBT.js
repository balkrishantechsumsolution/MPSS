
$(document).ready(function () {


    $('#divParticulars').hide();
    //$('#divSuspect').hide();
    $('#divmore').hide();

    
    $('#date_journey').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '+0D',
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
        maxDate: '+0D',
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
    //if (!ValidateForm()) {
    //    return;
    //}

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
    
    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,
        'bpl_card_no': $('#bpl_card_no').val(),
        'bpl_year': $('#bpl_year').val(),
        'date_jouney': DOJConverted,
        'date_return': $('#date_return').val(),
        'disease_detail': $('#applicant_disease').val(),
        'atende_detail': $('#attende_details').val(),
        'disease_history': $('#disease_details').val(),
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
            url: '/WebApp/Kiosk/HBTA/HSBT.aspx/InsertHSBT',
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
