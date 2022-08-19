function openWindow(UIDVal, value, SessionName) {
    if (validateUID(UIDVal) != false) {

        var UID = $("#UID").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=428&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
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
            $("#txtDiscipline").val(obj["AgroPolytechnicStream"]);


            $("#MotherName").prop("disabled", true);
            $("#txtTongue").prop("disabled", true);
            $("#religion").prop("disabled", true);
            $("#category").prop("disabled", true);

        }//end of UID Data
    }
}


$(document).ready(function () {
    $("#progressbar").hide();
    $('#btnSubmit').prop('disabled', true);

    if ($("#HFUIDData").val() != "") {
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

            var Age = calcExSerDur(date, '31/12/2017');
            $('#Age').val(Age.years);

            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);

        }
    });


    $('#txtTotalMarks').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtMarkSecure').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });


    $('#txtTotalMarks2').change(function () {

        calculatepercentageXII($('#txtTotalMarks2').val(), $('#txtMarkSecure2').val());
    });


    $('#txtMarkSecure2').change(function () {

        calculatepercentageXII($('#txtTotalMarks2').val(), $('#txtMarkSecure2').val());
    });

    $('#txtTotalMarksAgro').change(function () {
        CalculateMscPercentage($('#txtTotalMarksAgro').val(), $('#txtMarkSecureAgro').val());
    });

    $('#txtMarkSecureAgro').change(function () {
        CalculateMscPercentage($('#txtTotalMarksAgro').val(), $('#txtMarkSecureAgro').val());
    });


    $("#ddlPctgeCalclte").bind("change", function (e) {

        if ($("#ddlPctgeCalclte").val() == "501") {
            $("#txtTotalMarks").attr("placeholder", "Total CGPA").val("").focus().blur();
            $("#lblTotalMarks").text("CGPA Secured");
            $('#txtMarkSecure').attr("placeholder", "CGPA Secured").val("").focus().blur();
            $("#lblMarksScored").text("Total CGPA");

            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");
        }
        else {
            $("#txtTotalMarks").attr("placeholder", "Total Marks").val("").focus().blur();
            $("#lblTotalMarks").text("Total Marks");
            $('#txtMarkSecure').attr("placeholder", "Marks Secured").val("").focus().blur();
            $("#lblMarksScored").text("Marks Secured");
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
            $('#txtMarkSecure2').attr("placeholder", "CGPA").val("").focus().blur();
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


    $("#ddlPctgeCalclteAgro").bind("change", function (e) {
        if ($("#ddlPctgeCalclteAgro").val() == "501") {

            $('#lblMscMarksGot').removeClass("manadatory");
            $('#txtTotalMarksAgro').prop('disabled', false);
            $('#txtMarkSecureAgro').prop('disabled', false);

            $("#MscTotalMarks").attr("placeholder", "OGPA").val("").focus().blur();
            $("#lblTotalMarksAgro").text("OGPA Secured");
            $("#txtMarkSecureAgro").prop('disabled', true);

            $('#txtTotalMarksAgro').val("");
            $('#txtMarkSecureAgro').val("10");
            $("#txtPercentageAgro").val("");

        }

        if ($('#ddlPctgeCalclteAgro').val() == "0") {
            $('#txtPssngYrAgro').val('0');
            $('#txtTotalMarksAgro').val('');
            $('#txtTotalMarksAgro').prop('disabled', true);
            $('#txtMarkSecureAgro').val('');
            $('#txtMarkSecureAgro').prop('disabled', true);
        }
    });


    function calculatepercentage(TotalMarks, MarksObtained) {

        if (TotalMarks == "") return;

        var result = 0;

        if ($("#ddlPctgeCalclte").val() == "501") {

            if (TotalMarks <= 0) TotalMarks = 1;

            if (TotalMarks < 3.5) {
                alert("CGPA cannot be less than 3.5");
                $('#txtTotalMarks').val("");
                return;
            }

            if (TotalMarks > 10.5 || MarksObtained > 10.0) {
                alert("Total Marks of CGPA can not be greater than 10");
                $('#txtTotalMarks').val("");
                $('#txtMarkSecure').val("");
                $("#txtPercentage").val("");
                return;
            }

            if (MarksObtained == "") return;
            result = 0;

            //result = (TotalMarks - 0.5) * 10;
            result = ((MarksObtained) * 9.5).toFixed(2);
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

            if (TotalMarks > 10.5 || MarksObtained > 10.0) {
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


    function CalculateMscPercentage(TotalMarks, MarksObtained) {

        if (TotalMarks == "") return;
        var result = 0;

        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 6.60) {
            alert("OGPA cannot be less than 6.60");
            $('#txtTotalMarksAgro').val("");
            $("#txtPercentageAgro").val("");
            return;
        }

        if (TotalMarks > 10.0 || MarksObtained > 10.0) {
            alert("Please enterr valid OGPA");
            $('#txtTotalMarksAgro').val("");
            $("#txtPercentageAgro").val("");
            return;
        }

        result = ((TotalMarks / 10) * 100).toFixed(2);
        $("#txtPercentageAgro").val(result + ' %');
    }


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

    EL("File1").addEventListener("change", readFile, false);
    EL("File2").addEventListener("change", readFile2, false);

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
                    url: '/webapp/kiosk/OUAT/AgroFormB.aspx/GetOUATAgroFormAData',
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

            $("[name='" + StateControl + "']").empty();
            $("[name='" + StateControl + "']").append('<option value = "0">-Select-</option>');
            $.each(arr, function () {
                $("[name='" + StateControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });
}


function GetDistrict(category, StateControl, DistrictControl) {
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
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}


function OUAT_GetDistrict(category, StateControl, DistrictControl) {
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

        $("#txtDiscipline").val(obj["Discipline"]);
        $("#txtDiscipline").prop("disabled", true);

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


function EL(id) { return document.getElementById(id); } // Get el by ID helper function


function readFile() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 10 || sizekb > 50) {
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
                });

                t_StateVal = selectByTextAddress(AddState, "ODISHA");

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
                            catCount++;
                        });

                        t_DistrictVal = selectByTextAddress(AddDistrict, p_District);

                        if (t_DistrictVal != "") {

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

    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    return t_Value;
}

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
            $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val($("#ContentPlaceHolder1_Address1_PinCode").val());
        }
    }
    else {
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val("");
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

    if (aadhaarcard.val() == '') {
        text += "<br /> -Please enter Aadhaar number. ";
        aadhaarcard.attr('style', 'border:1px solid #d03100 !important;');
        aadhaarcard.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        aadhaarcard.attr('style', 'border:1px solid #cdcdcd !important;');
        aadhaarcard.css({ "background-color": "#ffffff" });
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

    if ((Gender == '' || Gender == '--Select Gender--')) {
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
    var Tongue = $("#txtTongue option:selected").text();
    if ((Category == '' || Category == '-Select-' || Category == '--Select Category--')) {
        text += "<br /> -Please Select Category. ";
        $("#category").attr('style', 'border:1px solid #d03100 !important;');
        $("#category").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#category").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#category").css({ "background-color": "#ffffff" });
    }
    if ((Tongue == '0' || Tongue == '-Select-' || Tongue == '--Select Mother Tongue--')) {
        text += "<br /> -Please Select mother tounge. ";
        $("#txtTongue").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTongue").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtTongue").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTongue").css({ "background-color": "#ffffff" });
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
        text += "<br /> -Please enter Road/street name in Present Address. ";
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

    //Education for diploma in agro polytechnique(agriculture and science)

    var BoardRollNo = $("#txtRollNoAgro");
    var BoardName = $("#txtBoardNameAgro");
    var txtExmntnName = $("#txtExmntnNameAgro");
    var txtPssngYr = $("#txtPssngYrAgro option:selected").text(); //DropDown
    var ddlPctgeCalclte = $("#ddlPctgeCalclteAgro option:selected").text();
    var txtTotalMarks = $("#txtTotalMarksAgro");
    var txtMarkSecure = $("#txtMarkSecureAgro");
    var txtPercentage = $("#txtPercentageAgro");

    //if (BoardRollNo != null && BoardRollNo.val() == '') {
    //    text += "<br /> -Please enter Roll no in Educational Qualification 10+2. ";
    //    $('#txtRollNoAgro').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#txtRollNoAgro').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtRollNoAgro').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#txtRollNoAgro').css({ "background-color": "#ffffff" });
    //}

    if (BoardName != null && BoardName.val() == '') {
        text += "<br /> -Please enter Name of the Board Examination Passed in Diploma Qualification in agriculture . ";
        $('#txtBoardNameAgro').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtBoardNameAgro').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBoardNameAgro').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtBoardNameAgro').css({ "background-color": "#ffffff" });
    }


    if (txtExmntnName != null && txtExmntnName.val() == '') {
        text += "<br /> -Please enter Name of the Examination Passed in Diploma Qualification in agriculture . ";
        $('#txtExmntnNameAgro').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtExmntnNameAgro').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtExmntnNameAgro').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtExmntnNameAgro').css({ "background-color": "#ffffff" });
    }
    var PssngYr = $("#txtPssngYrAgro option:selected").val();
    if (PssngYr != null && (PssngYr == '' || PssngYr == '0')) {
        text += "<br /> -Please select Year of Passing in  Diploma Qualification in agriculture .";
        $('#txtPssngYrAgro').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtPssngYrAgro').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPssngYrAgro').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtPssngYrAgro').css({ "background-color": "#ffffff" });
    }



    if (ddlPctgeCalclte != null && (ddlPctgeCalclte == '' || ddlPctgeCalclte == '-Select-')) {
        text += "<br /> -Please select Grade in Diploma Qualification in agriculture.";
        $('#ddlPctgeCalclteAgro').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPctgeCalclteAgro').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlPctgeCalclteAgro').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlPctgeCalclteAgro').css({ "background-color": "#ffffff" });
    }

    if (txtTotalMarks != null && txtTotalMarks.val() == '') {
        text += "<br /> -Please enter Total Marks in Diploma Qualification in agriculture";
        $('#txtTotalMarksAgro').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtTotalMarksAgro').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtTotalMarksAgro').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTotalMarksAgro').css({ "background-color": "#ffffff" });
    }

    if ($("#ddlPctgeCalclteAgro").val() != "501") {
        if (txtMarkSecure != null && txtMarkSecure.val() == '') {
            text += "<br /> -Please enter Marks Secured in Diploma Qualification in agriculture";
            $('#txtMarkSecureAgro').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMarkSecureAgro').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtMarkSecureAgro').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMarkSecureAgro').css({ "background-color": "#ffffff" });
        }

    } else {
        $('#txtMarkSecureAgro').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMarkSecureAgro').css({ "background-color": "#ffffff" });
    }

    //if (txtPercentage != null && txtPercentage.val() == '') {
    //    text += "<br /> -Please calculate the Percentage in Diploma Qualification in agriculture ";
    //    opt = 1;
    //} else {
    //}


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


