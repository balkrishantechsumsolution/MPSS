$(document).ready(function () {

    $('#myModal').modal({
        backdrop: 'static',
        keyboard: false
    });
    $('#SpouseDtl').hide();

    $("#divROR").hide();
    $("#rdoRORY").change(function () {
        if (this.checked) {
            $("#divROR").show(1000);
        }
    });
    $("#rdoRORN").change(function () {
        if (this.checked) {
            $("#divROR").hide(1000);
        }
    });

    $('#chkAddress').change(function () {
        if ($(this).is(":checked")) {
            $("#ddlCArea").val($("#ddlArea").val());
            $('#ddlCArea').prop("disabled", true);

            $("#txtCAddressLine1").val($("#txtAddressLine1").val());
            $('#txtCAddressLine1').prop("disabled", true);

            $("#txtCAddressLine2").val($("#txtAddressLine2").val());
            $('#txtCAddressLine2').prop("disabled", true);

            $("#txtCRoadStreetName").val($("#txtRoadStreetName").val());
            $('#txtCRoadStreetName').prop("disabled", true);

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

            $("#ddlCSubdivision").val($("#ddlSubdivision").val());
            if ($("#ddlSubdivision").val() == "0") {
                $("#txtCSubdivision").val("");
            }
            else {
                $("#txtCSubdivision").val($("#ddlSubdivision option:selected").text());
            }
            $("#txtCSubdivision").show();
            $("#ddlCSubdivision").hide();
            $('#txtCSubdivision').prop("disabled", true);


            $("#ddlCTehsil").val($("#ddlTehsil").val());
            if ($("#ddlTehsil").val() == "0") {
                $("#txtCTehsil").val("");
            }
            else {
                $("#txtCTehsil").val($("#ddlTehsil option:selected").text());
            }

            $("#txtCTehsil").show();
            $("#ddlCTehsil").hide();
            $('#txtCTehsil').prop("disabled", true);


            $("#ddlCRI").val($("#ddlRI").val());
            if ($("#ddlRI").val() == "0") {
                $("#txtCRI").val("");
            }
            else {
                $("#txtCRI").val($("#ddlRI option:selected").text());
            }
            $("#txtCRI").show();
            $("#ddlCRI").hide();
            $('#txtCRI').prop("disabled", true);


            $("#ddlCTaluka").val($("#ddlTaluka").val());
            if ($("#ddlTaluka").val() == "0") {
                $("#txtCTaluka").val("");
            }
            else {
                $("#txtCTaluka").val($("#ddlTaluka option:selected").text());
            }

            $("#txtCTaluka").show();
            $("#ddlCTaluka").hide();
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
            $("#ddlCArea").val("0");
            $('#ddlCArea').prop("disabled", false);

            $("#txtCAddressLine1").val("");
            $('#txtCAddressLine1').prop("disabled", false);

            $("#txtCAddressLine2").val("");
            $('#txtCAddressLine2').prop("disabled", false);

            $("#txtCRoadStreetName").val("");
            $('#txtCRoadStreetName').prop("disabled", false);

            $("#ddlCDistrict").val("0");
            $('#ddlCDistrict').prop("disabled", false);

            $("#txtCDistrict").val("");
            $('#txtCAddressLine1').prop("disabled", false);

            $("#txtCDistrict").hide();
            $("#ddlCDistrict").show();

            $("#ddlCSubdivision").val("0");
            $('#ddlCSubdivision').prop("disabled", false);


            $("#txtCSubdivision").val("");
            $('#txtCSubdivision').prop("disabled", false);

            $("#txtCSubdivision").hide();
            $("#ddlCSubdivision").show();


            $("#ddlCTehsil").val("0");
            $('#ddlCTehsil').prop("disabled", false);
            $("#txtCTehsil").val("");
            $('#txtCTehsil').prop("disabled", false);
            $("#txtCTehsil").hide();
            $("#ddlCTehsil").show();


            $("#ddlCRI").val("0");
            $('#ddlCRI').prop("disabled", false);
            $("#txtCRI").val("");
            $('#txtCRI').prop("disabled", false);
            $("#txtCRI").hide();
            $("#ddlCRI").show();


            $("#ddlCTaluka").val("0");
            $('#ddlCTaluka').prop("disabled", false);
            $("#txtCTaluka").val("");
            $('#txtCTaluka').prop("disabled", false);
            $("#txtCTaluka").hide();
            $("#ddlCTaluka").show();


            $("#txtCVillage").val("");
            $('#txtCVillage').prop("disabled", false);

            $("#txtCPGPULB").val("");
            $('#txtCPGPULB').prop("disabled", false);

            $("#txtCPPoliceStation").val("");
            $('#txtCPPoliceStation').prop("disabled", false);

            $("#txtCPPostOffice").val("");
            $('#txtCPPostOffice').prop("disabled", false);

            $("#txtCPPinCode").val("");
            $('#txtCPPinCode').prop("disabled", false);

        };
    });

    $("#txtResidingDtlYear").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid || val > 100) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    });

    BindDatePickers();
    BindAddress();

    $("#txtIdentificationNumber").prop("disabled", true);
    var IdentificationType = "";
    $("#txtIdentificationNumber").attr("maxlength", "16");
    $("#btnverify").hide();
    $('#ddlIdentificationType').change(function (e) {
        $("#txtIdentificationNumber").val("");
        if ($("#ddlIdentificationType").val() == 0) {
            $("#txtIdentificationNumber").prop("disabled", true);
        } else {
            $("#txtIdentificationNumber").prop("disabled", false);
        }

        IdentificationType = $('#ddlIdentificationType').val();
        if (IdentificationType == 1) { $("#txtIdentificationNumber").attr("maxlength", "12"); $("#btnverify").show(); }
        else if (IdentificationType == 4) { $("#txtIdentificationNumber").attr("maxlength", "10"); }
        else {
            $("#txtIdentificationNumber").attr("maxlength", "16");
            $("#btnverify").hide();
        }
    });


    $("#txtIdentificationNumber").on("keyup", function () {
        this.value = this.value.toUpperCase();
        if ($('#ddlIdentificationType').val() == 1) {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        } else if ($('#ddlIdentificationType').val() == 4) {
            //fnValidatePAN(this);
        };
    })

    $("#txtIdentificationNumber").attr("maxlength", "12");

    $("#ddlMaritalStatus").change(function () {
        var result = this.value;
        var gender = $("#ddlGender").val();
        if (result == "2" || result == "3") {
            $('#SpouseDtl').show();
            if (gender == 'M') {
                $("#ddlSpouseRelation").val('2')
            }
            if (gender == 'F') {
                $("#ddlSpouseRelation").val('1')
            }
            if (gender == 'T') {
                $("#ddlSpouseRelation").val('3')
            }
        } else {
            $('#SpouseDtl').hide();
            $("#ddlSpouseRelation").val('0')
            //$("#ddlSpouseRelation").prop("disabled", false)
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

// Start retrive Verified Aadhar Data
function BindAadhaarData() {
    if ($('#HFUIDData').val() != "" && $('#HFUIDData').val() != null) {
        var obj = jQuery.parseJSON($('#HFUIDData').val());

        console.log(obj);

        if (obj["residentName"] != "" && obj["residentName"] != null) {
            $('#txtFirstName').val(obj["residentName"])
            $('#txtFirstName').prop("disabled", true)
        }
        //if (obj["residentName"] != "" && obj["residentName"] != null) {
        //    $('#txtMiddleName').val(obj["residentName"].split(" ")[1])
        //    $('#txtMiddleName').prop("disabled", true)
        //}
        //if (obj["residentName"] != "" && obj["residentName"] != null) {
        //    $('#txtLastName').val(obj["residentName"].split(" ")[2])
        //    $('#txtLastName').prop("disabled", true)
        //}

        var careOf = obj["careOf"].replace("S/O ", "");
        if (careOf != "" && careOf != null) {
            $('#txtFatherFName').val(careOf)
            $('#txtFatherFName').prop("disabled", true)
        }
        //if (careOf != "" && careOf != null) {
        //    $('#txtFatherMName').val(careOf.split(" ")[1])
        //    $('#txtFatherMName').prop("disabled", true)
        //}
        //if (careOf != "" && careOf != null) {
        //    $('#txtFatherLName').val(careOf.split(" ")[2])
        //    $('#txtFatherLName').prop("disabled", true)
        //}

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
    //if (obj["landmark"] != "" && obj["landmark"] != null) {
    //    $('#txtLandMark').val(obj["landmark"])
    //    $('#txtLandMark').prop("disabled", true)
    //}
    if (obj["street"] != "" && obj["street"] != null) {
        $('#txtRoadStreetName').val(obj["street"])
        $('#txtRoadStreetName').prop("disabled", true)
    }

    //if (obj["locality"] != "" && obj["locality"] != null) {
    //    $('#txtLocality').val(obj["locality"])
    //    $('#txtLocality').prop("disabled", true)
    //}

    //if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
    //    $('#txtState').show();
    //    $('#txtState').val(obj["state"])
    //    $('#txtState').prop("disabled", true);
    //    $('#ddlState').hide();
    //}
    //else {
    //    $('#ddlState').show();
    //}
    //if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] == "Odisha" && obj["state"] != null) {
    //    $('#txtDistrict').show();
    //    $('#txtDistrict').val(obj["district"])
    //    $('#txtDistrict').prop("disabled", true);
    //    $('#ddlDistrict').hide();
    //}
    //else {
    //    $('#ddlDistrict').show();
    //}
    //if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null) {
    //    $('#txtSubdivision').show();
    //    $('#txtSubdivision').val(obj["subDistrict"])
    //    $('#txtSubdivision').prop("disabled", true);
    //    $('#ddlSubdivision').hide();
    //}
    //else {
    //    $('#ddlSubdivision').show();
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
        $('#txtPinCode').val(obj["pincode"])
        $('#txtPinCode').prop("disabled", true)
    }
}
// End retrive Verified Aadhar Data

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

            if (obj[0]["APPLICENT_F_NAME"] != "" && obj[0]["APPLICENT_F_NAME"] != null) {
                $('#txtFirstName').val(obj[0]["APPLICENT_F_NAME"])
                $('#txtFirstName').prop("disabled", true)
            }
            //if (obj[0]["APPLICENT_M_NAME"] != "" && obj[0]["APPLICENT_M_NAME"] != null) {
            //    $('#txtMiddleName').val(obj[0]["APPLICENT_M_NAME"])
            //    $('#txtMiddleName').prop("disabled", true)
            //}
            //if (obj[0]["APPLICENT_L_NAME"] != "" && obj[0]["APPLICENT_L_NAME"] != null) {
            //    $('#txtLastName').val(obj[0]["APPLICENT_L_NAME"])
            //    $('#txtLastName').prop("disabled", true)
            //}

            if (obj[0]["FATHER_F_NAME"] != "" && obj[0]["FATHER_F_NAME"] != null) {
                $('#txtFatherFName').val(obj[0]["FATHER_F_NAME"])
                $('#txtFatherFName').prop("disabled", true)
            }
            //if (obj[0]["FATHER_M_NAME"] != "" && obj[0]["FATHER_M_NAME"] != null) {
            //    $('#txtFatherMName').val(obj[0]["FATHER_M_NAME"])
            //    $('#txtFatherMName').prop("disabled", true)
            //}
            //if (obj[0]["FATHER_L_NAME"] != "" && obj[0]["FATHER_L_NAME"] != null) {
            //    $('#txtFatherLName').val(obj[0]["FATHER_L_NAME"])
            //    $('#txtFatherLName').prop("disabled", true)
            //}

            if (obj[0]["MOTHER_F_NAME"] != "" && obj[0]["MOTHER_F_NAME"] != null) {
                $('#txtMotherFName').val(obj[0]["MOTHER_F_NAME"])
                $('#txtMotherFName').prop("disabled", true)
            }
            //if (obj[0]["MOTHER_M_NAME"] != "" && obj[0]["MOTHER_M_NAME"] != null) {
            //    $('#txtMotherMName').val(obj[0]["MOTHER_M_NAME"])
            //    $('#txtMotherMName').prop("disabled", true)
            //}
            //if (obj[0]["MOTHER_L_NAME"] != "" && obj[0]["MOTHER_L_NAME"] != null) {
            //    $('#txtMotherLName').val(obj[0]["MOTHER_L_NAME"])
            //    $('#txtMotherLName').prop("disabled", true)
            //}

            if (obj[0]["APPLICENT_DOB"] != "0" && obj[0]["APPLICENT_DOB"] != null) {
                $('#txtDOB').val(obj[0]["APPLICENT_DOB"])
                $('#txtDOB').prop("disabled", true)
            }
            if (obj[0]["APPLICENT_AGE"] != "" && obj[0]["APPLICENT_AGE"] != null) {
                $('#txtAge').val(obj[0]["APPLICENT_AGE"])
                $('#txtAge').prop("disabled", true)
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
                $('#txtEmailID').val(obj[0]["APPLICENT_EMAIL"])
                $('#txtEmailID').prop("disabled", true)
            }
            if (obj[0]["APPLICENT_MOBILE"] != "" && obj[0]["APPLICENT_MOBILE"] != null) {
                $('#txtMobileNo').val(obj[0]["APPLICENT_MOBILE"])
                $('#txtMobileNo').prop("disabled", true)
            }
            if (obj[0]["APPLICENT_STDCODE"] != "" && obj[0]["APPLICENT_STDCODE"] != "0" && obj[0]["APPLICENT_STDCODE"] != null) {
                $('#txtStdCode').val(obj[0]["APPLICENT_STDCODE"])
                $('#txtStdCode').prop("disabled", true)
            }
            if (obj[0]["APPLICENT_PHONE"] != "" && obj[0]["APPLICENT_PHONE"] != null) {
                $('#txtPhone').val(obj[0]["APPLICENT_PHONE"])
                $('#txtPhone').prop("disabled", true)
            }

            BindLocalDataAddress(obj[0]);
        }
    });
}
function BindLocalDataAddress(obj) {
    //parmanent Address:
    if (obj["APPLICENT_ADD1"] != "" && obj["APPLICENT_ADD1"] != null) {
        $('#txtAddressLine1').val(obj["APPLICENT_ADD1"])
        $('#txtAddressLine1').prop("disabled", true)
    }
    if (obj["APPLICENT_ADD2"] != "" && obj["APPLICENT_ADD2"] != null) {
        $('#txtAddressLine2').val(obj["APPLICENT_ADD2"])
        $('#txtAddressLine2').prop("disabled", true)
    }
    //if (obj["PLANDMARK"] != "" && obj["PLANDMARK"] != null) {
    //    $('#txtLandMark').val(obj["PLANDMARK"])
    //    $('#txtLandMark').prop("disabled", true)
    //}
    if (obj["APPLICENT_ROAD"] != "" && obj["APPLICENT_ROAD"] != null) {
        $('#txtRoadStreetName').val(obj["APPLICENT_ROAD"])
        $('#txtRoadStreetName').prop("disabled", true)
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
        $("#ddlDistrict").prop("disabled", true)
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
        $("#ddlSubdivision").prop("disabled", true)
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
        $('#txtPinCode').val(obj["APPLICENT_PINCODE"])
        $('#txtPinCode').prop("disabled", true)
    }


    // Present Address
    if (obj["APPLICENT_CADD1"] != "" && obj["APPLICENT_CADD1"] != null) {
        $('#txtCAddressLine1').val(obj["APPLICENT_CADD1"])
        $('#txtCAddressLine1').prop("disabled", true)
    }
    if (obj["APPLICENT_CADD2"] != "" && obj["APPLICENT_CADD2"] != null) {
        $('#txtCAddressLine2').val(obj["APPLICENT_CADD2"])
        $('#txtCAddressLine2').prop("disabled", true)
    }
    //if (obj["PLANDMARK"] != "" && obj["PLANDMARK"] != null) {
    //    $('#txtLandMark').val(obj["PLANDMARK"])
    //    $('#txtLandMark').prop("disabled", true)
    //}
    if (obj["APPLICENT_CROAD"] != "" && obj["APPLICENT_CROAD"] != null) {
        $('#txtCRoadStreetName').val(obj["APPLICENT_CROAD"])
        $('#txtCRoadStreetName').prop("disabled", true)
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
        $("#ddlCDistrict").prop("disabled", true)
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
        $("#ddlCSubdivision").prop("disabled", true)
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
        $('#txtCPPinCode').val(obj["APPLICENT_CPINCODE"])
        $('#txtCPPinCode').prop("disabled", true)
    }


}
// End retrive local aadhar data

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
    var RelationType = "";
    if ($('#ddlApplicantType').val() == 1) {
        ApplicantType = "Self";
        IdentificationType = "1";
        IdentificationNumber = uid;
        ApplicantName = $("#txtFirstName").val(); // + " " + $("#txtMiddleName").val() + " " + $("#txtLastName").val();
        RelationType = "Self";

    } else {
        ApplicantType = "Other";
        IdentificationType = $("#ddlIdentificationType").val();
        IdentificationNumber = $("#txtIdentificationNumber").val();
        ApplicantName = $("#txtApplicantName").val();
        RelationType = $("#txtRelationType").val();
    };

    //var ApplicantName = $("#txtApplicantName").val();
    //var RelationType = $("#txtRelationType").val();

    var FirstName = $("#txtFirstName").val();
    var MiddleName = "";
    var LastName = "";

    var FatherFName = $("#txtFatherFName").val();
    var FatherMName = "";
    var FatherLName = "";

    var MotherFName = $("#txtMotherFName").val();
    var MotherMName = "";
    var MotherLName = "";

    var DOB = $("#txtDOB").val();
    var Age = $("#txtAge").val();
    var Gender = $("#ddlGender").val();
    var MaritalStatus = $("#ddlMaritalStatus").val();
    var EmailID = $("#txtEmailID").val();

    var SpouseFName = $("#txtSpouseFName").val();
    var SpouseMName = ""; //$("#txtSpouseMName").val();
    var SpouseLName = ""; //$("#txtSpouseLName").val();

    var SpouseRelation = "";
    if (MaritalStatus == 2 || MaritalStatus == 3) {
        SpouseRelation = $("#ddlSpouseRelation").val();
    }

    var MobileNo = $("#txtMobileNo").val();
    var StdCode = $("#txtStdCode").val();
    var Phone = $("#txtPhone").val();
    var ApplyPurpose = $("#txtApplyPurpose").val();

    var Area = $("#ddlArea").val();
    var AddressLine1 = $("#txtAddressLine1").val();
    var AddressLine2 = $("#txtAddressLine2").val();
    var RoadStreetName = $("#txtRoadStreetName").val();

    var State = $("#ddlState").val();
    var StateName = $("#txtState").val();
    var District = $("#ddlDistrict").val();
    var DistrictName = $("#txtDistrict").val();
    var Subdivision = $("#ddlSubdivision").val();
    var SubdivisionName = $("#txtSubdivision").val();
    var Tehsil = $("#ddlTehsil").val();
    var TehsilName = $("#txtTehsil").val();
    var RI = $("#ddlRI").val();
    var RIName = $("#txtRI").val();
    var Taluka = $("#ddlTaluka").val();
    var TalukaName = $("#txtTaluka").val();

    var Village = $("#txtVillage").val();
    var PGPULB = $("#txtPGPULB").val();
    var PoliceStation = $("#txtPoliceStation").val();
    var PostOffice = $("#txtPostOffice").val();
    var PinCode = $("#txtPinCode").val();

    var Address = "";
    if ($("#chkAddress").is(":checked")) { Address = "Y"; } else { Address = "N"; };

    var CArea = $("#ddlCArea").val();
    var CAddressLine1 = $("#txtCAddressLine1").val();
    var CAddressLine2 = $("#txtCAddressLine2").val();
    var CRoadStreetName = $("#txtCRoadStreetName").val();

    var CState = $("#ddlCState").val();
    var CStateName = $("#txtCState").val();
    var CDistrict = $("#ddlCDistrict").val();
    var CDistrictName = $("#txtCDistrict").val();
    var CSubdivision = $("#ddlCSubdivision").val();
    var CSubdivisionName = $("#txtCSubdivision").val();
    var CTehsil = $("#ddlCTehsil").val();
    var CTehsilName = $("#txtCTehsil").val();
    var CRI = $("#ddlCRI").val();
    var CRIName = $("#txtCRI").val();
    var CTaluka = $("#ddlCTaluka").val();
    var CTalukaName = $("#txtCTaluka").val();

    var CVillage = $("#txtCVillage").val();
    var CPGPULB = $("#txtCPGPULB").val();
    var CPPoliceStation = $("#txtCPPoliceStation").val();
    var CPPostOffice = $("#txtCPPostOffice").val();
    var CPPinCode = $("#txtCPPinCode").val();

    var Read = "";
    if ($("#chkRead").is(":checked")) { Read = "R"; } else { Read = ""; };
    var Write = "";
    if ($("#chkWrite").is(":checked")) { Write = "W"; } else { Write = ""; };
    var Speak = "";
    if ($("#chkSpeak").is(":checked")) { Speak = "S"; } else { Speak = ""; };


    var PassOriyaY = "";
    if ($("#rdoPassOriyaY").is(":checked")) { PassOriyaY = "Y"; } else { PassOriyaY = "N"; };
    //if ($("#rdoPassOriyaN").is(":checked")) { PassOriyaY = "N"; };


    var RORY = "";
    if ($("#rdoRORY").is(":checked")) { RORY = "Y"; } else { RORY = "N"; };
    //if ($("#rdoRORN").is(":checked")) { RORY = "N"; };


    var rorDistr = $("#ddlrorDistr").val();
    var rorSubDiv = $("#ddlrorSubDiv").val();
    var rorTahsil = $("#ddlrorTahsil").val();
    var rorRI = $("#ddlrorRI").val();

    var rorPoliceStn = $("#txtrorPoliceStn").val();
    var rorVilg = $("#txtrorVilg").val();
    var KhataNo = $("#txtKhataNo").val();
    var RecordedTenant = $("#txtRecordedTenant").val();
    var RecodTenantReltion = $("#txtRecodTenantReltion").val();
    var SaleDeedNo = $("#txtSaleDeedNo").val();
    var SaleDeedDte = $("#txtSaleDeedDte").val();
    var ResidingDtlYear = $("#txtResidingDtlYear").val();
    var PlotDetail = $("#hdfSuspectSave").val();

    var SubmitterType = "";
    if (ApplicantType == "Self") { SubmitterType = "Y" }
    if (ApplicantType == "Other") { SubmitterType = "N" }


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
            , "RelationType": RelationType
            , "IdentificationType": IdentificationType
            , "IdentificationNumber": IdentificationNumber
            , "FirstName": FirstName
            , "MiddleName": MiddleName
            , "LastName": LastName
            , "FatherFName": FatherFName
            , "FatherMName": FatherMName
            , "FatherLName": FatherLName
            , "MotherFName": MotherFName
            , "MotherMName": MotherMName
            , "MotherLName": MotherLName
            , "DOB": DOB
            , "Age": Age
            , "Gender": Gender
            , "MaritalStatus": MaritalStatus
            , "EmailID": EmailID
            , "SpouseFName": SpouseFName
            , "SpouseMName": SpouseMName
            , "SpouseLName": SpouseLName
            , "SpouseRelation": SpouseRelation
            , "MobileNo": MobileNo
            , "StdCode": StdCode
            , "Phone": Phone
            , "ApplyPurpose": ApplyPurpose
            , "Area": Area
            , "AddressLine1": AddressLine1
            , "AddressLine2": AddressLine2
            , "RoadStreetName": RoadStreetName
            , "State": State
            , "StateName": StateName
            , "District": District
            , "DistrictName": DistrictName
            , "Subdivision": Subdivision
            , "SubdivisionName": SubdivisionName
            , "Tehsil": Tehsil
            , "Tehsilname": "" //Tehsilname
            , "RI": RI
            , "RIName": RIName
            , "Taluka": Taluka
            , "TalukaName": TalukaName
            , "Village": Village
            , "PGPULB": PGPULB
            , "PoliceStation": PoliceStation
            , "PostOffice": PostOffice
            , "PinCode": PinCode
            , "Address": Address
            , "CArea": CArea
            , "CAddressLine1": CAddressLine1
            , "CAddressLine2": CAddressLine2
            , "CRoadStreetName": CRoadStreetName

            , "CState": CState
            , "CStateName": CStateName
            , "CDistrict": CDistrict
            , "CDistrictName": CDistrictName
            , "CSubdivision": CSubdivision
            , "CSubdivisionName": CSubdivisionName
            , "CTehsil": CTehsil
            , "CTehsilName": CTehsilName
            , "CRI": CRI
            , "CRIName": CRIName
            , "CTaluka": CTaluka
            , "CTalukaName": CTalukaName

            , "CVillage": CVillage
            , "CPGPULB": CPGPULB
            , "CPPoliceStation": CPPoliceStation
            , "CPPostOffice": CPPostOffice
            , "CPPinCode": CPPinCode
            , "Read": Read
            , "Write": Write
            , "Speak": Speak
            , "PassOriyaY": PassOriyaY
            , "PassOriyaN": ""
            , "RORY": RORY
            , "RORN": ""
            , "rorDistr": rorDistr
            , "rorSubDiv": rorSubDiv
            , "rorTahsil": rorTahsil
            , "rorRI": rorRI
            , "rorPoliceStn": rorPoliceStn
            , "rorVilg": rorVilg
            , "KhataNo": KhataNo
            , "RecordedTenant": RecordedTenant
            , "RecodTenantReltion": RecodTenantReltion
            , "SaleDeedNo": SaleDeedNo
            , "SaleDeedDte": SaleDeedDte
            , "ResidingDtlYear": ResidingDtlYear
            , "PlotDetail": PlotDetail
            , "SubmitterType": SubmitterType


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
           url: "/WebApp/Kiosk/CCTNS/ResidenceCertificate.aspx/RegisterResidence",
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
        var txtApplicantName = $("#txtApplicantName").val(); if (txtApplicantName == "" || txtApplicantName == null) { text += "<br /> -Please fill Applicant Name."; $("#txtApplicantName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtApplicantName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtApplicantName").attr('style', '1px solid #cdcdcd !important;'); $("#txtApplicantName").css({ "background-color": "#ffffff" }); }
        var ddlRelationType = $("#txtRelationType").val(); if (ddlRelationType == "" || ddlRelationType == null) { text += "<br /> -Please Select Relation Type."; $("#txtRelationType").attr('style', 'border:1px solid #d03100 !important;'); $("#txtRelationType").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtRelationType").attr('style', '1px solid #cdcdcd !important;'); $("#txtRelationType").css({ "background-color": "#ffffff" }); }
        var IdentificationType = $("#ddlIdentificationType").val(); if (IdentificationType == 0) { text += "<br /> -Please Select Identification Type."; $("#ddlIdentificationType").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlIdentificationType").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlIdentificationType").attr('style', '1px solid #cdcdcd !important;'); $("#ddlIdentificationType").css({ "background-color": "#ffffff" }); }
        var IdentificationNumber = $("#txtIdentificationNumber").val(); if (IdentificationNumber == "" || IdentificationNumber == null) { text += "<br /> -Please fill Identification Number."; $("#txtIdentificationNumber").attr('style', 'border:1px solid #d03100 !important;'); $("#txtIdentificationNumber").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtIdentificationNumber").attr('style', '1px solid #cdcdcd !important;'); $("#txtIdentificationNumber").css({ "background-color": "#ffffff" }); }
    }

    var txtFirstName = $("#txtFirstName").val(); if (txtFirstName == "" || txtFirstName == null) { text += "<br /> -Please fill Applicent Name."; $("#txtFirstName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtFirstName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtFirstName").attr('style', '1px solid #cdcdcd !important;'); $("#txtFirstName").css({ "background-color": "#ffffff" }); }
    var txtMotherFName = $("#txtMotherFName").val(); if (txtMotherFName == "" || txtMotherFName == null) { text += "<br /> -Please fill Mother Name."; $("#txtMotherFName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtMotherFName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtMotherFName").attr('style', '1px solid #cdcdcd !important;'); $("#txtMotherFName").css({ "background-color": "#ffffff" }); }
    var txtFatherFName = $("#txtFatherFName").val(); if (txtFatherFName == "" || txtFatherFName == null) { text += "<br /> -Please fill Father Name."; $("#txtFatherFName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtFatherFName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtFatherFName").attr('style', '1px solid #cdcdcd !important;'); $("#txtFatherFName").css({ "background-color": "#ffffff" }); }

    var DOB = $("#txtDOB").val(); if (DOB == "" || DOB == null) { text += "<br /> -Please fill Date Of Birth."; $("#txtDOB").attr('style', 'border:1px solid #d03100 !important;'); $("#txtDOB").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtDOB").attr('style', '1px solid #cdcdcd !important;'); $("#txtDOB").css({ "background-color": "#ffffff" }); }
    var txtAge = $("#txtAge").val(); if (txtAge == "" || txtAge == null) { text += "<br /> -Please fill Age."; $("#txtAge").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAge").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAge").attr('style', '1px solid #cdcdcd !important;'); $("#txtAge").css({ "background-color": "#ffffff" }); }
    var Gender = $("#ddlGender").val(); if (Gender == '-Select-' || Gender == "0") { text += "<br /> -Please Select Gender. "; $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlGender").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlGender").attr('style', 'border:1px solid #eee !important;'); $("#ddlGender").css({ "background-color": "#ffffff" }); }

    var txtMobileNo = $("#txtMobileNo").val(); if (txtMobileNo == '' || txtMobileNo == null) { text += "<br /> -Please fill Mobile Number."; $("#txtMobileNo").attr('style', 'border:1px solid #d03100 !important;'); $("#txtMobileNo").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtMobileNo").attr('style', '1px solid #eee !important;'); $("#txtMobileNo").css({ "background-color": "#ffffff" }); }
    var txtEmailID = $("#txtEmailID").val(); if (txtEmailID == "" || txtEmailID == null) { text += "<br /> -Please fill Email."; $("#txtEmailID").attr('style', 'border:1px solid #d03100 !important;'); $("#txtEmailID").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtEmailID").attr('style', '1px solid #cdcdcd !important;'); $("#txtEmailID").css({ "background-color": "#ffffff" }); }
    var ddlMaritalStatus = $("#ddlMaritalStatus").val(); if (ddlMaritalStatus == 0) { text += "<br /> -Please Select Marital Status."; $("#ddlMaritalStatus").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlMaritalStatus").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlMaritalStatus").attr('style', '1px solid #cdcdcd !important;'); $("#ddlMaritalStatus").css({ "background-color": "#ffffff" }); }

    if (ddlMaritalStatus == 2 || ddlMaritalStatus == 3) {
        var txtSpouseFName = $("#txtSpouseFName").val(); if (txtSpouseFName == "" || txtSpouseFName == null) { text += "<br /> -Please fill Spouse First Name."; $("#txtSpouseFName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtSpouseFName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtSpouseFName").attr('style', '1px solid #cdcdcd !important;'); $("#txtSpouseFName").css({ "background-color": "#ffffff" }); }
        var ddlSpouseRelation = $("#ddlSpouseRelation").val(); if (ddlSpouseRelation == '-Select-' || ddlSpouseRelation == "") { text += "<br /> -Please Select Spouse Relation. "; $("#ddlSpouseRelation").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlSpouseRelation").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlSpouseRelation").attr('style', 'border:1px solid #eee !important;'); $("#ddlSpouseRelation").css({ "background-color": "#ffffff" }); }
    }


    var ddlArea = $("#ddlArea").val(); if (ddlArea == '-Select-' || ddlArea == "0") { text += "<br /> -Please Select Permanent Area. "; $("#ddlArea").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlArea").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlArea").attr('style', 'border:1px solid #eee !important;'); $("#ddlArea").css({ "background-color": "#ffffff" }); }
    var txtVillage = $("#txtVillage").val(); if (txtVillage == '' || txtVillage == null) { text += "<br /> -Please fill Perment Villege."; $("#txtVillage").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVillage").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVillage").attr('style', '1px solid #eee !important;'); $("#txtVillage").css({ "background-color": "#ffffff" }); }
    var txtPoliceStation = $("#txtPoliceStation").val(); if (txtPoliceStation == '' || txtPoliceStation == null) { text += "<br /> -Please fill Perment Police Station."; $("#txtPoliceStation").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPoliceStation").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPoliceStation").attr('style', '1px solid #eee !important;'); $("#txtPoliceStation").css({ "background-color": "#ffffff" }); }
    var txtAddressLine1 = $("#txtAddressLine1").val(); if (txtAddressLine1 == "" || txtAddressLine1 == null) { text += "<br /> -Please fill Permanent Address Line1."; $("#txtAddressLine1").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAddressLine1").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAddressLine1").attr('style', '1px solid #cdcdcd !important;'); $("#txtAddressLine1").css({ "background-color": "#ffffff" }); }
    var txtAddressLine2 = $("#txtAddressLine2").val(); if (txtAddressLine2 == "" || txtAddressLine2 == null) { text += "<br /> -Please fill Permanent Address Line2."; $("#txtAddressLine2").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAddressLine2").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAddressLine2").attr('style', '1px solid #cdcdcd !important;'); $("#txtAddressLine2").css({ "background-color": "#ffffff" }); }
    var txtRoadStreetName = $("#txtRoadStreetName").val(); if (txtRoadStreetName == "" || txtRoadStreetName == null) { text += "<br /> -Please fill Permanent Road Street Name."; $("#txtRoadStreetName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtRoadStreetName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtRoadStreetName").attr('style', '1px solid #cdcdcd !important;'); $("#txtRoadStreetName").css({ "background-color": "#ffffff" }); }
    var txtPinCode = $("#txtPinCode").val(); if (txtPinCode == "" || txtPinCode == null) { text += "<br /> -Please fill Permanent Pincode."; $("#txtPinCode").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPinCode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPinCode").attr('style', '1px solid #cdcdcd !important;'); $("#txtPinCode").css({ "background-color": "#ffffff" }); }



    var ddlDistrict = $("#ddlDistrict").val(); if (ddlDistrict == '-Select-' || ddlDistrict == "0") { text += "<br /> -Please Select Present District. "; $("#ddlDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlDistrict").attr('style', 'border:1px solid #eee !important;'); $("#ddlDistrict").css({ "background-color": "#ffffff" }); }
    var ddlSubdivision = $("#ddlSubdivision").val(); if (ddlSubdivision == '-Select-' || ddlSubdivision == "0") { text += "<br /> -Please Select Present Sub Division. "; $("#ddlSubdivision").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlSubdivision").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlSubdivision").attr('style', 'border:1px solid #eee !important;'); $("#ddlSubdivision").css({ "background-color": "#ffffff" }); }
    var ddlTehsil = $("#ddlTehsil").val(); if (ddlTehsil == '-Select-' || ddlTehsil == "0") { text += "<br /> -Please Select Present Tahasil. "; $("#ddlTehsil").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlTehsil").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlTehsil").attr('style', 'border:1px solid #eee !important;'); $("#ddlTehsil").css({ "background-color": "#ffffff" }); }
    var ddlRI = $("#ddlRI").val(); if (ddlRI == '-Select-' || ddlRI == "0") { text += "<br /> -Please Select Present RI. "; $("#ddlRI").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlRI").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlRI").attr('style', 'border:1px solid #eee !important;'); $("#ddlRI").css({ "background-color": "#ffffff" }); }
    var ddlTaluka = $("#ddlTaluka").val(); if (ddlTaluka == '-Select-' || ddlTaluka == "0") { text += "<br /> -Please Select Present Taluka. "; $("#ddlTaluka").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlTaluka").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlTaluka").attr('style', 'border:1px solid #eee !important;'); $("#ddlTaluka").css({ "background-color": "#ffffff" }); }




    var txtApplyPurpose = $("#txtApplyPurpose").val(); if (txtApplyPurpose == "" || txtApplyPurpose == null) { text += "<br /> -Please fill Apply Purpose."; $("#txtApplyPurpose").attr('style', 'border:1px solid #d03100 !important;'); $("#txtApplyPurpose").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtApplyPurpose").attr('style', '1px solid #cdcdcd !important;'); $("#txtApplyPurpose").css({ "background-color": "#ffffff" }); }


    //FK_LRDDistrictId, FK_LRDSubDivisionId, FK_LRDTahsilId, FK_LRDRIId, LRDKhataNo

    var txtResidingDtlYear = $("#txtResidingDtlYear").val(); if (txtResidingDtlYear == '' || txtResidingDtlYear == null) { text += "<br /> -Please fill Residing Year on Above House."; $("#txtResidingDtlYear").attr('style', 'border:1px solid #d03100 !important;'); $("#txtResidingDtlYear").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtResidingDtlYear").attr('style', '1px solid #eee !important;'); $("#txtResidingDtlYear").css({ "background-color": "#ffffff" }); }


    var rdoRORY = $("#rdoRORY").is(":checked");
    if (rdoRORY) {
        var ddlrorDistr = $("#ddlrorDistr").val(); if (ddlrorDistr == '-Select-' || ddlrorDistr == "0") { text += "<br /> -Please Select ROR District. "; $("#ddlrorDistr").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlrorDistr").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlrorDistr").attr('style', 'border:1px solid #eee !important;'); $("#ddlrorDistr").css({ "background-color": "#ffffff" }); }
        var ddlrorSubDiv = $("#ddlrorSubDiv").val(); if (ddlrorSubDiv == '-Select-' || ddlrorSubDiv == "0") { text += "<br /> -Please Select ROR Sub Division. "; $("#ddlrorSubDiv").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlrorSubDiv").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlrorSubDiv").attr('style', 'border:1px solid #eee !important;'); $("#ddlrorSubDiv").css({ "background-color": "#ffffff" }); }
        var ddlrorTahsil = $("#ddlrorTahsil").val(); if (ddlrorTahsil == '-Select-' || ddlrorTahsil == "0") { text += "<br /> -Please Select ROR Tahsil. "; $("#ddlrorTahsil").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlrorTahsil").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlrorTahsil").attr('style', 'border:1px solid #eee !important;'); $("#ddlrorTahsil").css({ "background-color": "#ffffff" }); }
        var ddlrorRI = $("#ddlrorRI").val(); if (ddlrorRI == '-Select-' || ddlrorRI == "0") { text += "<br /> -Please Select ROR RI. "; $("#ddlrorRI").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlrorRI").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlrorRI").attr('style', 'border:1px solid #eee !important;'); $("#ddlrorRI").css({ "background-color": "#ffffff" }); }
        var txtKhataNo = $("#txtKhataNo").val(); if (txtKhataNo == "" || txtKhataNo == null) { text += "<br /> -Please fill ROR Khata No."; $("#txtKhataNo").attr('style', 'border:1px solid #d03100 !important;'); $("#txtKhataNo").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtKhataNo").attr('style', '1px solid #cdcdcd !important;'); $("#txtKhataNo").css({ "background-color": "#ffffff" }); }
        var txtRecordedTenant = $("#txtRecordedTenant").val(); if (txtRecordedTenant == '' || txtRecordedTenant == null) { text += "<br /> -Please fill ROR Recorded Tenant."; $("#txtRecordedTenant").attr('style', 'border:1px solid #d03100 !important;'); $("#txtRecordedTenant").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtRecordedTenant").attr('style', '1px solid #eee !important;'); $("#txtRecordedTenant").css({ "background-color": "#ffffff" }); }

    }
    else {
        $("#ddlrorDistr").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyName").css({ "background-color": "#ffffff" });
        $("#ddlrorSubDiv").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyAddrs").css({ "background-color": "#ffffff" });
        $("#ddlrorTahsil").attr('style', '1px solid #cdcdcd !important;'); $("#txtCompanyPhone").css({ "background-color": "#ffffff" });
        $("#ddlrorRI").attr('style', '1px solid #cdcdcd !important;'); $("#txtDesig").css({ "background-color": "#ffffff" });
        $("#txtKhataNo").attr('style', '1px solid #cdcdcd !important;'); $("#txtJoingDate").css({ "background-color": "#ffffff" });
        $("#txtRecordedTenant").attr('style', '1px solid #cdcdcd !important;'); $("#txtJoingDate").css({ "background-color": "#ffffff" });
        $("#txtRecordedTenant").attr('style', '1px solid #cdcdcd !important;'); $("#txtJoingDate").css({ "background-color": "#ffffff" });
    }


    var chkAddress = $("#chkAddress").is(":checked");
    if (chkAddress) {
        $("#ddlCArea").prop("disabled", true);
        $("#txtCAddressLine1").prop("disabled", true);
        $("#txtCAddressLine2").prop("disabled", true);
        $("#txtCRoadStreetName").prop("disabled", true);


        $('#ddlCDistrict').prop("disabled", true);
        $("#ddlCDistrict").hide();

        $('#txtCDistrict').prop("disabled", true);
        $("#txtCDistrict").show();

        $('#ddlCSubdivision').prop("disabled", true);
        $("#ddlCSubdivision").hide();

        $('#txtCSubdivision').prop("disabled", true);
        $("#txtCSubdivision").show();

        $('#ddlCTehsil').prop("disabled", true);
        $("#ddlCTehsil").hide();

        $('#txtCTehsil').prop("disabled", true);
        $("#txtCTehsil").show();

        $('#ddlCRI').prop("disabled", true);
        $("#ddlCRI").hide();

        $('#txtCRI').prop("disabled", true);
        $("#txtCRI").show();


        $('#ddlCTaluka').prop("disabled", true);
        $("#ddlCTaluka").hide();

        $('#txtCTaluka').prop("disabled", true);
        $("#txtCTaluka").show();

        var txtCDistrict = $("#txtCDistrict").val(); if (txtCDistrict == "" || txtCDistrict == null) { text += "<br /> -Please Select Permanent District. "; $("#txtCDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCDistrict").attr('style', 'border:1px solid #eee !important;'); $("#txtCDistrict").css({ "background-color": "#eee  " }); }
        var txtCSubdivision = $("#txtCSubdivision").val(); if (txtCSubdivision == "" || txtCSubdivision == null) { text += "<br /> -Please Select Permanent Sub Division. "; $("#txtCSubdivision").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCSubdivision").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCSubdivision").attr('style', 'border:1px solid #eee !important;'); $("#txtCSubdivision").css({ "background-color": "#eee  " }); }
        var txtCTehsil = $("#txtCTehsil").val(); if (txtCTehsil == "" || txtCTehsil == null) { text += "<br /> -Please Select Permanent Tahasil. "; $("#txtCTehsil").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCTehsil").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCTehsil").attr('style', 'border:1px solid #eee !important;'); $("#txtCTehsil").css({ "background-color": "#eee  " }); }
        var txtCRI = $("#txtCRI").val(); if (txtCRI == "" || txtCRI == null) { text += "<br /> -Please Select Permanent RI. "; $("#txtCRI").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCRI").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCRI").attr('style', 'border:1px solid #eee !important;'); $("#txtCRI").css({ "background-color": "#eee  " }); }
        var txtCTaluka = $("#txtCTaluka").val(); if (txtCTaluka == "" || txtCTaluka == null) { text += "<br /> -Please Select Permanent Taluka. "; $("#txtCTaluka").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCTaluka").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCTaluka").attr('style', 'border:1px solid #eee !important;'); $("#txtCTaluka").css({ "background-color": "#eee  " }); }


        //$("#ddlCSubdivision").val($("#ddlSubdivision").val());
        //$("#txtCSubdivision").val($("#txtSubdivision").val());
        //$("#ddlCTehsil").val($("#ddlTehsil").val());
        //$("#txtCTehsil").val($("#txtTehsil").val());
        //$("#ddlCRI").val($("#ddlRI").val());
        //$("#txtCRI").val($("#txtRI").val());
        //$("#ddlCTaluka").val($("#ddlTaluka").val());
        //$("#txtCTaluka").val($("#txtTaluka").val());
        $("#txtCVillage").prop("disabled", true);
        $("#txtCPGPULB").prop("disabled", true);
        $("#txtCPoliceStation").prop("disabled", true);
        $("#txtCPostOffice").prop("disabled", true);
        $("#txtCPinCode").prop("disabled", true);
    }
    else {

        var ddlCDistrict = $("#ddlCDistrict").val(); if (ddlCDistrict == '-Select-' || ddlCDistrict == "0") { text += "<br /> -Please Select Permanent District. "; $("#ddlCDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCDistrict").attr('style', 'border:1px solid #eee !important;'); $("#ddlCDistrict").css({ "background-color": "#eee  " }); }
        var ddlCSubdivision = $("#ddlCSubdivision").val(); if (ddlCSubdivision == '-Select-' || ddlCSubdivision == "0") { text += "<br /> -Please Select Permanent Sub Division. "; $("#ddlCSubdivision").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCSubdivision").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCSubdivision").attr('style', 'border:1px solid #eee !important;'); $("#ddlCSubdivision").css({ "background-color": "#eee  " }); }
        var ddlCTehsil = $("#ddlCTehsil").val(); if (ddlCTehsil == '-Select-' || ddlCTehsil == "0") { text += "<br /> -Please Select Permanent Tahasil. "; $("#ddlCTehsil").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCTehsil").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCTehsil").attr('style', 'border:1px solid #eee !important;'); $("#ddlCTehsil").css({ "background-color": "#eee  " }); }
        var ddlCRI = $("#ddlCRI").val(); if (ddlCRI == '-Select-' || ddlCRI == "0") { text += "<br /> -Please Select Permanent RI. "; $("#ddlCRI").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCRI").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCRI").attr('style', 'border:1px solid #eee !important;'); $("#ddlCRI").css({ "background-color": "#eee  " }); }
        var ddlCTaluka = $("#ddlCTaluka").val(); if (ddlCTaluka == '-Select-' || ddlCTaluka == "0") { text += "<br /> -Please Select Permanent Taluka. "; $("#ddlCTaluka").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCTaluka").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCTaluka").attr('style', 'border:1px solid #eee !important;'); $("#ddlCTaluka").css({ "background-color": "#eee  " }); }

    }

    var ddlCArea = $("#ddlCArea").val(); if (ddlCArea == '-Select-' || ddlCArea == "0") { text += "<br /> -Please Select Present Area. "; $("#ddlCArea").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCArea").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCArea").attr('style', 'border:1px solid #eee !important;'); $("#ddlCArea").css({ "background-color": "#eee  " }); }
    var ddlCArea = $("#ddlCArea").val(); if (ddlCArea == '-Select-' || ddlCArea == "0") { text += "<br /> -Please Select Present Area. "; $("#ddlCArea").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlCArea").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlCArea").attr('style', 'border:1px solid #eee !important;'); $("#ddlCArea").css({ "background-color": "#eee  " }); }
    var txtCVillage = $("#txtCVillage").val(); if (txtCVillage == '' || txtCVillage == null) { text += "<br /> -Please fill Present Villege."; $("#txtCVillage").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCVillage").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCVillage").attr('style', '1px solid #eee !important;'); $("#txtCVillage").css({ "background-color": "#eee  " }); }
    var txtCPPoliceStation = $("#txtCPPoliceStation").val(); if (txtCPPoliceStation == '' || txtCPPoliceStation == null) { text += "<br /> -Please fill Present Police Station."; $("#txtCPPoliceStation").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCPPoliceStation").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCPPoliceStation").attr('style', '1px solid #eee !important;'); $("#txtCPPoliceStation").css({ "background-color": "#eee  " }); }
    var txtCAddressLine1 = $("#txtCAddressLine1").val(); if (txtCAddressLine1 == "" || txtCAddressLine1 == null) { text += "<br /> -Please fill Present Address Line1."; $("#txtCAddressLine1").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCAddressLine1").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCAddressLine1").attr('style', '1px solid #cdcdcd !important;'); $("#txtCAddressLine1").css({ "background-color": "#eee  " }); }
    var txtCAddressLine2 = $("#txtCAddressLine2").val(); if (txtCAddressLine2 == "" || txtCAddressLine2 == null) { text += "<br /> -Please fill Present Address Line2."; $("#txtCAddressLine2").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCAddressLine2").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCAddressLine2").attr('style', '1px solid #cdcdcd !important;'); $("#txtCAddressLine2").css({ "background-color": "#eee  " }); }
    var txtCRoadStreetName = $("#txtCRoadStreetName").val(); if (txtCRoadStreetName == "" || txtCRoadStreetName == null) { text += "<br /> -Please fill Present Road Street Name."; $("#txtCRoadStreetName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCRoadStreetName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCRoadStreetName").attr('style', '1px solid #cdcdcd !important;'); $("#txtCRoadStreetName").css({ "background-color": "#eee  " }); }
    var txtCPPinCode = $("#txtCPPinCode").val(); if (txtCPPinCode == "" || txtCPPinCode == null) { text += "<br /> -Please fill Present Pincode."; $("#txtCPPinCode").attr('style', 'border:1px solid #d03100 !important;'); $("#txtCPPinCode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtCPPinCode").attr('style', '1px solid #cdcdcd !important;'); $("#txtCPPinCode").css({ "background-color": "#eee  " }); }




    var chkRead = $("#chkRead").is(":checked");
    if (!chkRead) {
        opt = 1;
        text += "<br /> -Please Select Primary Skill, You can Read, Write and Speak Oriya or Not. Reading Odiya has Must.";
        $("#divRead").attr('style', 'border:1px solid #d03100 !important;');
        $("#divRead").css({ "background-color": "#fff2ee" });
    } else { $("#divRead").attr('style', 'border:1px solid #E4E4E4 !important;'); $("#divRead").css({ "background-color": "#E4E4E4" }); }


    var rdoPassOriyaY = $("#rdoPassOriyaY").is(":checked");
    var rdoPassOriyaN = $("#rdoPassOriyaN").is(":checked");
    if (!rdoPassOriyaY && !rdoPassOriyaN) {
        opt = 1;
        text += "<br /> -Please Select ME Standard Passed Or Not. ";
        $("#divPassMI").css({ "background-color": "#fff2ee" });
        $("#divPassMI").attr('style', 'border:1px solid #d03100 !important;');
    } else { $("#divPassMI").attr('style', 'border:1px solid #E4E4E4 !important;'); $("#divPassMI").css({ "background-color": "#E4E4E4" }); }




    //var txtState = $("#txtState").val();
    //if ((txtState == "" || txtState == null) && $("#ddlState").val() == 0) {
    //    $("#txtState").hide(); text += "<br /> -Please Select Permanent State.";
    //    $("#ddlState").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#ddlState").css({ "background-color": "#fff2ee" }); opt = 1;
    //} else {
    //    if ($("#ddlState").val() != 0) {
    //        $("#txtState").hide();
    //        $("#ddlState").attr('style', '1px solid #eee !important;');
    //        $("#ddlState").css({ "background-color": "#ffffff" });
    //    }
    //}

    //var txtPState = $("#txtPState").val();
    //if ((txtPState == "" || txtPState == null) && $("#ddlPState").val() == 0) {
    //    $("#txtPState").hide(); text += "<br /> -Please Select Present State.";
    //    $("#ddlPState").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#ddlPState").css({ "background-color": "#fff2ee" }); opt = 1;
    //} else {
    //    if ($("#ddlPState").val() != 0) {
    //        $("#txtPState").hide();
    //        $("#ddlPState").attr('style', '1px solid #eee !important;');
    //        $("#ddlPState").css({ "background-color": "#ffffff" });
    //    }
    //}

    //var District = $("#txtDistrict").val();
    //if (District == "" || District == null) {
    //    $("#txtDistrict").hide();
    //    $("#ddlDistrict").show();
    //    if ($("#ddlDistrict").val() == 0) {
    //        text += "<br /> -Please Select Permanent District.";
    //        $("#ddlDistrict").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#ddlDistrict").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#ddlDistrict").attr('style', 'border:1px solid #eee !important;');
    //        $("#ddlDistrict").css({ "background-color": "#fff" });
    //    }
    //} else {
    //    $("#ddlDistrict").hide();
    //    $("#txtDistrict").attr('style', '1px solid #eee !important;');
    //    $("#txtDistrict").css({ "background-color": "##eee" });
    //}


    //var PDistrict = $("#txtPDistrict").val();
    //if (PDistrict == "" || PDistrict == null) {
    //    $("#txtPDistrict").hide();
    //    $("#ddlPDistrict").show();
    //    if ($("#ddlPDistrict").val() == 0) {
    //        text += "<br /> -Please Select Present District.";
    //        $("#ddlPDistrict").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#ddlPDistrict").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#ddlPDistrict").attr('style', 'border:1px solid #eee !important;');
    //        $("#ddlPDistrict").css({ "background-color": "#fff" });
    //    }
    //} else {
    //    $("#ddlPDistrict").hide();
    //    $("#txtPDistrict").attr('style', '1px solid #eee !important;');
    //    $("#txtPDistrict").css({ "background-color": "##eee" });
    //}


    //var Block = $("#txtBlock").val();
    //if (Block == "" || Block == null) {
    //    $("#txtBlock").hide(); $("#ddlBlockTaluka").show();
    //    if ($("#ddlBlockTaluka").val() == 0) {
    //        text += "<br /> -Please Select Permanent Block.";
    //        $("#ddlBlockTaluka").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#ddlBlockTaluka").css({ "background-color": "#fff2ee" }); opt = 1;
    //    } else {
    //        $("#ddlBlockTaluka").attr('style', 'border:1px solid #eee !important;');
    //        $("#ddlBlockTaluka").css({ "background-color": "#fff" });
    //    }
    //} else {
    //    $("#ddlBlockTaluka").hide();
    //    $("#txtBlock").attr('style', '1px solid #eee !important;');
    //    $("#txtBlock").css({ "background-color": "##eee" });
    //}

    //var PBlock = $("#txtPBlock").val();
    //if (PBlock == "" || PBlock == null) {
    //    $("#txtPBlock").hide(); $("#ddlPBlockTaluka").show();
    //    if ($("#ddlPBlockTaluka").val() == 0) {
    //        text += "<br /> -Please Select Present Block.";
    //        $("#ddlPBlockTaluka").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#ddlPBlockTaluka").css({ "background-color": "#fff2ee" }); opt = 1;
    //    } else {
    //        $("#ddlPBlockTaluka").attr('style', 'border:1px solid #eee !important;');
    //        $("#ddlPBlockTaluka").css({ "background-color": "#fff" });
    //    }
    //} else {
    //    $("#ddlPBlockTaluka").hide();
    //    $("#txtPBlock").attr('style', '1px solid #eee !important;');
    //    $("#txtPBlock").css({ "background-color": "##eee" });
    //}



    if (text != "" || opt == 1) {
        alert(text);
        //alertPopup("Please fill following information.", text);
        return false;
    }
    return true;

}


