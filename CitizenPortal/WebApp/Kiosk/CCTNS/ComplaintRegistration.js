$(document).ready(function () {

    $('#myModal').modal({
        backdrop: 'static',
        keyboard: false
    });

    var d = new Date();
    var strDate = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
    $("#txtComplaintDate").val(strDate);
    $("#txtComplaintDate").prop("disabled", true);

    var IdentificationType = "";
    $("#txtIdentificationNumber").attr("maxlength", "25");
    $("#btnverify").hide();
    $("#divPassPlace").hide();
    $("#divPassDate").hide();
    $("#txtAppUID").prop("disabled", false);
    $("#txtIdentificationNumber").prop("disabled", true);
    $('#ddlIdentificationType').change(function (e) {
        $("#txtIdentificationNumber").prop("disabled", false);
        IdentificationType = $('#ddlIdentificationType').val();
        $("#txtIdentificationNumber").val("");
        $("#txtPassportIssuePlace").val("");
        $("#txtPassportIssueDate").val("");
        //$("#txtAppUID").val("");
        if (IdentificationType == "1") {
            $("#txtIdentificationNumber").attr("maxlength", "25");
            $("#btnverify").hide();
            $("#divPassPlace").show();
            $("#divPassDate").show();
            $("#txtAppUID").prop("disabled", false);
        }
        else if (IdentificationType == "8") {
            var ApplicatantType = "";

            ApplicatantType = $('#ddlApplicantType').val();
            if (ApplicatantType == 1) {
                $("#btnverify").hide();
                $("#txtIdentificationNumber").val($("#txtAppUID").val());
            } else {
                $("#btnverify").show();
                $("#txtIdentificationNumber").val("");
            }

            $("#txtIdentificationNumber").attr("maxlength", "12");

            //$("#btnverify").show();
            $("#divPassPlace").hide();
            $("#divPassDate").hide();
            $("#ddlIdentificationType")
            $("#txtAppUID").prop("disabled", true);
        }
        else if (IdentificationType == "6") {
            $("#txtIdentificationNumber").attr("maxlength", "10");
            $("#btnverify").hide();
            $("#divPassPlace").hide();
            $("#divPassDate").hide();
            $("#txtAppUID").prop("disabled", false);
        }
        else {
            $("#txtIdentificationNumber").attr("maxlength", "25");
            $("#btnverify").hide();
            $("#divPassPlace").hide();
            $("#divPassDate").hide();
            $("#txtAppUID").prop("disabled", false);
        }
    });

    $("#txtIdentificationNumber").on("keyup", function () {
        this.value = this.value.toUpperCase();
        if ($('#ddlIdentificationType').val() == "8") {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        };
    }).change(function () {
        if ($('#ddlIdentificationType').val() == "8") {
            $("#txtAppUID").val($("#txtIdentificationNumber").val());

        };
    });

    $("#ddlCountry").val("80");
    $("#ddlCountry").change(function () {
        var val = this.value;
        if (val != "80") {
            $("#ddlState").val("0");
            $("#ddlDistrict").val("0");
            $("#ddlPS").val("0");
            $("#ddlState").prop("disabled", true);
            $("#ddlDistrict").prop("disabled", true);
            $("#ddlPS").prop("disabled", true);
        }
        else {
            $("#ddlState").prop("disabled", false);
            $("#ddlDistrict").prop("disabled", false);
            $("#ddlPS").prop("disabled", false);
        }
    });

    $("#ddlCCountry").val("80");
    $("#ddlCCountry").change(function () {
        var val = this.value;
        if (val != "80") {
            $("#ddlCState").val("0");
            $("#ddlCDistrict").val("0");
            $("#ddlCPS").val("0");
            $("#ddlCState").prop("disabled", true);
            $("#ddlCDistrict").prop("disabled", true);
            $("#ddlCPS").prop("disabled", true);
        } else {
            $("#ddlCState").prop("disabled", false);
            $("#ddlCDistrict").prop("disabled", false);
            $("#ddlCPS").prop("disabled", false);
        }
    });

    $("#ddlACountry").val("80");
    $("#ddlACountry").change(function () {
        var val = this.value;
        if (val != "80") {
            $("#ddlAState").val("0");
            $("#ddlADistrict").val("0");
            $("#ddlAPS").val("0");
            $("#ddlAState").prop("disabled", true);
            $("#ddlADistrict").prop("disabled", true);
            $("#ddlAPS").prop("disabled", true);
        }
        else {
            $("#ddlAState").prop("disabled", false);
            $("#ddlADistrict").prop("disabled", false);
            $("#ddlAPS").prop("disabled", false);
        }
    });

    $("#ddlCACountry").val("80");
    $("#ddlCACountry").change(function () {
        var val = this.value;
        if (val != "80") {
            $("#ddlCAState").val("0");
            $("#ddlCADistrict").val("0");
            $("#ddlCAPS").val("0");
            $("#ddlCAState").prop("disabled", true);
            $("#ddlCADistrict").prop("disabled", true);
            $("#ddlCAPS").prop("disabled", true);
        } else {
            $("#ddlCAState").prop("disabled", false);
            $("#ddlCADistrict").prop("disabled", false);
            $("#ddlCAPS").prop("disabled", false);
        }
    });


    GetState();
    $("#ddlState").change(function () {
        GetDistrict('#ddlState', '#ddlDistrict');
        GetDistrict('#ddlState', '#ddlCSDDis');
    });
    $("#ddlCState").change(function () {
        GetDistrict('#ddlCState', '#ddlCDistrict');
    });

    $("#ddlDistrict").change(function () {
        GetPS('#ddlState', '#ddlDistrict', '#ddlPS');
    });
    $("#ddlCDistrict").change(function () {
        GetPS('#ddlCState', '#ddlCDistrict', '#ddlCPS');
    });
    $("#ddlCSDDis").change(function () {
        GetPS('#ddlState', '#ddlCSDDis', '#ddlCSDPs');
        GetOffice('#ddlState', '#ddlCSDDis', '#ddlCSDOffN');
    });

    $("#ddlAState").change(function () {
        GetDistrict('#ddlAState', '#ddlADistrict');
    });
    $("#ddlCAState").change(function () {
        GetDistrict('#ddlCAState', '#ddlCADistrict');
    });

    $("#ddlADistrict").change(function () {
        GetPS('#ddlAState', '#ddlADistrict', '#ddlAPS');
    });
    $("#ddlCADistrict").change(function () {
        GetPS('#ddlCAState', '#ddlCADistrict', '#ddlCAPS');
    });


    CalAgeByYear();
    $("#txtAge").change(function () {
        CalAgeRange(this.value);
    });

    isSameAddress();
    isASameAddress();

    $('input[type=radio][name=radio4]').change(function () {
        if (this.value == 'Y') {
            $("#trIncDate").show();
        }
        else if (this.value == 'N') {
            $("#trIncDate").hide();
        }
    });

    $("#trrdoDis").hide();
    $("#trCSDDis").show();
    $("#trPS").show();
    $("#trOffN").hide();
    $('input[type=radio][name=rdoPS]').change(function () {
        if (this.value == 'Y') {
            $("#trrdoDis").hide();
            $("#trCSDDis").show();
            $("#trPS").show();
            $("#trOffN").hide();
        }
        else if (this.value == 'N') {
            $("#trrdoDis").show();
            $("#trCSDDis").show();
            $("#trPS").hide();
            $("#trOffN").show();
        }
    });
    $('input[type=radio][name=rdoDis]').change(function () {
        if (this.value == 'Y') {
            $("#trrdoDis").show();
            $("#trCSDDis").show();
            $("#trPS").hide();
            $("#trOffN").show();
        }
        else if (this.value == 'N') {
            $("#trrdoDis").show();
            $("#trCSDDis").hide();
            $("#trPS").hide();
            $("#trOffN").show();
            GetOffice('#ddlState', '#ddlCSDDis', '#ddlCSDOffN');
        }
    });

    $('#btnverify').click(function () {
        var text = "";
        var opt = 0;
        var IdentificationNumber = "";
        var IdentificationType = $("#ddlIdentificationType").val(); if (IdentificationType == 0) { text += "<br /> -Please Select Identification Type."; $("#ddlIdentificationType").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlIdentificationType").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlIdentificationType").attr('style', '1px solid #cdcdcd !important;'); $("#ddlIdentificationType").css({ "background-color": "#ffffff" }); }
        if (IdentificationType == "8") {
            IdentificationNumber = $("#txtIdentificationNumber").val(); if (IdentificationNumber == "" || IdentificationNumber == null) { text += "<br /> -Please Select Identification Number."; $("#txtIdentificationNumber").attr('style', 'border:1px solid #d03100 !important;'); $("#txtIdentificationNumber").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtIdentificationNumber").attr('style', '1px solid #cdcdcd !important;'); $("#txtIdentificationNumber").css({ "background-color": "#ffffff" }); }
        }
        if (opt == 1) { alert(text); return false; }
        if (opt == 0 && IdentificationType == "8") {
            openWindow(1, 2, 'UIDComplaintReg');
            return true;
        }
    });
    window.CallParent = function () {
        //alert("Aadhaar Verification Successfull");
        BindAadhaarData();
    }
});

