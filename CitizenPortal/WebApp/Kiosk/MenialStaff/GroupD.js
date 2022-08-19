$(document).ready(function () { $("#ddlSearch").prop('disabled', true); $("#divNonAadhar").hide(); });

$(document).ready(function () {
    $('#subdiv_vsble').hide();
    $('#chklist').hide();
    $('#cndtemrd').hide();
    $('#exsrvmn').hide();
    $('#sptprtptd').hide();
    $('#winmdl').hide();
    $('#ncccrtfcte').hide();
    $('#hvngdl').hide();
    $('#hvngcrmnlcse').hide();
    $('#plyntnl').hide();
    $('#divCirmeCase').hide();
    $('#jobExp').hide();
});

function ckhInfo() {

    if (bool == 1) {
        bool = 0;
        $('#chklist').slideDown(500);
    }
    else {
        bool = 1;
        $('#chklist').slideUp(500);
    }
}

function fuShowHideDiv(divID, isTrue) {
    debugger;
    //alert(divID);
    if (isTrue == "1") {
        $('#' + divID).show(500);
    }
    if (isTrue == "0") {
        $('#' + divID).hide(500);
    }
}

$(document).ready(function () {
    //debugger;
    $(function () {
        $("#Photo").change(function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = imageIsLoaded;
                reader.readAsDataURL(this.files[0]);
            }
        });
    });

    function imageIsLoaded(e) {
        $('#imgPhoto').attr('src', e.target.result);
    };
    m_ServiceID = $('#HFServiceID').val();
});

function openWindow(UIDVal, value, SessionName) {
    debugger;
    if (validateUID(UIDVal) != false) {
        var UID = $("#UID").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=388&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
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

                var Age = calcExSerDur(t_DOB, '01/01/2016');
                $('#Age').val(Age.years);

                $("#Year").val(Age.years);
                $("#Month").val(Age.months);
                $("#Day").val(Age.days);
            }

            document.getElementById('myImg').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);

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

        }//end of UID Data



    }
}