function SubmitData() {

    if (!ValidateForm()) {
        return;
    }

    $("#btnSubmit").prop('disabled', true);

    var t_Message = "";
    var result = false;

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

    var MotherName = $("#MotherName").val();
    var MotherTongue = $("#txtTongue").val();

    var Religion = $("#religion option:selected").text();

    var Category = $("#category option:selected").text();
    var Nationality = $("#nationality option:selected").text();

    var ResidentType = $('#ddlResidence option:selected').text();

    var ResponseType = "C";

    var FormA_AppID = "";

    var qs9 = getQueryStrings();
    if (qs9["UID"] != null && qs9["AppID"] != null) {

        EditAppID = qs9["AppID"];
        FormA_AppID = EditAppID;
    }

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    //var myDate = new Date(parseInt(timestamp));
    //$.format.date(myDate.getTime(), "dd/mm/yyyy"));


    var DTDob = $('#DOB').val();
    var DTTrnsDate = $('#txtTransDate').val();

    var D1 = DTDob.split('/');
    var calday = D1[0];
    var calmon = D1[1];
    var calyear = D1[2];

    var D2 = DTTrnsDate.split('/');
    var calday2 = D2[0];
    var calmon2 = D2[1];
    var calyear2 = D2[2];

    //DTDob = calday.toString() + "/" + calmon.toString() + "/" + calyear;
    DTDob = calyear.toString() + "-" + calmon.toString() + "-" + calday.toString();
    DTTrnsDate = calyear2.toString() + "-" + calmon2.toString() + "-" + calday2.toString();

    

    var datavar = {
        'aadhaarNumber': $('#UID').val(),
        'FirstName': $('#FirstName').val(),
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
        'Nationality': Nationality,
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


        'AgroFormA_AppID': $('#txtAppID').val(),
        'EntranceRollNo': $('#txtRollNo').val(),
        'TransactionNo': $('#txtTransNo').val(),
        'Transactiondate': DTTrnsDate,
        'Discipline': $('#txtDiscipline').val(),
        'CandidateName': $('#FirstName').val(),
        'MotherName': $('#MotherName').val(),
        'FatherName': $('#FatherName').val(),
        'DOB': DTDob,
        'Gender': $('#ddlGender').val(),
        'Category': Category,
        'AltMobileNo': $('#phoneno').val(),
        'Email': $('#EmailID').val(),
        'MotherTongue': $('#txtTongue').val(),
        'Religion': Religion,
        'Nationality': Nationality,
        'ResponseType': ResponseType,
        'CitizenProfileID': ProfileID,

        'Image': $('#HFb64').val(),
        'ImageSign': $('#HFb64Sign').val(),

        'EduRollNo': $('#txtBoardRollNo').val(),
        'EduNameOfBoard': $('#txtBoardName').val(),
        'EduNameOfExamination': $('#txtExmntnName').val(),
        'EduPassingYear': $('#txtPssngYr option:selected').text(),//DropDown
        'EduGrade': $('#ddlPctgeCalclte').val(),
        'EduTotalMarks': $('#txtTotalMarks').val(),
        'EduMarkSecured': $('#txtMarkSecure').val(),
        'EduPercentage': $('#txtPercentage').val(),

        'Edu2RollNo': $('#txtBoardRollNo2').val(),
        'Edu2NameOfBoard': $('#txtBoardName2').val(),
        'Edu2NameOfExamination': $('#txtExmntnName2').val(),
        'Edu2PassingYear': $('#txtPssngYr2 option:selected').text(),//DropDown
        'Edu2Grade': $('#ddlPctgeCalclte2').val(),
        'Edu2TotalMarks': $('#txtTotalMarks2').val(),
        'Edu2MarkSecured': $('#txtMarkSecure2').val(),
        'Edu2Percentage': $('#txtPercentage2').val(),

        'Edu3RollNo': $('#txtRollNoAgro').val(),
        'Edu3NameOfBoard': $('#txtBoardNameAgro').val(),
        'Edu3NameOfExamination': $('#txtExmntnNameAgro').val(),
        'Edu3PassingYear': $('#txtPssngYrAgro option:selected').text(),//DropDown
        'Edu3Grade': $('#ddlPctgeCalclteAgro').val(),
        'Edu3TotalMarks': $('#txtTotalMarksAgro').val(),
        'Edu3MarkSecured': $('#txtMarkSecureAgro').val(),
        'Edu3Percentage': $('#txtPercentageAgro').val(),

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
            url: '/WebApp/Kiosk/OUAT/AgroFormB.aspx/InsertOUATAgroFormB',
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

        if (result /*&& jqXHRData_IMG_result*/) {
            $("#progressbar").hide();
            //alertPopup("Agro Polytechnic Form B", "Application saved successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
            //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=428&AppID=' + obj.AppID + '&FormA_AppID=' + FormA_AppID;
            window.location.href = '/WebApp/Kiosk/OUAT/OUATAgroFormBProcessBar.aspx?SvcID=428&AppID=' + obj.AppID + '&FormA_AppID=' + FormA_AppID;
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