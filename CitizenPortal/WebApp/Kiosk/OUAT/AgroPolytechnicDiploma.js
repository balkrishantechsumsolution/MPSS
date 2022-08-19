function openWindow(UIDVal, value, SessionName) {

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

    if (JSONData != "") {
        if ($("#HFUIDData").val() != "") {

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
    $('#btnSubmit').prop('disabled', true);
    $('#divReserved').hide();
    $("#divPH").hide();
    $('#divGCH').hide();
    $('#divPCPercent').hide();
    GetOUATState();
    GetOUATState2();

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


            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);


        }
    });

    $("#ddlSearch").bind("change", function (e) {
        if ($("#ddlSearch").val() == "Aadhaar Enrollment Number") {
            $("#UID").val('');
            $("#UID").prop('disabled', false);
            $("#UID").attr("placeholder", "Enter 14 digit Aadhaar Enrollment Number");
            $("#UID").attr("maxlength", 14);
        }

        if ($("#ddlSearch").val() == "Aadhaar Number") {
            $("#UID").val('');
            $("#UID").prop('disabled', false);
            $("#UID").attr("placeholder", "Enter 12 digit Aadhaar Number");
            $("#UID").attr("maxlength", 12);
        }
    });


    $('#HscTotalMarks').change(function () {

        calculatepercentage($('#HscTotalMarks').val(), $('#HscMarksGot').val());
    });

    $('#HscMarksGot').change(function () {

        calculatepercentage($('#HscTotalMarks').val(), $('#HscMarksGot').val());
    });
    $('#SscTotalMarks').change(function () {

        calculatepercentageXII($('#SscTotalMarks').val(), $('#SscMarksGot').val());
    });

    $('#SscMarksGot').change(function () {

        calculatepercentageXII($('#SscTotalMarks').val(), $('#SscMarksGot').val());
    });


    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);








    //EL("File1").addEventListener("change", readFile, false);
    //EL("File2").addEventListener("change", readFile2, false);

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
                text += "<br /> -Please Enter Pincode in Permanent Address.";
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


    if ($("#HscDivision").val() == "501") {
        //(8.3 - 0.5) * 10


        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("CGPA can not be less than 3.5");
            $('#HscTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Total Marks of CGPA can not be greater than 10");
            $('#HscTotalMarks').val("");
            $('#HscMarksGot').val("");
            $("#HscPercentage").val("");
            return;
        }

        if (MarksObtained == "") return;
        var result = 0;

        //result = (TotalMarks - 0.5) * 10;
        result = ((MarksObtained) * 9.5).toFixed(2);
    }
    else {

        if (MarksObtained == "") return;

        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#HscTotalMarks').val("");
            $('#HscMarksGot').val("");
            $("#HscPercentage").val("");

            return;
        }

        if (TotalMarks <= 0) TotalMarks = 1;

        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

    }


    $("#HscPercentage").val(result);

}


function calculatepercentageXII(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;

    var result = 0;

    if ($("#SscDivision").val() == "501") {
        //(8.3 - 0.5) * 10

        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("CGPA cannot be less than 3.5");
            $('#SscTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please Enter valid CGPA");
            $('#SscTotalMarks').val("");
            return;
        }

        //result = (TotalMarks - 0.5) * 10;
        result = ((TotalMarks) * 9.5).toFixed(2);
    }
    else {

        if (MarksObtained == "") return;

        var Category = $("#Category option:selected").val();

        var Physicallyhandicaped = 0;
        if ($('#CheckBoxList1_0').is(":checked")) {
            // it is checked
            Physicallyhandicaped = 1;
        }


        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#SscTotalMarks').val("");
            $('#SscMarksGot').val("");
            $("#SscPercentage").val("");

            return;
        }

        if (TotalMarks <= 0) TotalMarks = 1;

        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

        if (Category == "SC" || Category == "ST") {
            if (result < 40) {
                alert("Minimum Percentage is 40 %");
                $('#SscTotalMarks').val("");
                $('#SscMarksGot').val("");
                $("#txtPercentage2").val("");
                result = 0;
            }
        } else if (Physicallyhandicaped == 1) {
            if (result < 40) {
                alert("Minimum Percentage is 40 %");
                $('#SscTotalMarks').val("");
                $('#SscMarksGot').val("");
                $("#SscPercentage").val("");
                result = 0;
            }
        } else if (Category == "GN") {
            if (result < 50) {
                alert("Minimum Percentage is 50 %");
                $('#SscTotalMarks').val("");
                $('#SscMarksGot').val("");
                $("#SscPercentage").val("");
                result = 0;
            }
        }


    }


    $("#SscPercentage").val(result);

}