function submitApplicantType(e) {
    var text = "";
    var ApplicatantType = $('#ddlApplicantType').val(); if (ApplicatantType == "0") { text += "Please Select Applicatant Type. "; };
    if (text != "") {
        $("#ddlApplicantType").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlApplicantType").css({ "background-color": "#fff2ee" });
        $("#errorMsg").show();
        $("#errorMsg").val(text);
    } else {
        $("#ddlApplicantType").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlApplicantType").css({ "background-color": "#ffffff" });
        if (ApplicatantType == "1") {
            var qs = getQueryStrings();
            GetDatalocalAdhar(qs["UID"]);
        }
        $('#myModal').modal('hide');
    }
}
function openWindow(UIDVal, value, SessionName) {
    if (true) {
        var UID = $("#txtIdentificationNumber").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);
        window.open('/UID/Default.aspx?SvcID=431&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
        ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        window.focus();
    }
    return false;
}


function GetState() {

    var SelState = $('#ddlState');
    var SelState1 = $('#ddlCState');
    var SelAState = $('#ddlAState');
    var SelAState1 = $('#ddlCAState');
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ComplaintRegistration.aspx/GetState",
        data: '{}',
        dataType: "json",
        success: function (r) {
            SelState.empty().append('<option selected="selected" value="0">-Select-</option>');
            SelState1.empty().append('<option selected="selected" value="0">-Select-</option>');
            SelAState.empty().append('<option selected="selected" value="0">-Select-</option>');
            SelAState1.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each($.parseJSON(r.d), function () {
                //alert(this.Id);
                $(SelState).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelState1).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelAState).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelAState1).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetDistrict(ddlstate, ddlDistict) {
    var SelState = $(ddlstate).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ComplaintRegistration.aspx/GetDistrict",
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlDistict);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlDistict).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetPS(ddlstate, ddlDistict, ddlPS) {
    var SelState = $(ddlstate).val();
    var SelDis = $(ddlDistict).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ComplaintRegistration.aspx/GetPoliceStation",
        data: '{"prefix":"","StateID":"' + SelState + '",  "DisID":"' + SelDis + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlPS);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlPS).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetOffice(ddlstate, ddlDistict, ddlOffice) {
    var SelState = $(ddlstate).val();
    var SelDis = $(ddlDistict).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ComplaintRegistration.aspx/GetOffice",
        data: '{"prefix":"","StateID":"' + SelState + '",  "DisID":"' + SelDis + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlOffice);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlOffice).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function isSameAddress() {
    $('#chkAddress').change(function () {
        if ($(this).is(":checked")) {

            $("#txtCAddressLine1").val($("#txtAddressLine1").val());
            $('#txtCAddressLine1').prop("disabled", true);

            $("#txtCAddressLine2").val($("#txtAddressLine2").val());
            $('#txtCAddressLine2').prop("disabled", true);

            $("#txtCLocality").val($("#txtLocality").val());
            $('#txtCLocality').prop("disabled", true);

            $("#txtCRoadStreetName").val($("#txtRoadStreetName").val());
            $('#txtCRoadStreetName').prop("disabled", true);

            $("#ddlCCountry").val($("#ddlCountry").val());
            if ($("#ddlCountry").val() == "0") {
                $("#txtCCountry").val("");
            }
            else {
                $("#txtCCountry").val($("#ddlCountry option:selected").text());
            }
            $("#txtCCountry").show();
            $("#ddlCCountry").hide();
            $('#txtCCountry').prop("disabled", true);

            $("#ddlCState").val($("#ddlState").val());
            if ($("#ddlState").val() == "0") {
                $("#txtCState").val("");
            }
            else {
                $("#txtCState").val($("#ddlState option:selected").text());
            }
            $("#txtCState").show();
            $("#ddlCState").hide();
            $('#txtCState').prop("disabled", true);

            $("#ddlCDistrict").val($("#ddlDistrict").val());
            if ($("#ddlDistrict").val() == "0") {
                $("#txtCDistrict").val("");
            }
            else {
                $("#txtCDistrict").val($("#ddlDistrict option:selected").text());
            }
            $("#txtCDistrict").show();
            $("#ddlCDistrict").hide();
            $('#txtCDistrict').prop("disabled", true);

            $("#ddlCPS").val($("#ddlPS").val());
            if ($("#ddlPS").val() == "0") {
                $("#txtCPS").val("");
            }
            else {
                $("#txtCPS").val($("#ddlPS option:selected").text());
            }
            $("#txtCPS").show();
            $("#ddlCPS").hide();
            $('#txtCPS').prop("disabled", true);

            $("#txtCTaluka").val($("#txtTaluka").val());
            $('#txtCTaluka').prop("disabled", true);

            $("#txtCVillage").val($("#txtVillage").val());
            $('#txtCVillage').prop("disabled", true);

            $("#txtCPGPULB").val($("#txtPGPULB").val());
            $('#txtCPGPULB').prop("disabled", true);

            $("#txtCPPoliceStation").val($("#txtPoliceStation").val());
            $('#txtCPPoliceStation').prop("disabled", true);

            $("#txtCPPostOffice").val($("#txtPostOffice").val());
            $('#txtCPPostOffice').prop("disabled", true);

            $("#txtCPPinCode").val($("#txtPinCode").val());
            $('#txtCPPinCode').prop("disabled", true);

        } else {

            $("#txtCAddressLine1").val("");
            $('#txtCAddressLine1').prop("disabled", false);

            $("#txtCAddressLine2").val("");
            $('#txtCAddressLine2').prop("disabled", false);

            $("#txtCLocality").val("");
            $('#txtCLocality').prop("disabled", false);

            $("#txtCRoadStreetName").val("");
            $('#txtCRoadStreetName').prop("disabled", false);

            $("#ddlCCountry").val("80");
            $('#ddlCCountry').prop("disabled", false);
            $("#txtCCountry").hide();
            $("#ddlCCountry").show();


            $("#ddlCState").val("0");
            $('#ddlCState').prop("disabled", false);
            $("#txtCState").hide();
            $("#ddlCState").show();


            $("#ddlCDistrict").val("0");
            $('#ddlCDistrict').prop("disabled", false);
            $("#txtCDistrict").hide();
            $("#ddlCDistrict").show();


            $("#ddlCPS").val("0");
            $('#ddlCPS').prop("disabled", false);
            $("#txtCPS").hide();
            $("#ddlCPS").show();

            $("#txtCTaluka").val("");
            $('#txtCTaluka').prop("disabled", false);

            $("#txtCVillage").val("");
            $('#txtCVillage').prop("disabled", false);

            $("#txtCPPinCode").val("");
            $('#txtCPPinCode').prop("disabled", false);

        };

    });
}
function isASameAddress() {
    $('#chkAAddress').change(function () {
        if ($(this).is(":checked")) {

            $("#txtCAAddressLine1").val($("#txtAAddressLine1").val());
            $('#txtCAAddressLine1').prop("disabled", true);

            $("#txtCAAddressLine2").val($("#txtAAddressLine2").val());
            $('#txtCAAddressLine2').prop("disabled", true);

            $("#txtCALocality").val($("#txtALocality").val());
            $('#txtCALocality').prop("disabled", true);

            $("#txtCARoadStreetName").val($("#txtARoadStreetName").val());
            $('#txtCARoadStreetName').prop("disabled", true);

            $("#ddlCACountry").val($("#ddlACountry").val());
            if ($("#ddlCountry").val() == "0") {
                $("#txtCCountry").val("");
            }
            else {
                $("#txtCACountry").val($("#ddlACountry option:selected").text());
            }
            $("#txtCACountry").show();
            $("#ddlCACountry").hide();
            $('#txtCACountry').prop("disabled", true);

            $("#ddlCAState").val($("#ddlAState").val());
            if ($("#ddlAState").val() == "0") {
                $("#txtCAState").val("");
            }
            else {
                $("#txtCAState").val($("#ddlAState option:selected").text());
            }
            $("#txtCAState").show();
            $("#ddlCAState").hide();
            $('#txtCAState').prop("disabled", true);

            $("#ddlCADistrict").val($("#ddlADistrict").val());
            if ($("#ddlADistrict").val() == "0") {
                $("#txtCADistrict").val("");
            }
            else {
                $("#txtCADistrict").val($("#ddlADistrict option:selected").text());
            }
            $("#txtCADistrict").show();
            $("#ddlCADistrict").hide();
            $('#txtCADistrict').prop("disabled", true);

            $("#ddlCAPS").val($("#ddlAPS").val());
            if ($("#ddlAPS").val() == "0") {
                $("#txtCAPS").val("");
            }
            else {
                $("#txtCAPS").val($("#ddlAPS option:selected").text());
            }
            $("#txtCAPS").show();
            $("#ddlCAPS").hide();
            $('#txtCAPS').prop("disabled", true);

            $("#txtCATaluka").val($("#txtATaluka").val());
            $('#txtCATaluka').prop("disabled", true);

            $("#txtCAVillage").val($("#txtAVillage").val());
            $('#txtCAVillage').prop("disabled", true);

            $("#txtCAPGPULB").val($("#txtAPGPULB").val());
            $('#txtCAPGPULB').prop("disabled", true);

            $("#txtCAPPoliceStation").val($("#txtAPoliceStation").val());
            $('#txtCAPPoliceStation').prop("disabled", true);

            $("#txtCAPPostOffice").val($("#txtAPostOffice").val());
            $('#txtCAPPostOffice').prop("disabled", true);

            $("#txtCAPPinCode").val($("#txtAPinCode").val());
            $('#txtCAPPinCode').prop("disabled", true);

        } else {

            $("#txtCAAddressLine1").val("");
            $('#txtCAAddressLine1').prop("disabled", false);

            $("#txtCAAddressLine2").val("");
            $('#txtCAAddressLine2').prop("disabled", false);

            $("#txtCALocality").val("");
            $('#txtCALocality').prop("disabled", false);

            $("#txtCARoadStreetName").val("");
            $('#txtCARoadStreetName').prop("disabled", false);

            $("#ddlCACountry").val("80");
            $('#ddlCACountry').prop("disabled", false);
            $("#txtCACountry").hide();
            $("#ddlCACountry").show();


            $("#ddlCAState").val("0");
            $('#ddlCAState').prop("disabled", false);
            $("#txtCAState").hide();
            $("#ddlCAState").show();


            $("#ddlCADistrict").val("0");
            $('#ddlCADistrict').prop("disabled", false);
            $("#txtCADistrict").hide();
            $("#ddlCADistrict").show();


            $("#ddlCAPS").val("0");
            $('#ddlCAPS').prop("disabled", false);
            $("#txtCAPS").hide();
            $("#ddlCAPS").show();

            $("#txtCATaluka").val("");
            $('#txtCATaluka').prop("disabled", false);

            $("#txtCAVillage").val("");
            $('#txtCAVillage').prop("disabled", false);

            $("#txtCAPPinCode").val("");
            $('#txtCAPPinCode').prop("disabled", false);

        };

    });
}


