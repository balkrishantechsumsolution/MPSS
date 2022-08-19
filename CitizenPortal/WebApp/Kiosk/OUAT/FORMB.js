function openWindow(UIDVal, value, SessionName) {
    debugger;
    if (validateUID(UIDVal) != false) {


        //if (UIDVal == "1") {
        //code = UIDVal;
        //}

        //CheckLocalAadhar($("#UID").val());
        var UID = $("#UID").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=403&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
        ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        window.focus();
    }
    return false;
}

function BindProfile(JSONData) {
    debugger;
    if (JSONData != "") {
        if ($("#HFUIDData").val() != "") {

            debugger;
            $("#divSearch").show();
            $("#divBasicInfo").show();
            $("#divInfo").show();
            $("#divAddress").show();
            $("#divBtn").show();
            $("#ddlSearch").prop("disabled", true);
            $("#UID").prop("disabled", true);
            $("#btnSearch").prop("disabled", true);
            $("#fulPhoto").hide();

            var obj = jQuery.parseJSON($("#HFUIDData").val());

            if (obj["dateOfBirth"] != "") {
                var t_DOB = obj["dateOfBirth"];
                t_DOB = t_DOB.replace(/-/g, "/");
                $('#DOB').val(t_DOB);
                $('#DOB').prop("disabled", true);

                debugger;
                var t_DOB = $("#DOB").val();
                t_DOB = t_DOB.replace("-", "/");
                var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                var selectedYear = S_date.getFullYear();
                var Age = calage(t_DOB);
                $('#Age').val(Age);

                var Age = calcExSerDur(t_DOB, '31/12/2017');
                $('#Age').val(Age.years);

                $("#Year").val(Age.years);
                $("#Month").val(Age.months);
                $("#Day").val(Age.days);
            }

            document.getElementById('myImg').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);

            EL("HFb64").value = 'data:image/png;base64,' + obj["photo"];

            $("#FirstName").val(obj["residentName"]);
            //$('#FirstName').prop("disabled", true);

            $("#UID").val(obj["aadhaarNumber"]);
            $('#UID').prop("disabled", true);

            $("#FatherName").val(obj["careOf"]);
            //$('#FatherName').prop("disabled", true);

            obj["district"];

            $('#EmailID').val(obj["emailId"]);

            if (obj["gender"] != "") {
                if (obj["gender"] == "M") {
                    $('#ddlGender').val("M");
                    $('#ddlSalutation').val("Mr.");
                }
                else if (obj["gender"] == "F") {
                    $('#ddlGender').val("F");
                    $('#ddlSalutation').val("Mrs");
                }
                else {
                    $('#ddlGender').val("T");
                    $('#ddlSalutation').val("Other");
                }
                $('#ddlGender').prop("disabled", true);
            }

            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(obj["houseNumber"]);
            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").prop("disabled", true);

            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").prop("disabled", true);

            $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(obj["street"]);
            $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").prop("disabled", true);

            $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(obj["landmark"]);
            $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").prop("disabled", true);

            $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(obj["locality"]);
            $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").prop("disabled", true);

            $('#phoneno').val(obj["phone"]);
            $('#MobileNo').val(obj["phone"]);
            $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val(obj["pincode"]);
            $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").prop("disabled", true);

            if (obj["state"] != "") {
                $('#txtState').val(obj["state"]);
                $('#txtState').prop("disabled", true);
                $('#PddlState').hide();
                $('#PddlDistrict').hide();
                $('#PddlTaluka').hide();
                $('#PddlVillage').hide();
            }
            else {
                $('#txtState').hide();
                $('#txtDistrict').hide();
                $('#txtBlock').hide();
                $('#txtPanchayat').hide();
            }

            $('#txtDistrict').val(obj["district"]);
            $('#txtBlock').val(obj["subDistrict"]);
            $('#txtPanchayat').val(obj["vtc"]);
            $('#txtDistrict').prop("disabled", true);
            $('#txtBlock').prop("disabled", true);
            $('#txtPanchayat').prop("disabled", true);

            $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);

            $("#MotherName").val(obj["MotherName"]);
            $("#txtTongue").val(obj["MotherTongue"]);
            $("#religion").val(obj["Religion"]);
            $("#category").val(obj["Category"]);


            $("#MotherName").prop("disabled", true);
            $("#txtTongue").prop("disabled", true);
            $("#religion").prop("disabled", true);
            $("#category").prop("disabled", true);

        }//end of UID Data



    }
}

$(document).ready(function () {
    $("#progressbar").hide();
    $('#txtPoliceStation').hide();

    //$('#txtTransDate').datepicker({
    //    dateFormat: "dd/mm/yy",
    //    changeMonth: true,
    //    changeYear: true,
    //    maxDate: '-1d',
    //    yearRange: "-150:+0",
    //    onSelect: function (date) {

    //        var t_DOB = $("#txtTransDate").val();

    //        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
    //        var selectedYear = S_date.getFullYear();

    //    }
    //});

    if ($("#HFUIDData").val() != "") {
        //alert($("#HFUIDData").val());
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
        maxDate: '31/12/2000',
        yearRange: "-100:+0",
        onSelect: function (date) {

            //var Age = calcDobAge(date);
            var Age = calcExSerDur(date, '31/12/2017');
            $('#Age').val(Age.years);

            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);

            //if (Age < 18) {
            //    $('#DOB').val('');
            //    alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
            //    $('#Age').val('');
            //    return false;
            //} else if (Age > 23) {
            //    $('#Age').val('');
            //    alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 23 years.');
            //    $('#Age').val('');
            //    return false;
            //}
        }
    });

    $('#txtTotalMarks').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtTotalMarks2').change(function () {

        calculatepercentageXII($('#txtTotalMarks2').val(), $('#txtMarkSecure2').val());
    });

    $('#txtMarkSecure').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtMarkSecure2').change(function () {

        calculatepercentageXII($('#txtTotalMarks2').val(), $('#txtMarkSecure2').val());
    });


    $('#txtKMFrom').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        minDate: '01/01/1980',
        maxDate: '31/12/1999',
        yearRange: "-50:+0",
        onSelect: function (date) {
            // Add validations
            var durn = calcExSerDur(date, $('#txtKMTo').val());

            if (durn != null) {

                if (durn.years < 0) return false;
                if (durn.months < 0) return false;
                if (durn.days < 0) return false;

                $("#SevsYear").val(durn.years);
                $("#SevsMonth").val(durn.months);
                $("#SevsDay").val(durn.days);
            }

        }
    });

    $('#txtKMTo').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        minDate: '01/01/1980',
        maxDate: '31/12/1989',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            debugger;
            t_DOD = $("#txtKMFrom").val();
            t_DOB = $("#txtKMTo").val();

            if ($("#txtKMFrom").datepicker("getDate") >= $("#txtKMTo").datepicker("getDate")) {
                alertPopup('Form Validation ', 'Residicing To Date must be greater than From Date.');
                $("#txtKMFrom").val("");
                $('#txtKMTo').val("");
                return;
            }

            var durn = calcExSerDur($('#txtKMFrom').val(), date);

            if (durn != null) {

                if (durn.years < 0) return false;
                if (durn.months < 0) return false;
                if (durn.days < 0) return false;

                $("#SevsYear").val(durn.years);
                $("#SevsMonth").val(durn.months);
                $("#SevsDay").val(durn.days);
            }

        }
    });


    //$('#txtRndDrtinstrt').datepicker({
    //    dateFormat: "dd/mm/yy",
    //    changeMonth: true,
    //    changeYear: true,
    //    maxDate: '0',
    //    yearRange: "-150:+0",
    //    onSelect: function (date) {
    //        // Add validations
    //        var durn = calcExSerDur(date, $('#txtRndDrtinend').val());

    //        if (durn != null) {

    //            if (durn.years < 0) return false;
    //            if (durn.months < 0) return false;
    //            if (durn.days < 0) return false;

    //            $("#SevsYear").val(durn.years);
    //            $("#SevsMonth").val(durn.months);
    //            $("#SevsDay").val(durn.days);
    //        }

    //    }
    //});

    //$('#txtRndDrtinend').datepicker({
    //    dateFormat: "dd/mm/yy",
    //    changeMonth: true,
    //    changeYear: true,
    //    maxDate: '0',
    //    yearRange: "-150:+0",
    //    onSelect: function (date) {
    //        // Add validations
    //        debugger;
    //        t_DOD = $("#txtRndDrtinstrt").val();
    //        t_DOB = $("#txtRndDrtinend").val();

    //        if ($("#txtRndDrtinstrt").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
    //            alertPopup('Form Validation ', 'Qualifying Service To Date must be greater than From Date.');
    //            $("#txtRndDrtinstrt").val("");
    //            $('#txtRndDrtinend').val("");                
    //            return;
    //        }

    //        var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);

    //        if (durn != null) {

    //            if (durn.years < 0) return false;
    //            if (durn.months < 0) return false;
    //            if (durn.days < 0) return false;

    //            $("#SevsYear").val(durn.years);
    //            $("#SevsMonth").val(durn.months);
    //            $("#SevsDay").val(durn.days);
    //        }

    //    }
    //});

    //$('#txtRegdte').datepicker({
    //    dateFormat: "dd/mm/yy",
    //    changeMonth: true,
    //    changeYear: true,
    //    maxDate: '02/12/2015',
    //    yearRange: "-50:+0",
    //    onSelect: function (date) {
    //        // Add validations
    //        //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
    //    }
    //});

    //$('#txtLicenseDate').datepicker({
    //    dateFormat: "dd/mm/yy",
    //    changeMonth: true,
    //    changeYear: true,
    //    maxDate: '0',
    //    yearRange: "-50:2015",
    //    onSelect: function (date) {
    //        // Add validations
    //        //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
    //    }
    //});

    EL("File1").addEventListener("change", readFile, false);
    EL("File2").addEventListener("change", readFile2, false);

    //Section 1
    $("#yes").on('change', function () {
        $("#readOdiya").prop('disabled', false);
        $("#writeOdiya").prop('disabled', false);
        $("#spkOdiya").prop('disabled', false);
    });

    $("#no").on('change', function () {
        $("#readOdiya").prop('disabled', true);
        $("#writeOdiya").prop('disabled', true);
        $("#spkOdiya").prop('disabled', true);


        $("#readOdiya").prop('checked', false);
        $("#writeOdiya").prop('checked', false);
        $("#spkOdiya").prop('checked', false);

    });

    //Section 2
    $("#Mrd").on('change', function () {
        $("#LvSpse").prop('disabled', false);
        $("#NtLvSpse").prop('disabled', false);
    });

    $("#UnMrd").on('change', function () {
        $("#LvSpse").prop('disabled', true);
        $("#NtLvSpse").prop('disabled', true);

        $("#LvSpse").prop('checked', false);
        $("#NtLvSpse").prop('checked', false);
    });

    //Section 3
    $("#exarmyyes").on('change', function () {
        $("#txtRtrmntdte").prop('disabled', false);
        $("#txtRndDrtinstrt").prop('disabled', false);
        $("#txtRndDrtinend").prop('disabled', false);
    });

    $("#exarmyno").on('change', function () {
        $("#txtRtrmntdte").prop('disabled', true);
        $("#txtRndDrtinstrt").prop('disabled', true);
        $("#txtRndDrtinend").prop('disabled', true);

        $("#txtRtrmntdte").val('');
        $("#txtRndDrtinstrt").val('');
        $("#txtRndDrtinend").val('');

        $("#SevsYear").val('');
        $("#SevsMonth").val('');
        $("#SevsDay").val('');


    });

    //Section 4
    //$("#ddlSports").change(function () {
    //    if ($('option:selected', this).val() == 999) {
    //        $('#divOtherSports').show();
    //        $("#txtOthrsport").prop('disabled', false);

    //    }
    //    else {
    //        $('#divOtherSports').hide();
    //        $("#txtOthrsport").prop('disabled', true);
    //        $("#txtOthrsport").val('');
    //    }
    //});

    $("#sptprsnYes").on('change', function () {
        $("#ddlSports").prop('disabled', false);
        $("#txtOthrsport").prop('disabled', true);
        $("#ddlRxlstnhgt").prop('disabled', false);
        $("#ddlRxlstnchst").prop('disabled', false);
        $("#ddlRxlstnwght").prop('disabled', false);
        $("#dntavlrlxon").prop('checked', true).trigger('change');

    });

    $("#sptprsnNo").on('change', function () {
        $("#ddlSports").prop('disabled', true);
        $("#txtOthrsport").prop('disabled', true);

        $("#ddlRxlstnhgt").prop('disabled', true);
        $("#ddlRxlstnchst").prop('disabled', true);
        $("#ddlRxlstnwght").prop('disabled', true);


        $("#txtOthrsport").val('');

        $("#ddlSports").val(0);
        $("#ddlRxlstnhgt").val(0);
        $("#ddlRxlstnchst").val(0);
        $("#ddlRxlstnwght").val(0);

        $('input[name="radio4"]').prop('checked', false);
        $('input[name="radio4b"]').prop('checked', false);

    });

    $("#wntavlrlxon").on('change', function () {
        $("#ddlRxlstnhgt").prop('disabled', false);
        $("#ddlRxlstnchst").prop('disabled', false);
        $("#ddlRxlstnwght").prop('disabled', false);
    });

    $("#dntavlrlxon").on('change', function () {
        $("#ddlRxlstnhgt").prop('disabled', true);
        $("#ddlRxlstnchst").prop('disabled', true);
        $("#ddlRxlstnwght").prop('disabled', true);


        $("#ddlRxlstnhgt").val(0);
        $("#ddlRxlstnchst").val(0);
        $("#ddlRxlstnwght").val(0);
    });


    //$("#dntavlrlxon").prop('checked', true).trigger('change');




    //Section 5



    //Section 6


    $("#HsCerfte").on('change', function () {
        $("#radio6AA").prop('disabled', false);
        $("#radio6AB").prop('disabled', false);
        $("#radio6AC").prop('disabled', false);

    });

    $("#NtHvgCerfte").on('change', function () {
        $("#radio6AA").prop('disabled', true);
        $("#radio6AB").prop('disabled', true);
        $("#radio6AC").prop('disabled', true);

        $("#radio6AA").prop('checked', false);
        $("#radio6AB").prop('checked', false);
        $("#radio6AC").prop('checked', false);

    });
    ////Section 7



    ////Section 8

    $("#rdoDLYes").on('change', function () {
        $("#hvyVeh").prop('disabled', false);
        $("#lgtVeh").prop('disabled', false);
        $("#txtLicenseNo").prop('disabled', false);
        $("#txtLicenseDate").prop('disabled', false);
        $("#txtRTO").prop('disabled', false);

    });

    $("#rdoDLNo").on('change', function () {
        $("#hvyVeh").prop('disabled', true);
        $("#lgtVeh").prop('disabled', true);

        $("#hvyVeh").prop('checked', false);
        $("#lgtVeh").prop('checked', false);

        $("#txtLicenseNo").prop('disabled', true);
        $("#txtLicenseDate").prop('disabled', true);
        $("#txtRTO").prop('disabled', true);

        $("#txtLicenseNo").val('');
        $("#txtLicenseDate").val('');
        $("#txtRTO").val('');

    });

    //$("#rdoDLNo").prop('checked', true).trigger('change');

    ////Section 9
    $("#rdoCrmYes").on('change', function () {
        //$("#radio9AA").prop('disabled', false);
        //$("#radio9AB").prop('disabled', false);
        var Acquitted = $('#ddlAcquitted option:selected').val("0");
        $("#txtCriminalRefNo").prop('disabled', false);
        $("#ddlArrestDistrict").prop('disabled', false);
        $("#txtPoliceStationNo").prop('disabled', false);
        $("#txtIPCSection").prop('disabled', false);

    });

    $("#rdoCrmNo").on('change', function () {
        //$("#radio9AA").prop('disabled', true);
        //$("#radio9AB").prop('disabled', true);

        //$("#radio9AA").prop('checked', false);
        //$("#radio9AB").prop('checked', false);
        var Acquitted = $('#ddlAcquitted option:selected').val("0");
        $("#txtCriminalRefNo").prop('disabled', true);
        $("#ddlArrestDistrict").prop('disabled', true);
        $("#txtPoliceStationNo").prop('disabled', true);
        $("#txtIPCSection").prop('disabled', true);


        $("#txtCriminalRefNo").val('');
        $("#ddlArrestDistrict").val(0);

        $("#txtPoliceStationNo").val('');
        $("#txtIPCSection").val('');

    });

    $("#txtHandiPercent").prop('disabled', true);
    $("#rbtnHandicapTypeY").on('change', function () {
        $("#txtHandiPercent").prop('disabled', true);

    });

    $("#rbtnHandicapTypeN").on('change', function () {
        $("#txtHandiPercent").prop('disabled', false);

    });

    $('#txtHandiPercent').change(function () {

        var HandicappedPart = $("#txtHandicappedPart").val();
        var HandiPercent = $("#txtHandiPercent").val();

        if (HandiPercent < 40) {
            alertPopup('Form Validation ', 'Percentage for Handicapped Body Part must be greater than 40 %');
            $("#txtHandiPercent").val("");
            return;
        }
    });


    //$("#rdoCrmNo").prop('checked', true).trigger('change');

    //GetState();
    var StateControl = "ctl00$ContentPlaceHolder1$Address1$ddlState";
    var DistrictControl = "ctl00$ContentPlaceHolder1$Address1$ddlDistrict";
    var TalukaControl = "ctl00$ContentPlaceHolder1$Address1$ddlTaluka";
    var VillageControl = "ctl00$ContentPlaceHolder1$Address1$ddlVillage";

    var StateControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlState";
    var DistrictControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlDistrict";
    var TalukaControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlTaluka";
    var VillageControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlVillage";

    GetStateV2("", StateControl);
    GetStateV2("", StateControl2);

    //For Education Board
    GetStateV2OdishaDefault("", "EddlBoardState");//Logic to be activated for Educational State.
    var EdState = "EddlBoardState";
    var EdBoard = "ddlBoard";
    //$('#ddlBoard').prop("disabled", true);
    $("[name='" + EdState + "']").bind("change", function (e) { return GetEducationBoard("", $("[name='" + EdState + "']").val(), EdBoard); });

    //commented by niraj GetDistrict("", "21", "ddlArrestDistrict"); //Implemented in Addressscript.js

    $("[name='" + StateControl + "']").bind("change", function (e) { return OUAT_GetDistrict("", $("[name='" + StateControl + "']").val(), DistrictControl); });
    $("[name='" + DistrictControl + "']").bind("change", function (e) { return OUAT_GetSubDistrict("", DistrictControl, TalukaControl); });
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return OUAT_GetVillage("", TalukaControl, VillageControl); });

    $("[name='" + StateControl2 + "']").bind("change", function (e) { return OUAT_GetDistrict("", $("[name='" + StateControl2 + "']").val(), DistrictControl2); });
    $("[name='" + DistrictControl2 + "']").bind("change", function (e) { return OUAT_GetSubDistrict("", DistrictControl2, TalukaControl2); });
    $("[name='" + TalukaControl2 + "']").bind("change", function (e) { return OUAT_GetVillage("", TalukaControl2, VillageControl2); });

    //For Emp.Exchange//
    var DistrictControlEE = "EEddlDistrict";
    var EmploymetExchange = "ddlEmploymentExchange";
    $("#ddlEmploymentExchange").prop('disabled', true);
    GetDistrict("", "21", DistrictControlEE);
    //$("[name='" + DistrictControlEE + "']").bind("change", function (e) { return GetEmploymentExchange("", $("[name='" + DistrictControlEE + "']").val(), EmploymetExchange); });

    //For Crime Case//
    var StateControlCC = "ddlStateCC";
    var DistrictControlCC = "ddlArrestDistrict";
    var PoliceStation = "ddlPoliceStation";
    GetStateV2("", StateControlCC);
    $("[name='" + StateControlCC + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControlCC + "']").val(), DistrictControlCC); });
    $("[name='" + DistrictControlCC + "']").bind("change", function (e) { return GetPoliceStation(StateControlCC, DistrictControlCC, PoliceStation); });

    //For RTO
    var DistrictRTO = "ddlDistrictRTO";
    var RTO = "ddlRTO";
    GetDistrict("", "21", DistrictRTO);

    //$("[name='" + DistrictRTO + "']").bind("change", function (e) { return GetRTOList("", $("[name='" + DistrictRTO + "']").val(), RTO); });

    //$("#religion").bind("change", function (e) {

    //    var CategoryArr = ["SC", "ST", "SEBC", "UR"];
    //    var CategoryArr2 = ["UR"];
    //    var CategoryArr3 = ["SC", "UR"];
    //    var CategoryArr4 = ["ST", "UR"];
    //    var CategoryArr5 = ["SC","ST", "UR"];

    //    $("#category").empty();
    //    $("#category").append('<option value = "0">-Select-</option>');

    //    if ($("#religion").val() == "Hndu") {
    //        var arrLen = CategoryArr.length;

    //        for (i = 0; i < arrLen; i++) {
    //            $("#category").append('<option value = "' + CategoryArr[i] + '">' + CategoryArr[i] + '</option>');
    //        }
    //        $("#category").prop('disabled', false);
    //    }
    //    else if ($("#religion").val() == "Skhsm") {
    //        var arrLen = CategoryArr3.length;

    //        for (i = 0; i < arrLen; i++) {
    //            $("#category").append('<option value = "' + CategoryArr3[i] + '">' + CategoryArr3[i] + '</option>');
    //        }
    //        $("#category").prop('disabled', false);
    //    } else if ($("#religion").val() == "Crstn") {
    //        var arrLen = CategoryArr4.length;

    //        for (i = 0; i < arrLen; i++) {
    //            $("#category").append('<option value = "' + CategoryArr4[i] + '">' + CategoryArr4[i] + '</option>');
    //        }
    //        $("#category").prop('disabled', false);
    //    } else if ($("#religion").val() == "Budhist") {
    //        var arrLen = CategoryArr5.length;

    //        for (i = 0; i < arrLen; i++) {
    //            $("#category").append('<option value = "' + CategoryArr5[i] + '">' + CategoryArr5[i] + '</option>');
    //        }
    //        $("#category").prop('disabled', false);
    //    }
    //    else if ($("#religion").val() == "Othr") {
    //        var arrLen = CategoryArr.length;

    //        for (i = 0; i < arrLen; i++) {
    //            $("#category").append('<option value = "' + CategoryArr[i] + '">' + CategoryArr[i] + '</option>');
    //        }
    //        $("#category").prop('disabled', false);
    //    }
    //    else {
    //        var arrLen = CategoryArr2.length;
    //        $("#category").empty();
    //        for (i = 0; i < arrLen; i++) {
    //            $("#category").append('<option value = "' + CategoryArr2[i] + '">' + CategoryArr2[i] + '</option>');
    //        }
    //        $("#category").prop('disabled', true);
    //    }
    //});

    $("#ddlPctgeCalclte").bind("change", function (e) {

        if ($("#ddlPctgeCalclte").val() == "501") {
            $("#txtTotalMarks").attr("placeholder", "CGPA").val("").focus().blur();
            $("#lblTotalMarks").text("CGPA Secured");
            $("#txtMarkSecure").prop('disabled', true);


            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");

        }
        else {
            $("#txtTotalMarks").attr("placeholder", "Total Marks").val("").focus().blur();
            $("#lblTotalMarks").text("Total Marks");
            $("#txtMarkSecure").prop('disabled', false);

            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");

        }


    });

    $("#ddlPctgeCalclte2").bind("change", function (e) {

        if ($("#ddlPctgeCalclte2").val() == "501") {
            $("#txtTotalMarks2").attr("placeholder", "CGPA").val("").focus().blur();
            $("#lblTotalMarks2").text("CGPA Secured");
            $("#txtMarkSecure2").prop('disabled', true);


            $('#txtTotalMarks2').val("");
            $('#txtMarkSecure2').val("");
            $("#txtPercentage2").val("");

        }
        else {
            $("#txtTotalMarks2").attr("placeholder", "Total Marks").val("").focus().blur();
            $("#lblTotalMarks2").text("Total Marks");
            $("#txtMarkSecure2").prop('disabled', false);

            $('#txtTotalMarks2').val("");
            $('#txtMarkSecure2').val("");
            $("#txtPercentage2").val("");

        }


    });
    //$("#nationality").bind("change", function (e) {

    //    if ($("#nationality").val() == "NRI") {
    //        $('#divNRIDetails').show();
    //    }
    //    else {
    //        $('#divNRIDetails').hide();
    //    }


    //});

    $("#ddlReservation").bind("change", function (e) {

        if ($("#ddlReservation").val() != "0") {
            $('#divResevation').show(500);
            if ($("#ddlReservation").val() == "203") {
                $('#divHandicap').show(500);
            }
            else if ($("#ddlReservation").val() == "204") {
                $('#divNRI').show(500);
            }
            else if ($("#ddlReservation").val() == "206") {
                $('#divResevation').show(500);
            }
            else if ($("#ddlReservation").val() == "207") {
                $('#divEmplyeeCase').show(500);
            }
            else if ($("#ddlReservation").val() == "209") {
                $('#divResevation').show(500);
            }
        }
        else {
            $('#divResevation').hide(500);
        }


    });


    // Logic for binding the existing profile

    qs = getQueryStrings();
    if (qs["ProfileID"] != null) {
        debugger;

        ProfileID = qs["ProfileID"];
        $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    //url: '/webapp/kiosk/forms/basicdetail.aspx/GetUIDKeyField',
                    url: '/webapp/kiosk/OUAT/FormB.aspx/GetOUATFormAData',
                    //data: '{"prefix": ""}',
                    //data: '{"UID": '+uid+'}',
                    data: '{"prefix":"","UID":"' + ProfileID + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {

                    },
                    error: function (a, b, c) {
                        alert("1." + a.responseText);
                    }
                })
            )
            .then(function (data, textStatus, jqXHR) {
                debugger;

                //var arr = eval(data.d);
                //var arr = jQuery.parseJSON(data.d);
                JSONData = data.d;
                //var html = "";
                //var name = arr[0].Name; // 2017-01-31: Logic commented for editing the Profile
                //var JSONData = name; // 2017-01-31: Logic commented for editing the Profile
                $("#HFUIDData").val(JSONData);

                if ($("#HFUIDData").val() != "") {

                    $("#HFResponseType").val("1");
                    BindProfileV2(JSONData, 1); //function to call with 1 in case of Citizen Profile Data
                }

            }); // end of Then function of main Data Insert Function

    }


    // Logic for binding the existing profile

    $('#File1').prop('disabled', true);
    $('#File1').prop('disabled', true);

    $("#ddlResidence").bind("change", function (e) {
        if ($("#ddlResidence").val() != "0") {
            $('#divInstruction').show(500);
        }
        else {
            $('#divInstruction').hide(500);
        }
    });

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });
});



