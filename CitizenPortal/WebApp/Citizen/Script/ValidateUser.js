var url
$(document).ready(function () {
    //alert("Test");
    $('#divMsg').hide();

    //$('#divOTP').hide();
    $('#btnProceed').show();
    $('#btnValidateOTP').prop('disabled', true);
    $('#txtSMSCode').prop('disabled', true);
    $('#btnOTP').show();
    //$('#divbtnOTP').hide();

    
});

function fnSkipValidation() {
    window.location.href = "CitizenProfile.aspx?" + (location.search).substr(1) + "&SV=1";
}

function fnGenOTP() {

    $('#divMsg').hide();
    $('#txtSMSCode').val("");
    var MobileNo = $("#txtMobile").val();
    var length = MobileNo.length;
    $("#divMsgTitle").text("Validate Form!");
    
    if ($("#txtMobile").val() == "") {
        //alert("Please enter 10 digit mobile number.");
        $("#divMsgDtls").text("Please enter 10 digit mobile number.");
        $("#txtMobile").focus();
        $('#divMsg').show();
        return false;
    }

    if (eval(length) < 10) {
        alert("Mobile number should be 10 digit");
        $("#txtMobile").focus();
        $("#txtMobile").val("");
        $('#divMsg').show();
        return false;
    }

    var mobmatch1 = /^[789]\d{9}$/;
    if (!mobmatch1.test(MobileNo)) {
        alert("Please Enter valid mobile Number.");        
    }

    debugger;
    var temp = "Gunwant";

    var result = false;

    //var UID = getQueryString("aadhaarNumber");
    //var TransID = getQueryString("transactionId");

    var MobileNo = $("#txtMobile").val();
    $("#txtMobile").prop('disabled', true);
    $.when(
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Citizen/Forms/ValidateUser.aspx/GenerateOTP',
        data: '{"prefix": "","Data":"' + MobileNo + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    })).then(function (data, textStatus, jqXHR) {
        debugger;
        var obj = jQuery.parseJSON(data.d);
        var html = "";
        var strMobile = "";
        AppID = obj.AppID;
        var temp = AppID.split('_');
        strMobile = temp[3];
        result = true;

        if (result /*&& jqXHRData_IMG_result*/) {
            alert('The 6 digit OTP code has been SMS to ' + strMobile + ' \. Please enter OTP code to verify');

            $("#txtMobile").prop('disabled', true);
            $('#divOTP').show();
            $('#btnValidateOTP').prop('disabled', false);
            $('#txtSMSCode').prop('disabled', false);
            $('#btnValidateOTP').show();
            $('#btnOTP').val("Re-send SMS");
            $("#divMsgTitle").text("Information!");
            $("#divMsgDtls").text("6 Digit OTP Code has been sent on registered mobile no and is valid for 10 minutes.");
            $('#divMsg').show();
        }
        else {
            alert('Sorry! Something went wrong, please try again.');
            $("#txtMobile").prop('disabled', false);
            $('#btnOTP').val('Re-generate OTP');
            $("#MobileNo").val(MobileNo);
            $("#divCitizenProfile").show();
            $("#divSearch").hide();
            $("#HFOTPDone").val("Y");
            $("#HFMobileNo").val(MobileNo);

        }
        //alert("Basic detail saved from Aadhaar.");
        //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

    });// end of Then function of main Data Insert Function

    return false;
}

function fnValidateOTP() {

    debugger;
    var temp = "Gunwant";

    var result = false;
    //var temp = AppID.split('_');
    //var strMobile = temp[0];
    //var UID = temp[0];
    //var OTP = temp[1];
    AppID = AppID;
    $.when(
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Citizen/Forms/ValidateUser.aspx/ValidateCitizenOTP',
        data: '{"prefix": "","Data":"' + AppID + '","EnteredOTP":"' + $('#txtSMSCode').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    })).then(function (data, textStatus, jqXHR) {
        debugger;
        var obj = jQuery.parseJSON(data.d);
        var html = "";
        var strMobile = "";
        var strReturn = obj.AppID;
        var temp = strReturn.split('_');
        var ResponseType = obj.ResponseType;
        var ProfileID = obj.ProfileID;
        var AadhaarKeyField = obj.KeyField;
        var cnt = temp[0];
        result = true;

        if (cnt == 1) {
                       
            fnRedirect4Profile(temp[0],temp[1], ResponseType, ProfileID, AadhaarKeyField);
        }
        else {
            //alert('OTP Validation Failed! Please re-enter correct 6 digit OTP received as SMS from Lokaseba Adhikara -CAP, Odisha Govt.');
            alert('OTP Validation Failed! You have entered wrong OTP Code, please re-enter correct OTP Code, which you have received on your registered mobile no. Other wise resend OTP Code from Lokaseba Adhikara -CAP, Odisha Govt.');

        }
        //alert("Basic detail saved from Aadhaar.");
        //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

    });// end of Then function of main Data Insert Function

    return false;
}

