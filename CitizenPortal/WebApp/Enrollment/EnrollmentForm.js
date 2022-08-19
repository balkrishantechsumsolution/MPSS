function fuShowHideDiv(divID, isTrue) {
    //alert(divID);
    if (isTrue == "1") {
        $('#' + divID).show(500);
    }
    if (isTrue == "0") {
        //hidedive();
        $('#' + divID).hide(500);
    }

    if (divID == "divMigration") {
        var Migration = $("input[name='Migration']:checked");
        if (Migration.val() != 'undefined' && Migration.val() == "Yes") {
            $('#lblAmount').html("2,000.00 (Rupees Two Thousand only) [Enrollment Fees Rs.1,500 + Rs.500 as Migration Charges");
        }
        else { $('#lblAmount').html("1,500.00 (Rupees One Thousand and five hundred only) [Enrollment Fees Rs.1,500]"); }
    }
}

$(document).ready(function () {
    debugger;
    $("#progressbar").hide();
    $("#DivCore1").hide();
    $("#DivCore2").hide();
    $("#DivCore3").hide();
    $("#DivMIL").hide();
    $("#DivGE").hide();
    $("#DivGEII").hide();
    $("#DivAECC").hide();
    $("#DivSEC").hide();
    $('#EventDate').hide();

    $("#DivMTOther").hide();
    $("#divEnroll").hide();

    GetCollege();
    //GetCourse();
    GetOUATState();
    GetOUATState2();
    GetStateDomisile();

    //GetOUATDistrict2();
    //GetSeniorCitizenOdishaDistrict();
    //GetCBCSCourseList();
    //GetRelationList();

    //GetDistrictPloiceStations();
    if ($("#HFUIDData").val() != "" && $("#HFUIDData").val() != "undefined") {

        BindProfileV2($("#HFUIDData").val(), 0);//function to call with 1 in case of Citizen Profile Data
    }

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

    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);

    //bind data page load
    var qs = getQueryStrings();
    if (qs['AppID'] != null) {
        fnFetchUserDetails(qs['AppID']);
    }
    //Percentage calculation logic

    $('#txtTotalMarks').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtMarkSecure').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtMarkSecure').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtPhyTotalMarks').change(function () {
        $('#txtPhyMarkSecure').val('');
        $('#txtPhyPercentage').val('');
    });
    $('#txtCheTotalMarks').change(function () {
        $('#txtCheMarkSecure').val('');
        $('#txtChePercentage').val('');
    });
    $('#txtMatTotalMarks').change(function () {
        $('#txtMatMarkSecure').val('');
        $('#txtMatPercentage').val('');
    });


    $('#txtPhyMarkSecure').change(function () {
        var percentage = CalculateSubPercentage($('#txtPhyTotalMarks').val(), $('#txtPhyMarkSecure').val());
        $('#txtPhyPercentage').val(percentage);
    });
    $('#txtCheMarkSecure').change(function () {
        var percentage = CalculateSubPercentage($('#txtCheTotalMarks').val(), $('#txtCheMarkSecure').val());
        $('#txtChePercentage').val(percentage);
    });
    $('#txtMatMarkSecure').change(function () {
        var percentage = CalculateSubPercentage($('#txtMatTotalMarks').val(), $('#txtMatMarkSecure').val());
        $('#txtMatPercentage').val(percentage);
    });
    //End Here CalculateSubPercentage ,
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

function ParentBindProfile() {
    if ($("#HFUIDData").val() != "") {

        BindProfileV2($("#HFUIDData").val(), 0);//function to call with 1 in case of Citizen Profile Data
    }
}

/*
New Function to Bind the Page with Citizen Details for Editing the Profile.
*/
function BindProfileV2(JSONData, ProfileType) {

    if (JSONData != "") {
        //alert($("#HFUIDData").val());
        debugger;

        $("#divNonAadhar").hide();
        $("#divSearch").show();
        $("#divBasicInfo").show();
        $("#divAddress").show();
        $("#divBtn").show();
        $("#ddlSearch").prop("disabled", true);
        $("#UID").prop("disabled", true);
        $("#btnSearch").prop("disabled", true);
        //$('#MobileNo').prop('disabled', true);
        //$('#divSearch').hide();
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

                var D1 = t_DOB.split('-');
                var calday = D1[2];
                var calmon = D1[1];
                var calyear = D1[0];
                t_DOB = calday.toString() + "/" + calmon.toString() + "/" + calyear;
            }

            t_DOB = t_DOB.replace(/-/g, "/");
            $('#DOB').val(t_DOB);
            $('#DOB').prop("disabled", true);
            var t_DOB = $("#DOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear(); // selected year

            //var Age = calage(S_date);
            var Age = calage(t_DOB);
            $('#Age').val(Age);
            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);

            //var Age = calcExSerDur(t_DOB, '31/12/2018');
            //$('#Age').val(Age.years);
            //$("#Year").val(Age.years);
            //$("#Month").val(Age.months);
            //$("#Day").val(Age.days);
        }

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);

        $("#UID").val(obj["aadhaarNumber"]);
        $('#UID').prop("disabled", true);


        $("#PAddressLine1").val(obj["houseNumber"]);
        if (obj["houseNumber"] != null) {
            $('#PAddressLine1').prop("disabled", true);
        }
        else { $('#PAddressLine1').prop("disabled", false); }


        $("#PAddressLine2").val(obj["careOf"]);
        if (obj["careOf"] != null) {
            $('#PAddressLine2').prop("disabled", true);
        }
        else { $('#PAddressLine2').prop("disabled", false); }


        $("#PRoadStreetName").val(obj["street"]);
        if (obj["street"] != null) {
            $('#PRoadStreetName').prop("disabled", true);
        }
        else { $('#PRoadStreetName').prop("disabled", false); }


        $("#PLandMark").val(obj["landmark"]);
        if (obj["landmark"] != null) {
            $('#PLandMark').prop("disabled", true);
        }
        else { $('#PLandMark').prop("disabled", false); }


        $("#PLocality").val(obj["locality"]);
        if (obj["locality"] != null) {
            $('#PLocality').prop("disabled", true);
        }
        else { $('#PLocality').prop("disabled", false); }

        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("Male");
                $('#ddlSalutation').val("1");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("Female");
                $('#ddlSalutation').val("2");
            }
            else {
                $('#ddlGender').val("Transgender");
                $('#ddlSalutation').val("3");
            }
            $('#ddlGender').prop("disabled", true);
        }

        document.getElementById('myImg').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);
        EL("HFb64").value = 'data:image/png;base64,' + obj["photo"];

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


    }//end of UID Data
}


function validateUID(UIDVal) {
    debugger;
    if (UIDVal == "1") {
        var UID = $("#UID").val();
        var length = UID.length;

        if ($("#UID").val() == "") {
            alert("Please enter Aadhaar UID number.");
            //$("#UID").focus();
            return false;
        }
        if (eval(length) < 12) {
            alert("Aadhaar UID should be 12 digit");
            $("#UID").val("");

            return false;
        }

    }
}

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
                $("#Year").val(Age.years);
                $("#Month").val(Age.months);
                $("#Day").val(Age.days);

                //var Age = calcExSerDur(t_DOB, '31/12/2017');
                //$('#Age').val(Age.years);

                //$("#Year").val(Age.years);
                //$("#Month").val(Age.months);
                //$("#Day").val(Age.days);
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
        //copy the data when state id 21

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
            url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATState',
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
                    // url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATDistrict',
                    url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/GetSeniorCitizenOdishaDistrict',
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
                                url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATBlock',
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
                                            url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATPanchayat',
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


function ValidateSeniorCitizenOTP() {

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
        url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/ValidateCitizenOTP',
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
            alert('OTP Validation Failed! Please re-enter correct 6 digit OTP received as SMS from Lokaseba Adhikara -CAP, Odisha Govt.');
            alert('OTP Validation Failed! You have entered wrong OTP Code, please re-enter correct OTP Code, which you have received on your registered mobile no. Other wise resend OTP Code from Lokaseba Adhikara -CAP, Odisha Govt.');
        }
        alert("Basic detail saved from Aadhaar.");
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
            alert('Mobile No. ' + $('#txtMobile').val() + ' Already Registered for Senior Citizen Identity Card.' + '\n' + 'Please Login to check the details.')
            rtnurl = "/Account/Login";
            window.location.href = rtnurl;
        }
    }
}


function GetOUATAadhaarCount() {
    var rtnurl = "";
    $('#UID').prop('disabled', true);
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATAadhaarCount',
        data: '{"MobileNo":"' + $('#txtMobile').val() + '","AadhaarNo":"' + $('#UID').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            if (result.d == "1") {
                $('#UidMobNo').attr('style', 'border:2px solid red !important;');
                alert("Aadhaar Number " + $('#UID').val() + ' Already Registered for Senior Citizen Identity Card.' + '\n' + 'Please Login To Check The Details.')
                $('#UID').val("");
                rtnurl = "/Account/Login";
                window.location.href = rtnurl;
            }
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
}