function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile() {


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


function fnValidateOUATOTP() {
    var temp = "Gunwant";
    var result = false;
    var temp = AppID.split('_');
    var strMobile = temp[0];
    var UID = temp[0];
    var OTP = temp[1];
    AppID = AppID;
    $.when(
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/ValidateOUATDiplomaOTP',
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

            fnOTPValidaed(temp[0], temp[1], ResponseType, ProfileID, AadhaarKeyField);
        }
        else {
            alert('OTP Validation Failed! Please Re-Enter correct 6 digit OTP received as SMS from Lokaseba Adhikara -CAP, Odisha Govt.');
            alert('OTP Validation Failed! You have Entered wrong OTP Code, please Re-Enter correct OTP Code, which you have received on your registered mobile no. Other wise resend OTP Code from Lokaseba Adhikara -CAP, Odisha Govt.');
        }
        //alert("Basic detail saved from Aadhaar.");
        window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

    });// end of Then function of main Data Insert Function

    return false;
}



function fnOTPValidaed(UID, KeyField, ResponseType, ProfileID, AadhaarKeyField) {
    var rtnurl = "";
    if (ResponseType == "A") {
        alert('Mobile No. successfully validated. Please Update the Basic Details to Continue.')
    } else {

        if (KeyField == '0000000000000') {
            AppID = AppID.split('_');
            AppID = AppID[5];
            $('#MobileNo').val($('#txtMobile').val());
            $('#MobileNo').prop('disabled', true);
            $('#txtSMSCode').prop('disabled', true);
            $('#btnValidateOTP').prop('disabled', true);
            $('#btnOTP').prop('disabled', true);
            $('#btnSubmit').prop('disabled', false);
            $("#divMsgTitle").text("Information!");
            $("#divMsgDtls").text("Mobile no " + $('#txtMobile').val() + " sucessfully validated. Please Fill the FORM");
            $('#divMsg').show();

            alert('Mobile No. ' + $('#txtMobile').val() + ' sucessfully validated. Please Fill the FORM.');

        } else {
            alert('Mobile No. ' + $('#txtMobile').val() + ' already registered for OUAT Diploma in Agro-Polyechnic 2017-18.' + '\n' + 'Please Login to check the details.')
            rtnurl = "/Account/Login";
            window.location.href = rtnurl;
        }
    }
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
        text += "<br /> -Please Enter Examination Passed. ";
        isError = true;
    }

    if (PassingYear == '') {
        text += "<br /> -Please Enter Passing Year. ";
        isError = true;
    }

    if (NameOfBoardText != null && (NameOfBoardText == '' || NameOfBoardText == '-Select-' || NameOfBoardText == 'List of Board')) {
        text += "<br /> -Please select Board.";
        isError = true;
    }

    if (Division == '') {
        text += "<br /> -Please Enter Division. ";
        isError = true;
    }

    if (Total == '') {
        text += "<br /> -Please Enter Total Marks. ";
        isError = true;
    }

    if (Marks == '') {
        text += "<br /> -Please Enter Marks Secured. ";
        isError = true;
    }

    if (isError == true) {


        alertPopup("Please fill following information in Educational Qualification.", text);
        return false;
    }

    return true;

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