// Start retrive local aadhar data
function GetDatalocalAdhar(uid) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ResidenceCertificate.aspx/GetDetailAdhaar",
        data: "{ UID: '" + uid + "'}",
        dataType: "json",
        success: function (r) {
            var Element = $('#ddlApplicantType').val();
            var obj = JSON.parse(r.d);
            console.log(obj[0]);



            if (obj[0]["PROFILEID"] != "" && obj[0]["PROFILEID"] != null) {
                $('#txtAppUID').val(obj[0]["PROFILEID"]);
                $('#txtIdentificationNumber').val(obj[0]["PROFILEID"]);
                $('#txtAppUID').prop("disabled", true);
                $('#ddlIdentificationType').val("8");
            }

            if (obj[0]["APPLICENT_F_NAME"] != "" && obj[0]["APPLICENT_F_NAME"] != null) {
                $('#txtFirstName').val(obj[0]["APPLICENT_F_NAME"]);
                $('#txtFirstName').prop("disabled", true);
            }
            if (obj[0]["APPLICENT_M_NAME"] != "" && obj[0]["APPLICENT_M_NAME"] != null) {
                $('#txtMiddleName').val(obj[0]["APPLICENT_M_NAME"]);
                $('#txtMiddleName').prop("disabled", true);
            }
            if (obj[0]["APPLICENT_L_NAME"] != "" && obj[0]["APPLICENT_L_NAME"] != null) {
                $('#txtLastName').val(obj[0]["APPLICENT_L_NAME"]);
                $('#txtLastName').prop("disabled", true);
            }

            if (obj[0]["FATHER_F_NAME"] != "" && obj[0]["FATHER_F_NAME"] != null) {
                $('#txtFatherFName').val(obj[0]["FATHER_F_NAME"]);
                $('#txtFatherFName').prop("disabled", true);
            }
            if (obj[0]["FATHER_M_NAME"] != "" && obj[0]["FATHER_M_NAME"] != null) {
                $('#txtFatherMName').val(obj[0]["FATHER_M_NAME"]);
                $('#txtFatherMName').prop("disabled", true);
            }
            if (obj[0]["FATHER_L_NAME"] != "" && obj[0]["FATHER_L_NAME"] != null) {
                $('#txtFatherLName').val(obj[0]["FATHER_L_NAME"]);
                $('#txtFatherLName').prop("disabled", true);
            }

            if (obj[0]["MOTHER_F_NAME"] != "" && obj[0]["MOTHER_F_NAME"] != null) {
                $('#txtMotherFName').val(obj[0]["MOTHER_F_NAME"]);
                $('#txtMotherFName').prop("disabled", true);
            }
            if (obj[0]["MOTHER_M_NAME"] != "" && obj[0]["MOTHER_M_NAME"] != null) {
                $('#txtMotherMName').val(obj[0]["MOTHER_M_NAME"]);
                $('#txtMotherMName').prop("disabled", true);
            }
            if (obj[0]["MOTHER_L_NAME"] != "" && obj[0]["MOTHER_L_NAME"] != null) {
                $('#txtMotherLName').val(obj[0]["MOTHER_L_NAME"]);
                $('#txtMotherLName').prop("disabled", true);
            }

            //if (obj[0]["APPLICENT_DOB"] != "0" && obj[0]["APPLICENT_DOB"] != null) {
            //    $('#txtDOB').val(obj[0]["APPLICENT_DOB"]);
            //    $('#txtDOB').prop("disabled", true);
            //}

            if (obj[0]["APPLICENT_DOB"] != "0" && obj[0]["APPLICENT_DOB"] != null) {
                $('#txtDOB').val(obj[0]["APPLICENT_DOB"]);
                $('#txtDOB').prop("disabled", true);

                var dob = new Date(obj[0]["APPLICENT_DOB"]);
                var today = new Date();
                var age = Math.floor((today - dob) / (365 * 24 * 60 * 60 * 1000)); //new Date(today - dob).getFullYear() - 1970;  //
                //$('#txtAge').val(age);

                if (age != "" && age != null && age != 0) {
                    $('#txtAge').val(age)
                    $('#txtAge').prop("disabled", true)
                }
                var selectedYear = dob.getFullYear();
                $("#txtDOBYear").val(selectedYear);
                CalAgeRange(age);
            };


            if (obj[0]["APPLICENT_AGE"] != "" && obj[0]["APPLICENT_AGE"] != null) {
                $('#txtAge').val(obj[0]["APPLICENT_AGE"]);
                $('#txtAge').prop("disabled", true);
            }

            if (obj[0]["APPLICENT_GENDER"] != "") {
                if (obj[0]["APPLICENT_GENDER"] == "M") {
                    $('#ddlGender').val("M");
                }
                else if (obj[0]["APPLICENT_GENDER"] == "F") {
                    $('#ddlGender').val("F");
                }
                else {
                    $('#ddlGender').val("T");
                }
                $('#ddlGender').prop("disabled", true);
            }
            if (obj[0]["APPLICENT_MARITAL"] != "") {
                if (obj[0]["APPLICENT_MARITAL"] == "1") {
                    $('#ddlMaritalStatus').val("1");
                }
                else if (obj[0]["APPLICENT_MARITAL"] == "2") {
                    $('#ddlMaritalStatus').val("2");
                }
                else if (obj[0]["APPLICENT_MARITAL"] == "3") {
                    $('#ddlMaritalStatus').val("3");
                }
                else if (obj[0]["APPLICENT_MARITAL"] == "4") {
                    $('#ddlMaritalStatus').val("4");
                }
                else {
                    $('#ddlMaritalStatus').val("5");
                }
                $('#ddlMaritalStatus').prop("disabled", true);
            }

            if (obj[0]["APPLICENT_EMAIL"] != "" && obj[0]["APPLICENT_EMAIL"] != null) {
                $('#txtEmailID').val(obj[0]["APPLICENT_EMAIL"]);
                $('#txtEmailID').prop("disabled", true);
            }
            if (obj[0]["APPLICENT_MOBILE"] != "" && obj[0]["APPLICENT_MOBILE"] != null) {
                $('#txtMobileNo').val(obj[0]["APPLICENT_MOBILE"]);
                $('#txtMobileNo').prop("disabled", true);
            }
            if (obj[0]["APPLICENT_STDCODE"] != "" && obj[0]["APPLICENT_STDCODE"] != "0" && obj[0]["APPLICENT_STDCODE"] != null) {
                $('#txtStdCode').val(obj[0]["APPLICENT_STDCODE"]);
                $('#txtStdCode').prop("disabled", true);
            }
            if (obj[0]["APPLICENT_PHONE"] != "" && obj[0]["APPLICENT_PHONE"] != null) {
                $('#txtPhone').val(obj[0]["APPLICENT_PHONE"]);
                $('#txtPhone').prop("disabled", true);
            }

            BindLocalDataAddress(obj[0]);
        }
    });
}
function BindLocalDataAddress(obj) {
    //parmanent Address:
    if (obj["APPLICENT_ADD1"] != "" && obj["APPLICENT_ADD1"] != null) {
        $('#txtAddressLine1').val(obj["APPLICENT_ADD1"]);
        $('#txtAddressLine1').prop("disabled", true);
    }
    if (obj["APPLICENT_ADD2"] != "" && obj["APPLICENT_ADD2"] != null) {
        $('#txtAddressLine2').val(obj["APPLICENT_ADD2"]);
        $('#txtAddressLine2').prop("disabled", true);
    }
    //if (obj["PLANDMARK"] != "" && obj["PLANDMARK"] != null) {
    //    $('#txtLandMark').val(obj["PLANDMARK"])
    //    $('#txtLandMark').prop("disabled", true)
    //}
    if (obj["APPLICENT_ROAD"] != "" && obj["APPLICENT_ROAD"] != null) {
        $('#txtRoadStreetName').val(obj["APPLICENT_ROAD"]);
        $('#txtRoadStreetName').prop("disabled", true);
    }
    //if (obj["PLOCALITY"] != "" && obj["PLOCALITY"] != null) {
    //    $('#txtLocality').val(obj["PLOCALITY"])
    //    $('#txtLocality').prop("disabled", true)
    //}

    //if (obj["P_D_NAME"] != "" && obj["P_D_NAME"] != null && obj["P_BT_NAME"] != "" && obj["P_BT_NAME"] != null && obj["P_S_NAME"] != "" && obj["P_S_NAME"] != null) {
    //    $('#txtState').show();
    //    $('#txtState').val(obj["P_S_NAME"])
    //    $('#txtState').prop("disabled", true);
    //    $('#ddlState').hide();
    //}
    //else {
    //    $('#ddlState').show();
    //}


    if (obj["P_D_CODE"] != "0" && obj["P_SD_CODE"] != "0") {
        $("#ddlDistrict").val(obj["P_D_CODE"]);
        $("#ddlDistrict").prop("disabled", true);
        //$('#txtDistrict').show();
        //$('#txtDistrict').val(obj["P_D_NAME"])
        //$('#txtDistrict').prop("disabled", true);
        //$('#ddlDistrict').hide();
    }
    //else {
    //    $('#ddlDistrict').show();
    //}

    if (obj["P_D_CODE"] != "0" && obj["P_SD_CODE"] != "0") {
        $('#ddlSubdivision').val(obj["P_SD_CODE"]);
        $("#ddlSubdivision").prop("disabled", true);
        //$('#txtBlock').show();
        //$('#txtBlock').val(obj["P_BT_NAME"])
        //$('#txtBlock').prop("disabled", true);
        //$('#ddlBlockTaluka').hide();
    }
    //else {
    //    $('#ddlBlockTaluka').show();
    //}
    //if (obj["P_PVC_NAME"] != "" && obj["P_PVC_NAME"] != null) {
    //    $('#txtPanchayat').show();
    //    $('#txtPanchayat').val(obj["P_PVC_NAME"])
    //    $('#txtPanchayat').prop("disabled", true);
    //    $('#ddlPanchayatVillageCity').hide();
    //}
    //else {
    //    $('#ddlPanchayatVillageCity').show();
    //}
    if (obj["APPLICENT_PINCODE"] != "" && obj["APPLICENT_PINCODE"] != null) {
        $('#txtPinCode').val(obj["APPLICENT_PINCODE"]);
        $('#txtPinCode').prop("disabled", true);
    }


    // Present Address
    if (obj["APPLICENT_CADD1"] != "" && obj["APPLICENT_CADD1"] != null) {
        $('#txtCAddressLine1').val(obj["APPLICENT_CADD1"]);
        $('#txtCAddressLine1').prop("disabled", true);
    }
    if (obj["APPLICENT_CADD2"] != "" && obj["APPLICENT_CADD2"] != null) {
        $('#txtCAddressLine2').val(obj["APPLICENT_CADD2"]);
        $('#txtCAddressLine2').prop("disabled", true);
    }
    //if (obj["PLANDMARK"] != "" && obj["PLANDMARK"] != null) {
    //    $('#txtLandMark').val(obj["PLANDMARK"])
    //    $('#txtLandMark').prop("disabled", true)
    //}
    if (obj["APPLICENT_CROAD"] != "" && obj["APPLICENT_CROAD"] != null) {
        $('#txtCRoadStreetName').val(obj["APPLICENT_CROAD"]);
        $('#txtCRoadStreetName').prop("disabled", true);
    }
    //if (obj["PLOCALITY"] != "" && obj["PLOCALITY"] != null) {
    //    $('#txtLocality').val(obj["PLOCALITY"])
    //    $('#txtLocality').prop("disabled", true)
    //}

    //if (obj["P_D_NAME"] != "" && obj["P_D_NAME"] != null && obj["P_BT_NAME"] != "" && obj["P_BT_NAME"] != null && obj["P_S_NAME"] != "" && obj["P_S_NAME"] != null) {
    //    $('#txtState').show();
    //    $('#txtState').val(obj["P_S_NAME"])
    //    $('#txtState').prop("disabled", true);
    //    $('#ddlState').hide();
    //}
    //else {
    //    $('#ddlState').show();
    //}


    if (obj["C_D_CODE"] != "0" && obj["C_SD_CODE"] != "0") {
        $("#ddlCDistrict").val(obj["C_D_CODE"]);
        $("#ddlCDistrict").prop("disabled", true);
        //$('#txtDistrict').show();
        //$('#txtDistrict').val(obj["P_D_NAME"])
        //$('#txtDistrict').prop("disabled", true);
        //$('#ddlDistrict').hide();
    }
    //else {
    //    $('#ddlDistrict').show();
    //}

    if (obj["C_D_CODE"] != "0" && obj["C_SD_CODE"] != "0") {
        $('#ddlCSubdivision').val(obj["C_SD_CODE"]);
        $("#ddlCSubdivision").prop("disabled", true);
        //$('#txtBlock').show();
        //$('#txtBlock').val(obj["P_BT_NAME"])
        //$('#txtBlock').prop("disabled", true);
        //$('#ddlBlockTaluka').hide();
    }
    //else {
    //    $('#ddlBlockTaluka').show();
    //}
    //if (obj["P_PVC_NAME"] != "" && obj["P_PVC_NAME"] != null) {
    //    $('#txtPanchayat').show();
    //    $('#txtPanchayat').val(obj["P_PVC_NAME"])
    //    $('#txtPanchayat').prop("disabled", true);
    //    $('#ddlPanchayatVillageCity').hide();
    //}
    //else {
    //    $('#ddlPanchayatVillageCity').show();
    //}
    if (obj["APPLICENT_CPINCODE"] != "" && obj["APPLICENT_CPINCODE"] != null) {
        $('#txtCPPinCode').val(obj["APPLICENT_CPINCODE"]);
        $('#txtCPPinCode').prop("disabled", true);
    }


}
// End retrive local aadhar data