$(document).ready(function () {

    $('#txtPoliceStation').hide();

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
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {

            //var Age = calcDobAge(date);
            var Age = calcExSerDur(date, '01/01/2016');
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


    $('#txtMarkSecure').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtRndDrtinstrt').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            var durn = calcExSerDur(date, $('#txtRndDrtinend').val());

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

    $('#txtRndDrtinend').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);

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
    //JobExpYear
    $('#txtFromJobExp').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            var durn = calcExSerDur(date, $('#txtToJobExp').val());

            if (durn != null) {

                if (durn.years < 0) return false;
                if (durn.months < 0) return false;
                if (durn.days < 0) return false;

                $("#JobExpYear").val(durn.years);
                $("#JobExpMonth").val(durn.months);
                $("#JobExpDay").val(durn.days);
            }

        }
    });

    $('#txtToJobExp').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            var durn = calcExSerDur($('#txtFromJobExp').val(), date);

            if (durn != null) {

                if (durn.years < 0) return false;
                if (durn.months < 0) return false;
                if (durn.days < 0) return false;

                $("#JobExpYear").val(durn.years);
                $("#JobExpMonth").val(durn.months);
                $("#JobExpDay").val(durn.days);
            }

        }
    });

    $('#txtRegdte').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });

    $('#txtLicenseDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });

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
    $("#ddlSports").change(function () {
        if ($('option:selected', this).val() == 999) {
            $("#txtOthrsport").prop('disabled', false);

        }
        else {
            $("#txtOthrsport").prop('disabled', true);
            $("#txtOthrsport").val('');
        }
    });

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
        $("#txtLicenseOffice").prop('disabled', false);

    });

    $("#rdoDLNo").on('change', function () {
        $("#hvyVeh").prop('disabled', true);
        $("#lgtVeh").prop('disabled', true);

        $("#hvyVeh").prop('checked', false);
        $("#lgtVeh").prop('checked', false);

        $("#txtLicenseNo").prop('disabled', true);
        $("#txtLicenseDate").prop('disabled', true);
        $("#txtLicenseOffice").prop('disabled', true);

        $("#txtLicenseNo").val('');
        $("#txtLicenseDate").val('');
        $("#txtLicenseOffice").val('');

    });

    //$("#rdoDLNo").prop('checked', true).trigger('change');

    ////Section 9
    $("#rdoCrmYes").on('change', function () {
        $("#radio9AA").prop('disabled', false);
        $("#radio9AB").prop('disabled', false);
        $("#txtCriminalRefNo").prop('disabled', false);
        $("#ddlArrestDistrict").prop('disabled', false);
        $("#txtPoliceStationNo").prop('disabled', false);
        $("#txtIPCSection").prop('disabled', false);

    });

    $("#rdoCrmNo").on('change', function () {
        $("#radio9AA").prop('disabled', true);
        $("#radio9AB").prop('disabled', true);

        $("#radio9AA").prop('checked', false);
        $("#radio9AB").prop('checked', false);

        $("#txtCriminalRefNo").prop('disabled', true);
        $("#ddlArrestDistrict").prop('disabled', true);
        $("#txtPoliceStationNo").prop('disabled', true);
        $("#txtIPCSection").prop('disabled', true);

        $("#txtCriminalRefNo").val('');
        $("#ddlArrestDistrict").val(0);

        $("#txtPoliceStationNo").val('');
        $("#txtIPCSection").val('');

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
    
    //commented by niraj GetDistrict("", "21", "ddlArrestDistrict"); //Implemented in Addressscript.js

    $("[name='" + StateControl + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControl + "']").val(), DistrictControl); });
    $("[name='" + DistrictControl + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl, TalukaControl); });
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return GetVillage("", TalukaControl, VillageControl); });

    $("[name='" + StateControl2 + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControl2 + "']").val(), DistrictControl2); });
    $("[name='" + DistrictControl2 + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl2, TalukaControl2); });
    $("[name='" + TalukaControl2 + "']").bind("change", function (e) { return GetVillage("", TalukaControl2, VillageControl2); });

    //For Emp.Exchange//
    var DistrictControlEE = "EEddlDistrict";
    var EmploymetExchange = "ddlEmploymentExchange";
    $("#ddlEmploymentExchange").prop('disabled', true);
    GetDistrict("", "21", DistrictControlEE);
    $("[name='" + DistrictControlEE + "']").bind("change", function (e) { return GetEmploymentExchange("", $("[name='" + DistrictControlEE + "']").val(), EmploymetExchange); });

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

    $("[name='" + DistrictRTO + "']").bind("change", function (e) { return GetRTOList("", $("[name='" + DistrictRTO + "']").val(), RTO); });

    $("#religion").bind("change", function (e) {

        var CategoryArr = ["SC", "ST", "SEBC", "UR"];
        var CategoryArr2 = ["UR"];

        $("#category").empty();
        $("#category").append('<option value = "0">-Select-</option>');

        if ($("#religion").val() == "Hndu") {
            var arrLen = CategoryArr.length;

            for (i = 0; i < arrLen; i++) {
                $("#category").append('<option value = "' + CategoryArr[i] + '">' + CategoryArr[i] + '</option>');
            }
            $("#category").prop('disabled', false);
        }
        else {
            var arrLen = CategoryArr2.length;
            $("#category").empty();
            for (i = 0; i < arrLen; i++) {
                $("#category").append('<option value = "' + CategoryArr2[i] + '">' + CategoryArr2[i] + '</option>');
            }
            $("#category").prop('disabled', true);
        }
    });

    $("#ddlPctgeCalclte").bind("change", function (e) {

        if ($("#ddlPctgeCalclte").val() == "501") {

            $("#lblTotalMarks").text("CGPA");
            $("#txtMarkSecure").prop('disabled', true);


            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");

        }
        else {
            $("#lblTotalMarks").text("Total Marks");
            $("#txtMarkSecure").prop('disabled', false);

            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");
        }

    });


    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });
});

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

            $("[name='" + StateControl + "']").empty();
            $("[name='" + StateControl + "']").append('<option value = "0">-Select-</option>');
            $.each(arr, function () {
                $("[name='" + StateControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

            $("[name='" + StateControl + "']").val(21);
            
        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });
}