function MobileValidation(MobileNo) {
    var MobileVal = $("[id*=" + MobileNo + "]").val();
    var text = "";
    var opt = "";

    if (isNaN(MobileVal) || MobileVal.indexOf(" ") != -1) {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Mobile Number.";
        //$("[id*=" + MobileNo + "]").attr('style', 'border:1px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (MobileVal.length > 10 || MobileVal.length < 10) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Be Atleast 10 Digit.";
        //$("[id*=" + MobileNo + "]").attr('style', 'border:1px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (!(MobileVal.charAt(0) == "9" || MobileVal.charAt(0) == "8" || MobileVal.charAt(0) == "7" || MobileVal.charAt(0) == "6")) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 9 ,8, 7 or 6.";
        //$("[id*=" + MobileNo + "]").attr('style', 'border:1px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("[id*=" + MobileNo + "]").attr('style', 'border:1px solid green !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#ffffff" });
        return true;
    }

    if (opt == "1") {
        alertPopup("Mobile Information.", text);
        $("[id*=" + MobileNo + "]").val("");
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
    }
}
////validate Student age
function ValiateAge(Ages) {
    debugger;
    var ProgramCode = "";
    var CourseCode = "";
    var Age = Ages;
    if (Age != '') {

        $.when(
          $.ajax({
              type: "POST",
              contentType: "application/json; charset=utf-8",
              url: '/WebApp/Enrollment/StudentForm.aspx/ValidateEnrollmentAge',
              data: '{"CourseCode":"' + CourseCode + '","ProgramCode":"' + ProgramCode + '","Category":"' + $("#ddlCategory option:selected").val() + '","Gender":"' + $("#ddlGender option:selected").val() + '","Age":"' + Age + '","Domicile":"' + $('#ddlDomicileState option:selected').val() + '"}',
              processData: false,
              dataType: "json",
              success: function (response) {

              },
              error: function (a, b, c) {
                  alert("1." + a.responseText);
              }
          })

        ).then(function (data, textStatus, jqXHR) {
            var obj = jQuery.parseJSON(data.d);
            var arrAge = eval(obj.AgeTB);

            if (arrAge[0].Result != "0") {
                alertPopup("Age Validation Failed", arrAge[0].msgResult);
                return;
            }
        });

    }
}