// Start retrive Verified Aadhar Data
function BindAadhaarData() {
    if ($('#HFUIDData').val() != "" && $('#HFUIDData').val() != null) {
        var obj = jQuery.parseJSON($('#HFUIDData').val());

        console.log(obj);

        if (obj["residentName"] != "" && obj["residentName"] != null) {
            $('#txtFirstName').val(obj["residentName"].split(" ")[0])
            $('#txtFirstName').prop("disabled", true)
        }
        if (obj["residentName"] != "" && obj["residentName"] != null) {
            $('#txtMiddleName').val(obj["residentName"].split(" ")[1])
            $('#txtMiddleName').prop("disabled", true)
        }
        if (obj["residentName"] != "" && obj["residentName"] != null) {
            $('#txtLastName').val(obj["residentName"].split(" ")[2])
            $('#txtLastName').prop("disabled", true)
        }

        var careOf = obj["careOf"].replace("S/O ", "");
        if (careOf != "" && careOf != null) {
            $('#txtFatherFName').val(careOf.split(" ")[0])
            $('#txtFatherFName').prop("disabled", true)
        }
        if (careOf != "" && careOf != null) {
            $('#txtFatherMName').val(careOf.split(" ")[1])
            $('#txtFatherMName').prop("disabled", true)
        }
        if (careOf != "" && careOf != null) {
            $('#txtFatherLName').val(careOf.split(" ")[2])
            $('#txtFatherLName').prop("disabled", true)
        }

        if (obj["MotherName"] != "" && obj["MotherName"] != null) {
            $('#txtMotherFName').val(obj["MotherName"])
            $('#txtMotherFName').prop("disabled", true)
        }
        //if (obj["MOTHER_M_NAME"] != "" && obj["MOTHER_M_NAME"] != null) {
        //    $('#txtMotherMName').val(obj["MOTHER_M_NAME"])
        //    $('#txtMotherMName').prop("disabled", true)
        //}
        //if (obj["MOTHER_L_NAME"] != "" && obj["MOTHER_L_NAME"] != null) {
        //    $('#txtMotherLName').val(obj["MOTHER_L_NAME"])
        //    $('#txtMotherLName').prop("disabled", true)
        //}


        if (obj["dateOfBirth"] != "0" && obj["dateOfBirth"] != null) {
            $('#txtDOB').val(obj["dateOfBirth"])
            $('#txtDOB').prop("disabled", true)

            var dob = new Date(obj["dateOfBirth"]);
            var today = new Date();
            var age = Math.floor((today - dob) / (365 * 24 * 60 * 60 * 1000)); //new Date(today - dob).getFullYear() - 1970;  //
            //$('#txtAge').val(age);

            if (age != "" && age != null && age != 0) {
                $('#txtAge').val(age)
                $('#txtAge').prop("disabled", true)
            }
            var selectedYear = dob.getFullYear();
            $("#txtDOBYear").val(selectedYear);
            CalAgeRange(age);
        }


        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
            }
            else {
                $('#ddlGender').val("T");
            }
            $('#ddlGender').prop("disabled", true);
        }

        //if (obj["APPLICENT_MARITAL"] != "") {
        //    if (obj["APPLICENT_MARITAL"] == "1") {
        //        $('#ddlMaritalStatus').val("1");
        //    }
        //    else if (obj["APPLICENT_MARITAL"] == "2") {
        //        $('#ddlMaritalStatus').val("2");
        //    }
        //    else if (obj["APPLICENT_MARITAL"] == "3") {
        //        $('#ddlMaritalStatus').val("3");
        //    }
        //    else if (obj["APPLICENT_MARITAL"] == "4") {
        //        $('#ddlMaritalStatus').val("4");
        //    }
        //    else {
        //        $('#ddlMaritalStatus').val("5");
        //    }
        //    $('#ddlMaritalStatus').prop("disabled", true);
        //}


        if (obj["emailId"] != "" && obj["emailId"] != null) {
            $('#txtEmailID').val(obj["emailId"])
            $('#txtEmailID').prop("disabled", true)
        }
        if (obj["phone"] != "" && obj["phone"] != null) {
            $('#txtPhone').val(obj["phone"])
            $('#txtPhone').prop("disabled", true)
        }

        BindAadharAddress(obj);
    }
}
function BindAadharAddress(obj) {
    //parmanent Address:
    if (obj["careOf"] != "" && obj["careOf"] != null) {
        $('#txtAddressLine1').val(obj["careOf"])
        $('#txtAddressLine1').prop("disabled", true)
    }
    if (obj["houseNumber"] != "" && obj["houseNumber"] != null) {
        $('#txtAddressLine2').val(obj["houseNumber"])
        $('#txtAddressLine2').prop("disabled", true)
    }

    if (obj["street"] != "" && obj["street"] != null) {
        $('#txtRoadStreetName').val(obj["street"])
        $('#txtRoadStreetName').prop("disabled", true)
    }

    if (obj["pincode"] != "" && obj["pincode"] != null) {
        $('#txtPinCode').val(obj["pincode"])
        $('#txtPinCode').prop("disabled", true)
    }
}
// End retrive Verified Aadhar Data



