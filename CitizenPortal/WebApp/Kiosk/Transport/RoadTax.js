
$(document).ready(function () {
    $('#txtMobile').prop("disabled", true);
    $('#btnOTP').prop("disabled", true);
    $('#btnSubmit').prop("disabled", true);
});

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


function ValidateOTP() {
    var temp = "Gunwant";
    var result = false;
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
                $("#divMsgTitle").text("Information!");
                $("#divMsgDtls").text("Mobile no " + $('#txtMobile').val() + " Sucessfully Validated. Please Click On Show Detail Button To Get Vehicle Detail.");
                $('#divMsg').show();
                $('#txtSMSCode').prop('disabled', true);
                $('#btnValidateOTP').prop('disabled', true);
                $('#btnShowDtl').prop('disabled', false);
            }
            else {
                alert('OTP Validation Failed! You have entered wrong OTP Code, please re-enter correct OTP Code, which you have received on your registered mobile no. Other wise resend OTP Code from Lokaseba Adhikara -CAP, Odisha Govt.');
            }
        });// end of Then function of main Data Insert Function

    return false;
}


function GetDLDetail() {
    var RegNo = $('#txtRegistrationNo').val();
    $.ajax({
        type: "POST",
        url: "/WebApp/Kiosk/Transport/RoadTax.aspx/GetDLDetailAPI",
        contentType: "application/json; charset=utf-8",
        data: '{"RegNo":"' + RegNo + '"}',
        processData: false,
        dataType: "json",
        success: function (Result) {
            //var data = $.parseJSON(Result.d);
            var data = jQuery.parseJSON(JSON.stringify(Result.d));
            //console.log(data[0]['latestTaxDtls']['amount']);
            if (data[0]['latestTaxDtls'] == null) {
                if (data[0]['ownerDetails'] == null) {
                    $('#txtRegistrationNo').val('');
                    alertPopup("Vehicle Information", "<BR>Please Enter Correct DL Information.");
                }
            }
            else {
                $('#txtMobile').prop("disabled", false);
                $('#btnOTP').prop("disabled", false);
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function BindDLData() {

    var RegNo = $('#txtRegistrationNo').val();
    $.ajax({
        type: "POST",
        url: "/WebApp/Kiosk/Transport/RoadTax.aspx/GetDLDetailAPI",
        contentType: "application/json; charset=utf-8",
        data: '{"RegNo":"' + RegNo + '"}',
        processData: false,
        dataType: "json",
        success: function (Result) {

            //console.log(Result);
            var data = jQuery.parseJSON(JSON.stringify(Result.d));
            if (data[0]['latestTaxDtls'] != null) {
                if (data[0]['ownerDetails'] != null) {

                    $('#HFNTD').val(data[0]['RoadTaxJsonData']);

                    $('#VehicleNo').val(data[0]['ownerDetails']['regn_no']);
                    $('#VehicleNo').prop('disabled', true);

                    $('#OwerName').val(data[0]['ownerDetails']['owner_name']);
                    $('#OwerName').prop('disabled', true);

                    $('#CareOf').val(data[0]['ownerDetails']['f_name']);
                    $('#CareOf').prop('disabled', true);

                    $('#EngineNo').val(data[0]['ownerDetails']['eng_no']);
                    $('#EngineNo').prop('disabled', true);

                    $('#PurchaseDeliveryDate').val(data[0]['ownerDetails']['purchase_dt']);
                    $('#PurchaseDeliveryDate').prop('disabled', true);

                    $('#VehicleClass').val(data[0]['ownerDetails']['vh_class_desc']);
                    $('#VehicleClass').prop('disabled', true);

                    $('#BodyType').val(data[0]['ownerDetails']['body_type']);
                    $('#BodyType').prop('disabled', true);

                    $('#VehicleMakers').val(data[0]['ownerDetails']['maker_name']);
                    $('#VehicleMakers').prop('disabled', true);

                    $('#MakersModel').val(data[0]['ownerDetails']['model_name']);
                    $('#MakersModel').prop('disabled', true);

                    $('#UnloadedWeight').val(data[0]['ownerDetails']['unld_wt']);
                    $('#UnloadedWeight').prop('disabled', true);

                    $('#LadenWeight').val(data[0]['ownerDetails']['ld_wt']);
                    $('#LadenWeight').prop('disabled', true);

                    $('#SeatingCapacity').val(data[0]['ownerDetails']['seat_cap']);
                    $('#SeatingCapacity').prop('disabled', true);

                    $('#ManufactureYear').val(data[0]['ownerDetails']['manu_yr']);
                    $('#ManufactureYear').prop('disabled', true);

                    $('#SleeperCapacity').val(data[0]['ownerDetails']['sleeper_cap']);
                    $('#SleeperCapacity').prop('disabled', true);

                    $('#StandingCapacity').val(data[0]['ownerDetails']['stand_cap']);
                    $('#StandingCapacity').prop('disabled', true);

                    $('#ChassisNumber').val(data[0]['ownerDetails']['chasi_no']);
                    $('#ChassisNumber').prop('disabled', true);

                    $('#RegistrationDate').val(data[0]['ownerDetails']['regn_dtAsDate']);
                    $('#RegistrationDate').prop('disabled', true);

                    $('#VehicleType').val(data[0]['ownerDetails']['vehType']);
                    $('#VehicleType').prop('disabled', true);

                    $('#VehicleCategory').val(data[0]['ownerDetails']['vch_catg']);
                    $('#VehicleCategory').prop('disabled', true);

                    $('#VehicleValidity').val(data[0]['ownerDetails']['fit_upto_desc']);
                    $('#VehicleValidity').prop('disabled', true);

                    $('#TaxUpto').val(data[0]['latestTaxDtls']['tax_upto']);
                    $('#TaxUpto').prop('disabled', true);

                    $('#ReceiptDate').val(data[0]['latestTaxDtls']['receipt_date']);
                    $('#ReceiptDate').prop('disabled', true);

                    $('#Amount').val(data[0]['latestTaxDtls']['amount']);
                    $('#Amount').prop('disabled', true);

                    if (data[0]['latestTaxDtls']['fine'] != "0" || data[0]['latestTaxDtls']['fine'] != "") {
                        //document.getElementById("divFine").style.display = "block";
                        $('#lblFine').css("display", "block");
                        $('#lblFimeAmt').css("display", "block");
                        $('#Fine').val(data[0]['latestTaxDtls']['fine']);
                        $('#Fine').prop('disabled', true);
                    }
                }
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetTaxCalculation() {

    $('#DivLoadingTax').show(800);
    $('#btnSubmit').prop("disabled", true);

    var RegNo = $('#txtRegistrationNo').val();
    var TaxMode = $('#ddlTaxMode').val();
    var TaxPeriod = $('#TaxModeQty').val();

    if ($('#TaxModeQty').val() == "" || $('#TaxModeQty').val() == null && $('#ddlTaxMode').val() == "0" || $('#ddlTaxMode option:selected').text() == "Select") {
        alertPopup("Vehicle Tax Information", "<BR>Please Enter The No.of Month/Year/Quarter.");
        return;
    }
    else if ($('#ddlTaxMode').val() == "0" || $('#ddlTaxMode option:selected').text() == "Select") {
        $('#TaxModeQty').val('');
        $('#CalcTaxHead').val('');
        $('#CalcTaxFrom').val('');
        $('#CalcTaxUpto').val('');
        $('#CalcTaxPenalty').val('');
        $('#CalcTaxTotal').val('');
        $('#CalcTaxAmount').val('');
    }
    else if ($('#TaxModeQty').val() == "" || $('#TaxModeQty').val() == null) {
        alertPopup("Vehicle Tax Information", "<BR>Please Enter The No.of Month/Year/Quarter.");
        return;
    }
    else if ($('#ddlTaxMode').val() != "0" || $('#TaxModeQty').val() != null && $('#TaxModeQty').val() != "") {
        $.ajax({
            type: "POST",
            url: "/WebApp/Kiosk/Transport/RoadTax.aspx/GetTaxCalcAPI",
            contentType: "application/json; charset=utf-8",
            data: '{"RegNo":"' + RegNo + '","TaxMode":"' + TaxMode + '","TaxPeriod":"' + TaxPeriod + '"}',
            processData: false,
            dataType: "json",
            success: function (Result) {

                var data = jQuery.parseJSON(JSON.stringify(Result.d));

                var AddTotalTaxAmount = 0;

                var TotalRebate = 0;
                var TotalAmmount = 0;
                var Totalpenalty = 0;
                var TotalAmount1 = 0;
                var TotalAmount2 = 0;
                var TotalSurcharge = 0;
                var TotalInterest = 0;

                var AddTotalRebate = 0;
                var AddTotalAmmount = 0;
                var AddTotalpenalty = 0;
                var AddTotalAmount1 = 0;
                var AddTotalAmount2 = 0;
                var AddTotalSurcharge = 0;
                var AddTotalInterest = 0;

                if (data[0] != null || data[0] != "") {

                    if (data[0]['message'] == "Success") {

                        //console.log(data);
                        //console.log(data[0]['listTaxDetails'].length);

                        if (data[0]['listTaxDetails'] != null) {

                            if (data[0]['listTaxDetails'][0]['pur_CD'] == '58') {

                                $('#NormalTax').show(800);
                                $('#HFNTC').val(data[0]['TaxCalculationJsonData']);

                                $.each(data[0]['listTaxDetails'], function (index, value) {
                                    TotalRebate = TotalRebate + value.rebate;
                                    TotalAmmount = TotalAmmount + value.amount;
                                    Totalpenalty = Totalpenalty + value.penalty;
                                    TotalAmount1 = TotalAmount1 + value.amount1;
                                    TotalAmount2 = TotalAmount2 + value.amount2;
                                    TotalSurcharge = TotalSurcharge + value.surcharge;
                                    TotalInterest = TotalInterest + value.interest;
                                });

                                var TotalAmt = TotalAmmount; //$('#CalcTaxAmount').text();
                                var TotalRebt = TotalRebate; //$('#CalcTaxRebate').text();
                                var TotalTaxAmount = parseInt(TotalAmt) - parseInt(TotalRebt);
                                //TotalTaxAmount = TotalTaxAmount * TaxPeriod;

                                //$('#CalcTaxPenalty').text(data[0]['listTaxDetails'][0]['penalty'].toFixed(2));
                                //$('#CalcTaxAmount').text(data[0]['listTaxDetails'][0]['amount'].toFixed(2));
                                //$('#CalcTaxSurcharge').text(data[0]['listTaxDetails'][0]['surcharge'].toFixed(2));
                                //$('#CalcTaxRebate').text(data[0]['listTaxDetails'][0]['rebate'].toFixed(2));
                                //$('#CalcTaxInterest').text(data[0]['listTaxDetails'][0]['interest'].toFixed(2));
                                //$('#CalcTaxAmount1').text(data[0]['listTaxDetails'][0]['amount1'].toFixed(2));
                                //$('#CalcTaxAmount2').text(data[0]['listTaxDetails'][0]['amount2'].toFixed(2));

                                $('#CalcTaxHead').text(data[0]['listTaxDetails'][0]['tax_HEAD']);
                                $('#CalcTaxFrom').text(data[0]['finalTaxFrom']);
                                $('#CalcTaxUpto').text(data[0]['finalTaxUpto']);
                                $('#CalcTaxPenalty').text(Totalpenalty.toFixed(2));
                                $('#CalcTaxAmount').text(TotalAmmount.toFixed(2));
                                $('#CalcTaxSurcharge').text(TotalSurcharge.toFixed(2));
                                $('#CalcTaxRebate').text(TotalRebate.toFixed(2));
                                $('#CalcTaxInterest').text(TotalInterest.toFixed(2));
                                $('#CalcTaxAmount1').text(TotalAmount1.toFixed(2));
                                $('#CalcTaxAmount2').text(TotalAmount2.toFixed(2));

                                $('#CalcTaxTotal').text(TotalTaxAmount.toFixed(2));
                            }
                        }

                        if (data[0]['additionalTaxDetails'] != null) {

                            $('#AdditionalTax').show(800);

                            if (data[0]['additionalTaxDetails'][0]['pur_CD'] == '59') {

                                $.each(data[0]['additionalTaxDetails'], function (index, value) {
                                    AddTotalRebate = AddTotalRebate + value.rebate;
                                    AddTotalAmmount = AddTotalAmmount + value.amount;
                                    AddTotalpenalty = AddTotalpenalty + value.penalty;
                                    AddTotalAmount1 = AddTotalAmount1 + value.amount1;
                                    AddTotalAmount2 = AddTotalAmount2 + value.amount2;
                                    AddTotalSurcharge = AddTotalSurcharge + value.surcharge;
                                    AddTotalInterest = AddTotalInterest + value.interest;
                                });

                                var AddTotalAmt = AddTotalAmmount;
                                var AddTotalRebt = AddTotalRebate;
                                var AddTotalTaxAmount = parseInt(AddTotalAmt) - parseInt(AddTotalRebt);

                                $('#AddCalcTaxHead').text(data[0]['additionalTaxDetails'][0]['tax_HEAD']);
                                $('#AddCalcTaxFrom').text(data[0]['finalTaxFrom']);
                                $('#AddCalcTaxUpto').text(data[0]['finalTaxUpto']);

                                //$('#AddCalcTaxPenalty').text(data[0]['additionalTaxDetails'][0]['penalty'].toFixed(2));
                                //$('#AddCalcTaxAmount').text(data[0]['additionalTaxDetails'][0]['amount'].toFixed(2));
                                //$('#AddCalcTaxSurcharge').text(data[0]['additionalTaxDetails'][0]['surcharge'].toFixed(2));
                                //$('#AddCalcTaxRebate').text(data[0]['additionalTaxDetails'][0]['rebate'].toFixed(2));
                                //$('#AddCalcTaxInterest').text(data[0]['additionalTaxDetails'][0]['interest'].toFixed(2));
                                //$('#AddCalcTaxAmount1').text(data[0]['additionalTaxDetails'][0]['amount1'].toFixed(2));
                                //$('#AddCalcTaxAmount2').text(data[0]['additionalTaxDetails'][0]['amount2'].toFixed(2));

                                $('#AddCalcTaxPenalty').text(AddTotalpenalty.toFixed(2));
                                $('#AddCalcTaxAmount').text(AddTotalAmmount.toFixed(2));
                                $('#AddCalcTaxSurcharge').text(AddTotalSurcharge.toFixed(2));
                                $('#AddCalcTaxRebate').text(AddTotalRebate.toFixed(2));
                                $('#AddCalcTaxInterest').text(AddTotalInterest.toFixed(2));
                                $('#AddCalcTaxAmount1').text(AddTotalAmount1.toFixed(2));
                                $('#AddCalcTaxAmount2').text(AddTotalAmount2.toFixed(2));

                                var AddTotalAmt = AddTotalAmmount;
                                var AddTotalRebt = AddTotalRebate;
                                AddTotalTaxAmount = parseInt(AddTotalAmt) - parseInt(AddTotalRebt);

                                $('#AddCalcTaxTotal').text(AddTotalTaxAmount.toFixed(2));

                            }
                        }

                        if (AddTotalTaxAmount == 'NaN' || AddTotalTaxAmount == '0' && AddTotalTaxAmount == 'undefined') {
                            AddTotalTaxAmount = 0;
                        }

                        $('#lblServiceCharges').text("20.00");
                        $('#lblTransactionCharges').text("0.00");
                        var ServiceCharge = 20;
                        var FinalTax = data[0]['vtTaxFinalTax'];
                        var FinalFine = data[0]['vtTaxFinalFine'];
                        var FinalRoadTaxAmount = parseInt(FinalTax) + parseInt(FinalFine) + parseInt(ServiceCharge);
                        $('#lblotalPayableAmount').text(FinalRoadTaxAmount.toFixed(2));
                        //var FinalRoadTaxAmount = TotalTaxAmount + AddTotalTaxAmount + ServiceCharge;
                        //$('#lblotalPayableAmount').text(FinalRoadTaxAmount).toFixed(2);
                        $('#DivLoadingTax').hide(800);
                        $('#btnSubmit').prop("disabled", false);
                    }
                    else {
                        alertPopup("Vehicle Tax Information", "<BR>Tax Details Not Found For " + $('#VehicleNo').val() + " .");
                    }
                }
            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        });
    }
}


function SubmitData() {

    //if (!ValidateForm()) {
    //    return false;
    //}

    //$("#btnSubmit").prop('disabled', true);

    var t_Message = "";
    var result = false;
    var temp = "Mohan";
    var AppID = "";
    var rtnurl = "";
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

        'ProfileID': uid,
        'VehicleNo': $('#VehicleNo').val(),
        'MobileNo': $('#HFMobile').val(),
        'OwnerName': $('#OwerName').val(),
        'CareOf': $('#CareOf').val(),
        'EngineNo': $('#EngineNo').val(),
        'PurchaseDeliveryDate': $('#PurchaseDeliveryDate').val(),
        'VehicleClass': $('#VehicleClass').val(),
        'BodyType': $('#BodyType').val(),
        'MakersModel': $('#MakersModel').val(),
        'VehicleMakers': $('#VehicleMakers').val(),
        'UnloadedWeight': $('#UnloadedWeight').val(),
        'LadenWeight': $('#LadenWeight').val(),
        'SeatingCapacity': $('#SeatingCapacity').val(),
        'ManufactureYear': $('#ManufactureYear').val(),
        'SleeperCapacity': $('#SleeperCapacity').val(),
        'StandingCapacity': $('#StandingCapacity').val(),
        'RegistrationDate': $('#RegistrationDate').val(),
        'ChassisNumber': $('#ChassisNumber').val(),
        'VehicleType': $('#VehicleType').val(),
        'VehicleCategory': $('#VehicleCategory').val(),
        'VehicleValidity': $('#VehicleValidity').val(),

        'PrevReceiptDate': $('#TaxUpto').val(),
        'PrevTaxAmount': $('#Amount').val(),
        'PrevTaxUpTo': $('#ReceiptDate').val(),
        'PrevTaxFine': $('#Fine').val(),

        'RoadTaxNicJsonData': $('#HFNTD').val(),

        'TaxValue': $('#TaxModeQty').val(),
        'TaxMode': $('#ddlTaxMode option:selected').val(),

        'TaxHead': $('#CalcTaxHead').text(),
        'CurTaxFrom': $('#CalcTaxFrom').text(),
        'CurTaxUpTo': $('#CalcTaxUpto').text(),
        'CurTaxAmount': $('#CalcTaxAmount').text(),
        'CurTaxPenalty': $('#CalcTaxPenalty').text(),
        'CurTaxSurcharge': $('#CalcTaxSurcharge').text(),
        'CurTaxRebate': $('#CalcTaxRebate').text(),
        'CurTaxInterest': $('#CalcTaxInterest').text(),
        'CurTaxAmount1': $('#CalcTaxAmount1').text(),
        'CurTaxAmount2': $('#CalcTaxAmount2').text(),
        'CurTotalTaxAmount': $('#CalcTaxTotal').text(),

        'AddCurTaxValue': $('#TaxModeQty').val(),
        'AddCurTaxMode': $('#ddlTaxMode option:selected').val(),

        'AddCurTaxHead': $('#AddCalcTaxHead').text(),
        'AddCurTaxFrom': $('#AddCalcTaxFrom').text(),
        'AddCurTaxUpTo': $('#AddCalcTaxUpto').text(),
        'AddCurTaxAmount': $('#AddCalcTaxAmount').text(),
        'AddCurTaxPenalty': $('#AddCalcTaxPenalty').text(),
        'AddCurTaxSurcharge': $('#AddCalcTaxSurcharge').text(),
        'AddCurTaxRebate': $('#AddCalcTaxRebate').text(),
        'AddCurTaxInterest': $('#AddCalcTaxInterest').text(),
        'AddCurTaxAmount1': $('#AddCalcTaxAmount1').text(),
        'AddCurTaxAmount2': $('#AddCalcTaxAmount2').text(),
        'AddCurTotalTaxAmount': $('#AddCalcTaxTotal').text(),

        'UserServiceTax': $('#lblServiceCharges').text(),
        'FinalTaxPaymentAmount': $('#lblotalPayableAmount').text(),

        'TaxCalNicJsonData': $('#HFNTC').val(),

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
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/WebApp/Kiosk/Transport/RoadTax.aspx/InsertRoadTaxFormData",
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#progressbar").hide();
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
        if (AppID == "" || AppID == null) {
            alertPopup("Form Validation Failed", "Error While Saving Application.!!!, <BR> Either You Have MobileNumber or AadhaarNumber Which Has Been Used Earlier!!!");
            rtnurl = "/Account/Login";
            window.location.href = rtnurl;
            return;
        }
        else {
            if (result /*&& jqXHRData_IMG_result*/) {
                $("#progressbar").hide();
                alertPopup("Vehicle Tax Information", "Application saved successfully. Reference ID : " + obj.AppID + " Please Make Payment against the Application Number.");
                window.location.href = '/WebApp/Kiosk/Transport/PaymentInfo.aspx?SvcID=421&AppID=' + obj.AppID;
            }
            else {
                $("#progressbar").hide();
                alertPopup("Form Validation Failed", "Unable to save Applicatin, Please refresh the browser and try again");
            }
        }

    });// end of Then function of main Data Insert Function

    return false;
}