function BindAddress() {
    GetDistrict('', '#ddlDistrict');
    GetDistrict('', '#ddlCDistrict');
    GetDistrict('', '#ddlrorDistr');
    $("#ddlDistrict").change(function () {
        GetSubDivision('#ddlDistrict', '#ddlSubdivision');
    });
    $("#ddlCDistrict").change(function () {
        GetSubDivision('#ddlCDistrict', '#ddlCSubdivision');
    });
    $("#ddlrorDistr").change(function () {
        GetSubDivision('#ddlrorDistr', '#ddlrorSubDiv');
    });

    $("#ddlSubdivision").change(function () {
        GetSubTahasil('#ddlDistrict', '#ddlSubdivision', '#ddlTehsil');
        GetTaluka('#ddlDistrict', '#ddlSubdivision', '#ddlTaluka');
    });
    $("#ddlCSubdivision").change(function () {
        GetSubTahasil('#ddlCDistrict', '#ddlCSubdivision', '#ddlCTehsil');
        GetTaluka('#ddlCDistrict', '#ddlCSubdivision', '#ddlCTaluka');
    });
    $("#ddlrorSubDiv").change(function () {
        GetSubTahasil('#ddlrorDistr', '#ddlrorSubDiv', '#ddlrorTahsil');
    });

    $("#ddlTehsil").change(function () {
        GetRI('#ddlDistrict', '#ddlSubdivision', '#ddlTehsil', '#ddlRI');
    });
    $("#ddlCTehsil").change(function () {
        GetRI('#ddlCDistrict', '#ddlCSubdivision', '#ddlCTehsil', '#ddlCRI');
    });
    $("#ddlrorTahsil").change(function () {
        GetRI('#ddlrorDistr', '#ddlrorSubDiv', '#ddlrorTahsil', '#ddlrorRI');
    });

}


