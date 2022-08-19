var AppID = "";
var ProfileStatus = "";
var text = "";
var opt = "";

$(document).ready(function () {

    $("#progressbar").hide();
    //GetPhDResearchCenter();
    GetDiscipline();
    GetOUATState();
    GetOUATState2();

    if ($("#HFUIDData").val() != "") {
        alert($("#HFUIDData").val());
        BindProfile($("#HFUIDData").val());
    }
    else {
        $('#txtState').hide();
        $('#txtDistrict').hide();
        $('#txtBlock').hide();
        $('#txtPanchayat').hide();
    }

    $('#DOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-80:-23",
        onSelect: function (date) {
            var Age = calcDobAge(date);
            var Age = calcExSerDur(date, '31/07/2021');
            $('#Age').val(Age.years);
            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);
        }
    });

    $("#rbtnEntY").on('change', function () {
        $("#divExemption").show();
    });

    $("#rbtnEntN").on('change', function () {
        $("#divExemption").hide();

    });
    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);


    $("#OthrInfo3N").on('change', function () {
        $("#txtCourseDetail").val('');
    });


    $("#OthrInfo2N").on('change', function () {
        $("input[name='radio6']").prop('checked', false);
    });

    $("#divPCPercent").hide(800);
    $("input[name='HandicapType']").on('change', function () {
        var PCPercent = $("input[name='HandicapType']:checked").val();
        if (PCPercent == "Permanent") {
            $("#divPCPercent").hide(800);
            $("#txtHandiPercent").val('');
        }
        else {
            $("#divPCPercent").show(800);
        }
    });


    //var otherState = $("input[id='CheckBoxList1_2']").prop('checked', true);
    //var otherState = $("input[id='CheckBoxList1_2']:checked").val();
    //if (otherState = "206") {
    //    var SelState = $('#ddlOtherState').val();
    //    $.ajax({
    //        type: "POST",
    //        contentType: "application/json; charset=utf-8",
    //        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATState',
    //        data: '{}',
    //        dataType: "json",
    //        success: function (response) {
    //            var Category = eval(response.d);
    //            var html = "";
    //            var catCount = 0;

    //            var ddlState = $("[id=ddlOtherState]");
    //            ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
    //            $.each(Category, function () {
    //                $("[id=ddlOtherState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
    //                catCount++;
    //            });
    //        },
    //        error: function (a, b, c) {
    //            alert("2." + a.responseText);
    //        }
    //    });
    //}
    //else {
    //    var ddlState = $("[id=ddlOtherState]");
    //    ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
    //}

});

function fnEntranceExempted() {
    
    $("#ddlResearch").val(0);
    $("#ddlDiscipline").val(0);
    $('#ddlSpecialization').val(0);
    if ($("#rbtnEntY").val() == "Yes") {
        if ($("#ddlExempted").val() == "EX001") {
            $("#divENT").show(250);
            $("#divMPhil").hide(250);
            $("#divFellowship").hide(250);
            $("#divResearch").hide(250);
        } else if ($("#ddlExempted").val() == "EX002") {
            $("#divENT").hide(250);
            $("#divMPhil").show(250);
            $("#divFellowship").hide(250);
            $("#divResearch").hide(250);
            
            
        } else if ($("#ddlExempted").val() == "EX003" || $("#ddlExempted").val() == "EX005") {
            $("#divENT").hide(250);
            $("#divMPhil").hide(250);
            $("#divFellowship").show(250);
            $("#divResearch").hide(250);
        }
        else if ($("#ddlExempted").val() == "EX004") {
            $("#divENT").hide(250);
            $("#divMPhil").hide(250);
            $("#divFellowship").hide(250);
            $("#divResearch").show(250);
        }
        else {
            $("#divENT").hide(250);
            $("#divMPhil").hide(250);
            $("#divFellowship").hide(250);
            $("#divResearch").hide(250);
        }
    }
    else {
        $("#divENT").hide();
        $("#divMPhil").hide();
        $("#divFellowship").hide();
        $("#divResearch").hide();
    }

}


/**Validate User Mobile and Send SMS**/
function ValidateUserM() {
    debugger;
    var MobileNo = $("#txtMobile").val();
    var length = MobileNo.length;

    if ($("#txtMobile").val() == "") {
        //alert("Please enter 10 digit mobile number.");
        $("#divMsgDtls").text("Please enter 10 digit mobile number.");
        $("#txtMobile").focus();
        $('#divMsg').show();
        return;
    }

    if (eval(length) < 10) {
        alert("Mobile number should be 10 digit");
        $("#txtMobile").focus();
        $("#txtMobile").val("");
        $('#divMsg').show();
        return;
    }

    var mobmatch1 = /^[6789]\d{9}$/;
    if (!mobmatch1.test(MobileNo)) {
        alert("Please Enter valid mobile Number.");
        return;
    }
    $("#txtMobile").prop('disabled', true);

    ValidateRegisteredMobile(MobileNo, "PGPhD");
}

