
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

    $('#divParticulars').hide();
    //$('#divSuspect').hide();
    $('#divmore').hide();

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

    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    var categorytext = "";
    var categoryid = "";
    categoryid = $('#ddlCategory :selected').val();
    if (categoryid != 0) {
        categorytext = $('#ddlCategory :selected').text();       
    }
    else { alert('Please select Complaint Category'); return;}

    var DOIArr = $('#txtDate').val().split("/");
    var DOIConverted = DOIArr[2] + "-" + DOIArr[1] + "-" + DOIArr[0];

    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,
        'CategoryId': categoryid,
        'Category': categorytext,
        'IncidentDate': DOIConverted,
        'IncidentPlace': $('#txtPlace').val(),
        'Description': $('#txtDetails').val(),
        'Particulars': $('#txtParticulars').val(),
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
            url: '/WebApp/Kiosk/FIR/FIRRegistration.aspx/InsertFIRRegistration',
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


function fnParticulars() {
    debugger;

    var categorytext = $('#ddlCategory :selected').text();
    var categoryid = $('#ddlCategory :selected').val();
    if (categoryid != 0) {
        $('#divParticulars').show();
        $('#lblParticulars').text('Particulars of ' + categorytext + ' Details');
    }
    else { $('#divParticulars').hide(); }

}

function AddSuspect(DeleteString) {
    debugger;
    if (validateSuspectValues(DeleteString) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strName = "";
        var strAddress = "";
        var strContact = "";
        var strRemarks = "";
        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {

            strName = $('#txtAccused').val();
            strAddress = $('#txtAddress').val();
            strContact = $('#txtContact').val();
            strRemarks = $('#txtRemark').val();

            strTempString = document.getElementById("hdfSuspect").value + "#" + SrNo + "," + strName + "," + strAddress + "," + strContact + "," + strRemarks + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspect").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Name</th>";
        Str = Str + "<th style='text-align: center;'>Address</th>";
        Str = Str + "<th style='text-align: center;'>Contact No.</th>";
        Str = Str + "<th style='text-align: center;'>Remarks Unit</th>";
        Str = Str + "<th style='text-align: center;'>Remove</th>";
        Str = Str + "</tr>";

        while (strTempString.length > 0) {

            intCount = intCount + 1;
            var StartIndex = strTempString.indexOf("#");
            strTempString = strTempString.substring(StartIndex + 1, strTempString.length);
            var EndIndex = strTempString.indexOf("#");
            var RemStr = strTempString.substring(0, EndIndex);


            StartIndex = RemStr.indexOf(",");
            SrNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);
            SrNo = intCount;

            StartIndex = RemStr.indexOf(",");
            strName = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strAddress = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strContact = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            //StartIndex = RemStr.indexOf(",");
            //strRemarks = RemStr.substring(0, StartIndex);
            //RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strRemarks = RemStr;

            var DeleteString = "#" + SrNo + "," + strName + "," + strAddress + "," + strContact + "," + strRemarks + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strName + "</td>";
            Str = Str + "<td style='' >" + strAddress + "</td>";
            Str = Str + "<td style='' >" + strContact + "</td>";
            Str = Str + "<td style='' >" + strRemarks + "</td>";


            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSuspect = strSuspect + "#" + SrNo + "," + strName + "," + strAddress + "," + strContact + "," + strRemarks + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strName + "," + strAddress + "," + strContact + "," + strRemarks + "#";

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspect').innerHTML = Str;
        document.getElementById("hdfSuspect").value = strSuspect;
        document.getElementById("hdfSuspectSave").value = strSaveSuspect;
        document.getElementById("hdfSuspectString").value = intCount;

        //document.getElementById('<%=ddlPharmacopoeialMonograph.ClientID %>').selectedIndex = 0;
        //$("#txtOtherPharmacopoeialMonograph").hide();
        //$("#lblOtherPharmacopoeialMonograph").hide();
        //$("#divOtherPhar").hide();
        //document.getElementById('<%=txtNameofIngredient.ClientID %>').value = "";
        //document.getElementById('<%=txtOtherPharmacopoeialMonograph.ClientID %>').value = "";
        //document.getElementById('<%=txtStrength.ClientID %>').value = "";
        //document.getElementById('<%=txtStrengthUnit.ClientID %>').value = "";

        //document.getElementById('<%=txtNameofIngredient.ClientID %>').focus();

        strName = $('#txtAccused').val("").focus();
        strAddress = $('#txtAddress').val("");
        strContact = $('#txtContact').val("");
        strRemarks = $('#txtRemark').val("");
    }
}

function DelString(DeleteString) {

    var Msg = "Do you want remove this Suspect?";

    if (confirm(Msg)) {
        var strString = document.getElementById("<%=hdfSuspect.ClientID %>").value;
        strString = strString.replace(DeleteString, "");
        document.getElementById("<%=hdfSuspect.ClientID %>").value = strString;
        AddSuspect(DeleteString);
    }
}

function validateSuspectValues(DeleteString) {

    if (DeleteString != '') {
        return true;
    }

    var strName = "";
    var strAddress = "";
    var strContact = "";
    var strRemark = "";
    var strMsg = "";
    var isError = false;

    strName = $('#txtAccused').val();
    strAddress = $('#txtAddress').val();
    strContact = $('#txtContact').val();
    strRemarks = $('#txtRemark').val();

    if (strName == "") {
        strMsg = strMsg + "</br> * Please Enter Name of Suspect.";
        document.getElementById('txtAccused').focus();
        isError = true;
    }

    if (strAddress == "") {
        strMsg = strMsg + "</br> * Please Enter Address of Suspect.";
        document.getElementById('txtAddress').focus();
        isError = true;
    }
    if (strContact == "") {
        strMsg = strMsg + "</br> * Please Enter Contact No. of Suspect.";
        document.getElementById('txtContact').focus();
        isError = true;
    }
    if (strRemarks == "") {
        strMsg = strMsg + "</br> * Please Enter Remark.";
        document.getElementById('txtRemark').focus();
        isError = true;
    }

    if (isError == true) {
        document.getElementById("divmore").innerHTML = " * Below are the Accused / Suspect Details validation error(s), please rectify ! <br> " + strMsg;
        $("#divmore").show();
        document.getElementById("divmore").focus();
        return false;
    }
    else {
        document.getElementById("divmore").innerHTML = "";
        $("#divmore").hide();
    }
    return true;

}