function fnNext(e) {
    if (!VerifyForm()) {
        return;
    }
    var text = "", tDis = "", tSubDis = "", LDis = "", LSubDis = "";
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var vDistrictName = "";
    var vTalukaName = "";


    var ApplicantType = "";
    var IdentificationType = "";
    var IdentificationNumber = "";
    var ApplicantName = "";
    //var RelationType = "";
    if ($('#ddlApplicantType').val() == 1) {
        ApplicantType = "Self";
        IdentificationType = "1";
        IdentificationNumber = uid;
        ApplicantName = $("#txtFirstName").val() + " " + $("#txtMiddleName").val() + " " + $("#txtLastName").val();
        //RelationType = "Self";

    } else {
        ApplicantType = "Other";
        IdentificationType = $("#ddlIdentificationType").val();
        IdentificationNumber = $("#txtIdentificationNumber").val();
        ApplicantName = $("#txtApplicantName").val();
        //RelationType = $("#txtRelationType").val();
    };


    var ApplicantCountry = $("#ddlNationality").val();
    var PassPortDate = $("#txtPassportIssueDate").val();
    var PassPortPlace = $("#txtPassportIssuePlace").val();

    var UID = $("#txtAppUID").val();
    var FirstName = $("#txtFirstName").val();
    var MiddleName = $("#txtMiddleName").val();
    var LastName = $("#txtLastName").val();
    var Gender = $("#ddlGender").val();
    var DOB = $("#txtDOB").val();
    var DOBY = $("#txtDOBYear").val();
    var Age = $("#txtAge").val();
    var AgeRFrom = $("#txtAgeFrom").val();
    var AgeRTo = $("#txtAgeTo").val();
    var EmailID = $("#txtEmailID").val();
    var MobileNo = $("#txtMobileNo").val();
    var StdCode = $("#txtStdCode").val();
    var PhoneNo = $("#txtPhone").val();
    var RelativeType = $("#ddlRelativeType").val();
    var RelativeName = $("#txtRelativeName").val();
    var ComplaintNature = $("#ddlComplaintNature").val();

    var PCareOf = $("#txtAddressLine1").val();
    var PHouseNo = $("#txtAddressLine2").val();
    var Pstreet = $("#txtRoadStreetName").val();
    var Parea = $("#txtLocality").val();
    var Pcountry = $("#ddlCountry").val();
    var Pstate = $("#ddlState").val();
    var Pdist = $("#ddlDistrict").val();
    var PPoliceS = $("#ddlPS").val();
    var Pblock = $("#txtTaluka").val();
    var Ppanchayat = $("#txtVillage").val();
    var Ppincode = $("#txtPinCode").val();

    var isSameAddr = "";
    isckecked = $("#chkAddress").is(":checked");
    if (isckecked) {
        isSameAddr = "Y";
    } else {
        isSameAddr = "N";
    }


    var CCareOf = $("#txtCAddressLine1").val();
    var CHouseNo = $("#txtCAddressLine2").val();
    var Cstreet = $("#txtCRoadStreetName").val();
    var Carea = $("#txtCLocality").val();
    var Ccountry = $("#ddlCCountry").val();
    var Cstate = $("#ddlCState").val();
    var Cdist = $("#ddlCDistrict").val();
    var CPoliceS = $("#ddlCPS").val();
    var Cblock = $("#txtCTaluka").val();
    var Cpanchayat = $("#txtCVillage").val();
    var Cpincode = $("#txtCPPinCode").val();

    var AUID = $("#txtAAppUID").val();
    var AFName = $("#txtAFirstName").val();
    var AMName = $("#txtAMiddleName").val();
    var ALName = $("#txtALastName").val();
    var AMobileNo = $("#txtAMobileNo").val();
    var AStdCcode = $("#txtAStdCode").val();
    var APhoneNo = $("#txtAPhone").val();

    var APHouseNo = $("#txtAAddressLine2").val();
    var APstreet = $("#txtARoadStreetName").val();
    var AParea = $("#txtALocality").val();
    var APcountry = $("#ddlACountry").val();
    var APstate = $("#ddlAState").val();
    var APdist = $("#ddlADistrict").val();
    var APPoliceS = $("#ddlAPS").val();
    var APblock = $("#txtATaluka").val();
    var APpanchayat = $("#txtAVillage").val();
    var APpincode = $("#txtAPinCode").val();

    var APIsSameAddr = "";
    Aisckecked = $("#chkAAddress").is(":checked");
    if (Aisckecked) {
        APIsSameAddr = "Y";
    } else {
        APIsSameAddr = "N";
    }


    var ACHouseNo = $("#txtCAAddressLine2").val();
    var ACstreet = $("#txtCARoadStreetName").val();
    var ACarea = $("#txtCALocality").val();
    var ACcountry = $("#ddlCACountry").val();
    var ACstate = $("#ddlCAState").val();
    var ACdist = $("#ddlCADistrict").val();
    var ACPoliceS = $("#ddlCAPS").val();
    var ACblock = $("#txtCATaluka").val();
    var ACpanchayat = $("#txtCAVillage").val();
    var ACpincode = $("#txtCAPPinCode").val();

    var IncdPlace = $("#txtIncidentPlace").val();

    var IsIncdDateKnow = "";
    isDYes = $("#rdoDYes").is(":checked");
    if (isDYes) {
        IsIncdDateKnow = "Y";
    } else {
        IsIncdDateKnow = "N";
    }

    var IncdDateFrom = $("#txtIncidentFromDate").val();
    var IncdDateTo = $("#txtIncidentToDate").val();
    var IncdType = $("#IncidentType").val();

    var IsPSKow = "";
    isPSYes = $("#rdoPS").is(":checked");
    if (isPSYes) {
        IsPSKow = "Y";
    } else {
        IsPSKow = "N";
    }

    var IsDisKNow = "";
    isDistYes = $("#rdoDisY").is(":checked");
    if (isDistYes) {
        IsDisKNow = "Y";
    } else {
        IsDisKNow = "N";
    }

    var CompDis = $("#ddlCSDDis").val();
    var CompPS = $("#ddlCSDPs").val();
    var CompOffice = $("#ddlCSDOffN").val();

    var CompDdate = $("#txtComplaintDate").val();
    var CompDesc = $("#txtComplaintDesc").val();
    var Remark = $("#txtRemark").val();

    var CreatedBy = uid;
    var Createdon = "";
    var IsActive = true;
    var AppID = "";
    var IsVarified = "";


    var objUser = {};
    objUser =
        {
            "vDistrictName": vDistrictName
            , "vTalukaName": vTalukaName

            , "ApplicantType": ApplicantType
            , "ApplicantName": ApplicantName
            , "ApplicantCountry": ApplicantCountry
            , "IdentificationType": IdentificationType
            , "IdentificationNumber": IdentificationNumber
            , "PassPortDate": PassPortDate
            , "PassPortPlace": PassPortPlace
            , "UID": UID
            , "FirstName": FirstName
            , "MiddleName": MiddleName
            , "LastName": LastName
            , "Gender": Gender
            , "DOB": DOB
            , "DOBY": DOBY
            , "Age": Age
            , "AgeRFrom": AgeRFrom
            , "AgeRTo": AgeRTo
            , "EmailID": EmailID
            , "MobileNo": MobileNo
            , "StdCode": StdCode
            , "PhoneNo": PhoneNo
            , "RelativeType": RelativeType
            , "RelativeName": RelativeName
            , "ComplaintNature": ComplaintNature

            , "isSameAddr": isSameAddr

            , "PCareOf": PCareOf
            , "PHouseNo": PHouseNo
            , "Pstreet": Pstreet
            , "Parea": Parea
            , "Pcountry": Pcountry
            , "Pstate": Pstate
            , "Pdist": Pdist
            , "PPoliceS": PPoliceS
            , "Pblock": Pblock
            , "Ppanchayat": Ppanchayat
            , "Ppincode": Ppincode
            , "CCareOf": CCareOf
            , "CHouseNo": CHouseNo
            , "Cstreet": Cstreet
            , "Carea": Carea
            , "Ccountry": Ccountry
            , "Cstate": Cstate
            , "Cdist": Cdist
            , "CPoliceS": CPoliceS
            , "Cblock": Cblock
            , "Cpanchayat": Cpanchayat
            , "Cpincode": Cpincode

            , "AUID": AUID
            , "AFName": AFName
            , "AMName": AMName
            , "ALName": ALName
            , "AMobileNo": AMobileNo
            , "AStdCcode": AStdCcode
            , "APhoneNo": APhoneNo

            , "APHouseNo": APHouseNo
            , "APstreet": APstreet
            , "AParea": AParea
            , "APcountry": APcountry
            , "APstate": APstate
            , "APdist": APdist
            , "APPoliceS": APPoliceS
            , "APblock": APblock
            , "APpanchayat": APpanchayat
            , "APpincode": APpincode

            , "APIsSameAddr": APIsSameAddr

            , "ACHouseNo": ACHouseNo
            , "ACstreet": ACstreet
            , "ACarea": ACarea
            , "ACcountry": ACcountry
            , "ACstate": ACstate
            , "ACdist": ACdist
            , "ACPoliceS": ACPoliceS
            , "ACblock": ACblock
            , "ACpanchayat": ACpanchayat
            , "ACpincode": ACpincode

            , "IncdPlace": IncdPlace
            , "IsIncdDateKnow": IsIncdDateKnow
            , "IncdDateFrom": IncdDateFrom
            , "IncdDateTo": IncdDateTo
            , "IncdType": IncdType
            , "IsPSKow": IsPSKow
            , "IsDisKNow": IsDisKNow
            , "CompDis": CompDis
            , "CompPS": CompPS
            , "CompOffice": CompOffice
            , "CompDdate": CompDdate
            , "CompDesc": CompDesc
            , "Remark": Remark

            , "CreatedBy": CreatedBy
            , "Createdon": Createdon
            , "IsActive": IsActive
            , "AppID": AppID
            , "IsVarified": IsVarified

        }

    var temp = 'RegisterResidence';
    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(objUser, null, 4)
    };
    //console.log(obj);
    $.when(
       $.ajax({
           type: "POST",
           contentType: "application/json; charset=utf-8",
           url: "/WebApp/Kiosk/CCTNS/ComplaintRegistration.aspx/InsertData",
           data: JSON.stringify(obj, null, 4),
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

           if (result) {
               //bootbox.alert("Aggreement Request Applied Successfully..")
               alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
               window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
           }
       });// end of Then function of main Data Insert Function
    return false;
}

