$(document).ready(function () {

    $('#myModal').modal({
        backdrop: 'static',
        keyboard: false
    });

    //Start Address Fields;
    GetState();
    GetDistrictPloiceStations();
    $("#ddlState").change(function () {
        GetDistrict('#ddlState', '#ddlDistrict');
    });
    $("#ddlPState").change(function () {
        GetDistrict('#ddlPState', '#ddlPDistrict');
        GetDistrict('#ddlPState', '#ddlLocalPoliceStationDisct');
    });

    $("#ddlDistrict").change(function () {
        GetTaluka('#ddlDistrict', '#ddlBlockTaluka');
    });
    $("#ddlPDistrict").change(function () {
        GetTaluka('#ddlPDistrict', '#ddlPBlockTaluka');
    });
    $("#ddlLocalPoliceStationDisct").change(function () {
        $("#txtLocalPoliceStation").val("");
        $("#ddlLocalPoliceStation").val("0");
        GetDistrictPloiceStations();
    });

    $("#ddlBlockTaluka").change(function () {
        GetPanchayat('#ddlBlockTaluka', '#ddlPanchayatVillageCity');
    });
    $("#ddlPBlockTaluka").change(function () {
        GetPanchayat('#ddlPBlockTaluka', '#ddlPPanchayatVillageCity');
    });
    //End Address Fields;


    $('#QualificationDtl').hide();
    $('#OccupationDtl').hide();
    $("#txtLocalPoliceStation").hide();

    $("#txtHeigt").change(function () {
        if (this.value > 300) {
            alert("Please check Height. Entered value is more then 300 cm.");
            $("#txtHeigt").val("");
        }
    });
    $("#txtWeight").change(function () {
        if (this.value > 150) {
            alert("Please check Weight. Entered value is more then 150 kg.");
            $("#txtWeight").val("");
        }
    });

    var ApplicatantType = "";
    $('#ddlApplicantType').change(function (e) {
        ApplicatantType = $('#ddlApplicantType').val();
        if (ApplicatantType == 1) {
            $("#divVerify").hide();

        } else {
            $("#divVerify").show();
        }
    });

    var IdentificationType = "";
    $("#txtIdentificationNumber").attr("maxlength", "16");
    $("#btnverify").hide();
    $('#ddlIdentificationType').change(function (e) {
        IdentificationType = $('#ddlIdentificationType').val();
        if (IdentificationType == 1) { $("#txtIdentificationNumber").attr("maxlength", "12"); $("#btnverify").show(); }
        else {
            $("#txtIdentificationNumber").attr("maxlength", "12");
            $("#btnverify").hide();
        }
    });

    $("#txtIdentificationNumber").on("keyup", function () {
        this.value = this.value.toUpperCase();
        if ($('#ddlIdentificationType').val() == "1") {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        };
    });

    $("#txtCriminalRecordDetail").attr('style', '1px solid #cdcdcd !important;'); $("#txtCriminalRecordDetail").css({ "background-color": "#eee" });
    $("#txtCriminalRecordDetail").attr("disabled", "disabled");
    $('input[type=radio][name=CriminalRecord]').change(function () {
        if (this.value == 'Yes') {
            $("#txtCriminalRecordDetail").val("");
            $("#txtCriminalRecordDetail").removeAttr("disabled");
            $("#txtCriminalRecordDetail").css({ "background-color": "#fff" });
        }
        else if (this.value == 'No') {
            $("#txtCriminalRecordDetail").val("");
            $("#txtCriminalRecordDetail").attr('style', '1px solid #cdcdcd !important;'); $("#txtCriminalRecordDetail").css({ "background-color": "#eee" });
            $("#txtCriminalRecordDetail").attr("disabled", "disabled");
        }
    });

    var chkIsSameAddrsYes = "";
    $("#txtStayYear").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid || val > 100) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    }).change(function () {
        if (chkIsSameAddrsYes == true) {
            $("#txtPStayYear").val($("#txtStayYear").val());
        }
    });
    $("#txtPStayYear").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid || val > 100) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    });
    $("#txtYear").blur(function () {
        var val = this.value;
        var today = new Date().getFullYear();
        if (val > today || val < 1920) {
            alert("Year should be in range 1920 to Current Year");
            console.log("Invalid input!");
            $("#txtYear").val("");
        }
    });
    //$("#txtStayMonth").on("keyup", function () {
    //    var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
    //        val = this.value;
    //    if (!valid || val > 12) {
    //        console.log("Invalid input!");
    //        this.value = val.substring(0, val.length - 1);
    //    }
    //}).change(function () {
    //    if (chkIsSameAddrsYes == true) {
    //        $("#txtPStayMonth").val($("#txtStayMonth").val());
    //    }
    //});
    //$("#txtPStayMonth").on("keyup", function () {
    //    var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
    //        val = this.value;
    //    if (!valid || val > 12) {
    //        console.log("Invalid input!");
    //        this.value = val.substring(0, val.length - 1);
    //    }
    //});

    $("#txtDOB").datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            var dob = new Date(this.value).getFullYear();
            var today = new Date();
            var age = Math.floor((today - dob) / (365 * 24 * 60 * 60 * 1000)); //new Date(today - dob).getFullYear() - 1970;  //          
            $('#txtAge').val(age);
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });
    $("#txtJoingDate").datepicker({
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
    $("#txtDate").datepicker({
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

    var d = new Date();
    var strDate = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
    $("#txtDate").val(strDate);
    $("#txtDate").prop("disabled", true);

    // Check for IsSame Address
    $('#chkIsSameAddrsYes').change(function () {
        checkIsSameAddrss();
        GetDistrict('#ddlPState', '#ddlLocalPoliceStationDisct');
    });

    $('#btnverify').click(function () {
        var text = "";
        var opt = 0;
        var IdentificationNumber = "";
        var IdentificationType = $("#ddlIdentificationType").val(); if (IdentificationType == 0) { text += "<br /> -Please Select Identification Type."; $("#ddlIdentificationType").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlIdentificationType").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlIdentificationType").attr('style', '1px solid #cdcdcd !important;'); $("#ddlIdentificationType").css({ "background-color": "#ffffff" }); }
        if (IdentificationType == 1) {
            IdentificationNumber = $("#txtIdentificationNumber").val(); if (IdentificationNumber == "" || IdentificationNumber == null) { text += "<br /> -Please Select Identification Number."; $("#txtIdentificationNumber").attr('style', 'border:1px solid #d03100 !important;'); $("#txtIdentificationNumber").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtIdentificationNumber").attr('style', '1px solid #cdcdcd !important;'); $("#txtIdentificationNumber").css({ "background-color": "#ffffff" }); }
        }
        if (opt == 1) { alert(text); return false; }
        if (opt == 0 && IdentificationType == 1) {
            openWindow(1, 2, 'UIDCharacterCertificate');
            return true;
        }
    });
    window.CallParent = function () {
        //alert("Aadhaar Verification Successfull");
        BindAadhaarData();
    }
});

function checkIsSameAddrss() {
    if ($('#chkIsSameAddrsYes').is(":checked")) {

        $("#txtPAddressLine1").val($("#txtAddressLine1").val());
        $('#txtPAddressLine1').prop("disabled", true);

        $("#txtPAddressLine2").val($("#txtAddressLine2").val());
        $('#txtPAddressLine2').prop("disabled", true);

        $("#txtPRoadStreetName").val($("#txtRoadStreetName").val());
        $('#txtPRoadStreetName').prop("disabled", true);

        $("#txtPLandMark").val($("#txtLandMark").val());
        $('#txtPLandMark').prop("disabled", true);

        $("#txtPLocality").val($("#txtLocality").val());
        $('#txtPLocality').prop("disabled", true);

        $("#txtPPincode").val($("#txtPincode").val());
        $('#txtPPincode').prop("disabled", true);

        $("#txtPStayYear").val($("#txtStayYear").val());
        $('#txtPStayYear').prop("disabled", true);


        $("#ddlPState").val($("#ddlState").val());
        $("#txtPState").val($("#ddlState option:selected").text());
        //if ($("#ddlState").val() == "0") {
        //    $("#txtPState").val("");
        //}
        //else {
        //    $("#txtPState").val($("#ddlState option:selected").text());
        //}
        $("#txtPState").show();
        $("#ddlPState").hide();
        $('#txtPState').prop("disabled", true);


        $("#ddlPDistrict").val($("#ddlDistrict").val());
        $("#txtPDistrict").val($("#ddlDistrict option:selected").text());
        //if ($("#ddlDistrict").val() == "0") {
        //    $("#txtPDistrict").val("");
        //}
        //else {
        //    $("#txtPDistrict").val($("#ddlDistrict option:selected").text());
        //}
        $("#txtPDistrict").show();
        $("#ddlPDistrict").hide();
        $('#txtPDistrict').prop("disabled", true);


        $("#ddlPBlockTaluka").val($("#ddlBlockTaluka").val());
        $("#txtPBlockTaluka").val($("#ddlBlockTaluka option:selected").text());
        //if ($("#ddlBlockTaluka").val() == "0") {
        //    $("#txtPBlockTaluka").val("");
        //}
        //else {
        //    $("#txtPBlockTaluka").val($("#ddlBlockTaluka option:selected").text());
        //}
        $("#txtPBlockTaluka").show();
        $("#ddlPBlockTaluka").hide();
        $('#txtPBlockTaluka').prop("disabled", true);


        $("#ddlPPanchayatVillageCity").val($("#ddlPanchayatVillageCity").val());
        $("#txtPPanchayatVillageCity").val($("#ddlPanchayatVillageCity option:selected").text());
        //if ($("#ddlPanchayatVillageCity").val() == "0") {
        //    $("#txtPPanchayatVillageCity").val("");
        //}
        //else {
        //    $("#txtPPanchayatVillageCity").val($("#ddlPanchayatVillageCity option:selected").text());
        //}
        $("#txtPPanchayatVillageCity").show();
        $("#ddlPPanchayatVillageCity").hide();
        $('#txtPPanchayatVillageCity').prop("disabled", true);


        $("#txtPAddressLine1").attr('style', '1px solid #eee !important;'); $("#txtPAddressLine1").css({ "background-color": "#eee" });
        $("#txtPAddressLine2").attr('style', '1px solid #eee !important;'); $("#txtPAddressLine2").css({ "background-color": "#eee" });
        $("#txtPRoadStreetName").attr('style', '1px solid #eee !important;'); $("#txtPRoadStreetName").css({ "background-color": "#eee" });
        $("#txtPLandMark").attr('style', '1px solid #eee !important;'); $("#txtPLandMark").css({ "background-color": "#eee" });
        $("#txtPLocality").attr('style', '1px solid #eee !important;'); $("#txtPLocality").css({ "background-color": "#eee" });
        $("#txtPPincode").attr('style', '1px solid #eee !important;'); $("#txtPPincode").css({ "background-color": "#eee" });
        $("#txtPStayYear").attr('style', '1px solid #eee !important;'); $("#txtPStayYear").css({ "background-color": "#eee" });

        $("#txtPState").attr('style', '1px solid #eee !important;'); $("#ddlPState").css({ "background-color": "#eee" });
        $("#txtPDistrict").attr('style', '1px solid #eee !important;'); $("#ddlPDistrict").css({ "background-color": "#eee" });
        $("#txtPBlockTaluka").attr('style', '1px solid #eee !important;'); $("#ddlPBlockTaluka").css({ "background-color": "#eee" });
        $("#txtPPanchayatVillageCity").attr('style', '1px solid #eee !important;'); $("#ddlPPanchayatVillageCity").css({ "background-color": "#eee" });

    } else {

        $("#txtPAddressLine1").val("");
        $('#txtPAddressLine1').prop("disabled", false);

        $("#txtPAddressLine2").val("");
        $('#txtPAddressLine2').prop("disabled", false);

        $("#txtPRoadStreetName").val("");
        $('#txtPRoadStreetName').prop("disabled", false);

        $("#txtPLandMark").val("");
        $('#txtPLandMark').prop("disabled", false);

        $("#txtPLocality").val("");
        $('#txtPLocality').prop("disabled", false);

        $("#txtPPincode").val("");
        $('#txtPPincode').prop("disabled", false);

        $("#txtPStayYear").val("");
        $('#txtPStayYear').prop("disabled", false);

        $("#ddlPState").val("0");
        $('#ddlPState').prop("disabled", false);
        $("#txtPState").val("");
        $('#txtPState').prop("disabled", false);
        $("#txtPState").hide();
        $("#ddlPState").show();

        $("#ddlPDistrict").val("0");
        $('#ddlPDistrict').prop("disabled", false);
        $("#txtPDistrict").val("");
        $('#txtPDistrict').prop("disabled", false);
        $("#txtPDistrict").hide();
        $("#ddlPDistrict").show();

        $("#ddlPBlockTaluka").val("0");
        $('#ddlPBlockTaluka').prop("disabled", false);
        $("#txtPBlockTaluka").val("");
        $('#txtPBlockTaluka').prop("disabled", false);
        $("#txtPBlockTaluka").hide();
        $("#ddlPBlockTaluka").show();

        $("#ddlPPanchayatVillageCity").val("0");
        $('#ddlPPanchayatVillageCity').prop("disabled", false);
        $("#txtPPanchayatVillageCity").val("");
        $('#txtPPanchayatVillageCity').prop("disabled", false);
        $("#txtPPanchayatVillageCity").hide();
        $("#ddlPPanchayatVillageCity").show();

        $("#txtPAddressLine1").attr('style', '1px solid #cdcdcd !important;'); $("#txtPAddressLine1").css({ "background-color": "#fff" });
        $("#txtPAddressLine2").attr('style', '1px solid #cdcdcd !important;'); $("#txtPAddressLine2").css({ "background-color": "#fff" });
        $("#txtPRoadStreetName").attr('style', '1px solid #cdcdcd !important;'); $("#txtPRoadStreetName").css({ "background-color": "#fff" });
        $("#txtPLandMark").attr('style', '1px solid #cdcdcd !important;'); $("#txtPLandMark").css({ "background-color": "#fff" });
        $("#txtPLocality").attr('style', '1px solid #cdcdcd !important;'); $("#txtPLocality").css({ "background-color": "#fff" });
        $("#txtPPincode").attr('style', '1px solid #cdcdcd !important;'); $("#txtPPincode").css({ "background-color": "#fff" });
        $("#txtPStayYear").attr('style', '1px solid #cdcdcd !important;'); $("#txtPStayYear").css({ "background-color": "#fff" });

        $("#ddlPState").attr('style', '1px solid #cdcdcd !important;'); $("#ddlPState").css({ "background-color": "#fff" });
        $("#ddlPDistrict").attr('style', '1px solid #cdcdcd !important;'); $("#ddlPDistrict").css({ "background-color": "#fff" });
        $("#ddlPBlockTaluka").attr('style', '1px solid #cdcdcd !important;'); $("#ddlPBlockTaluka").css({ "background-color": "#fff" });
        $("#ddlPPanchayatVillageCity").attr('style', '1px solid #cdcdcd !important;'); $("#ddlPPanchayatVillageCity").css({ "background-color": "#fff" });

    };
}

//Adhaar Verification Window for Verification of Entered UID
function openWindow(UIDVal, value, SessionName) {
    if (true) {
        var UID = $("#txtIdentificationNumber").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);
        window.open('/UID/Default.aspx?SvcID=429&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
        ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        window.focus();
    }
    return false;
}

function submitApplicantType(e) {
    //debugger;
    var text = "";
    //var relationType = $("#ddlRelationType").val(); if (relationType == "0") { text += "Please Select Relation with Beneficiary."; };
    var ApplicatantType = $('#ddlApplicantType').val(); if (ApplicatantType == "0") { text += "Please Select Applicatant Type. "; };
    if (text != "") {
        //$("#ddlRelationType").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlRelationType").css({ "background-color": "#fff2ee" });
        $("#ddlApplicantType").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlApplicantType").css({ "background-color": "#fff2ee" });
        $("#errorMsg").show();
        $("#errorMsg").val(text);
    } else {
        //$("#ddlRelationType").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlRelationType").css({ "background-color": "#ffffff" });
        $("#ddlApplicantType").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlApplicantType").css({ "background-color": "#ffffff" });
        if (ApplicatantType == "1") {
            var qs = getQueryStrings();
            GetDatalocalAdhar(qs["UID"]);
        }
        $('#myModal').modal('hide');
    }
}

function BindAadhaarData() {
    if ($('#HFUIDData').val() != "" && $('#HFUIDData').val() != null) {
        var obj = jQuery.parseJSON($('#HFUIDData').val());
        //console.log(obj);
        if (obj["residentName"] != "" && obj["residentName"] != null) {
            $('#txtFirstName').val(obj["residentName"])
            $('#txtFirstName').prop("disabled", true)
        }
        if (obj["dateOfBirth"] != "0" && obj["dateOfBirth"] != null) {
            $('#txtDOB').val(obj["dateOfBirth"])
            $('#txtDOB').prop("disabled", true)

            var dob = new Date(obj["dateOfBirth"]);
            var today = new Date();
            var age = Math.floor((today - dob) / (365 * 24 * 60 * 60 * 1000)); //new Date(today - dob).getFullYear() - 1970;  //
            $('#txtAge').val(age);
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
        if (obj["emailId"] != "" && obj["emailId"] != null) {
            $('#txtEmailID').val(obj["emailId"])
            $('#txtEmailID').prop("disabled", true)
        }
        if (obj["phone"] != "" && obj["phone"] != null) {
            $('#txtphoneno').val(obj["phone"])
            $('#txtphoneno').prop("disabled", true)
        }

        if (obj["careOf"] != "" && obj["careOf"] != null) {
            $('#txtFatherName').val(obj["careOf"])
            $('#txtFatherName').prop("disabled", true)
        }

        //if (obj["MotherName"] != "" && obj["MotherName"] != null) {
        //    $('#txtMotherName').val(obj["MotherName"])
        //    $('#txtMotherName').prop("disabled", true)
        //}

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
    if (obj["landmark"] != "" && obj["landmark"] != null) {
        $('#txtLandMark').val(obj["landmark"])
        $('#txtLandMark').prop("disabled", true)
    }
    if (obj["street"] != "" && obj["street"] != null) {
        $('#txtRoadStreetName').val(obj["street"])
        $('#txtRoadStreetName').prop("disabled", true)
    }

    if (obj["locality"] != "" && obj["locality"] != null) {
        $('#txtLocality').val(obj["locality"])
        $('#txtLocality').prop("disabled", true)
    }

    //if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
    //    $('#txtState').show();
    //    $('#txtState').val(obj["state"])
    //    $('#txtState').prop("disabled", true);
    //    $('#ddlState').hide();
    //}
    //else {
    //    $('#ddlState').show();
    //}
    //if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["vtc"] != "" && obj["vtc"] != null && obj["state"] != "" && obj["state"] != null) {
    //    $('#txtDistrict').show();
    //    $('#txtDistrict').val(obj["district"])
    //    $('#txtDistrict').prop("disabled", true);
    //    $('#ddlDistrict').hide();
    //}
    //else {
    //    $('#ddlDistrict').show();
    //}
    //if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["vtc"] != "" && obj["vtc"] != null && obj["state"] != "" && obj["state"] != null) {
    //    $('#txtBlock').show();
    //    $('#txtBlock').val(obj["subDistrict"])
    //    $('#txtBlock').prop("disabled", true);
    //    $('#ddlBlockTaluka').hide();
    //}
    //else {
    //    $('#ddlBlockTaluka').show();
    //}
    //if (obj["vtc"] != "" && obj["vtc"] != null) {
    //    $('#txtPanchayat').show();
    //    $('#txtPanchayat').val(obj["vtc"])
    //    $('#txtPanchayat').prop("disabled", true);
    //    $('#ddlPanchayatVillageCity').hide();
    //}
    //else {
    //    $('#ddlPanchayatVillageCity').show();
    //}
    if (obj["pincode"] != "" && obj["pincode"] != null) {
        $('#txtPincode').val(obj["pincode"])
        $('#txtPincode').prop("disabled", true)
    }
}

function GetDatalocalAdhar(uid) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/CharacterCertificate.aspx/GetDetailAdhaar",
        data: "{ UID: '" + uid + "'}",
        dataType: "json",
        success: function (r) {
            var Element = $('#ddlApplicantType').val();
            var obj = JSON.parse(r.d);
            console.log(obj[0]);

            if (obj[0]["FULLNAME"] != "" && obj[0]["FULLNAME"] != null) {
                $('#txtFirstName').val(obj[0]["FULLNAME"])
                $('#txtFirstName').prop("disabled", true)
            }
            if (obj[0]["DOB"] != "0" && obj[0]["DOB"] != null) {
                $('#txtDOB').val(obj[0]["DOB"])
                $('#txtDOB').prop("disabled", true)
            }
            if (obj[0]["GENDER"] != "") {
                if (obj[0]["gender"] == "M") {
                    $('#ddlGender').val("M");
                }
                else if (obj[0]["GENDER"] == "F") {
                    $('#ddlGender').val("F");
                }
                else {
                    $('#ddlGender').val("T");
                }
                $('#ddlGender').prop("disabled", true);
            }
            if (obj[0]["EMAILID"] != "" && obj[0]["EMAILID"] != null) {
                $('#txtEmailID').val(obj[0]["EMAILID"])
                $('#txtEmailID').prop("disabled", true)
            }
            if (obj[0]["PHONE"] != "" && obj[0]["PHONE"] != null) {
                $('#txtphoneno').val(obj[0]["PHONE"])
                $('#txtphoneno').prop("disabled", true)
            }

            if (obj[0]["FNAME_CAREOF"] != "" && obj[0]["FNAME_CAREOF"] != null) {
                $('#txtFatherName').val(obj[0]["FNAME_CAREOF"])
                $('#txtFatherName').prop("disabled", true)
            }

            if (obj[0]["MOTHERNAME"] != "" && obj[0]["MOTHERNAME"] != null) {
                $('#txtMotherName').val(obj[0]["MOTHERNAME"])
                $('#txtMotherName').prop("disabled", true)
            }

            if (obj[0]["AGE"] != "" && obj[0]["AGE"] != null) {
                $('#txtAge').val(obj[0]["AGE"])
                $('#txtAge').prop("disabled", true)
            }

            if (obj[0]["MOBILE"] != "" && obj[0]["MOBILE"] != null) {
                $('#txtMobileNo').val(obj[0]["MOBILE"])
                $('#txtMobileNo').prop("disabled", true)
            }
            BindLocalDataAddress(obj[0]);
        }
    });
}
function BindLocalDataAddress(obj) {
    //parmanent Address:
    if (obj["PADDRESSLINE1"] != "" && obj["PADDRESSLINE1"] != null) {
        $('#txtAddressLine1').val(obj["PADDRESSLINE1"])
        $('#txtAddressLine1').prop("disabled", true)
    }
    if (obj["PADDRESSLINE2"] != "" && obj["PADDRESSLINE2"] != null) {
        $('#txtAddressLine2').val(obj["PADDRESSLINE2"])
        $('#txtAddressLine2').prop("disabled", true)
    }
    if (obj["PLANDMARK"] != "" && obj["PLANDMARK"] != null) {
        $('#txtLandMark').val(obj["PLANDMARK"])
        $('#txtLandMark').prop("disabled", true)
    }
    if (obj["PSTREET"] != "" && obj["PSTREET"] != null) {
        $('#txtRoadStreetName').val(obj["PSTREET"])
        $('#txtRoadStreetName').prop("disabled", true)
    }
    if (obj["PLOCALITY"] != "" && obj["PLOCALITY"] != null) {
        $('#txtLocality').val(obj["PLOCALITY"])
        $('#txtLocality').prop("disabled", true)
    }
    if (obj["P_D_NAME"] != "" && obj["P_D_NAME"] != null && obj["P_BT_NAME"] != "" && obj["P_BT_NAME"] != null && obj["P_S_NAME"] != "" && obj["P_S_NAME"] != null) {
        $('#txtState').show();
        $('#txtState').val(obj["P_S_NAME"])
        $('#txtState').prop("disabled", true);
        $('#ddlState').hide();
    }
    else {
        $('#ddlState').show();
    }
    if (obj["P_D_NAME"] != "" && obj["P_D_NAME"] != null && obj["P_BT_NAME"] != "" && obj["P_BT_NAME"] != null && obj["P_PVC_NAME"] != "" && obj["P_PVC_NAME"] != null && obj["P_S_NAME"] != "" && obj["P_S_NAME"] != null) {
        $('#txtDistrict').show();
        $('#txtDistrict').val(obj["P_D_NAME"])
        $('#txtDistrict').prop("disabled", true);
        $('#ddlDistrict').hide();
    } else {
        $('#ddlDistrict').show();
    }
    if (obj["P_D_NAME"] != "" && obj["P_D_NAME"] != null && obj["P_BT_NAME"] != "" && obj["P_BT_NAME"] != null && obj["P_PVC_NAME"] != "" && obj["P_PVC_NAME"] != null && obj["P_S_NAME"] != "" && obj["P_S_NAME"] != null) {
        $('#txtBlock').show();
        $('#txtBlock').val(obj["P_BT_NAME"])
        $('#txtBlock').prop("disabled", true);
        $('#ddlBlockTaluka').hide();
    }
    else {
        $('#ddlBlockTaluka').show();
    }
    if (obj["P_PVC_NAME"] != "" && obj["P_PVC_NAME"] != null) {
        $('#txtPanchayat').show();
        $('#txtPanchayat').val(obj["P_PVC_NAME"])
        $('#txtPanchayat').prop("disabled", true);
        $('#ddlPanchayatVillageCity').hide();
    }
    else {
        $('#ddlPanchayatVillageCity').show();
    }
    if (obj["PPINCODE"] != "" && obj["PPINCODE"] != null) {
        $('#txtPincode').val(obj["PPINCODE"])
        $('#txtPincode').prop("disabled", true)
    }


    // Present Address
    if (obj["CADDRESSLINE1"] != "" && obj["CADDRESSLINE1"] != null) {
        $('#txtPAddressLine1').val(obj["CADDRESSLINE1"])
        $('#txtPAddressLine1').prop("disabled", true)
    }
    if (obj["CADDRESSLINE2"] != "" && obj["CADDRESSLINE2"] != null) {
        $('#txtPAddressLine2').val(obj["CADDRESSLINE2"])
        $('#txtPAddressLine2').prop("disabled", true)
    }
    if (obj["CLANDMARK"] != "" && obj["CLANDMARK"] != null) {
        $('#txtPLandMark').val(obj["CLANDMARK"])
        $('#txtPLandMark').prop("disabled", true)
    }
    if (obj["CSTREET"] != "" && obj["CSTREET"] != null) {
        $('#txtPRoadStreetName').val(obj["CSTREET"])
        $('#txtPRoadStreetName').prop("disabled", true)
    }
    if (obj["CLOCALITY"] != "" && obj["CLOCALITY"] != null) {
        $('#txtPLocality').val(obj["CLOCALITY"])
        $('#txtPLocality').prop("disabled", true)
    }
    if (obj["C_D_NAME"] != "" && obj["C_D_NAME"] != null && obj["C_BT_NAME"] != "" && obj["C_BT_NAME"] != null && obj["C_S_NAME"] != "" && obj["C_S_NAME"] != null) {
        $('#txtPState').show();
        $('#txtPState').val(obj["C_S_NAME"])
        $('#txtPState').prop("disabled", true);
        $('#ddlPState').hide();
    }
    else {
        $('#ddlState').show();
    }
    if (obj["C_D_NAME"] != "" && obj["C_D_NAME"] != null && obj["C_BT_NAME"] != "" && obj["C_BT_NAME"] != null && obj["C_S_NAME"] != "" && obj["C_S_NAME"] != null && obj["C_PVC_NAME"] != "" && obj["C_PVC_NAME"] != null) {
        $('#txtPDistrict').show();
        $('#txtPDistrict').val(obj["C_D_NAME"])
        $('#txtPDistrict').prop("disabled", true);
        $('#ddlPDistrict').hide();
    }
    else {
        $('#ddlDistrict').show();
    }
    if (obj["C_D_NAME"] != "" && obj["C_D_NAME"] != null && obj["C_BT_NAME"] != "" && obj["C_BT_NAME"] != null && obj["C_S_NAME"] != "" && obj["C_S_NAME"] != null && obj["C_PVC_NAME"] != "" && obj["C_PVC_NAME"] != null) {
        $('#txtPBlock').show();
        $('#txtPBlock').val(obj["C_BT_NAME"])
        $('#txtPBlock').prop("disabled", true);
        $('#ddlPBlockTaluka').hide();
    }
    else {
        $('#ddlBlockTaluka').show();
    }
    if (obj["C_PVC_NAME"] != "" && obj["C_PVC_NAME"] != null) {
        $('#txtPPanchayat').show();
        $('#txtPPanchayat').val(obj["C_PVC_NAME"])
        $('#txtPPanchayat').prop("disabled", true);
        $('#ddlPPanchayatVillageCity').hide();
    }
    else {
        $('#ddlPPanchayatVillageCity').show();
    }
    if (obj["CPINCODE"] != "" && obj["CPINCODE"] != null) {
        $('#txtPPincode').val(obj["CPINCODE"])
        $('#txtPPincode').prop("disabled", true)
    }


}

function fnNext(e) {
    if (!VerifyForm()) {
        return;
    }

    var text = "", tDis = "", tSubDis = "", LDis = "", LSubDis = "";

    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];

    var ddlIdentificationType = "";
    var ApplicatantType = "";
    var IdentificationNumber = "";
    var ApplicantName = "";
    if ($('#ddlApplicantType').val() == 1) {
        ApplicatantType = "Self";
        ddlIdentificationType = 1;
        IdentificationNumber = uid;
        ApplicantName = $("#txtFirstName").val();

    } else {
        ApplicatantType = "Other";
        ddlIdentificationType = $("#ddlIdentificationType").val();
        IdentificationNumber = $("#txtIdentificationNumber").val();
        ApplicantName = $("#txtApplicantName").val();
    };


    var pState = "0";
    var pDistr = "0";
    var pTaluka = "0";
    var pVilge = "0";
    var chkAddress = $("#chkIsSameAddrsYes").is(":checked");
    if (chkAddress) {
        pState = $("#ddlState").val();
        pDistr = $("#ddlDistrict").val();
        pTaluka = $("#ddlBlockTaluka").val();
        pVilge = $("#ddlPanchayatVillageCity").val();
    } else {
        pState = $("#ddlPState").val();
        pDistr = $("#ddlPDistrict").val();
        pTaluka = $("#ddlPBlockTaluka").val();
        pVilge = $("#ddlPPanchayatVillageCity").val();
    }


    var ddlLocalPoliceStation = $("#ddlLocalPoliceStation").val();
    var txtLocalPoliceStation = $("#txtLocalPoliceStation").val();
    var policstation = "";
    if (ddlLocalPoliceStation == 0) {
        policstation = txtLocalPoliceStation;
    } else {
        policstation = txtLocalPoliceStation;
    }

    var isTrueInfo = "";
    if ($("#chkIsCorrectInfo").val() == "on") { isTrueInfo = "Yes" } else { isTrueInfo = "No" }

    var IsCriminalRecord = "";
    if ($("#chkIsCriminalRecordYes").is(":checked")) { IsCriminalRecord = "Yes"; } else { IsCriminalRecord = "No"; };

    var activeInPolitics = "";
    if ($("#chkIsActiveInPoliticsYes").is(":checked")) { activeInPolitics = "Yes"; } else { activeInPolitics = "No"; };

    var CriminalRecordDetails = "";
    CriminalRecordDetails = $("#txtCriminalRecordDetail").val();

    var perposeOfApply = "";
    perposeOfApply = $("#txtPerposeOfApply").val();

    var modeofreceiving = "";
    modeofreceiving = $("#ddlModeOfRecieving").val();

    var createdby = "";
    createdby = uid;




    var objUser = {};
    objUser =
        {
            "DistrictName": $("#ddlDistrict").val()
            , "TalukaName": $("#ddlBlockTaluka").val()

            , "ApplicantType": ApplicatantType
            , "ApplicantName": ApplicantName
            , "RelationWithBeneficiary": $("#ddlRelationType").val()
            , "IdentificationType": ddlIdentificationType
            , "IdentificationNumber": IdentificationNumber
            , "FirstName": $("#txtFirstName").val()
            , "MotherName": $("#txtMotherName").val()
            , "FatherName": $("#txtFatherName").val()
            , "DOB": $("#txtDOB").val()
            , "Age": $("#txtAge").val()
            , "Gender": $("#ddlGender").val()
            , "nationality": $("#txtnationality").val()
            , "MobileNo": $("#txtMobileNo").val()
            , "phoneno": $("#txtphoneno").val()
            , "EmailID": $("#txtEmailID").val()
            , "AddressLine1": $("#txtAddressLine1").val()
            , "AddressLine2": $("#txtAddressLine2").val()
            , "RoadStreetName": $("#txtRoadStreetName").val()
            , "LandMark": $("#txtLandMark").val()
            , "Locality": $("#txtLocality").val()
            , "State": $("#ddlState").val()
            , "District": $("#ddlDistrict").val()
            , "BlockTaluka": $("#ddlBlockTaluka").val()
            , "PanchayatVillageCity": $("#ddlPanchayatVillageCity").val()
            , "Pincode": $("#txtPincode").val()
            , "StayYear": $("#txtStayYear").val()
            , "StayMonth": $("#txtStayMonth").val()
            , "PAddressLine1": $("#txtPAddressLine1").val()
            , "PAddressLine2": $("#txtPAddressLine2").val()
            , "PRoadStreetName": $("#txtPRoadStreetName").val()
            , "PLandMark": $("#txtPLandMark").val()
            , "PLocality": $("#txtPLocality").val()
            , "PState": pState
            , "PDistrict": pDistr
            , "PBlockTaluka": pTaluka
            , "PPanchayatVillageCity": pVilge
            , "PPincode": $("#txtPPincode").val()
            , "PStayYear": $("#txtPStayYear").val()
            , "PStayMonth": $("#txtPStayMonth").val()
            , "Qualification": $("#hdfSuspectSave").val()
            , "Occupation": $("#txtOccupation").val()
            , "IdentificationMark": $("#txtIdentificationMark").val()
            , "Heigt": $("#txtHeigt").val()
            , "Weight": $("#txtWeight").val()
            , "ActiveInPolitics": activeInPolitics
            , "LocalPoliceStationDisct": $("#ddlLocalPoliceStationDisct").val()
            , "LocalPoliceStation": policstation
            , "IsCorrectInfo": isTrueInfo
            , "Place": $("#txtPlace").val()
            , "Date": $("#txtDate").val()

            , "IsCriminalRecord": IsCriminalRecord
            , "CriminalRecordDetail": CriminalRecordDetails
            , "PerposeOfApply": perposeOfApply
            , "ModeOfReceiving": modeofreceiving
            , "ServiceID": svcid
            , "ApplicantUID": uid

            , "DesignatedOfficer": ""
            , "AppellateAuthority": ""
            , "RevisionalAuthority": ""
            , "TimeLimit": ""

            , "CreatedBy": createdby
            , "Createdon": ""
            , "IsActive": true
            , "AppID": ""
            , "IsVarified": false

            , "CompanyName": $("#txtCompanyName").val()
            , "CompanyAddrs": $("#txtCompanyAddrs").val()
            , "CompanyPhone": $("#txtCompanyPhone").val()
            , "Desig": $("#txtDesig").val()
            , "JoingDate": $("#txtJoingDate").val()
        }

    var temp = 'Ravi';
    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(objUser, null, 4)
    };
    console.log(obj);
    $.when(
       $.ajax({
           type: "POST",
           contentType: "application/json; charset=utf-8",
           url: "/WebApp/Kiosk/CCTNS/CharacterCertificate.aspx/CharaterCertificates",
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

    var ApplicatantType = $('#ddlApplicantType').val();
    if (ApplicatantType == 2) {
        txtApplicantName
        var txtApplicantName = $("#txtApplicantName").val(); if (txtApplicantName == "" || txtApplicantName == null) { text += "<br /> -Please fill Applicant Name."; $("#txtApplicantName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtApplicantName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtApplicantName").attr('style', '1px solid #cdcdcd !important;'); $("#txtApplicantName").css({ "background-color": "#ffffff" }); }
        var ddlRelationType = $("#ddlRelationType").val(); if (ddlRelationType == 0) { text += "<br /> -Please Select Relation Type."; $("#ddlRelationType").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlRelationType").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlRelationType").attr('style', '1px solid #cdcdcd !important;'); $("#ddlRelationType").css({ "background-color": "#ffffff" }); }
        var IdentificationType = $("#ddlIdentificationType").val(); if (IdentificationType == 0) { text += "<br /> -Please Select Identification Type."; $("#ddlIdentificationType").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlIdentificationType").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlIdentificationType").attr('style', '1px solid #cdcdcd !important;'); $("#ddlIdentificationType").css({ "background-color": "#ffffff" }); }
        var IdentificationNumber = $("#txtIdentificationNumber").val(); if (IdentificationNumber == "" || IdentificationNumber == null) { text += "<br /> -Please fill Identification Number."; $("#txtIdentificationNumber").attr('style', 'border:1px solid #d03100 !important;'); $("#txtIdentificationNumber").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtIdentificationNumber").attr('style', '1px solid #cdcdcd !important;'); $("#txtIdentificationNumber").css({ "background-color": "#ffffff" }); }
    }

    var FirstName = $("#txtFirstName").val(); if (FirstName == "" || FirstName == null) { text += "<br /> -Please fill Beneficiary Name."; $("#txtFirstName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtFirstName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtFirstName").attr('style', '1px solid #cdcdcd !important;'); $("#txtFirstName").css({ "background-color": "#ffffff" }); }
    var txtMotherName = $("#txtMotherName").val(); if (txtMotherName == "" || txtMotherName == null) { text += "<br /> -Please fill Mother Name."; $("#txtMotherName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtMotherName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtMotherName").attr('style', '1px solid #cdcdcd !important;'); $("#txtMotherName").css({ "background-color": "#ffffff" }); }
    var FatherName = $("#txtFatherName").val(); if (FatherName == "" || FatherName == null) { text += "<br /> -Please fill Father Name."; $("#txtFatherName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtFatherName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtFatherName").attr('style', '1px solid #cdcdcd !important;'); $("#txtFatherName").css({ "background-color": "#ffffff" }); }
    var DOB = $("#txtDOB").val(); if (DOB == "" || DOB == null) { text += "<br /> -Please fill Date Of Birth."; $("#txtDOB").attr('style', 'border:1px solid #d03100 !important;'); $("#txtDOB").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtDOB").attr('style', '1px solid #cdcdcd !important;'); $("#txtDOB").css({ "background-color": "#ffffff" }); }
    var Gender = $("#ddlGender").val(); if (Gender == '-Select-' || Gender == "0") { text += "<br /> -Please Select Gender. "; $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlGender").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlGender").attr('style', 'border:1px solid #eee !important;'); $("#ddlGender").css({ "background-color": "#ffffff" }); }
    var txtMobileNo = $("#txtMobileNo").val(); if (txtMobileNo == '' || txtMobileNo == null) { text += "<br /> -Please fill Mobile Number."; $("#txtMobileNo").attr('style', 'border:1px solid #d03100 !important;'); $("#txtMobileNo").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtMobileNo").attr('style', '1px solid #eee !important;'); $("#txtMobileNo").css({ "background-color": "#ffffff" }); }
    var txtEmailID = $("#txtEmailID").val(); if (txtEmailID == "" || txtEmailID == null) { text += "<br /> -Please fill Email."; $("#txtEmailID").attr('style', 'border:1px solid #d03100 !important;'); $("#txtEmailID").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtEmailID").attr('style', '1px solid #cdcdcd !important;'); $("#txtEmailID").css({ "background-color": "#ffffff" }); }

    var txtAddressLine1 = $("#txtAddressLine1").val(); if (txtAddressLine1 == "" || txtAddressLine1 == null) { text += "<br /> -Please fill Permanent Address Line1."; $("#txtAddressLine1").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAddressLine1").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAddressLine1").attr('style', '1px solid #cdcdcd !important;'); $("#txtAddressLine1").css({ "background-color": "#ffffff" }); }
    var txtAddressLine2 = $("#txtAddressLine2").val(); if (txtAddressLine2 == "" || txtAddressLine2 == null) { text += "<br /> -Please fill Permanent Address Line2."; $("#txtAddressLine2").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAddressLine2").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAddressLine2").attr('style', '1px solid #cdcdcd !important;'); $("#txtAddressLine2").css({ "background-color": "#ffffff" }); }
    var txtRoadStreetName = $("#txtRoadStreetName").val(); if (txtRoadStreetName == "" || txtRoadStreetName == null) { text += "<br /> -Please fill Permanent Road Street Name."; $("#txtRoadStreetName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtRoadStreetName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtRoadStreetName").attr('style', '1px solid #cdcdcd !important;'); $("#txtRoadStreetName").css({ "background-color": "#ffffff" }); }
    var txtLandMark = $("#txtLandMark").val(); if (txtLandMark == "" || txtLandMark == null) { text += "<br /> -Please fill Permanent Land Mark."; $("#txtLandMark").attr('style', 'border:1px solid #d03100 !important;'); $("#txtLandMark").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtLandMark").attr('style', '1px solid #cdcdcd !important;'); $("#txtLandMark").css({ "background-color": "#ffffff" }); }

    var txtLocality = $("#txtLocality").val(); if (txtLocality == "" || txtLocality == null) { text += "<br /> -Please fill Permanent Locality."; $("#txtLocality").attr('style', 'border:1px solid #d03100 !important;'); $("#txtLocality").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtLocality").attr('style', '1px solid #cdcdcd !important;'); $("#txtLocality").css({ "background-color": "#ffffff" }); }
    var txtPincode = $("#txtPincode").val(); if (txtPincode == "" || txtPincode == null) { text += "<br /> -Please fill Permanent Pincode."; $("#txtPincode").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPincode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPincode").attr('style', '1px solid #cdcdcd !important;'); $("#txtPincode").css({ "background-color": "#ffffff" }); }
    var txtStayYear = $("#txtStayYear").val(); if (txtStayYear == "" || txtStayYear == null) { text += "<br /> -Please fill Permanent StayYear."; $("#txtStayYear").attr('style', 'border:1px solid #d03100 !important;'); $("#txtStayYear").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtStayYear").attr('style', '1px solid #cdcdcd !important;'); $("#txtStayYear").css({ "background-color": "#ffffff" }); }
    //var txtStayMonth = $("#txtStayMonth").val(); if (txtStayMonth == "" || txtStayMonth == null) { text += "<br /> -Please fill Permanent Stay Month."; $("#txtStayMonth").attr('style', 'border:1px solid #d03100 !important;'); $("#txtStayMonth").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtStayMonth").attr('style', '1px solid #cdcdcd !important;'); $("#txtStayMonth").css({ "background-color": "#ffffff" }); }

    var ddlState = $("#ddlState").val(); if (ddlState == '-Select-' || ddlState == "0") { text += "<br /> -Please Select Permanent State . "; $("#ddlState").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlState").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlState").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlState").css({ "background-color": "#ffffff" }); }
    var ddlDistrict = $("#ddlDistrict").val(); if (ddlDistrict == '-Select-' || ddlDistrict == "0") { text += "<br /> -Please Select Permanent District. "; $("#ddlDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlDistrict").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlDistrict").css({ "background-color": "#ffffff" }); }
    var ddlBlockTaluka = $("#ddlBlockTaluka").val(); if (ddlBlockTaluka == '-Select-' || ddlBlockTaluka == "0") { text += "<br /> -Please Select Permanent Block/Taluka. "; $("#ddlBlockTaluka").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlBlockTaluka").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlBlockTaluka").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlBlockTaluka").css({ "background-color": "#ffffff" }); }
    var ddlPanchayatVillageCity = $("#ddlPanchayatVillageCity").val(); if (ddlPanchayatVillageCity == '-Select-' || ddlPanchayatVillageCity == "0") { text += "<br /> -Please Select Permanent Village/City/Panchayat. "; $("#ddlPanchayatVillageCity").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlPanchayatVillageCity").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlPanchayatVillageCity").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlPanchayatVillageCity").css({ "background-color": "#ffffff" }); }

    //checkIsSameAddrss();

    var chkAddress = $("#chkIsSameAddrsYes").is(":checked");
    if (chkAddress) {
        //alert("if");
        $("#txtPAddressLine1").prop("disabled", true);
        $("#txtPAddressLine2").prop("disabled", true);
        $("#txtPRoadStreetName").prop("disabled", true);
        $("#txtPLandMark").prop("disabled", true);
        $("#txtPLocality").prop("disabled", true);
        $("#txtPPincode").prop("disabled", true);
        $("#txtPStayYear").prop("disabled", true);

        $('#ddlPState').prop("disabled", true);
        $("#ddlPState").hide();
        $('#txtPState').prop("disabled", true);
        $("#txtPState").show();

        $('#ddlPDistrict').prop("disabled", true);
        $("#ddlPDistrict").hide();
        $('#txtPDistrict').prop("disabled", true);
        $("#txtPDistrict").show();

        $('#ddlPBlockTaluka').prop("disabled", true);
        $("#ddlPBlockTaluka").hide();
        $('#txtPBlockTaluka').prop("disabled", true);
        $("#txtPBlockTaluka").show();

        $('#ddlPPanchayatVillageCity').prop("disabled", true);
        $("#ddlPPanchayatVillageCity").hide();
        $('#txtPPanchayatVillageCity').prop("disabled", true);
        $("#txtPPanchayatVillageCity").show();


        $("#txtPAddressLine1").prop("disabled", true);
        $("#txtPAddressLine2").prop("disabled", true);
        $("#txtPRoadStreetName").prop("disabled", true);
        $("#txtPLandMark").prop("disabled", true);
        $("#txtPLocality").prop("disabled", true);
        $("#txtPPincode").prop("disabled", true);
        $("#txtPStayYear").prop("disabled", true);


        $("#txtPAddressLine1").attr('style', '1px solid #eee !important;'); $("#txtPAddressLine1").css({ "background-color": "#eee" });
        $("#txtPAddressLine2").attr('style', '1px solid #eee !important;'); $("#txtPAddressLine2").css({ "background-color": "#eee" });
        $("#txtPRoadStreetName").attr('style', '1px solid #eee !important;'); $("#txtPRoadStreetName").css({ "background-color": "#eee" });
        $("#txtPLandMark").attr('style', '1px solid #eee !important;'); $("#txtPLandMark").css({ "background-color": "#eee" });
        $("#txtPLocality").attr('style', '1px solid #eee !important;'); $("#txtPLocality").css({ "background-color": "#eee" });
        $("#txtPPincode").attr('style', '1px solid #eee !important;'); $("#txtPPincode").css({ "background-color": "#eee" });
        $("#txtPStayYear").attr('style', '1px solid #eee !important;'); $("#txtPStayYear").css({ "background-color": "#eee" });

    }
    else {
        //alert("else");
        var txtPAddressLine1 = $("#txtPAddressLine1").val(); if (txtPAddressLine1 == "" || txtPAddressLine1 == null) { text += "<br /> -Please fill Present Address Line1."; $("#txtPAddressLine1").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPAddressLine1").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPAddressLine1").attr('style', '1px solid #cdcdcd !important;'); $("#txtPAddressLine1").css({ "background-color": "#ffffff" }); }
        var txtPAddressLine2 = $("#txtPAddressLine2").val(); if (txtPAddressLine2 == "" || txtPAddressLine2 == null) { text += "<br /> -Please fill Present Address Line2."; $("#txtPAddressLine2").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPAddressLine2").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPAddressLine2").attr('style', '1px solid #cdcdcd !important;'); $("#txtPAddressLine2").css({ "background-color": "#ffffff" }); }
        var txtPRoadStreetName = $("#txtPRoadStreetName").val(); if (txtPRoadStreetName == "" || txtPRoadStreetName == null) { text += "<br /> -Please fill Present Road Street Name."; $("#txtPRoadStreetName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPRoadStreetName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPRoadStreetName").attr('style', '1px solid #cdcdcd !important;'); $("#txtPRoadStreetName").css({ "background-color": "#ffffff" }); }
        var txtPLandMark = $("#txtPLandMark").val(); if (txtPLandMark == "" || txtPLandMark == null) { text += "<br /> -Please fill Present Land Mark."; $("#txtPLandMark").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPLandMark").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPLandMark").attr('style', '1px solid #cdcdcd !important;'); $("#txtPLandMark").css({ "background-color": "#ffffff" }); }
        var txtPLocality = $("#txtPLocality").val(); if (txtPLocality == "" || txtPLocality == null) { text += "<br /> -Please fill Present Locality."; $("#txtPLocality").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPLocality").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPLocality").attr('style', '1px solid #cdcdcd !important;'); $("#txtPLocality").css({ "background-color": "#ffffff" }); }
        var txtPPincode = $("#txtPPincode").val(); if (txtPPincode == "" || txtPPincode == null) { text += "<br /> -Please fill Present Pincode."; $("#txtPPincode").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPPincode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPPincode").attr('style', '1px solid #cdcdcd !important;'); $("#txtPPincode").css({ "background-color": "#ffffff" }); }
        var txtPStayYear = $("#txtPStayYear").val(); if (txtPStayYear == "" || txtPStayYear == null) { text += "<br /> -Please fill Present Stay Year."; $("#txtPStayYear").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPStayYear").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPStayYear").attr('style', '1px solid #cdcdcd !important;'); $("#txtPStayYear").css({ "background-color": "#ffffff" }); }


        $("#txtPState").hide();
        $("#txtPDistrict").hide();
        $("#txtPBlockTaluka").hide();
        $("#txtPPanchayatVillageCity").hide();



        var ddlPState = $("#ddlPState").val(); if (ddlPState == '-Select-' || ddlPState == "0") { text += "<br /> -Please Select Current State. "; $("#ddlPState").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlPState").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlPState").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlPState").css({ "background-color": "#ffffff  " }); }
        var ddlPDistrict = $("#ddlPDistrict").val(); if (ddlPDistrict == '-Select-' || ddlPDistrict == "0") { text += "<br /> -Please Select Current District. "; $("#ddlPDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlPDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlPDistrict").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlPDistrict").css({ "background-color": "#ffffff  " }); }
        var ddlPBlockTaluka = $("#ddlPBlockTaluka").val(); if (ddlPBlockTaluka == '-Select-' || ddlPBlockTaluka == "0") { text += "<br /> -Please Select Current Block/Taluka. "; $("#ddlPBlockTaluka").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlPBlockTaluka").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlPBlockTaluka").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlPBlockTaluka").css({ "background-color": "#ffffff  " }); }
        var ddlPPanchayatVillageCity = $("#ddlPPanchayatVillageCity").val(); if (ddlPPanchayatVillageCity == '-Select-' || ddlPPanchayatVillageCity == "0") { text += "<br /> -Please Select Current Panchayat/Village/City. "; $("#ddlPPanchayatVillageCity").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlPPanchayatVillageCity").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlPPanchayatVillageCity").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlPPanchayatVillageCity").css({ "background-color": "#ffffff" }); }


    }




    var chkIsOccupationYes = $("#chkIsOccupationYes").is(":checked");
    if (chkIsOccupationYes) {
        var txtCompanyName = $("#txtCompanyName").val(); if (txtCompanyName == "" || txtCompanyName == null) { text += "<br /> -Please fill Company Name."; $("#txtCompanyName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCompanyName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCompanyName").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyName").css({ "background-color": "#ffffff" }); }
        var txtCompanyAddrs = $("#txtCompanyAddrs").val(); if (txtCompanyAddrs == "" || txtCompanyAddrs == null) { text += "<br /> -Please fill Company Addrs."; $("#txtCompanyAddrs").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCompanyAddrs").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCompanyAddrs").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyAddrs").css({ "background-color": "#ffffff" }); }
        var txtCompanyPhone = $("#txtCompanyPhone").val(); if (txtCompanyPhone == "" || txtCompanyPhone == null) { text += "<br /> -Please fill Company Phone."; $("#txtCompanyPhone").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCompanyPhone").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCompanyPhone").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyPhone").css({ "background-color": "#ffffff" }); }
        var txtDesig = $("#txtDesig").val(); if (txtDesig == "" || txtDesig == null) { text += "<br /> -Please fill designation."; $("#txtDesig").attr('style', 'border:1px solid #d03100 !important;'); $("#txtDesig").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtDesig").attr('style', '1px solid #cdcdcd !important;'); $("#txtDesig").css({ "background-color": "#ffffff" }); }
        var txtJoingDate = $("#txtJoingDate").val(); if (txtJoingDate == "" || txtJoingDate == null) { text += "<br /> -Please select Joing Date."; $("#txtJoingDate").attr('style', 'border:1px solid #d03100 !important;'); $("#txtJoingDate").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtJoingDate").attr('style', '1px solid #cdcdcd !important;'); $("#txtJoingDate").css({ "background-color": "#ffffff" }); }
    }
    else {
        $("#txtCompanyName").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyName").css({ "background-color": "#ffffff" });
        $("#txtCompanyAddrs").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyAddrs").css({ "background-color": "#ffffff" });
        $("#txtCompanyPhone").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyPhone").css({ "background-color": "#ffffff" });
        $("#txtDesig").attr('style', '1px solid #cdcdcd !important;'); $("#txtDesig").css({ "background-color": "#ffffff" });
        $("#txtJoingDate").attr('style', '1px solid #cdcdcd !important;'); $("#txtJoingDate").css({ "background-color": "#ffffff" });
    }

    var txtPerposeOfApply = $("#txtPerposeOfApply").val(); if (txtPerposeOfApply == "" || txtPerposeOfApply == null) { text += "<br /> -Please fill Perpose Of Apply."; $("#txtPerposeOfApply").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPerposeOfApply").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPerposeOfApply").attr('style', '1px solid #cdcdcd !important;'); $("#txtPerposeOfApply").css({ "background-color": "#ffffff" }); }
    var ddlModeOfRecieving = $("#ddlModeOfRecieving").val(); if (ddlModeOfRecieving == 0) { text += "<br /> -Please Select Mode Of Recieving."; $("#ddlModeOfRecieving").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlModeOfRecieving").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlModeOfRecieving").attr('style', '1px solid #cdcdcd !important;'); $("#ddlModeOfRecieving").css({ "background-color": "#ffffff" }); }

    var ddlLocalPoliceStationDisct = $("#ddlLocalPoliceStationDisct").val(); if (ddlLocalPoliceStationDisct == 0) { text += "<br /> -Please Select Local Police Station District."; $("#ddlLocalPoliceStationDisct").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlLocalPoliceStationDisct").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlLocalPoliceStationDisct").attr('style', '1px solid #cdcdcd !important;'); $("#ddlLocalPoliceStationDisct").css({ "background-color": "#ffffff" }); }
    var ddlLocalPoliceStation = $("#ddlLocalPoliceStation").val();
    var txtLocalPoliceStation = $("#txtLocalPoliceStation").val();
    if (ddlLocalPoliceStation == 0 && (txtLocalPoliceStation == "" || txtLocalPoliceStation == null)) {
        text += "<br /> -Please Select Local Police Station District.";
        $("#txtLocalPoliceStation").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtLocalPoliceStation").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtLocalPoliceStation").attr('style', '1px solid #cdcdcd !important;');
        $("#txtLocalPoliceStation").css({ "background-color": "#ffffff" });
    }

    var txtPlace = $("#txtPlace").val(); if (txtPlace == "" || txtPlace == null) { text += "<br /> -Please fill Place."; $("#txtPlace").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPlace").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPlace").attr('style', '1px solid #cdcdcd !important;'); $("#txtPlace").css({ "background-color": "#ffffff" }); }
    var txtDate = $("#txtDate").val(); if (txtDate == "" || txtDate == null) { text += "<br /> -Please select Date."; $("#txtDate").attr('style', 'border:1px solid #d03100 !important;'); $("#txtDate").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtDate").attr('style', '1px solid #cdcdcd !important;'); $("#txtDate").css({ "background-color": "#ffffff" }); }

    var IsCriminalRecord = $("#chkIsCriminalRecordYes").is(":checked");
    if (IsCriminalRecord) {
        var CriminalRecordDetail = $("#txtCriminalRecordDetail").val(); if (CriminalRecordDetail == "" || CriminalRecordDetail == null) { text += "<br /> -Please fill Criminal Record Detail."; $("#txtCriminalRecordDetail").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCriminalRecordDetail").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCriminalRecordDetail").attr('style', '1px solid #cdcdcd !important;'); $("#txtCriminalRecordDetail").css({ "background-color": "#ffffff" }); }
    } else {
        $("#txtCriminalRecordDetail").attr('style', '1px solid #cdcdcd !important;');
        $("#txtCriminalRecordDetail").css({ "background-color": "#eee" });
    }


    var chkIsCorrectInfo = $("#chkIsCorrectInfo").is(":checked");
    if (!chkIsCorrectInfo) {
        opt = 1;
        text += "<br /> -Please Check Information decleration checkbox. ";
        $("#divPassMI").css({ "background-color": "#fff2ee" });
        $("#divPassMI").attr('style', 'border:1px solid #d03100 !important;');
    } else { $("#divPassMI").attr('style', 'border:1px solid #E4E4E4 !important;'); $("#divPassMI").css({ "background-color": "#E4E4E4" }); }


    if (text != "" || opt == 1) {
        alert(text);
        //alertPopup("Please fill following information.", text);
        return false;
    }
    return true;

}

function fuShowHideDiv(divID, isTrue) {
    //debugger;
    if (isTrue == "1") {
        $('#' + divID).show(500);
    }
    if (isTrue == "0") {
        hidedive();
        $('#' + divID).hide(500);
    }
}
function hidedive() {
    debugger;
    var reserved = $("input[name='HaveQualification']:checked").val();
    var working = $("input[name='Isworking']:checked").val();
    if (reserved == "No") {
        $('#QualificationDtl').hide(500);
    }
    if (working == "No") {
        $('#OccupationDtl').hide(500);
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
function checkmobile() {
    var text = "";
    var opt = "";
    var mobileno = $("#ContentPlaceHolder1_BMobile").val();
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


function GetState() {
    var SelState = $('#ddlState');
    var SelState1 = $('#ddlPState');
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/CharacterCertificate.aspx/GetState",
        data: '{}',
        dataType: "json",
        success: function (r) {
            SelState.empty().append('<option selected="selected" value="0">-Select State-</option>');
            SelState1.empty().append('<option selected="selected" value="0">-Select State-</option>');
            $.each($.parseJSON(r.d), function () {
                $(SelState).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelState1).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetDistrict(ddlstate, ddlDistict) {
    var SelState = $(ddlstate).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/CharacterCertificate.aspx/GetDistrict",
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlDistict);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlDistict).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetTaluka(ddl, ddlblock) {
    var SelBlock1 = $(ddl).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/CharacterCertificate.aspx/GetSubDistrict",
        data: '{"prefix":"","DistrictCode":"' + SelBlock1 + '"}',
        dataType: "json",
        success: function (r) {

            var ddlCustomer1 = $(ddlblock);
            ddlCustomer1.empty().append('<option selected="selected" value="0">-Select SubDistrict-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlblock).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetPanchayat(ddl, ddlPanchayat) {

    var SelSubDistrict = $(ddl).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/CharacterCertificate.aspx/GetVillage",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlPanchayat);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Gram Panchayat-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlPanchayat).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetDistrictPloiceStations() {
    //debugger;
    var SelDistrict = $('#ddlLocalPoliceStationDisct').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CCTNS/CharacterCertificate.aspx/GetDistrictPloiceStation',
        data: '{"prefix":"","DistrictCode":"' + SelDistrict + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            //alert(Category);
            var ddlps = $("[id=ddlLocalPoliceStation]");
            if (Category == '' || Category == undefined || undefined == null) {
                $("#ddlLocalPoliceStation").hide();
                $("#txtLocalPoliceStation").show();
            } else {
                $("#ddlLocalPoliceStation").show();
                $("#txtLocalPoliceStation").hide();
                ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
                $.each(Category, function () {
                    $("[id=ddlLocalPoliceStation]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    catCount++;
                });
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


// Add Dynamic Table Row
function AddSuspect(DeleteString) {
    debugger;
    if (validateSuspectValues(DeleteString) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strColName = "";
        var strExam = "";
        var strYear = "";
        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {

            strColName = $('#txtColName').val();
            strExam = $('#txtExam').val();
            strYear = $("#txtYear").val();
            var hdfsuspact = $('#hdfSuspect').val();
            strTempString = hdfsuspact + "#" + SrNo + "," + strColName + "," + strExam + "," + strYear + "#";
        }
        else {
            strTempString = $('#hdfSuspect').val();
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Name Of School/Collage</th>";
        Str = Str + "<th style='text-align: center;'>Exam Passed</th>";
        Str = Str + "<th style='text-align: center;'>Year</th>";
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
            strColName = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strExam = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strYear = RemStr;
            var DeleteString = "#" + SrNo + "," + strColName + "," + strExam + "," + strYear + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strColName + "</td>";
            Str = Str + "<td style='' >" + strExam + "</td>";
            Str = Str + "<td style='' >" + strYear + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";
            strSuspect = strSuspect + "#" + SrNo + "," + strColName + "," + strExam + "," + strYear + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strColName + "," + strExam + "," + strYear + "#";
            var HeirsDXML = strSaveSuspect;
            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
        }

        $("#thtxtAccused").hide();
        $("#thtxtAddress").hide();
        $("#thadd").hide();

        Str = Str + "</table>";
        $("#divSuspect").html(Str);
        $("#hdfSuspect").val(strSuspect);
        $("#hdfSuspectSave").val(strSaveSuspect);
        $("hdfSuspectString").val(intCount);



        strColName = $('#txtColName').val("").focus();
        strExam = $('#txtExam').val("");
        strYear = $("#txtYear").val("");

    }
    //alert($("#hdfSuspectSave").val())
}
// Delete Dynamic Table Row
function DelString(DeleteString) {
    var Msg = "Do you want remove this Suspect?";
    if (confirm(Msg)) {
        var strString = $('#hdfSuspect').val();
        strString = strString.replace(DeleteString, "");
        $('#hdfSuspect').val(strString);
        AddSuspect(DeleteString);
    }
}
// Valildate Dynamic Table Row
function validateSuspectValues(DeleteString) {
    //debugger;
    if (DeleteString != '') { return true; }
    var strName = "", strExam = "", strYear = "", text = "", opt = "";
    var strName = $("#txtColName").val(); if (strName == "") { text += "<br /> -Please fill College/School Name."; $("#txtColName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtColName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtColName").attr('style', '1px solid #eee !important;'); $("#txtColName").css({ "background-color": "#ffffff" }); }
    var strExam = $("#txtExam").val(); if (strExam == "") { text += "<br /> -Please fill Exam Name."; $("#txtExam").attr('style', 'border:1px solid #d03100 !important;'); $("#txtExam").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtExam").attr('style', '1px solid #eee !important;'); $("#txtExam").css({ "background-color": "#ffffff" }); }
    var strYear = $("#txtYear").val(); if (strYear == "") { text += "<br /> -Please fill Passing/Current Year."; $("#txtYear").attr('style', 'border:1px solid #d03100 !important;'); $("#txtYear").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtYear").attr('style', '1px solid #eee !important;'); $("#txtYear").css({ "background-color": "#ffffff" }); }
    if (opt == "1") { return false; }
    return true;
}