function fnReservationQuota() {

    if (CheckBoxList1_1.checked) { $('#divGCH').show(500); } else { $('#divGCH').hide(500); }
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





function hidedive() {

    var reserved = $("input[name='ReservedQuota']:checked").val();

    if (reserved == "No") {
        $("#CheckBoxList1_0").prop('checked', false);
        $("#CheckBoxList1_1").prop('checked', false);
        $("#divPH").hide();
        $('#divReserved').hide();
        $('#divEmplyeeCase').hide();

        $('#divAgro').hide();
        $('#divResevation').hide();
        $("#divMarks").hide();
        $("#divGCH").hide();



    }
}
function percentdiv() {

    var HandicapType = $("input[name='HandicapType']:checked").val();

    if (HandicapType == "Temporary") {

        $('#divPCPercent').show();

    }

    else {
        $('#divPCPercent').hide();
        $('#txtHandicappedPart').val('');
        $('#txtHandiPercent').val('');


    }
}





function ValidateForm() {

    var text = "";
    var opt = "";

    /// Basic Information 

    var TransNo = $("#txtTransNo");
    var TransDate = $("#txtTransDate");
    var Discipline = $("#txtDiscipline");
    var FirstName = $("#FirstName");
    var LastName = $("#LastName");
    var MotherName = $("#MotherName");
    var FatherName = $("#FatherName");
    var aadhaarcard = $("#UID");

    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Gender = $("#ddlGender option:selected").text();
    var Religion = $("#religion option:selected").text();
    var Category = $("#Category option:selected").text();
    var Tongue = $("#MotherTongue option:selected").text();
    var MaritalStatus = $("#MaritalStatus option:selected").text();
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
    if (Discipline.val() == '') {
        text += "<br /> -Please Enter Discipline ";
        Discipline.attr('style', 'border:1px solid #d03100 !important;');
        Discipline.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Discipline.attr('style', '1px solid #cdcdcd !important;');
        Discipline.css({ "background-color": "#ffffff" });
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
        text += "<br /> -Please Enter First Name. ";
        FirstName.attr('style', 'border:1px solid #d03100 !important;');
        FirstName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FirstName.attr('style', '1px solid #cdcdcd !important;');
        FirstName.css({ "background-color": "#ffffff" });
    }

    if (MotherName.val() == '') {
        text += "<br /> -Please Enter Mother Name ";
        MotherName.attr('style', 'border:1px solid #d03100 !important;');
        MotherName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        MotherName.attr('style', 'border:1px solid #cdcdcd !important;');
        MotherName.css({ "background-color": "#ffffff" });
    }

    if (FatherName.val() == '') {
        text += "<br /> -Please Enter Father Name. ";
        FatherName.attr('style', 'border:1px solid #d03100 !important;');
        FatherName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FatherName.attr('style', 'border:1px solid #cdcdcd !important;');
        FatherName.css({ "background-color": "#ffffff" });
    }

    if (aadhaarcard.val() == '') {
        text += "<br /> -Please Enter Aadhaar number. ";
        aadhaarcard.attr('style', 'border:1px solid #d03100 !important;');
        aadhaarcard.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        aadhaarcard.attr('style', 'border:1px solid #cdcdcd !important;');
        aadhaarcard.css({ "background-color": "#ffffff" });
    }
    if (MobileNo.val() == '') {
        text += "<br /> -Please Enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        MobileNo.css({ "background-color": "#ffffff" });
    }
    var AppMobileNo = $("#txtMobile");
    if (AppMobileNo.val() == '') {
        text += "<br /> -Please Enter Applicant Mobile No. ";
        AppMobileNo.attr('style', 'border:1px solid #d03100 !important;');
        AppMobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AppMobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        AppMobileNo.css({ "background-color": "#ffffff" });
    }
    if (AppMobileNo.val() != '') {
        var mobmatch1 = /^[789]\d{9}$/;
        if (!mobmatch1.test(AppMobileNo.val())) {
            text += "<br /> -Please Enter valid Applicant mobile Number.";
            AppMobileNo.attr('style', 'border:1px solid #d03100 !important;');
            AppMobileNo.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            AppMobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
            AppMobileNo.css({ "background-color": "#ffffff" });
        }
    }


    if (MobileNo.val() != '') {
        var mobmatch1 = /^[789]\d{9}$/;
        if (!mobmatch1.test(MobileNo.val())) {
            text += "<br /> -Please Enter valid mobile Number.";
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
            text += "<br /> - Please Enter valid EmailID";
            EmailID.attr('style', 'border:1px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }
    else {
        EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
        EmailID.css({ "background-color": "#ffffff" });
    }


    if (EmailID.val() == '' || EmailID.val() == null) {
        text += "<br /> -Please Enter   EmailID .";
        EmailID.attr('style', 'border:1px solid #d03100 !important;');
        EmailID.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
        EmailID.css({ "background-color": "#ffffff" });
    }






    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");

    if (DOB.val() == '') {
        text += "<br /> -Please Enter Date of Birth. ";
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

    if ((Gender == '0' || Gender == '-Select-')) {
        text += "<br /> -Please Select Gender. ";
        $('#ddlGender').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlGender').css({ "background-color": "#fff2ee" });
        opt = 1;

    } else {
        $('#ddlGender').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlGender').css({ "background-color": "#ffffff" });
    }

    if ((Religion == '0' || Religion == '-Select-')) {
        text += "<br /> -Please Select Religion. ";
        $("#religion").attr('style', 'border:1px solid #d03100 !important;');
        $("#religion").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#religion").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#religion").css({ "background-color": "#ffffff" });
    }


    if ((Category == '0' || Category == '-Select-' || Category == '--Select Category--')) {
        text += "<br /> -Please Select Category. ";
        $("#Category").attr('style', 'border:1px solid #d03100 !important;');
        $("#Category").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#Category").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#Category").css({ "background-color": "#ffffff" });
    }
    if ((MaritalStatus == '0' || MaritalStatus == '-Select-')) {
        text += "<br /> -Please Select Marital Status. ";
        $("#MaritalStatus").attr('style', 'border:1px solid #d03100 !important;');
        $("#MaritalStatus").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#MaritalStatus").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#MaritalStatus").css({ "background-color": "#ffffff" });
    }
    if ((Tongue == '0' || Tongue == '-Select-')) {
        text += "<br /> -Please Select mother tounge. ";
        $("#MotherTongue").attr('style', 'border:1px solid #d03100 !important;');
        $("#MotherTongue").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#MotherTongue").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#MotherTongue").css({ "background-color": "#ffffff" });
    }


    if (AddressLine1 != null && AddressLine1.val() == '') {
        text += "<br /> -Please Enter Care of Address in Permanent Address. ";
        AddressLine1.attr('style', 'border:1px solid #d03100 !important;');
        AddressLine1.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
        AddressLine1.css({ "background-color": "#ffffff" });
    }

    if (RoadStreetName != null && RoadStreetName.val() == '') {
        text += "<br /> -Please Enter Road /Street Name in Present Address. ";
        RoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        RoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        RoadStreetName.css({ "background-color": "#ffffff" });
    }

    if (Locality != null && Locality.val() == '') {
        text += "<br /> -Please Enter Locality in Present Address. ";
        Locality.attr('style', 'border:1px solid #d03100 !important;');
        Locality.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Locality.attr('style', 'border:1px solid #cdcdcd !important;');
        Locality.css({ "background-color": "#ffffff" });
    }

    if ($("#HFUIDData").val() == "" || $("#HFUIDData").val() == "undefined") {// 2016-11-08 Logic altered to skip validating these details when user has fetched the details from Aadhaar.
        if (State != null && (State == '' || State == '-Select-')) {
            text += "<br /> -Please select State in permanent Address.";
            $('#PddlState').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlState').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlState').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlState').css({ "background-color": "#ffffff" });
        }

        if (District != null && (District == '' || District == '-Select-' || PreDistrict == 'Select District')) {
            text += "<br /> -Please select District in permanent Address.";
            $('#PddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlDistrict').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlDistrict').css({ "background-color": "#ffffff" });
        }




    }

    if (Pincode != null && Pincode.val() == '') {
        text += "<br /> -Please Enter Pincode in Permanent Address.";
        $('#PPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#PPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PPinCode').css({ "background-color": "#ffffff" });
    }
    /////////////////////////
    if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
        text += "<br /> -Please Enter Care of Address in Present Address. ";
        PreAddressLine1.attr('style', 'border:1px solid #d03100 !important;');
        PreAddressLine1.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreAddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
        PreAddressLine1.css({ "background-color": "#ffffff" });
    }

    if (PreRoadStreetName != null && PreRoadStreetName.val() == '') {
        text += "<br /> -Please Enter Road/street name in Present Address. ";
        PreRoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        PreRoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreRoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        PreRoadStreetName.css({ "background-color": "#ffffff" });
    }

    if (PreLocality != null && PreLocality.val() == '') {
        text += "<br /> -Please Enter Locality in Present Address. ";
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




    if (PrePincode != null && PrePincode.val() == '') {
        text += "<br /> -Please Enter Pincode in Present Address.";
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
            text += "<br /> -Please Enter valid pincode.";
            $('#CPinCode').attr('style', 'border:1px solid #d03100 !important;');
            $('#CPinCode').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#CPinCode').css({ "background-color": "#ffffff" });
        }
    }

    //Reservation quota Detail


    var Reservation = $("input[name='ReservedQuota']:checked").val();

    if (Reservation == null || Reservation == "undefined") {
        text += "<br /> - Please Choose Reservation quota";
        opt = 1;
    } else {

    }


    var GreenCardHolder = 0;
    if ($('#CheckBoxList1_1').is(":checked")) {
        // it is checked
        GreenCardHolder = 1;
    }

    var Physicallyhandicaped = 0;
    var PhysicallyhandicapedPercent = 0;
    if ($('#CheckBoxList1_0').is(":checked")) {
        // it is checked
        Physicallyhandicaped = 1;
    }


    var PhysicalHandicap = $("input[id='CheckBoxList1_0']:checked").val();


    var HandicappedPart = $("#txtHandicappedPart").val();
    var HandiPercent = $("#txtHandiPercent").val();



    if (Reservation == "Yes") {

        var tempCondition = true;

        if (GreenCardHolder == 1) {
            tempCondition = false;
        }
        else if (Physicallyhandicaped == 1) {
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

            if (HandicapType != null && HandicapType != "" && HandicapType == "Temporary") {

                if (HandiPercent == null || HandiPercent == "") {
                    text += "<br /> -Please Enter  Percentage Handicapped Body Percentage ";
                    $('#txtHandiPercent').attr('style', 'border:1px solid #d03100 !important;');
                    $('#txtHandiPercent').css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#txtHandiPercent').css({ "background-color": "#ffffff" });
                }


            }
            else if (HandicapType != null && HandicapType != "" && HandicapType == "P") {
                $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtHandiPercent').css({ "background-color": "#ffffff" });
            }


        }






    }


    //Education in HSC
    var BoardName = $("#HscName");
    var txtPssngYr = $("#HscPassingYear"); //DropDown
    var ddlPasstype = $("#HscDivision option:selected").text();
    var ddlPctgeCalclte = $("#ddlPctgeCalclte option:selected").text();
    var txtTotalMarks = $("#HscTotalMarks");
    var txtMarkSecure = $("#HscMarksGot");
    var txtPercentage = $("#HscPercentage");


    if (BoardName != null && BoardName.val() == '') {
        text += "<br /> -Please Enter Name of the Board Examination Passed in Educational Qualification. ";
        $('#HscName').attr('style', 'border:1px solid #d03100 !important;');
        $('#HscName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#HscName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#HscName').css({ "background-color": "#ffffff" });
    }



    var PssngYr = $("#HscPassingYear").val();
    if (PssngYr != null && (PssngYr == '' || PssngYr == '0')) {
        text += "<br /> -Please select Year of Passing in Educational Qualification.";
        $('#HscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
        $('#HscPassingYear').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#HscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#HscPassingYear').css({ "background-color": "#ffffff" });
    }

    var Passtype = $('#HscDivision option:selected').val();
    if (Passtype != null && (Passtype == '' || Passtype == '0')) {
        text += "<br /> -Please select Exam Cleared in Educational Qualification.";
        $('#HscDivision').attr('style', 'border:1px solid #d03100 !important;');
        $('#HscDivision').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#HscDivision').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#HscDivision').css({ "background-color": "#ffffff" });
    }



    if (txtTotalMarks != null && txtTotalMarks.val() == '') {
        text += "<br /> -Please enter Total Marks in Educational Qualification. ";
        $('#HscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
        $('#HscTotalMarks').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#HscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#HscTotalMarks').css({ "background-color": "#ffffff" });
    }

    if ($("#HscPercentage").val() != "501") {
        if (txtMarkSecure != null && txtMarkSecure.val() == '') {
            text += "<br /> -Please enter Marks Secured in Educational Qualification. ";
            $('#HscMarksGot').attr('style', 'border:1px solid #d03100 !important;');
            $('#HscMarksGot').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#HscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#HscMarksGot').css({ "background-color": "#ffffff" });
        }

    } else {
        $('#HscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#HscMarksGot').css({ "background-color": "#ffffff" });
    }

    if (txtPercentage != null && txtPercentage.val() == '') {
        text += "<br /> -Please calculate the Percentage in Educational Qualification. ";
        opt = 1;
    } else {
    }

    //Eduaction in 10+2
    var BoardName = $("#SscName");
    var txtPssngYr = $("#SscPassingYear"); //DropDown
    var ddlPasstype = $("#SscDivision option:selected").text();
    var txtTotalMarks = $("#SscTotalMarks");
    var txtMarkSecure = $("#SscMarksGot");
    var txtPercentage = $("#SscPercentage");

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
        $('#SscName').attr('style', 'border:1px solid #d03100 !important;');
        $('#SscName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#SscName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SscName').css({ "background-color": "#ffffff" });
    }
    if (txtPssngYr != null && txtPssngYr.val() == '') {
        text += "<br /> -Please enter Name of the Board Examination Passed in Educational Qualification 10+2. ";
        $('#SscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
        $('#SscPassingYear').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#SscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SscPassingYear').css({ "background-color": "#ffffff" });
    }


    var Passtype = $('#SscDivision option:selected').val();
    if (Passtype != null && (Passtype == '' || Passtype == '0')) {
        text += "<br /> -Please select Exam Cleared in Educational Qualification 10+2.";
        $('#SscDivision').attr('style', 'border:1px solid #d03100 !important;');
        $('#SscDivision').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#SscDivision').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SscDivision').css({ "background-color": "#ffffff" });
    }



    if (txtTotalMarks != null && txtTotalMarks.val() == '') {
        text += "<br /> -Please enter Total Marks in Educational Qualification 10+2. ";
        $('#SscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
        $('#SscTotalMarks').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#SscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SscTotalMarks').css({ "background-color": "#ffffff" });
    }

    if ($("#SscDivision").val() != "501") {
        if (txtMarkSecure != null && txtMarkSecure.val() == '') {
            text += "<br /> -Please enter Marks Secured in Educational Qualification 10+2. ";
            $('#SscMarksGot').attr('style', 'border:1px solid #d03100 !important;');
            $('#SscMarksGot').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#SscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#SscMarksGot').css({ "background-color": "#ffffff" });
        }

    } else {
        $('#SscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SscMarksGot').css({ "background-color": "#ffffff" });
    }

    if (txtPercentage != null && txtPercentage.val() == '') {
        text += "<br /> -Please calculate the Percentage in Educational Qualification 10+2. ";
        opt = 1;
    } else {
    }

    //Education for msc in agro polytechnique(agriculture and science)














    //Section Marks patarn 
    //var MarksPatarn = $("input[name='marks']:checked").val();

    //if (MarksPatarn == null || MarksPatarn == "undefined") {
    //    text += "<br /> - Select CHSC Marks patarn and Enter marks scroed in 10+2 Science Exaination";
    //    opt = 1;
    //} else {

    //}




    //Section others Marks patarn 

    var Section1_PassOdia = $("input[name='radio4']:checked").val();

    if (Section1_PassOdia == null) {
        text += "<br /> - Please choose, Has the Candidate passed Odia as one of the subject in HSC Examination?";
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

    if (Section1_PassOdia == "Yes") {
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

    if (Section1_PassOdia == "No") {

        if (Residence == '0' || Residence == '--Select Residence Type--') {
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

    var Section1_AbilitySpeak = 0;
    if ($('#spkOdiya').is(":checked")) {
        // it is checked
        Section1_AbilitySpeak = 1;
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
        if (!$("#chkPhysical").is(":checked")) {
            text += "<br /> -Please check Self Declaration.";
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
        //alert(text);
        return false;
    }


    return true;

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

function AadhaarValidation(AadhaarNo) {

    var MobileVal = $("[id*=" + AadhaarNo + "]").val();
    var text = "";
    var opt = "";

    if (isNaN(MobileVal) || MobileVal.indexOf(" ") != -1) {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Aadhaar Number.";
        $("[id*=" + AadhaarNo + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + AadhaarNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (MobileVal.length < 12) {
        text += "<br/>" + " \u002A" + " Aadhaar No. Should Be Atleast 12 Digit.";
        $("[id*=" + AadhaarNo + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + AadhaarNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }

    else {
        $("[id*=" + AadhaarNo + "]").attr('style', 'border:2px solid green !important;');
        $("[id*=" + AadhaarNo + "]").css({ "background-color": "#ffffff" });
        return true;
    }

    if (opt == "1") {
        alertPopup("Aadhaar Information.", text);
        $("[id*=" + AadhaarNo + "]").val("");
        return false;
    }

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
        else {
            EmailID. attr('style', 'border:2px solid green !important;');
            EmailID.css({ "background-color": "#ffffff" });
        }
    }
}

//permanent Address Binding 



function GetOUATState() {
    var SelState = $('#PddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/GetOUATState',
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
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/GetOUATDistrict',
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
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/GetOUATBlock',
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
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/GetOUATPanchayat',
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
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/GetOUATState',
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
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/GetOUATDistrict',
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
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/GetOUATBlock',
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
        url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/GetOUATPanchayat',
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


function isNumberKeyDecimal(e, cntrlid) {
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


//function percentHandicap() {
//    debugger;
//    var text = "";
//    var opt = "";
//    var HandicapType = $("input[name='HandicapType']:checked").val();
//    var percent = $("#txtHandiPercent").val();

//    if (HandicapType = "Temporary") {

//        if (percent < 40) {
//            text += "<br /> -Percentage for Handicapped Body Part must be greater than 40 %";
//            $('#txtHandiPercent').attr('style', 'border:1px solid #d03100 !important;');
//            $('#txtHandiPercent').css({ "background-color": "#fff2ee" });
//            opt = 1;
//        } else {
//            $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
//            $('#txtHandiPercent').css({ "background-color": "#ffffff" });
//        }
//        if (opt == "1") {
//            alertPopup("Please fill following information.", text);
//            //alert(text);
//            return false;
//        }

//    }

//}


function SubmitData() {

    if (!ValidateForm()) {
        return false;
    }

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

            var durn = calcExSerDur(startDate, endDate);

            if (durn != null) {
                if (durn.years > 0) dateDOB.setFullYear(dateDOB.getFullYear() + durn.years);
                if (durn.months > 0) {
                    dateDOB = dateDOB.addMonths(durn.months);
                }
                if (durn.days > 0) {
                    dateDOB.setDate(dateDOB.getDate() + durn.days);
                }

                var newDate = pad(dateDOB.getDate().toString(), 2) + "/" + pad(dateDOB.getMonth().toString(), 2) + "/" + dateDOB.getFullYear().toString();

                var Age = calcExSerDur(newDate, '31/12/2017');
                ageToCompare = Age.years;
                ExSrvDay = durn.days;
                ExSrvMonth = durn.months;
                ExSrvYear = durn.years;
            }

            var AgeForRenderService = calcExSerDur(txtDOB, startDate);
        }

        if (ageToCompare < minAge) {
            ageToCompare = ageActual;
        }
        if (ageToCompare < minAge) {
            if ($("input[name='radio3']:checked").val() == 'No') {
                text += "<BR>" + " \u002A" + " Applicant age should be 18 years and above. ";
                opt = 1;
            }
        } else if (ageToCompare > maxAge) {
            check = true;
            if (check) {
                text += "<BR>" + " \u002A" + " Applicant age should be less than " + maxAge + " years. ";
                opt = 1;
            }
        }
        else if (ageToCompare == maxAge) {
            var monthdiff = $('#Month').val() - ExSrvMonth;
            if (monthdiff > 0) {
                check = true;

                if (check) {
                    text += "<BR>" + " \u002A" + " Applicant age should be less than " + maxAge + " years. ";
                    opt = 1;
                }
            }
            else {
                if ($('#Month').val() == ExSrvMonth) {
                    if (($('#Day').val() - ExSrvDay) > 0) {
                        check = true;

                        if (check) {
                            text += "<BR>" + " \u002A" + " Applicant age should be less than " + maxAge + " years. ";
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
                    text += "<BR>" + " \u002A" + " Applicant age should be less than " + maxAge + " years. ";
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
    }

    var temp = "Gunwant";
    var AppID = "";

    var rtnurl = "";

    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var ReadOdiyaLang = 'No';
    if ($('#readOdiya').is(":checked")) {
        ReadOdiyaLang = 'Yes';
    }

    var WriteOdiyaLang = 'No';
    if ($('#writeOdiya').is(":checked")) {
        WriteOdiyaLang = 'Yes';
    }

    var SpeakOdiyaLang = 'No';
    if ($('#spkOdiya').is(":checked")) {
        SpeakOdiyaLang = 'Yes';
    }

    var ResponseType = "C";

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var Physicallyhandicaped = 0;
    if ($('#CheckBoxList1_0').is(":checked")) {
        // it is checked
        Physicallyhandicaped = 1;
    }

    var GreenCardHolder = 0;
    if ($('#CheckBoxList1_1').is(":checked")) {
        // it is checked
        GreenCardHolder = 1;
    }



    var datavar = {

        'aadhaarNumber': $('#UID').val(),
        'AadhaarDetail': $('#ddlSearch').val(),
        'AppMobileNo': $('#txtMobile').val(),

        'CandidateName': $('#FirstName').val(),
        'FatherName': $('#FatherName').val(),
        'MotherName': $('#MotherName').val(),
        'DOB': DOBConverted,
        'Year': $('#Year').val(),
        'Month': $('#Month').val(),
        'Day': $('#Day').val(),
        'Gender': $('#ddlGender').val(),
        'Religion': $('#religion').val(),
        'Category': $('#Category option:selected').text(),
        'MaritalStatus': $('#MaritalStatus').val(),
        'MotherTongue': $('#MotherTongue').val(),
        'Nationality': $('#Nationality').val(),
        'MobileNo': $('#MobileNo').val(),
        'EmailId': $('#EmailID').val(),

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

        'ImageSign': $('#HFb64Sign').val(),
        'Image': $('#HFb64').val(),
        'JSONData': '',

        'HscName': $('#HscName').val(),
        'HscTotalMarks': $('#HscTotalMarks').val(),
        'HscMarksGot': $('#HscMarksGot').val(),
        'HscPercentage': $('#HscPercentage').val(),
        'HscDivision': $('#HscDivision').val(),
        'HscPassingYear': $('#HscPassingYear').val(),
        'SscName': $('#SscName').val(),
        'SscTotalMarks': $('#SscTotalMarks').val(),
        'SscMarksGot': $('#SscMarksGot').val(),
        'SscPercentage': $('#SscPercentage').val(),
        'SscDivision': $('#SscDivision').val(),
        'SscPassingYear': $('#SscPassingYear').val(),

        'OdiaLang': $("input[name='radio4']:checked").val(),
        'ReadOdia': ReadOdiyaLang,
        'WriteOdia': WriteOdiyaLang,
        'SpeakOdia': SpeakOdiyaLang,
        'ResidenceType': $('#ddlResidence option:selected').text(),

        'ResponseType': ResponseType,

        'ReservationQuota': $("input[name='ReservedQuota']:checked").val(),
        'PhysicallyChallenged': Physicallyhandicaped,
        'HandicapType': $("input[name='HandicapType']:checked").val(),
        'HandicappedPart': $('#txtHandicappedPart').val(),
        'HandicappedPercent': $('#txtHandiPercent').val(),
        'GreenCardHolder': GreenCardHolder,


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
            url: '/WebApp/Kiosk/OUAT/AgroPolytechnicDiploma.aspx/InsertData',
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
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                return;
            }
            else {
                if (result /*&& jqXHRData_IMG_result*/) {
                    $("#progressbar").hide();
                    alertPopup("Addmission Into OUAT", "Application saved successfully. Reference ID : " + obj.AppID + " Please Make Payment against the Application Number.");
                    //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=430&AppID=' + obj.AppID;
                    window.location.href = '/WebApp/Kiosk/OUAT/OUATDiplomaProcessbar.aspx?SvcID=430&AppID=' + obj.AppID;
                }
                else {
                    $("#progressbar").hide();
                    alertPopup("Form Validation Failed", "Unable to save Applicatin, Please refresh the browser and try again");
                }
            }

        });// end of Then function of main Data Insert Function

    return false;
}