function GetStateV2(category, StateControl) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Registration/KioskRegistration.aspx/GetState',
        data: '{"prefix": ""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            //$("[id*=ddlState]").empty();
            //$("[id*=ddlState]").append('<option value = "0">-Select-</option>');
            //$.each(arr, function () {
            //    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            //    //console.log(this.Id + ',' + this.Name);
            //});

            $("[name='" + StateControl + "']").empty();
            $("[name='" + StateControl + "']").append('<option value = "0">-Select-</option>');
            $.each(arr, function () {
                $("[name='" + StateControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                //catCount++;
            });

        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });
}


function GetDistrict(category, StateControl, DistrictControl) {
    //var SelIndex = $("[name='" + StateControl + "']").val(); //This Logic is commented to bind the Districts Directly from State, using a hard coded value of the State.
    var SelIndex = StateControl;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
        data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + DistrictControl + "']").empty();
            $("[name='" + DistrictControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + DistrictControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

function OUAT_GetDistrict(category, StateControl, DistrictControl) {
    //var SelIndex = $("[name='" + StateControl + "']").val(); //This Logic is commented to bind the Districts Directly from State, using a hard coded value of the State.
    var SelIndex = StateControl;

    if (SelIndex != "21" && false) {

        if (DistrictControl == "ctl00$ContentPlaceHolder1$Address1$ddlDistrict") {
            $('#txtDistrict').show();
            $('#txtBlock').show();
            $('#txtPanchayat').show();


            $('#PddlDistrict').hide();
            $('#PddlTaluka').hide();
            $('#PddlVillage').hide();

        }

        if (DistrictControl == "ctl00$ContentPlaceHolder1$Address2$ddlDistrict") {
            $('#CtxtDistrict').show();
            $('#CtxtTaluka').show();
            $('#CtxtVillage').show();


            $('#CddlDistrict').hide();
            $('#CddlTaluka').hide();
            $('#CddlVillage').hide();
        }


        return;
    } else if (false) {

        if (DistrictControl == "ctl00$ContentPlaceHolder1$Address1$ddlDistrict") {
            $('#txtDistrict').hide();
            $('#txtBlock').hide();
            $('#txtPanchayat').hide();


            $('#PddlDistrict').show();
            $('#PddlTaluka').show();
            $('#PddlVillage').show();

        }

        if (DistrictControl == "ctl00$ContentPlaceHolder1$Address2$ddlDistrict") {
            $('#CtxtDistrict').hide();
            $('#CtxtTaluka').hide();
            $('#CtxtVillage').hide();


            $('#CddlDistrict').show();
            $('#CddlTaluka').show();
            $('#CddlVillage').show();
        }

    }


    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/kiosk/OUAT/FormA.aspx/GetDistrict_OUAT',
        data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + DistrictControl + "']").empty();
            $("[name='" + DistrictControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + DistrictControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category 
 * @param {} DistrictControl 
 * @param {} TalukaControl 
 * @returns {} 
 */
function OUAT_GetSubDistrict(category, DistrictControl, TalukaControl) {
    debugger;
    var SelIndex = $("[name='" + DistrictControl + "']").val();
    //ResetControlsAsPerSubDistrict();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/kiosk/OUAT/FormA.aspx/GetSubDistrict_OUAT',
        data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + TalukaControl + "']").empty();
            $("[name='" + TalukaControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + TalukaControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("3." + a.responseText);
        }
    });

}
/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category 
 * @param {} TalukaControl 
 * @param {} VillageControl 
 * @returns {} 
 */
function OUAT_GetVillage(category, TalukaControl, VillageControl) {
    var SelIndex = $("[name='" + TalukaControl + "']").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/kiosk/OUAT/FormA.aspx/GetVillage_OUAT',
        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + VillageControl + "']").empty();
            $("[name='" + VillageControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + VillageControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}