function GetDistrict(ddlstate, ddlDistict) {
    var SelState = $(ddlstate).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ResidenceCertificate.aspx/GetDistrict",
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
function GetSubDivision(ddlDist, ddlSubDiv) {
    var SelState = $(ddlDist).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ResidenceCertificate.aspx/GetSubDistrict",
        data: '{"prefix":"","DistrictCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlSubDiv);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlSubDiv).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetSubTahasil(ddlDist, ddlSubDiv, ddlTahsil) {
    var SelState = $(ddlDist).val();
    var selSubDev = $(ddlSubDiv).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ResidenceCertificate.aspx/GetTahsil",
        data: '{"prefix":"","DistrictCode":"' + SelState + '", "SubDistrictCode":"' + selSubDev + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlTahsil);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlTahsil).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetTaluka(ddlDist, ddlSubDiv, ddlBlock) {
    var SelState = $(ddlDist).val();
    var selSubDev = $(ddlSubDiv).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ResidenceCertificate.aspx/GetBlock",
        data: '{"prefix":"","DistrictCode":"' + SelState + '", "SubDistrictCode":"' + selSubDev + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlBlock);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlBlock).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}
function GetRI(ddlDist, ddlSubDiv, ddlTahsil, ddlRI) {
    var SelState = $(ddlDist).val();
    var selSubDev = $(ddlSubDiv).val();
    var selTahsil = $(ddlTahsil).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/CCTNS/ResidenceCertificate.aspx/GetBlock",
        data: '{"prefix":"","DistrictCode":"' + SelState + '", "SubDistrictCode":"' + selSubDev + '", "TahsilCode":"' + selTahsil + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlRI);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each($.parseJSON(r.d), function () {
                $(ddlRI).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
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

function fnValidatePAN(Obj) {
    if (Obj == null) Obj = window.event.srcElement;
    if (Obj.value != "") {
        ObjVal = Obj.value;
        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
        var code = /([C,P,H,F,A,T,B,L,J,G])/;
        var code_chk = ObjVal.substring(3, 4);
        if (ObjVal.search(panPat) == -1) {
            alert("Invalid Pan No");
            Obj.focus();
            return false;
        }
        if (code.test(code_chk) == false) {
            alert("Invaild PAN Card No.");
            return false;
        }
    }
}


// Add Dynamic Table Row
function AddSuspect(DeleteString) {
    debugger;
    if (validateSuspectValues(DeleteString) == true) {
        //alert(11)
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strPlotNo = "";
        var strArea = "";
        var strKisam = "";
        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {

            strPlotNo = $('#txtPlotNo').val();
            strArea = $('#txtAreaInAcer').val();
            strKisam = $("#txtKisam").val();
            var hdfsuspact = $('#hdfSuspect').val();
            strTempString = hdfsuspact + "#" + SrNo + "," + strPlotNo + "," + strArea + "," + strKisam + "#";
        }
        else {
            strTempString = $('#hdfSuspect').val();
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'>Plot No.</th>";
        Str = Str + "<th style='text-align: center;'>Area in Acre</th>";
        Str = Str + "<th style='text-align: center;'>Kisam</th>";
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
            strPlotNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strArea = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strKisam = RemStr;
            var DeleteString = "#" + SrNo + "," + strPlotNo + "," + strArea + "," + strKisam + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strPlotNo + "</td>";
            Str = Str + "<td style='' >" + strArea + "</td>";
            Str = Str + "<td style='' >" + strKisam + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";
            strSuspect = strSuspect + "#" + SrNo + "," + strPlotNo + "," + strArea + "," + strKisam + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strPlotNo + "," + strArea + "," + strKisam + "#";
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

        strPlotNo = $('#txtPlotNo').val("").focus();
        strArea = $('#txtAreaInAcer').val("");
        strKisam = $("#txtKisam").val("");

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
    var strName = "", strArea = "", strKisam = "", text = "", opt = "";
    var strName = $("#txtPlotNo").val(); if (strName == "") { text += "<br /> -Please fill Plot Number."; $("#txtPlotNo").attr('style', 'border:1px solid #d03100 !important;'); $("#txtPlotNo").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtPlotNo").attr('style', '1px solid #eee !important;'); $("#txtPlotNo").css({ "background-color": "#ffffff" }); }
    var strArea = $("#txtAreaInAcer").val(); if (strArea == "") { text += "<br /> -Please fill Area in Acre."; $("#txtAreaInAcer").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAreaInAcer").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAreaInAcer").attr('style', '1px solid #eee !important;'); $("#txtAreaInAcer").css({ "background-color": "#ffffff" }); }
    var strKisam = $("#txtKisam").val(); if (strKisam == "") { text += "<br /> -Please fill Kisam."; $("#txtKisam").attr('style', 'border:1px solid #d03100 !important;'); $("#txtKisam").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtKisam").attr('style', '1px solid #eee !important;'); $("#txtKisam").css({ "background-color": "#ffffff" }); }
    if (opt == "1") { return false; }
    return true;
}