function VerifyForm() {
    var text = "", opt = 0;

    var ddlNationality = $("#ddlNationality").val(); if (ddlNationality == '-Select-' || ddlNationality == "0") { text += "<br /> -Please Select Nationality. "; $("#ddlNationality").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlNationality").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlNationality").attr('style', 'border:1px solid #eee !important;'); $("#ddlNationality").css({ "background-color": "#ffffff" }); }
    var txtFirstName = $("#txtFirstName").val(); if (txtFirstName == "" || txtFirstName == null) { text += "<br /> -Please fill Applicent Name."; $("#txtFirstName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtFirstName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtFirstName").attr('style', '1px solid #cdcdcd !important;'); $("#txtFirstName").css({ "background-color": "#ffffff" }); }
    var Gender = $("#ddlGender").val(); if (Gender == '-Select-' || Gender == "0") { text += "<br /> -Please Select Gender. "; $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlGender").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlGender").attr('style', 'border:1px solid #eee !important;'); $("#ddlGender").css({ "background-color": "#ffffff" }); }
    var ddlComplaintNature = $("#ddlComplaintNature").val(); if (ddlComplaintNature == '-Select-' || ddlComplaintNature == "0") { text += "<br /> -Please Select Complaint Nature. "; $("#ddlComplaintNature").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlComplaintNature").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlComplaintNature").attr('style', 'border:1px solid #eee !important;'); $("#ddlComplaintNature").css({ "background-color": "#ffffff" }); }

    var ddlCountry = $("#ddlCountry").val(); if (ddlCountry == '-Select-' || ddlCountry == "0") { text += "<br /> -Please Select Perment Country. "; $("#ddlCountry").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCountry").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCountry").attr('style', 'border:1px solid #eee !important;'); $("#ddlCountry").css({ "background-color": "#ffffff" }); }
    var ddlState = $("#ddlState").val(); if (ddlState == '-Select-' || ddlState == "0") { text += "<br /> -Please Select Perment State. "; $("#ddlState").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlState").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlState").attr('style', 'border:1px solid #eee !important;'); $("#ddlState").css({ "background-color": "#ffffff" }); }
    var ddlDistrict = $("#ddlDistrict").val(); if (ddlDistrict == '-Select-' || ddlDistrict == "0") { text += "<br /> -Please Select Perment District. "; $("#ddlDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlDistrict").attr('style', 'border:1px solid #eee !important;'); $("#ddlDistrict").css({ "background-color": "#ffffff" }); }
    var ddlPS = $("#ddlPS").val(); if (ddlPS == '-Select-' || ddlPS == "0") { text += "<br /> -Please Select Perment Police Station. "; $("#ddlPS").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlPS").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlPS").attr('style', 'border:1px solid #eee !important;'); $("#ddlPS").css({ "background-color": "#ffffff" }); }
    var txtVillage = $("#txtVillage").val(); if (txtVillage == "" || txtVillage == null) { text += "<br /> -Please fill Perment Village."; $("#txtVillage").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVillage").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVillage").attr('style', '1px solid #cdcdcd !important;'); $("#txtVillage").css({ "background-color": "#ffffff" }); }

    //var ddlCCountry = $("#ddlCCountry").val(); if (ddlCCountry == '-Select-' || ddlCCountry == "0") { text += "<br /> -Please Select Current Country. "; $("#ddlCCountry").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCCountry").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCCountry").attr('style', 'border:1px solid #eee !important;'); $("#ddlCCountry").css({ "background-color": "#ffffff" }); }
    //var ddlCState = $("#ddlCState").val(); if (ddlCState == '-Select-' || ddlCState == "0") { text += "<br /> -Please Select Current State. "; $("#ddlCState").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCState").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCState").attr('style', 'border:1px solid #eee !important;'); $("#ddlCState").css({ "background-color": "#ffffff" }); }
    //var ddlCDistrict = $("#ddlCDistrict").val(); if (ddlCDistrict == '-Select-' || ddlCDistrict == "0") { text += "<br /> -Please Select Current District. "; $("#ddlCDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCDistrict").attr('style', 'border:1px solid #eee !important;'); $("#ddlCDistrict").css({ "background-color": "#ffffff" }); }
    //var ddlCPS = $("#ddlCPS").val(); if (ddlCPS == '-Select-' || ddlCPS == "0") { text += "<br /> -Please Select Current Police Station. "; $("#ddlCPS").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCPS").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCPS").attr('style', 'border:1px solid #eee !important;'); $("#ddlCPS").css({ "background-color": "#ffffff" }); }
    //var txtCVillage = $("#txtCVillage").val(); if (txtCVillage == "" || txtCVillage == null) { text += "<br /> -Please fill Current Village."; $("#txtCVillage").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCVillage").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCVillage").attr('style', '1px solid #cdcdcd !important;'); $("#txtCVillage").css({ "background-color": "#ffffff" }); }


    var chkAddress = $("#chkAddress").is(":checked");
    if (chkAddress) {

        $('#ddlCCountry').prop("disabled", true);
        $("#ddlCCountry").hide();

        $('#txtCCountry').prop("disabled", true);
        $("#txtCCountry").show();


        $('#ddlCState').prop("disabled", true);
        $("#ddlCState").hide();

        $('#txtCState').prop("disabled", true);
        $("#txtCState").show();


        $('#ddlCDistrict').prop("disabled", true);
        $("#ddlCDistrict").hide();

        $('#txtCDistrict').prop("disabled", true);
        $("#txtCDistrict").show();

        $('#ddlCPS').prop("disabled", true);
        $("#ddlCPS").hide();

        $('#txtCPS').prop("disabled", true);
        $("#txtCPS").show();

        $('#txtCVillage').prop("disabled", true);
        var txtCVillage = $("#txtCVillage").val(); $("#txtCVillage").attr('style', '1px solid #cdcdcd !important;'); $("#txtCVillage").css({ "background-color": "#eee" });

    }
    else {
        var ddlCCountry = $("#ddlCCountry").val(); if (ddlCCountry == '-Select-' || ddlCCountry == "0") { text += "<br /> -Please Select Current Country. "; $("#ddlCCountry").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCCountry").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCCountry").attr('style', 'border:1px solid #eee !important;'); $("#ddlCCountry").css({ "background-color": "#ffffff" }); }
        var ddlCState = $("#ddlCState").val(); if (ddlCState == '-Select-' || ddlCState == "0") { text += "<br /> -Please Select Current State. "; $("#ddlCState").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCState").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCState").attr('style', 'border:1px solid #eee !important;'); $("#ddlCState").css({ "background-color": "#ffffff" }); }
        var ddlCDistrict = $("#ddlCDistrict").val(); if (ddlCDistrict == '-Select-' || ddlCDistrict == "0") { text += "<br /> -Please Select Current District. "; $("#ddlCDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCDistrict").attr('style', 'border:1px solid #eee !important;'); $("#ddlCDistrict").css({ "background-color": "#ffffff" }); }
        var ddlCPS = $("#ddlCPS").val(); if (ddlCPS == '-Select-' || ddlCPS == "0") { text += "<br /> -Please Select Current Police Station. "; $("#ddlCPS").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCPS").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCPS").attr('style', 'border:1px solid #eee !important;'); $("#ddlCPS").css({ "background-color": "#ffffff" }); }
        var txtCVillage = $("#txtCVillage").val(); if (txtCVillage == "" || txtCVillage == null) { text += "<br /> -Please fill Current Village."; $("#txtCVillage").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCVillage").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCVillage").attr('style', '1px solid #cdcdcd !important;'); $("#txtCVillage").css({ "background-color": "#ffffff" }); }
    }


    var rdoDYes = $("#rdoDYes").is(":checked");
    if (rdoDYes) {
        var txtIncidentFromDate = $("#txtIncidentFromDate").val(); if (txtIncidentFromDate == "" || txtIncidentFromDate == null) { text += "<br /> -Please select Incident From Date."; $("#txtIncidentFromDate").attr('style', 'border:1px solid #d03100 !important;'); $("#txtIncidentFromDate").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtIncidentFromDate").attr('style', '1px solid #cdcdcd !important;'); $("#txtIncidentFromDate").css({ "background-color": "#ffffff" }); }
        var txtIncidentToDate = $("#txtIncidentToDate").val(); if (txtIncidentToDate == "" || txtIncidentToDate == null) { text += "<br /> -Please select Incident To Date."; $("#txtIncidentToDate").attr('style', 'border:1px solid #d03100 !important;'); $("#txtIncidentToDate").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtIncidentToDate").attr('style', '1px solid #cdcdcd !important;'); $("#txtIncidentToDate").css({ "background-color": "#ffffff" }); }
    } else {
    }

    var txtIncidentPlace = $("#txtIncidentPlace").val(); if (txtIncidentPlace == "" || txtIncidentPlace == null) { text += "<br /> -Please Fill Incident Place."; $("#txtIncidentPlace").attr('style', 'border:1px solid #d03100 !important;'); $("#txtIncidentPlace").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtIncidentPlace").attr('style', '1px solid #cdcdcd !important;'); $("#txtIncidentPlace").css({ "background-color": "#ffffff" }); }



    var rdoPSY = $("#rdoPSY").is(":checked");
    var rdoDisY = $("#rdoDisY").is(":checked");

    if (rdoPSY) {
        var ddlCSDDis = $("#ddlCSDDis").val(); if (ddlCSDDis == 'Select' || ddlCSDDis == "0") { text += "<br /> -Please Select Your  Complaint District. "; $("#ddlCSDDis").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCSDDis").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCSDDis").attr('style', 'border:1px solid #eee !important;'); $("#ddlCSDDis").css({ "background-color": "#ffffff" }); }
        var ddlCSDPs = $("#ddlCSDPs").val(); if (ddlCSDPs == 'Select' || ddlCSDPs == "0") { text += "<br /> -Please Select Your  Complaint Police Station. "; $("#ddlCSDPs").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCSDPs").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCSDPs").attr('style', 'border:1px solid #eee !important;'); $("#ddlCSDPs").css({ "background-color": "#ffffff" }); }
    }
    if (!rdoPSY && rdoDisY) {
        var ddlCSDDis = $("#ddlCSDDis").val(); if (ddlCSDDis == 'Select' || ddlCSDDis == "0") { text += "<br /> -Please Select Your  Complaint District. "; $("#ddlCSDDis").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCSDDis").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCSDDis").attr('style', 'border:1px solid #eee !important;'); $("#ddlCSDDis").css({ "background-color": "#ffffff" }); }
        var ddlCSDOffN = $("#ddlCSDOffN").val(); if (ddlCSDOffN == 'Select' || ddlCSDOffN == "0") { text += "<br /> -Please Select Your  Complaint Office. "; $("#ddlCSDOffN").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCSDOffN").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCSDOffN").attr('style', 'border:1px solid #eee !important;'); $("#ddlCSDOffN").css({ "background-color": "#ffffff" }); }
    }
    if (!rdoPSY && !rdoDisY) {
        var ddlCSDOffN = $("#ddlCSDOffN").val(); if (ddlCSDOffN == 'Select' || ddlCSDOffN == "0") { text += "<br /> -Please Select Your  Complaint Office. "; $("#ddlCSDOffN").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCSDOffN").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCSDOffN").attr('style', 'border:1px solid #eee !important;'); $("#ddlCSDOffN").css({ "background-color": "#ffffff" }); }
    }

    var txtComplaintDesc = $("#txtComplaintDesc").val(); if (txtComplaintDesc == "" || txtComplaintDesc == null) { text += "<br /> -Please Fill Complaint Discription."; $("#txtComplaintDesc").attr('style', 'border:1px solid #d03100 !important;'); $("#txtComplaintDesc").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtComplaintDesc").attr('style', '1px solid #cdcdcd !important;'); $("#txtComplaintDesc").css({ "background-color": "#ffffff" }); }


    if (text != "" || opt == 1) {
        alert(text);
        //alertPopup("Please fill following information.", text);
        return false;
    }
    return true;

}