function fnRedirect4Profile(UID, KeyField, ResponseType, ProfileID, AadhaarKeyField) {
    debugger;
    var qs = getQueryStrings();
    if (qs["SvcID"] != "387" && qs["SvcID"] != "386") {
        if (qs["URL"] != null && qs["URL"] != "") {
            var url = qs["URL"];
            var svcid = qs["SvcID"];
            var dpt = qs["DPT"];
            var dist = qs["DIST"];
            var blk = qs["BLK"];
            var pan = qs["PAN"];
            var ofc = qs["OFC"];
            var ofr = qs["OFR"];

            var rtnurl = "";
            if (ResponseType == "A") {

                //if (KeyField == '0000000000000') {
                //    alert('Mobile No. successfully validated. Please Fill the Basic Detail to Continue.')
                //    rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                //    window.location.href = rtnurl + "?URL=" + url + '&SvcID=' + svcid + "&ProfileID=" + KeyField + "&M=" + $("#txtMobile").val();
                //}
                //else {
                alert('Mobile No. successfully validated. Please Update the Basic Details to Continue.')
                //fnUIDJSonValue();
                //rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                window.location.href = rtnurl + "?URL=" + url + '&SvcID=' + svcid + "&ProfileID=" + KeyField + "&M=" + $("#txtMobile").val();
                //}

            } else {

                if (KeyField == '0000000000000') {
                    AppID = AppID.split('_');
                    AppID = AppID[5];
                    alert('Mobile No. sucessfully validated. Please Fill the Basic Detail to Continue.')
                    rtnurl = "/WebApp/Citizen/Forms/CitizenProfile.aspx";
                    window.location.href = rtnurl +
                        '?URL=' +
                        url +
                        '&UID=' +
                        AppID +
                        '&SvcID=' +
                        svcid +
                        '&DPT=' +
                        dpt +
                        '&DIST=' +
                        dist +
                        '&BLK=' +
                        blk +
                        '&PAN=' +
                        pan +
                        '&OFC=' +
                        ofc +
                        '&OFR=' +
                        ofr;

                } else {
                    alert('Mobile No. successfully validated. Please Update the Basic Details to Continue.')
                    //fnUIDJSonValue();
                    //rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                    rtnurl = "/WebApp/Citizen/Forms/CitizenProfile.aspx";
                    window.location.href = rtnurl +
                        '?URL=' +
                        url +
                        '&ProfileID=' +
                        KeyField +
                        '&SvcID=' +
                        svcid +
                        '&DPT=' +
                        dpt +
                        '&DIST=' +
                        dist +
                        '&BLK=' +
                        blk +
                        '&PAN=' +
                        pan +
                        '&OFC=' +
                        ofc +
                        '&OFR=' +
                        ofr;

                }
            }
        }

    } else {
        var url = qs["URL"];
        var svcid = qs["SvcID"];
        var rtnurl = "";

        if (ResponseType == "A") {

            //if (KeyField == '0000000000000') {
            //    alert('Mobile No. successfully validated. Please Fill the Basic Detail to Continue.')
            //    rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
            //    window.location.href = rtnurl + "?URL=" + url + '&SvcID=' + svcid + "&ProfileID=" + KeyField + "&M=" + $("#txtMobile").val();
            //}
            //else {
                alert('Mobile No. successfully validated. Please Update the Basic Details to Continue.')
                //fnUIDJSonValue();
                //rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                window.location.href = rtnurl + "?URL=" + url + '&SvcID=' + svcid + "&ProfileID=" + KeyField + "&M=" + $("#txtMobile").val();
            //}


        } else {
            if (KeyField == '0000000000000') {
                alert('Mobile No. successfully validated. Please Fill the Basic Detail to Continue.')
                rtnurl = "/WebApp/Citizen/Forms/CitizenProfile.aspx";
                window.location.href = rtnurl + "?URL=" + url + '&SvcID=' + svcid + "&ProfileID=" + KeyField + "&M=" + $("#txtMobile").val();
            }
            else {
                alert('Mobile No. successfully validated. Please Update the Basic Details to Continue.')
                //fnUIDJSonValue();
                //rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                rtnurl = "/WebApp/Citizen/Forms/CitizenProfile.aspx";
                window.location.href = rtnurl + "?URL=" + url + '&SvcID=' + svcid + "&ProfileID=" + KeyField + "&M=" + $("#txtMobile").val();
            }

        }


    }
}

function fnFetchUIDDetails() {
    alert('OTP Validated')
}

function SubmitUIDData() {
    debugger;
    //alert($("#HFUID1").val());
    //var t_Json = $("#HFUID").val();
    var t_Json = $("#HFUID1").val();
    window.opener.document.getElementById('HFUIDData').value = t_Json;
    window.opener.document.forms[0].submit();
    self.close();
}

function fnUIDKeyValue(MobileNo) {

    debugger;
    var temp = "Gunwant";

    var result = false;

    var UID = getQueryString("aadhaarNumber");
    var TransID = getQueryString("transactionId");

    $.when(
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Citizen/Forms/RegisterMobile.aspx/GetUIDJSon',
        data: '{"prefix": "","Data":"' + MobileNo + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    })).then(function (data, textStatus, jqXHR) {
        debugger;
        var obj = jQuery.parseJSON(data.d);
        var html = "";
        var strMobile = "";
        AppID = obj.AppID;
        var temp = AppID.split('_');
        strMobile = temp[0];
        result = true;

        if (result /*&& jqXHRData_IMG_result*/) {
            var t_Json = AppID;//$("#HFUID1").val();
            window.opener.document.getElementById('HFUIDData').value = t_Json;
            window.opener.document.forms[0].submit();
            self.close();
        }
        else {
            alert('Sorry! Something went wrong, please try again.');

        }
        //alert("Basic detail saved from Aadhaar.");
        //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

    });// end of Then function of main Data Insert Function

    return false;
}