/*
New Function to Bind the Page with Citizen Details for Editing the Profile.
*/
function BindProfileV2(JSONData, ProfileType) {

    var qs = getQueryStrings();

    if (JSONData != "") {
        //alert($("#HFUIDData").val());


        $("#divNonAadhar").hide();

        $("#divSearch").hide();
        $("#divBasicInfo").show();
        $("#divAddress").show();
        $("#divBtn").show();
        $("#ddlSearch").prop("disabled", true);
        $("#UID").prop("disabled", true);
        $("#btnSearch").prop("disabled", true);
        //$('#MobileNo').prop('disabled', true);
        $('#divSearch').hide();
        if (ProfileType == 1) {
            $("#fulPhoto").show();
        }
        else {
            $("#fulPhoto").hide();
        }


        var obj = jQuery.parseJSON(JSONData);

        if (obj["dateOfBirth"] != "") {
            var t_DOB = obj["dateOfBirth"];

            if (ProfileType == 1) {

                //var D1 = t_DOB.split('-');
                //var calday = D1[2];
                //var calmon = D1[1];
                //var calyear = D1[0];


                var D1 = t_DOB.split('/');
                var calday = D1[0];
                var calmon = D1[1];
                var calyear = D1[2];

                t_DOB = calday.toString() + "/" + calmon.toString() + "/" + calyear;

            }

            t_DOB = t_DOB.replace(/-/g, "/");
            $('#DOB').val(t_DOB);
            //$('#DOB').prop("disabled", true);


            var t_DOB = $("#DOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear(); // selected year

            //var Age = calage(S_date);
            //var Age = calage1(t_DOB);
            //$('#Age').val(Age);

            var Age = calcExSerDur(t_DOB, '31/12/2017');
            $('#Age').val(Age.years);

            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);

            $("#Year").prop("disabled", true);
            $("#Month").prop("disabled", true);
            $("#Day").prop("disabled", true);

        }

        if (ProfileType == 1) {
            if (obj["Image"] != null && obj["Image"] != "") {
                if (obj["Image"].indexOf('data:image/jpeg;base64,') !== -1) {
                    document.getElementById('myImg').setAttribute('src', obj["Image"]);
                }
                else {
                    document.getElementById('myImg').setAttribute('src', 'data:image/jpeg;base64,' + obj["Image"]);
                }

                EL("myImg").src = 'data:image/jpeg;base64,' + obj["Image"];
                EL("HFb64").value = 'data:image/jpeg;base64,' + obj["Image"];

            }
            else { $('#fulPhoto').show(); }
        }
        else {
            document.getElementById('myImg').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);

            EL("myImg").src = 'data:image/png;base64,' + obj["photo"];
            EL("HFb64").value = 'data:image/png;base64,' + obj["photo"];

        }



        if (obj["ImageSign"] != null && obj["ImageSign"] != "") {
            if (obj["ImageSign"].indexOf('data:image/jpeg;base64,') !== -1 || obj["ImageSign"].indexOf('data:image/png;base64,') !== -1) {
                document.getElementById('mySign').setAttribute('src', obj["ImageSign"]);
            } else {
                document.getElementById('mySign').setAttribute('src', 'data:image/jpeg;base64,' + obj["ImageSign"]);
            }

            EL("mySign").src = obj["ImageSign"];
            EL("HFb64Sign").value = obj["ImageSign"];

        }

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);

        //if (qs["ProfileID"] != null) {
        //    $("#UID").val(qs["ProfileID"]);
        //    //$('#ddlSearch').val("C");
        //    $('#UID').prop("disabled", true);

        //}
        //else {
        //    $("#UID").val(obj["aadhaarNumber"]);
        //    $('#UID').prop("disabled", true);
        //}

        $("#UID").val(obj["aadhaarNumber"]);
        $('#UID').prop("disabled", true);

        $("#FatherName").val(obj["careOf"]);
        if (obj["careOf"] != null) {
            //$('#FatherName').prop("disabled", true);
        }
        else { $('#FatherName').prop("disabled", false); }
        //obj["careOfLocal"];

        obj["district"];
        //obj["districtLocal"];
        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
                $('#ddlSalutation').val("1");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
                $('#ddlSalutation').val("2");
            }
            else {
                $('#ddlGender').val("T");
                $('#ddlSalutation').val("3");
            }
            //$('#ddlGender').prop("disabled", true);
        }

        /*
        2016-11-22: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.
        */
        if (obj["houseNumber"] != null && obj["houseNumber"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(obj["houseNumber"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").prop("disabled", true);
        }

        if (obj["postOffice"] != null && obj["postOffice"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(obj["postOffice"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").prop("disabled", true);
        }

        if (obj["street"] != null && obj["street"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(obj["street"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").prop("disabled", true);
        }

        if (obj["landmark"] != null && obj["landmark"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(obj["landmark"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").prop("disabled", true);
        }
        /*
        2016-11-22: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.
        */

        //obj["houseNumberLocal"];
        //obj["landmarkLocal"];
        //obj["language"];

        /*2016-12-20: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.*/
        if (obj["locality"] != null && obj["locality"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(obj["locality"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").prop("disabled", true);
        }

        //obj["localityLocal"];
        //obj["phone"];
        $('#phoneno').val(obj["phone"]);

        $('#MobileNo').val(obj["Mobile"]);
        if (obj["Mobile"] != null && obj["Mobile"] != "") {
            $('#MobileNo').val(obj["Mobile"]);
            $('#MobileNo').prop("disabled", true);
        }
        else { $('#MobileNo').prop("disabled", false); }

        if (obj["Mobile"] == null) {
            $('#MobileNo').val(obj["phone"]);
        }


        $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").prop("disabled", true);

        if (obj["state"] != "") {
            $('#txtState').val(obj["state"]);
            $('#txtState').prop("disabled", true);
        }
        $('#txtDistrict').val(obj["district"]);
        $('#txtBlock').val(obj["subDistrict"]);

        if (ProfileType == 1) {
            $('#txtPanchayat').val(obj["Village"]);
        }
        else {
            $('#txtPanchayat').val(obj["vtc"]);
        }
        $('#txtDistrict').prop("disabled", true);
        $('#txtBlock').prop("disabled", true);
        $('#txtPanchayat').prop("disabled", true);
        //alert(obj["aadhaarNumber"]);
        $("#ContentPlaceHolder1_HFProfileID").val(obj["aadhaarNumber"]);
        //alert($("#ContentPlaceHolder1_HFProfileID").val());
        //obj["pincodeLocal"];
        //obj["postOffice"];
        //obj["postOfficeLocal"];
        //obj["residentName"];
        //obj["residentNameLocal"];                

        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").prop('selected', false).filter(function () {
        //    return $(this).text() == obj["state"];
        //}).prop('selected', true);

        //// Now set dropdown selected option to the one as per State.                
        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").map(function () {
        //    if ($(this).text() == obj["state"]) return this;
        //}).attr('selected', 'selected');

        //selectByText(obj["state"]);



        obj["state"];
        //obj["stateLocal"];
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        //obj["streetLocal"];
        obj["subDistrict"];
        //obj["subDistrictLocal"];


        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(obj["phouseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(obj["ppostOffice"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(obj["plandmark"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(obj["plocality"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(obj["pstreet"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(obj["ppincode"]);

        //GetStateAsPerUID("", "", "", "");

        //$('#ddlState').val(obj["pstate"]),
        //$('#ddlDistrict').val(obj["pdistrict"]),
        //$('#ddlTaluka').val(obj["psubDistrict"]),
        //$('#ddlVillage').val(obj["pvillage"]),


        $("#MotherName").val(obj["MotherName"]);
        $("#txtTongue").val(obj["MotherTongue"]);
        $("#religion").val(obj["Religion"]);
        $("#category").val(obj["Category"]);

        //$("#MotherName").prop("disabled", true);
        $("#txtTongue").prop("disabled", true);
        $("#religion").prop("disabled", true);
        //$("#category").prop("disabled", true);

        $("#nationality").val(obj["Nationality"]);
        $("#nationality").prop("disabled", true);
        $("#txtAppID").val(obj["AppID"]);
        $("#txtAppID").prop("disabled", true);

        $("#txtTransNo").val(obj["TrnID"]);
        $("#txtTransNo").prop("disabled", true);

        $("#txtTransDate").val(obj["TransDate"]);
        $("#txtTransDate").prop("disabled", true);

        $("#txtRollNo").val(obj["RollNo"]);
        $("#txtRollNo").prop("disabled", true);

        if (ProfileType == 1) {
            GetStateAsPerUIDUsingCode(obj["statecode"], obj["districtcode"], obj["subDistrictcode"], obj["Villagecode"], 'PddlState', 'PddlDistrict', 'PddlTaluka', 'PddlVillage');
            GetStateAsPerUIDUsingCode(obj["statecode"], obj["districtcode"], obj["subDistrictcode"], obj["Villagecode"], 'CddlState', 'CddlDistrict', 'CddlTaluka', 'CddlVillage');

            //GetStateAsPerUIDUsingVAL(obj["pstate"], obj["pdistrict"], obj["psubDistrict"], obj["pvillage"]);
        }
        //else {
        //    GetStateAsPerUID(obj["state"], obj["district"], obj["subDistrict"], obj["vtc"]);
        //}

        //objState = obj["state"], objDistrict = obj["district"], objTaluka = obj["subDistrict"], objVillage = obj["vtc"];



        if (obj["Section1_PassOdia"] == "True") {

            //$("input[name='radio1']").prop('checked', true);
            //$("input[name='radio1']").val("yes");
            $("input[name='radio1'][value='yes']").prop("checked", true);

            $('#divResi').hide(500);
            $('#divLang').show(500);

            if (obj["Section1_AbililtyRead"] == "True") {
                $('#readOdiya').prop('checked', true);
            }

            if (obj["Section1_AbilityWrite"] == "True") {
                $('#writeOdiya').prop('checked', true);
            }

            if (obj["Section1_AbilitySpeak"] == "True") {
                $('#spkOdiya').prop('checked', true);
            }


        } else {
            //$("input[name='radio1']").val("no");
            $("input[name='radio1'][value='no']").prop("checked", true);

            $('#divResi').show(500);
            $('#divLang').hide(500);

            //$('#ddlResidence option:selected').text();

            $("#ddlResidence option").each(function () {
                if ($(this).text() == obj["ResidentType"]) {
                    $(this).attr('selected', 'selected');
                }
            });


        }

    }//end of UID Data


}

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

function GetStateAsPerUIDUsingCode(p_State, p_District, p_SubDistrict, p_Village, StateControl, DistControl, SubDistControl, VillageControl) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=" + StateControl + "]").empty();
                $("[id*=" + StateControl + "]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=" + StateControl + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByVal(StateControl, p_State);



                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id=" + DistControl + "]").empty();
                        $("[id=" + DistControl + "]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id=" + DistControl + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByVal(DistControl, p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);


                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id=" + SubDistControl + "]").empty();
                                    $("[id=" + SubDistControl + "]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id=" + SubDistControl + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByVal(SubDistControl, p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '../../Registration/KioskRegistration.aspx/GetVillage',
                                        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                        processData: false,
                                        dataType: "json",
                                        success: function (response) {
                                            var Category = eval(response.d);
                                            var html = "";
                                            var catCount = 0;
                                            $("[id=" + VillageControl + "]").empty();
                                            $("[id=" + VillageControl + "]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id=" + VillageControl + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByVal(VillageControl, p_Village);
                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }


                                    });



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

function GetStateAsPerUIDUsingVAL(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=ddlState]").empty();
                $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByVal("ddlState", p_State);



                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id=ddlDistrict]").empty();
                        $("[id=ddlDistrict]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByVal("ddlDistrict", p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);


                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id=ddlTaluka]").empty();
                                    $("[id=ddlTaluka]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByVal("ddlTaluka", p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '../../Registration/KioskRegistration.aspx/GetVillage',
                                        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                        processData: false,
                                        dataType: "json",
                                        success: function (response) {
                                            var Category = eval(response.d);
                                            var html = "";
                                            var catCount = 0;
                                            $("[id=ddlVillage]").empty();
                                            $("[id=ddlVillage]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByVal("ddlVillage", p_Village);
                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }


                                    });



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

function selectByVal(p_Control, txt) {

    var t_Value = txt;

    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    return t_Value;
}

function GetStateV2OdishaDefault(category, StateControl) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Registration/KioskRegistration.aspx/GetState',
        data: '{"prefix": ""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            //$("[id*=ddlState]").empty();
            //$("[id*=ddlState]").append('<option value = "0">-Select-</option>');
            //$.each(arr, function () {
            //    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            //    //console.log(this.Id + ',' + this.Name);
            //});

            $("[name='" + StateControl + "']").empty();
            $("[name='" + StateControl + "']").append('<option value = "0">-Select-</option>');
            $.each(arr, function () {
                $("[name='" + StateControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                //catCount++;
            });

            $("[name='" + StateControl + "']").val(21);

            var EdBoard = "ddlBoard";
            $('#ddlBoard').prop("disabled", false);
            //GetEducationBoard("", 21, EdBoard);

        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });
}

var objState = "", objDistrict = "", objTaluka = "", objVillage = "";

function fnCopyAddress(chkAddress) {
    debugger;
    var text = "";
    var opt = "";
    if (chkAddress) {


        var State = $("#PddlState option:selected").text();
        var District = $("#PddlDistrict option:selected").text();
        var Taluka = $("#PddlTaluka option:selected").text();
        var Village = $("#PddlVillage option:selected").text();
        var Pincode = $("#PPinCode");

        if ($("#HFUIDData").val() == "") {// 2016-11-08 Logic altered to skip validating these details when user has fetched the details from Aadhaar.

            if ($('#PAddressLine1').val() == "" || $("#PRoadStreetName").val() == "" || $("#PLocality").val() == "") {
                text += "<br /> -Can not copy the Permanent Address to Present Address (For correspondence) as Permanent Address is blank";
                opt = 1;
            }


            if (State != null && (State == '' || State == '-Select-')) {
                text += "<br /> -Please select State in Permanent Address.";
                opt = 1;
            }

            if (District != null && (District == '' || District == '-Select-' || District == 'Select District')) {
                text += "<br /> -Please select District in Permanent Address.";
                opt = 1;
            }

            if (Taluka != null && (Taluka == '' || Taluka == '-Select-' || Taluka == 'Select Block')) {
                text += "<br /> -Please select Taluka in Permanent Address.";
                opt = 1;
            }

            if (Village != null && (Village == '' || Village == '-Select-' || Village == 'Select Panchayat')) {
                text += "<br /> -Please select Village in Permanent Address.";
                opt = 1;
            }


            if (Pincode != null && Pincode.val() == '') {
                text += "<br /> -Please enter Pincode in Permanent Address.";
                opt = 1;
            }
        }

        if (opt == "1") {
            alertPopup("Please fill following information.", text);
            chkAddress.checked = false;

            //alert(text);
            return false;
        }

        var objState = "PddlState";
        var objDistrict = "PddlDistrict";
        var objTaluka = "PddlTaluka";
        var objVillage = "PddlVillage";

        GetStateUID($("#" + objState).val(), $("#" + objDistrict).val(), $("#" + objTaluka).val(), $("#" + objVillage).val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val($("#PAddressLine1").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val($("#PAddressLine2").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val($("#PRoadStreetName").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val($("#PLandMark").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val($("#PLocality").val());
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val($("#PPinCode").val());
    }
    else {
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val("");
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val("");

        var AddState = "CddlState";
        var AddDistrict = "CddlDistrict";
        var AddTaluka = "CddlTaluka";
        var AddVillage = "CddlVillage";

        GetStateV2("", AddState);
        $("[id*=" + AddState + "]").val("0");


        $("[id*=" + AddDistrict + "]").empty();
        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');

        $("[id*=" + AddTaluka + "]").empty();
        $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');

        $("[id*=" + AddVillage + "]").empty();
        $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
    }
}

//function calculatepercentage(TotalMarks, MarksObtained) {

//    if (TotalMarks == "") return;
//    if (MarksObtained == "") return;

//    if (TotalMarks < MarksObtained) {
//        alert("Total Marks must be greater than Marks Obtained");
//        //$('#txtTotalMarks').val("");
//        $('#txtMarkSecure').val("");
//        $("#txtPercentage").val("");

//        return;
//    }

//    if (TotalMarks <= 0) TotalMarks = 1;

//    var result = (MarksObtained / TotalMarks) * 100;

//    $("#txtPercentage").val(result);

//}


function isNumberKeyDecimal(e) {
    var code = (code ? code : e.which);
    if (code != 46 && code > 31 && (code < 48 || code > 57))
        return false;
        //if it is (.)
    else if (code == 46) {
        var Value = $('#txtTotalMarks').val();//this.value;
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

function calculatepercentage(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;

    var result = 0;

    if ($("#ddlPctgeCalclte").val() == "501") {
        //(8.3 - 0.5) * 10

        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("CGPA cannot be less than 3.5");
            $('#txtTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid CGPA");
            $('#txtTotalMarks').val("");
            return;
        }

        //result = (TotalMarks - 0.5) * 10;
        result = ((TotalMarks) * 9.5).toFixed(2);
    }
    else {

        if (MarksObtained == "") return;

        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");

            return;
        }

        if (TotalMarks <= 0) TotalMarks = 1;

        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

    }


    $("#txtPercentage").val(result);

}

function calculatepercentageXII(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;

    var result = 0;

    if ($("#ddlPctgeCalclte2").val() == "501") {
        //(8.3 - 0.5) * 10

        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("CGPA cannot be less than 3.5");
            $('#txtTotalMarks2').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid CGPA");
            $('#txtTotalMarks2').val("");
            return;
        }

        //result = (TotalMarks - 0.5) * 10;
        result = ((TotalMarks) * 9.5).toFixed(2);
    }
    else {

        if (MarksObtained == "") return;

        var Category = $("#category option:selected").text();

        var Physicallyhandicaped = 0;
        if ($('#CheckBoxList1_1').is(":checked")) {
            // it is checked
            Physicallyhandicaped = 1;
        }


        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#txtTotalMarks2').val("");
            $('#txtMarkSecure2').val("");
            $("#txtPercentage2").val("");

            return;
        }

        if (TotalMarks <= 0) TotalMarks = 1;

        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

        if (Category == "SC" || Category == "ST") {
            if (result < 40) {
                alert("Minimum Percentage is 40 %");
                $('#txtTotalMarks2').val("");
                $('#txtMarkSecure2').val("");
                $("#txtPercentage2").val("");
                result = 0;
            }
        } else if (Physicallyhandicaped == 1) {
            if (result < 40) {
                alert("Minimum Percentage is 40 %");
                $('#txtTotalMarks2').val("");
                $('#txtMarkSecure2').val("");
                $("#txtPercentage2").val("");
                result = 0;
            }
        } else if (Category == "General") {
            if (result < 50) {
                alert("Minimum Percentage is 50 %");
                $('#txtTotalMarks2').val("");
                $('#txtMarkSecure2').val("");
                $("#txtPercentage2").val("");
                result = 0;
            }
        }


    }


    $("#txtPercentage2").val(result);

}

function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile() {
    debugger;

    if (this.files && this.files[0]) {
        //if (this.files[0].size > '5000') { alert('The Applicant Phograph size should be less than 5000 Bytes.'); return false; }
        //var imgType = this.files[0].type;
        //if (imgType != 'jpg' || imgType != 'jpeg') { alert('The Applicant Phograph image type should be .jpeg or .jpg'); return false; }


        //var PhotoUpload1 = $("#myImg");

        //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
        //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

        //if (Photoarray.indexOf(Extension) <= -1) {
        //    alert("Photo must be in JPEG / PNG form.");
        //    return false;
        //}

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
                //if (ftype.files && ftype.files[0]) {
                //    var reader = new FileReader();
                //    reader.onload = function (e) {
                //        $('#File1').attr('src', e.target.result)

                //    }
                //    reader.readAsDataURL(ftype.files[0]);
                //}
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


            //var img = new Image;
            //img.onload = function () {
            //    var width = img.width;
            //    var height = img.height;
            //    var aspratio = parseInt(height) / parseInt(width);
            //    //if (width != 160) {
            //    //    //$('#imgupload').attr('src', null);
            //    //    alert('The width of the photograph should be 160 pixels.');
            //    //}
            //    //if (aspratio < 1.25 || aspratio > 1.33) {
            //    //    //$('#imgupload').attr('src', null);
            //    //    alert('The height of the photograph should fall between 200 to 212 pixels.');
            //    //}

            //};
            //img.src = FR.result;




        };
        FR.readAsDataURL(this.files[0]);
    }
}

function readFile2() {
    debugger;

    if (this.files && this.files[0]) {
        //if (this.files[0].size > '5000') { alert('The Applicant Phograph size should be less than 5000 Bytes.'); return false; }
        //var imgType = this.files[0].type;
        //if (imgType != 'jpg' || imgType != 'jpeg') { alert('The Applicant Phograph image type should be .jpeg or .jpg'); return false; }


        //var PhotoUpload1 = $("#myImg");

        //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
        //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

        //if (Photoarray.indexOf(Extension) <= -1) {
        //    alert("Photo must be in JPEG / PNG form.");
        //    return false;
        //}

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
                //if (ftype.files && ftype.files[0]) {
                //    var reader = new FileReader();
                //    reader.onload = function (e) {
                //        $('#File1').attr('src', e.target.result)

                //    }
                //    reader.readAsDataURL(ftype.files[0]);
                //}
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


            //var img = new Image;
            //img.onload = function () {
            //    var width = img.width;
            //    var height = img.height;
            //    var aspratio = parseInt(height) / parseInt(width);
            //    //if (width != 160) {
            //    //    //$('#imgupload').attr('src', null);
            //    //    alert('The width of the photograph should be 160 pixels.');
            //    //}
            //    //if (aspratio < 1.25 || aspratio > 1.33) {
            //    //    //$('#imgupload').attr('src', null);
            //    //    alert('The height of the photograph should fall between 200 to 212 pixels.');
            //    //}

            //};
            //img.src = FR.result;




        };
        FR.readAsDataURL(this.files[0]);
    }
}

function GetStateOdishaV2(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        var AddState = "ddlState";
        var AddDistrict = "ddlDistrict";
        var AddTaluka = "ddlTaluka";
        var AddVillage = "ddlVillage";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
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
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByTextAddress(AddState, "ODISHA");



                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
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
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByTextAddress(AddDistrict, p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);


                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
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
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByTextAddress(AddTaluka, p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '../../Registration/KioskRegistration.aspx/GetVillage',
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
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByTextAddress(AddVillage, p_Village);
                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }


                                    });



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

function selectByTextAddress(p_Control, txt) {
    //$("[id*=ddlState] option")
    //.filter(function () { return $.trim($(this).text()) == txt; })
    //.attr('selected', true);

    var t_Value = "";

    $("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
        //return $(this).text().toLowerCase() == txt.toLowerCase();
        if ($(this).text().toLowerCase() == txt.toLowerCase()) {
            t_Value = $(this).val();
            return t_Value;
        }
    }).prop('selected', true);

    //alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    //$("[id*=" + p_Control + "] option").each(function () {
    //    if ($(this).text() == theText) {
    //        //$(this).attr('selected', 'selected');
    //        t_Value = $(this).val();
    //    }
    //});

    //$("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}

//var objState = "", objDistrict = "", objTaluka = "", objVillage = "";

function fnCopyAddress1111() {
    if (chkAddress.checked) {
        if ($('#PAddressLine1').val() == "") {
            alert("Can not copy the Permanent Address to Present Address (For correspondence) as Permanent Address is blank");
            chkAddress.checked = false;
            return false;
        }

        if ($('#txtState').val() != "") {
            var objState = $("#txtState").val();
            var objDistrict = $("#txtDistrict").val();
            var objTaluka = $("#txtBlock").val();
            var objVillage = $("#txtPanchayat").val();

            GetStateAsPerUID(objState, objDistrict, objTaluka, objVillage);
            $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val($("#ContentPlaceHolder1_Address1_AddressLine1").val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val($("#ContentPlaceHolder1_Address1_AddressLine2").val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val($("#ContentPlaceHolder1_Address1_RoadStreetName").val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val($("#ContentPlaceHolder1_Address1_LandMark").val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val($("#ContentPlaceHolder1_Address1_Locality").val());
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
            $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val($("#ContentPlaceHolder1_Address1_PinCode").val());
        }
        if ($('#ddlState').val() != "0") {
            var objState = "ContentPlaceHolder1_Address1_ddlState";
            var objDistrict = "ContentPlaceHolder1_Address1_ddlDistrict";
            var objTaluka = "ContentPlaceHolder1_Address1_ddlTaluka";
            var objVillage = "ContentPlaceHolder1_Address1_ddlVillage";

            GetStateUID($("#" + objState).val(), $("#" + objDistrict).val(), $("#" + objTaluka).val(), $("#" + objVillage).val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val($("#ContentPlaceHolder1_Address1_AddressLine1").val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val($("#ContentPlaceHolder1_Address1_AddressLine2").val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val($("#ContentPlaceHolder1_Address1_RoadStreetName").val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val($("#ContentPlaceHolder1_Address1_LandMark").val());
            $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val($("#ContentPlaceHolder1_Address1_Locality").val());
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
            $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val($("#ContentPlaceHolder1_Address1_PinCode").val());
        }
    }
    else {
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val("");
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val("");

        var AddState = "ContentPlaceHolder1_Address2_ddlState";
        var AddDistrict = "ContentPlaceHolder1_Address2_ddlDistrict";
        var AddTaluka = "ContentPlaceHolder1_Address2_ddlTaluka";
        var AddVillage = "ContentPlaceHolder1_Address2_ddlVillage";

        GetStateV2("", AddState);
        $("[id*=" + AddState + "]").val("0");


        $("[id*=" + AddDistrict + "]").empty();
        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');

        $("[id*=" + AddTaluka + "]").empty();
        $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');

        $("[id*=" + AddVillage + "]").empty();
        $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
    }
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
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
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
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByTextCitizen(AddState, p_State);



                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
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
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByTextCitizen(AddDistrict, p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);


                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
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
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByTextCitizen(AddTaluka, p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    if (SelIndex != null && SelIndex != "") {
                                        $.ajax({
                                            type: "POST",
                                            contentType: "application/json; charset=utf-8",
                                            url: '../../Registration/KioskRegistration.aspx/GetVillage',
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
                                                    //console.log(this.Id + ',' + this.Name);
                                                    catCount++;
                                                });

                                                t_VillageVal = selectByTextCitizen(AddVillage, p_Village);
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

function selectByTextCitizen(p_Control, txt) {
    debugger;
    //$("[id*=ddlState] option")
    //.filter(function () { return $.trim($(this).text()) == txt; })
    //.attr('selected', true);

    //var t_Value = $("#" + txt + "").val();
    var t_Value = txt;
    //$("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
    //    //return $(this).text().toLowerCase() == txt.toLowerCase();
    //    if ($(this).val().toLowerCase() == txt.toLowerCase()) {
    //        t_Value = $(this).val();
    //        return t_Value;
    //    }
    //}).prop('selected', true);

    //alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    //$("[id*=" + p_Control + "] option").each(function () {
    //    if ($(this).text() == theText) {
    //        //$(this).attr('selected', 'selected');
    //        t_Value = $(this).val();
    //    }
    //});

    //$("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}


function ValidateForm() {
    debugger;
    var text = "";
    var opt = "";

    /// Basic Information 

    var TransNo = $("#txtTransNo");
    var TransDate = $("#txtTransDate");
    var FirstName = $("#FirstName");
    var LastName = $("#LastName");
    var MotherName = $("#MotherName");
    var FatherName = $("#FatherName");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Gender = $("#ddlGender option:selected").text();
    var Religion = $("#religion option:selected").text();
    var Category = $("#category option:selected").text();
    var Tongue = $("#txtTongue option:selected").text();
    var Nationality = $("#nationality option:selected").text();
    var MobileNo = $("#MobileNo");

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
    //CoPrententPlaceHolder1_Address1_ddlState
    var PreState = $("#CddlState option:selected").text();
    var PreDistrict = $("#CddlDistrict option:selected").text();
    var PreTaluka = $("#CddlTaluka option:selected").text();
    var PreVillage = $("#CddlVillage option:selected").text();
    var PrePincode = $("#CPinCode");
    var Acquitted = $('#ddlAcquitted option:selected').val();
    var GovtMessage = 0;


    if (EL("myImg").src.indexOf("photo.png") != -1) {
        text += "<br /> -Please upload Applicant Photograph.";
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
        text += "<br /> -Please upload Applicant Signature.";
        $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
        $('#mySign').css({ "background-color": "#fff2ee" });
        $('#mySign').css({ "height": "130px" });
        opt = 1;
    } else {
        $('#mySign').attr('style', '');
        $('#mySign').css({ "background-color": "" });
        $('#mySign').css({ "height": "130px" });
    }
    //Basic Deatil

    if (TransNo.val() == '') {
        text += "<br /> -Please Enter TransNo ";
        TransNo.attr('style', 'border:1px solid #d03100 !important;');
        TransNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        TransNo.attr('style', '1px solid #cdcdcd !important;');
        TransNo.css({ "background-color": "#ffffff" });
    }
    if (TransDate.val() == '') {
        text += "<br /> -Please Enter TransDate. ";
        TransDate.attr('style', 'border:1px solid #d03100 !important;');
        TransDate.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        TransDate.attr('style', '1px solid #cdcdcd !important;');
        TransDate.css({ "background-color": "#ffffff" });
    }


    if (FirstName.val() == '') {
        text += "<br /> -Please enter First Name. ";
        FirstName.attr('style', 'border:1px solid #d03100 !important;');
        FirstName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FirstName.attr('style', '1px solid #cdcdcd !important;');
        FirstName.css({ "background-color": "#ffffff" });
    }

    if (MotherName.val() == '') {
        text += "<br /> -Please enter Mother Name ";
        MotherName.attr('style', 'border:1px solid #d03100 !important;');
        MotherName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        MotherName.attr('style', 'border:1px solid #cdcdcd !important;');
        MotherName.css({ "background-color": "#ffffff" });
    }

    if (FatherName.val() == '') {
        text += "<br /> -Please enter Father Name. ";
        FatherName.attr('style', 'border:1px solid #d03100 !important;');
        FatherName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FatherName.attr('style', 'border:1px solid #cdcdcd !important;');
        FatherName.css({ "background-color": "#ffffff" });
    }
    if (MobileNo.val() == '') {
        text += "<br /> -Please enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        MobileNo.css({ "background-color": "#ffffff" });
    }

    if (MobileNo.val() != '') {
        var mobmatch1 = /^[789]\d{9}$/;
        if (!mobmatch1.test(MobileNo.val())) {
            text += "<br /> -Please enter valid mobile Number.";
            MobileNo.attr('style', 'border:1px solid #d03100 !important;');
            MobileNo.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
            MobileNo.css({ "background-color": "#ffffff" });
        }
    }

    var EmailID = $('#EmailID');
    if (EmailID.val() != '') {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val())) {
            text += "<br /> - Please enter valid EmailID";
            EmailID.attr('style', 'border:1px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }
    else {
        EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
        EmailID.css({ "background-color": "#ffffff" });
    }

    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");

    if (DOB.val() == '') {
        text += "<br /> -Please enter Date of Birth. ";
        DOB.attr('style', 'border:1px solid #d03100 !important;');
        DOB.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }
    if (AgeYear.val() == '') {
        text += "<br /> -Please Enter year in  Date of Birth. ";
        AgeYear.attr('style', 'border:1px solid #d03100 !important;');
        AgeYear.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AgeYear.attr('style', 'border:1px solid #cdcdcd !important;');
        AgeYear.css({ "background-color": "#ffffff" });
    }
    if (AgeMonth.val() == '') {
        text += "<br /> -Please Enter Month in  Date of Birth. ";
        AgeMonth.attr('style', 'border:1px solid #d03100 !important;');
        AgeMonth.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AgeMonth.attr('style', 'border:1px solid #cdcdcd !important;');
        AgeMonth.css({ "background-color": "#ffffff" });
    }
    if (AgeDay.val() == '') {
        text += "<br /> -Please Enter Day in  Date of Birth. ";
        AgeDay.attr('style', 'border:1px solid #d03100 !important;');
        AgeDay.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AgeDay.attr('style', 'border:1px solid #cdcdcd !important;');
        AgeDay.css({ "background-color": "#ffffff" });
    }

    if ((Gender == '' || Gender == 'Select Gender')) {
        text += "<br /> -Please Select Gender. ";
        $('#ddlGender').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlGender').css({ "background-color": "#fff2ee" });
        opt = 1;

    } else {
        $('#ddlGender').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlGender').css({ "background-color": "#ffffff" });
    }

    if ((Religion == '' || Religion == 'Select')) {
        text += "<br /> -Please Select Religion. ";
        $("#religion").attr('style', 'border:1px solid #d03100 !important;');
        $("#religion").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#religion").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#religion").css({ "background-color": "#ffffff" });
    }

    if ((Category == '' || Category == '-Select-' || Category == 'Select')) {
        text += "<br /> -Please Select Category. ";
        $("#category").attr('style', 'border:1px solid #d03100 !important;');
        $("#category").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#category").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#category").css({ "background-color": "#ffffff" });
    }

    if (AddressLine1 != null && AddressLine1.val() == '') {
        text += "<br /> -Please enter Care of Address in Permanent Address. ";
        AddressLine1.attr('style', 'border:1px solid #d03100 !important;');
        AddressLine1.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
        AddressLine1.css({ "background-color": "#ffffff" });
    }

    if (RoadStreetName != null && RoadStreetName.val() == '') {
        text += "<br /> -Please enter Road /Street Name in Present Address. ";
        RoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        RoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        RoadStreetName.css({ "background-color": "#ffffff" });
    }

    if (Locality != null && Locality.val() == '') {
        text += "<br /> -Please enter Locality in Present Address. ";
        Locality.attr('style', 'border:1px solid #d03100 !important;');
        Locality.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Locality.attr('style', 'border:1px solid #cdcdcd !important;');
        Locality.css({ "background-color": "#ffffff" });
    }

    if ($("#HFUIDData").val() == "") {// 2016-11-08 Logic altered to skip validating these details when user has fetched the details from Aadhaar.
        if (State != null && (State == '' || State == '-Select-')) {
            text += "<br /> -Please select State in Permanent Address.";
            $('#PddlState').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlState').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlState').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlState').css({ "background-color": "#ffffff" });
        }

        if (District != null && (District == '' || District == '-Select-' || District == 'Select District')) {
            text += "<br /> -Please select District in Permanent Address.";
            $('#PddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlDistrict').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlDistrict').css({ "background-color": "#ffffff" });
        }

        if (Taluka != null && (Taluka == '' || Taluka == '-Select-' || Taluka == 'Select Block')) {
            text += "<br /> -Please select Taluka in Permanent Address.";
            $('#PddlTaluka').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlTaluka').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlTaluka').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlTaluka').css({ "background-color": "#ffffff" });
        }

        if (Village != null && (Village == '' || Village == '-Select-' || Village == 'Select Panchayat')) {
            text += "<br /> -Please select Village in Permanent Address.";
            $('#PddlVillage').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlVillage').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlVillage').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlVillage').css({ "background-color": "#ffffff" });
        }
    }

    if (Pincode != null && Pincode.val() == '') {
        text += "<br /> -Please enter Pincode in Permanent Address.";
        $('#PPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#PPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PPinCode').css({ "background-color": "#ffffff" });
    }
    /////////////////////////
    if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
        text += "<br /> -Please enter Care of Address in Present Address. ";
        PreAddressLine1.attr('style', 'border:1px solid #d03100 !important;');
        PreAddressLine1.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreAddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
        PreAddressLine1.css({ "background-color": "#ffffff" });
    }

    if (PreRoadStreetName != null && PreRoadStreetName.val() == '') {
        text += "<br /> -Please enter Care of Address in Present Address. ";
        PreRoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        PreRoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreRoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        PreRoadStreetName.css({ "background-color": "#ffffff" });
    }

    if (PreLocality != null && PreLocality.val() == '') {
        text += "<br /> -Please enter Locality in Present Address. ";
        PreLocality.attr('style', 'border:1px solid #d03100 !important;');
        PreLocality.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreLocality.attr('style', 'border:1px solid #cdcdcd !important;');
        PreLocality.css({ "background-color": "#ffffff" });
    }
    if (PreState != null && (PreState == '' || PreState == '-Select-')) {
        text += "<br /> -Please select State in Present Address.";
        $('#CddlState').attr('style', 'border:1px solid #d03100 !important;');
        $('#CddlState').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CddlState').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CddlState').css({ "background-color": "#ffffff" });
    }

    if (PreDistrict != null && (PreDistrict == '' || PreDistrict == '-Select-' || PreDistrict == 'Select District')) {
        text += "<br /> -Please select District in Present Address.";
        $('#CddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
        $('#CddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CddlDistrict').css({ "background-color": "#ffffff" });
    }

    if (PreTaluka != null && (PreTaluka == '' || PreTaluka == '-Select-' || PreTaluka == 'Select Block')) {
        text += "<br /> -Please select Taluka in Present Address.";
        $('#CddlTaluka').attr('style', 'border:1px solid #d03100 !important;');
        $('#CddlTaluka').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CddlTaluka').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CddlTaluka').css({ "background-color": "#ffffff" });
    }

    if (PreVillage != null && (PreVillage == '' || PreVillage == '-Select-' || PreVillage == 'Select Panchayat')) {
        text += "<br /> -Please select Village in Present Address.";
        $('#CddlVillage').attr('style', 'border:1px solid #d03100 !important;');
        $('#CddlVillage').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CddlVillage').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CddlVillage').css({ "background-color": "#ffffff" });
    }
    if (PrePincode != null && PrePincode.val() == '') {
        text += "<br /> -Please enter Pincode in Present Address.";
        $('#CPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#CPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CPinCode').css({ "background-color": "#ffffff" });
    }
    /////////////////////////
    var pinmatch = /^[0-9]\d{5}$/;
    if (Pincode != null && Pincode.val() != '') {
        if (!pinmatch.test(Pincode.val())) {
            text += "<br /> -Please enter valid pincode.";
            $('#CPinCode').attr('style', 'border:1px solid #d03100 !important;');
            $('#CPinCode').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#CPinCode').css({ "background-color": "#ffffff" });
        }
    }

    //Reservation quota Detail

    var Reservation = $("input[name='reserved']:checked").val();

    if (Reservation == null || Reservation == "undefined") {
        text += "<br /> - Please Choose Reservation quota";
        opt = 1;
    } else {

    }


    var GreenCardHolder = 0;
    if ($('#CheckBoxList1_0').is(":checked")) {
        // it is checked
        GreenCardHolder = 1;
    }

    var Physicallyhandicaped = 0;
    var PhysicallyhandicapedPercent = 0;
    if ($('#CheckBoxList1_1').is(":checked")) {
        // it is checked
        Physicallyhandicaped = 1;
    }

    var NRISponsershipChk = 0;
    if ($('#CheckBoxList1_2').is(":checked")) {
        // it is checked
        NRISponsershipChk = 1;
    }
    var WesterOdisha = 0;
    if ($('#CheckBoxList1_3').is(":checked")) {
        // it is checked
        WesterOdisha = 1;
    }
    var OUATEmployeeChk = 0;
    if ($('#CheckBoxList1_4').is(":checked")) {
        // it is checked
        OUATEmployeeChk = 1;
    }
    var KashmirmigrantChk = 0;
    if ($('#CheckBoxList1_5').is(":checked")) {
        // it is checked
        KashmirmigrantChk = 1;
    }
    var PhysicalHandicap = $("input[id='CheckBoxList1_1']:checked").val();
    var NRISponsership = $("input[id='CheckBoxList1_2']:checked").val();
    var westernodisha = $("input[id='CheckBoxList1_3']:checked").val();
    var Ouatemployee = $("input[id='CheckBoxList1_4']:checked").val();
    var kashmirmigrant = $("input[id='CheckBoxList1_5']:checked").val();

    var HandicappedPart = $("#txtHandicappedPart").val();
    var HandiPercent = $("#txtHandiPercent").val();
    /*
        var txtSponsor = $("#txtSponsor").val();
        var ddlSponsorRelation = $("#ddlSponsorRelation option:selected").text();
        var txtSponsorEmail = $("#txtSponsorEmail").val();
        var txtSponsorMobile = $("#txtSponsorMobile").val();
        var txtNRIAddressIndia = $("#txtNRIAddressIndia").val();
        var txtNRIAddressAbroad = $("#txtNRIAddressAbroad").val();
    */
    var ddlWesternDistrict = $("#ddlWesternDistrict option:selected").text();

    var ddlServiceStatus = $("#ddlServiceStatus option:selected").text();
    var ddlEmpRelation = $("#ddlEmpRelation option:selected").text();

    var txtEmployeeName = $("#txtEmployeeName").val();
    var txtEmpCode = $("#txtEmpCode").val();
    var txtDesignation = $("#txtDesignation").val();
    var txtOffice = $("#txtOffice").val();
    var txtKMFrom = $("#txtKMFrom").val();
    var txtKMTo = $("#txtKMTo").val();



    if (Reservation == "yes") {

        var tempCondition = true;

        if (GreenCardHolder == 1) {
            tempCondition = false;
        }
        else if (Physicallyhandicaped == 1) {
            tempCondition = false;
        }
        else if (NRISponsershipChk == 1) {
            tempCondition = false;
        }
        else if (WesterOdisha == 1) {
            tempCondition = false;
        }
        else if (OUATEmployeeChk == 1) {
            tempCondition = false;
        }
        else if (KashmirmigrantChk == 1) {
            tempCondition = false;
        }

        //if (GreenCardHolder == 0 || Physicallyhandicaped == 0 || NRISponsership == 0 || WesterOdisha == 0 || OUATEmployee == 0 || Kashmirmigrant == 0) {
        if (tempCondition) {
            text += "<br /> - Reservation Quota Notification,Claim for Reservation Seat please choose Category of claim Reservation Seat ";
            opt = 1;

        }


        if (PhysicalHandicap == '203') {

            var HandicapType = $("input[name='HandicapType']:checked").val();

            if (HandicapType == null || HandicapType == "") {
                text += "<br /> - Please choose Physical Handicap Type ";
                opt = 1;
            }

            if (HandicappedPart == null || HandicappedPart == "") {
                text += "<br /> -Please Enter Handicapped Body Part ";
                $('#txtHandicappedPart').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtHandicappedPart').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtHandicappedPart').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtHandicappedPart').css({ "background-color": "#ffffff" });
            }

            if (HandicapType != null && HandicapType != "" && HandicapType == "T") {

                if (HandiPercent == null || HandiPercent == "") {
                    text += "<br /> -Please Enter  Percentage Handicapped Body Percentage ";
                    $('#txtHandiPercent').attr('style', 'border:1px solid #d03100 !important;');
                    $('#txtHandiPercent').css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#txtHandiPercent').css({ "background-color": "#ffffff" });
                }

                if (HandiPercent < 40) {
                    text += "<br /> -Percentage for Handicapped Body Part must be greater than 40 %";
                    $('#txtHandiPercent').attr('style', 'border:1px solid #d03100 !important;');
                    $('#txtHandiPercent').css({ "background-color": "#fff2ee" });
                } else {
                    $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#txtHandiPercent').css({ "background-color": "#ffffff" });
                }
            } else if (HandicapType != null && HandicapType != "" && HandicapType == "P") {
                $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtHandiPercent').css({ "background-color": "#ffffff" });
            }


        }

        /*
                if (NRISponsership == '204') {
                    if (txtSponsor == null || txtSponsor == "") {
                        text += "<br /> -Please Enter Name of the Sponser person";
                        $('#txtSponsor').attr('style', 'border:1px solid #d03100 !important;');
                        $('#txtSponsor').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#txtSponsor').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#txtSponsor').css({ "background-color": "#ffffff" });
                    }
        
                    if (ddlSponsorRelation != null && (ddlSponsorRelation == '--Select--' || ddlSponsorRelation == '0')) {
                        text += "<br /> -Please select Year of Passing in Educational Qualification.";
                        $('#ddlSponsorRelation').attr('style', 'border:1px solid #d03100 !important;');
                        $('#ddlSponsorRelation').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $('#ddlSponsorRelation').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#ddlSponsorRelation').css({ "background-color": "#ffffff" });
                    }
                    if (txtSponsorEmail == null || txtSponsorEmail == "") {
                        text += "<br /> -Please Enter Email of the Sponser person";
                        $('#txtSponsorEmail').attr('style', 'border:1px solid #d03100 !important;');
                        $('#txtSponsorEmail').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#txtSponsorEmail').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#txtSponsorEmail').css({ "background-color": "#ffffff" });
                    }
        
                    if (txtSponsorMobile == null || txtSponsorMobile == "") {
                        text += "<br /> -Please Enter Mobile no. of the Sponser person";
                        $('#txtSponsorMobile').attr('style', 'border:1px solid #d03100 !important;');
                        $('#txtSponsorMobile').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#txtSponsorMobile').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#txtSponsorMobile').css({ "background-color": "#ffffff" });
                    }
                    if (txtNRIAddressIndia == null || txtNRIAddressIndia == "") {
                        text += "<br /> -Please Enter complete NRI permanent Address  in india";
                        $('#txtNRIAddressIndia').attr('style', 'border:1px solid #d03100 !important;');
                        $('#txtNRIAddressIndia').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#txtNRIAddressIndia').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#txtNRIAddressIndia').css({ "background-color": "#ffffff" });
                    }
                    if (txtNRIAddressAbroad == null || txtNRIAddressAbroad == "") {
                        text += "<br /> -Please Enter complete NRI Present  Address in Abroad "
                        $('#txtNRIAddressAbroad').attr('style', 'border:1px solid #d03100 !important;');
                        $('#txtNRIAddressAbroad').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#txtNRIAddressAbroad').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#txtNRIAddressAbroad').css({ "background-color": "#ffffff" });
                    }
                }
        */
        if (westernodisha == '206') {
            if (ddlWesternDistrict != null && (ddlWesternDistrict == '--Select Western Odisha District--' || ddlWesternDistrict == '0')) {
                text += "<br /> -Please select Year of Passing in Educational Qualification.";
                $('#ddlWesternDistrict').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlWesternDistrict').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ddlWesternDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ddlWesternDistrict').css({ "background-color": "#ffffff" });
            }
        }
        /*
        if (Ouatemployee == '207') {

            if (txtEmployeeName == null || txtEmployeeName == "") {
                text += "<br /> -Please Enter Name of Employee ";
                $('#txtEmployeeName').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtEmployeeName').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtEmployeeName').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtEmployeeName').css({ "background-color": "#ffffff" });
            }

            if (txtEmpCode == null || txtEmpCode == "") {
                text += "<br /> -Please Enter Employee Code ";
                $('#txtEmpCode').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtEmpCode').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtEmpCode').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtEmpCode').css({ "background-color": "#ffffff" });
            }

            if (txtDesignation == null || txtDesignation == "") {
                text += "<br /> -Please Enter Employee Destination ";
                $('#txtDesignation').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtDesignation').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtDesignation').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtDesignation').css({ "background-color": "#ffffff" });
            }

            if (ddlServiceStatus != null && (ddlServiceStatus == '--Select--' || ddlServiceStatus == '0')) {
                text += "<br /> -Please select Status of service";
                $('#ddlServiceStatus').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlServiceStatus').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ddlServiceStatus').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ddlServiceStatus').css({ "background-color": "#ffffff" });
            }

            if (txtOffice == null || txtOffice == "") {
                text += "<br /> -Please Enter Name of the office ";
                $('#txtOffice').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtOffice').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtOffice').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtOffice').css({ "background-color": "#ffffff" });
            }

            if (ddlEmpRelation != null && (ddlEmpRelation == '--Select--' || ddlEmpRelation == '0')) {
                text += "<br /> -Please select   Relationship with Candidate";
                $('#ddlEmpRelation').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlEmpRelation').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ddlEmpRelation').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ddlEmpRelation').css({ "background-color": "#ffffff" });
            }
        }*/

        if (kashmirmigrant == '209') {

            if (txtKMFrom == null || txtKMFrom == "") {
                text += "<br /> -Please Enter From  Period of stay in kashmir  ";
                $('#txtKMFrom').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtKMFrom').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtKMFrom').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtKMFrom').css({ "background-color": "#ffffff" });
            }
            if (txtKMTo == null || txtKMTo == "") {
                text += "<br /> -Please Enter To  Period of stay in kashmir  ";
                $('#txtKMTo').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtKMTo').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtKMTo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtKMTo').css({ "background-color": "#ffffff" });
            }
        }

    }


    //Education in HSC
    var BoardRollNo = $("#txtBoardRollNo");
    var BoardName = $("#txtBoardName");
    var txtExmntnName = $("#txtExmntnName");
    var txtPssngYr = $("#txtPssngYr option:selected").text(); //DropDown
    var ddlPasstype = $("#ddlPasstype option:selected").text();
    var ddlPctgeCalclte = $("#ddlPctgeCalclte option:selected").text();
    var txtTotalMarks = $("#txtTotalMarks");
    var txtMarkSecure = $("#txtMarkSecure");
    var txtPercentage = $("#txtPercentage");

    //if (BoardRollNo != null && BoardRollNo.val() == '') {
    //    text += "<br /> -Please Enter Roll no in Educational Qualification. ";
    //    $('#txtBoardRollNo').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#txtBoardRollNo').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtBoardRollNo').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#txtBoardRollNo').css({ "background-color": "#ffffff" });
    //}
    if (BoardName != null && BoardName.val() == '') {
        text += "<br /> -Please enter Name of the Board Examination Passed in Educational Qualification. ";
        $('#txtBoardName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtBoardName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBoardName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtBoardName').css({ "background-color": "#ffffff" });
    }


    if (txtExmntnName != null && txtExmntnName.val() == '') {
        text += "<br /> -Please enter Name of the Examination Passed in Educational Qualification. ";
        $('#txtExmntnName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtExmntnName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtExmntnName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtExmntnName').css({ "background-color": "#ffffff" });
    }
    var PssngYr = $("#txtPssngYr option:selected").val();
    if (PssngYr != null && (PssngYr == '' || PssngYr == '0')) {
        text += "<br /> -Please select Year of Passing in Educational Qualification.";
        $('#txtPssngYr').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtPssngYr').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPssngYr').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtPssngYr').css({ "background-color": "#ffffff" });
    }

    var Passtype = $('#ddlPasstype option:selected').val();
    if (Passtype != null && (Passtype == '' || Passtype == '0')) {
        text += "<br /> -Please select Exam Cleared in Educational Qualification.";
        $('#ddlPasstype').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPasstype').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlPasstype').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlPasstype').css({ "background-color": "#ffffff" });
    }

    if (ddlPctgeCalclte != null && (ddlPctgeCalclte == '' || ddlPctgeCalclte == '-Select-')) {
        text += "<br /> -Please select Grade in Educational Qualification.";
        $('#ddlPctgeCalclte').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPctgeCalclte').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlPctgeCalclte').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlPctgeCalclte').css({ "background-color": "#ffffff" });
    }

    if (txtTotalMarks != null && txtTotalMarks.val() == '') {
        text += "<br /> -Please enter Total Marks in Educational Qualification. ";
        $('#txtTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtTotalMarks').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTotalMarks').css({ "background-color": "#ffffff" });
    }

    if ($("#ddlPctgeCalclte").val() != "501") {
        if (txtMarkSecure != null && txtMarkSecure.val() == '') {
            text += "<br /> -Please enter Marks Secured in Educational Qualification. ";
            $('#txtMarkSecure').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMarkSecure').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtMarkSecure').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMarkSecure').css({ "background-color": "#ffffff" });
        }

    } else {
        $('#txtMarkSecure').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMarkSecure').css({ "background-color": "#ffffff" });
    }

    if (txtPercentage != null && txtPercentage.val() == '') {
        text += "<br /> -Please calculate the Percentage in Educational Qualification. ";
        opt = 1;
    } else {
    }

    //Eduaction in 10+2
    var BoardRollNo = $("#txtBoardRollNo2");
    var BoardName = $("#txtBoardName2");
    var txtExmntnName = $("#txtExmntnName2");
    var txtPssngYr = $("#txtPssngYr2 option:selected").text(); //DropDown
    var ddlPasstype = $("#ddlPasstype option:selected").text();
    var ddlPctgeCalclte = $("#ddlPctgeCalclte2 option:selected").text();
    var txtTotalMarks = $("#txtTotalMarks2");
    var txtMarkSecure = $("#txtMarkSecure2");
    var txtPercentage = $("#txtPercentage2");

    //if (BoardRollNo != null && BoardRollNo.val() == '') {
    //    text += "<br /> -Please enter Roll no in Educational Qualification 10+2. ";
    //    $('#txtBoardRollNo2').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#txtBoardRollNo2').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtBoardRollNo2').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#txtBoardRollNo2').css({ "background-color": "#ffffff" });
    //}
    if (BoardName != null && BoardName.val() == '') {
        text += "<br /> -Please enter Name of the Board Examination Passed in Educational Qualification 10+2. ";
        $('#txtBoardName2').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtBoardName2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBoardName2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtBoardName2').css({ "background-color": "#ffffff" });
    }


    if (txtExmntnName != null && txtExmntnName.val() == '') {
        text += "<br /> -Please enter Name of the Examination Passed in Educational Qualification 10+2. ";
        $('#txtExmntnName2').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtExmntnName2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtExmntnName2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtExmntnName2').css({ "background-color": "#ffffff" });
    }
    var PssngYr = $("#txtPssngYr2 option:selected").val();
    if (PssngYr != null && (PssngYr == '' || PssngYr == '0')) {
        text += "<br /> -Please select Year of Passing in Educational Qualification 10+2.";
        $('#txtPssngYr2').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtPssngYr2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPssngYr2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtPssngYr2').css({ "background-color": "#ffffff" });
    }

    var Passtype = $('#ddlPasstype option:selected').val();
    if (Passtype != null && (Passtype == '' || Passtype == '0')) {
        text += "<br /> -Please select Exam Cleared in Educational Qualification 10+2.";
        $('#ddlPasstype').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPasstype').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlPasstype').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlPasstype').css({ "background-color": "#ffffff" });
    }

    if (ddlPctgeCalclte != null && (ddlPctgeCalclte == '' || ddlPctgeCalclte == '-Select-')) {
        text += "<br /> -Please select Grade in Educational Qualification 10+2.";
        $('#ddlPctgeCalclte2').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPctgeCalclte2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlPctgeCalclte2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlPctgeCalclte2').css({ "background-color": "#ffffff" });
    }

    if (txtTotalMarks != null && txtTotalMarks.val() == '') {
        text += "<br /> -Please enter Total Marks in Educational Qualification 10+2. ";
        $('#txtTotalMarks2').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtTotalMarks2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtTotalMarks2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTotalMarks2').css({ "background-color": "#ffffff" });
    }

    if ($("#ddlPctgeCalclte2").val() != "501") {
        if (txtMarkSecure != null && txtMarkSecure.val() == '') {
            text += "<br /> -Please enter Marks Secured in Educational Qualification 10+2. ";
            $('#txtMarkSecure2').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMarkSecure2').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtMarkSecure2').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMarkSecure2').css({ "background-color": "#ffffff" });
        }

    } else {
        $('#txtMarkSecure2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMarkSecure2').css({ "background-color": "#ffffff" });
    }

    if (txtPercentage != null && txtPercentage.val() == '') {
        text += "<br /> -Please calculate the Percentage in Educational Qualification 10+2. ";
        opt = 1;
    } else {
    }
    //Section Marks patarn 
    var MarksPatarn = $("input[name='marks']:checked").val();

    if (MarksPatarn == null || MarksPatarn == "undefined") {
        text += "<br /> - Select CHSC Marks patarn and Enter marks scroed in 10+2 Science Exaination";
        opt = 1;
    } else {

    }

    var txtTMT_Physics = $("#txtTMT_Physics").val();
    var txtMOT_Physics = $("#txtMOT_Physics").val();

    var txtTMT_Chemistry = $("#txtTMT_Chemistry").val();
    var txtMOT_Chemistry = $("#txtMOT_Chemistry").val();

    var txtTMT_Maths = $("#txtTMT_Maths").val();
    var txtMOT_Maths = $("#txtMOT_Maths").val();

    var txtTMT_Botany = $("#txtTMT_Botany").val();
    var txtMOT_Botany = $("#txtMOT_Botany").val();

    var txtTMT_Zoology = $("#txtTMT_Zoology").val();
    var txtMOT_Zoology = $("#txtMOT_Zoology").val();


    var txtTMTP_Physics = $("#txtTMTP_Physics").val();
    var txtTMOTP_Physics = $("#txtTMOTP_Physics").val();
    var txtTMTP_Chemistry = $("#txtTMTP_Chemistry").val();
    var txtTMOTP_Chemistry = $("#txtTMOTP_Chemistry").val();


    //CBSE
    if (MarksPatarn == "yes1") {

        if (txtTMT_Physics == "" || txtTMT_Physics == null) {
            text += "<br /> - Please Enter Total marks in Physics";
            $('#txtTMT_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Physics').css({ "background-color": "#ffffff" });
        }
        if (txtMOT_Physics == "" || txtMOT_Physics == null) {
            text += "<br /> - Please Enter marks obtain in Physics";
            $('#txtMOT_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Physics').css({ "background-color": "#ffffff" });
        }
        if (txtTMT_Chemistry == "" || txtTMT_Chemistry == null) {
            text += "<br /> - Please Enter Total marks  in Chemistry";
            $('#txtTMT_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Chemistry').css({ "background-color": "#ffffff" });
        }
        if (txtMOT_Chemistry == "" || txtMOT_Chemistry == null) {
            text += "<br /> - Please Enter  marks  obtain in Chemistry";
            $('#txtMOT_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Chemistry').css({ "background-color": "#ffffff" });
        }
        if (txtTMT_Maths == "" || txtTMT_Maths == null) {
            text += "<br /> - Please Enter  Total marks in Maths";
            $('#txtTMT_Maths').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Maths').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Maths').css({ "background-color": "#ffffff" });
        }
        if (txtTMT_Maths == "" || txtTMT_Maths == null) {
            text += "<br /> - Please Enter   marks obtain in Maths";
            $('#txtMOT_Maths').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Maths').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Maths').css({ "background-color": "#ffffff" });
        }
        if (txtTMT_Botany == "" || txtTMT_Botany == null) {
            text += "<br /> - Please Enter  Total  marks  in Biology";
            $('#txtTMT_Botany').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Botany').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Botany').css({ "background-color": "#ffffff" });
        }

        if (txtMOT_Botany == "" || txtMOT_Botany == null) {
            text += "<br /> - Please Enter    marks  obtain in Biology";
            $('#txtMOT_Botany').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Botany').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Botany').css({ "background-color": "#ffffff" });
        }
        //if (txtTMT_Zoology == "" || txtTMT_Zoology == null) {
        //    text += "<br /> - Please Enter   Total  marks   in Zoology";
        //    $('#txtTMT_Zoology').attr('style', 'border:1px solid #d03100 !important;');
        //    $('#txtTMT_Zoology').css({ "background-color": "#fff2ee" });
        //    opt = 1;
        //}
        //else {
        //    $('#txtTMT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        //    $('#txtTMT_Zoology').css({ "background-color": "#ffffff" });
        //}

        //if (txtMOT_Zoology == "" || txtMOT_Zoology == null) {
        //    text += "<br /> - Please Enter     marks  obtain in Zoology";
        //    $('#txtMOT_Zoology').attr('style', 'border:1px solid #d03100 !important;');
        //    $('#txtMOT_Zoology').css({ "background-color": "#fff2ee" });
        //    opt = 1;
        //}
        //else {
        //    $('#txtMOT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        //    $('#txtMOT_Zoology').css({ "background-color": "#ffffff" });
        //}


        if (txtTMTP_Physics == "0") {
            text += "<br /> - Please Enter Total marks in Physics";
            $('#txtTMT_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Physics').css({ "background-color": "#ffffff" });
        }


        if (txtTMOTP_Physics == "0") {
            text += "<br /> - Please Enter marks obtain in Physics";
            $('#txtMOT_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Physics').css({ "background-color": "#ffffff" });
        }

        if (txtTMTP_Chemistry == "0") {
            text += "<br /> - Please Enter Total marks  in Chemistry";
            $('#txtTMT_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Chemistry').css({ "background-color": "#ffffff" });
        }

        if (txtTMOTP_Chemistry == "0") {
            text += "<br /> - Please Enter  marks  obtain in Chemistry";
            $('#txtMOT_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Chemistry').css({ "background-color": "#ffffff" });
        }


    }
    //Section others Marks patarn 


    var txtTMT_Physics = $("#txtTMT_Physics").val();
    var txtMOT_Physics = $("#txtMOT_Physics").val();
    var txtTMP_Physics = $("#txtTMP_Physics").val();
    var txtMOP_Physics = $("#txtMOP_Physics").val();

    var txtTMT_Chemistry = $("#txtTMT_Chemistry").val();
    var txtMOT_Chemistry = $("#txtMOT_Chemistry").val();
    var txtTMP_Chemistry = $("#txtTMP_Chemistry").val();
    var txtMOP_Chemistry = $("#txtMOP_Chemistry").val();

    var txtTMT_Maths = $("#txtTMT_Maths").val();
    var txtMOT_Maths = $("#txtMOT_Maths").val();
    var txtTMP_Maths = $("#txtTMP_Maths").val();
    var txtMOP_Maths = $("#txtMOP_Maths").val();

    var txtTMT_Botany = $("#txtTMT_Botany").val();
    var txtMOT_Botany = $("#txtMOT_Botany").val();
    var txtTMP_Botany = $("#txtTMP_Botany").val();
    var txtMOP_Botany = $("#txtMOP_Botany").val();

    var txtTMT_Zoology = $("#txtTMT_Zoology").val();
    var txtMOT_Zoology = $("#txtMOT_Zoology").val();
    var txtTMP_Zoology = $("#txtTMP_Zoology").val();
    var txtMOP_Zoology = $("#txtMOP_Zoology").val();

    var txtTMTP_Physics = $("#txtTMTP_Physics").val();
    var txtTMOTP_Physics = $("#txtTMOTP_Physics").val();
    var txtTMTP_Chemistry = $("#txtTMTP_Chemistry").val();
    var txtTMOTP_Chemistry = $("#txtTMOTP_Chemistry").val();

    //CHSE
    if (MarksPatarn == "yes2") {

        if (txtTMT_Physics == null || txtTMT_Physics == "") {
            text += "<br /> - Please Enter Total marks in Physics";
            $('#txtTMT_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Physics').css({ "background-color": "#ffffff" });
            //$("#txtTMT_Physics").val("");
        }
        if (txtMOT_Physics == null || txtMOT_Physics == "") {
            text += "<br /> - Please Enter marks obtain in Physics";
            $('#txtMOT_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Physics').css({ "background-color": "#ffffff" });
        }

        if (txtTMP_Physics == null || txtTMP_Physics == "") {
            text += "<br /> - Please Enter practical Total marks  in physics";
            $('#txtTMP_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMP_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMP_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMP_Physics').css({ "background-color": "#ffffff" });
        }

        if (txtMOP_Physics == null || txtMOP_Physics == "") {
            text += "<br /> - Please Enter practical marks obtain in Physics";
            $('#txtMOP_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOP_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOP_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOP_Physics').css({ "background-color": "#ffffff" });
        }


        if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") {
            text += "<br /> - Please Enter Total marks  in Chemistry";
            $('#txtTMT_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Chemistry').css({ "background-color": "#ffffff" });
        }
        if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") {
            text += "<br /> - Please Enter  marks  obtain in Chemistry";
            $('#txtMOT_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Chemistry').css({ "background-color": "#ffffff" });
        }
        if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") {
            text += "<br /> - Please Enter  practical total marks   in Chemistry";
            $('#txtTMP_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMP_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMP_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMP_Chemistry').css({ "background-color": "#ffffff" });
        }
        if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") {
            text += "<br /> - Please Enter  practical  marks obtain  in Chemistry";
            $('#txtMOP_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOP_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOP_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOP_Chemistry').css({ "background-color": "#ffffff" });
        }


        if (txtTMT_Maths == null || txtTMT_Maths == "") {
            text += "<br /> - Please Enter  Total marks in Maths";
            $('#txtTMT_Maths').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Maths').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Maths').css({ "background-color": "#ffffff" });
        }
        if (txtTMT_Maths == null || txtTMT_Maths == "") {
            text += "<br /> - Please Enter   marks obtain in Maths";
            $('#txtMOT_Maths').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Maths').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Maths').css({ "background-color": "#ffffff" });
        }

        //if (txtTMP_Maths == null || txtTMP_Maths == "") {
        //    text += "<br /> - Please Enter  Practical total  marks  in math";
        //    $('#txtTMP_Maths').attr('style', 'border:1px solid #d03100 !important;');
        //    $('#txtTMP_Maths').css({ "background-color": "#fff2ee" });
        //    opt = 1;
        //}
        //else {
        //    $('#txtTMP_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
        //    $('#txtTMP_Maths').css({ "background-color": "#ffffff" });
        //}
        //if (txtMOP_Maths == null || txtMOP_Maths == "") {
        //    text += "<br /> - Please Enter  Practical   marks obtain in Maths";
        //    $('#txtMOP_Maths').attr('style', 'border:1px solid #d03100 !important;');
        //    $('#txtMOP_Maths').css({ "background-color": "#fff2ee" });
        //    opt = 1;
        //}
        //else {
        //    $('#txtMOP_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
        //    $('#txtMOP_Maths').css({ "background-color": "#ffffff" });
        //}


        if (txtTMT_Botany == null || txtTMT_Botany == "") {
            text += "<br /> - Please Enter  Total  marks  in Botany";
            $('#txtTMT_Botany').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Botany').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Botany').css({ "background-color": "#ffffff" });
        }

        if (txtMOT_Botany == null || txtMOT_Botany == "") {
            text += "<br /> - Please Enter    marks  obtain in Botany";
            $('#txtMOT_Botany').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Botany').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Botany').css({ "background-color": "#ffffff" });
        }
        if (txtTMP_Botany == null || txtTMP_Botany == "") {
            text += "<br /> - Please Enter  practical total  marks   in Botany";
            $('#txtTMP_Botany').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMP_Botany').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMP_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMP_Botany').css({ "background-color": "#ffffff" });
        }
        if (txtMOP_Botany == null || txtMOP_Botany == "") {
            text += "<br /> - Please Enter  practical   marks obtan  in Botany";
            $('#txtMOP_Botany').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOP_Botany').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOP_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOP_Botany').css({ "background-color": "#ffffff" });
        }


        if (txtTMT_Zoology == null || txtTMT_Zoology == "") {
            text += "<br /> - Please Enter   Total  marks   in Zoology";
            $('#txtTMT_Zoology').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Zoology').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Zoology').css({ "background-color": "#ffffff" });
        }

        if (txtMOT_Zoology == null || txtMOT_Zoology == "") {
            text += "<br /> - Please Enter     marks  obtain in Zoology";
            $('#txtMOT_Zoology').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Zoology').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Zoology').css({ "background-color": "#ffffff" });
        }

        if (txtTMP_Zoology == null || txtTMP_Zoology == "") {
            text += "<br /> - Please Enter Practical total   marks   in Zoology";
            $('#txtTMP_Zoology').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMP_Zoology').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMP_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMP_Zoology').css({ "background-color": "#ffffff" });
        }
        if (txtMOP_Zoology == null || txtMOP_Zoology == "") {
            text += "<br /> - Please Enter Practical   marks Obtain   in Zoology";
            $('#txtMOP_Zoology').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOP_Zoology').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOP_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOP_Zoology').css({ "background-color": "#ffffff" });
        }


        if (txtTMTP_Physics == "0") {
            text += "<br /> - Please Enter Total marks in Physics";
            $('#txtTMT_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Physics').css({ "background-color": "#ffffff" });
            //$("#txtTMT_Physics").val("");
        }


        if (txtTMOTP_Physics == "0") {
            text += "<br /> - Please Enter marks obtain in Physics";
            $('#txtMOT_Physics').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Physics').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Physics').css({ "background-color": "#ffffff" });
        }

        if (txtTMTP_Chemistry == "0") {
            text += "<br /> - Please Enter Total marks  in Chemistry";
            $('#txtTMT_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtTMT_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtTMT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtTMT_Chemistry').css({ "background-color": "#ffffff" });
        }

        if (txtTMOTP_Chemistry == "0") {
            text += "<br /> - Please Enter  marks  obtain in Chemistry";
            $('#txtMOT_Chemistry').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMOT_Chemistry').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtMOT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMOT_Chemistry').css({ "background-color": "#ffffff" });
        }

    }

    var Section1_PassOdia = $("input[name='radio1']:checked").val();

    if (Section1_PassOdia == null) {
        text += "<br /> - Please chose, Has the Candidate passed Odia as one of the subject in HSC Examination?";
        $('#isOdia').attr('style', 'color:red !important;');
        $('#isOdia').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#isOdia').attr('style', 'color:#000000 !important;');
        $('#isOdia').css({ "color": "#000000 " });
    }

    var Section1_AbililtyRead = 0;
    if ($('#readOdiya').is(":checked")) {
        // it is checked
        Section1_AbililtyRead = 1;
    }

    var Section1_AbilityWrite = 0;
    if ($('#writeOdiya').is(":checked")) {
        // it is checked
        Section1_AbilityWrite = 1;
    }

    var Section1_AbilitySpeak = 0;
    if ($('#spkOdiya').is(":checked")) {
        // it is checked
        Section1_AbilitySpeak = 1;
    }

    if (Section1_PassOdia == "yes") {
        if (Section1_AbililtyRead == 0 || Section1_AbilityWrite == 0 || Section1_AbilitySpeak == 0) {
            //chkAbility
            text += "<br /> - Please choose, Wheather the Candidate has ability to Read, Write and Speak Odia Language. ";
            opt = 1;
            GovtMessage = 1;
            $('#chkAbility').attr('style', 'color:red !important;');
            $('#chkAbility').css({ "color": "red" });
        }
        else {
            $('#chkAbility').attr('style', 'color:#000000 !important;');
            $('#chkAbility').css({ "color": "#000000 " });
        }
    }
    var Residence = $('#ddlResidence option:selected').text();
    if (Section1_PassOdia == "no" && OUATEmployeeChk != "1") {

        if (Residence != null && (Residence == '' || Residence == '--Select Residence Type--')) {
            text += "<br /> -Please select Residence Type.";
            $('#ddlResidence').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlResidence').css({ "background-color": "#fff2ee" });
            opt = 1;
            GovtMessage = 1;
        } else {
            $('#ddlResidence').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlResidence').css({ "background-color": "#ffffff" });
        }

    }


    var chkdeclaration = 0;
    if ($('#chkPhysical').is(":checked")) {
        // it is checked
        chkdeclaration = 1;
    }

    if (chkdeclaration == 0) {
        //chkAbility
        text += "<br /> - Please check Declaration and read it. ";
        opt = 1;
        $('#lblDeclaration').attr('style', 'color:red !important;');
        $('#lblDeclaration').css({ "color": "red" });
    }
    else {
        $('#lblDeclaration').attr('style', 'color:#000000 !important;');
        $('#lblDeclaration').css({ "color": "#000000 " });
    }

    if (opt == "") {
        if (!$("#chkPhysical").is(":checked", true)) {
            text += "<br /> -Please check Self Declaration.";
            opt = 1;
        }

        if (!$("#chkPhysical").is(":checked", true)) {
            text += "<br /> - Please check Declaration for Participation in Physical Efficiency Test.";
            opt = 1;
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        //alert(text);
        return false;
    }


    return true;

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

function AssignDataValues(JSONData) {



    var obj = jQuery.parseJSON(JSONData);


    $("#FirstName").val(obj["FirstName"]);
    $("#MiddleName").val(obj["MiddleName"]);
    $("#LastName").val(obj["LastName"]);
    $("#FatherName").val(obj["careOf"]);
    $("#FatherName").val(obj["careOfLocal"]);
    $("#DOBConverted").val(obj["dateOfBirth"]);
    $('#AgeYear').val(obj["AgeYear"]);//AgeYear
    $("#AgeMonth").val(obj["AgeMonth"]);
    $("#AgeDay").val(obj["AgeDay"]);
    $("#gender").val(obj["ddlGender"]);
    $("#Religion").val(obj["Religion"]);
    $("#Category").val(obj["Category"]);
    $("#Nationality").val(obj["Nationality"]);
    $("#EmailID").val(obj["emailId"]);
    $("#MobileNo").val(obj["Mobile"]);
    $("#stdcode").val(obj["stdcode"]);
    $("#phoneno").val(obj["phone"]);
    $("#PAddressLine1").val(obj["houseNumber"]);//?
    $("#PAddressLine1").val(obj["houseNumberLocal"]);
    $("#PLandMark").val(obj["landmark"]);//?
    $("#PLandMark").val(obj["landmarkLocal"]);//?
    $("#PLocality").val(obj["locality"]);//?
    $("#PLocality").val(obj["localityLocal"]);//?
    $("#PRoadStreetName").val(obj["street"]);//?
    $("#PRoadStreetName").val(obj["streetLocal"]);//?
    $("#PAddressLine2").val(obj["postOffice"]);//?
    $("#PAddressLine2").val(obj["postOfficeLocal"]);//?

    $("#PddlState").val(obj["state"]);//?
    $("#PddlState").val(obj["stateLocal"]);//?
    $("#PddlDistrict").val(obj["districtLocal"]);//?
    $("#PddlTaluka").val(obj["subDistrictLocal"]);//?
    $("#PddlVillage").val(obj["Village"]);//?
    $("#PPinCode").val(obj["pincode"]);//?
    $("#PPinCode").val(obj["pincodeLocal"]);//?

    $("#ContentPlaceHolder1_HFb64").val(obj["Image"]);//?
    $("#CAddressLine1").val(obj["phouseNumber"]);//?
    $("#CLandMark").val(obj["plandmark"]);//?
    $("#CLocality").val(obj["plocality"]);//?
    $("#CRoadStreetName").val(obj["pstreet"]);//?
    $("#CPinCode").val(obj["ppincode"]);//?
    $("#CAddressLine2").val(obj["ppostOffice"]);//?

    $("#CddlState").val(obj["pstate"]);//?
    $("#CddlDistrict").val(obj["pdistrict"]);//?
    $("#CddlTaluka").val(obj["psubDistrict"]);//?
    $("#CddlVillage").val(obj["pvillage"]);//?

    $("#Section1_PassOdia").val(obj["Section1_PassOdia"]);
    $("#Section1_AbililtyRead").val(obj["Section1_AbililtyRead"]);
    $("#Section1_AbilityWrite").val(obj["Section1_AbilityWrite"]);
    $("#Section1_AbilitySpeak").val(obj["Section1_AbilitySpeak"]);

    $("#Section2_Married").val(obj["Section2_Married"]);
    $("#Section2A_MoreThanOneSpouse").val(obj["Section2A_MoreThanOneSpouse"]);

    $("#Section3_ExServiceMan").val(obj["Section3_ExServiceMan"]);

    $("#Section3A_ServiceRendered").val(obj["Section3A_ServiceRendered"]);

    $("#Section3B_ServiceDuration").val(obj["Section3B_ServiceDuration"]);
    $("#Section3B_ServiceDurationFrom").val(obj["Section3B_ServiceDurationFrom"]);
    $("#Section3B_ServiceDurationTo").val(obj["Section3B_ServiceDurationTo"]);

    $("#Section3C_ServiceYear").val(obj["Section3C_ServiceYear"]);
    $("#Section3C_ServiceMonth").val(obj["Section3C_ServiceMonth"]);
    $("#Section3C_ServiceDay").val(obj["Section3C_ServiceDay"]);

    $("#Section4_IsSportsPerson").val(obj["Section4_IsSportsPerson"]);
    $("#Section4A_SportsParticipated").val(obj["Section4A_SportsParticipated"]);
    $("#Section4B_SportsOthers").val(obj["Section4B_SportsOthers"]);
    $("#Section4B_WantsRelaxation").val(obj["Section4B_WantsRelaxation"]);

    $("#Section5A_ParticipateEvent").val(obj["Section5A_ParticipateEvent"]);
    $("#Section5B_SportsCategory").val(obj["Section5B_SportsCategory"]);
    $("#Section5C_SportsMedal").val(obj["Section5C_SportsMedal"]);

    $("#Section6_NCCCertificate").val(obj["Section6_NCCCertificate"]);
    $("#Section6A_NCCCertificateCategory").val(obj["Section6A_NCCCertificateCategory"]);

    $("#Section7A_RegNo").val(obj["Section7A_RegNo"]);
    $("#Section7A_RegDate").val(obj["Section7A_RegDate"]);
    $("#Section7B_NameEmpExchg").val(obj["Section7B_NameEmpExchg"]);

    $("#Section8_HasDL").val(obj["Section8_HasDL"]);
    $("#Section8A_LicenseVehicle").val(obj["Section8A_LicenseVehicle"]);
    $("#Section8B_LicenseNo").val(obj["Section8B_LicenseNo"]);
    $("#Section8B_LicenseDate").val(obj["Section8B_LicenseDate"]);
    $("#Section8C_NameRTOOffice").val(obj["Section8C_NameRTOOffice"]);

    $("#Section9_InvolvedCriminal").val(obj["Section9_InvolvedCriminal"]);
    $("#Section9A_ArrestDetail").val(obj["Section9A_ArrestDetail"]);
    $("#Section9B_CaseRefNo").val(obj["Section9B_CaseRefNo"]);
    $("#Section9C_District").val(obj["Section9C_District"]);
    $("#Section9D_PoliceStationNo").val(obj["Section9D_PoliceStationNo"]);
    $("#Section9E_IPCSection").val(obj["Section9E_IPCSection"]);




    return false;
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

function validateValues(DeleteString) {

    if (DeleteString != '') {
        return true;
    }

    var strMsg = "";
    var isError = false;


    var stateVal = "";
    var stateText = "";
    var NameOfExamination = "";
    var PassingYear = "";
    var NameOfBoardVal = "";
    var NameOfBoardText = "";
    var Division = "";
    var Total = "";
    var Marks = "";
    var Percentage = "";


    stateVal = $("#EddlBoardState").val();
    stateText = $("#EddlBoardState option:selected").text();

    NameOfExamination = $("#txtExmntnName").val();

    PassingYear = $("#txtPssngYr").val();
    NameOfBoardVal = $("#ddlBoard").val();
    NameOfBoardText = $("#ddlBoard option:selected").text();
    Division = $("#txtDivision").val();
    Total = $("#txtTotalMarks").val();
    Marks = $("#txtMarkSecure").val();
    Percentage = "";

    if (stateText != null && (stateText == '' || stateText == '-Select-')) {
        text += "<br /> -Please select State in Educational Qualifications.";
        isError = true;
    }

    if (NameOfExamination == '') {
        text += "<br /> -Please enter Examination Passed. ";
        isError = true;
    }

    if (PassingYear == '') {
        text += "<br /> -Please enter Passing Year. ";
        isError = true;
    }

    if (NameOfBoardText != null && (NameOfBoardText == '' || NameOfBoardText == '-Select-' || NameOfBoardText == 'List of Board')) {
        text += "<br /> -Please select Board.";
        isError = true;
    }

    if (Division == '') {
        text += "<br /> -Please enter Division. ";
        isError = true;
    }

    if (Total == '') {
        text += "<br /> -Please enter Total Marks. ";
        isError = true;
    }

    if (Marks == '') {
        text += "<br /> -Please enter Marks Secured. ";
        isError = true;
    }

    if (isError == true) {


        alertPopup("Please fill following information in Educational Qualification.", text);
        return false;
    }

    return true;

}

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }

    $("#btnSubmit").prop('disabled', true);
    var t_Message = "";
    var result = false;

    var DOB = $("#DOB");

    if (DOB.val() != '') {

        var txtDOB = DOB.val();
        var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
        var Age = calcExSerDur(txtDOB, '31/12/2017');
        var minAge = 18;
        var maxAge = 23;
        var ageToCompare = Age.years;
        var ageActual = Age.years;

        if ($('#category').val() == "UR") {

        }
        else if ($('#category').val() == "SC" || $('#category').val() == "ST") {
            maxAge = 28;
        }
        else if ($('#category').val() == "SEBC") {
            maxAge = 28;
        }

        var startDate = $('#txtRndDrtinstrt').val();
        var endDate = $('#txtRndDrtinend').val();
        var text = "";
        var check = false;
        var opt = 0;
        var ExSrvDay = 0;
        var ExSrvMonth = 0;
        var ExSrvYear = 0;

        if (startDate != "" && endDate != "") {

            //if ($("#DOB").datepicker("getDate") >= $("#txtRndDrtinstrt").datepicker("getDate")) {
            //    //alert('Qualifying Service Duration must be greater than Date of Birth');
            //    text = "Qualifying Service Duration must be greater than Date of Birth.";
            //    alertPopup("Info", text);
            //    $("#txtRndDrtinstrt").val("");
            //    return false;
            //}

            //if ($("#DOB").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
            //    //alert('Qualifying Service Duration must be greater than Date of Birth');
            //    text = "Qualifying Service Duration must be greater than Date of Birth.";
            //    alertPopup("Info", text);
            //    $("#txtRndDrtinend").val("");
            //    return false;
            //}

            //if ($("#txtRndDrtinstrt").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
            //    //alert('Qualifying Service To Date must be greater than From Date');
            //    text = "Qualifying Service To Date must be greater than From Date.";
            //    alertPopup("Info", text);
            //    $("#txtRndDrtinend").val("");
            //    return false;
            //}

            var durn = calcExSerDur(startDate, endDate);


            if (durn != null) {
                if (durn.years > 0) dateDOB.setFullYear(dateDOB.getFullYear() + durn.years);
                if (durn.months > 0) {
                    dateDOB = dateDOB.addMonths(durn.months);
                }
                if (durn.days > 0) {
                    dateDOB.setDate(dateDOB.getDate() + durn.days);
                }

                //alert(dateDOB);
                var newDate = pad(dateDOB.getDate().toString(), 2) + "/" + pad(dateDOB.getMonth().toString(), 2) + "/" + dateDOB.getFullYear().toString();

                var Age = calcExSerDur(newDate, '31/12/2017');
                //alert(Age.years);
                //alert(Age.months);
                //alert(Age.days);
                ageToCompare = Age.years;
                ExSrvDay = durn.days;
                ExSrvMonth = durn.months;
                ExSrvYear = durn.years;
                //alert(ageToCompare);
            }

            var AgeForRenderService = calcExSerDur(txtDOB, startDate);
            /*Commented by Niraj on 29-11-2016 after confirming with Dipansu OISF no minimum age for Ex-Serviceman*/
            /*if (AgeForRenderService.years < 18) {
                //alert('Minimum Age is 18 Years for rendering service in Defense.');
                text = "Minimum Age is 18 Years for rendering service in Defense. You are not eligible for the application.";
                alertPopup("Info", text);

                $("#txtRndDrtinstrt").val("");
                $("#txtRndDrtinend").val("");
                $("#SevsYear").val("");
                $("#SevsMonth").val("");
                $("#SevsDay").val("");
                                                
                return false;
            }
            */
        }

        /*
        Logic altered to allow candidate w.r.t. the scenario as the Candidate is of 23 years of age and is an Ex-Serviceman and has experience of 5 years.
        Herein, system will give relaxation of 5 years to the candidate, based on that, the age will be less than 18 years, and system will restrict submission of application.
        To handle these cases, system will use the actual age of the candidate.

        */
        if (ageToCompare < minAge) {
            ageToCompare = ageActual;
        }
        if (ageToCompare < minAge) {
            //$('#DOB').val('');
            if ($("input[name='radio3']:checked").val() == 'No') {
                text += "<br /> -Applicant age should be 18 years and above. ";
                opt = 1;
            }
        } else if (ageToCompare > maxAge) {
            check = true;
            if (check) {
                text += "<br /> -Applicant age should be less than " + maxAge + " years. ";
                opt = 1;
            }
        }
        else if (ageToCompare == maxAge) {
            var monthdiff = $('#Month').val() - ExSrvMonth;
            if (monthdiff > 0) {
                check = true;

                if (check) {
                    text += "<br /> -Applicant age should be less than " + maxAge + " years. ";
                    opt = 1;
                }
            }
            else {

                if ($('#Month').val() == ExSrvMonth) {
                    if (($('#Day').val() - ExSrvDay) > 0) {
                        check = true;

                        if (check) {
                            text += "<br /> -Applicant age should be less than " + maxAge + " years. ";
                            opt = 1;
                        }
                    }
                }
                else {
                    result = true;
                }
            }

            if (($('#Day').val() - ExSrvDay) > 0) {
                check = true;

                if (check) {
                    text += "<br /> -Applicant age should be less than " + maxAge + " years. ";
                    opt = 1;
                }
            }
            else {
                result = true;
            }
        }
        else {
            result = true;
        }











        //alertPopup("Eligibility criteria for submitting application.", text);

        //if (opt == 1) {
        //    t_Message = "As per Govt. Notification, you are not eligible for the Application. Do you want to submit your application?";

        //    if (confirm(t_Message)) {
        //        result = true;
        //    }
        //}
        //else {
        //    t_Message = "As per Govt. Notification, you are eligible for the Application. Please confirm to Proceed.";
        //    alert(t_Message);
        //    result = true;
        //}

        //if (!result) {
        //    //alertPopup("Age criteria for submitting application is " + minAge  + " to " + maxAge + ".", text);
        //    alertPopup("Age criteria for submitting application", text);
        //    $("#btnSubmit").prop('disabled', false);
        //    //--return false;
        //}
    }
    //alert('sucess');
    //return false;

    var ProfileID = "";
    var qs = getQueryStrings();
    if (qs["ProfileID"] != null && qs["ProfileID"] != "") {

        ProfileID = qs["ProfileID"];
    }

    var temp = "Gunwant";
    var AppID = "";
    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var FirstName = $("#FirstName");
    var LastName = $("#LastName");
    var FatherName = $("#FatherName");
    var Age = $("#Age");

    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");

    //ddlGender
    var MotherName = $("#MotherName").val();
    var MotherTongue = $("#txtTongue").val();

    var Religion = $("#religion option:selected").text();

    var Category = $("#category option:selected").text();
    var Nationality = $("#nationality option:selected").text();

    //var obj = jQuery.parseJSON($("#HFUIDData").val());

    //var Section2_Married = $("input[name='radio2']:checked").val();
    var Section1_ReservedSeat = $("input[name='reserved']:checked").val();

    //var Section2A_MoreThanOneSpouse = $("input[name='radio2a']:checked").val();
    var Section1A_SeatCategory = "";//$("#ddlReservation option:selected").text();


    var GreenCardHolder = 0;
    if ($('#CheckBoxList1_0').is(":checked")) {
        // it is checked
        GreenCardHolder = 1;
    }

    var Physicallyhandicaped = 0;
    var PhysicallyhandicapedPercent = 0;
    if ($('#CheckBoxList1_1').is(":checked")) {
        // it is checked
        Physicallyhandicaped = 1;
    }

    var NRISponsership = 0;
    if ($('#CheckBoxList1_2').is(":checked")) {
        // it is checked
        NRISponsership = 1;
    }
    var WesterOdisha = 0;
    if ($('#CheckBoxList1_3').is(":checked")) {
        // it is checked
        WesterOdisha = 1;
    }
    var OUATEmployee = 0;
    if ($('#CheckBoxList1_4').is(":checked")) {
        // it is checked
        OUATEmployee = 1;
    }
    var Kashmirmigrant = 0;
    if ($('#CheckBoxList1_5').is(":checked")) {
        // it is checked
        Kashmirmigrant = 1;
    }
    var PhysicalHandicap = $("input[id='CheckBoxList1_1']:checked").val();
    var NRISponsership = $("input[id='CheckBoxList1_2']:checked").val();
    var westernodisha = $("input[id='CheckBoxList1_3']:checked").val();
    var Ouatemployee = $("input[id='CheckBoxList1_4']:checked").val();
    var kashmirmigrant = $("input[id='CheckBoxList1_5']:checked").val();

    var HandicappedPart = $("#txtHandicappedPart").val();
    var HandiPercent = $("#txtHandiPercent").val();

    var ddlWesternDistrict = $("#ddlWesternDistrict option:selected").text();


    var txtKMFrom = $("#txtKMFrom").val();
    var txtKMTo = $("#txtKMTo").val();

    var Section1_PassOdia = $("input[name='radio1']:checked").val();
    if (Section1_PassOdia == "no") {
        Section1_PassOdia = 0;
    }
    else { Section1_PassOdia = 1; }

    var Section1_AbililtyRead = 0;
    if ($('#readOdiya').is(":checked")) {
        // it is checked
        Section1_AbililtyRead = 1;
    }

    var Section1_AbilityWrite = 0;
    if ($('#writeOdiya').is(":checked")) {
        // it is checked
        Section1_AbilityWrite = 1;
    }

    var Section1_AbilitySpeak = 0;
    if ($('#spkOdiya').is(":checked")) {
        // it is checked
        Section1_AbilitySpeak = 1;
    }

    var ResidentType = $('#ddlResidence option:selected').text();

    //var MILSubject = $("#txtMIL").val();


    //var Section3_ExServiceMan = $("input[name='radio3']:checked").val();
    //var Section3A_ServiceRendered = $("#txtRtrmntdte").val();
    //var Section3B_ServiceDurationFrom = $("#txtRndDrtinstrt").val();
    //var Section3B_ServiceDurationTo = $("#txtRndDrtinend").val();
    //var Section3C_ServiceYear = $("#SevsYear").val();
    //var Section3C_ServiceMonth = $("#SevsMonth").val();
    //var Section3C_ServiceDay = $("#SevsDay").val();

    //var Section4_IsSportsPerson = $("input[name='radio4a']:checked").val();
    //var Section4A_SportsParticipated = $("#ddlSports option:selected").text();
    //var Section4B_SportsOthers = $("#txtOthrsport").val();
    //var Section4C_SportsFedAssName = $("#txtSportFedAssName").val();
    ////var Section4B_WantsRelaxation = $("input[name='radio4b']:checked").val();
    //var Section4B_WantsRelaxation = $("input[name='radio4c']:checked").val();

    //var Section4B_RelaxationHeight = "";//$("#ddlRxlstnhgt option:selected").text();
    //var Section4B_RelaxationChest = "";//$("#ddlRxlstnchst option:selected").text();
    //var Section4B_RelaxationWeight = "";//$("#ddlRxlstnwght option:selected").text();

    //var Section5 = "";//$("input[name='radio5']:checked").val();
    //var Section5A_ParticipateEvent = "";//$("#ddlSports2 option:selected").text();
    //var Section5B_SportsCategory = "";//$("input[name='radio5b']:checked").val();
    //var Section5C_SportsMedal = "";//$("input[name='radio5C']:checked").val();

    //var Section6_NCCCertificate = $("input[name='radio6']:checked").val();
    //var Section6A_NCCCertificateCategory = $("input[name='radio6A']:checked").val();

    /*
    var Section6_1_IsOUATEmployee = $("input[name='radio10']:checked").val();
    var Section6_1_OUATEmployeeName = $("#txtEmployeeName").val();
    var Section6_1_OUATEmployeeCode = $("#txtEmpCode").val();
    var Section6_1_OUATEmployeeDesignation = $("#txtDesignation").val();
    var Section6_1_OUATEmployeeStatus = $("#ddlServiceStatus").val();
    var Section6_1_OUATEmployeeOffice = $("#txtOffice").val();
    var Section6_1_OUATEmployeeRelation = $("#ddlEmpRelation").val();
    */

    var Section6_1_IsOUATEmployee = "";
    var Section6_1_OUATEmployeeName = "";
    var Section6_1_OUATEmployeeCode = "";
    var Section6_1_OUATEmployeeDesignation = "";
    var Section6_1_OUATEmployeeStatus = "";
    var Section6_1_OUATEmployeeOffice = "";
    var Section6_1_OUATEmployeeRelation = "";

    //var Section7A_RegNo = "";//$("#txtRegNo").val();
    //var Section7A_RegDate = "";//$("#txtRegdte").val();
    ////var Section7B_NameEmpExchg = $("#ddlEmploymentExchange option:selected").text();
    //var Section7B_NameEmpExchg = "";//$("#txtNameEmpEx").val();
    //var Section7B_District = "";//$("#EEddlDistrict").val();

    //var Section8_HasDL = "";//$("input[name='radio8']:checked").val();
    //var Section8A_LicenseVehicle = "";//$("input[name='radio8A']:checked").val();
    //var Section8B_LicenseNo = "";//$("#txtLicenseNo").val();
    //var Section8B_LicenseDate = "";//$("#txtLicenseDate").val();
    ////var Section8C_NameRTOOffice = $("#txtRTO").val();

    //var Section8C_District = "";//$("#ddlDistrictRTO").val();
    //var Section8C_NameRTOOffice = "";//$("#txtRTO").val();

    //var Section9_InvolvedCriminal = "";//$("input[name='radio9']:checked").val();
    ////var Section9A_ArrestDetail = $("input[name='radio9A']:checked").val();
    //var Section9B_CaseRefNo = "";//$("#txtCriminalRefNo").val();
    //var Section9C_State = "";//$("#ddlStateCC").val();
    //var Section9C_District = "";//$("#ddlArrestDistrict").val();
    //var Section9D_PoliceStationNo = "";//$("#ddlPoliceStation").val();
    ////var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
    //var Section9E_IPCSection = "";//$("#txtIPCSection").val();
    //var ChoiceofPreference = "";//$("#ddlApplication option:selected").text();
    //var SecondPreference = "";//$("#ddlAppPref option:selected").val();
    ////if (SecondPreference == '0') {
    ////    SecondPreference = 'No second choice preference';
    ////}
    ////else {
    ////    SecondPreference = $("#ddlAppPref option:selected").text();
    ////}
    //var Acquitted = $('#ddlAcquitted option:selected').text();

    var ResponseType = "C";

    var ExamType = $("input[name='marks']:checked").val();//marks

    if (ExamType == "yes1") {
        //MarksPatarn == "yes1"
        ExamType = "CBSE";
    } else {
        ExamType = "CHSE";
    }

    var TMT_Physics = $("#txtTMT_Physics").val();
    var MOT_Physics = $("#txtMOT_Physics").val();
    var TMP_Physics = $("#txtTMP_Physics").val();
    var MOP_Physics = $("#txtMOP_Physics").val();
    var TMTP_Physics = $("#txtTMTP_Physics").val();
    var TMOTP_Physics = $("#txtTMOTP_Physics").val();

    var TMT_Chemistry = $("#txtTMT_Chemistry").val();
    var MOT_Chemistry = $("#txtMOT_Chemistry").val();
    var TMP_Chemistry = $("#txtTMP_Chemistry").val();
    var MOP_Chemistry = $("#txtMOP_Chemistry").val();
    var TMTP_Chemistry = $("#txtTMTP_Chemistry").val();
    var TMOTP_Chemistry = $("#txtTMOTP_Chemistry").val();

    var TMT_Math = $("#txtTMT_Maths").val();
    var MOT_Math = $("#txtMOT_Maths").val();
    var TMP_Math = $("#txtTMP_Maths").val();
    var MOP_Math = $("#txtMOP_Maths").val();
    var TMTP_Math = $("#txtTMTP_Maths").val();
    var TMOTP_Math = $("#txtTMOTP_Maths").val();

    var TMT_Botany = $("#txtTMT_Botany").val();
    var MOT_Botany = $("#txtMOT_Botany").val();
    var TMP_Botany = $("#txtTMP_Botany").val();
    var MOP_Botany = $("#txtMOP_Botany").val();
    var TMTP_Botany = $("#txtTMTP_Botany").val();
    var TMOTP_Botany = $("#txtTMOTP_Botany").val();

    var TMT_Zoology = $("#txtTMT_Zoology").val();
    var MOT_Zoology = $("#txtMOT_Zoology").val();
    var TMP_Zoology = $("#txtTMP_Zoology").val();
    var MOP_Zoology = $("#txtMOP_Zoology").val();
    var TMTP_Zoology = $("#txtTMTP_Zoology").val();
    var TMOTP_Zoology = $("#txtTMOTP_Zoology").val();

    var PCMPercentage = $("#lblPCM").text();// To Check Again
    var TMT_PCM = $("#txtTMT_PCM").text();
    var MOT_PCM = $("#txtMOT_PCM").text();
    var TMP_PCM = $("#txtTMP_PCM").text();
    var MOP_PCM = $("#txtMOP_PCM").text();
    var TMTP_PCM = $("#txtTMTP_PCM").text();
    var MOTP_PCM = $("#txtTMOTP_PCM").text();

    var TMT_PCB = $("#txtTMT_PCB").text();
    var MOT_PCB = $("#txtMOT_PCB").text();
    var TMP_PCB = $("#txtTMP_PCB").text();
    var MOP_PCB = $("#txtMOP_PCB").text();
    var TMTP_PCB = $("#txtTMTP_PCB").text();
    var MOTP_PCB = $("#txtTMOTP_PCB").text();
    var PCBPercentage = $("#lblPCB").text();// To Check Again


    var FormA_AppID = "";

    var qs9 = getQueryStrings();
    if (qs9["UID"] != null && qs9["AppID"] != null) {
        debugger;

        //var ProfileID = qs9["UID"];
        EditAppID = qs9["AppID"];
        FormA_AppID = EditAppID;
    }

    var HandicapType = $("input[name='HandicapType']:checked").val();

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var datavar = {
        'aadhaarNumber': $('#UID').val(),
        'FirstName': $('#FirstName').val(),
        'MiddleName': $('#MiddleName').val(),
        'LastName': $('#LastName').val(),
        'residentName': $('#FirstName').val(),
        'residentNameLocal': $('#FirstName').val(),
        'careOf': $('#FatherName').val(),
        'careOfLocal': $('#FatherName').val(),
        'dateOfBirth': DOBConverted,
        'gender': $('#ddlGender').val(),
        'phone': $('#phoneno').val(),
        'Mobile': $('#MobileNo').val(),
        'emailId': $('#EmailID').val(),

        'AgeYear': $('#AgeYear').val(),
        'AgeMonth': $('#AgeMonth').val(),
        'AgeDay': $('#AgeDay').val(),
        'Religion': $('#Religion').val(),
        'Category': $('#Category').val(),
        'Nationality': $('#nationality').val(),
        'stdcode': $('#stdcode').val(),

        'houseNumber': $("#PAddressLine1").val(),
        'houseNumberLocal': $("#PAddressLine1").val(),

        'landmark': $("#PLandMark").val(),
        'landmarkLocal': $("#PLandMark").val(),

        'locality': $("#PLocality").val(),
        'localityLocal': $("#PLocality").val(),

        'street': $("#PRoadStreetName").val(),
        'streetLocal': $("#PRoadStreetName").val(),

        'postOffice': $("#PAddressLine2").val(),
        'postOfficeLocal': $("#PAddressLine2").val(),

        'responseCode': '',
        'language': '1',

        'state': $('#PddlState').val(),
        'stateLocal': $('#PddlState').val(),
        'district': $('#PddlDistrict').val(),
        'districtLocal': $('#PddlDistrict').val(),
        'subDistrict': $('#PddlTaluka').val(),
        'subDistrictLocal': $('#PddlTaluka').val(),
        'Village': $('#PddlVillage').val(),
        'pincode': $('#PPinCode').val(),
        'pincodeLocal': $('#PPinCode').val(),

        //'Image': obj["photo"],
        'Image': $('#HFb64').val(),
        'phouseNumber': $("#CAddressLine1").val(),
        'plandmark': $("#CLandMark").val(),
        'plocality': $("#CLocality").val(),
        'pstreet': $("#CRoadStreetName").val(),
        'ppincode': $("#CPinCode").val(),
        'ppostOffice': $("#CAddressLine2").val(),

        'pstate': $('#CddlState').val(),
        'pdistrict': $('#CddlDistrict').val(),
        'psubDistrict': $('#CddlTaluka').val(),
        'pvillage': $('#CddlVillage').val(),

        'JSONData': '',
        'statecode': $('#CddlState').val(),
        'districtcode': $('#CddlDistrict').val(),
        'subDistrictcode': $('#CddlTaluka').val(),
        'Villagecode': $('#CddlVillage').val(),

        'Religion': Religion,
        'Category': Category,
        'Nationality': Nationality,


        'Section1_ReservedSeat': Section1_ReservedSeat,
        'Section1A_SeatCategory': Section1A_SeatCategory,

        'Section1_PassOdia': Section1_PassOdia,
        'Section1_AbililtyRead': Section1_AbililtyRead,
        'Section1_AbilityWrite': Section1_AbilityWrite,
        'Section1_AbilitySpeak': Section1_AbilitySpeak,
        'ResidentType': ResidentType,
        //'MILSubject': MILSubject,

        //'Section3_ExServiceMan': Section3_ExServiceMan,
        //'Section3A_ServiceRendered': Section3A_ServiceRendered,
        ////'Section3B_ServiceDuration': Section3B_ServiceDuration,
        //'Section3B_ServiceDurationFrom': Section3B_ServiceDurationFrom,
        //'Section3B_ServiceDurationTo': Section3B_ServiceDurationTo,
        //'Section3C_ServiceYear': Section3C_ServiceYear,
        //'Section3C_ServiceMonth': Section3C_ServiceMonth,
        //'Section3C_ServiceDay': Section3C_ServiceDay,

        //'Section4_IsSportsPerson': Section4_IsSportsPerson,
        //'Section4A_SportsParticipated': Section4A_SportsParticipated,
        //'Section4B_SportsOthers': Section4B_SportsOthers,
        //'Section4C_SportsFedAssName': Section4C_SportsFedAssName,
        //'Section4B_WantsRelaxation': Section4B_WantsRelaxation,
        //'Section4B_RelaxationHeight': Section4B_RelaxationHeight,
        //'Section4B_RelaxationChest': Section4B_RelaxationChest,
        //'Section4B_RelaxationWeight': Section4B_RelaxationWeight,

        ////'Section5_SportsPersonData': '',
        //'Section5A_ParticipateEvent': Section5A_ParticipateEvent,
        //'Section5B_SportsCategory': Section5B_SportsCategory,
        //'Section5C_SportsMedal': Section5C_SportsMedal,

        //'Section6_NCCCertificate': Section6_NCCCertificate,
        //'Section6A_NCCCertificateCategory': Section6A_NCCCertificateCategory,

        //'Section6_1_IsOUATEmployee': Section6_1_IsOUATEmployee,
        //'Section6_1_OUATEmployeeName': Section6_1_OUATEmployeeName,
        //'Section6_1_OUATEmployeeCode': Section6_1_OUATEmployeeCode,
        //'Section6_1_OUATEmployeeDesignation': Section6_1_OUATEmployeeDesignation,
        //'Section6_1_OUATEmployeeStatus': Section6_1_OUATEmployeeStatus,
        //'Section6_1_OUATEmployeeOffice': Section6_1_OUATEmployeeOffice,
        //'Section6_1_OUATEmployeeRelation': Section6_1_OUATEmployeeRelation,

        'GreenCardHolder': GreenCardHolder,
        'Physicallyhandicapped': PhysicalHandicap,
        'NRISponsership': NRISponsership,
        'WesternOdisha': westernodisha,
        'OUATEmployee': Ouatemployee,
        'Kashmirmigrant': kashmirmigrant,
        'HandicappedPart': HandicappedPart,
        'HandicappedPercent': HandiPercent,
        'WesternDistrict': ddlWesternDistrict,
        'KMFrom': txtKMFrom,
        'KMTo': txtKMTo,

        'ImageSign': $('#HFb64Sign').val(),

        'EduRollNo': $('#txtBoardRollNo').val(),
        //'EduState': $('#EddlBoardState').val(),
        'EduNameOfBoard': $('#txtBoardName').val(),
        'EduNameOfExamination': $('#txtExmntnName').val(),
        'EduPassingYear': $('#txtPssngYr option:selected').text(),//DropDown
        'EduGrade': $('#ddlPctgeCalclte').val(),
        //'EduExamCleared': $('#ddlPasstype').val(),
        'EduTotalMarks': $('#txtTotalMarks').val(),
        'EduMarkSecured': $('#txtMarkSecure').val(),
        'EduPercentage': $('#txtPercentage').val(),

        'Edu2RollNo': $('#txtBoardRollNo2').val(),
        //'Edu2State': $('#EddlBoardState2').val(),
        'Edu2NameOfBoard': $('#txtBoardName2').val(),
        'Edu2NameOfExamination': $('#txtExmntnName2').val(),
        'Edu2PassingYear': $('#txtPssngYr2 option:selected').text(),//DropDown
        'Edu2Grade': $('#ddlPctgeCalclte2').val(),
        //'Edu2ExamCleared': $('#ddlPasstype').val(),
        'Edu2TotalMarks': $('#txtTotalMarks2').val(),
        'Edu2MarkSecured': $('#txtMarkSecure2').val(),
        'Edu2Percentage': $('#txtPercentage2').val(),


        //'EduRollNoAgro': $('#txtBoardRollNoAgro').val(),
        //'EduStateAgro': $('#EddlBoardStateAgro').val(),
        //'EduNameOfBoardAgro': $('#ddlBoardAgro').val(),
        //'EduNameOfExaminationAgro': $('#txtExmntnNameAgro').val(),
        //'EduPassingYearAgro': $('#txtPssngYrAgro option:selected').text(),//DropDown
        //'EduGradeAgro': $('#ddlPctgeCalclteAgro').val(),
        ////'EduExamClearedAgro': $('#ddlPasstype').val(),
        //'EduTotalMarksAgro': $('#txtTotalMarksAgro').val(),
        //'EduMarkSecuredAgro': $('#txtMarkSecureAgro').val(),
        //'EduPercentageAgro': $('#txtPercentageAgro').val(),

        //'Section5': Section5,
        'ResponseType': ResponseType,
        'CitizenProfileID': ProfileID,


        'TMT_Physics': TMT_Physics,
        'MOT_Physics': MOT_Physics,
        'TMP_Physics': TMP_Physics,
        'MOP_Physics': MOP_Physics,
        'TMTP_Physics': TMTP_Physics,
        'TMOTP_Physics': TMOTP_Physics,
        'TMT_Chemistry': TMT_Chemistry,
        'MOT_Chemistry': MOT_Chemistry,
        'TMP_Chemistry': TMP_Chemistry,
        'MOP_Chemistry': MOP_Chemistry,
        'TMTP_Chemistry': TMTP_Chemistry,
        'TMOTP_Chemistry': TMOTP_Chemistry,
        'TMT_Math': TMT_Math,
        'MOT_Math': MOT_Math,
        'TMP_Math': TMP_Math,
        'MOP_Math': MOP_Math,
        'TMTP_Math': TMTP_Math,
        'TMOTP_Math': TMOTP_Math,
        'TMT_Botany': TMT_Botany,
        'MOT_Botany': MOT_Botany,
        'TMP_Botany': TMP_Botany,
        'MOP_Botany': MOP_Botany,
        'TMTP_Botany': TMTP_Botany,
        'TMOTP_Botany': TMOTP_Botany,
        'TMT_Zoology': TMT_Zoology,
        'MOT_Zoology': MOT_Zoology,
        'TMP_Zoology': TMP_Zoology,
        'MOP_Zoology': MOP_Zoology,
        'TMTP_Zoology': TMTP_Zoology,
        'TMOTP_Zoology': TMOTP_Zoology,
        'PCMPercentage': PCMPercentage,
        'TMT_PCM': TMT_PCM,
        'MOT_PCM': MOT_PCM,
        'TMP_PCM': TMP_PCM,
        'MOP_PCM': MOP_PCM,
        'TMTP_PCM': TMTP_PCM,
        'MOTP_PCM': MOTP_PCM,
        'TMT_PCB': TMT_PCB,
        'MOT_PCB': MOT_PCB,
        'TMP_PCB': TMP_PCB,
        'MOP_PCB': MOP_PCB,
        'TMTP_PCB': TMTP_PCB,
        'MOTP_PCB': MOTP_PCB,
        'PCBPercentage': PCBPercentage,
        'ExamType': ExamType,
        'MotherName': MotherName,
        'MotherTongue': MotherTongue,
        'HandicapType': HandicapType

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
            url: '/WebApp/Kiosk/OUAT/FormB.aspx/InsertData',
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
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;

            if (result /*&& jqXHRData_IMG_result*/) {
                $("#progressbar").hide();
                alertPopup("Requirement of Constable", "Application saved successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=403&AppID=' + obj.AppID;
                window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessBar.aspx?SvcID=405&AppID=' + obj.AppID + '&FormA_AppID=' + FormA_AppID;
            }
            else {
                $("#progressbar").hide();
                alertPopup("Form Validation Failed", "Unable to save Applicatin, Please refresh the browser and try again");
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function GetStateAsPerUID(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=ddlState]").empty();
                $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByText("ddlState", p_State);



                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id=ddlDistrict]").empty();
                        $("[id=ddlDistrict]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByText("ddlDistrict", p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);


                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id=ddlTaluka]").empty();
                                    $("[id=ddlTaluka]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByText("ddlTaluka", p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '../../Registration/KioskRegistration.aspx/GetVillage',
                                        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                        processData: false,
                                        dataType: "json",
                                        success: function (response) {
                                            var Category = eval(response.d);
                                            var html = "";
                                            var catCount = 0;
                                            $("[id=ddlVillage]").empty();
                                            $("[id=ddlVillage]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByText("ddlVillage", p_Village);
                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }


                                    });



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

//function AppType() {
//    var AppType = $("#ddlApplication option:selected").val();

//    $('#ddlAppPref').prop('disabled', true);
//    if (chkPreference){
//    if (AppType == '101') {
//        $('#ddlAppPref').val('102'); $('#chkPreference').prop('disabled', false);
//    }
//    else if (AppType == '102') { $('#ddlAppPref').val('101'); $('#chkPreference').prop('disabled', false); }
//    else {
//        $('#ddlAppPref').val('0');
//        $('#ddlAppPref').hide();
//        chkPreference.checked = false;
//        $('#chkPreference').prop('disabled', true);
//    }}
//}

//function PreferenceChoice(chkPreference) {

//    if (chkPreference) {
//        $('#ddlAppPref').show();
//    }
//    else { $('#ddlAppPref').hide(); }
//}


function downloadAnnexure3() {
    var p_URL = "";
    window.open(p_URL + "?SvcID=" + SvcID + "&UID=" + UID + "&AppID=" + AppID,
                          ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
    return false;
}

function downloadAnnexure5() {
    var p_URL = "";
    window.open(p_URL + "?SvcID=" + SvcID + "&UID=" + UID + "&AppID=" + AppID,
                          ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
    return false;
}


function TotalMarksInTheory() {

    /*Start - Total Vertical*/

    var txtTMT_Physics = $('#txtTMT_Physics').val();
    var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
    var txtTMT_Maths = $('#txtTMT_Maths').val();
    var txtTMT_Botany = $('#txtTMT_Botany').val();
    var txtTMT_Zoology = $('#txtTMT_Zoology').val();
    var Total_Theory = 0;

    if (txtTMT_Physics == null || txtTMT_Physics == "") { txtTMT_Physics = 0; }
    if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") { txtTMT_Chemistry = 0; }
    if (txtTMT_Maths == null || txtTMT_Maths == "") { txtTMT_Maths = 0; }
    if (txtTMT_Botany == null || txtTMT_Botany == "") { txtTMT_Botany = 0; }
    if (txtTMT_Zoology == null || txtTMT_Zoology == "") { txtTMT_Zoology = 0; }

    Total_Theory = (parseInt(txtTMT_Physics)) + (parseInt(txtTMT_Chemistry)) + (parseInt(txtTMT_Maths)) + (parseInt(txtTMT_Botany)) + (parseInt(txtTMT_Zoology));
    $('#txtTMT_Total').text(Total_Theory);


    var txtMOT_Physics = $('#txtMOT_Physics').val();
    var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
    var txtMOT_Maths = $('#txtMOT_Maths').val();
    var txtMOT_Botany = $('#txtMOT_Botany').val();
    var txtMOT_Zoology = $('#txtMOT_Zoology').val();
    var Total_Theory_Obtained = 0;

    if (txtMOT_Physics == null || txtMOT_Physics == "") { txtMOT_Physics = 0; }
    if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") { txtMOT_Chemistry = 0; }
    if (txtMOT_Maths == null || txtMOT_Maths == "") { txtMOT_Maths = 0; }
    if (txtMOT_Botany == null || txtMOT_Botany == "") { txtMOT_Botany = 0; }
    if (txtMOT_Zoology == null || txtMOT_Zoology == "") { txtMOT_Zoology = 0; }

    Total_Theory_Obtained = (parseInt(txtMOT_Physics)) + (parseInt(txtMOT_Chemistry)) + (parseInt(txtMOT_Maths)) + (parseInt(txtMOT_Botany)) + (parseInt(txtMOT_Zoology));
    $('#txtMOT_Total').text(Total_Theory_Obtained);


    var txtTMP_Physics = $('#txtTMP_Physics').val();
    var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
    var txtTMP_Maths = $('#txtTMP_Maths').val();
    var txtTMP_Botany = $('#txtTMP_Botany').val();
    var txtTMP_Zoology = $('#txtTMP_Zoology').val();
    var Total_Practical = 0;

    if (txtTMP_Physics == null || txtTMP_Physics == "") { txtTMP_Physics = 0; }
    if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") { txtTMP_Chemistry = 0; }
    if (txtTMP_Maths == null || txtTMP_Maths == "") { txtTMP_Maths = 0; }
    if (txtTMP_Botany == null || txtTMP_Botany == "") { txtTMP_Botany = 0; }
    if (txtTMP_Zoology == null || txtTMP_Zoology == "") { txtTMP_Zoology = 0; }

    Total_Practical = (parseInt(txtTMP_Physics)) + (parseInt(txtTMP_Chemistry)) + (parseInt(txtTMP_Maths)) + (parseInt(txtTMP_Botany)) + (parseInt(txtTMP_Zoology));
    $('#txtTMP_Total').text(Total_Practical);


    var txtMOP_Physics = $('#txtMOP_Physics').val();
    var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();
    var txtMOP_Maths = $('#txtMOP_Maths').val();
    var txtMOP_Botany = $('#txtMOP_Botany').val();
    var txtMOP_Zoology = $('#txtMOP_Zoology').val();
    var Total_MarksObtained = 0;

    if (txtMOP_Physics == null || txtMOP_Physics == "") { txtMOP_Physics = 0; }
    if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") { txtMOP_Chemistry = 0; }
    if (txtMOP_Maths == null || txtMOP_Maths == "") { txtMOP_Maths = 0; }
    if (txtMOP_Botany == null || txtMOP_Botany == "") { txtMOP_Botany = 0; }
    if (txtMOP_Zoology == null || txtMOP_Zoology == "") { txtMOP_Zoology = 0; }

    Total_MarksObtained = (parseInt(txtMOP_Physics)) + (parseInt(txtMOP_Chemistry)) + (parseInt(txtMOP_Maths)) + (parseInt(txtMOP_Botany)) + (parseInt(txtMOP_Zoology));
    $('#txtMOP_Total').text(Total_MarksObtained);


    var txtTMTP_Physics = $('#txtTMTP_Physics').val();
    var txtTMTP_Chemistry = $('#txtTMTP_Chemistry').val();
    var txtTMTP_Maths = $('#txtTMTP_Maths').val();
    var txtTMTP_Botany = $('#txtTMTP_Botany').val();
    var txtTMTP_Zoology = $('#txtTMTP_Zoology').val();
    var Total_Theory_Practical = 0;

    if (txtTMTP_Physics == null || txtTMTP_Physics == "") { txtTMTP_Physics = 0; }
    if (txtTMTP_Chemistry == null || txtTMTP_Chemistry == "") { txtTMTP_Chemistry = 0; }
    if (txtTMTP_Maths == null || txtTMTP_Maths == "") { txtTMTP_Maths = 0; }
    if (txtTMTP_Botany == null || txtTMTP_Botany == "") { txtTMTP_Botany = 0; }
    if (txtTMTP_Zoology == null || txtTMTP_Zoology == "") { txtTMTP_Zoology = 0; }

    Total_Theory_Practical = (parseInt(txtTMTP_Physics)) + (parseInt(txtTMTP_Chemistry)) + (parseInt(txtTMTP_Maths)) + (parseInt(txtTMTP_Botany)) + (parseInt(txtTMTP_Zoology));
    $('#txtTMTP_Total').text(Total_Theory_Practical);


    var txtTMOTP_Physics = $('#txtTMOTP_Physics').val();
    var txtTMOTP_Chemistry = $('#txtTMOTP_Chemistry').val();
    var txtTMOTP_Maths = $('#txtTMOTP_Maths').val();
    var txtTMOTP_Botany = $('#txtTMOTP_Botany').val();
    var txtTMOTP_Zoology = $('#txtTMOTP_Zoology').val();
    var Total_Theory_MarkObtain = 0;

    if (txtTMOTP_Physics == null || txtTMOTP_Physics == "") { txtTMOTP_Physics = 0; }
    if (txtTMOTP_Chemistry == null || txtTMOTP_Chemistry == "") { txtTMOTP_Chemistry = 0; }
    if (txtTMOTP_Maths == null || txtTMOTP_Maths == "") { txtTMOTP_Maths = 0; }
    if (txtTMOTP_Botany == null || txtTMOTP_Botany == "") { txtTMOTP_Botany = 0; }
    if (txtTMOTP_Zoology == null || txtTMOTP_Zoology == "") { txtTMOTP_Zoology = 0; }

    Total_Theory_MarkObtain = (parseInt(txtTMOTP_Physics)) + (parseInt(txtTMOTP_Chemistry)) + (parseInt(txtTMOTP_Maths)) + (parseInt(txtTMOTP_Botany)) + (parseInt(txtTMOTP_Zoology));
    $('#txtTMOTP_Total').text(Total_Theory_MarkObtain);
    /*End - Total Vertical*/





    /* Start Total Theory + Total Practical */

    var txtTMT_Physics = $('#txtTMT_Physics').val();
    var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
    var txtTMT_Maths = $('#txtTMT_Maths').val();
    var txtTMT_Botany = $('#txtTMT_Botany').val();
    var txtTMT_Zoology = $('#txtTMT_Zoology').val();
    var Total_Theory_Practical_Physics = 0;
    var Total_Theory_Practical_Chemistry = 0;
    var Total_Theory_Practical_Maths = 0;
    var Total_Theory_Practical_Botany = 0;
    var Total_Theory_Practical_Zoology = 0;

    if (txtTMT_Physics == null || txtTMT_Physics == "") { txtTMT_Physics = 0; }
    if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") { txtTMT_Chemistry = 0; }
    if (txtTMT_Maths == null || txtTMT_Maths == "") { txtTMT_Maths = 0; }
    if (txtTMT_Botany == null || txtTMT_Botany == "") { txtTMT_Botany = 0; }
    if (txtTMT_Zoology == null || txtTMT_Zoology == "") { txtTMT_Zoology = 0; }

    Total_Theory_Practical_Physics = (parseInt(txtTMT_Physics));
    Total_Theory_Practical_Chemistry = (parseInt(txtTMT_Chemistry));
    Total_Theory_Practical_Maths = (parseInt(txtTMT_Maths));
    Total_Theory_Practical_Botany = (parseInt(txtTMT_Botany));
    Total_Theory_Practical_Zoology = (parseInt(txtTMT_Zoology));

    var txtTMP_Physics = $('#txtTMP_Physics').val();
    var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
    var txtTMP_Maths = $('#txtTMP_Maths').val();
    var txtTMP_Botany = $('#txtTMP_Botany').val();
    var txtTMP_Zoology = $('#txtTMP_Zoology').val();

    var Total_Theory_Practical2_Physics = 0;
    var Total_Theory_Practical2_Chemistry = 0;
    var Total_Theory_Practical2_Maths = 0;
    var Total_Theory_Practical2_Botany = 0;
    var Total_Theory_Practical2_Zoology = 0;

    Total_Theory_Practical2_Physics = (parseInt(txtTMP_Physics));
    Total_Theory_Practical2_Chemistry = (parseInt(txtTMP_Chemistry));
    Total_Theory_Practical2_Maths = (parseInt(txtTMP_Maths));
    Total_Theory_Practical2_Botany = (parseInt(txtTMP_Botany));
    Total_Theory_Practical2_Zoology = (parseInt(txtTMP_Zoology));

    if (txtTMP_Physics == null || txtTMP_Physics == "") { txtTMP_Physics = 0; }
    if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") { txtTMP_Chemistry = 0; }
    if (txtTMP_Maths == null || txtTMP_Maths == "") { txtTMP_Maths = 0; }
    if (txtTMP_Botany == null || txtTMP_Botany == "") { txtTMP_Botany = 0; }
    if (txtTMP_Zoology == null || txtTMP_Zoology == "") { txtTMP_Zoology = 0; }

    Total_Theory_Practical2_Physics = (parseInt(txtTMP_Physics));
    Total_Theory_Practical2_Chemistry = (parseInt(txtTMP_Chemistry));
    Total_Theory_Practical2_Maths = (parseInt(txtTMP_Maths));
    Total_Theory_Practical2_Botany = (parseInt(txtTMP_Botany));
    Total_Theory_Practical2_Zoology = (parseInt(txtTMP_Zoology));

    Total_Theory_Practical_Physics = Total_Theory_Practical_Physics + Total_Theory_Practical2_Physics;
    Total_Theory_Practical_Chemistry = Total_Theory_Practical_Chemistry + Total_Theory_Practical2_Chemistry;
    Total_Theory_Practical_Maths = Total_Theory_Practical_Maths + Total_Theory_Practical2_Maths;
    Total_Theory_Practical_Botany = Total_Theory_Practical_Botany + Total_Theory_Practical2_Botany;
    Total_Theory_Practical_Zoology = Total_Theory_Practical_Zoology + Total_Theory_Practical2_Zoology;

    $('#txtTMTP_Physics').val(Total_Theory_Practical_Physics);
    $('#txtTMTP_Chemistry').val(Total_Theory_Practical_Chemistry);
    $('#txtTMTP_Maths').val(Total_Theory_Practical_Maths);
    $('#txtTMTP_Botany').val(Total_Theory_Practical_Botany);
    $('#txtTMTP_Zoology').val(Total_Theory_Practical_Zoology);



    /* End Total Theory + Total Practical */


    /**/
    var txtMOT_Physics = $('#txtMOT_Physics').val();
    var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
    var txtMOT_Maths = $('#txtMOT_Maths').val();
    var txtMOT_Botany = $('#txtMOT_Botany').val();
    var txtMOT_Zoology = $('#txtMOT_Zoology').val();
    var Total_Theory_MarkObtain_Physics = 0;
    var Total_Theory_MarkObtain_Chemistry = 0;
    var Total_Theory_MarkObtain_Maths = 0;
    var Total_Theory_MarkObtain_Botany = 0;
    var Total_Theory_MarkObtain_Zoology = 0;

    if (txtMOT_Physics == null || txtMOT_Physics == "") { txtMOT_Physics = 0; }
    if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") { txtMOT_Chemistry = 0; }
    if (txtMOT_Maths == null || txtMOT_Maths == "") { txtMOT_Maths = 0; }
    if (txtMOT_Botany == null || txtMOT_Botany == "") { txtMOT_Botany = 0; }
    if (txtMOT_Zoology == null || txtMOT_Zoology == "") { txtMOT_Zoology = 0; }

    Total_Theory_MarkObtain_Physics = (parseInt(txtMOT_Physics));
    Total_Theory_MarkObtain_Chemistry = (parseInt(txtMOT_Chemistry));
    Total_Theory_MarkObtain_Maths = (parseInt(txtMOT_Maths));
    Total_Theory_MarkObtain_Botany = (parseInt(txtMOT_Botany));
    Total_Theory_MarkObtain_Zoology = (parseInt(txtMOT_Zoology));

    var txtMOP_Physics = $('#txtMOP_Physics').val();
    var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();
    var txtMOP_Maths = $('#txtMOP_Maths').val();
    var txtMOP_Botany = $('#txtMOP_Botany').val();
    var txtMOP_Zoology = $('#txtMOP_Zoology').val();

    var Total_Theory_MarkObtain2_Physics = 0;
    var Total_Theory_MarkObtain2_Chemistry = 0;
    var Total_Theory_MarkObtain2_Maths = 0;
    var Total_Theory_MarkObtain2_Botany = 0;
    var Total_Theory_MarkObtain2_Zoology = 0;

    if (txtMOP_Physics == null || txtMOP_Physics == "") { txtMOP_Physics = 0; }
    if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") { txtMOP_Chemistry = 0; }
    if (txtMOP_Maths == null || txtMOP_Maths == "") { txtMOP_Maths = 0; }
    if (txtMOP_Botany == null || txtMOP_Botany == "") { txtMOP_Botany = 0; }
    if (txtMOP_Zoology == null || txtMOP_Zoology == "") { txtMOP_Zoology = 0; }

    Total_Theory_MarkObtain2_Physics = (parseInt(txtMOP_Physics));
    Total_Theory_MarkObtain2_Chemistry = (parseInt(txtMOP_Chemistry));
    Total_Theory_MarkObtain2_Maths = (parseInt(txtMOP_Maths));
    Total_Theory_MarkObtain2_Botany = (parseInt(txtMOP_Botany));
    Total_Theory_MarkObtain2_Zoology = (parseInt(txtMOP_Zoology));

    Total_Theory_MarkObtain_Physics = Total_Theory_MarkObtain_Physics + Total_Theory_MarkObtain2_Physics;
    Total_Theory_MarkObtain_Chemistry = Total_Theory_MarkObtain_Chemistry + Total_Theory_MarkObtain2_Chemistry;
    Total_Theory_MarkObtain_Maths = Total_Theory_MarkObtain_Maths + Total_Theory_MarkObtain2_Maths;
    Total_Theory_MarkObtain_Botany = Total_Theory_MarkObtain_Botany + Total_Theory_MarkObtain2_Botany;
    Total_Theory_MarkObtain_Zoology = Total_Theory_MarkObtain_Zoology + Total_Theory_MarkObtain2_Zoology;

    $('#txtTMOTP_Physics').val(Total_Theory_MarkObtain_Physics);
    $('#txtTMOTP_Chemistry').val(Total_Theory_MarkObtain_Chemistry);
    $('#txtTMOTP_Maths').val(Total_Theory_MarkObtain_Maths);
    $('#txtTMOTP_Botany').val(Total_Theory_MarkObtain_Botany);
    $('#txtTMOTP_Zoology').val(Total_Theory_MarkObtain_Zoology);


    /**/


    /*Start - PCM*/

    var txtTMT_Physics = $('#txtTMT_Physics').val();
    var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
    var txtTMT_Maths = $('#txtTMT_Maths').val();
    var Total_PCM = 0;

    if (txtTMT_Physics == null || txtTMT_Physics == "") { txtTMT_Physics = 0; }
    if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") { txtTMT_Chemistry = 0; }
    if (txtTMT_Maths == null || txtTMT_Maths == "") { txtTMT_Maths = 0; }

    Total_PCM = (parseInt(txtTMT_Physics)) + (parseInt(txtTMT_Chemistry)) + (parseInt(txtTMT_Maths));
    $('#txtTMT_PCM').text(Total_PCM);


    var txtMOT_Physics = $('#txtMOT_Physics').val();
    var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
    var txtMOT_Maths = $('#txtMOT_Maths').val();
    var Total_MOT_PCM = 0;

    if (txtMOT_Physics == null || txtMOT_Physics == "") { txtMOT_Physics = 0; }
    if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") { txtMOT_Chemistry = 0; }
    if (txtMOT_Maths == null || txtMOT_Maths == "") { txtMOT_Maths = 0; }

    Total_MOT_PCM = (parseInt(txtMOT_Physics)) + (parseInt(txtMOT_Chemistry)) + (parseInt(txtMOT_Maths));
    $('#txtMOT_PCM').text(Total_MOT_PCM);


    var txtTMP_Physics = $('#txtTMP_Physics').val();
    var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
    var txtTMP_Maths = $('#txtTMP_Maths').val();
    var Total_TMP_PCM = 0;

    if (txtTMP_Physics == null || txtTMP_Physics == "") { txtTMP_Physics = 0; }
    if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") { txtTMP_Chemistry = 0; }
    if (txtTMP_Maths == null || txtTMP_Maths == "") { txtTMP_Maths = 0; }

    Total_TMP_PCM = (parseInt(txtTMP_Physics)) + (parseInt(txtTMP_Chemistry)) + (parseInt(txtTMP_Maths));
    $('#txtTMP_PCM').text(Total_TMP_PCM);


    var txtMOP_Physics = $('#txtMOP_Physics').val();
    var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();
    var txtMOP_Maths = $('#txtMOP_Maths').val();
    var Total_MOP_PCM = 0;

    if (txtMOP_Physics == null || txtMOP_Physics == "") { txtMOP_Physics = 0; }
    if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") { txtMOP_Chemistry = 0; }
    if (txtMOP_Maths == null || txtMOP_Maths == "") { txtMOP_Maths = 0; }

    debugger;
    Total_MOP_PCM = (parseInt(txtMOP_Physics)) + (parseInt(txtMOP_Chemistry)) + (parseInt(txtMOP_Maths));
    $('#txtMOP_PCM').text(Total_MOP_PCM);


    var txtTMTP_Physics = $('#txtTMTP_Physics').val();
    var txtTMTP_Chemistry = $('#txtTMTP_Chemistry').val();
    var txtTMTP_Maths = $('#txtTMTP_Maths').val();
    var Total_TMTP_PCM = 0;

    if (txtTMTP_Physics == null || txtTMTP_Physics == "") { txtTMTP_Physics = 0; }
    if (txtTMTP_Chemistry == null || txtTMTP_Chemistry == "") { txtTMTP_Chemistry = 0; }
    if (txtTMTP_Maths == null || txtTMTP_Maths == "") { txtTMTP_Maths = 0; }

    Total_TMTP_PCM = (parseInt(txtTMTP_Physics)) + (parseInt(txtTMTP_Chemistry)) + (parseInt(txtTMTP_Maths));
    $('#txtTMTP_PCM').text(Total_TMTP_PCM);




    var txtTMOTP_Physics = $('#txtTMOTP_Physics').val();
    var txtTMOTP_Chemistry = $('#txtTMOTP_Chemistry').val();
    var txtTMOTP_Maths = $('#txtTMOTP_Maths').val();
    var Total_TMOTP_PCM = 0;

    if (txtTMOTP_Physics == null || txtTMOTP_Physics == "") { txtTMOTP_Physics = 0; }
    if (txtTMOTP_Chemistry == null || txtTMOTP_Chemistry == "") { txtTMOTP_Chemistry = 0; }
    if (txtTMOTP_Maths == null || txtTMOTP_Maths == "") { txtTMOTP_Maths = 0; }

    Total_TMOTP_PCM = (parseInt(txtTMOTP_Physics)) + (parseInt(txtTMOTP_Chemistry)) + (parseInt(txtTMOTP_Maths));
    $('#txtTMOTP_PCM').text(Total_TMOTP_PCM);



    /*End - PCM*/

    /*Start - PCB*/

    var txtTMT_Physics = $('#txtTMT_Physics').val();
    var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
    var txtTMT_Botany = $('#txtTMT_Botany').val();
    var txtTMT_Zoology = $('#txtTMT_Zoology').val();
    var Total_PCB = 0;

    if (txtTMT_Physics == null || txtTMT_Physics == "") { txtTMT_Physics = 0; }
    if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") { txtTMT_Chemistry = 0; }
    if (txtTMT_Botany == null || txtTMT_Botany == "") { txtTMT_Botany = 0; }
    if (txtTMT_Zoology == null || txtTMT_Zoology == "") { txtTMT_Zoology = 0; }

    Total_PCB = (parseInt(txtTMT_Physics)) + (parseInt(txtTMT_Chemistry)) + (parseInt(txtTMT_Botany)) + (parseInt(txtTMT_Zoology));
    $('#txtTMT_PCB').text(Total_PCB);


    var txtMOT_Physics = $('#txtMOT_Physics').val();
    var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
    var txtMOT_Botany = $('#txtMOT_Botany').val();
    var txtMOT_Zoology = $('#txtMOT_Zoology').val();
    var Total_MOT_PCB = 0;

    if (txtMOT_Physics == null || txtMOT_Physics == "") { txtMOT_Physics = 0; }
    if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") { txtMOT_Chemistry = 0; }
    if (txtMOT_Botany == null || txtMOT_Botany == "") { txtMOT_Botany = 0; }
    if (txtMOT_Zoology == null || txtMOT_Zoology == "") { txtMOT_Zoology = 0; }

    Total_MOT_PCB = (parseInt(txtMOT_Physics)) + (parseInt(txtMOT_Chemistry)) + (parseInt(txtMOT_Botany)) + (parseInt(txtMOT_Zoology));
    $('#txtMOT_PCB').text(Total_MOT_PCB);


    var txtTMP_Physics = $('#txtTMP_Physics').val();
    var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
    var txtTMP_Botany = $('#txtTMP_Botany').val();
    var txtTMP_Zoology = $('#txtTMP_Zoology').val();
    var Total_TMP_PCB = 0;

    if (txtTMP_Physics == null || txtTMP_Physics == "") { txtTMP_Physics = 0; }
    if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") { txtTMP_Chemistry = 0; }
    if (txtTMP_Botany == null || txtTMP_Botany == "") { txtTMP_Botany = 0; }
    if (txtTMP_Zoology == null || txtTMP_Zoology == "") { txtTMP_Zoology = 0; }

    Total_TMP_PCB = (parseInt(txtTMP_Physics)) + (parseInt(txtTMP_Chemistry)) + (parseInt(txtTMP_Botany)) + (parseInt(txtTMP_Zoology));
    $('#txtTMP_PCB').text(Total_TMP_PCB);


    var txtMOP_Physics = $('#txtMOP_Physics').val();
    var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();
    var txtMOP_Botany = $('#txtMOP_Botany').val();
    var txtMOP_Zoology = $('#txtMOP_Zoology').val();
    var Total_MOP_PCB = 0;

    if (txtMOP_Physics == null || txtMOP_Physics == "") { txtMOP_Physics = 0; }
    if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") { txtMOP_Chemistry = 0; }
    if (txtMOP_Botany == null || txtMOP_Botany == "") { txtMOP_Botany = 0; }
    if (txtMOP_Zoology == null || txtMOP_Zoology == "") { txtMOP_Zoology = 0; }

    debugger;
    Total_MOP_PCB = (parseInt(txtMOP_Physics)) + (parseInt(txtMOP_Chemistry)) + (parseInt(txtMOP_Botany)) + (parseInt(txtMOP_Zoology));
    //Total_MOP_PCB = (parseInt(txtTMT_Physics)) + (parseInt(txtTMT_Chemistry)) + (parseInt(txtTMT_Botany)) + (parseInt(txtTMT_Zoology));

    $('#txtMOP_PCB').text(Total_MOP_PCB);


    var txtTMTP_Physics = $('#txtTMTP_Physics').val();
    var txtTMTP_Chemistry = $('#txtTMTP_Chemistry').val();
    var txtTMTP_Botany = $('#txtTMTP_Botany').val();
    var txtTMTP_Zoology = $('#txtTMTP_Zoology').val();
    var Total_TMTP_PCB = 0;

    if (txtTMTP_Physics == null || txtTMTP_Physics == "") { txtTMTP_Physics = 0; }
    if (txtTMTP_Chemistry == null || txtTMTP_Chemistry == "") { txtTMTP_Chemistry = 0; }
    if (txtTMTP_Botany == null || txtTMTP_Botany == "") { txtTMTP_Botany = 0; }
    if (txtTMTP_Zoology == null || txtTMTP_Zoology == "") { txtTMTP_Zoology = 0; }

    Total_TMTP_PCB = (parseInt(txtTMTP_Physics)) + (parseInt(txtTMTP_Chemistry)) + (parseInt(txtTMTP_Botany)) + (parseInt(txtTMTP_Zoology));
    $('#txtTMTP_PCB').text(Total_TMTP_PCB);




    var txtTMOTP_Physics = $('#txtTMOTP_Physics').val();
    var txtTMOTP_Chemistry = $('#txtTMOTP_Chemistry').val();
    var txtTMOTP_Botany = $('#txtTMOTP_Botany').val();
    var txtTMOTP_Zoology = $('#txtTMOTP_Zoology').val();
    var Total_TMOTP_PCB = 0;

    if (txtTMOTP_Physics == null || txtTMOTP_Physics == "") { txtTMOTP_Physics = 0; }
    if (txtTMOTP_Chemistry == null || txtTMOTP_Chemistry == "") { txtTMOTP_Chemistry = 0; }
    if (txtTMOTP_Botany == null || txtTMOTP_Botany == "") { txtTMOTP_Botany = 0; }
    if (txtTMOTP_Zoology == null || txtTMOTP_Zoology == "") { txtTMOTP_Zoology = 0; }

    Total_TMOTP_PCB = (parseInt(txtTMOTP_Physics)) + (parseInt(txtTMOTP_Chemistry)) + (parseInt(txtTMOTP_Botany)) + (parseInt(txtTMOTP_Zoology));
    $('#txtTMOTP_PCB').text(Total_TMOTP_PCB);

    /*End - PCB*/


    /*NIRAJ*/
    debugger;

    if (txtTMT_Maths == 0) {
        //Total_TMOTP_PCM = Total_TMOTP_PCM + (parseInt(txtTMT_Botany));
        $('#lblPCM').hide();
        $('#lblPCB').show();

    } else if (txtTMT_Botany == 0 && txtTMT_Zoology == 0) {
        $('#lblPCB').hide();
        $('#lblPCM').show();

    } else if (txtTMT_Botany == 0) {
        //Total_TMOTP_PCB = Total_TMOTP_PCB + (parseInt(txtTMP_Maths));
        $('#lblPCB').hide();
        $('#lblPCM').show();

    } else {
        $('#lblPCB').show();
        $('#lblPCM').show();
    }

    var lblPCM = (Total_TMOTP_PCM / Total_TMTP_PCM) * 100;

    var lblPCB = Total_TMOTP_PCB / Total_TMTP_PCB * 100;
    $('#lblPCM').text(parseFloat(lblPCM.toFixed(2)) + '%');
    $('#lblPCB').text(parseFloat(lblPCB.toFixed(2)) + '%');
    /*NIRAJ*/

}

function fnReservationQuota() {

    if (CheckBoxList1_0.checked) { $('#divGCH').show(500); } else { $('#divGCH').hide(500); }
    if (CheckBoxList1_1.checked) {
        $('#divPH').show(500);
        $('#txtHandicappedPart').val("");
        $('#txtHandiPercent').val("");

    } else {
        $('#divPH').hide(500);
        $('#txtHandicappedPart').val("");
        $('#txtHandiPercent').val("");
    }
    if (CheckBoxList1_2.checked) { $('#divNRI').show(500); } else { $('#divNRI').hide(500); }
    if (CheckBoxList1_4.checked) {
        $('#divEmplyeeCase').show(500);
        $('#divOtherInfoDomicile').hide(500);

    } else {
        $('#divEmplyeeCase').hide(500);
        $('#divOtherInfoDomicile').show(500);

    }
    if (CheckBoxList1_3.checked) { $('#divWO').show(500); } else { $('#divWO').hide(500); }
    if (CheckBoxList1_5.checked) { $('#divKM').show(500); } else { $('#divKM').hide(500); }
}

function fuMarksPartern(strvalue) {
    checked();

    $("#divMarks").show();
    if (strvalue == '0') {
        $("#lblTheoryTotal").text("Total Marks");
        $("#lblTheoryObtain").text("Marks Obtain");
        $("#lblPractTotal").text("Total Marks ");
        $("#lblPractObtain").text("Marks Obtain");
        $("#lblMarks").text("Total Marks");
        $("#lblObtain").text("Marks Obtain");

        $("#thPTM").hide();
        $("#tdPTMP").hide();
        $("#tdPTMC").hide();
        $("#tdPTMPM").hide();
        $("#tdPTMB").hide();
        $("#tdPTMPZ").hide();
        $("#tdPTMT").hide();
        $("#tdPTMPTPCM").hide();
        $("#tdPTMPTPCB").hide();

        $("#thPMO").hide();
        $("#thPMOP").hide();
        $("#thPMOC").hide();
        $("#thPMOM").hide();
        $("#thPMOB").hide();
        $("#thPMOZ").hide();
        $("#thPMOT").hide();
        $("#thPMOPCM").hide();
        $("#thPMOPCB").hide();

        $("#trZoo").hide();
        $("#ddlSubjectBio").text("Biology");
    }
    else {
        $("#lblTheoryTotal").text("Total Marks in Theory");
        $("#lblTheoryObtain").text("Marks Obtain in Theory");
        $("#lblPractTotal").text("Total Marks in Practical");
        $("#lblPractObtain").text("Marks Obtain in Practical");
        $("#lblMarks").text("Total Marks (Theory + Practical)");
        $("#lblObtain").text("Total Mark Obtain (Theory + Practical)");
        $("#ddlSubjectBio").text("Botany");

        $("#trZoo").show();

        $("#thPTM").show();
        $("#tdPTMP").show();
        $("#tdPTMC").show();
        $("#tdPTMPM").show();
        $("#tdPTMB").show();
        $("#tdPTMPZ").show();
        $("#tdPTMT").show();
        $("#tdPTMPTPCM").show();
        $("#tdPTMPTPCB").show();

        $("#thPMO").show();
        $("#thPMOP").show();
        $("#thPMOC").show();
        $("#thPMOM").show();
        $("#thPMOB").show();
        $("#thPMOZ").show();
        $("#thPMOT").show();
        $("#thPMOPCM").show();
        $("#thPMOPCB").show();


    }
}

debugger;
function checked() {
    var MarksPatarn = $("input[name='marks']:checked").val();
    if (MarksPatarn == "yes2") {
        $("#txtTMT_Physics").val("");
        $("#txtMOT_Physics").val("");
        $("#txtTMT_Chemistry").val("");
        $("#txtMOT_Chemistry").val("");
        $("#txtTMT_Maths").val("");
        $("#txtMOT_Maths").val("");
        $("#txtTMT_Botany").val("");
        $("#txtMOT_Botany").val("");
        $("#txtTMT_Zoology").val("");
        $("#txtMOT_Zoology").val("");
        $("#txtTMTP_Physics").val("");//total marks
        $("#txtTMOTP_Physics").val("");
        $("#txtTMTP_Chemistry").val("");
        $("#txtTMOTP_Chemistry").val("");
        $("#txtTMTP_Maths").val("");
        $("#txtTMOTP_Maths").val("");
        $("#txtTMTP_Botany").val("");
        $("#txtTMOTP_Botany").val("");
        $("#txtTMTP_Zoology").val("");
        $("#txtTMOTP_Zoology").val("");
        $("#txtTMP_PCM").text("");
        $("#txtTMP_PCB").text("");
        $("#txtTMT_PCM").text("");//
        $("#txtTMT_PCB").text("");
        $("#txtMOT_PCM").text("");
        $("#txtMOT_PCB").text("");
        $("#txtMOP_PCM").text("");
        $("#txtTMP_PCB").text("");
        $("#txtMOP_PCM").text("");
        $("#txtMOP_PCB").text("");
        $("#txtTMTP_PCM").text("");
        $("#txtTMTP_PCB").text("");
        $("#txtTMOTP_PCM").text("");
        $("#txtTMOTP_PCB").text("");




        $("#txtTMT_Physics").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMT_Physics").css({ "background-color": "#ffffff" });

        $("#txtMOT_Physics").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOT_Physics").css({ "background-color": "#ffffff" });

        $("#txtTMP_Physics").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMP_Physics").css({ "background-color": "#ffffff" });

        $("#txtMOP_Physics").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOP_Physics").css({ "background-color": "#ffffff" });

        $("#txtTMT_Chemistry").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMT_Chemistry").css({ "background-color": "#ffffff" });

        $("#txtMOT_Chemistry").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOT_Chemistry").css({ "background-color": "#ffffff" });


        $("#txtTMP_Chemistry").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMP_Chemistry").css({ "background-color": "#ffffff" });


        $("#txtMOP_Chemistry").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOP_Chemistry").css({ "background-color": "#ffffff" });

        $("#txtTMT_Maths").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMT_Maths").css({ "background-color": "#ffffff" });

        $("#txtMOT_Maths").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOT_Maths").css({ "background-color": "#ffffff" });

        $("#txtTMP_Maths").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMP_Maths").css({ "background-color": "#ffffff" });
        $("#txtMOP_Maths").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOP_Maths").css({ "background-color": "#ffffff" });

        $("#txtTMT_Botany").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMT_Botany").css({ "background-color": "#ffffff" });

        $("#txtMOT_Botany").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOT_Botany").css({ "background-color": "#ffffff" });

        $("#txtTMP_Botany").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMP_Botany").css({ "background-color": "#ffffff" });

        $("#txtMOP_Botany").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOP_Botany").css({ "background-color": "#ffffff" });

        $('#txtTMT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Zoology').css({ "background-color": "#ffffff" });

        $('#txtMOT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Zoology').css({ "background-color": "#ffffff" });

        $('#txtTMP_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMP_Zoology').css({ "background-color": "#ffffff" });

        $('#txtMOP_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOP_Zoology').css({ "background-color": "#ffffff" });


    }
    else if (MarksPatarn == "yes1") {
        $("#txtTMT_Physics").val("");
        $("#txtMOT_Physics").val("");
        $("#txtTMT_Chemistry").val("");
        $("#txtMOT_Chemistry").val("");
        $("#txtTMT_Maths").val("");
        $("#txtMOT_Maths").val("");
        $("#txtTMT_Botany").val("");
        $("#txtMOT_Botany").val("");
        $("#txtTMT_Zoology").val("");
        $("#txtMOT_Zoology").val("");
        $("#txtTMP_Physics").val("");
        $("#txtMOP_Physics").val("");
        $("#txtTMP_Chemistry").val("");
        $("#txtMOP_Chemistry").val("");
        $("#txtTMP_Maths").val("");
        $("#txtMOP_Maths").val("");
        $("#txtTMP_Botany").val("");
        $("#txtMOP_Botany").val("");
        $("#txtTMP_Zoology").val("");
        $("#txtMOP_Zoology").val("");
        $("#txtTMTP_Physics").val("");//total marks
        $("#txtTMOTP_Physics").val("");
        $("#txtTMTP_Chemistry").val("");
        $("#txtTMOTP_Chemistry").val("");
        $("#txtTMTP_Maths").val("");
        $("#txtTMOTP_Maths").val("");
        $("#txtTMTP_Botany").val("");
        $("#txtTMOTP_Botany").val("");
        $("#txtTMTP_Zoology").val("");
        $("#txtTMOTP_Zoology").val("");
        $("#txtTMP_PCM").text("");
        $("#txtTMP_PCB").text("");
        $("#txtTMT_PCM").text("");//
        $("#txtTMT_PCB").text("");
        $("#txtMOT_PCM").text("");
        $("#txtMOT_PCB").text("");
        $("#txtMOP_PCM").text("");
        $("#txtTMP_PCB").text("");
        $("#txtMOP_PCM").text("");
        $("#txtMOP_PCB").text("");
        $("#txtTMTP_PCM").text("");
        $("#txtTMTP_PCB").text("");
        $("#txtTMOTP_PCM").text("");
        $("#txtTMOTP_PCB").text("");

        $('#txtTMT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Physics').css({ "background-color": "#ffffff" });

        $('#txtMOT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Physics').css({ "background-color": "#ffffff" });

        $('#txtTMT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Chemistry').css({ "background-color": "#ffffff" });

        $('#txtMOT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Chemistry').css({ "background-color": "#ffffff" });


        $('#txtTMT_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Maths').css({ "background-color": "#ffffff" });

        $('#txtMOT_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Maths').css({ "background-color": "#ffffff" });


        $('#txtTMT_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Botany').css({ "background-color": "#ffffff" });

        $('#txtMOT_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Botany').css({ "background-color": "#ffffff" });

        $('#txtTMT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Zoology').css({ "background-color": "#ffffff" });

        $('#txtMOT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Zoology').css({ "background-color": "#ffffff" });
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