var dat = new Date();
var curday = dat.getDate();
var curmon = dat.getMonth() + 1;
var curyear = dat.getFullYear();
function checkleapyear(datea) {

    datea.Date = new Date();
    if (datea.getyear() % 4 == 0) {
        if (datea.getyear() % 10 != 0) {
            return true;
        } else {
            if (datea.getyear() % 400 == 0)
                return true;
            else
                return false;

        }
    }
    return false;
}
function DaysInMonth(Y, M) {
    with (new Date(Y, M, 1, 12)) {
        setDate(0);
        return getDate();
    }

}
function datedif(date1, date2) {
    var y1 = date1.getFullYear(),
    m1 = date1.getMonth(),
    d1 = date1.getDate(),
    y2 = date2.getFullYear(),
    m2 = date2.getMonth(),
    d2 = date2.getDate();
    if (d1 < d2) {
        m1--;
        d1 += DaysInMonth(y2, m2);
    }
    if (m1 < m2) {
        y1--;
        m1 += 12;
    }
    return [y1 - y2, m1 - m2, d1 - d2];
}
function AgeCalculate(dob) {
    debugger;
    var D1 = dob.split('/');
    var calyear = D1[0];
    var calmon = D1[1];
    var calday = D1[2];


    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calday, calmon - 1, calyear);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calday, calmon, calyear, 0, 0, 0);
    var dife = datedif(curd, cald);
    return dife[0];
}
function CalAgeByYear() {
    $("#txtDOBYear").change(function () {
        var BY = $("#txtDOBYear").val();
        var CY = new Date().getFullYear()
        var Age = CY - BY;
        if (Age > 120) {
            alert("Age is exceding 120 years");
            $("#txtDOBYear").val("");
            $("#txtAge").val("");
            $("#txtAgeFrom").val("");
            $("#txtAgeTo").val("");
        } else {
            $("#txtAge").val(Age);
            $("#txtDOB").val("");
            CalAgeRange(Age);
        }
    });
}
function CalAgeRange(age) {
    if (age <= 10) {
        $("#txtAgeFrom").val("0");
        $("#txtAgeTo").val("10");
    } else if (age > 10 && age <= 20) {
        $("#txtAgeFrom").val("10");
        $("#txtAgeTo").val("20");
    } else if (age > 20 && age <= 30) {
        $("#txtAgeFrom").val("20");
        $("#txtAgeTo").val("30");
    } else if (age > 30 && age <= 40) {
        $("#txtAgeFrom").val("30");
        $("#txtAgeTo").val("40");
    } else if (age > 40 && age <= 50) {
        $("#txtAgeFrom").val("40");
        $("#txtAgeTo").val("50");
    } else if (age > 50 && age <= 60) {
        $("#txtAgeFrom").val("50");
        $("#txtAgeTo").val("60");
    } else if (age > 60 && age <= 70) {
        $("#txtAgeFrom").val("60");
        $("#txtAgeTo").val("70");
    } else if (age > 70 && age <= 80) {
        $("#txtAgeFrom").val("70");
        $("#txtAgeTo").val("80");
    }
    else if (age > 80 && age <= 90) {
        $("#txtAgeFrom").val("80");
        $("#txtAgeTo").val("90");
    } else if (age > 90 && age <= 100) {
        $("#txtAgeFrom").val("90");
        $("#txtAgeTo").val("100");
    } else if (age > 100 && age <= 110) {
        $("#txtAgeFrom").val("100");
        $("#txtAgeTo").val("110");
    } else if (age > 110 && age <= 120) {
        $("#txtAgeFrom").val("110");
        $("#txtAgeTo").val("120");
    } else {
        $("#txtAgeFrom").val("");
        $("#txtAgeTo").val("");
    }
}