function PinCodeValidation(PinCode) {
    var PinCodeVal = $("[id*=" + PinCode + "]").val();
    if (PinCodeVal.length >= 6) {
        //$("[id*=" + PinCode + "]").attr('style', 'border:2px solid green !important;');
        //$("[id*=" + PinCode + "]").css({ "background-color": "#ffffff" });
        return true;
    }
    else {
        alertPopup("Pincode Validation", "<BR>" + " \u002A" + " Please Enter 6 Digit Pincode.");
        $("[id*=" + PinCode + "]").val('');
        //$("[id*=" + PinCode + "]").attr('style', 'border:2px solid red !important;');
        //$("[id*=" + PinCode + "]").css({ "background-color": "#fff2ee" });
        return false;
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

function GetOUATState() {
    var SelState = $('#PddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATState',
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
        //url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATDistrict',
        url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/GetSeniorCitizenOdishaDistrict',
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
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATBlock',
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
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATPanchayat',
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
    debugger;
    var SelState = $('#CddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATState',
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

function GetSeniorCitizenOdishaDistrict() {
    var SelState = $('#CddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/GetSeniorCitizenOdishaDistrict',
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

function GetOUATDistrict2() {
    var SelState = $('#CddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATDistrict',
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
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATBlock',
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
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATPanchayat',
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


function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return false;
    }

    //$("#btnSubmit").prop('disabled', true);

    var t_Message = "";
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

    var DOB = $("#DOB");

    if (DOB.val() != '') {
        var todaydate = $.datepicker.formatDate('dd/mm/yy', new Date());
        var txtDOB = DOB.val();
        var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
        var Age = calcExSerDur(txtDOB, todaydate);
        var ageToCompare = Age.years;
        var ageActual = Age.years;
    }

    var temp = "Gunwant";
    var AppID = "";
    var rtnurl = "";

    var ResponseType = "C";

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];
    //admission of date
    var AOPArr = $('#DOA').val().split("/");
    var DOAConverted = AOPArr[2] + "-" + AOPArr[1] + "-" + AOPArr[0];

    var DOMArr = $('#MigrationIssue').val().split("/");
    var MigrationDate = DOMArr[2] + "-" + DOMArr[1] + "-" + DOMArr[0];

    var DODArr = $('#txtDomicileDate').val().split("/");
    var DomicileDate = DODArr[2] + "-" + DODArr[1] + "-" + DODArr[0];

    var DOCCArr = $('#txtCasteDate').val().split("/");
    var CasteDate = DOCCArr[2] + "-" + DOCCArr[1] + "-" + DOCCArr[0];

    var RegdNo = $("#RegdNo");
    var RollNo = $("#RollNo");
    var CollegeCode = $("#CollegeName option:selected").val();
    var CollegeName = $("#CollegeName option:selected").val();
    var CourseName = $("#CourseName option:selected").val();
    var ProgramName = $("#ProgramName option:selected").val();
    var AdmissionYear = $("#ddlYear")
    var CourseType = $("#ddlCourseType")
    var EntryType = $("#ddlEntryType")
    var Quota = $("#ddlQuota")
    var DOA = $("#DOA")
    var Level = $("ddlExam option:selected").val();
    var Enroll = $("input[name='Enroll']:checked").val();
    // Basic Information 

    var FirstName = $("#FirstName");
    var FatherName = $("#FatherName");
    var MotherName = $("#MotherName");
    var DOB = $("#DOB");
    var Gender = $("#ddlGender option:selected").text();

    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");

    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Nationality = $("#Nationality option:selected").text();

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
    var AOP = $("#DOA");
    var Branch = $("#ddlBranch option:selected").text();
    var Father = $("#FatherName");
    var Mother = $("#MotherName");

    var AdmissionYear = $("#ddlYear option:selected").val();
    var OtherCourse = $("#OtherCourse").val();
    var CourseType = $("#ddlCourseType option:selected").val();
    var EntryType = $("#ddlEntryType option:selected").val();
    var Quota = $("#ddlQuota option:selected").val();
    var Handicap = $("#ddlHandicap option:selected").val();
    var BloodGroup = $("#ddlBloodGroup option:selected").val();
    var Category = $("#ddlcategory option:selected").val();
    var GapCourse = $("#GapCourse").val();
    var Migration = $("#Migration").val();


    var MarkSheetXDoc = 0;
    if ($('#chkchkClassX').is(":checked")) { MarkSheetXDoc = 1; }
    var MarkSheetXIIDoc = 0;
    if ($('#chkClassXII').is(":checked")) { MarkSheetXIIDoc = 1; }
    var DiplomaCerificateDoc = 0;
    if ($('#chkDiploma').is(":checked")) { DiplomaCerificateDoc = 1; }
    var UGMarkSheetDoc = 0;
    if ($('#chkUG').is(":checked")) { UGMarkSheetDoc = 1; }
    var PGMarkSheetDoc = 0;
    if ($('#chkPG').is(":checked")) { PGMarkSheetDoc = 1; }
    var CasteCertificateDoc = 0;
    if ($('#chkCaste').is(":checked")) { CasteCertificateDoc = 1; }
    var DomicileCertificateDoc = 0;
    if ($('#chkDomicile').is(":checked")) { DomicileCertificateDoc = 1; }
    var MigrationCertificateDoc = 0;
    if ($('#chkMig').is(":checked")) { MigrationCertificateDoc = 1; }
    var GapCertificateDoc = 0;
    if ($('#chkGap').is(":checked")) { GapCertificateDoc = 1; }
    var ScoreCardDoc = 0;
    if ($('#chkScore').is(":checked")) { ScoreCardDoc = 1; }
    var OtherDoc = 0;
    if ($('#chkOtherDoc').is(":checked")) { OtherDoc = 1; }

    var EnrollmentType = $("#Migration").val();

    var datavar = {

        'DTERegistrationNo': $("#RegdNo").val(),
        'DTERollNo': $("#RollNo").val(),
        'CourseName': '',
        'CourseType': $("#ddlCourseType option:selected").val(),
        'EntryType': $("#ddlEntryType option:selected").val(),
        'AdmittedQuota': $("#ddlQuota option:selected").val(),
        'AdmissionDate': DOAConverted,
        'AdmissionYear': $("#ddlYear option:selected").val(),
        'CollegeCode': $('#CollegeName option:selected').val(),
        'CourseCode': $('#CourseName option:selected').val(),
        'ProgramCode': $('#ProgramName option:selected').val(),
        'Level': $("ddlExam option:selected").val(),
        'Enroll': $("input[name='Enroll']:checked").val(),

        'ExamType': $('#ddlExam option:selected').val(),
        'CSVTURedgNo': $("#txtCSVTURegdNo").val(),
        'OtherCourse': $("#OtherCourse").val(),
        'CourseType': $("#ddlCourseType option:selected").val(),
        'EntryType': $("#ddlEntryType option:selected").val(),
        'Quota': $("#ddlQuota option:selected").val(),
        'PhysicallyChallanged': $("#ddlHandicap option:selected").val(),
        'Nationality': $("#ddlNationality option:selected").val(),
        'BloodGroup': $("#ddlBloodGroup option:selected").val(),

        'EducationGap': $("input[name='EduGap']:checked").val(),
        'GapFromYear': $("#FromGap").val(),
        'GapToYear': $("#ToGap").val(),
        'HasMigration': $("input[name='Migration']:checked").val(),
        'MigrationNo': $("#MigrationNo").val(),
        'MigrationDate': MigrationDate,
        'HasScoreCard': $("input[name='ScoureCard']:checked").val(),
        'ScoreCardDetail': $("#txtCompName").val(),

        'StudentName': $('#FirstName').val(),
        'FatherName': $('#FatherName').val(),
        'MotherName': $('#MotherName').val(),

        'Category': $('#ddlcategory option:selected').val(),

        'DOB': DOBConverted,
        'Gender': $('#ddlGender').val(),
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

        'Photograph': $('#HFb64').val(),
        'Signature': $('#HFb64Sign').val(),
        'PathPhotograph': '',
        'PathSignature': '',

        'JSONData': '',

        'CourseDetailXML': document.getElementById("hdfSuspectSave").value,
        'CreatedBy': '',
        'ClientIP': '',
        'CasteCertificate': $('#txtAuthority').val(),
        'CasteCertificateNo': $('#txtCasteNo').val(),
        'CasteCertificateDate': CasteDate,
        'CasteIssuingAuthority': $('#txtAuthority').val(),
        'EntranceRollNo': $('#txtCompRollNo').val(),
        'EntranceMarks': $('#txtScoreCard').val(),

        'DomicileState': $('#ddlDomicileState option:selected').val(),
        'DomicileDistrict': $('#ddlDomicileDistrict option:selected').val(),
        'DomicileTehsil': $('#ddlDomicileTehsil option:selected').val(),
        'DomicileNo': $('#txtDomicileNo').val(),
        'DomicileDate': DomicileDate,
        'DomicleAuthority': $('#txtDomicileAuthority').val(),

        'MarkSheetXDoc': MarkSheetXDoc,
        'MarkSheetXIIDoc': MarkSheetXIIDoc,
        'DiplomaCerificateDoc': DiplomaCerificateDoc,
        'UGMarkSheetDoc': UGMarkSheetDoc,
        'PGMarkSheetDoc': PGMarkSheetDoc,
        'CasteCertificateDoc': CasteCertificateDoc,
        'DomicileCertificateDoc': DomicileCertificateDoc,
        'MigrationCertificateDoc': MigrationCertificateDoc,
        'GapCertificateDoc': GapCertificateDoc,
        'ScoreCardDoc': ScoreCardDoc,
        'OtherDoc': OtherDoc,

        'AdmittedCategory': $('#ddlAdmittedCategory option:selected').val(),

        'PhysicsSubject': $('#txtPhySubject').val(),
        'ChemistrySubject': $('#txtCheSubject').val(),
        'MathematicsSubject': $('#txtMatSubject').val(),

        'PhysicsTM': $('#txtPhyTotalMarks').val(),
        'PhysicsMO': $('#txtPhyMarkSecure').val(),
        'PhysicsPR': $('#txtPhyPercentage').val(),
        'ChemistryTM': $('#txtCheTotalMarks').val(),
        'ChemistryMO': $('#txtCheMarkSecure').val(),
        'ChemistryPR': $('#txtChePercentage').val(),
        'MathematicsTM': $('#txtMatTotalMarks').val(),
        'MathematicsMO': $('#txtMatMarkSecure').val(),
        'MathematicsPR': $('#txtMatPercentage').val(),
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
            url: '/WebApp/Enrollment/EnrollmentForm.aspx/InsertEnrollmentData',
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
            var status = obj.Status;
            var AadhaarNo = obj.AadhaarNo;

            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null) {
                $("#progressbar").hide();
                alertPopup("Form Validation Failed", obj.message);
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (status == "Success") {
                    $("#progressbar").hide();
                    alertPopup("+3 Admission Form", "Application saved successfully. Application ID : " + obj.AppID);//+ " Please Make Payment against the Application Number."
                    //window.location.href = '/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID;
                    //window.location.href = '/WebApp/Kiosk/Forms/Acknowledgement.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID;
                    window.location.href = '/WebApp/Enrollment/Processbar.aspx?SvcID=1467&AppID=' + obj.AppID;
                }
                else if (status == "AadhaarMobile") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar and Mobile No already exist", "Unable to save Application,We have sent login credentials in your registered mobile no.");
                }
                else if (status == "Mobile") {
                    $("#progressbar").hide();
                    alertPopup("Mobile No already exist", "Mobile no already registered. Please enter another mobile no.");
                }
                else if (status == "Aadhaar") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system.");
                }
                else {
                    $("#progressbar").hide();
                    alertPopup("Either Aadhaar/Mobile No already exist", "Unable to save Application, Please refresh the browser and try again");
                }
            }

        });// end of Then function of main Data Insert Function

    return false;
}


function ValidateForm() {
    var text = "";
    var opt = "";

    var RegdNo = $("#RegdNo");
    var RollNo = $("#RollNo");
    var CollegeCode = $("#CollegeCode");
    var CollegeName = $("#CollegeName");
    var AdmissionYear = $("#ddlYear")
    var CourseType = $("#ddlCourseType")
    var EntryType = $("#ddlEntryType")

    var Quota = $("#ddlQuota")
    var DOA = $("#DOA")
    var Exam = $("#ddlExam");
    var Enroll = $("input[name='Enroll']:checked").val();
    // Basic Information 

    var FirstName = $("#FirstName");
    var FatherName = $("#FatherName");
    var MotherName = $("#MotherName");
    var DOB = $("#DOB");
    var Gender = $("#ddlGender option:selected").text();

    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");

    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Nationality = $("#Nationality option:selected").text();

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
    var AOP = $("#DOA");
    var Branch = $("#ddlBranch option:selected").text();
    var Father = $("#FatherName");
    var Mother = $("#MotherName");

    var Category = $("#ddlcategory option:selected").text();
    var Handicap = $("#ddlHandicap option:selected").val();
    var BloodGroup = $("#ddlBloodGroup option:selected").val();


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


    var RegdNo = $("#RegdNo");
    if (RegdNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter DTE Registration No. ";
        RegdNo.attr('style', 'border:1px solid #d03100 !important;');
        RegdNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RegdNo.attr('style', 'border:1px solid #cdcdcd !important;');
        RegdNo.css({ "background-color": "#ffffff" });
    }

    var RollNo = $("#RollNo");
    if (RollNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Roll No of DTE. ";
        RollNo.attr('style', 'border:1px solid #d03100 !important;');
        RollNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }

    var CollegeCode = $("#CollegeName");
    if (CollegeCode.val() == 'undefined' || CollegeCode.val() == '' || CollegeCode.val() == '0') {
        text += "<BR>" + " \u002A" + " Please select College. ";
        CollegeCode.attr('style', 'border:1px solid #d03100 !important;');
        CollegeCode.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        CollegeCode.attr('style', 'border:1px solid #cdcdcd !important;');
        CollegeCode.css({ "background-color": "#ffffff" });
    }

    var CourseName = $("#CourseName");
    if (CourseName.val() == 'undefined' || CourseName.val() == '' || CourseName.val() == '0') {
        text += "<BR>" + " \u002A" + " Please select Course. ";
        CourseName.attr('style', 'border:1px solid #d03100 !important;');
        CourseName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        CourseName.attr('style', 'border:1px solid #cdcdcd !important;');
        CourseName.css({ "background-color": "#ffffff" });
    }

    var ProgramName = $("#ProgramName");
    if (ProgramName.val() == 'undefined' || ProgramName.val() == '' || ProgramName.val() == '0') {
        text += "<BR>" + " \u002A" + " Please select Program. ";
        ProgramName.attr('style', 'border:1px solid #d03100 !important;');
        ProgramName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        ProgramName.attr('style', 'border:1px solid #cdcdcd !important;');
        ProgramName.css({ "background-color": "#ffffff" });
    }

    var CourseType = $("#ddlCourseType")
    if (CourseType.val() == '' || CourseType.val() == '0') {
        text += "<BR>" + " \u002A" + " Please select Course Type. ";
        CourseType.attr('style', 'border:1px solid #d03100 !important;');
        CourseType.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        CourseType.attr('style', 'border:1px solid #cdcdcd !important;');
        CourseType.css({ "background-color": "#ffffff" });
    }

    var EntryType = $("#ddlEntryType")
    if (EntryType.val() == '' || EntryType.val() == '0') {
        text += "<BR>" + " \u002A" + " Please Entry Type. ";
        EntryType.attr('style', 'border:1px solid #d03100 !important;');
        EntryType.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        EntryType.attr('style', 'border:1px solid #cdcdcd !important;');
        EntryType.css({ "background-color": "#ffffff" });
    }

    if ($("#CourseName option:selected").val() != '21') {
    var Quota = $("#ddlQuota option:selected")
    if (Quota.val() == '') {
        text += "<BR>" + " \u002A" + " Please select Admitted Category. ";
        Quota.attr('style', 'border:1px solid #d03100 !important;');
        Quota.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Quota.attr('style', 'border:1px solid #cdcdcd !important;');
        Quota.css({ "background-color": "#ffffff" });
    }
    }
    var AdmissionYear = $("#ddlYear")
    if (AdmissionYear.val() == '0') {
        text += "<BR>" + " \u002A" + " Please select year of Admission. ";
        AdmissionYear.attr('style', 'border:1px solid #d03100 !important;');
        AdmissionYear.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AdmissionYear.attr('style', 'border:1px solid #cdcdcd !important;');
        AdmissionYear.css({ "background-color": "#ffffff" });
    }

    var DOA = $("#DOA")
    if (DOA.val() == '') {
        text += "<BR>" + " \u002A" + " Please select Date of Admission. ";
        DOA.attr('style', 'border:1px solid #d03100 !important;');
        DOA.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOA.attr('style', 'border:1px solid #cdcdcd !important;');
        DOA.css({ "background-color": "#ffffff" });
    }
    debugger;
    /*
    var Level = $("#ddlExam");
    var lblLebel = $('#lblLebel');
    if (Level.val() == 'undefined' || Level.val() == '' || Level.val() == '0') {
        text += "<BR>" + " \u002A" + " Please Exam Type. ";
        Level.attr('style', 'border:1px solid #d03100 !important;');
        Level.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Level.attr('style', 'border:1px solid #cdcdcd !important;');
        Level.css({ "background-color": "#ffffff" });
    }
    */

    if ($("#CourseName option:selected").val() != '21') {
    var AdmittedCategory = $('#ddlAdmittedCategory option:selected');
    if ((AdmittedCategory.val() == '' || AdmittedCategory.val() == 'Select Admitted Category' || AdmittedCategory.val() == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Admitted Category.";
        AdmittedCategory.attr('style', 'border:1px solid #d03100 !important;');
        AdmittedCategory.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AdmittedCategory.attr('style', 'border:1px solid #cdcdcd !important;');
        AdmittedCategory.css({ "background-color": "#ffffff" });
    }
    }
    var Enroll = $("input[name='Enroll']:checked");
    var lblEnroll = $('#lblEnroll');
    if (Enroll.val() == null || Enroll.val() == 'undefined') {

        text += "<BR>" + " \u002A" + " Please Select is enrolled in CSVTU. ";
        lblEnroll.attr('style', 'color:red !important;');
        lblEnroll.css({ "color": "#red" });
        opt = 1;
    } else {
        lblEnroll.attr('style', 'color:#000 !important;');
        lblEnroll.css({ "color": "#000" });
    }

    if (Enroll.val() == 'YES') {
        var CSVTURegdNo = $('#txtCSVTURegdNo')
        if (CSVTURegdNo.val() == null || CSVTURegdNo.val() == '') {
            text += "<BR>" + " \u002A" + " Please enter CSVTU Registration No.";
            CSVTURegdNo.attr('style', 'border:1px solid #d03100 !important;');
            CSVTURegdNo.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            CSVTURegdNo.attr('style', 'border:1px solid #cdcdcd !important;');
            CSVTURegdNo.css({ "background-color": "#ffffff" });
        }
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
    if (Father.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Father Name. ";
        Father.attr('style', 'border:1px solid #d03100 !important;');
        Father.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (Mother.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mother Name. ";
        Mother.attr('style', 'border:1px solid #d03100 !important;');
        Mother.css({ "background-color": "#fff2ee" });
        opt = 1;
    }


    if (DOB.val() == null || DOB.val() == '' || DOB.val() == 'undefined-') {
        text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
        DOB.attr('style', 'border:1px solid #d03100 !important;');
        DOB.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }

    if ((Gender == '' || Gender == 'Select' || Gender == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Gender. ";
        $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlGender").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlGender").css({ "background-color": "#ffffff" });
    }


    if (MobileNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        //MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        //MobileNo.css({ "background-color": "#ffffff" });
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

    if (Nationality != null && (Nationality == '' || Nationality == 'Select' || Nationality == '-Select-')) {
        text += "<BR>" + " \u002A" + " Please select Nationality.";
        $('#Nationality').attr('style', 'border:1px solid #d03100 !important;');
        $('#Nationality').css({ "background-color": "#fff2ee" });
        opt = 1;
    }

    
    if (Category != null && (Category == '' || Category == 'Select' || Category == '-Select-')) {
        text += "<BR>" + " \u002A" + " Please select Category.";
        $('#ddlcategory').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlcategory').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    
    if ($("#CourseName option:selected").val() != '21') {
        if ($('#ddlcategory option:selected').val() != 'UR') {

            var CasteDate = $('#txtCasteDate')
            if (CasteDate.val() == null || CasteDate.val() == '') {
                text += "<BR>" + " \u002A" + " Please select Date of Issue of Caste Certificate";
                CasteDate.attr('style', 'border:1px solid #d03100 !important;');
                CasteDate.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                CasteDate.attr('style', 'border:1px solid #cdcdcd !important;');
                CasteDate.css({ "background-color": "#ffffff" });
            }

            var CasteNo = $('#txtCasteNo')
            if (CasteNo.val() == null || CasteDate.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Caste Certificate Number";
                CasteNo.attr('style', 'border:1px solid #d03100 !important;');
                CasteNo.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                CasteNo.attr('style', 'border:1px solid #cdcdcd !important;');
                CasteNo.css({ "background-color": "#ffffff" });
            }

            var Authority = $('#txtAuthority')
            if (Authority.val() == null || CasteDate.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Caste Certificate issuing Authority";
                Authority.attr('style', 'border:1px solid #d03100 !important;');
                Authority.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                Authority.attr('style', 'border:1px solid #cdcdcd !important;');
                Authority.css({ "background-color": "#ffffff" });
            }
        }
    }

    var EducationGap = $("input[name='EduGap']:checked");
    var EduGap = $('#lblEduGap');
    if (EducationGap.val() == null || EducationGap.val() == 'undefined') {
        text += "<BR>" + " \u002A" + " Please Select if any Gap in Education. ";
        EduGap.attr('style', 'color:red !important;');
        EduGap.css({ "color": "red" });
        opt = 1;
    } else {
        EduGap.attr('style', 'color:#000 !important;');
        EduGap.css({ "color": "#000" });
    }

    if (EducationGap.val() == 'Yes') {
        var FromGap = $('#FromGap');
        if (FromGap.val() == null || FromGap.val() == '') {
            text += "<BR>" + " \u002A" + " Please enter From Gap year in Education";
            FromGap.attr('style', 'border:1px solid #d03100 !important;');
            FromGap.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            FromGap.attr('style', 'border:1px solid #cdcdcd !important;');
            FromGap.css({ "background-color": "#ffffff" });
        }
    }

    if (EducationGap.val() == 'Yes') {
        var ToGap = $('#FromGap');
        if (ToGap.val() == null || ToGap.val() == '') {
            text += "<BR>" + " \u002A" + " Please enter To Gap year in Education";
            ToGap.attr('style', 'border:1px solid #d03100 !important;');
            ToGap.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            ToGap.attr('style', 'border:1px solid #cdcdcd !important;');
            ToGap.css({ "background-color": "#ffffff" });
        }
    }

    var Migration = $("input[name='Migration']:checked");
    var lblMigration = $('#lblMigration');
    if (Migration.val() == null || Migration.val() == 'undefined') {

        text += "<BR>" + " \u002A" + " Please Select if Migration received from previous Eduction Institute. ";
        lblMigration.attr('style', 'color:red !important;');
        lblMigration.css({ "color": "#red" });
        opt = 1;
    } else {
        lblMigration.attr('style', 'color:#000 !important;');
        lblMigration.css({ "color": "#000" });
    }

    if (Migration.val() == 'Yes') {
        var MigrationNo = $('#MigrationNo');
        if (MigrationNo.val() == null || MigrationNo.val() == '') {
            text += "<BR>" + " \u002A" + " Please enter Migration Certificate No";
            MigrationNo.attr('style', 'border:1px solid #d03100 !important;');
            MigrationNo.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            MigrationNo.attr('style', 'border:1px solid #cdcdcd !important;');
            MigrationNo.css({ "background-color": "#ffffff" });
        }

        var MigrationDate = $('#MigrationIssue')
        if (MigrationDate.val() == null || MigrationDate.val() == '') {
            text += "<BR>" + " \u002A" + " Please enter Migration Issue Date";
            MigrationDate.attr('style', 'border:1px solid #d03100 !important;');
            MigrationDate.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            MigrationDate.attr('style', 'border:1px solid #cdcdcd !important;');
            MigrationDate.css({ "background-color": "#ffffff" });
        }
    }


    var ScoureCard = $("input[name='ScoureCard']:checked");
    var lblScoureCard = $('#lblScoureCard');
    if (ScoureCard.val() == null || ScoureCard.val() == 'undefined') {

        text += "<BR>" + " \u002A" + " Please Select if you have any Qualification Exam Score Card. ";
        lblScoureCard.attr('style', 'color:red !important;');
        lblScoureCard.css({ "color": "red" });
        opt = 1;
    } else {
        lblScoureCard.attr('style', 'color:#000 !important;');
        lblScoureCard.css({ "color": "#000" });
    }

    if (ScoureCard.val() == 'YES') {
        var ScoreDetail = $('#txtScoreCard');
        if (ScoreDetail.val() == null || ScoreDetail.val() == '') {
            text += "<BR>" + " \u002A" + " Please enter Migration Certificate No";
            ScoreDetail.attr('style', 'border:1px solid #d03100 !important;');
            ScoreDetail.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            ScoreDetail.attr('style', 'border:1px solid #cdcdcd !important;');
            ScoreDetail.css({ "background-color": "#ffffff" });
        }
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

    if (RoadStreetName != null && RoadStreetName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Road /Street Name in Present Address. ";
        RoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        RoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        RoadStreetName.css({ "background-color": "#ffffff" });
    }

    if (Locality != null && Locality.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Locality in Present Address. ";
        Locality.attr('style', 'border:1px solid #d03100 !important;');
        Locality.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Locality.attr('style', 'border:1px solid #cdcdcd !important;');
        Locality.css({ "background-color": "#ffffff" });
    }

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
        text += "<BR>" + " \u002A" + " Please select District in Permanent  Address.";
        $('#PddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
        $('#PddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PddlDistrict').css({ "background-color": "#ffffff" });
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

    ///////////////////////
    if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Care of Address in Present Address. ";
        PreAddressLine1.attr('style', 'border:1px solid #d03100 !important;');
        PreAddressLine1.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreAddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
        PreAddressLine1.css({ "background-color": "#ffffff" });
    }

    if (PreRoadStreetName != null && PreRoadStreetName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Care of Address in Present Address. ";
        PreRoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        PreRoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        PreRoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        PreRoadStreetName.css({ "background-color": "#ffffff" });
    }

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
        //$('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        //$('#CPinCode').css({ "background-color": "#ffffff" });
    }

    if (PrePincode != null && PrePincode.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Pincode in Present Address.";
        $('#CPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#CPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        //$('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        //$('#CPinCode').css({ "background-color": "#ffffff" });
    }

    //Education
    var BoardRollNo = $("#txtRollNo");
    var BoardName = $("#txtBoard");
    var txtExmntnName = $("#txtCourseName");
    var txtSchool = $("#txtSchool");

    var txtPssngYr = $("#YOP option:selected").text();

    var txtTotalMarks = $("#txtTotalMarks");
    var txtMarkSecure = $("#txtMarkSecure");
    var txtPercentage = $("#txtPercentage");
    if ($("#CourseName option:selected").val() != '21') {
        if ($('#hdfSuspectString') != null && $('#hdfSuspectString').val() == '') {
            text += "<BR>" + " \u002A" + " Please Enter Education Qualifiaction Details.";
            $('#lblEducation').attr('style', 'color:red !important;');
            $('#lblEducation').css({ "color": "red !important;" });
            opt = 1;
        } else {
            $('#lblEducation').attr('style', 'color:red !important;');
            $('#lblEducation').css({ "color": "#ffffff !important;" });
        }
        var EducationContain = $('#hdfSuspectString').val();
    }

    //let Metric = $('#hdfSuspectSave').val().includes("Metriculation");
    //if (Metric == false) {
    //    text += "<BR>" + " \u002A" + " Please Enter Class X, Education Qualifiaction Details.";
    //    $('#ddlBoard').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#ddlBoard').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#ddlBoard').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#ddlBoard').css({ "background-color": "#ffffff" });
    //}

    let HigherSecondary = $('#hdfSuspectSave').val().includes("Higher Secondary");

    //if ($('#hdfCourseCode').val() != "1") {
    //    if (HigherSecondary == false) {
    //        text += "<BR>" + " \u002A" + " Please Enter Class XII, Education Qualifiaction Details.";
    //        $('#ddlBoard').attr('style', 'border:1px solid #d03100 !important;');
    //        $('#ddlBoard').css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $('#ddlBoard').attr('style', 'border:1px solid #cdcdcd !important;');
    //        $('#ddlBoard').css({ "background-color": "#ffffff" });
    //    }
    //}
    // let Graduation = $('#hdfSuspectSave').val().includes("Graduation")
    // if (Graduation == false) {
    // text += "<BR>" + " \u002A" + " Please Enter Graduation, Education Qualifiaction Details.";
    // $('#ddlBoard').attr('style', 'border:1px solid #d03100 !important;');
    // $('#ddlBoard').css({ "background-color": "#fff2ee" });
    // opt = 1;
    // } else {
    // $('#ddlBoard').attr('style', 'border:1px solid #cdcdcd !important;');
    // $('#ddlBoard').css({ "background-color": "#ffffff" });
    // }

    //Higner Secondary
    //Graduation
    //Other
    var MarkSheetXDoc = 0;
    if ($('#chkchkClassX').is(":checked")) { MarkSheetXDoc = 1; }
    var MarkSheetXIIDoc = 0;
    if ($('#chkClassXII').is(":checked")) { MarkSheetXIIDoc = 1; }
    var DiplomaCerificateDoc = 0;
    if ($('#chkDiploma').is(":checked")) { DiplomaCerificateDoc = 1; }
    var UGMarkSheetDoc = 0;
    if ($('#chkUG').is(":checked")) { UGMarkSheetDoc = 1; }
    var PGMarkSheetDoc = 0;
    if ($('#chkPG').is(":checked")) { PGMarkSheetDoc = 1; }
    var CasteCertificateDoc = 0;
    if ($('#chkCaste').is(":checked")) { CasteCertificateDoc = 1; }
    var DomicileCertificateDoc = 0;
    if ($('#chkDomicile').is(":checked")) { DomicileCertificateDoc = 1; }
    var MigrationCertificateDoc = 0;
    if ($('#chkMig').is(":checked")) { MigrationCertificateDoc = 1; }
    var GapCertificateDoc = 0;
    if ($('#chkGap').is(":checked")) { GapCertificateDoc = 1; }
    var ScoreCardDoc = 0;
    if ($('#chkScore').is(":checked")) { ScoreCardDoc = 1; }
    var OtherDoc = 0;
    if ($('#chkOtherDoc').is(":checked")) { OtherDoc = 1; }

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

    //END Here
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}


//**************add more function for Education details.***************************
function AddSuspect(DeleteString) {
    debugger;
    if (validateSuspectValues(DeleteString) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";

        var SrNo = "";
        var strType = "";
        var strRN = "";
        var strExam = "";
        var strBoard = "";
        var strSchool = "";
        var strYear = "";
        var strTotal = "";
        var strObtain = "";
        var strPercentage = "";

        var Str = "";

        if (DeleteString == "") {

            strType = $('#ddlBoard option:selected').val();
            strRN = $('#txtRollNo').val();
            strExam = $('#txtCourseName').val();
            strBoard = $('#txtBoard').val();
            strSchool = $('#txtSchool').val();
            strYear = $('#YOP option:selected').val();
            strTotal = $('#txtTotalMarks').val();
            strObtain = $('#txtMarkSecure').val();
            strPercentage = $('#txtPercentage').val();


            strTempString = document.getElementById("hdfSuspect").value + "#" + SrNo + "|" + strType + "|" + strRN + "|" + strExam + "|" + strBoard + "|" + strSchool + "|" + strYear + "|" + strTotal + "|" + strObtain + "|" + strPercentage + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspect").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No.</th>";
        Str = Str + "<th style='text-align: center;'>Exam Type</th>";
        Str = Str + "<th style='text-align: center;'>Roll No. </th>";
        Str = Str + "<th style='text-align: center;'>Name of the Examination Passed</th>";
        Str = Str + "<th style='text-align: center;'>Name of the Board / Council, State</th>";
        Str = Str + "<th style='text-align: center;'>Name of School / Institution / College</th>";
        Str = Str + "<th style='text-align: center;'>Year Of Passing</th>";
        Str = Str + "<th style='text-align: center;'>Total Marks</th>";
        Str = Str + "<th style='text-align: center;'>Marks Secured</th>";
        Str = Str + "<th style='text-align: center;'>Percentage</th>";
        Str = Str + "<th style='text-align: center;'>Action</th>";
        Str = Str + "</tr>";

        while (strTempString.length > 0) {

            intCount = intCount + 1;
            var StartIndex = strTempString.indexOf("#");
            strTempString = strTempString.substring(StartIndex + 1, strTempString.length);
            var EndIndex = strTempString.indexOf("#");
            var RemStr = strTempString.substring(0, EndIndex);


            StartIndex = RemStr.indexOf("|");
            SrNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);
            SrNo = intCount;

            StartIndex = RemStr.indexOf("|");
            strType = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf("|");
            strRN = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf("|");
            strExam = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf("|");
            strBoard = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf("|");
            strSchool = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf("|");
            strYear = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf("|");
            strTotal = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf("|");
            strObtain = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strPercentage = RemStr;

            var DeleteString = "#" + SrNo + "|" + strType + "|" + strRN + "|" + strExam + "|" + strBoard + "|" + strSchool + "|" + strYear + "|" + strTotal + "|" + strObtain + "|" + strPercentage + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='vertical-align: middle;text-align: center' >" + SrNo + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: left' >" + strType + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: left' >" + strRN + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: left' >" + strExam + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: left' >" + strBoard + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: left' >" + strSchool + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: center' >" + strYear + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: center' >" + strTotal + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: center' >" + strObtain + "</td>";
            Str = Str + "<td style='vertical-align: middle;text-align: center' >" + strPercentage + "</td>";

            Str = Str + "<td align='center' style=''><input class='btn btn-danger' style='width: 80px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";
            // <input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/>
            strSuspect = strSuspect + "#" + SrNo + "|" + strType + "|" + strRN + "|" + strExam + "|" + strBoard + "|" + strSchool + "|" + strYear + "|" + strTotal + "|" + strObtain + "|" + strPercentage + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "|" + strType + "|" + strRN + "|" + strExam + "|" + strBoard + "|" + strSchool + "|" + strYear + "|" + strTotal + "|" + strObtain + "|" + strPercentage + "#";

            var HeirsDXML = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspect').innerHTML = Str;
        document.getElementById("hdfSuspect").value = strSuspect;
        document.getElementById("hdfSuspectSave").value = strSaveSuspect;
        document.getElementById("hdfSuspectString").value = intCount;

        strType = $('#ddlBoard').val("0");
        strRN = $('#txtRollNo').val("");
        strExam = $('#txtCourseName').val("");
        strBoard = $('#txtBoard').val("");
        strSchool = $('#txtSchool').val("");
        strYear = $('#YOP').val("0");
        strTotal = $('#txtTotalMarks').val("");
        strObtain = $('#txtMarkSecure').val("");
        strPercentage = $('#txtPercentage').val("");
    }
}
function DelString(DeleteString) {
    debugger;
    var Msg = "Do you want remove this Exam Detail?";
    if (confirm(Msg)) {
        var strString = document.getElementById('hdfSuspect').value;
        strString = strString.replace(DeleteString, "");
        document.getElementById('hdfSuspect').value = strString;
        AddSuspect(DeleteString);
    }
}

function validateSuspectValues(DeleteString) {
    if (DeleteString != '') {
        return true;
    }

    var SrNo = "";
    var strRN = "";
    var strExam = "";
    var strBoard = "";
    var strSchool = "";
    var strYear = "";
    var strTotal = "";
    var strObtain = "";
    var strPercentage = "";

    var isError = false;
    var strMsg = "";
    strType = $('#ddlBoard option:selected').val();
    strRN = $('#txtRollNo');
    strExam = $('#txtCourseName');
    strBoard = $('#txtBoard');
    strSchool = $('#txtSchool');
    strYear = $('#YOP option:selected').val();
    strTotal = $('#txtTotalMarks');
    strObtain = $('#txtMarkSecure');
    strPercentage = $('#txtPercentage');

    if (strType == "" || strType == "0") {
        strMsg = strMsg + "</br> * Please select Exam Type.";
        document.getElementById('ddlBoard').focus();
        $('#ddlBoard').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBoard').css({ "background-color": "#fff2ee" });
        isError = true;
    } else {
        $('#ddlBoard').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlBoard').css({ "background-color": "#ffffff" });
    }
    if (strRN.val() == "") {
        strMsg = strMsg + "</br> * Please Enter Exam Roll No.";
        document.getElementById('txtRollNo').focus();
        strRN.attr('style', 'border:1px solid #d03100 !important;');
        strRN.css({ "background-color": "#fff2ee" });
        isError = true;
    } else {
        strRN.attr('style', 'border:1px solid #cdcdcd !important;');
        strRN.css({ "background-color": "#ffffff" });
    }

    if (strExam.val() == "") {
        strMsg = strMsg + "</br> * Please Enter Name of the Examination Passed.";
        document.getElementById('txtCourseName').focus();
        strExam.attr('style', 'border:1px solid #d03100 !important;');
        strExam.css({ "background-color": "#fff2ee" });
        isError = true;
    } else {
        strExam.attr('style', 'border:1px solid #cdcdcd !important;');
        strExam.css({ "background-color": "#ffffff" });
    }
    if (strBoard.val() == "") {
        strMsg = strMsg + "</br> * Please Enter Name of the Board/Council, State.";
        document.getElementById('txtBoard').focus();
        strBoard.attr('style', 'border:1px solid #d03100 !important;');
        strBoard.css({ "background-color": "#fff2ee" });
        isError = true;
    } else {
        strBoard.attr('style', 'border:1px solid #cdcdcd !important;');
        strBoard.css({ "background-color": "#ffffff" });
    }
    if (strSchool.val() == "") {
        strMsg = strMsg + "</br> * Please Enter Name of School/Institution / College.";
        document.getElementById('txtSchool').focus();
        strSchool.attr('style', 'border:1px solid #d03100 !important;');
        strSchool.css({ "background-color": "#fff2ee" });
        isError = true;
    } else {
        strSchool.attr('style', 'border:1px solid #cdcdcd !important;');
        strSchool.css({ "background-color": "#ffffff" });
    }

    if (strYear == "0" || strYear == "") {
        strMsg = strMsg + "</br> * Please Select Year of Passing.";
        document.getElementById('YOP').focus();
        $('#YOP').attr('style', 'border:1px solid #d03100 !important;');
        $('#YOP').css({ "background-color": "#fff2ee" });
        isError = true;
    } else {
        $('#YOP').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#YOP').css({ "background-color": "#ffffff" });
    }

    if (strTotal.val() == "") {
        strMsg = strMsg + "</br> * Please Enter Total Mark of Examination.";
        document.getElementById('txtTotalMarks').focus();
        strTotal.attr('style', 'border:1px solid #d03100 !important;');
        strTotal.css({ "background-color": "#fff2ee" });
        isError = true;
    } else {
        strTotal.attr('style', 'border:1px solid #cdcdcd !important;');
        strTotal.css({ "background-color": "#ffffff" });
    }
    if (strObtain.val() == "") {
        strMsg = strMsg + "</br> * Please Enter Total Mark Obtained.";
        document.getElementById('txtMarkSecure').focus();
        strObtain.attr('style', 'border:1px solid #d03100 !important;');
        strObtain.css({ "background-color": "#fff2ee" });
        isError = true;
    } else {
        strObtain.attr('style', 'border:1px solid #cdcdcd !important;');
        strObtain.css({ "background-color": "#ffffff" });
    }



    if (isError == true) {
        document.getElementById("divmore").innerHTML = " * Below are the Last Course Attended by Student validation error(s), please rectify! <br> " + strMsg;
        $("#divmore").show();
        document.getElementById("divmore").focus();
        return false;
    }
    else {
        document.getElementById("divmore").innerHTML = "";
        $("#divmore").hide();
    }
    return true;

}

/*Validate Aadhaar Number weather already exist on not 11 Aug 2017--*/
function ValidateMobileAndAdmissionNo(Value, Type) {
    debugger;

    //$("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/ValidateAadhaarNo',
            data: '{"Value":"' + value + '","Type":"' + Type + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                debugger;
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
            var status = obj.Status;
            var AadhaarNo = obj.AadhaarNo;
            var CardNo = obj.CardNo;
            var Dist = obj.District;
            var PS = obj.PoliceStation;
            var intStatus = obj.intStatus;

            AppID = obj.AppID;
            result = true;

            if (status == "AadhaarExist") {
                $("#progressbar").hide();
                alertPopup("Aadhaar No already exist", "Aadhaar Number already exist,We have sent login credentials in your registered mobile no. Please login and apply for service.");
            }
            else if (status == "AadhaarExistInCard") {
                $("#progressbar").hide();
                alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system with Reg. No. " + CardNo + " from district " + Dist + " and Police Station " + PS);
            }
            else {
                $("#progressbar").hide();
                alertPopup("Either Aadhaar/Mobile No already exist", "Unable to save Application, Please refresh the browser and try again");

            }



        });// end of Then function of main Data Insert Function

    return false;
}


function ClearDropValue() {
    $("#ddlAP").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlAP1").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlAP2").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlMIL").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlGE").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlGEII").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlAECC").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlSECB").empty().append('<option selected="selected" value="0">Select</option>');
}
//below code use to bind checkboxlist with div id
function AjaxSucceeded(result) {
    BindCheckBoxList(result);
}
function AjaxFailed(result) {
    alert('Failed to load checkbox list');
}
function BindCheckBoxList(result) {

    var items = JSON.parse(result.d);
    CreateCheckBoxList(items);
}
function CreateCheckBoxList(checkboxlistItems) {
    var table = $('<table></table>');
    var counter = 0;
    $(checkboxlistItems).each(function () {
        table.append($('<tr></tr>').append($('<td></td>').append($('<input>').attr({
            type: 'checkbox', name: 'chklistitem', value: this.Id, id: 'chklistitem' + counter
        })).append(
        $('<label style="display:inline">').attr({
            for: 'chklistitem' + counter++
        }).text(this.Name))));
    });
    $('#divchklist').empty();
    $('#divchklist').append(table);
}

//application details by aapid on page load...............
function fnFetchUserDetails(AppID) {
    debugger;
    $.when(
      $.ajax({
          type: "POST",
          contentType: "application/json; charset=utf-8",
          url: '/WebApp/Enrollment/StudentForm.aspx/GetApplicationDetails',
          data: '{"AppID":"' + AppID + '"}',
          processData: false,
          dataType: "json",
          success: function (response) {

          },
          error: function (a, b, c) {
              alert("1." + a.responseText);
          }
      })
       ).then(function (data, textStatus, jqXHR) {
           var obj = jQuery.parseJSON(data.d);
           var AppID = obj.ApplicationTB[0].RegdNo;
           var arr = eval(obj.ApplicationTB);
           var arrAge = eval(obj.AgeTB);
           var html = "";
           var RegdNo = arr[0].RegdNo;
           var RollNo = arr[0].RollNo
           var Name = arr[0].Name;
           //var mobile = arr[0].Mobile;
           //var email = arr[0].Email;
           var Father = arr[0].FatherName;
           var Mother = arr[0].MotherName;
           var DOB = arr[0].DOB;
           var Gender = arr[0].Gender;
           var Category = arr[0].Category;
           //var Age = arr[0].Age;
           var Years = arrAge[0].Years;
           var Months = arrAge[0].Months;
           var Days = arrAge[0].Days;
           var CollegeName = arr[0].CollegeName;
           var CollegeCode = arr[0].CollegeCode;
           var CourseName = arr[0].CourseName;
           var ProgramName = arr[0].ProgramName;

           var CourseCode = arr[0].CourseCode;
           var ProgrammCode = arr[0].ProgrammCode;
           var AdmittedCategory = arr[0].Caste_Category_Gender_Seat_Name;
           $('#hdfCourseCode').val(CourseCode);
           $('#hdfProgramCode').val(ProgrammCode);

           if (CollegeName != null && CollegeName != "") {
               $('#CollegeName').val(CollegeName);
               $('#CollegeName').prop('disabled', true);
           }
           if (CollegeCode != null && CollegeCode != "") {
               $('#CollegeCode').val(CollegeCode);
               $('#CollegeCode').prop('disabled', true);
           }
           if (Name != null && Name != "") {
               $('#FirstName').val(Name);
               $('#FirstName').prop('disabled', true);
           }

           //if (email != null && email != "") {
           //    $('#EmailID').val(email);
           //    $('#EmailID').prop('disabled', true);
           //}

           if (CourseName != null && CourseName != "") {
               $('#CourseName').val(CourseName);
               $('#CourseName').prop('disabled', true);
           }
           if (RegdNo != null && RegdNo != "") {
               $('#RegdNo').val(RegdNo);
               $('#RegdNo').prop('disabled', true);
           }
           if (RollNo != null && RollNo != "") {
               $('#RollNo').val(RollNo);
               $('#RollNo').prop('disabled', true);
           }
           if (Father != null && Father != "") {
               $('#FatherName').val(Father);
               $('#FatherName').prop('disabled', true);
           }
           if (Mother != null && Mother != "") {
               $('#MotherName').val(Mother);
               $('#MotherName').prop('disabled', true);
           }

           if (DOB != null && DOB != "") {
               $('#DOB').val(DOB);
               //$('#DOB').prop('disabled', true);
           }
           //if (Age != null && Age != "") {
           //    $('#Age').val(Age);
           //    $('#Age').prop('disabled', true);
           //}

           //if (AdmittedCategory != null && AdmittedCategory != "") {
           //    selectByVal("ddlAdmittedCategory", AdmittedCategory);
           //    $('#ddlAdmittedCategory').prop('disabled', true);
           //}

           if (Category != null && Category != "") {
               selectByVal("ddlAdmittedCategory", Category);
               $('#ddlAdmittedCategory').prop('disabled', true);               
           }

           if (Years != null && Years != "") {
               $("#Year").val(Years + " Years");
               $("#Month").val(Months + " Month");
               $("#Day").val(Days + " Days");
               $('#Year').prop('disabled', true);
               $('#Month').prop('disabled', true);
               $('#Day').prop('disabled', true);
           }
           if (Gender != null && Gender != "") {
               selectByVal("ddlGender", Gender);
               $('#ddlGender').prop('disabled', true);
           }
           if (Category != null && Category != "") {
               selectByVal("ddlcategory", Category);
               //$('#ddlcategory').prop('disabled', true);
               if (Category != "UR") {
                   $('#lblCategory').show();
               }
               else { $('#lblCategory').hide(); }
           }
           if (ProgramName != null && ProgramName != "") {
               $('#ProgramName').val(ProgramName);
               $('#ProgramName').prop('disabled', true);
           }

       });
}

function GetCaste() {
    debugger;
    if ($("#CourseName option:selected").val() != '21') {
    if ($('#ddlcategory').val() != "UR") {
        $('#lblCategory').show();
    }
    else { $('#lblCategory').hide(); }
    }else { $('#lblCategory').hide(); }
}

//data submit by applicant
function SubmitDataByStudent() {
    debugger;
    if (!ValidateForm()) {
        return false;
    }

    //$("#btnSubmit").prop('disabled', true);

    var t_Message = "";
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
    var AppID = qs["AppID"];

    var DOB = $("#DOB");

    if (DOB.val() != '') {
        var todaydate = $.datepicker.formatDate('dd/mm/yy', new Date());
        var txtDOB = DOB.val();
        var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
        var Age = calcExSerDur(txtDOB, todaydate);
        var ageToCompare = Age.years;
        var ageActual = Age.years;
    }

    var temp = "Gunwant";
    var rtnurl = "";

    var ResponseType = "C";

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];
    //admission of date
    var AOPArr = $('#DOA').val().split("/");
    var DOAConverted = AOPArr[2] + "-" + AOPArr[1] + "-" + AOPArr[0];

    var MotherTongue = "";
    if ($('#txtTongue option:selected').text() == "Other") {
        MotherTongue = $('#MTOther').val();
    }
    else {
        MotherTongue = $('#txtTongue option:selected').text()
    }

    var datavar = {

        'AppID': AppID,
        'ProfileID': uid,
        'AadhaarNumber': $('#UID').val(),
        'AadhaarDetail': $('#ddlSearch option:selected').text(),
        'AppName': $('#FirstName').val(),
        'DOB': DOBConverted,
        'Gender': $('#ddlGender').val(),
        'MobileNo': $('#MobileNo').val(),
        'EmailId': $('#EmailID').val(),
        'MotherTongue': MotherTongue,//$('#txtTongue option:selected').text(),
        'careOf': "1",
        'careOfLocal': "1",
        'pcareOf': "1",
        'residentName': $('#FirstName').val(),
        'residentNameLocal': $('#FirstName').val(),
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

        'state': $('#PddlState').val(),
        'stateLocal': $('#PddlState').val(),
        'district': $('#PddlDistrict').val(),
        'districtLocal': $('#PddlDistrict').val(),
        'subDistrict': $('#PddlTaluka').val(),
        'subDistrictLocal': $('#PddlTaluka').val(),
        'Village': $('#PddlVillage').val(),
        'pincode': $('#PPinCode').val(),
        'pincodeLocal': $('#PPinCode').val(),

        'Image': $('#HFb64').val(),
        'ImageSign': $('#HFb64Sign').val(),
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

        'FatherName': $('#FatherName').val(),
        'MotherName': $('#MotherName').val(),
        'GuardianName': $('#GuardianName').val(),
        'Relation': $('#ddlRelation option:selected').text(),
        'Category': $('#ddlcategory option:selected').text(),
        'phone': "1",
        'ResponseType': ResponseType,
        'responseCode': "",
        'HeirsDXML': document.getElementById("hdfSuspectSave").value,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'IsActive': "1",
        'AdmissionDate': DOAConverted,
        'AdmissionNo': $('#AdmissionNo').val(),
        'Branch': $('#ddlBranch option:selected').val(),
        'CollegeCode': $('#CollegeCode').val(),
        'Subject1': $('#ddlAP option:selected').val(),
        'Subject2': $('#ddlAP1 option:selected').val(),
        'Subject3': $('#ddlAP2 option:selected').val(),
        'Subject4': $('#ddlGE option:selected').val(),
        'Subject5': $('#ddlMIL option:selected').val(),
        'Subject6': $('#ddlAECC option:selected').val(),
        'Subject7': $('#ddlSECB option:selected').val(),
        'Subject8': $('#ddlGEII option:selected').val(),

        'RollNoSSC': $("#txtBoardRollNo").val(),
        'BoardNameSSC': $("#txtBoardName").val(),
        'ExamPassSSC': $("#txtExmntnName").val(),
        'PassingYearSSC': $("#txtPssngYr option:selected").text(),
        'GradeTypeSSC': $("#ddlPctgeCalclte option:selected").text(),
        'TotalMarkSSC': $("#txtTotalMarks").val(),
        'MarkObtainedSSC': $("#txtMarkSecure").val(),
        'PercentageSSC': $("#txtPercentage").val(),

        'BoardType': $("#ddlBoard option:selected").val(),
        'RollNoHSC': $("#txtBoardRollNo2").val(),
        'BoardNameHSC': $("#txtBoardName2").val(),
        'ExamPassHSC': $("#txtExmntnName2").val(),
        'PassingYearHSC': $("#txtPssngYr2 option:selected").text(),
        'GradeTypeHSC': $("#ddlPctgeCalclte2 option:selected").text(),
        'TotalMarkHSC': $("#txtTotalMarks2").val(),
        'MarkObtainedHSC': $("#txtMarkSecure2").val(),
        'PercentageHSC': $("#txtPercentage2").val(),
        //'PhysicsTM': $("#txtPhyTotalMarks").val(),
        //'PhysicsMO': $("#txtPhyMarkSecure").val(),
        //'PhysicsPR': $("#txtPhyPercentage").val(),
        //'ChemistryTM': $("#txtCheTotalMarks").val(),
        //'ChemistryMO': $("#txtCheMarkSecure").val(),
        //'ChemistryPR': $("#txtChePercentage").val(),
        //'MathematicsTM': $("#txtMatTotalMarks").val(),
        //'MathematicsMO': $("#txtMatMarkSecure").val(),
        //'MathematicsPR': $("#txtMatPercentage").val(),
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
            url: '/WebApp/Kiosk/CBCS/StudentForm.aspx/InsertCBCSAdmissionDataByStudent',
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
            var status = obj.Status;
            var AadhaarNo = obj.UID;

            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null) {
                alertPopup("Form Validation Failed", "Error While Saving Application., <BR> Either You Have Used MobileNumber or AadhaarNumber Which Has Been Used Earlier.");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (status == "Success") {
                    $("#progressbar").hide();
                    alertPopup("+3 Admission Form CBCS", "Application saved successfully. Reference ID : " + obj.AppID);//+ " Please Make Payment against the Application Number."
                    //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=449&AppID=' + obj.AppID;
                    window.location.href = '/WebApp/Kiosk/CBCS/AdmissionProcessBar.aspx?SvcID=1449&AppID=' + obj.AppID + '&UID=' + AadhaarNo;
                    Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&UID=" + Session["UID"], false);
                }
                else if (status == "AadhaarMobile") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar and Mobile No already exist", "Unable to save Application,We have sent login credentials in your registered mobile no.");
                }
                else if (status == "Mobile") {
                    $("#progressbar").hide();
                    alertPopup("Mobile No already exist", "Mobile no already registered. Please enter another mobile no.");
                }
                else if (status == "Aadhaar") {
                    $("#progressbar").hide();
                    alertPopup($("#AdmissionNo").val() + " already exist", "Your Login ID " + AadhaarNo + " already exist in the system.");
                }
                else {
                    $("#progressbar").hide();
                    alertPopup("Either Aadhaar/Mobile No already exist", "Unable to save Application, Please refresh the browser and try again");
                }
            }

        });// end of Then function of main Data Insert Function

    return false;
}


