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

        }//end of UID Data



    }
}

$(document).ready(function () {
    $("#progressbar").hide();
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
            debugger;
            t_DOD = $("#txtRndDrtinstrt").val();
            t_DOB = $("#txtRndDrtinend").val();

            if ($("#txtRndDrtinstrt").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
                alertPopup('Form Validation ', 'Qualifying Service To Date must be greater than From Date.');
                $("#txtRndDrtinstrt").val("");
                $('#txtRndDrtinend').val("");                
                return;
            }

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

    $('#txtRegdte').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '02/12/2016',
        yearRange: "-50:+0",
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
        yearRange: "-50:2015",
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

    $("#religion").bind("change", function (e) {

        var CategoryArr = ["SC", "ST", "SEBC", "UR"];
        var CategoryArr2 = ["UR"];
        var CategoryArr3 = ["SC", "UR"];
        var CategoryArr4 = ["ST", "UR"];
        var CategoryArr5 = ["SC","ST", "UR"];

        $("#category").empty();
        $("#category").append('<option value = "0">-Select-</option>');

        if ($("#religion").val() == "Hndu") {
            var arrLen = CategoryArr.length;

            for (i = 0; i < arrLen; i++) {
                $("#category").append('<option value = "' + CategoryArr[i] + '">' + CategoryArr[i] + '</option>');
            }
            $("#category").prop('disabled', false);
        }
        else if ($("#religion").val() == "Skhsm") {
            var arrLen = CategoryArr3.length;

            for (i = 0; i < arrLen; i++) {
                $("#category").append('<option value = "' + CategoryArr3[i] + '">' + CategoryArr3[i] + '</option>');
            }
            $("#category").prop('disabled', false);
        } else if ($("#religion").val() == "Crstn") {
            var arrLen = CategoryArr4.length;

            for (i = 0; i < arrLen; i++) {
                $("#category").append('<option value = "' + CategoryArr4[i] + '">' + CategoryArr4[i] + '</option>');
            }
            $("#category").prop('disabled', false);
        } else if ($("#religion").val() == "Budhist") {
            var arrLen = CategoryArr5.length;

            for (i = 0; i < arrLen; i++) {
                $("#category").append('<option value = "' + CategoryArr5[i] + '">' + CategoryArr5[i] + '</option>');
            }
            $("#category").prop('disabled', false);
        }
        else if ($("#religion").val() == "Othr") {
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
            $("#txtTotalMarks").attr("placeholder", "CGPA").val("").focus().blur();
            $("#lblTotalMarks").text("CGPA");
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
            GetEducationBoard("", 21, EdBoard);

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
    var FirstName = $("#FirstName");
    var LastName = $("#LastName");
    var FatherName = $("#FatherName");

    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");

    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    //var ApplicationType = $("#ddlApplication option:selected").text();

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

    //if (EmailID.val() == '') {
    //    text += "<br /> -Please enter EMail ID. ";
    //    opt = 1;
    //}

    if (DOB.val() == '') {
        text += "<br /> -Please enter Date of Birth. ";
        DOB.attr('style', 'border:1px solid #d03100 !important;');
        DOB.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }

    //if ((Gender == '' || Gender == 'Select Gender')) {
    //    text += "<br /> -Please Select Gender. ";
    //    Gender.attr('style', 'border:1px solid #d03100 !important;');
    //    Gender.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    Gender.attr('style', 'border:1px solid #cdcdcd !important;');
    //    Gender.css({ "background-color": "#ffffff" });
    //}
    
    //if ($('#phoneno').val() != "") {
    //    var stdcode = $('#stdcode');
    //    if (stdcode.val() == '') {
    //        text += "<br /> -Please enter STD Code of Telephone No. ";
    //        stdcode.attr('style', 'border:1px solid #d03100 !important;');
    //        stdcode.css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        stdcode.attr('style', 'border:1px solid #cdcdcd !important;');
    //        stdcode.css({ "background-color": "#ffffff" });
    //    }
    //}

    //$('#stdcode').val()
    //if ((ApplicationType == '' || ApplicationType == 'Select Application Type')) {
    //    text += "<br /> -Please Select Application Type ";
    //    $("#ddlApplication").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#ddlApplication").css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $("#ddlApplication").attr('style', 'border:1px solid #cdcdcd !important;');
    //    $("#ddlApplication").css({ "background-color": "#ffffff" });
    //}
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


    //var PhotoUpload1 = $("#myImg");

    //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
    //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

    //if (Photoarray.indexOf(Extension) <= -1) {
    //    _err_mag += "<br /> - Photo must be in JPEG / PNG form.";
    //    opt = 1;
    //}

    //var sizekb = $('#HFSizeOfPhoto').val();
    //sizekb = sizekb == "" ? 0 : sizekb.toFixed(0);

    ////alert(sizekb);

    //if (sizekb < 5 || sizekb > 50) {
    //    text += "<br /> - The size of the photograph should fall between 5KB to 50KB. Your Photo Size is " + sizekb + "kb.";
    //    opt = 1;
    //}

    var EddlBoardState = $("#EddlBoardState option:selected").text();
    var ddlBoard = $("#ddlBoard option:selected").text();
    var txtExmntnName = $("#txtExmntnName");
    var txtPssngYr = $("#txtPssngYr option:selected").text(); //DropDown
    var ddlPasstype = $("#ddlPasstype option:selected").text();
    var ddlPctgeCalclte = $("#ddlPctgeCalclte option:selected").text();
    var txtTotalMarks = $("#txtTotalMarks");
    var txtMarkSecure = $("#txtMarkSecure");
    var txtPercentage = $("#txtPercentage");


    if (EddlBoardState != null && (EddlBoardState == '' || EddlBoardState == '-Select-')) {
        text += "<br /> -Please select State in Educational Qualification.";
        $('#EddlBoardState').attr('style', 'border:1px solid #d03100 !important;');
        $('#EddlBoardState').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#EddlBoardState').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#EddlBoardState').css({ "background-color": "#ffffff" });
    }

    if (ddlBoard != null && (ddlBoard == '' || ddlBoard == '-Select-')) {
        text += "<br /> -Please select Name of Board/Council in Educational Qualification.";
        $('#ddlBoard').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBoard').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlBoard').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlBoard').css({ "background-color": "#ffffff" });
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



    var Section1_PassOdia = $("input[name='radio1']:checked").val();

    if (Section1_PassOdia == null) {
        text += "<br /> - Section 1, Please choose whether Candidate has passed Odia.";        
        opt = 1;
    } else {
       
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


    //if (Section1_AbililtyRead == 1 && Section1_AbilityWrite == 1 && Section1_AbilitySpeak == 1) {
    //    text += "<br /> -As per Govt. Notification, you are not eligible to fill Application.";
    //    opt = 1;
    //}


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


    //Section 4
    var Section4_IsSportsPerson = $("input[name='radio4a']:checked").val();
    var Section4A_SportsParticipated = $("#ddlSports option:selected").text();
    var Section4B_SportsOthers = $("#txtOthrsport").val();
    var Section4B_WantsRelaxation = $("input[name='radio4c']:checked").val();
    var Section4C_SportsFedAssName = $("#txtSportFedAssName").val();
    var Section4B_RelaxationHeight = $("#ddlRxlstnhgt option:selected").text();
    var Section4B_RelaxationChest = $("#ddlRxlstnchst option:selected").text();
    var Section4B_RelaxationWeight = $("#ddlRxlstnwght option:selected").text();

    if (Section4_IsSportsPerson == null) {
        text += "<br /> - Section 4, Please choose whether Candidate is Sports Person or not.";
        opt = 1;
    }

    if (Section4_IsSportsPerson == "yes") {
        if (Section4A_SportsParticipated != null && (Section4A_SportsParticipated == '' || Section4A_SportsParticipated == 'List of Sports')) {
            text += "<br /> - Section 4, Please choose List of Sports Event the candidate participated in.";
            opt = 1;
        }

        if (Section4C_SportsFedAssName == null || Section4C_SportsFedAssName == "") {
            text += "<br /> - Please enter the Federation or Sports Association Name.";
            $('#txtSportFedAssName').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtSportFedAssName').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtSportFedAssName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtSportFedAssName').css({ "background-color": "#ffffff" });
        }

        //if (Section4A_SportsParticipated != null && (Section4A_SportsParticipated == 'Others')) {

        //    if (Section4B_SportsOthers == "") {
        //        text += "<br /> - Section 4, Please enter Sports Event the candidate participated in.";
        //        opt = 1;

        //    }

        //}


        if (Section4B_RelaxationHeight == null) {
            text += "<br /> - Section 4, Please choose whether Candidate wants to avail ralaxation in height, weight & chest.";
            opt = 1;
        }

        if (Section4B_RelaxationHeight == "yes") {

            if (Section4B_RelaxationHeight != null && (Section4B_RelaxationHeight == '' || Section4B_RelaxationHeight == 'Select')) {
                text += "<br /> - Section 4, Please select Height in Physical Standards of Measurement.";
                opt = 1;
            }

            if (Section4B_RelaxationChest != null && (Section4B_RelaxationChest == '' || Section4B_RelaxationChest == 'Select')) {
                text += "<br /> - Section 4, Please select Chest in Physical Standards of Measurement.";
                opt = 1;
            }

            if (Section4B_RelaxationWeight != null && (Section4B_RelaxationWeight == '' || Section4B_RelaxationWeight == 'Select')) {
                text += "<br /> - Section 4, Please select Weight in Physical Standards of Measurement.";
                opt = 1;
            }

        }

    }

    //Section 5


    var Section5_SportsParticipate = $("input[name='radio5']:checked").val();

    if (Section5_SportsParticipate == null) {
        text += "<br /> - Section 5, Please choose whether Candidate participated in Sports event or not.";
        opt = 1;
    }

    if (Section5_SportsParticipate == "yes") {

        var Section5A_ParticipateEvent = $("#ddlSports2 option:selected").text();
        if (Section5A_ParticipateEvent != null && (Section5A_ParticipateEvent == '' || PreVillage == 'List of Sports')) {
            text += "<br /> - Section 5, Please choose List of Sports Event the candidate participated in.";
            opt = 1;
        }


        var Section5B_SportsCategory = $("input[name='radio5b']:checked").val();
        if (Section5B_SportsCategory == null) {
            text += "<br /> - Section 5, Please choose List of Sports Category the candidate participated in.";
            opt = 1;
        }
        var Section5C_SportsMedal = $("input[name='radio5C']:checked").val();

    }


    //Section 6
    var Section6_NCCCertificate = $("input[name='radio6']:checked").val();
    var Section6A_NCCCertificateCategory = $("input[name='radio6A']:checked").val();

    if (Section6_NCCCertificate == null) {
        text += "<br /> - Section 6, Please choose whether candidate possess NCC Certificate or not.";
        opt = 1;
    }

    if (Section6_NCCCertificate == "yes") {
        if (Section6A_NCCCertificateCategory == null) {
            text += "<br /> - Section 6, Please choose category of NCC Certificate.";
            opt = 1;
        }
    }

    //Section 7
    var Section7A_RegNo = $("#txtRegNo").val();
    var Section7A_RegDate = $("#txtRegdte").val();
    var Section7B_EEddlDistrict = $("#EEddlDistrict option:selected").val();
    var Section7B_NameEmpExchg = $("#txtNameEmpEx").val();
    //var Section7B_NameEmpExchg = $("#ddlEmploymentExchange option:selected").val();

    if (Section7A_RegNo == null || Section7A_RegNo == "") {
        text += "<br /> - Please enter Employment Exchange Registration Number.";
        $('#txtRegNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRegNo').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegNo').css({ "background-color": "#ffffff" });
    }

    if (Section7A_RegDate == null || Section7A_RegDate == "") {
        text += "<br /> - Please enter Employment Exchange Registration Date.";
        $('#txtRegdte').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegdte').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRegdte').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegdte').css({ "background-color": "#ffffff" });
    }

    if (Section7B_EEddlDistrict == "0") {
        text += "<br /> - Please select District of Employment Exchange where Name is registered.";
        $('#EEddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
        $('#EEddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#EEddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#EEddlDistrict').css({ "background-color": "#ffffff" });
    }

    if (Section7B_NameEmpExchg == null || Section7B_NameEmpExchg == "") {
        text += "<br /> - Please select Employment Exchange Name.";
        $('#txtNameEmpEx').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtNameEmpEx').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtNameEmpEx').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtNameEmpEx').css({ "background-color": "#ffffff" });
    }

    //Section 8
    var Section8_HasDL = $("input[name='radio8']:checked").val();

    var Section8A_LicenseVehicle = $("input[name='radio8A']:checked").val();
    var Section8B_LicenseNo = $("#txtLicenseNo").val();

    var Section8B_LicenseDate = $("#txtLicenseDate").val();
    //var Section8C_NameRTOOffice = $("#txtRTO").val();
    //var Section8C_NameRTOOffice = $("#ddlRTO").val();
    var Section8C_NameRTOOffice = $("#txtRTO").val();

    if (Section8_HasDL == null) {
        text += "<br /> - Section 7, Please choose whether candidate possess Driving License with validity for atleast 1 year.";
        opt = 1;
    }

    if (Section8_HasDL == "yes") {

        if (Section8A_LicenseVehicle == null) {
            text += "<br /> - Section 7, Please choose whether Driving License is applicable for Heavy Vehicle or Light vehicle.";           
            opt = 1;
        } 

        if (Section8B_LicenseNo == "" || Section8B_LicenseDate == "") {
            text += "<br /> - Section 7, Please enter License Number and Date.";
            $('#txtLicenseNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtLicenseNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtLicenseNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtLicenseNo').css({ "background-color": "#ffffff" });
        }

        if (Section8C_NameRTOOffice == "") {
            text += "<br /> - Section 7, Please enter Name of RTO Office.";
            $('#txtRTO').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRTO').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtRTO').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRTO').css({ "background-color": "#ffffff" });
        }

    }

    //Section 9
    var Section9_InvolvedCriminal = $("input[name='radio9']:checked").val();

    var Section9A_ArrestDetail = $("input[name='radio9A']:checked").val();

    var Section9B_CaseRefNo = $("#txtCriminalRefNo").val();
    var Section9C_District = $("#ddlArrestDistrict").val();
    var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
    var Section9E_IPCSection = $("#txtIPCSection").val();


    if (Section9_InvolvedCriminal == null) {
        text += "<br /> - Section 8, Please choose whether candidate is involved in Criminal Case.";
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

        //if (Section9A_ArrestDetail == null) {
        //    text += "<br /> - Section 8, Please choose whether candidate is involved in Criminal Case.";
        //    opt = 1;
        //}

        //if (Section9A_ArrestDetail == "no") {
        //    text += "<br /> - Section 8, As per Govt. Notification, you are not eligible to fill the Application.";
        //    opt = 1;
        //}

        if (Section9B_CaseRefNo == "") {
            text += "<br /> - Section 8, Please enter details of Case Reference No.";
            opt = 1;
        }

        if (Section9C_District != null && (Section9C_District == '' || Section9C_District == '-Select-')) {
            text += "<br /> - Section 8, Please choose List of Sports Event the candidate participated in.";
            opt = 1;
        }

        if (Section9D_PoliceStationNo == "") {
            text += "<br /> - Section 8, Please enter details of Police Station.";
            opt = 1;
        }

        if (Section9E_IPCSection == "") {
            text += "<br /> - Section 8, Please enter details of IPC Section.";
            opt = 1;
        }



    }

    if (opt == "") {
        if (!$("#Declaration").is(":checked")) {
            text += "<br /> -Please check Self Declaration.";
            opt = 1;
        }

        if (!$("#chkPhysical").is(":checked")) {
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

function AddEducation(DeleteString) {
    return false;
    if (validateValues(DeleteString) == true) {
        var strProduct = "";
        var strSaveProduct = "";
        var Appid = "";
        var strTempString = "";


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


        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {


            strTempString = "#" + SrNo + "," + strIngredient + "," + strMonographID + "," + strMonograph + "," + strOtherMonograph + "," + strStrength + "," + strUnit + "#";

        }
        else {
            strTempString = document.getElementById("<%=hdfProduct.ClientID %>").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblProduct' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Name of Active Ingredient</th>";
        Str = Str + "<th style='text-align: center;'>Pharmacopoeial Monograph</th>";
        Str = Str + "<th style='text-align: center;'>Strength</th>";
        Str = Str + "<th style='text-align: center;'>Strength Unit</th>";
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
            strIngredient = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strMonographID = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strMonograph = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strOtherMonograph = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strStrength = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strUnit = RemStr;

            var DeleteString = "#" + SrNo + "," + strIngredient + "," + strMonographID + "," + strMonograph + "," + strOtherMonograph + "," + strStrength + "," + strUnit + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strIngredient + "</td>";
            if (strMonographID == 'Other')
                Str = Str + "<td style='' >" + strMonograph + " (" + strOtherMonograph + ") </td>";
            else
                Str = Str + "<td style='' >" + strMonograph + "</td>";

            Str = Str + "<td style='' >" + strStrength + "</td>";
            Str = Str + "<td style='' >" + strUnit + "</td>";


            Str = Str + "<td align='center'><img src='/Quick Links/FDA/Images/NotVerified.png' style='cursor:pointer;padding-top: 5px;text-align:center;' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strProduct = strProduct + "#" + SrNo + "," + strIngredient + "," + strMonographID + "," + strMonograph + "," + strOtherMonograph + "," + strStrength + "," + strUnit + "#";

            strSaveProduct = strSaveProduct + "#" + SrNo + "," + strIngredient + "," + strMonographID + "," + strMonograph + "," + strOtherMonograph + "," + strStrength + "," + strUnit + "#";

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divProduct').innerHTML = Str;
        document.getElementById("<%=hdfProduct.ClientID %>").value = strProduct;
        document.getElementById("<%=hdfProductSave.ClientID %>").value = strSaveProduct;
        document.getElementById("<%=hdfProdString.ClientID %>").value = intCount;

        document.getElementById('<%=ddlPharmacopoeialMonograph.ClientID %>').selectedIndex = 0;
        $("#txtOtherPharmacopoeialMonograph").hide();
        $("#lblOtherPharmacopoeialMonograph").hide();
        $("#divOtherPhar").hide();
        document.getElementById('<%=txtNameofIngredient.ClientID %>').value = "";
        document.getElementById('<%=txtOtherPharmacopoeialMonograph.ClientID %>').value = "";
        document.getElementById('<%=txtStrength.ClientID %>').value = "";
        document.getElementById('<%=txtStrengthUnit.ClientID %>').value = "";

        document.getElementById('<%=txtNameofIngredient.ClientID %>').focus();

    }
}

function DeleteEducation(DeleteString) {
    return false;
    var Msg = "Do you want remove this Qualification?";

    if (confirm(Msg)) {

        AddEducation(DeleteString);
    }
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

function GetEducationBoard(StateCode, EdBoard) {
    var EddlBoardState = $("#EddlBoardState").val();
    var category = '';
    debugger;
    var SelIndex = EddlBoardState;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OISF/OISF.aspx/GetEducationBoard',
        data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlBoard").empty();
            $("#ddlBoard").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlBoard").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
            $("#ddlBoard").append('<option value = "99">Other</option>');
            $('#ddlBoard').prop("disabled", false);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
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

function GetRTOList(DistrictCode, RTO) {
    DistrictCode = $("#ddlDistrictRTO").val();
    //alert(DistrictCode);
    //debugger;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OISF/OISF.aspx/GetRTOList',
        data: '{"prefix":"' + category + '","DistrictCode":"' + DistrictCode + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlRTO").empty();
            $("#ddlRTO").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlRTO").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetPoliceStation(StateCode, DistrictCode, PoliceStation) {
    var StateCode = $("#" + StateCode + "").val();
    var DistrictCode = $("#" + DistrictCode + "").val();
    var category = '';
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

                //alert(dateDOB);
                var newDate = pad(dateDOB.getDate().toString(), 2) + "/" + pad(dateDOB.getMonth().toString(), 2) + "/" + dateDOB.getFullYear().toString();

                var Age = calcExSerDur(newDate, '01/01/2016');
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

        if (!result) {
            //alertPopup("Age criteria for submitting application is " + minAge  + " to " + maxAge + ".", text);
            alertPopup("Age criteria for submitting application", text);
            $("#btnSubmit").prop('disabled', false);
            return false;
        }
    }
    //alert('sucess');
    //return false;

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

    var Section4_IsSportsPerson = $("input[name='radio4a']:checked").val();
    var Section4A_SportsParticipated = $("#ddlSports option:selected").text();
    var Section4B_SportsOthers = $("#txtOthrsport").val();
    var Section4C_SportsFedAssName = $("#txtSportFedAssName").val();
    //var Section4B_WantsRelaxation = $("input[name='radio4b']:checked").val();
    var Section4B_WantsRelaxation = $("input[name='radio4c']:checked").val();

    var Section4B_RelaxationHeight = $("#ddlRxlstnhgt option:selected").text();
    var Section4B_RelaxationChest = $("#ddlRxlstnchst option:selected").text();
    var Section4B_RelaxationWeight = $("#ddlRxlstnwght option:selected").text();

    var Section5 = $("input[name='radio5']:checked").val();
    var Section5A_ParticipateEvent = $("#ddlSports2 option:selected").text();
    var Section5B_SportsCategory = $("input[name='radio5b']:checked").val();
    var Section5C_SportsMedal = $("input[name='radio5C']:checked").val();

    var Section6_NCCCertificate = $("input[name='radio6']:checked").val();
    var Section6A_NCCCertificateCategory = $("input[name='radio6A']:checked").val();

    var Section7A_RegNo = $("#txtRegNo").val();
    var Section7A_RegDate = $("#txtRegdte").val();
    //var Section7B_NameEmpExchg = $("#ddlEmploymentExchange option:selected").text();
    var Section7B_NameEmpExchg = $("#txtNameEmpEx").val();
    var Section7B_District = $("#EEddlDistrict").val();

    var Section8_HasDL = $("input[name='radio8']:checked").val();
    var Section8A_LicenseVehicle = $("input[name='radio8A']:checked").val();
    var Section8B_LicenseNo = $("#txtLicenseNo").val();
    var Section8B_LicenseDate = $("#txtLicenseDate").val();
    //var Section8C_NameRTOOffice = $("#txtRTO").val();

    var Section8C_District = $("#ddlDistrictRTO").val();
    var Section8C_NameRTOOffice = $("#txtRTO").val();

    var Section9_InvolvedCriminal = $("input[name='radio9']:checked").val();
    //var Section9A_ArrestDetail = $("input[name='radio9A']:checked").val();
    var Section9B_CaseRefNo = $("#txtCriminalRefNo").val();
    var Section9C_State = $("#ddlStateCC").val();
    var Section9C_District = $("#ddlArrestDistrict").val();
    var Section9D_PoliceStationNo = $("#ddlPoliceStation").val();
    //var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
    var Section9E_IPCSection = $("#txtIPCSection").val();
    var ChoiceofPreference = $("#ddlApplication option:selected").text();
    var SecondPreference = $("#ddlAppPref option:selected").val();
    //if (SecondPreference == '0') {
    //    SecondPreference = 'No second choice preference';
    //}
    //else {
    //    SecondPreference = $("#ddlAppPref option:selected").text();
    //}
    var Acquitted = $('#ddlAcquitted option:selected').text();

    var ResponseType = "C";

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var datavar = {

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

        'Section4_IsSportsPerson': Section4_IsSportsPerson,
        'Section4A_SportsParticipated': Section4A_SportsParticipated,
        'Section4B_SportsOthers': Section4B_SportsOthers,
        'Section4C_SportsFedAssName':Section4C_SportsFedAssName,
        'Section4B_WantsRelaxation': Section4B_WantsRelaxation,
        'Section4B_RelaxationHeight': Section4B_RelaxationHeight,
        'Section4B_RelaxationChest': Section4B_RelaxationChest,
        'Section4B_RelaxationWeight': Section4B_RelaxationWeight,

        //'Section5_SportsPersonData': '',
        'Section5A_ParticipateEvent': Section5A_ParticipateEvent,
        'Section5B_SportsCategory': Section5B_SportsCategory,
        'Section5C_SportsMedal': Section5C_SportsMedal,

        'Section6_NCCCertificate': Section6_NCCCertificate,
        'Section6A_NCCCertificateCategory': Section6A_NCCCertificateCategory,

        //'Section7': '',
        'Section7A_RegNo': Section7A_RegNo,
        'Section7A_RegDate': Section7A_RegDate,
        'Section7B_NameEmpExchg': Section7B_NameEmpExchg,

        //'Section7B_DistrictEmpExchg': Section7B_DistrictEmpExchg,
        //'Section7B_EmpExchgID': Section7B_EmpExchgID,
        //'Section7B_EmpExchgName': Section7B_EmpExchgName,

        'Section8_HasDL': Section8_HasDL,
        'Section8A_LicenseVehicle': Section8A_LicenseVehicle,
        'Section8B_LicenseNo': Section8B_LicenseNo,
        'Section8B_LicenseDate': Section8B_LicenseDate,
        'Section8C_NameRTOOffice': Section8C_NameRTOOffice,
        //$('#ddlAcquitted option:selected').val("0");
        'Section9_InvolvedCriminal': Section9_InvolvedCriminal,
        'Section9A_ArrestDetail': Acquitted,
        'Section9B_CaseRefNo': Section9B_CaseRefNo,
        'Section9C_District': Section9C_District,
        'Section9D_PoliceStationNo': Section9D_PoliceStationNo,
        'Section9E_IPCSection': Section9E_IPCSection,

        'ImageSign': $('#HFb64Sign').val(),

        'EduState': $('#EddlBoardState').val(),
        'EduNameOfBoard': $('#ddlBoard').val(),
        'EduNameOfExamination': $('#txtExmntnName').val(),
        'EduPassingYear': $('#txtPssngYr option:selected').text(),//DropDown
        'EduGrade': $('#ddlPctgeCalclte').val(),
        'EduExamCleared': $('#ddlPasstype').val(),
        'EduTotalMarks': $('#txtTotalMarks').val(),
        'EduMarkSecured': $('#txtMarkSecure').val(),
        'EduPercentage': $('#txtPercentage').val(),

        'Section5': Section5,
        'Section7B_District': Section7B_District,
        'Section8C_District': Section8C_District,
        'ChoiceofPreference' :ChoiceofPreference,
        'SecondPreference': SecondPreference,
        'Section9C_State': Section9C_State,
        'ResponseType': ResponseType,
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
            url: '/WebApp/Kiosk/OISF/OISF.aspx/InsertData',
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
                //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=388&AppID=' + obj.AppID;
                window.location.href = '/WebApp/Kiosk/OISF/ProcessBar_OISF.aspx?SvcID=388&AppID=' + obj.AppID;
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