/**Validate Registration**/
function ValidateRegisteredMobile(Mobile, Type)//Here Type use for validation 1-Profile,2-OUATFormA
{
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhDApplication.aspx/ValidateRegisteredMobile',
        data: '{"Mobile": "' + Mobile + '","Type":"' + Type + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;
            var Resp = jQuery.parseJSON(response.d);
            var UserName = Resp[0]["UserName"];
            var Mobile = Resp[0]["Mobile"];
            var Email = Resp[0]["Email"];
            var Result = Resp[0]["Result"]; // Always return 0 if mobile not exist
            var Msg = Resp[0]["Msg"]; //Not Exist
            var MsgHeader = Resp[0]["MsgHeader"];
            ProfileStatus = Result;
            if (Result == '0') {
                fnGenOTP(ProfileStatus);
            }
            else if (Result == '1') {
                //Validate Here for further processing the application.........
                bootbox.confirm({
                    message: Msg,
                    buttons: {
                        confirm: {
                            label: 'Yes',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: 'No',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {
                        //console.log('This was logged in the callback: ' + result);
                        if (result == true) {
                            fnGenOTP(ProfileStatus);
                            $('#divLogin').hide();
                        }
                        else {
                            $("#txtMobile").prop('disabled', false);
                            $('#btnSubmit').prop('disabled', true);

                        }
                    }
                });

            }
            else if (Result == '2') {
                $("#txtMobile").prop('disabled', false);
                $('#btnSubmit').prop('disabled', true);
                alertPopup(MsgHeader, Msg);
                var rtnurl = "/WebApp/Entrance/PhD/CSVTUPage.aspx";
                window.location.href = rtnurl;
            }
            else {
                $("#txtMobile").prop('disabled', false);
                $('#btnSubmit').prop('disabled', true);

            }


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

/** Generate OTP **/
function fnGenOTP(ProfileStatus) {

    $('#divMsg').hide();
    $('#txtSMSCode').val("");
    var MobileNo = $("#txtMobile").val();
    var length = MobileNo.length;
    $("#divMsgTitle").text("Validate Form!");
    
    if ($("#txtMobile").val() == "") {
        alert("Please enter 10 digit mobile number.");
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

    var mobmatch1 = /^[6789]\d{9}$/;
    if (!mobmatch1.test(MobileNo)) {
        alert("Please Enter valid mobile Number.");
        return;
    }

    debugger;
    var temp = "Gunwant";

    var result = false;
    var AppType = "PGPhD";
    //var UID = getQueryString("aadhaarNumber");
    //var TransID = getQueryString("transactionId");

    var MobileNo = $("#txtMobile").val();
    $("#txtMobile").prop('disabled', true);
    $.when(
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhDApplication.aspx/GenerateOTPCSVTU',
        data: '{"prefix": "","Data":"' + MobileNo + '","AppType":"' + AppType+ '"}',
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
        var Status=obj.Status;

        if (Status == 'Success') {
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
            //if (ProfileStatus = "1") {
            //    $('#divLogin').hide();
            //} else $('#divLogin').show();
        }
        else if (Status == 'AlreadyExist')
        {
            $("#txtMobile").prop('disabled', false);
            $('#btnSubmit').prop('disabled', true);
            ProfileStatus = "1"
            $('#hdnLoginID').val(ProfileStatus);
            $('#divLogin').hide();
            $('#hdnLoginID').val($("#txtMobile").val());
            alertPopup("Mobile No already exist!", "Mobile No already registered for appearing in the Entrance Examination for Ph.D. Programme, 2022, Please login to check application status.");
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


/** Mobile OTP Validation **/
function fnValidateOUATOTP() {

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
        url: '/WebApp/Entrance/PhD/PGPhDApplication.aspx/ValidateOTPCSVTU',
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

            fnOTPValidaed(temp[0], temp[1], ResponseType, ProfileID, AadhaarKeyField);
        }
        else {
            //alert('OTP Validation Failed! Please re-enter correct 6 digit OTP received as SMS from Lokaseba Adhikara -CAP, Odisha Govt.');
            alert('OTP Validation Failed! You have entered wrong OTP Code, please re-enter correct OTP Code, which you have received on your registered mobile no. Other wise resend OTP Code from CSVTU, Bhilai, (DiGiVarsity).');

        }
        //alert("Basic detail saved from Aadhaar.");
        //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

    });// end of Then function of main Data Insert Function

    return false;
}

function fnOTPValidaed(UID, KeyField, ResponseType, ProfileID, AadhaarKeyField) {
    debugger;

    var rtnurl = "";
    if (ResponseType == "M") {
        AppID = AppID.split('_');
        AppID = AppID[5];
        $('#MobileNo').val($('#txtMobile').val());
        $('#txtUserID').val($('#txtMobile').val());
        $('#MobileNo').prop('disabled', true);
        $('#txtSMSCode').prop('disabled', true);
        $('#btnValidateOTP').prop('disabled', true);
        $('#btnOTP').prop('disabled', true);
        $('#btnSubmit').prop('disabled', false);
        $("#divMsgTitle").text("Information!");
        $("#divMsgDtls").text("Mobile no " + $('#txtMobile').val() + " sucessfully validated. Please Fill Application form for appearing in the Entrance Examination for Ph.D. Programme, 2022");
        $('#divMsg').hide();

        alert('Mobile No. ' + $('#txtMobile').val() + ' sucessfully validated. Please Fill Application form for appearing in the Entrance Examination for Ph.D. Programme, 2022');

    } else {

        if (KeyField == '0000000000000') {
            AppID = AppID.split('_');
            AppID = AppID[5];
            $('#MobileNo').val($('#txtMobile').val());
            $('#txtUserID').val($('#txtMobile').val());
            $('#MobileNo').prop('disabled', true);
            $('#txtSMSCode').prop('disabled', true);
            $('#btnValidateOTP').prop('disabled', true);
            $('#btnOTP').prop('disabled', true);
            $('#btnSubmit').prop('disabled', false);
            $("#divMsgTitle").text("Information!");
            $("#divMsgDtls").text("Mobile no " + $('#txtMobile').val() + " sucessfully validated. Please Fill Application form for appearing in the Entrance Examination for Ph.D. Programme, 2022");
            $('#divMsg').show();

            alert("Mobile No. " + $('#txtMobile').val() + " sucessfully validated. Please Fill Application form for appearing in the Entrance Examination for Ph.D. Programme, 2022");

        } else {
            alert("Mobile No. " + $('#txtMobile').val() + " already registered for Application form for appearing in the Entrance Examination for Ph.D. Programme, 2022. Please Login to check the details.");
            rtnurl = "/WebApp/Entrance/PhD/CSVTUPage.aspx";
            window.location.href = rtnurl;

        }
    }

}

function hidedive() {
    var reserved = $("input[name='reserved']:checked").val();

    if (reserved == "no") {
        $("#CheckBoxList1_0").prop('checked', false);
        $("#CheckBoxList1_1").prop('checked', false);
        $("#CheckBoxList1_2").prop('checked', false);
        $("#CheckBoxList1_3").prop('checked', false);
        $("#CheckBoxList1_4").prop('checked', false);
        $("#CheckBoxList1_5").prop('checked', false);
        $('#divReserved').hide();
        $('#divEmplyeeCase').hide();
        $('#divNRI').hide();
        $('#divAgro').hide();
        $('#divResevation').hide();
        $("#divMarks").hide();
        $("#divGCH").hide();
        $("#divWO").hide();
        $("#divPH").hide();
        $("#divKM").hide();
    }
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

// Permananent Address Binding

function GetOUATState() {
    var SelState = $('#PddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/entrance/PhD/PGPhdApplication.aspx/GetOUATState',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlState = $("[id=PddlState]");
            ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=PddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetOUATDistrict() {
    var SelState = $('#PddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATDistrict',
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlDistrict = $("[id=PddlDistrict]");
            ddlDistrict.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=PddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetOUATBlock() {
    var SelBlock = $('#PddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATBlock',
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlBlock = $("[id=PddlTaluka]");
            ddlBlock.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=PddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetOUATPanchayat() {
    var SelSubDistrict = $('#PddlTaluka').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATPanchayat',
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlVillage = $("[id=PddlVillage]");
            ddlVillage.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=PddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


//Present Address Binding

function GetOUATState2() {
    var SelState = $('#CddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATState',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlState = $("[id=CddlState]");
            ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=CddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetOUATDistrict2() {
    var SelState = $('#CddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATDistrict',
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlDistrict = $("[id=CddlDistrict]");
            ddlDistrict.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=CddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetOUATBlock2() {
    var SelBlock = $('#CddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATBlock',
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlBlock = $("[id=CddlTaluka]");
            ddlBlock.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=CddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetOUATPanchayat2() {
    var SelSubDistrict = $('#CddlTaluka').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATPanchayat',
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlVillage = $("[id=CddlVillage]");
            ddlVillage.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=CddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


var objState = "", objDistrict = "", objTaluka = "", objVillage = "";


function fnCopyAddress(chkAddress) {

    var text = "";
    var opt = "";

    var Addressline1 = $("#PAddressLine1").val();
    var Addressline2 = $("#PAddressLine2").val();
    var RoadStreetName = $("#PRoadStreetName").val();
    var LandMark = $("#PLandMark").val();
    var Locality = $("#PLocality").val();
    var State = $("#PddlState option:selected").val();
    var District = $("#PddlDistrict option:selected").val();
    var Taluka = $("#PddlTaluka option:selected").val();
    var Village = $("#PddlVillage option:selected").val();
    var Pincode = $("#PPinCode").val();

    var objState = "PddlState";
    var objDistrict = "PddlDistrict";
    var objTaluka = "PddlTaluka";
    var objVillage = "PddlVillage";

    var AddState = "CddlState";
    var AddDistrict = "CddlDistrict";
    var AddTaluka = "CddlTaluka";
    var AddVillage = "CddlVillage";

    if (chkAddress) {
        GetStateUID($("#" + objState).val(), $("#" + objDistrict).val(), $("#" + objTaluka).val(), $("#" + objVillage).val());
        $('#CAddressLine1').val(Addressline1);
        $('#CAddressLine2').val(Addressline2);
        $('#CRoadStreetName').val(RoadStreetName);
        $('#CLandMark').val(LandMark);
        $('#CLocality').val(Locality);
        $('#CPinCode').val(Pincode);
    }
    else {
        $('#CAddressLine1').val("");
        $('#CAddressLine2').val("");
        $('#CRoadStreetName').val("");
        $('#CLandMark').val("");
        $('#CLocality').val("");

        $("[id*=" + AddState + "]").val("0");
        $("[id*=" + AddDistrict + "]").empty();
        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');
        $("[id*=" + AddTaluka + "]").empty();
        $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');
        $("[id*=" + AddVillage + "]").empty();
        $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');

        $('#CPinCode').val("");
    }
}


function isNumberKeyDecimal(e,cntrlid) {
    var code = (code ? code : e.which);
    if (code != 46 && code > 31 && (code < 48 || code > 57))
        return false;
        //if it is (.)
    else if (code == 46) {
        var Value = $("[id=" + cntrlid + "]").val();//this.value;
        //if value already contains (.) character
        if (Value.indexOf('.') != -1) {
            var splt = Value.split('.');
            //if there is already(.) char then return false
            if (splt.length >= 2)
                return false;
        }
    }
    return true;
}


function EL(id) {
    return document.getElementById(id);
} // Get el by ID helper function


function readFile() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 10 || sizekb > 50) {
            // $('#imgupload').attr('src', null);
            alert('The size of the photograph should fall between 20KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }
        var ftype = this;
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Photograph only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
            }
            else {
                alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("myImg").src = e.target.result;
            EL("HFb64").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}


function readFile2() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfSign').val(sizekb);
        if (sizekb < 5 || sizekb > 20) {
            // $('#imgupload').attr('src', null);
            alert('The size of the signature should fall between 10KB to 20KB. Your signature Size is ' + sizekb + 'kb.');
            return false;
        }

        var ftype = this; //document.getElementById('File1');
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Signature only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
            }
            else {
                alert("Signature only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("mySign").src = e.target.result;
            EL("HFb64Sign").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}


function selectByVal(p_Control, txt) {
    var t_Value = txt;
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }
    return t_Value;
}


function selectByTextAddress(p_Control, txt) {
    $("[id*=ddlState] option")
    .filter(function () { return $.trim($(this).text()) == txt; })
    .attr('selected', true);

    var t_Value = "";

    $("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
        return $(this).text().toLowerCase() == txt.toLowerCase();
        if ($(this).text().toLowerCase() == txt.toLowerCase()) {
            t_Value = $(this).val();
            return t_Value;
        }
    }).prop('selected', true);

    alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    $("[id*=" + p_Control + "] option").each(function () {
        if ($(this).text() == theText) {
            //$(this).attr('selected', 'selected');
            t_Value = $(this).val();
        }
    });

    $("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}


function selectByTextCitizen(p_Control, txt) {
    $("[id*=ddlState] option")
    .filter(function () { return $.trim($(this).text()) == txt; })
    .attr('selected', true);

    var t_Value = $("#" + txt + "").val();
    var t_Value = txt;
    $("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
        //return $(this).text().toLowerCase() == txt.toLowerCase();
        if ($(this).val().toLowerCase() == txt.toLowerCase()) {
            t_Value = $(this).val();
            return t_Value;
        }
    }).prop('selected', true);

    alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    $("[id*=" + p_Control + "] option").each(function () {
        if ($(this).text() == theText) {
            //$(this).attr('selected', 'selected');
            t_Value = $(this).val();
        }
    });

    $("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}


function GetStateUID(p_State, p_District, p_SubDistrict, p_Village) {
    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        var AddState = "CddlState";
        var AddDistrict = "CddlDistrict";
        var AddTaluka = "CddlTaluka";
        var AddVillage = "CddlVillage";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            //url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=" + AddState + "]").empty();
                $("[id*=" + AddState + "]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=" + AddState + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                });

                t_StateVal = selectByVal(AddState, p_State);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    //url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id*=" + AddDistrict + "]").empty();
                        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id*=" + AddDistrict + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            catCount++;
                        });

                        t_DistrictVal = selectByVal(AddDistrict, p_District);

                        if (t_DistrictVal != "") {

                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                //url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATBlock',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id*=" + AddTaluka + "]").empty();
                                    $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id*=" + AddTaluka + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByVal(AddTaluka, p_SubDistrict);

                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    if (SelIndex != null && SelIndex != "") {
                                        $.ajax({
                                            type: "POST",
                                            contentType: "application/json; charset=utf-8",
                                            //url: '../../Registration/KioskRegistration.aspx/GetVillage',
                                            url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATPanchayat',
                                            data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                            processData: false,
                                            dataType: "json",
                                            success: function (response) {
                                                var Category = eval(response.d);
                                                var html = "";
                                                var catCount = 0;
                                                $("[id*=" + AddVillage + "]").empty();
                                                $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
                                                $.each(Category, function () {
                                                    $("[id*=" + AddVillage + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                    catCount++;
                                                });

                                                t_VillageVal = selectByVal(AddVillage, p_Village);
                                            },
                                            error: function (a, b, c) {
                                                alert("4." + a.responseText);
                                            }
                                        });
                                    }
                                },
                                error: function (a, b, c) {
                                    alert("3." + a.responseText);
                                }
                            });
                        }
                    },
                    error: function (a, b, c) {
                        alert("2." + a.responseText);
                    }
                });
            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
}


function ValidateForm() {
    var text = "";
    var opt = "";
    var SMSCode = $('#txtSMSCode');
    var LoginID = $('#txtUserID');
    var Password = $('#txtPassword');
    var ConfirmPassword = $('#txtConfirm');
    var Exempted = $('#ddlExempted');
    //Program Details
    var CourseType = $('#ddlCourseType');
    var Research = $('#ddlResearch');
    var Discipline = $('#ddlDiscipline');
    var Specialization = $('#ddlSpecialization');

    // Basic Information 

    var FirstName = $("#FirstName");
    var FatherName = $("#FatherName");
    var MotherName = $("#MotherName");
    var MobileNo = $("#MobileNo");
    var Mobile = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Category = $('#Category').val();
    var Religion = $("#religion").val();
    var Nationality = $("#Nationality");
    var Gender = $("#ddlGender option:selected").text();
    var Tongue = $("#MotherTongue").val();
    var BloodGroup = $('#txtBloodGroup');
    var AnnualIncome = $('#txtAnnualIncome');

    //Permanent  address

    var AddressLine1 = $("#PAddressLine1");
    var AddressLine2 = $("#PAddressLine2");
    var RoadStreetName = $("#PRoadStreetName");
    var LandMark = $("#PLandMark");
    var Locality = $("#PLocality");
    var State = $("#PddlState option:selected").text();
    var District = $("#PddlDistrict option:selected").text();
    var Taluka = $("#PddlTaluka option:selected").text();
    var Village = $("#PddlVillage option:selected").text();
    var Pincode = $("#PPinCode");

    //Present  address

    var PreAddressLine1 = $("#CAddressLine1");
    var PreAddressLine2 = $("#CAddressLine2");
    var PreRoadStreetName = $("#CRoadStreetName");
    var PreLandMark = $("#CLandMark");
    var PreLocality = $("#CLocality");
    var PreState = $("#CddlState option:selected").text();
    var PreDistrict = $("#CddlDistrict option:selected").text();
    var PreTaluka = $("#CddlTaluka option:selected").text();
    var PreVillage = $("#CddlVillage option:selected").text();
    var PrePincode = $("#CPinCode");

    //Education
    var Inst12 =$('#txtInst12');
    var Board12 = $('#txtBoard12');
    var Subject12 = $('#txtSubject12');
    var Specialization12 = $('#txtSpecialization12');
    var PassYear12 = $('#txtPassYear12');
    var Percentage12 = $('#txtPercentage12');
    var InstG = $('#txtInstG');
    var BoardG =$('#txtBoardG');
    var SubjectG =$('#txtSubjectG');
    var SpecializationG  =$('#txtSpecializationG');
    var PassYearG =$('#txtPassYearG');
    var PercentageG =$('#txtPercentageG');
    
    var InstPG = $('#txtInstPG');
    var BoardPG = $('#txtBoardPG');
    var SubjectPG = $('#txtSubjectPG');
    var SpecializationPG = $('#txtSpecializationPG');
    var PassYearPG = $('#txtPassYearPG');
    var PercentagePG = $('#txtPercentagePG');

    //
    var No = $('#txtNo');
    var Exam = $('#txtExam');
    var Disc = $('#txtDisc');
    var Year = $('#txtYear');
    var Result = $('#txtResult');

    var No1 = $('#txtNo1');
    var Exam1 = $('#txtExam1');
    var Disc1 = $('#txtDisc1');
    var Year1 = $('#txtYear1');
    var Result1 = $('#txtResult1');

    var No2 = $('#txtNo2');
    var Exam2 = $('#txtExam2');
    var Disc2 = $('#txtDisc2');
    var Year2 = $('#txtYear2');
    var Result2 = $('#txtResult2');

    var No3 = $('#txtNo3');
    var Exam3 = $('#txtExam3');
    var Disc3 = $('#txtDisc3');
    var Year3 = $('#txtYear3');
    var Result3 = $('#txtResult3');

    var Sl = $('#txtSl');
    var From = $('#txtFrom');
    var To = $('#txtTo');
    var Employeer = $('#txtEmployeer');
    var Post = $('#txtPost');
    var Appt = $('#txtAppt');
    var List = $('#txtList');

    var Sl1 = $('#txtSl1');
    var From1 = $('#txtFrom1');
    var To1 = $('#txtTo1');
    var Employeer1 = $('#txtEmployeer1');
    var Post1 = $('#txtPost1');
    var Appt1 = $('#txtAppt1');
    var List1 = $('#txtList1');

    var Sl2 = $('#txtSl2');
    var From2 = $('#txtFrom2');
    var To2 = $('#txtTo2');
    var Employeer2 = $('#txtEmployeer2');
    var Post2 = $('#txtPost2');
    var Appt2 = $('#txtAppt2');
    var List2 = $('#txtList2');

    var Sl3 = $('#txtSl3');
    var From3 = $('#txtFrom3');
    var To3 = $('#txtTo3');
    var Employeer3 = $('#txtEmployeer3');
    var Post3 = $('#txtPost3');
    var Appt3 = $('#txtAppt3');
    var List3 = $('#txtList3');

    var Published = $('#txtPublished');        
    var PublishedDetail = $('#txtPublishedDetail');
    var Presented = $('#txtPresented');
    var PresentedDetail = $('#txtPresentedDetail');



    if (($("#txtMobile").val() == "" || $("#txtMobile").val() == null)) {
        text += "<BR>" + " \u002A" + " Please Enter Applicant Mobile Number."
        $("#txtMobile").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtMobile").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtMobile").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMobile").css({ "background-color": "#ffffff" });
    }


    if (Mobile.val() == '') {
        text += "<br /> -Please verify your Mobile No. ";
        Mobile.attr('style', 'border:1px solid #d03100 !important;');
        Mobile.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Mobile.attr('style', '1px solid #cdcdcd !important;');
        Mobile.css({ "background-color": "#ffffff" });
    }

    if (SMSCode.val() == '') {
        text += "<br /> -Please enter 6 Digit SMS Code. ";
        SMSCode.attr('style', 'border:1px solid #d03100 !important;');
        SMSCode.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        SMSCode.attr('style', '1px solid #cdcdcd !important;');
        SMSCode.css({ "background-color": "#ffffff" });
    }

    if (ProfileStatus != 1 && $('#hdnLoginID').val() != "") {
        if (LoginID.val() == '') {
            text += "<br /> -Login ID is Blank. ";
            LoginID.attr('style', 'border:1px solid #d03100 !important;');
            LoginID.css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            LoginID.attr('style', '1px solid #cdcdcd !important;');
            LoginID.css({ "background-color": "#ffffff" });
        }

        if (Password.val() == '') {
            text += "<br /> -Please enter Password. ";
            Password.attr('style', 'border:1px solid #d03100 !important;');
            Password.css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            Password.attr('style', '1px solid #cdcdcd !important;');
            Password.css({ "background-color": "#ffffff" });
        }

        if (ConfirmPassword.val() == '') {
            text += "<br /> -Please confirm your entered Password. ";
            ConfirmPassword.attr('style', 'border:1px solid #d03100 !important;');
            ConfirmPassword.css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            ConfirmPassword.attr('style', '1px solid #cdcdcd !important;');
            ConfirmPassword.css({ "background-color": "#ffffff" });
        }
    }
    debugger;
    var Exemption = $("input[name='Exemption']:checked").val();

    if (Exemption == null || Exemption == "undefined") {
        text += "<BR>" + " \u002A" + " Please select Want to get Exempted from Entrance?.";
        $('#lblEntrance').attr('style', 'color:red !important;');
        $('#lblEntrance').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#lblEntrance').attr('style', 'color:#000000 !important;');
        $('#lblEntrance').css({ "color": "#000000 " });
    }
    if (Exemption == 'Yes' && Exempted.val() == '0')
    {        
        text += "<BR>" + " \u002A" + " Please select Exemption Type."
        Exempted.attr('style', 'border:1px solid #d03100 !important;');
        Exempted.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Exempted.attr('style', 'border:1px solid #cdcdcd !important;');
        Exempted.css({ "background-color": "#ffffff" });
    }
    

    if ((CourseType.val() == null) || (CourseType.val() == "0" )|| (CourseType.val() == "")) {
        text += "<BR>" + " \u002A" + " Please Course Type."
        CourseType.attr('style', 'border:1px solid #d03100 !important;');
        CourseType.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        CourseType.attr('style', 'border:1px solid #cdcdcd !important;');
        CourseType.css({ "background-color": "#ffffff" });
    }
    /* removed from 2022
    if ((Research.val() == null) || (Research.val() == "0") || (Research.val() == "")) {
        text += "<BR>" + " \u002A" + " Please select Research Center."
        Research.attr('style', 'border:1px solid #d03100 !important;');
        Research.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Research.attr('style', 'border:1px solid #cdcdcd !important;');
        Research.css({ "background-color": "#ffffff" });
    }
    */
    if ((Discipline.val() == null) || (Discipline.val() == "0") || (Discipline.val() == "")) {
        text += "<BR>" + " \u002A" + " Please select Discipline."
        Discipline.attr('style', 'border:1px solid #d03100 !important;');
        Discipline.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Discipline.attr('style', 'border:1px solid #cdcdcd !important;');
        Discipline.css({ "background-color": "#ffffff" });
    }

    if ((Specialization.val() == null) || (Specialization.val() == "0") || (Specialization.val() == "")) {
        text += "<BR>" + " \u002A" + " Please select Specialization."
        Specialization.attr('style', 'border:1px solid #d03100 !important;');
        Specialization.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Specialization.attr('style', 'border:1px solid #cdcdcd !important;');
        Specialization.css({ "background-color": "#ffffff" });
    }
    
    if (EL("myImg").src.indexOf("photo.png") != -1) {
        text += "<BR>" + " \u002A" + " Please upload Applicant Photograph.";
        $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
        $('#myImg').css({ "background-color": "#fff2ee" });
        $('#myImg').css({ "height": "220px" });
        opt = 1;
    } else {
        $('#myImg').attr('style', 'border:0 !important;');
        $('#myImg').css({ "background-color": "" });
        $('#myImg').css({ "height": "220px" });
    }

    if (EL("mySign").src.indexOf("signature.png") != -1) {
        text += "<BR>" + " \u002A" + " Please upload Applicant Signature.";
        $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
        $('#mySign').css({ "background-color": "#fff2ee" });
        $('#mySign').css({ "height": "130px" });
        opt = 1;
    } else {
        $('#mySign').attr('style', '');
        $('#mySign').css({ "background-color": "" });
        $('#mySign').css({ "height": "130px" });
    }

    if (FirstName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Full Name. ";
        FirstName.attr('style', 'border:1px solid #d03100 !important;');
        FirstName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FirstName.attr('style', '1px solid #cdcdcd !important;');
        FirstName.css({ "background-color": "#ffffff" });
    }

    if (MotherName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mother's Name. ";
        MotherName.attr('style', 'border:1px solid #d03100 !important;');
        MotherName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        MotherName.attr('style', 'border:1px solid #cdcdcd !important;');
        MotherName.css({ "background-color": "#ffffff" });
    }

    if (FatherName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Father's Name. ";
        FatherName.attr('style', 'border:1px solid #d03100 !important;');
        FatherName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FatherName.attr('style', 'border:1px solid #cdcdcd !important;');
        FatherName.css({ "background-color": "#ffffff" });
    }

    if (DOB.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
        DOB.attr('style', 'border:1px solid #d03100 !important;');
        DOB.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }

    if ((Gender == '' || Gender == '-Select-' || Gender == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Gender. ";
        $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlGender").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlGender").css({ "background-color": "#ffffff" });
    }

    if ((Religion == '' || Religion == '-Select-' || Religion == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Religion. ";
        $("#religion").attr('style', 'border:1px solid #d03100 !important;');
        $("#religion").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#religion").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#religion").css({ "background-color": "#ffffff" });
    }

    if (Category == '-Select-' || Category == "0" || Category == "") {
        text += "<BR>" + " \u002A" + " Please Select Your Category. ";
        $("#Category").attr('style', 'border:1px solid #d03100 !important;');
        $("#Category").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#Category").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#Category").css({ "background-color": "#ffffff" });
    }

    
    if (Nationality.val() == '-Select-' || Nationality.val() == "0" || Nationality.val() == "") {
        text += "<BR>" + " \u002A" + " Please Select Your Nationality. ";
        $("#Nationality").attr('style', 'border:1px solid #d03100 !important;');
        $("#Nationality").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#Nationality").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#Nationality").css({ "background-color": "#ffffff" });
    }


    if (MobileNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        MobileNo.css({ "background-color": "#ffffff" });
    }

    if (EmailID.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Email ID. ";
        EmailID.attr('style', 'border:1px solid #d03100 !important;');
        EmailID.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
        EmailID.css({ "background-color": "#ffffff" });
    }

    if (AddressLine1 != null && AddressLine1.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Care of Address in Permanent Address. ";
        AddressLine1.attr('style', 'border:1px solid #d03100 !important;');
        AddressLine1.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
        AddressLine1.css({ "background-color": "#ffffff" });
    }

    /*
    if (RoadStreetName != null && RoadStreetName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Road /Street Name in Present Address. ";
        RoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        RoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        RoadStreetName.css({ "background-color": "#ffffff" });
    }
    */

    if (Locality != null && Locality.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Locality in Present Address. ";
        Locality.attr('style', 'border:1px solid #d03100 !important;');
        Locality.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Locality.attr('style', 'border:1px solid #cdcdcd !important;');
        Locality.css({ "background-color": "#ffffff" });
    }

    if ($("#HFUIDData").val() == "") {// 2016-11-08 Logic altered to skip validating these details when user has fetched the details from Aadhaar.
        if (State != null && (State == '' || State == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select State in Permanent Address.";
            $('#PddlState').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlState').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlState').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlState').css({ "background-color": "#ffffff" });
        }

        if (District != null && (District == '' || District == '-Select-' || District == 'Select District')) {
            text += "<BR>" + " \u002A" + " Please select District in Permanent Address.";
            $('#PddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlDistrict').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlDistrict').css({ "background-color": "#ffffff" });
        }
    }

    if (Pincode != null && Pincode.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Pincode in Permanent Address.";
        $('#PPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#PPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PPinCode').css({ "background-color": "#ffffff" });
    }


    if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Care of Address in Present Address. ";
        PreAddressLine1.attr('style', 'border:1px solid #d03100 !important;');
        PreAddressLine1.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreAddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
        PreAddressLine1.css({ "background-color": "#ffffff" });
    }
    /*
    if (PreRoadStreetName != null && PreRoadStreetName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Care of Address in Present Address. ";
        PreRoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        PreRoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreRoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        PreRoadStreetName.css({ "background-color": "#ffffff" });
    }
    */
    if (PreLocality != null && PreLocality.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Locality in Present Address. ";
        PreLocality.attr('style', 'border:1px solid #d03100 !important;');
        PreLocality.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreLocality.attr('style', 'border:1px solid #cdcdcd !important;');
        PreLocality.css({ "background-color": "#ffffff" });
    }
    if (PreState != null && (PreState == '' || PreState == '-Select-')) {
        text += "<BR>" + " \u002A" + " Please select State in Present Address.";
        $('#CddlState').attr('style', 'border:1px solid #d03100 !important;');
        $('#CddlState').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CddlState').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CddlState').css({ "background-color": "#ffffff" });
    }

    if (PreDistrict != null && (PreDistrict == '' || PreDistrict == '-Select-' || PreDistrict == 'Select District')) {
        text += "<BR>" + " \u002A" + " Please select District in Present Address.";
        $('#CddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
        $('#CddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CddlDistrict').css({ "background-color": "#ffffff" });
    }

    if (PrePincode != null && PrePincode.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Pincode in Present Address.";
        $('#CPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#CPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CPinCode').css({ "background-color": "#ffffff" });
    }


    var Reservation = $("input[name='Reserved']:checked").val();

    if (Reservation == null || Reservation == "undefined") {
        text += "<BR>" + " \u002A" + " Please select Are you Physically Challanged Person?";
        $('#lblreservedseat').attr('style', 'color:red !important;');
        $('#lblreservedseat').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#lblreservedseat').attr('style', 'color:#000000 !important;');
        $('#lblreservedseat').css({ "color": "#000000 " });
    }

  
    if (Inst12.val() != null && Inst12.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Name of the Institute/College of Higher Secondary Examination +2.";
        Inst12.attr('style', 'border:1px solid #d03100 !important;');
        Inst12.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Inst12.attr('style', 'border:1px solid #cdcdcd !important;');
        Inst12.css({ "background-color": "#ffffff" });
    }
    
    if (Board12.val() != null && Board12.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Name of the Name of the Board/ University of Higher Secondary Examination +2.";
        Board12.attr('style', 'border:1px solid #d03100 !important;');
        Board12.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Board12.attr('style', 'border:1px solid #cdcdcd !important;');
        Board12.css({ "background-color": "#ffffff" });
    }

    if (PassYear12.val() != null && PassYear12.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Passing Year of Higher Secondary Examination +2.";
        PassYear12.attr('style', 'border:1px solid #d03100 !important;');
        PassYear12.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PassYear12.attr('style', 'border:1px solid #cdcdcd !important;');
        PassYear12.css({ "background-color": "#ffffff" });
    }

    if (Percentage12.val() != null && Percentage12.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Percentage Secured of Higher Secondary Examination +2.";
        Percentage12.attr('style', 'border:1px solid #d03100 !important;');
        Percentage12.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Percentage12.attr('style', 'border:1px solid #cdcdcd !important;');
        Percentage12.css({ "background-color": "#ffffff" });
    }
    
    if (InstG.val() != null && InstG.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Name of the Institute/College of Graduation Examination or +3 Equivalent.";
        InstG.attr('style', 'border:1px solid #d03100 !important;');
        InstG.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        InstG.attr('style', 'border:1px solid #cdcdcd !important;');
        InstG.css({ "background-color": "#ffffff" });
    }

    if (BoardG.val() != null && BoardG.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Name of the Name of the Board/ University of Graduation Examination or +3 Equivalent.";
        BoardG.attr('style', 'border:1px solid #d03100 !important;');
        BoardG.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        BoardG.attr('style', 'border:1px solid #cdcdcd !important;');
        BoardG.css({ "background-color": "#ffffff" });
    }

    if (PassYearG.val() != null && PassYearG.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Passing Year of Graduation Examination or +3 Equivalent.";
        PassYearG.attr('style', 'border:1px solid #d03100 !important;');
        PassYearG.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PassYearG.attr('style', 'border:1px solid #cdcdcd !important;');
        PassYearG.css({ "background-color": "#ffffff" });
    }

    if (PercentageG.val() != null && PercentageG.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Percentage Secured of Graduation Examination or +3 Equivalent.";
        PercentageG.attr('style', 'border:1px solid #d03100 !important;');
        PercentageG.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PercentageG.attr('style', 'border:1px solid #cdcdcd !important;');
        PercentageG.css({ "background-color": "#ffffff" });
    }

    if (InstPG.val() != null && InstPG.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Name of the Institute/College of Master Degree/ Post Graduate / Equivalent.";
        InstPG.attr('style', 'border:1px solid #d03100 !important;');
        InstPG.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        InstPG.attr('style', 'border:1px solid #cdcdcd !important;');
        InstPG.css({ "background-color": "#ffffff" });
    }

    if (BoardPG.val() != null && BoardPG.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Name of the Board of Master Degree/ Post Graduate / Equivalent.";
        BoardPG.attr('style', 'border:1px solid #d03100 !important;');
        BoardPG.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        BoardPG.attr('style', 'border:1px solid #cdcdcd !important;');
        BoardPG.css({ "background-color": "#ffffff" });
    }

    if (PassYearPG.val() != null && PassYearPG.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Passing Year in Master Degree/ Post Graduate / Equivalent.";
        PassYearPG.attr('style', 'border:1px solid #d03100 !important;');
        PassYearPG.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PassYearPG.attr('style', 'border:1px solid #cdcdcd !important;');
        PassYearPG.css({ "background-color": "#ffffff" });
    }

    if (PercentagePG.val() != null && PercentagePG.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Percentage Secured in Master Degree/ Post Graduate / Equivalent.";
        PercentagePG.attr('style', 'border:1px solid #d03100 !important;');
        PercentagePG.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PercentagePG.attr('style', 'border:1px solid #cdcdcd !important;');
        PercentagePG.css({ "background-color": "#ffffff" });
    }

    if (Published.val() != "") {
        debugger;
        if (PublishedDetail.val() == "") {
            text += "<BR>" + " \u002A" + " Please enter Research Paper Published Details.";
            PublishedDetail.attr('style', 'border:1px solid #d03100 !important;');
            PublishedDetail.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            PublishedDetail.attr('style', 'border:1px solid #cdcdcd !important;');
            PublishedDetail.css({ "background-color": "#ffffff" });
        }
    }

    if (PublishedDetail.val() != "") {
        debugger;
        if (Published.val() == "") {
            text += "<BR>" + " \u002A" + " Please enter No. of Research Paper Published.";
            Published.attr('style', 'border:1px solid #d03100 !important;');
            Published.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            Published.attr('style', 'border:1px solid #cdcdcd !important;');
            Published.css({ "background-color": "#ffffff" });
        }
    }

    if (Presented.val() != "") {
        debugger;
        if (PresentedDetail.val() == "") {
            text += "<BR>" + " \u002A" + " Please enter Research Paper Presented Details.";
            PresentedDetail.attr('style', 'border:1px solid #d03100 !important;');
            PresentedDetail.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            PresentedDetail.attr('style', 'border:1px solid #cdcdcd !important;');
            PresentedDetail.css({ "background-color": "#ffffff" });
        }
    }

    if (PresentedDetail.val() != "") {
        debugger;
        if (Presented.val() == "") {
            text += "<BR>" + " \u002A" + " Please enter No. of Research Paper Presented.";
            Presented.attr('style', 'border:1px solid #d03100 !important;');
            Presented.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            Presented.attr('style', 'border:1px solid #cdcdcd !important;');
            Presented.css({ "background-color": "#ffffff" });
        }
    }
    if ($("input[name='OtherCourse']:checked").val() == null) {
        text += "<BR>" + " \u002A" + " Please Select Are you pursuing any course currently?";
        $('#lblOtherCourse').attr('style', 'color:red !important;');
        $('#lblOtherCourse').css({ "color": "red !important;" });
        opt = 1;
    }
    else {
        $('#lblOtherCourse').attr('style', 'color:#000000 !important;');
        $('#lblOtherCourse').css({ "color": "#000000 " });

    }

    if ($("input[name='Punishment']:checked").val() == null) {
        text += "<BR>" + " \u002A" + " Please Select Whether any disciplinary action has been taken against you?";
        $('#lblPunishment').attr('style', 'color:red !important;');
        $('#lblPunishment').css({ "color": "red !important;" });
        opt = 1;
    }
    else {
        $('#lblPunishment').attr('style', 'color:#000000 !important;');
        $('#lblPunishment').css({ "color": "#000000 " });

    }

    var chkdeclaration = 0;
    if ($('#chkDeclaration').is(":checked")) {
        // it is checked
        chkdeclaration = 1;
    }

    if (chkdeclaration == 0) {
        //chkAbility
        text += "<BR>" + " \u002A" + "  Please check Declaration and read it. ";
        opt = 1;
        $('#lblDeclaration').attr('style', 'color:red !important;');
        $('#lblDeclaration').css({ "color": "red" });
    }
    else {
        $('#lblDeclaration').attr('style', 'color:#000000 !important;');
        $('#lblDeclaration').css({ "color": "#000000 " });
    }



    if (opt == "") {
        if (!$("#chkDeclaration").is(":checked")) {
            text += "<BR>" + " \u002A" + " Please check Self Declaration.";
            lblDeclaration
            $('#lblDeclaration').attr('style', 'color:red !important;');
            $('#lblDeclaration').css({ "color": "red" });
            opt = 1;
        }
        else {
            $('#lblDeclaration').attr('style', 'color:#000000 !important;');
            $('#lblDeclaration').css({ "color": "#000000" });
        }

    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}


function ValiateEmail() {
    var EmailID = $("#EmailID");
    if (EmailID.val() != '') {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val())) {
            $("#EmailID").val('');
            EmailID.attr('style', 'border:1px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });
            alertPopup("Email Validation", "<BR>" + " \u002A" + " Please Enter EmailID In Proper Format.")
        }
    }
}



function PinCodeValidation(PinCode) {
    var PinCodeVal = $("[id*=" + PinCode + "]").val();
    if (PinCodeVal.length >= 6) {
        $("[id*=" + PinCode + "]").attr('style', 'border:2px solid green !important;');
        $("[id*=" + PinCode + "]").css({ "background-color": "#ffffff" });
        return true;
    }
    else {
        alertPopup("Pincode Validation", "<BR>" + " \u002A" + " Please Enter 6 Digit Pincode.");
        $("[id*=" + PinCode + "]").val('');
        $("[id*=" + PinCode + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + PinCode + "]").css({ "background-color": "#fff2ee" });
        return false;
    }
}


function MobileValidation(MobileNo) {
    var MobileVal = $("[id*=" + MobileNo + "]").val();
    var text = "";
    var opt = "";

    if (isNaN(MobileVal) || MobileVal.indexOf(" ") != -1) {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Mobile Number.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (MobileVal.length > 10 || MobileVal.length < 10) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Be Atleast 10 Digit.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (!(MobileVal.charAt(0) == "9" || MobileVal.charAt(0) == "8" || MobileVal.charAt(0) == "7")) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 9 ,8 or 7.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("[id*=" + MobileNo + "]").attr('style', 'border:2px solid green !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#ffffff" });
        return true;
    }

    if (opt == "1") {
        alertPopup("Mobile Information.", text);
        $("[id*=" + MobileNo + "]").val("");
        return false;
    }
}


function GetPhDResearchCenter() {
    
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/entrance/PhD/PGPhdApplication.aspx/GetPhDResearchCenter',        
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlResearch").empty();
            $("#ddlResearch").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlResearch").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetDiscipline() {
    debugger;
    var RCCode = $('#ddlResearch').val();
    var IsMPhil = "";
    if ($('#ddlExempted').val() == 'EX002') {
        IsMPhil = 'Yes';
    }
    

    var IsExemption = $("input[name='Exemption']:checked").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/entrance/PhD/PGPhdApplication.aspx/GetPhDDiscipline',
        data: '{"RCCode":"' + RCCode + '","IsMPhil":"' + $('#ddlExempted').val() + '", "IsExemption":"' + IsExemption + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlDiscipline").empty();
            $("#ddlDiscipline").append('<option value = "0">-Select Discipline-</option>');
            $.each(Category, function () {
                $("#ddlDiscipline").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetSpecialization() {
    var DisciplineCode = $('#ddlDiscipline').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/entrance/PhD/PGPhdApplication.aspx/GetPhDSpecialization',
        data: '{"DisciplineCode":"' + DisciplineCode + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlSpecialization").empty();
            $("#ddlSpecialization").append('<option value = "0">-Select Specialization-</option>');
            $.each(Category, function () {
                $("#ddlSpecialization").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetNRIAddress() {
    if ($('#Nationality').val() != "Indian") {
        $('#divNRIAddress').show();
        $('#divPermanent').hide();
        $("#lblCopyAddress").hide();
    } else {
        $('#divNRIAddress').hide();
        $('#divPermanent').show();
        $("#lblCopyAddress").show();
    }
}

function GetOUATDegree() {
    var SelPrograme = $('#ddlCollege').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATDegree',
        data: '{"SelPrograme":"' + SelPrograme + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlDegree").empty();
            $("#ddlDegree").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlDegree").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetOUATSubject() {
    var SubjectId = $('#ddlDegree').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/GetOUATSubject',
        data: '{"SubjectId":"' + SubjectId + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlSubject").empty();
            $("#ddlSubject").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlSubject").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}



function date_by_subtracting_days(date, days) {
    return new Date(
        date.getFullYear(),
        date.getMonth(),
        date.getDate() - days,
        date.getHours(),
        date.getMinutes(),
        date.getSeconds(),
        date.getMilliseconds()
        );
}


Date.isLeapYear = function (year) {
    return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0));
};


Date.getDaysInMonth = function (year, month) {
    return [31, (Date.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
};


Date.prototype.isLeapYear = function () {
    return Date.isLeapYear(this.getFullYear());
};


Date.prototype.getDaysInMonth = function () {
    return Date.getDaysInMonth(this.getFullYear(), this.getMonth());
};


Date.prototype.addMonths = function (value) {
    var n = this.getDate();
    this.setDate(1);
    this.setMonth(this.getMonth() + value);
    this.setDate(Math.min(n, this.getDaysInMonth()));
    return this;
};


function pad(n, width, z) {
    z = z || '0';
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

function SubmitData() {
    //if (!MobileValidation($('#txtMobile').val())) { return false; };
    if (!fnValidateAuthentication()) { return false; }
    if (!fnValidateCredential()) { return false; }
    if (!fnCompairPassword()) { return false; }
    if (!fnValidateMinMark()) { return false; }
    if (!ValidateExemption()) { return false; }    
    if (!fnValidateEntranceTest()) { return false; }
    if (!ValidateForm()) {return false;}
    
    

    $("#btnSubmit").prop('disabled', true);

    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    var t_Message = "";
    var result = false;

    var DOB = $("#DOB");

    var temp = "Gunwant";
    var AppID = "";

    var rtnurl = "";

    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    

    var Physicallyhandicaped = 0;
    if ($('#CheckBoxList1_0').is(":checked")) {
        // it is checked
        Physicallyhandicaped = 1;
    }
    var Ortho = 0
    if ($('#rbtnOrtho').is(":checked")) {
        Ortho = 1;
    }
    var Visual = 0
    if ($('#rbtnVisual').is(":checked")) {
        Visual = 1;
    } var Hearing = 0
    if ($('#rbtnHearing').is(":checked")) {
        Hearing = 1;
    }
    var Exemption = $("input[name='Exemption']:checked").val();
    var Reserved = $("input[name='Reserved']:checked").val();
    var OtherCourse = $("input[name='OtherCourse']:checked").val();
    var Punishment = $("input[name='Punishment']:checked").val();

    var strEducationQual = "";
    strEducationQual = "Higher Secondary Examination +2 (12th Exam)" + "^" + $('#txtInst12').val() + "^" + $('#txtBoard12').val() + "^" + $('#txtSubject12').val() + "^" + $('#txtSpecialization12').val() + "^" + $('#txtPassYear12').val() + "^" + $('#txtPercentage12').val() + "#";
    strEducationQual = strEducationQual + "Graduation Examination or +3 Equivalent" + "^" + $('#txtInstG').val() + "^" + $('#txtBoardG').val() + "^" + $('#txtSubjectG').val() + "^" + $('#txtSpecializationG').val() + "^" + $('#txtPassYearG').val() + "^" + $('#txtPercentageG').val() + "#";
    strEducationQual = strEducationQual + "Master Degree/ Post Graduate / Equivalent" + "^" + $('#txtInstPG').val() + "^" + $('#txtBoardPG').val() + "^" + $('#txtSubjectPG').val() + "^" + $('#txtSpecializationPG').val() + "^" + $('#txtPassYearPG').val() + "^" + $('#txtPercentagePG').val();

    var strWorkExperiance = "";
    strWorkExperiance = $('#txtSl').val()+ "^" + $('#txtFrom').val()+ "^" +$('#txtTo').val()+ "^" +$('#txtEmployeer').val()+ "^" +$('#txtPost').val()+ "^" + $('#txtAppt').val()+ "^" +$('#txtList').val() + "#";
    strWorkExperiance = strWorkExperiance + $('#txtSl1').val()+ "^" + $('#txtFrom1').val()+ "^" +$('#txtTo1').val()+ "^" +$('#txtEmployeer1').val()+ "^" +$('#txtPost1').val()+ "^" + $('#txtAppt1').val()+ "^" +$('#txtList1').val() + "#";
    strWorkExperiance = strWorkExperiance + $('#txtSl2').val()+ "^" + $('#txtFrom2').val()+ "^" +$('#txtTo2').val()+ "^" +$('#txtEmployeer2').val()+ "^" +$('#txtPost2').val()+ "^" + $('#txtAppt2').val()+ "^" +$('#txtList2').val() + "#";
    strWorkExperiance = strWorkExperiance + $('#txtSl3').val()+ "^" + $('#txtFrom3').val()+ "^" +$('#txtTo3').val()+ "^" +$('#txtEmployeer3').val()+ "^" +$('#txtPost3').val()+ "^" + $('#txtAppt3').val()+ "^" +$('#txtList3').val() + "#";

    var strEntranceFellowship = "";
    strEntranceFellowship = $('#txtNo').val() + "^" + $('#txtExam').val() + "^" + $('#txtDisc').val() + "^" + $('#txtYear').val() + "^" + $('#txtResult').val() + "#";
    strEntranceFellowship = strEntranceFellowship + $('#txtNo1').val()+ "^" +$('#txtExam1').val()+ "^" +$('#txtDisc1').val()+ "^" +$('#txtYear1').val()+ "^" +$('#txtResult1').val()+ "#";
    strEntranceFellowship = strEntranceFellowship + $('#txtNo2').val()+ "^" +$('#txtExam2').val()+ "^" +$('#txtDisc2').val()+ "^" +$('#txtYear2').val()+ "^" +$('#txtResult2').val()+ "#";
    strEntranceFellowship = strEntranceFellowship + $('#txtNo3').val()+ "^" +$('#txtExam3').val()+ "^" +$('#txtDisc3').val()+ "^" +$('#txtYear3').val()+ "^" +$('#txtResult3').val()+ "#";

    var datavar = {

        'ServiceID': svcid,
        'Password': $('#txtConfirm').val(),
        'MobileNo':$('#MobileNo').val(),
        'EmailId':$('#EmailID').val(),
        'IsEntranceExempted': Exemption,
        'CategoryofExemption': $('#ddlExempted').val(),
        'CourseType': $('#ddlCourseType').val(),
        'ResearchCenter': $('#ddlResearch').val(),
        'Discipline': $('#ddlDiscipline').val(),
        'Specialization': $('#ddlSpecialization').val(),
        'ApplicantName': $('#FirstName').val(),
        'DateofBirth': DOBConverted,
        'FatherName': $('#FatherName').val(),
        'MotherName': $('#MotherName').val(),
        'Gender': $('#ddlGender').val(),
        'Category': $('#Category').val(),
        'Nationality': $('#Nationality').val(),
        'PhysicallyChallenged': Reserved,
        'IsOrtho':Ortho,
        'IsVisual':Visual,
        'IsHearing': Hearing,
        
        'ParmanentAddressline1': $('#PAddressLine1').val(),
        'ParmanentAddressline2': $('#PAddressLine2').val(),
        'ParRoadstreet': $('#PRoadStreetName').val(),
        'ParLandmark': $('#PLandMark').val(),
        'ParLocality': $('#PLocality').val(),
        'ParState': $('#PddlState').val(),
        'ParDistrict': $('#PddlDistrict').val(),
        'ParBlock': $('#PddlTaluka').val(),
        'ParVillage': $('#PddlVillage').val(),
        'ParPincode': $('#PPinCode').val(),

        'PresentAddressline1': $('#CAddressLine1').val(),
        'PresentAddressline2': $('#CAddressLine2').val(),
        'PreRoadstreet': $('#CRoadStreetName').val(),
        'PreLandmark': $('#CLandMark').val(),
        'PreLocality': $('#CLocality').val(),
        'PreState': $('#CddlState').val(),
        'PreDistrict': $('#CddlDistrict').val(),
        'PreBlock': $('#CddlTaluka').val(),
        'PreVillage': $('#CddlVillage').val(),
        'PrePincode': $('#CPinCode').val(),

        'Signature': $('#HFb64Sign').val(),
        'Photograph': $('#HFb64').val(),

        'NRIAddressline1': $('#NRIAddressline1').val(),
        'NRIAddressline2': $('#NRIAddressline2').val(),
        'NRICountry': $('#NRICountry').val(),
        'NRICityTown': $('#NRICityTown').val(),
        'NRIPincode': $('#NRIPincode').val(),

        'AnyOtherCourse': OtherCourse,
        'CourseDetail': $('#txtCourseDetail').val(),
        'DisciplinaryAction': Punishment,
        'DisciplinaryDetail': $('#txtPunishment').val(),

        'ResearchPublished': $('#txtPublished').val(),
        'PublishedDetail': $('#txtPublishedDetail').val(),
        'ResearchPresented': $('#txtPresented').val(),
        'PresentedDetail': $('#txtPresentedDetail').val(),
        'JSONData': '',

        'EducationQual': strEducationQual,

        'EducationDetailXML':strEducationQual,
        'WorkExperianceXML':strWorkExperiance,
        'EntranceFellowshipXML':strEntranceFellowship,
        
        'Entrance': $('#ddlEntrance').val(),
        'CETYear':  $('#txtCETYear').val(),
        'CETPercentage':  $('#txtCETPercentage').val(),
        'CETValid':  $('#txtCETValid').val(),
        'CETDetail':  $('#txtCETDetail').val(),

        'MPhilFrom':  $('#txtMPhilFrom').val(),
        'MPhilTo': $('#txtMPhilTo').val(),
        'Mode': $('#ddlMode').val(),
        'MPhilCourse':  $('#txtMPhilCourse').val(),
        'MPhilUniv':  $('#txtMPhilUniv').val(),
        'MPhilDetail':  $('#txtMPhilDetail').val(),
        
        'FellowFrom':  $('#txtFellowFrom').val(),
        'FellowTo':  $('#txtFellowTo').val(),
        'FellowCollege':  $('#txtFellowCollege').val(),
        'FellowUniv':  $('#txtFellowUniv').val(),
        'SeniorityNo':  $('#txtSeniorityNo').val(),
        'FellowPost':  $('#txtFellowPost').val(),

        'ResearchFrom':  $('#txtResearchFrom').val(),
        'ResearchTo':  $('#txtResearchTo').val(),
        'Laboratry':  $('#txtLaboratry').val(),
        'ResearchOrg':  $('#txtResearchOrg').val(),
        'ResearchPost':  $('#txtResearchPost').val(),
        'ResearchNature':  $('#txtResearchNature').val(),

        'CourseFrom':  $('#txtCourseFrom').val(),
        'CourseTo':  $('#txtCourseTo').val(),
        'CourseMode':  $('#ddlCourseMode').val(),
        'CourseName':  $('#txtCourseName').val(),
        'CourseCollege':  $('#txtCourseCollege').val(),
        'CourseUniversity':  $('#txtCourseUniversity').val(),
        'CourseRollNo':  $('#txtCourseRollNo').val()
        
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Entrance/PhD/PGPhdApplication.aspx/InsertData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $('#g207').hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {

            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null)
            {
                $('#g207').hide();
                $("#btnSubmit").prop('disabled', false);
                alertPopup("Form Validation Failed", "Error While Saving Application.!!!, <BR> Entered '"+$('#MobileNo').val() +"'has already been used to Submit the Application!!!");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                return;
            }
            else {
                if (result /*&& jqXHRData_IMG_result*/) {
                    $('#g207').hide();
                    $("#btnSubmit").prop('disabled', false);
                    //alertPopup("Addmission Into OUAT", "Application saved successfully. Application  ID : " + obj.AppID + " Please Make Payment against the Application Number.");
                    //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=419&AppID=' + obj.AppID;
                    window.location.href = '/WebApp/Entrance/PhD/PGPhdProcessbar.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID;
                }
                else {
                    $('#g207').hide();
                    $("#btnSubmit").prop('disabled', false);
                    alertPopup("Form Validation Failed", "Unable to save Applicatin, Please refresh the browser and try again");
                }
            }
        });// end of Then function of main Data Insert Function

    return false;
}


function fnReservationQuota() {
    if (CheckBoxList1_0.checked) {
        $('#divPH').show(500);
        $('#txtHandicappedPart').val("");
        $('#txtHandiPercent').val("");

    } else {
        $('#divPH').hide(500);
        $('#txtHandicappedPart').val("");
        $('#txtHandiPercent').val("");
    }
}


//Strong password
function pwdStrength(p1) {
    var lenPwd = p1.value;
    var password = p1.value;

    if (p1.value == "") {
        alertPopup('Form Validation', "Please Enter New Password");
        p1.focus();
        return false;
    }
    if ((lenPwd.length > 8) && password.match(/[a-z]/) && password.match(/[A-Z]/) && password.match(/\d+/) && password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/)) {
        return true;
    }
    else {
        var text = "Password should be minimum of 8 Digit & it should contain combination of Numeric, Special character and Alphabets (Both in Upper and Lower Cases)";
        alertPopup("Please fill following information.", text);
        p1.focus();
        p1.value = "";
        return false;
    }
}

function fnCompairPassword() {
    debugger;
    ProfileStatus = 0;opt = "";text = '';
    $('#hdnLoginID').val($('#txtUserID').val());

    if (ProfileStatus != 1 && $('#hdnLoginID').val() != "") {      
        
        var ConfirmPassword = $("#txtConfirm");
        var Password = $("#txtPassword");
        if (ConfirmPassword.val() != Password.val()) {
            text = 'Password and confirm Password are not same.';
            ConfirmPassword.attr('style', 'border:1px solid #d03100 !important;');
            ConfirmPassword.css({ "background-color": "#fff2ee" });

            Password.attr('style', 'border:1px solid #d03100 !important;');
            Password.css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            ConfirmPassword.attr('style', '1px solid #cdcdcd !important;');
            ConfirmPassword.css({ "background-color": "#ffffff" });

            Password.attr('style', '1px solid #cdcdcd !important;');
            Password.css({ "background-color": "#ffffff" });
            text = "";
            opt=0;
        }

        if (opt == "1") {
            alertPopup("Please fill following information.", text);
            return false;
        }
        return true;
    }
    
    return true;
}


function Declaration(chk) {

    debugger;

    if (chk) {
        if ($('#FirstName').val() == null || $('#FirstName').val() == "") {
            $('#FirstName').attr('style', 'border:1px solid #d03100 !important;');
            $('#FirstName').css({ "background-color": "#fff2ee" });
            $('#FirstName').focus();
            alert("Please enter Name of Applicant.");
            chkDeclaration.checked = false;
            return false;
        }

        if ($('#FatherName').val() == null || $('#FatherName').val() == "") {
            $('#FatherName').attr('style', 'border:1px solid #d03100 !important;');
            $('#FatherName').css({ "background-color": "#fff2ee" });
            $('#FatherName').focus();
            alert("Please enter your Father's Name to continue.");
            chkDeclaration.checked = false;
            return false;
        }

        if ($('#CddlDistrict').val() == 0) {
            alert("Please select Present District to continue.");
            chkPhysical.checked = false;
            return false;
        }
        if ($('#ddlGender').val() != '0') {
            if ($('#ddlGender').val() == "M" || $('#ddlGender').val() == "Male") {
                $('#lblGender').text("Son of ");
                $('#lblTitle').text("Mr.");
            } else if ($('#ddlGender').val() == "F" || $('#ddlGender').val() == "Female") {
                $('#lblGender').text("Daughter of ");
                $('#lblTitle').text("Ms.");
            } else { $('#lblGender').text("Transgender of"); $('#lblTitle').text("Mr./Ms."); }
        }
        else {
            alert("Please, seect Gender");
        }

        var name = $('#FirstName').val();
        var fname = $('#FatherName').val();
        var place = $("#CddlDistrict option:selected").text();//$('#CddlDistrict').val();
        //alert(name);
        $("#lblName").text(name);
        $("#lblApplicant").text(name);
        $("#lblNameAadhaar").text(name);
        $("#lblPhsclFthrName").text(fname);
        //$("#lblPhsclDstName").text(fname);
        $("#cndidteplce").text(place);

        $('#btnSubmit').prop('disabled', false);


        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!

        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        var today = dd + '/' + mm + '/' + yyyy;
        $("#currntdte").text(today);
        $('#divDeclaration').show();
    }
    else {
        $("#lblName").text("");
        $("#lblNameAadhaar").text("");
        $("#lblApplicant").text("");
        $("#lblPhsclFthrName").text("");
        $("#lblPhsclDstName").text("");
        $('#btnSubmit').prop('disabled', true);
        $('#divDeclaration').hide();
    }
}


function fnValidateEntranceTest() {
    text = "";
    opt = 0
    var Entrance = $('#ddlEntrance');
    var CETYear = $('#txtCETYear');
    var CETPercentage = $('#txtCETPercentage');
    var Exemption = $("input[name='Exemption']:checked").val();
    if (Exemption == "Yes") {

        if ($("#ddlExempted").val() == "EX001") {
            if (Entrance.val() == "0") {
                Entrance.focus();
                text += "<BR>" + " \u002A" + " Please select Qualified Exntrance Examination.";
                Entrance.attr('style', 'border:1px solid #d03100 !important;');
                Entrance.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                //if (Entrance.val() == "GPAT" || Entrance.val() == "GPAT")
                //{
                //}
                Entrance.attr('style', 'border:1px solid #cdcdcd !important;');
                Entrance.css({ "background-color": "#ffffff" });
            }

            if (CETYear.val() == null || CETYear.val() == "") {
                CETYear.focus();
                text += "<BR>" + " \u002A" + " Please enter year of Qualified Exntrance Examination.";
                CETYear.val() == "".attr('style', 'border:1px solid #d03100 !important;');
                CETYear.val() == "".css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                CETYear.attr('style', 'border:1px solid #cdcdcd !important;');
                CETYear.css({ "background-color": "#ffffff" });
            }

            if (CETPercentage.val() == null || CETPercentage.val() == "") {
                CETPercentage.focus();
                text += "<BR>" + " \u002A" + " Please enter Percentage secured in Qualified Exntrance Examination.";
                CETPercentage.attr('style', 'border:1px solid #d03100 !important;');
                CETPercentage.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                CETPercentage.attr('style', 'border:1px solid #cdcdcd !important;');
                CETPercentage.css({ "background-color": "#ffffff" });
            }
                   

            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        } 
    }
    else {
        $("#divENT").hide();
        $("#divMPhil").hide();
        $("#divFellowship").hide();
        $("#divResearch").hide();
    }
    return true;
}


function fnValidateYear(id) {
    var year = id.value
    if (year.length != 4 || year > '2022') {
        alert('Invalid year');
        return;
    }
    if ($('#ddlEntrance').val() == "GATE") {
        if ((id.id == "txtCETYear") && (2022 - year > 2)) {
            $('#txtCETYear').val('');
            $('#txtCETYear').focus();
            $('#txtCETYear').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtCETYear').css({ "background-color": "#fff2ee" });
            alert('Qualifying Exam Year should be grater then 2019 (not more then 2 years from current year');
            return;
        }
        else {
            $('#txtCETYear').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtCETYear').css({ "background-color": "#ffffff" });
        }
        
    }

    if ($('#ddlExempted').val() == "EX002") {
        if (($("#txtMPhilFrom").val() != null && $("#txtMPhilFrom").val() != "")
            && ($("#txtMPhilTo").val() != null && $("#txtMPhilTo").val() != "")) {
            if (($("#txtMPhilFrom").val() > $("#txtMPhilTo").val())) {
                id.value = "";
                id.focus;
                $("#txtMPhilTo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtMPhilTo").css({ "background-color": "#fff2ee" });
                alert('MPhil Course Duration From Year is greater then To Year');
                return;
            }
            //else if (($("#txtMPhilTo").val() - $("#txtMPhilFrom").val()) < 2) {
            //    id.value = "";
            //    id.focus = true;
            //    $("#txtMPhilTo").attr('style', 'border:1px solid #d03100 !important;');
            //    $("#txtMPhilTo").css({ "background-color": "#fff2ee" });
            //    alert('MPhil Course Duration must be of 2 years');
            //    return;
            //}
            else {
                $("#txtMPhilTo").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#txtMPhilTo").css({ "background-color": "#ffffff" });
            }
        }
    }

    if ($('#ddlExempted').val() == "EX003") {
        if (($("#txtFellowFrom").val() != null && $("#txtFellowFrom").val() != "")
            && ($("#txtFellowTo").val() != null && $("#txtFellowTo").val() != "")) {
            if (($("#txtFellowFrom").val() > $("#txtFellowTo").val())) {
                $("#txtFellowTo").value = "";
                $("#txtFellowTo").focus();
                $("#txtFellowTo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtFellowTo").css({ "background-color": "#fff2ee" });
                alert('Fellowship Duration From Year is greater then To Year');
                return;
            } else if (($("#txtFellowTo").val() - $("#txtFellowFrom").val()) < 2) {
                $("#txtFellowTo").value = "";
                $("#txtFellowTo").focus = true;
                $("#txtFellowTo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtFellowTo").css({ "background-color": "#fff2ee" });
                alert('Fellowship Duration must be of 2 years');
                return;
            }
            else {
                $("#txtFellowTo").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#txtFellowTo").css({ "background-color": "#ffffff" });
            }
        }
    }

    if ($('#ddlExempted').val() == "EX004") {
        if (($("#txtResearchFrom").val() != null && $("#txtResearchFrom").val() != "")
            && ($("#txtResearchTo").val() != null && $("#txtResearchTo").val() != "")) {
            if (($("#txtResearchFrom").val() > $("#txtResearchTo").val())) {
                id.value = "";
                id.focus;
                $("#txtResearchTo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtResearchTo").css({ "background-color": "#fff2ee" });
                alert('Research Duration From Year is greater then To Year');
                return;
            } else if (($("#txtResearchTo").val() - $("#txtResearchFrom").val()) < 4) {
                id.value = "";
                id.focus = true;
                $("#txtResearchTo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtResearchTo").css({ "background-color": "#fff2ee" });
                alert('Research Duration must be of 3 years');
                return;
            }
            else {
                $("#txtResearchTo").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#txtResearchTo").css({ "background-color": "#ffffff" });
            }
        }
    }
    
    if ($('#ddlExempted').val() == "EX005") {
        if (($("#txtFellowFrom").val() != null && $("#txtFellowFrom").val() != "")
            && ($("#txtFellowTo").val() != null && $("#txtFellowTo").val() != "")) {
            if (($("#txtFellowFrom").val() > $("#txtFellowTo").val())) {
                $("#txtFellowTo").value = "";
                $("#txtFellowTo").focus();
                $("#txtFellowTo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtFellowTo").css({ "background-color": "#fff2ee" });
                alert('Fellowship Duration From Year is greater then To Year');
                return;
            } else if (($("#txtFellowTo").val() - $("#txtFellowFrom").val()) < 2) {
                $("#txtFellowTo").value = "";
                $("#txtFellowTo").focus = true;
                $("#txtFellowTo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtFellowTo").css({ "background-color": "#fff2ee" });
                alert('Fellowship Duration must be of 2 years');
                return;
            }
            else {
                $("#txtFellowTo").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#txtFellowTo").css({ "background-color": "#ffffff" });
            }
        }
    }
}

function fnValidateEntrance() {
    $('#txtCETYear').val('');
}

function ValidateMPhilMode() {
    if ($('#ddlMode').val() != "R")
        $('#lblMphilMode').show(500);
    else
        $('#lblMphilMode').hide(500);
}


function ValidateExemption() {
    debugger;
    text = "";
    opt = 0
    var Exemption = $("input[name='Exemption']:checked").val();
    if (Exemption == "Yes") {
        if ($('#ddlExempted').val() == 'EX001') {

            var Entrance = $('#ddlEntrance');
            var CETYear = $('#txtCETYear');
            var CETPercentage = $('#txtCETPercentage');
            var CETValid = $('#txtCETValid');
            var CETDetail = $('#txtCETDetail');

            if (Entrance.val() != null && (Entrance.val() == '0' || Entrance.val() == '' || Entrance.val() == '-Select-')) {
                text += "<BR>" + " \u002A" + " Please select Entrance Name.";
                Entrance.attr('style', 'border:1px solid #d03100 !important;');
                Entrance.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                Entrance.attr('style', 'border:1px solid #cdcdcd !important;');
                Entrance.css({ "background-color": "#ffffff" });
            }

            if ((CETYear.val() == "" || CETYear.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Exam Year."
                CETYear.attr('style', 'border:1px solid #d03100 !important;');
                CETYear.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                CETYear.attr('style', 'border:1px solid #cdcdcd !important;');
                CETYear.css({ "background-color": "#ffffff" });
            }

            if ((CETPercentage.val() == "" || CETPercentage.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Percentage Secured."
                CETPercentage.attr('style', 'border:1px solid #d03100 !important;');
                CETPercentage.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                CETPercentage.attr('style', 'border:1px solid #cdcdcd !important;');
                CETPercentage.css({ "background-color": "#ffffff" });
            }
            if (Entrance.val() == "GATE") {
                if ((CETValid.val() == "" || CETValid.val() == null)) {
                    text += "<BR>" + " \u002A" + " Please Enter Result Valid Till."
                    CETValid.attr('style', 'border:1px solid #d03100 !important;');
                    CETValid.css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    CETValid.attr('style', 'border:1px solid #cdcdcd !important;');
                    CETValid.css({ "background-color": "#ffffff" });
                }
            }
            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }

        if ($('#ddlExempted').val() == 'EX002') {

            var MPhilFrom = $('#txtMPhilFrom');
            var MPhilTo = $('#txtMPhilTo');
            var Mode = $('#ddlMode');
            var MPhilCourse = $('#txtMPhilCourse');
            var MPhilUniv = $('#txtMPhilUniv');
            var MPhilDetail = $('#txtMPhilDetail');


            if ((MPhilFrom.val() == "" || MPhilFrom.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter From duration of MPhil."
                MPhilFrom.attr('style', 'border:1px solid #d03100 !important;');
                MPhilFrom.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                MPhilFrom.attr('style', 'border:1px solid #cdcdcd !important;');
                MPhilFrom.css({ "background-color": "#ffffff" });
            }

            if ((MPhilTo.val() == "" || MPhilTo.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter To duration of MPhil."
                MPhilTo.attr('style', 'border:1px solid #d03100 !important;');
                MPhilTo.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                MPhilTo.attr('style', 'border:1px solid #cdcdcd !important;');
                MPhilTo.css({ "background-color": "#ffffff" });
            }

            if (Mode.val() != null && (Mode.val() == '0' || Mode.val() == '' || Mode.val() == '-Select-')) {
                text += "<BR>" + " \u002A" + " Please select Mode of MPhil done.";
                Mode.attr('style', 'border:1px solid #d03100 !important;');
                Mode.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                Mode.attr('style', 'border:1px solid #cdcdcd !important;');
                Mode.css({ "background-color": "#ffffff" });
            }

            if ((MPhilCourse.val() == "" || MPhilCourse.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter MPhil Course."
                MPhilCourse.attr('style', 'border:1px solid #d03100 !important;');
                MPhilCourse.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                MPhilCourse.attr('style', 'border:1px solid #cdcdcd !important;');
                MPhilCourse.css({ "background-color": "#ffffff" });
            }

            if ((MPhilUniv.val() == "" || MPhilUniv.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Name of Univerasity where MPhil Course was completed."
                MPhilUniv.attr('style', 'border:1px solid #d03100 !important;');
                MPhilUniv.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                MPhilUniv.attr('style', 'border:1px solid #cdcdcd !important;');
                MPhilUniv.css({ "background-color": "#ffffff" });
            }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }

        if ($('#ddlExempted').val() == 'EX003') {

            var FellowFrom = $('#txtFellowFrom');
            var FellowTo = $('#txtFellowTo');
            var FellowCollege = $('#txtFellowCollege');
            var FellowUniv = $('#txtFellowUniv');
            var SerYear = $('#ddlSerYear');
            var SeniorityNo = $('#txtSeniorityNo');
            var FellowPost = $('#txtFellowPost');


            if ((FellowFrom.val() == "" || FellowFrom.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter From duration of Fellowship."
                FellowFrom.attr('style', 'border:1px solid #d03100 !important;');
                FellowFrom.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowFrom.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowFrom.css({ "background-color": "#ffffff" });
            }

            if ((FellowTo.val() == "" || FellowTo.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter To duration of Fellowship."
                FellowTo.attr('style', 'border:1px solid #d03100 !important;');
                FellowTo.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowTo.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowTo.css({ "background-color": "#ffffff" });
            }


            if ((FellowCollege.val() == "" || FellowCollege.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter College from where Fellowship was done."
                FellowCollege.attr('style', 'border:1px solid #d03100 !important;');
                FellowCollege.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowCollege.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowCollege.css({ "background-color": "#ffffff" });
            }

            if ((FellowUniv.val() == "" || FellowUniv.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Name of Univerasity where Fellowship was done."
                FellowUniv.attr('style', 'border:1px solid #d03100 !important;');
                FellowUniv.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowUniv.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowUniv.css({ "background-color": "#ffffff" });
            }
            id = "ddlSerYear"

            if (SerYear.val() != null && (SerYear.val() == '0' || SerYear.val() == '' || SerYear.val() == '-Select-')) {
                text += "<BR>" + " \u002A" + " Please select Year of Seniority No.";
                SerYear.attr('style', 'border:1px solid #d03100 !important;');
                SerYear.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                SerYear.attr('style', 'border:1px solid #cdcdcd !important;');
                SerYear.css({ "background-color": "#ffffff" });
            }
           
            if ((FellowPost.val() == "" || FellowPost.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Name of Post."
                FellowPost.attr('style', 'border:1px solid #d03100 !important;');
                FellowPost.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowPost.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowPost.css({ "background-color": "#ffffff" });
            }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;

        }

        if ($('#ddlExempted').val() == 'EX004') {

            var ResearchFrom = $('#txtResearchFrom');
            var ResearchTo = $('#txtResearchTo');
            var Laboratry = $('#txtLaboratry');
            var ResearchOrg = $('#txtResearchOrg');
            var ResearchPost = $('#txtResearchPost');
            var ResearchNature = $('#txtResearchNature');


            if ((ResearchFrom.val() == "" || ResearchFrom.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter From duration of Research."
                ResearchFrom.attr('style', 'border:1px solid #d03100 !important;');
                ResearchFrom.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                ResearchFrom.attr('style', 'border:1px solid #cdcdcd !important;');
                ResearchFrom.css({ "background-color": "#ffffff" });
            }

            if ((ResearchTo.val() == "" || ResearchTo.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter To duration of Research."
                ResearchTo.attr('style', 'border:1px solid #d03100 !important;');
                ResearchTo.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                ResearchTo.attr('style', 'border:1px solid #cdcdcd !important;');
                ResearchTo.css({ "background-color": "#ffffff" });
            }


            if ((Laboratry.val() == "" || Laboratry.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Name of Laboratry."
                Laboratry.attr('style', 'border:1px solid #d03100 !important;');
                Laboratry.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                Laboratry.attr('style', 'border:1px solid #cdcdcd !important;');
                Laboratry.css({ "background-color": "#ffffff" });
            }

            if ((ResearchOrg.val() == "" || ResearchOrg.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Name of Organisation."
                ResearchOrg.attr('style', 'border:1px solid #d03100 !important;');
                ResearchOrg.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                ResearchOrg.attr('style', 'border:1px solid #cdcdcd !important;');
                ResearchOrg.css({ "background-color": "#ffffff" });
            }

            if ((ResearchPost.val() == "" || ResearchPost.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Name of Post."
                ResearchPost.attr('style', 'border:1px solid #d03100 !important;');
                ResearchPost.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                ResearchPost.attr('style', 'border:1px solid #cdcdcd !important;');
                ResearchPost.css({ "background-color": "#ffffff" });
            }

            if ((ResearchNature.val() == "" || ResearchNature.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Nature of Research."
                ResearchNature.attr('style', 'border:1px solid #d03100 !important;');
                ResearchNature.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                ResearchNature.attr('style', 'border:1px solid #cdcdcd !important;');
                ResearchNature.css({ "background-color": "#ffffff" });
            }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;

        }

        if ($('#ddlExempted').val() == 'EX005') {

            var FellowFrom = $('#txtFellowFrom');
            var FellowTo = $('#txtFellowTo');
            var FellowCollege = $('#txtFellowCollege');
            var FellowUniv = $('#txtFellowUniv');
            var SerYear = $('#ddlSerYear');
            var SeniorityNo = $('#txtSeniorityNo');
            var FellowPost = $('#txtFellowPost');


            if ((FellowFrom.val() == "" || FellowFrom.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter From duration of Fellowship."
                FellowFrom.attr('style', 'border:1px solid #d03100 !important;');
                FellowFrom.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowFrom.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowFrom.css({ "background-color": "#ffffff" });
            }

            if ((FellowTo.val() == "" || FellowTo.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter To duration of Fellowship."
                FellowTo.attr('style', 'border:1px solid #d03100 !important;');
                FellowTo.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowTo.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowTo.css({ "background-color": "#ffffff" });
            }


            if ((FellowCollege.val() == "" || FellowCollege.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter College from where Fellowship was done."
                FellowCollege.attr('style', 'border:1px solid #d03100 !important;');
                FellowCollege.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowCollege.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowCollege.css({ "background-color": "#ffffff" });
            }

            if ((FellowUniv.val() == "" || FellowUniv.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Name of Univerasity where Fellowship was done."
                FellowUniv.attr('style', 'border:1px solid #d03100 !important;');
                FellowUniv.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowUniv.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowUniv.css({ "background-color": "#ffffff" });
            }
            id = "ddlSerYear"

            if (SerYear.val() != null && (SerYear.val() == '0' || SerYear.val() == '' || SerYear.val() == '-Select-')) {
                text += "<BR>" + " \u002A" + " Please select Year of Seniority No.";
                SerYear.attr('style', 'border:1px solid #d03100 !important;');
                SerYear.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                SerYear.attr('style', 'border:1px solid #cdcdcd !important;');
                SerYear.css({ "background-color": "#ffffff" });
            }

            if ((FellowPost.val() == "" || FellowPost.val() == null)) {
                text += "<BR>" + " \u002A" + " Please Enter Name of Post."
                FellowPost.attr('style', 'border:1px solid #d03100 !important;');
                FellowPost.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                FellowPost.attr('style', 'border:1px solid #cdcdcd !important;');
                FellowPost.css({ "background-color": "#ffffff" });
            }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;

        }
    }
    return true;
        
    
}

function fnValidateMinMark() {
    debugger;
    var text = "";
    var opt = "";
    var Research = $('#ddlResearch');
    var Discipline = $('#ddlDiscipline');
    var Category = $('#Category');
    if ($('#txtPercentagePG').val() != "") {
        //if ((Research.val() == null) || (Research.val() == "0") || (Research.val() == "")) {
        //    alert("Please select Research.");
        //    Research.attr('style', 'border:1px solid #d03100 !important;');
        //    Research.css({ "background-color": "#fff2ee" });
        //    Research.focus();
        //    $('#txtPercentagePG').val('');
        //    return false;
        //} else {
        //    Research.attr('style', 'border:1px solid #cdcdcd !important;');
        //    Research.css({ "background-color": "#ffffff" });
        //}

        if ((Discipline.val() == null) || (Discipline.val() == "0") || (Discipline.val() == "")) {
            alert("Please select Discipline.");
            Discipline.attr('style', 'border:1px solid #d03100 !important;');
            Discipline.css({ "background-color": "#fff2ee" });
            Discipline.focus();
            $('#txtPercentagePG').val('');
            return false;
        } else {
            Discipline.attr('style', 'border:1px solid #cdcdcd !important;');
            Discipline.css({ "background-color": "#ffffff" });
        }

        if (Category.val() == '-Select-' || Category.val() == "0" || Category.val() == "") {
            alert(" Please Select Your Category.");
            $("#Category").attr('style', 'border:1px solid #d03100 !important;');
            $("#Category").css({ "background-color": "#fff2ee" });
            $("#Category").focus();
            $('#txtPercentagePG').val('');
            return false;
        } else {
            $("#Category").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#Category").css({ "background-color": "#ffffff" });
        }

        const mark55arr = ['DC011', 'DC001', 'DC002', 'DC004', 'DC023'];
        
        if (mark55arr.includes(Discipline.val())) {
            if (Category.val() != 'GN') {
                if ($('#txtPercentagePG').val() < '50') {
                    alert('Minimum required percantage for admission into ' + $('#ddlDiscipline :selected').text() + ' is 50% for SC/ST/OBC applicant');
                    $('#txtPercentagePG').val('');
                    $('#txtPercentagePG').focus();
                    return false;
                }

            }
            else {
                if ($('#txtPercentagePG').val() < '55') {
                    alert('Minimum required percantage for admission into ' + $('#ddlDiscipline :selected').text() + ' is 55% for General (Unreserved) applicant');
                    $('#txtPercentagePG').val('');
                    $('#txtPercentagePG').focus();
                    return false;
                }
            }

        }
        else {

            if (Category.val() != 'GN') {
                if ($('#txtPercentagePG').val() < '55') {
                    alert('Minimum required percantage for admission into ' + $('#ddlDiscipline :selected').text() + ' is 55% for SC/ST/OBC applicant');
                    $('#txtPercentagePG').val('');
                    $('#txtPercentagePG').focus();
                    return false;
                }

            }
            else {
                if ($('#txtPercentagePG').val() < '60') {
                    alert('Minimum required percantage for admission into ' + $('#ddlDiscipline :selected').text() + ' is 60% for General (Unreserved) applicant');
                    $('#txtPercentagePG').val('');
                    $('#txtPercentagePG').focus();
                    return false;
                }
            }
        }

        return true;
    }
    return true;
}


function IsNumericDecimal(e) {
    debugger;

    //var regex = new RegExp("/^\d+(\.\d{1,2})?$/");
    //var key = e.keyCode || e.which;
    //key = String.fromCharCode(key);
    //alert(key);
    //if (!regex.test(key)) {
    //    e.returnValue = false;
    //    if (e.preventDefault) {
    //        e.preventDefault();
    //    }
    //}

    if ($("#txtPercentage12").val() > 100) { alert('Invalid Percentage'); $("#txtPercentage12").val(''); }
    if ($("#txtPercentageG").val() > 100) { alert('Invalid Percentage'); $("#txtPercentageG").val(''); }
    if ($("#txtPercentagePG").val() > 100) { alert('Invalid Percentage'); $("#txtPercentagePG").val(''); }

    var regex = new RegExp("[0-9.]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }

}

function fnValidateAuthentication() {
    var Mobile = $('#txtMobile');
    var SMSCode = $('#txtSMSCode');
    var text = "";
    var opt = "";
    if ((Mobile.val() != "" || Mobile.val() != null)) {


        if ((SMSCode.val() == "" || SMSCode.val() == null)) {
            text += "<BR>" + " \u002A" + " Please Enter OTP received on Mobile " + Mobile.val() + "as SMS."
            SMSCode.attr('style', 'border:1px solid #d03100 !important;');
            SMSCode.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            SMSCode.attr('style', 'border:1px solid #cdcdcd !important;');
            SMSCode.css({ "background-color": "#ffffff" });
        }
    }

    if ((Mobile.val() == "" || Mobile.val() == null)) {
        text += "<BR>" + " \u002A" + " Please Enter Mobile to authenticate."
        Mobile.attr('style', 'border:1px solid #d03100 !important;');
        Mobile.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Mobile.attr('style', 'border:1px solid #cdcdcd !important;');
        Mobile.css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;

}

function fnValidateCredential() {

    var UserID = $('#txtUserID');
    var Password = $('#txtPassword');
    var Confirm = $('#txtConfirm');
    var text = "";
    var opt = "";
    


    if ((UserID.val() == "" || UserID.val() == null)) {
        text += "<BR>" + " \u002A" + " Login ID can not be blank."
        UserID.attr('style', 'border:1px solid #d03100 !important;');
        UserID.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        UserID.attr('style', 'border:1px solid #cdcdcd !important;');
        UserID.css({ "background-color": "#ffffff" });
    }
   

    if ((Password.val() == "" || Password.val() == null) && (Confirm.val() == "" || Confirm.val() == null)) {
        text += "<BR>" + " \u002A" + " Password & Confirm Password cannot be blank."
        Password.attr('style', 'border:1px solid #d03100 !important;');
        Password.css({ "background-color": "#fff2ee" });
        Confirm.attr('style', 'border:1px solid #d03100 !important;');
        Confirm.css({ "background-color": "#fff2ee" });

        opt = 1;
    } else {
        Password.attr('style', 'border:1px solid #cdcdcd !important;');
        Password.css({ "background-color": "#ffffff" });
        Confirm.attr('style', 'border:1px solid #cdcdcd !important;');
        Confirm.css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;

}