function BindDatePickers() {
    $('#txtDOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            var t_DOB = $("#txtDOB").val();
            t_DOB = t_DOB.replace(/-/g, "/");
            $('#txtDOB').val(t_DOB);
            //$('#txtDOB').prop("disabled", true);

            var t_DOB = $("#txtDOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear();
            var Age = AgeCalculate(t_DOB);
            $('#txtAge').val(Age);

        }
    });

    $('#txtSaleDeedDte').datepicker({
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
function ValidateAlpha(evt) {
    //var Name = $('#AccountHolder').val();
    //var charCode;
    var e = evt; // for trans-browser compatibility
    Name = (e.which) ? e.which : event.keyCode;
    //charCode = (evt.which) ? evt.which : event.keyCode;
    if (Name >= 97 && Name <= 122 || Name >= 65 && Name <= 90 || Name == 8 || Name == 32) {
        return true;
    }
    else {
        return false;
    }
}
function onlyNumbers(evt) {
    flag = false
    var e = evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        //alert("Only numbers are allowed");
        return false;
    }
    return true;
}
function checkmobile(e) {
    var text = "";
    var opt = "";
    var mobileno = this.value();
    if (mobileno != null) {
        if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
            text += "<br /> Please Enter A Valid Mobile Number.";
            //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
            opt = 1;
        }
        if (mobileno.length > 10 || mobileno.length < 10) {
            text += "<br /> Mobile No. Should Be Atleast 10 Digit.";
            //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
            opt = 1;
        }
        if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
            text += "<br /> Mobile No. Should Start With 9 ,8 or 7.";
            //alertPopup("Mobile Number", "</BR> Mobile No. Should Starts Sith 9 ,8 or 7");
            opt = 1;
        }
    }
    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        $("#ContentPlaceHolder1_BMobile").val("");

        return false;
    }
    return true;
}