function calculatepercentage(TotalMarks, MarksObtained) {


    //if(Board=="")

    if (TotalMarks == "") return;

    var result = 0;
    if (MarksObtained == "") return;

    if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
        alertPopup("Total & Obtained Marks Validate", "Total Marks must be greater than Marks Obtained");
        $('#txtTotalMarks').val("");
        $('#txtMarkSecure').val("");
        $("#txtPercentage").val("");

        return;
    }

    if (TotalMarks <= 0) TotalMarks = 1;

    result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

    $("#txtPercentage").val(result);

    //var Board = $('#ddlBoard option:selected').val();
    //if (Board == "0") { alert('Please select Examination type!'); return; }
    //if (Board == "Metriculation") { alert('Metriculation'); return; }
    //if (Board == "Higner Secondary") { alert('Higher Secondary'); return; }
    //if (Board == "Graduation") { alert('Graduation'); return; }
    //if (Board == "Other") { alert('other');return; }

}

function CalculateSubPercentage(TotalMarks, MarksObtained) {


    //Percentage

    if (TotalMarks == "") return;

    var result = 0;
    if (MarksObtained == "") return;

    if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
        alertPopup("Total & Obtained Marks Validate", "Total Marks must be greater than Marks Obtained");
        TotalMarks.val("");
        MarksObtained.val("");
        Percentage.val("");

        return;
    }

    if (TotalMarks <= 0) TotalMarks = 1;

    result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

    return result;

}