var objState = "", objDistrict = "", objTaluka = "", objVillage = "";
function fnCopyAddress() {
    var text = "";
    var opt = "";
    if (chkAddress.checked) {

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
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val($("#PPinCode").val());
    }
    else {
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val("");
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

function EL(id) { return document.getElementById(id); }

function readFile() {
    debugger;

    if (this.files && this.files[0]) {
        
        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 5 || sizekb > 50) {
            alert('The size of the photograph should fall between 5KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
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
    debugger;
    if (this.files && this.files[0]) {       
        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfSign').val(sizekb);
        if (sizekb < 5 || sizekb > 50) {
            alert('The size of the photograph should fall between 5KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("mySign").src = e.target.result;
            EL("HFb64Sign").value = e.target.result;

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
    var t_Value = txt;
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }
    return t_Value;
}

function GetEmploymentExchange(StateCode, EdBoard) {
    EEDistrict = $("#EEddlDistrict").val();
    debugger;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OISF/OISF.aspx/GetEmploymentExchange',
        data: '{"prefix":"' + category + '","DistrictCode":"' + EEDistrict + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlEmploymentExchange").empty();
            $("#ddlEmploymentExchange").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlEmploymentExchange").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
            $("#ddlEmploymentExchange").prop('disabled', false);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetPoliceStation(StateCode, DistrictCode, PoliceStation) {
    StateCode = $("#" + StateCode + "").val();
    DistrictCode = $("#" + DistrictCode + "").val();
    //alert(DistrictCode);
    //debugger;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OISF/OISF.aspx/GetPoliceStation',
        data: '{"prefix":"' + category + '","StateCode":"' + StateCode + '","DistrictCode":"' + DistrictCode + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlPoliceStation").empty();
            $("#ddlPoliceStation").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlPoliceStation").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });

            if (catCount != 0) {
                $('#txtPoliceStation').hide();
                $("#ddlPoliceStation").show();
            }
            else {
                $('#txtPoliceStation').show();
                $("#ddlPoliceStation").hide();
            }

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
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

function ValidateForm() {

    var text = "";
    var opt = "";

    /// Basic Information 
    var FirstName = $("#FirstName");
    var FatherName = $("#FatherName");
    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var ApplicationType = $("#ddlApplication option:selected").val();
    var Religion = $("#religion option:selected").text();
    var Category = $("#category option:selected").text();
    var Nationality = $("#nationality option:selected").text();
    var Gender = $("#ddlGender option:selected").text();

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
    var Acquitted = $('#ddlAcquitted option:selected').val();
    var GovtMessage = 0;
    var InstituteName = $('#ddlAcquitted option:selected').val();
    var InstituteAddress = $('#ddlAcquitted option:selected').val();
    var PassingYear = $('#ddlAcquitted option:selected').val();

    if ((ApplicationType == '' || ApplicationType == '0')) {
        text += "<br /> -Please Select Application Type ";
        opt = 1;
    }

    if (EL("myImg").src.indexOf("photo.png") != -1) {       
        text += "<br /> -Please upload Applicant Photograph.";
        opt = 1;
    }

    if (EL("mySign").src.indexOf("signature.png") != -1) {      
        text += "<br /> -Please upload Applicant Signature.";
        opt = 1;
    }

    if (FirstName.val() == '') {
        text += "<br /> -Please enter Full Name. ";
        opt = 1;
    }      

    if (FatherName.val() == '') {
        text += "<br /> -Please enter Father Name. ";
        opt = 1;
    }

    if (MobileNo.val() == '') {
        text += "<br /> -Please enter Mobile No. ";
        opt = 1;
    }

    if (MobileNo.val() != '') {
        var mobmatch1 = /^[789]\d{9}$/;
        if (!mobmatch1.test(MobileNo.val())) {
            text += "<br /> -Please enter valid mobile Number.";
            opt = 1;
        }
    }

    //if (EmailID.val() == '') {
    //    text += "<br /> -Please enter EMail ID. ";
    //    opt = 1;
    //}

    if (DOB.val() == '') {
        text += "<br /> -Please enter Date of Birth. ";
        opt = 1;
    }

    if ((Gender == '' || Gender == 'Select Gender')) {
        text += "<br /> -Please Select Gender. ";
        opt = 1;
    }
    
    
    if ((Religion == '' || Religion == 'Select')) {
        text += "<br /> -Please Select Religion. ";
        opt = 1;
    }

    if ((Category == '' || Category == 'Select')) {
        text += "<br /> -Please Select Category. ";
        opt = 1;
    }

    if ((Nationality == '' || Nationality == 'Select')) {
        text += "<br /> -Please Select Nationality. ";
        opt = 1;
    }

    if (AddressLine1 != null && AddressLine1.val() == '') {
        text += "<br /> -Please enter Care of Address in Permanent Address. ";
        opt = 1;
    }

    if ($("#HFUIDData").val() == "") {// 2016-11-08 Logic altered to skip validating these details when user has fetched the details from Aadhaar.
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
    }

    if (Pincode != null && Pincode.val() == '') {
        text += "<br /> -Please enter Pincode in Permanent Address.";
        opt = 1;
    }
    /////////////////////////
    if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
        text += "<br /> -Please enter Care of Address in Present Address. ";
        opt = 1;
    }

    if (PreState != null && (PreState == '' || PreState == '-Select-')) {
        text += "<br /> -Please select State in Present Address.";
        opt = 1;
    }

    if (PreDistrict != null && (PreDistrict == '' || PreDistrict == '-Select-' || PreDistrict == 'Select District')) {
        text += "<br /> -Please select District in Present Address.";
        opt = 1;
    }

    if (PreTaluka != null && (PreTaluka == '' || PreTaluka == '-Select-' || PreTaluka == 'Select Block')) {
        text += "<br /> -Please select Taluka in Present Address.";
        opt = 1;
    }

    if (PreVillage != null && (PreVillage == '' || PreVillage == '-Select-' || PreVillage == 'Select Panchayat')) {
        text += "<br /> -Please select Village in Present Address.";
        opt = 1;
    }
    if (PrePincode != null && PrePincode.val() == '') {
        text += "<br /> -Please enter Pincode in Present Address.";
        opt = 1;
    }
    /////////////////////////
    var pinmatch = /^[0-9]\d{5}$/;
    if (Pincode != null && Pincode.val() != '') {
        if (!pinmatch.test(Pincode.val())) {
            text += "<br /> -Please enter valid pincode.";
            opt = 1;
        }
    }

    var Institue = $('#txtInstitue').val();
    var InstituteAddress = $('#txtInstituteAddress').val();
    var PassingYear = $('#txtPssngYr').val();

    if (Institue == null || Institue == '') {
        text += "<br/> - Please enter name of Institute / School.";
        opt = 1;
    }

    if (InstituteAddress == null || InstituteAddress == '') {
        text += "<br/> - Please enter address of Institute / School.";
        opt = 1;
    }

    if (PassingYear == null || PassingYear == '') {
        text += "<br/> - Please enter year of passing the 7th Standard or Class.";
        opt = 1;
    }
    var Section1_PassOdia = $("input[name='radio1']:checked").val();

    if (Section1_PassOdia == null) {
        text += "<br /> - Section 1, Please choose whether Candidate has passed Odia.";
        opt = 1;
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
            text += "<br /> - Section 1, As per Govt. Notification, Candidate must Read, Write and Speak Odia Language. ";
            opt = 1;
            GovtMessage = 1;
        }
    }

    if (Section1_PassOdia == "no") {
        if (Section1_AbililtyRead == 0 || Section1_AbilityWrite == 0 || Section1_AbilitySpeak == 0) {
            text += "<br /> - Section 1, As per Govt. Notification, Candidate must Read, Write and Speak Odia Language. ";
            opt = 1;
            GovtMessage = 1;
        }
    }

    var Section2_Married = $("input[name='radio2']:checked").val();
    if (Section2_Married == null) {
        text += "<br /> - Section 2, Please choose whether Candidate is married or not.";
        opt = 1;
    }

    var Section2A_MoreThanOneSpouse = $("input[name='radio2a']:checked").val();

    if (Section2_Married == "yes") {
        if (Section2A_MoreThanOneSpouse == null) {
            text += "<br /> - Section 2, Please choose whether Candidate has more than one spouse or not.";
            opt = 1;

        }

        if (Section2A_MoreThanOneSpouse == "yes") {
            text += "<br /> - Section 2, As per Govt. Notification, candidate having more than 1 spouse are not eligible to fill Application.";
            opt = 1;
            GovtMessage = 1;
        }
    }

    var Section3_ExServiceMan = $("input[name='radio3']:checked").val();
    if (Section3_ExServiceMan == null) {
        text += "<br /> - Section 3, Please choose whether Candidate is Ex-Serviceman or not.";
        opt = 1;
    }
    
    var Section3A_ServiceRendered = $("#txtRtrmntdte").val();
    var Section3B_ServiceDurationFrom = $("#txtRndDrtinstrt").val();
    var Section3B_ServiceDurationTo = $("#txtRndDrtinend").val();
    var Section3C_ServiceYear = $("#SevsYear").val();
    var Section3C_ServiceMonth = $("#SevsMonth").val();
    var Section3C_ServiceDay = $("#SevsDay").val();

    if (Section3_ExServiceMan == "yes") {

        if (Section3B_ServiceDurationFrom == "" || Section3B_ServiceDurationTo == "") {
            text += "<br /> - Section 3, Please Enter the duration of service rendered.";
            opt = 1;

        }

    }

    //Section 7
    var Section7A_RegNo = $("#txtRegNo").val();
    var Section7A_RegDate = $("#txtRegdte").val();
    var Section7B_NameEmpExchg = $("#ddlEmploymentExchange option:selected").val();

    if (Section7B_NameEmpExchg == "0") {
        text += "<br /> - Please select Employment Exchange Name.";
        opt = 1;
    }

    //Section 9
    var Section9_InvolvedCriminal = $("input[name='radio9']:checked").val();

    var Section9A_ArrestDetail = $("input[name='radio9A']:checked").val();

    var Section9B_CaseRefNo = $("#txtCriminalRefNo").val();
    var Section9C_District = $("#ddlArrestDistrict").val();
    var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
    var Section9E_IPCSection = $("#txtIPCSection").val();
    
    if (Section9_InvolvedCriminal == null) {
        text += "<br /> - Section 4, Please choose whether candidate is involved in Criminal Case.";
        opt = 1;
    }

    if (Section9_InvolvedCriminal == "yes") {
        if (Acquitted == '' || Acquitted == '0') {
            text += "<br/> - Section 4, Please select Case Status";
            opt = 1;
        }
        
        if (Acquitted == "104") {
            text += "<br /> - Section 4, As per Notification you are not eligible, as you are convicted in criminal case";
            opt = 1;
        }

        if (Section9B_CaseRefNo == "") {
            text += "<br /> - Section 4, Please enter details of Case Reference No.";
            opt = 1;
        }

        if (Section9C_District != null && (Section9C_District == '' || Section9C_District == '-Select-')) {
            text += "<br /> - Section 4, Please choose List of Sports Event the candidate participated in.";
            opt = 1;
        }

        if (Section9D_PoliceStationNo == "") {
            text += "<br /> - Section 4, Please enter details of Police Station.";
            opt = 1;
        }

        if (Section9E_IPCSection == "") {
            text += "<br /> - Section 4, Please enter details of IPC Section.";
            opt = 1;
        }
        


    }

    if (opt == "") {
        if (!$("#Declaration").is(":checked")) {
            text += "<br /> -Please check Self Declaration.";
            opt = 1;
        }

    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
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
        var Age = calcExSerDur(txtDOB, '01/01/2016');
        var minAge = 18;
        var maxAge = 23;
        var ageToCompare = Age.years;

        if ($('#category').val() == "UR") {

        }
        else if ($('#category').val() == "SC" || $('#category').val() == "ST") {
            maxAge = 28;
        }

        var startDate = $('#txtRndDrtinstrt').val();
        var endDate = $('#txtRndDrtinend').val();
        var text = "";
        var check = false;
        var opt = 0;

        if (startDate != "" && endDate != "") {            

            if ($("#DOB").datepicker("getDate") >= $("#txtRndDrtinstrt").datepicker("getDate")) {
                //alert('Qualifying Service Duration must be greater than Date of Birth');
                text = "Qualifying Service Duration must be greater than Date of Birth.";
                alertPopup("Info", text);
                $("#txtRndDrtinstrt").val("");
                return false;
            }

            if ($("#DOB").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
                //alert('Qualifying Service Duration must be greater than Date of Birth');
                text = "Qualifying Service Duration must be greater than Date of Birth.";
                alertPopup("Info", text);
                $("#txtRndDrtinend").val("");
                return false;
            }

            if ($("#txtRndDrtinstrt").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
                //alert('Qualifying Service To Date must be greater than From Date');
                text = "Qualifying Service To Date must be greater than From Date.";
                alertPopup("Info", text);
                $("#txtRndDrtinend").val("");
                return false;
            }

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

                var Age = calcExSerDur(newDate, '01/01/2016');
                ageToCompare = Age.years;

            }

            var AgeForRenderService = calcExSerDur(txtDOB, startDate);

            if (AgeForRenderService.years < 18) {
                text = "Minimum Age is 18 Years for rendering service in Defense. You are not eligible for the application.";
                alertPopup("Info", text);

                $("#txtRndDrtinstrt").val("");
                $("#txtRndDrtinend").val("");
                $("#SevsYear").val("");
                $("#SevsMonth").val("");
                $("#SevsDay").val("");
                                                
                return false;
            }
        }

        
        if (ageToCompare < minAge) {
            //$('#DOB').val('');
            text += "<br /> -Applicant age should be 18 years. ";
            opt = 1;
        } else if (ageToCompare > maxAge) {

            check = true;

            if (check) {
                text += "<br /> -Applicant age should be less than " + maxAge + " years. ";
                opt = 1;
            }
        }
        else {
            result = true;
        }

        if (!result) {
            //alertPopup("Age criteria for submitting application is " + minAge  + " to " + maxAge + ".", text);
            alertPopup("Age criteria for submitting application", text);
            $("#btnSubmit").prop('disabled', false);
            return false;
        }
    }

    var temp = "Gunwant";
    var AppID = "";
    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var FirstName = $("#FirstName");
    var FatherName = $("#FatherName");
    var Age = $("#Age");

    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");

    var Religion = $("#religion option:selected").text();

    var Category = $("#category option:selected").text();
    var Nationality = $("#nationality option:selected").text();

    //var obj = jQuery.parseJSON($("#HFUIDData").val());

    var Section1_PassOdia = $("input[name='radio1']:checked").val();
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

    var Section2_Married = $("input[name='radio2']:checked").val();
    var Section2A_MoreThanOneSpouse = $("input[name='radio2a']:checked").val();

    var Section3_ExServiceMan = $("input[name='radio3']:checked").val();
    var Section3A_ServiceRendered = $("#txtRtrmntdte").val();
    var Section3B_ServiceDurationFrom = $("#txtRndDrtinstrt").val();
    var Section3B_ServiceDurationTo = $("#txtRndDrtinend").val();
    var Section3C_ServiceYear = $("#SevsYear").val();
    var Section3C_ServiceMonth = $("#SevsMonth").val();
    var Section3C_ServiceDay = $("#SevsDay").val();

    var Section7A_RegNo = $("#txtRegNo").val();
    var Section7A_RegDate = $("#txtRegdte").val();
    var Section7B_NameEmpExchg = $("#ddlEmploymentExchange option:selected").text();
    var Section7B_EmpExchgID = $("#ddlEmploymentExchange option:selected").val();
    var Section7B_DistrictEmpExchg = $("#EEddlDistrict option:selected").val();
    var Section7B_EmpExchgName = $("#ddlEmploymentExchange option:selected").text();

    var Section9_InvolvedCriminal = $("input[name='radio9']:checked").val();
    var Section9A_CaseStatus = $("#ddlAcquitted option:selected").text();
    var Section9B_CaseRefNo = $("#txtCriminalRefNo").val();
    var Section9C_State = $("#ddlStateCC").val();
    var Section9C_District = $("#ddlArrestDistrict").val();
    var Section9D_PoliceStationNo = $("#ddlPoliceStation").val();
    //var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
    var Section9E_IPCSection = $("#txtIPCSection").val();


    var datavar = {

        'FirstName': $('#FirstName').val(),
        'residentName': $('#FirstName').val() ,
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
        'Nationality': $('#Nationality').val(),
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

        'Section1_PassOdia': Section1_PassOdia,
        'Section1_AbililtyRead': Section1_AbililtyRead,
        'Section1_AbilityWrite': Section1_AbilityWrite,
        'Section1_AbilitySpeak': Section1_AbilitySpeak,

        'Section2_Married': Section2_Married,
        'Section2A_MoreThanOneSpouse': Section2A_MoreThanOneSpouse,

        'Section3_ExServiceMan': Section3_ExServiceMan,
        'Section3A_ServiceRendered': Section3A_ServiceRendered,
        //'Section3B_ServiceDuration': Section3B_ServiceDuration,
        'Section3B_ServiceDurationFrom': Section3B_ServiceDurationFrom,
        'Section3B_ServiceDurationTo': Section3B_ServiceDurationTo,
        'Section3C_ServiceYear': Section3C_ServiceYear,
        'Section3C_ServiceMonth': Section3C_ServiceMonth,
        'Section3C_ServiceDay': Section3C_ServiceDay,
                
        //'Section7': '',
        'Section7A_RegNo': Section7A_RegNo,
        'Section7A_RegDate': Section7A_RegDate,
        'Section7B_NameEmpExchg': Section7B_NameEmpExchg,

        'Section7B_DistrictEmpExchg': Section7B_DistrictEmpExchg,
        'Section7B_EmpExchgID': Section7B_EmpExchgID,
        'Section7B_EmpExchgName': Section7B_EmpExchgName,
                
        'Section9_InvolvedCriminal': Section9_InvolvedCriminal,
        'Section9A_ArrestDetail': Section9A_CaseStatus,
        'Section9B_CaseRefNo': Section9B_CaseRefNo,
        'Section9C_District': Section9C_District,
        'Section9D_PoliceStationNo': Section9D_PoliceStationNo,
        'Section9E_IPCSection': Section9E_IPCSection,

        'ImageSign': $('#HFb64Sign').val(),

        'InstituteName': $('#HFb64Sign').val(),
        'InstituteAddress': $('#HFb64Sign').val(),
        'PassingYear': $('#HFb64Sign').val(),
    };


    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/MenialStaff/GroupD.aspx/InsertMenialData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alert("5." + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;

            if (result /*&& jqXHRData_IMG_result*/) {

                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=389&AppID=' + obj.AppID;
            }

        });// end of Then function of main Data Insert Function

    return false;
}

//div.msgBox width: 520px;
//div.msgBoxContent     width: 408px

function GetBatallionList() {
    var CategoryCode = $("#ddlApplication option:selected").val();
    
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/MenialStaff/GroupD.aspx/GetBatallionList',
        data: '{"prefix":"' + category + '","CategoryCode":"' + CategoryCode + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlBattalion").empty();
            $("#ddlBattalion").append('<option value = "0">-Select Battalion-</option>');
            $.each(Category, function () {
                $("#ddlBattalion").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


