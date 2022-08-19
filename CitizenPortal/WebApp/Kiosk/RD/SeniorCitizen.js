

$(document).ready(function () {
    debugger;
    $("#progressbar").hide();
    $('#txtPoliceStation').hide();


    GetOUATState();
    GetOUATState2();
    //GetOUATDistrict2();
    GetSeniorCitizenOdishaDistrict();

    var DistPS = $("#HDFDistrict").val();
    
    if (DistPS != "" && DistPS!="undefined")
    {
        if (DistPS = "381")
        {
            DistPS = "Cuttak";
        }
        else if (DistPS = "382")
        {
            DistPS = "Bhubaneswar";
        }
        $('#PddlDistrict1 option:selected').text(DistPS),
        $("#PddlDistrict1").prop("disabled", true);

        GetDistrictPloiceStations();
       
    }
   

    if ($("#HFUIDData").val() != "") {

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


    //$("#HaveMedicalHistory").bind("change", function (e) {
    //    if ($("#HaveMedicalHistory").val() == "0" || $("#HaveMedicalHistory").val() == "Select" || $("#HaveMedicalHistory").val() == "No") {
    //        $("#DivMedicalHistory").hide(800);
    //    }
    //    else {
    //        $("#DivMedicalHistory").show(800);
    //    }
    //});
    ////for relative
    //$("#RelativeStaying").bind("change", function (e) {
    //    if ($("#RelativeStaying").val() == "0" || $("#RelativeStaying").val() == "Select" || $("#RelativeStaying").val() == "No") {
    //        $("#DivRelativeDetails").hide(800);
    //    }
    //    else {
    //        $("#DivRelativeDetails").show(800);
    //    }
    //});
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

            var Age = calcExSerDur(t_DOB, '31/12/2017');
            $('#Age').val(Age.years);
            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);
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

        //if (UIDVal == "1") {
        //code = UIDVal;
        //}

        //CheckLocalAadhar($("#UID").val());
        var UID = $("#UID").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=424&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
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
        if (State == "21") {
            GetStateUID($("#" + objState).val(), $("#" + objDistrict).val(), $("#" + objTaluka).val(), $("#" + objVillage).val());
            $('#CAddressLine1').val(Addressline1);
            $('#CAddressLine2').val(Addressline2);
            $('#CRoadStreetName').val(RoadStreetName);
            $('#CLandMark').val(LandMark);
            $('#CLocality').val(Locality);
            $('#CPinCode').val(Pincode);
        }
    }
    else {
        $('#CAddressLine1').val("");
        $('#CAddressLine2').val("");
        $('#CRoadStreetName').val("");
        $('#CLandMark').val("");
        $('#CLocality').val("");

        //$("[id*=" + AddState + "]").val("0");
        //$("[id*=" + AddDistrict + "]").empty();
        //$("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');
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
        //$("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (MobileVal.length > 10 || MobileVal.length < 10) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Be Atleast 10 Digit.";
        //$("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (!(MobileVal.charAt(0) == "9" || MobileVal.charAt(0) == "8" || MobileVal.charAt(0) == "7")) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 9 ,8 or 7.";
        //$("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        //$("[id*=" + MobileNo + "]").attr('style', 'border:2px solid green !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#ffffff" });
        //return true;
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
////validate senior citizen age
function ValiateSCAge(Ages) {
    debugger;
    var Age = Ages;
    if (Age != '') {
        if (Age < 60 || Age == 0) {
            $("#Year").val('');
            $("#Month").val('');
            $("#Day").val('');
            $("#DOB").val('');
            var dob = $("#DOB");

            //dob.attr('style', 'border:1px solid #d03100 !important;');
            //dob.css({ "background-color": "#fff2ee" });
            alertPopup("Age Validation", "<BR>" + " \u002A" + "For apply this service your age should be minimum 60 year.")
        }
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
                $('#CddlState option:selected').text('Odisha'),
           $("#CddlState").prop("disabled", true);
            });
           
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetSeniorCitizenOdishaDistrict() {
    var SelState = "21";//$('#CddlState').val();
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
    var SelState = "21";//$('#CddlState').val();
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

    //var BloodGroup = 'No';
    //if ($('#BloodGroup').is(":checked")) {
    //    BloodGroup = 'Yes';
    //}

    var Arthritis = 'No';
    if ($('#Arthritis').is(":checked")) {
        Arthritis = 'Yes';
    }

    var HeartDisease = 'No';
    if ($('#HeartDisease').is(":checked")) {
        HeartDisease = 'Yes';
    }

    var Cancer = 'No';
    if ($('#Cancer').is(":checked")) {
        Cancer = 'Yes';
    }

    var RespiratoryDiseases = 'No';
    if ($('#RespiratoryDiseases').is(":checked")) {
        RespiratoryDiseases = 'Yes';
    }

    var AlzheimerDisease = 'No';
    if ($('#AlzheimerDisease').is(":checked")) {
        AlzheimerDisease = 'Yes';
    }

    var Osteoporosis = 'No';
    if ($('#Osteoporosis').is(":checked")) {
        Osteoporosis = 'Yes';
    }

    var Diabetes = 'No';
    if ($('#Diabetes').is(":checked")) {
        Diabetes = 'Yes';
    }

    var InfluenzaPneumonia = 'No';
    if ($('#InfluenzaPneumonia').is(":checked")) {
        InfluenzaPneumonia = 'Yes';
    }

    var Others = 'No';
    if ($('#Others').is(":checked")) {
        Others = 'Yes';
    }

    var datavar = {

        'ProfileID': uid,
        'AadhaarNumber': $('#UID').val(),
        'AadhaarDetail': $('#ddlSearch option:selected').text(),
        'AppMobileNo': $('#txtMobile').val(),
        'PSDistrict': $('#PddlDistrict1 option:selected').text(),
        'DPoliceStation': $('#Pddlps option:selected').text(),
        'PoliceStation': '',//$('#PoliceStationName').val(),
        'AppName': $('#FirstName').val(),
        'DOB': DOBConverted,
        'Year': $('#Year').val(),
        'Month': $('#Month').val(),
        'Day': $('#Day').val(),
        'Gender': $('#ddlGender').val(),
        'Nationality': $('#Nationality').val(),
        'MobileNo': $('#MobileNo').val(),
        'EmailId': $('#EmailID').val(),
        'SpouseName': $('#SpouseName').val(),
        'RelativeSameCity': $("input[name='RelativeY']:checked").val(),
        'MedicalHistory': $("input[name='RBTNMedical']:checked").val(),

        'BloodGroup': $('#ddlBloodGroup option:selected').text(),
        'Arthritis': Arthritis,
        'HeartDisease': HeartDisease,
        'Cancer': Cancer,
        'RespiratoryDiseases': RespiratoryDiseases,
        'AlzheimerDiseases': AlzheimerDisease,
        'Osteoporosis': Osteoporosis,
        'Diabetes': Diabetes,
        'InfluenzaPheumonia': InfluenzaPneumonia,
        'Others': Others,
        'DescribeOther': $('#OtherDisease').val(),
        'DoctorName': $('#FamilyDoctorName').val(),
        'DoctorMobileNo': $('#FamilyDoctorNo').val(),
        'DoctorAddress': $('#FamilyDoctorAddress').val(),
        'DoctorPinCode': $('#FamilyDoctorPincode').val(),

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

        //'SPersonType': $('#SddlPersonType option:selected').text(),
        //'SNameOfPerson': $('#txtSNameOfPerson').val(),
        //'SAddress': $('#txtSAddress').val(),
        //'SMobile': $('#txtSMobile').val(),
        'MotherName': $('#txtMotherName').val(),
        'FatherName': $('#txtFatherName').val(),
        'Religion': $('#ddlReligion option:selected').text(),
        'Category':$('#ddlCategory option:selected').text(),
        'LandLineNo': $('#txtlandlineno').val(),
        'ResponseType': ResponseType,

        'HeirsDXML': document.getElementById("hdfSuspectSave").value,
        'HeirsDXMLS': document.getElementById("hdfSuspectSaveS").value,
       
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
            url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/InsertSeniorCitizenData',
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
            var CardNo = obj.CardNo;
            var Dist = obj.District;
            var PS = obj.PoliceStation;

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
                    alertPopup("Senior Citizen RD", "Application saved successfully. Reference ID : " + obj.AppID );//+ " Please Make Payment against the Application Number."
                    window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=424&AppID=' + obj.AppID;
                    //window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessbar.aspx?SvcID=424&AppID=' + obj.AppID;
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
                   alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system with Reg. No. " + CardNo + " from district " + Dist + " and Police Station " + PS);
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

    // Basic Information 

    var FirstName = $("#FirstName");
    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Nationality = $("#nationality option:selected").text();
    var Gender = $("#ddlGender option:selected").text();
    //police station 
    //var PSDist = $("#PddlDistrict1 option:selected").text();
    var Pstation = $("#Pddlps option:selected").text();
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


    //if (($("#txtMobile").val() == "" || $("#txtMobile").val() == null)) {
    //    text += "<BR>" + " \u002A" + " Please Enter Applicant Mobile Number."
    //    $("#txtMobile").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#txtMobile").css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $("#txtMobile").attr('style', 'border:1px solid #cdcdcd !important;');
    //    $("#txtMobile").css({ "background-color": "#ffffff" });
    //}


    if (($("#UID").val() == "" || $("#UID").val() == null)) {
        text += "<BR>" + " \u002A" + " Please Enter Applicant Aadhaar Number."
        $("#UID").attr('style', 'border:1px solid #d03100 !important;');
        $("#UID").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#UID").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#UID").css({ "background-color": "#ffffff" });
    }

    if (Pstation != null && (Pstation == '' || Pstation == '-Select-')) {
        text += "<BR>" + " \u002A" + " Please select Police Station Name.";
        $('#Pddlps').attr('style', 'border:1px solid #d03100 !important;');
        $('#Pddlps').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#Pddlps').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#Pddlps').css({ "background-color": "#ffffff" });
    }
    //if (($("#PoliceStationName").val() == "" || $("#PoliceStationName").val() == null)) {
    //    text += "<BR>" + " \u002A" + " Please Enter Police Station Name."
    //    $("#PoliceStationName").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#PoliceStationName").css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $("#PoliceStationName").attr('style', 'border:1px solid #cdcdcd !important;');
    //    $("#PoliceStationName").css({ "background-color": "#ffffff" });
    //}

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


    if (DOB.val() == '') {
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

    //if (EmailID.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Email ID. ";
    //    EmailID.attr('style', 'border:1px solid #d03100 !important;');
    //    EmailID.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
    //    EmailID.css({ "background-color": "#ffffff" });
    //}

    if ($('#ddlBloodGroup').val() == '' || $('#ddlBloodGroup').val() == 'Select BloodGroup' || $('#ddlBloodGroup').val() == "0") {
        text += "<BR>" + " \u002A" + " Please Select Blood Group? ";
        $('#ddlBloodGroup').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBloodGroup').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
       
    }

    if ($('#SpouseName').val() == '' || $('#SpouseName').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Father / Spouse Name. ";
        $('#SpouseName').attr('style', 'border:1px solid #d03100 !important;');
        $('#SpouseName').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#SpouseName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SpouseName').css({ "background-color": "#ffffff" });
    }


    //if ($('#RelativeStaying').val() == '' || $('#RelativeStaying').val() == 'Select' || $('#RelativeStaying').val() == "0") {
    //    text += "<BR>" + " \u002A" + " Please Select Any Of Your Relative Staying In Same City? ";
    //    $('#RelativeStaying').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#RelativeStaying').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#RelativeStaying').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#RelativeStaying').css({ "background-color": "#ffffff" });
    //}


    //if ($('#HaveMedicalHistory').val() == '' || $('#HaveMedicalHistory').val() == 'Select' || $('#HaveMedicalHistory').val() == "0") {
    //    text += "<BR>" + " \u002A" + " Please Select Do You Have Any Medical History? ";
    //    $('#HaveMedicalHistory').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#HaveMedicalHistory').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#HaveMedicalHistory').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#HaveMedicalHistory').css({ "background-color": "#ffffff" });
    //}
    var Relative = $("input[name='RelativeY']:checked").val();

    if (Relative == null || Relative == "undefined") {
        text += "<BR>" + " \u002A" + " Please Choose Any Of Your Relative Staying In Same City?.";
        $('#Relativechk').attr('style', 'color:red !important;');
        $('#Relativechk').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#Relativechk').attr('style', 'color:#fff !important;');
        $('#Relativechk').css({ "color": "#fff " });
    }

    var MedicalH = $("input[name='RelativeY']:checked").val();

    if (MedicalH == null || MedicalH == "undefined") {
        text += "<BR>" + " \u002A" + " Please Choose Do You Have Any Medical History?.";
        $('#Medicalchk').attr('style', 'color:red !important;');
        $('#Medicalchk').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#Medicalchk').attr('style', 'color:#fff !important;');
        $('#Medicalchk').css({ "color": "#fff " });
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


    if ($("#HFUIDData").val() == "") {// 2016-11-08 Logic altered to skip validating these details when user has fetched the details from Aadhaar.
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
            text += "<BR>" + " \u002A" + " Please select District in Permanent Address.";
            $('#PddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
            $('#PddlDistrict').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PddlDistrict').css({ "background-color": "#ffffff" });
        }
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

    var MedicalMendatory = $("input[name='RBTNMedical']:checked").val();
    if (MedicalMendatory == "Yes") {
        if (!$('#Others').is(":checked") && !$('#BloodGroup').is(":checked") && !$('#Arthritis').is(":checked") && !$('#HeartDisease').is(":checked") && !$('#RespiratoryDiseases').is(":checked") && !$('#AlzheimerDisease').is(":checked") && !$('#Osteoporosis').is(":checked") && !$('#Diabetes').is(":checked") && !$('#InfluenzaPneumonia').is(":checked") && !$('#Cancer').is(":checked")) {
            text += "<BR>" + " \u002A" + " Please Fill Your Medical History Details.";
            $('#BorderMedHis').attr('style', 'border:1px solid #d03100 !important;');
            $('#BorderMedHis').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            if ($('#FamilyDoctorName').val() == "" || $('#FamilyDoctorName').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Family Doctor Name.";
                $('#FamilyDoctorName').attr('style', 'border:1px solid #d03100 !important;');
                $('#FamilyDoctorName').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#FamilyDoctorName').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#FamilyDoctorName').css({ "background-color": "#ffffff" });

                if ($('#FamilyDoctorNo').val() == "" || $('#FamilyDoctorNo').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Family Doctor Mobile No.";
                    $('#FamilyDoctorNo').attr('style', 'border:1px solid #d03100 !important;');
                    $('#FamilyDoctorNo').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#FamilyDoctorNo').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#FamilyDoctorNo').css({ "background-color": "#ffffff" });

                    if ($('#FamilyDoctorAddress').val() == "" || $('#FamilyDoctorAddress').val() == null) {
                        text += "<BR>" + " \u002A" + " Please Enter Family Doctor Full Address.";
                        $('#FamilyDoctorAddress').attr('style', 'border:1px solid #d03100 !important;');
                        $('#FamilyDoctorAddress').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#FamilyDoctorAddress').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#FamilyDoctorAddress').css({ "background-color": "#ffffff" });

                        if ($('#FamilyDoctorPincode').val() == "" || $('#FamilyDoctorPincode').val() == null) {
                            text += "<BR>" + " \u002A" + " Please Enter Family Doctor's Address Pincode.";
                            $('#FamilyDoctorPincode').attr('style', 'border:1px solid #d03100 !important;');
                            $('#FamilyDoctorPincode').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        else {
                            $('#FamilyDoctorPincode').attr('style', 'border:1px solid #cdcdcd !important;');
                            $('#FamilyDoctorPincode').css({ "background-color": "#ffffff" });

                            $('#BorderMedHis').attr('style', 'border:1px solid #cdcdcd !important;');
                            $('#BorderMedHis').css({ "background-color": "#ffffff" });

                            if ($('#Others').is(":checked")) {
                                if ($('#OtherDisease').val() == "" || $('#OtherDisease').val() == null) {
                                    text += "<BR>" + " \u002A" + " Please Describe Your Illness.";
                                    $('#OtherDisease').attr('style', 'border:1px solid #d03100 !important;');
                                    $('#OtherDisease').css({ "background-color": "#fff2ee" });
                                    opt = 1;
                                }
                                else {
                                    $('#OtherDisease').attr('style', 'border:1px solid #cdcdcd !important;');
                                    $('#OtherDisease').css({ "background-color": "#ffffff" });
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    //var Section1_PassOdia = $("input[name='radio4']:checked").val();

    //if (Section1_PassOdia == null) {
    //    text += "<br /> - Please choose, Has the Candidate passed Odia as one of the subject in HSC Examination?";
    //    $('#isOdia').attr('style', 'color:red !important;');
    //    $('#isOdia').css({ "color": "red !important;" });
    //    opt = 1;
    //} else {
    //    $('#isOdia').attr('style', 'color:#000000 !important;');
    //    $('#isOdia').css({ "color": "#000000 " });
    //}


    //var Section1_AbililtyRead = 0;
    //if ($('#readOdiya').is(":checked")) {
    //    // it is checked
    //    Section1_AbililtyRead = 1;
    //}

    //var Section1_AbilityWrite = 0;
    //if ($('#writeOdiya').is(":checked")) {
    //    // it is checked
    //    Section1_AbilityWrite = 1;
    //}

    //var Section1_AbilitySpeak = 0;
    //if ($('#spkOdiya').is(":checked")) {
    //    // it is checked
    //    Section1_AbilitySpeak = 1;
    //}

    //if (Section1_PassOdia == "Yes") {
    //    if (Section1_AbililtyRead == 0 || Section1_AbilityWrite == 0 || Section1_AbilitySpeak == 0) {
    //        //chkAbility
    //        text += "<br /> - Please choose, Wheather the Candidate has ability to Read, Write and Speak Odia Language. ";
    //        opt = 1;
    //        GovtMessage = 1;
    //        $('#chkAbility').attr('style', 'color:red !important;');
    //        $('#chkAbility').css({ "color": "red" });
    //    }
    //    else {
    //        $('#chkAbility').attr('style', 'color:#000000 !important;');
    //        $('#chkAbility').css({ "color": "#000000 " });
    //    }
    //}

    //if (Section1_PassOdia == "No") {

    //    if (Residence == '0' || Residence == '--Select Residence Type--') {
    //        text += "<br /> -Please select Residence Type.";
    //        $('#ddlResidence').attr('style', 'border:1px solid #d03100 !important;');
    //        $('#ddlResidence').css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //        GovtMessage = 1;
    //    } else {
    //        $('#ddlResidence').attr('style', 'border:1px solid #cdcdcd !important;');
    //        $('#ddlResidence').css({ "background-color": "#ffffff" });
    //    }
    //}

    //var Section1_AbilitySpeak = 0;
    //if ($('#spkOdiya').is(":checked")) {
    //    // it is checked
    //    Section1_AbilitySpeak = 1;
    //}

    var chkdeclaration = 0;
    if ($('#chkDeclaration').is(":checked")) {
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
        if (!$("#chkDeclaration").is(":checked")) {
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
        return false;
    }
    return true;
}


//**************add more function for relative details.***************************
function AddSuspect(DeleteString) {
    if (validateSuspectValues(DeleteString) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strNOR = "";
        var strRelation = "";
        var strAddress = "";
        var strMobile = "";
        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {

            strNOR = $('#txtNOR').val();
            strRelation = $('#txtRelation').val();
            strAddress = $('#txtAddress').val();
            strMobile = $('#txtMobileno').val();

            strTempString = document.getElementById("hdfSuspect").value + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspect").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Name of Relative</th>";
        Str = Str + "<th style='text-align: center;'>Realtion</th>";
        Str = Str + "<th style='text-align: center;'>Address</th>";
        Str = Str + "<th style='text-align: center;'>Mobile</th>";
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
            strNOR = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strRelation = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strAddress = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            //StartIndex = RemStr.indexOf(",");
            //strRemarks = RemStr.substring(0, StartIndex);
            //RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strMobile = RemStr;

            var DeleteString = "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strNOR + "</td>";
            Str = Str + "<td style='' >" + strRelation + "</td>";
            Str = Str + "<td style='' >" + strAddress + "</td>";
            Str = Str + "<td style='' >" + strMobile + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";
            // <input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/>
            strSuspect = strSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            var HeirsDXML = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspect').innerHTML = Str;
        document.getElementById("hdfSuspect").value = strSuspect;
        document.getElementById("hdfSuspectSave").value = strSaveSuspect;
        document.getElementById("hdfSuspectString").value = intCount;

        strNOR = $('#txtNOR').val("").focus();
        strRelation = $('#txtRelation').val("");
        strAddress = $('#txtAddress').val("");
        strMobile = $('#txtMobileno').val("");
    }
}
function DelString(DeleteString) {
    var Msg = "Do you want remove this Suspect?";
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

    var strName = "";
    var strHof = "";
    var strage = "";
    var strnominated = "";
    var strMsg = "";
    var isError = false;

    strName = $('#txtNOR').val();
    strHof = $('#txtRelation').val();
    strage = $('#txtAddress').val();
    strnominated = $('#txtMobileno').val();

    if (strName == "") {
        strMsg = strMsg + "</br> * Please Enter Name of Relative.";
        document.getElementById('txtNOR').focus();
        isError = true;
    }

    if (strHof == "") {
        strMsg = strMsg + "</br> * Please Enter Relation.";
        document.getElementById('txtRelation').focus();
        isError = true;
    }
    if (strage == "") {
        strMsg = strMsg + "</br> * Please Enter Address.";
        document.getElementById('txtAddress').focus();
        isError = true;
    }
    if (strnominated == "") {
        strMsg = strMsg + "</br> * Please Enter Mobile.";
        document.getElementById('txtMobileno').focus();
        isError = true;
    }

    if (isError == true) {
        document.getElementById("divmore").innerHTML = " * Below are the Family Member Details validation error(s), please rectify ! <br> " + strMsg;
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
//police station district list
function GetDistrictPloiceStations() {
    debugger;
    var Ps = $("#HDFPS").val();
    var SelDistrict = $('#PddlDistrict1').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/GetDistrictPloiceStation',
        data: '{"prefix":"","DistrictCode":"' + SelDistrict + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlps = $("[id=Pddlps]");
            ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=Pddlps]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
                if (Ps != "" && Ps != "undefined") {
                    $('#Pddlps option:selected').text(Ps);
                    $("#Pddlps").prop("disabled", true);
                }
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//end here
//**************add more function for Servant details.***************************
function AddServantSuspect(DeleteStringS) {
    debugger;
    if (validateSuspectValuesS(DeleteStringS) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strNOR = "";
        var strRelation = "";
        var strAddress = "";
        var strMobile = "";
        var Str = "";
        var SrNo = "";

        if (DeleteStringS == "") {

            strNOR = $('#SddlPersonType option:selected').text();
            strRelation = $('#txtSNameOfPerson').val();
            strAddress = $('#txtSAddress').val();
            strMobile = $('#txtSMobile').val();

            strTempString = document.getElementById("hdfSuspectS").value + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspectS").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Person Type</th>";
        Str = Str + "<th style='text-align: center;'>Name Of Person</th>";
        Str = Str + "<th style='text-align: center;'>Address</th>";
        Str = Str + "<th style='text-align: center;'>Mobile</th>";
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
            strNOR = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strRelation = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strAddress = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            //StartIndex = RemStr.indexOf(",");
            //strRemarks = RemStr.substring(0, StartIndex);
            //RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strMobile = RemStr;

            var DeleteStringS = "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strNOR + "</td>";
            Str = Str + "<td style='' >" + strRelation + "</td>";
            Str = Str + "<td style='' >" + strAddress + "</td>";
            Str = Str + "<td style='' >" + strMobile + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelStringS(&quot;" + DeleteStringS + "&quot;);'/></td>";
            Str = Str + "</tr>";
            // <input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/>
            strSuspect = strSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            var HeirsDXMLS = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspectS').innerHTML = Str;
        document.getElementById("hdfSuspectS").value = strSuspect;
        document.getElementById("hdfSuspectSaveS").value = strSaveSuspect;
        document.getElementById("hdfSuspectStringS").value = intCount;

        strNOR = $('#SddlPersonType option:selected').focus();
        strRelation = $('#txtSNameOfPerson').val("");
        strAddress = $('#txtSAddress').val("");
        strMobile = $('#txtSMobile').val("");
    }
}
function DelStringS(DeleteStringS) {
    var Msg = "Do you want remove this Suspect?";
    if (confirm(Msg)) {
        var strString = document.getElementById('hdfSuspectS').value;
        strString = strString.replace(DeleteStringS, "");
        document.getElementById('hdfSuspectS').value = strString;
        AddServantSuspect(DeleteStringS);
    }
}

function validateSuspectValuesS(DeleteStringS) {
    if (DeleteStringS != '') {
        return true;
    }

    var strName = "";
    var strHof = "";
    var strage = "";
    var strnominated = "";
    var strMsg = "";
    var isError = false;

    strName = $('#SddlPersonType option:selected').text();
    strHof = $('#txtSNameOfPerson').val();
    strage = $('#txtSAddress').val();
    strnominated = $('#txtSMobile').val();

    if (strName == "") {
        strMsg = strMsg + "</br> * Please Select Person type.";
        document.getElementById('#SddlPersonType option:selected').focus();
        isError = true;
    }

    if (strHof == "") {
        strMsg = strMsg + "</br> * Please Enter Name Of Person.";
        document.getElementById('txtSNameOfPerson').focus();
        isError = true;
    }
    if (strage == "") {
        strMsg = strMsg + "</br> * Please Enter Address.";
        document.getElementById('txtSAddress').focus();
        isError = true;
    }
    if (strnominated == "") {
        strMsg = strMsg + "</br> * Please Enter Mobile.";
        document.getElementById('txtSMobile').focus();
        isError = true;
    }

    if (isError == true) {
        document.getElementById("divmoreS").innerHTML = " * Below are the Servant/Driver/Watchman/Tenant Details validation error(s), please rectify ! <br> " + strMsg;
        $("#divmoreS").show();
        document.getElementById("divmoreS").focus();
        return false;
    }
    else {
        document.getElementById("divmoreS").innerHTML = "";
        $("#divmoreS").hide();
    }
    return true;

}

/*Validate Aadhaar Number weather already exist on not 11 Aug 2017--*/
function ValidateAadhaar(UIDVal, value, SessionName) {
    debugger;
    //var AadhaarNo = $('#UID').val();
    //var datavar = {
    //    'AadhaarNumber': $('#UID').val(),

    //};

    //var obj = {
    //    "prefix": "''",
    //    "Data": $.stringify(datavar, null, 4)
    //};

    //$("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/ValidateAadhaarNo',
            data: '{"AadhaarNumber":"' + $('#UID').val() + '"}',
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

            if (intStatus == "0") {
                if (validateUID(UIDVal) != false) {

                    //if (UIDVal == "1") {
                    //code = UIDVal;
                    //}

                    //CheckLocalAadhar($("#UID").val());
                    var UID = $("#UID").val();
                    var EID = "0";
                    var left = (screen.width / 2) - (560 / 2);
                    var top = (screen.height / 2) - (400 / 2);

                    window.open('/UID/Default.aspx?SvcID=424&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
                    ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
                    window.focus();
                }
            }
            else {
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
            }


        });// end of Then function of main Data Insert Function

    return false;
}