function BoardOnChange() {
    $('#txtTotalMarks').val('');
    $('#txtMarkSecure').val('');
    $('#txtPercentage').val('');
}



function BindBranch(BranchName) {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSCourseList',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlps = $("#ddlBranch");
            ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlBranch").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
            $('#ddlBranch').val(BranchName);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetQuota() {
    debugger;
    if ($('#ddlCourseType option:selected').val() == '2') {
        $('#divQuota').show(500);
    }
    else {
        $('#divQuota').hide(500);
    }
}


function GetStateDomisile() {
    debugger;
    var SelState = $('#ddlDomicileState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATState',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlState = $("[id=ddlDomicileState]");
            ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlDomicileState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetDomosileDistrict() {
    var SelState = $('#ddlDomicileState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATDistrict',
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlDistrict = $("[id=ddlDomicileDistrict]");
            ddlDistrict.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlDomicileDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetDomosileBlock() {
    var SelBlock = $('#ddlDomicileDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATBlock',
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlBlock = $("[id=ddlDomicileTehsil]");
            ddlBlock.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlDomicileTehsil]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function ValidateCSVTURegNo() {
    var RegdNo = $('#txtCSVTURegdNo');

    //let regex = /[a-zA-Z]+([+-]?(?=\.\d|\d)(?:\d+)?(?:\.?\d*))(?:[eE]([+-]?\d+))?/i;

    if (RegdNo.val() != '') {
        var regex = /[a-zA-Z]+([+-]?(?=\.\d|\d)(?:\d+)?(?:\.?\d*))(?:[eE]([+-]?\d+))?/i;
        if (!regex.test(RegdNo.val())) {
            RegdNo.val('');
            RegdNo.attr('style', 'border:1px solid #d03100 !important;');
            RegdNo.css({ "background-color": "#fff2ee" });
            alertPopup("Registration No Validation!", " Please Enter correct CSVTU Registration No.");
            return;
        } else {
            RegdNo.attr('style', 'border:1px solid #cdcdcd !important;');
            RegdNo.css({ "background-color": "#ffffff" });

        }

        return regex.test(RegdNo);
    }
}

//-=========================================================================--


function GetCollege() {
    
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Enrollment/EnrollmentForm.aspx/GetCollege',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var CollegeName = $("[id=CollegeName]");
            CollegeName.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=CollegeName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetCourse() {
    var CollegeCode = $('#CollegeName').val()
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Enrollment/EnrollmentForm.aspx/GetCourse',
        data: '{"CollegeCode":"' + CollegeCode + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var CourseName = $("[id=CourseName]");
            CourseName.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=CourseName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetProgram() {
    var SelCourse = $('#CourseName').val();
    if(SelCourse == '21'){
        $('#lblCategory').hide();
        $('#divMark').hide();
    }
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Enrollment/EnrollmentForm.aspx/GetProgram',
        data: '{"CourseCode":"' + SelCourse + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ProgramName = $("[id=ProgramName]");
            ProgramName.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ProgramName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

const DOBFormat = /^\d{4}\-\d{2}\-\d{2}$/;
document.getElementById("DOB").addEventListener("change", checkingForValidDate);

function checkingForValidDate() {
    console.log(this.value, DOBFormat.test(this.value));
    this.classList.toggle('DOB', DOBFormat.test(this.value));
}