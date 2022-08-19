
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

    $("#DivMTOther").hide();

    $('#ddlAP').change(
   function () {
       var CourseName = $('#ddlBranch option:selected').val();
       if (CourseName == "SCIENCE PASS") {
           BindCore2(CourseName);
       }
       else if (CourseName == "ARTS PASS")
       {
           BindArtsPassCore2(CourseName);
       }

   }
);
    $('#ddlAP1').change(
    function () {
        var CourseName = $('#ddlBranch option:selected').val();
        if (CourseName == "SCIENCE PASS") {
            BindCore3(CourseName);
        }

    }
    );

    $('#txtTongue').change(
   function () {
       var MotherTongue = $('#txtTongue option:selected').text();
       if (MotherTongue == "Other") {
           $("#DivMTOther").show();
       }
       else {
           $("#DivMTOther").hide();
       }

   }
   );

    GetCollege();
    GetOUATState();
    GetOUATState2();
    //GetOUATDistrict2();
    //GetSeniorCitizenOdishaDistrict();
   // GetCBCSCourseList();
    GetRelationList();

    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);

    //bind data page load
    var qs = getQueryStrings();
    //if (qs['AppID'] != null) {
    //    fnFetchUserDetails(qs['AppID']);
    //}
    //Percentage calculation logic

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
    //End Here
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
    var SelState =$('#CddlState').val();
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
    //Mother Tongue
    var MotherTongue = "";
    if ($('#txtTongue option:selected').text() == "Other") {
        MotherTongue = $('#MTOther').val();
    }
    else {
        MotherTongue = $('#txtTongue option:selected').text()
    }

    var datavar = {
        'RollNo': $('#txtRollNo').val(),
        'AppID': $('#txtAppID').val(),
        'ProfileID': $('#UID').val(),
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
        'GuardianName':$('#GuardianName').val(),
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
        'AdmissionNo':$('#AdmissionNo').val(),
        'Branch': $('#ddlBranch option:selected').val(),
        'CollegeCode': $('#ddlCollege option:selected').val(),
        'Subject1': $('#ddlAP option:selected').val(),
        'Subject2': $('#ddlAP1 option:selected').val(),
        'Subject3': $('#ddlAP2 option:selected').val(),
        'Subject4': $('#ddlGE option:selected').val(),
        'Subject5': $('#ddlMIL option:selected').val(),
        'Subject6': $('#ddlAECC option:selected').val(),
        'Subject7': $('#ddlSECB option:selected').val(),
        'Subject8': $('#ddlGEII option:selected').val(),
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
            url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/InsertCBCSAdmissionData',
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
                alertPopup("Form Validation Failed", "Error While Saving Application., <BR> Either You Have Used MobileNumber or AadhaarNumber Which Has Been Used Earlier.");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (status == "Success") {
                    $("#progressbar").hide();
                    alertPopup("+3 Admission Form", "Application saved successfully. Reference ID : " + obj.AppID);//+ " Please Make Payment against the Application Number."
                    window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=1449&AppID=' + obj.AppID;
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
    var Gaurdian = $("#GuardianName");
    var Category = $("#ddlcategory option:selected").text();
    var AdmissionNo = $("#AdmissionNo");
    var BoardType = $("#ddlBoard option:selected").val();
    /*
    if (($("#UID").val() == "" || $("#UID").val() == null)) {
        text += "<BR>" + " \u002A" + " Please Enter Applicant Aadhaar Number."
        $("#UID").attr('style', 'border:1px solid #d03100 !important;');
        $("#UID").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#UID").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#UID").css({ "background-color": "#ffffff" });
    }
    */

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
    if (Father.val() == '' && Gaurdian.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Father Name. ";
        Father.attr('style', 'border:1px solid #d03100 !important;');
        Father.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (Mother.val() == '' && Gaurdian.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mother Name. ";
        Mother.attr('style', 'border:1px solid #d03100 !important;');
        Mother.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if ((Father.val() == '' || Mother.val() == '') && Gaurdian.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Gaurdian Name. ";
        Mother.attr('style', 'border:1px solid #d03100 !important;');
        Mother.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (Category != null && (Category == '' || Category == 'Select' || Category == '-Select-')) {
        text += "<BR>" + " \u002A" + " Please select Category.";
        $('#ddlcategory').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlcategory').css({ "background-color": "#fff2ee" });
        opt = 1;
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
    /*
    if (EmailID.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Email ID. ";
        EmailID.attr('style', 'border:1px solid #d03100 !important;');
        EmailID.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
        EmailID.css({ "background-color": "#ffffff" });
    }
    */
    

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

    //var chkdeclaration = 0;
    //if ($('#chkPhysical').is(":checked")) {
    //    // it is checked
    //    chkdeclaration = 1;
    //}

    //if (chkdeclaration == 0) {
    //    //chkAbility
    //    text += "<br /> - Please check Declaration and read it. ";
    //    opt = 1;
    //    $('#lblDeclaration').attr('style', 'color:red !important;');
    //    $('#lblDeclaration').css({ "color": "red" });
    //}
    //else {
    //    $('#lblDeclaration').attr('style', 'color:#000000 !important;');
    //    $('#lblDeclaration').css({ "color": "#000000 " });
    //}
    if (AdmissionNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Admission Number. ";
        AdmissionNo.attr('style', 'border:1px solid #d03100 !important;');
        AdmissionNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    }

    if (AOP.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Date of Admission into college. ";
        AOP.attr('style', 'border:1px solid #d03100 !important;');
        AOP.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
       
    }
    //Subject validate added on 22 Nov 2017 by Vibhav
    var CourseName = $("#ddlBranch").val();
    var DSC1 = $('#ddlAP option:selected').val();
    var DSC2 = $('#ddlAP1 option:selected').val();
    var DSC3 = $('#ddlAP2 option:selected').val();
    var GE = $('#ddlGE option:selected').val();
    var MIL = $('#ddlMIL option:selected').val();
    var AECC = $('#ddlAECC option:selected').val();
    var SECB = $('#ddlSECB option:selected').val();

    if (CourseName == "ARTS PASS") {
        if (DSC1 != null && (DSC1 == '0' || DSC1 == 'Select' || DSC1 == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select DSC-1.";
            $('#ddlAP').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAP').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (DSC2 != null && (DSC2 == '0' || DSC2 == 'Select' || DSC2 == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select DSC-2.";
            $('#ddlAP1').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAP1').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (GE != null && (GE == '0' || GE == 'Select' || GE == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select GE.";
            $('#ddlGE').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlGE').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (MIL != null && (MIL == '0' || MIL == 'Select' || MIL == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select MIL.";
            $('#ddlMIL').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlMIL').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select AECC-II.";
            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAECC').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select SEC-D.";
            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSECB').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

    }
    else if (CourseName == "ARTS HONOURS") {

        if (DSC1 != null && (DSC1 == '0' || DSC1 == 'Select' || DSC1 == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select DSC-1.";
            $('#ddlAP').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAP').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        if (GE != null && (GE == '0' || GE == 'Select' || GE == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select GE.";
            $('#ddlGE').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlGE').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select AECC-II.";
            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAECC').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select SEC-B.";
            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSECB').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

    }
    else if (CourseName == "SCIENCE HONOURS") {

        if (DSC1 != null && (DSC1 == '0' || DSC1 == 'Select' || DSC1 == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select DSC-1.";
            $('#ddlAP').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAP').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        if (GE != null && (GE == '0' || GE == 'Select' || GE == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select GE.";
            $('#ddlGE').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlGE').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select AECC-II.";
            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAECC').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select SEC-B.";
            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSECB').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

    }
    else if (CourseName == "SCIENCE PASS") {

        if (DSC1 != null && (DSC1 == '0' || DSC1 == 'Select' || DSC1 == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select DSC-1.";
            $('#ddlAP').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAP').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (DSC2 != null && (DSC2 == '0' || DSC2 == 'Select' || DSC2 == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select DSC-2.";
            $('#ddlAP1').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAP1').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (DSC3 != null && (DSC3 == '0' || DSC3 == 'Select' || DSC3 == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select DSC-3.";
            $('#ddlAP2').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAP2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select AECC-II.";
            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAECC').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select SEC-D.";
            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSECB').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

    }
    else if (CourseName == "COMMERCE HONOURS") {


        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select AECC-II.";
            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAECC').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select SEC-B.";
            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSECB').css({ "background-color": "#fff2ee" });
            opt = 1;
        }


    }
    else if (CourseName == "COMMERCE PASS") {

        if (AECC != null && (AECC == '0' || AECC == 'Select' || AECC == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select AECC-II.";
            $('#ddlAECC').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlAECC').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (SECB != null && (SECB == '0' || SECB == 'Select' || SECB == '-Select-')) {
            text += "<BR>" + " \u002A" + " Please select SEC-D.";
            $('#ddlSECB').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSECB').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

    }
    //End Here

    var MotherTongue = $('#txtTongue option:selected').text();
    var MTOther = $('#MTOther');

    if (MotherTongue != null && (MotherTongue == '' || MotherTongue == 'Select')) {
        text += "<BR>" + " \u002A" + " Please select MotherTongue.";
        $('#txtTongue').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtTongue').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        if (MotherTongue == 'Other')
        {
            if (MTOther.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter MotherTongue other. ";
                AOP.attr('style', 'border:1px solid #d03100 !important;');
                AOP.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
        }

    }

    //SSc & HSc Validate

    //Education in HSC
    var BoardRollNo = $("#txtBoardRollNo");
    var BoardName = $("#txtBoardName");
    var txtExmntnName = $("#txtExmntnName");
    var txtPssngYr = $("#txtPssngYr option:selected").text(); //DropDown
    //var ddlPasstype = $("#ddlPasstype option:selected").text();
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

    //var Passtype = $('#ddlPasstype option:selected').val();
    //if (Passtype != null && (Passtype == '' || Passtype == '0')) {
    //    text += "<br /> -Please select Exam Cleared in Educational Qualification.";
    //    $('#ddlPasstype').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#ddlPasstype').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#ddlPasstype').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#ddlPasstype').css({ "background-color": "#ffffff" });
    //}

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
    //var ddlPasstype = $("#ddlPasstype option:selected").text();
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

    if (BoardType != null && (BoardType == 'Select Board' || BoardType == '0')) {
        text += "<br /> -Please select Board of Examination in 10+2.";
        $('#ddlBoard').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBoard').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlBoard').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlBoard').css({ "background-color": "#ffffff" });
    }

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

    //var Passtype = $('#ddlPasstype option:selected').val();
    //if (Passtype != null && (Passtype == '' || Passtype == '0')) {
    //    text += "<br /> -Please select Exam Cleared in Educational Qualification 10+2.";
    //    $('#ddlPasstype').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#ddlPasstype').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#ddlPasstype').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#ddlPasstype').css({ "background-color": "#ffffff" });
    //}

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
    
    if ($('#txtRemarks').val() != null && $('#txtRemarks').val() == '') {
        text += "<br /> -Please enter Remarks for Update. ";
        $('#txtRemarks').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRemarks').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRemarks').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRemarks').css({ "background-color": "#ffffff" });
    }

    if (txtPercentage != null && txtPercentage.val() == '') {
        text += "<br /> -Please calculate the Percentage in Educational Qualification 10+2. ";
        opt = 1;
    } else {
    }
    //END Here
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}


//**************add more function for relative details.***************************
function AddSuspectEdit(DeleteString) {
    debugger;
   // if (validateSuspectValues(DeleteString) == true) {
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
        var RegNo = "";

        if (DeleteString == "") {

            strNOR = $('#txtCourseName').val();
            strRelation = $('#txtBoard').val();
            strAddress = $('#txtLastAttend').val();
            strMobile = $('#YOP option:selected').val();
            RegNo = $('#txtRegNo').val();

            strTempString = document.getElementById("hdfSuspect").value + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "," + RegNo + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspect").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Course Name/Last Exam Pass</th>";
        Str = Str + "<th style='text-align: center;'>University/Board Name</th>";
        Str = Str + "<th style='text-align: center;'>Last Attended</th>";
        Str = Str + "<th style='text-align: center;'>Year Of Passing</th>";
        Str = Str + "<th style='text-align: center;'>Registration No</th>";
        Str = Str + "<th style='text-align: center;'>Remove</th>";
        Str = Str + "</tr>";

        while (strTempString.length > 0) {

            intCount = intCount + 1;
            var StartIndex = strTempString.indexOf("#");
            strTempString = strTempString.substring(StartIndex + 1, strTempString.length);
            var EndIndex = strTempString.indexOf("#");
            var RemStr = strTempString.substring(0, EndIndex);


            //StartIndex = RemStr.indexOf(",");
            //SrNo = RemStr.substring(0, StartIndex);
            //RemStr = RemStr.substring(StartIndex + 1, RemStr.length);
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

            StartIndex = RemStr.indexOf(",");
            strMobile = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            RegNo = RemStr;

            var DeleteString = "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "," + RegNo + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strNOR + "</td>";
            Str = Str + "<td style='' >" + strRelation + "</td>";
            Str = Str + "<td style='' >" + strAddress + "</td>";
            Str = Str + "<td style='' >" + strMobile + "</td>";
            Str = Str + "<td style='' >" + RegNo + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";
            // <input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/>
            strSuspect = strSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "," + RegNo + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "," + RegNo + "#";

            var HeirsDXML = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspect').innerHTML = Str;
        document.getElementById("hdfSuspect").value = strSuspect;
        document.getElementById("hdfSuspectSave").value = strSaveSuspect;
        document.getElementById("hdfSuspectString").value = intCount;

        strNOR = $('#txtCourseName').val("");
        strRelation = $('#txtBoard').val("");
        strAddress = $('#txtLastAttend').val("");
        strMobile = $('#YOP').val("0");
        RegNo = $('#txtRegNo').val("");
    //}
}
function AddSuspect(DeleteString) {
    debugger;
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
        var RegNo = "";

        if (DeleteString == "") {
           
            strNOR = $('#txtCourseName').val();
            strRelation = $('#txtBoard').val();
            strAddress = $('#txtLastAttend').val();
            strMobile = $('#YOP option:selected').val();
            RegNo = $('#txtRegNo').val();

            strTempString = document.getElementById("hdfSuspect").value + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile +","+ RegNo + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspect").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Course Name/Last Exam Pass</th>";
        Str = Str + "<th style='text-align: center;'>University/Board Name</th>";
        Str = Str + "<th style='text-align: center;'>Last Attended</th>";
        Str = Str + "<th style='text-align: center;'>Year Of Passing</th>";
        Str = Str + "<th style='text-align: center;'>Registration No</th>";
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

            StartIndex = RemStr.indexOf(",");
            strMobile = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            RegNo = RemStr;

            var DeleteString = "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "," + RegNo + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strNOR + "</td>";
            Str = Str + "<td style='' >" + strRelation + "</td>";
            Str = Str + "<td style='' >" + strAddress + "</td>";
            Str = Str + "<td style='' >" + strMobile + "</td>";
            Str = Str + "<td style='' >" + RegNo + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";
            // <input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/>
            strSuspect = strSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "," + RegNo + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "," + RegNo + "#";

            var HeirsDXML = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspect').innerHTML = Str;
        document.getElementById("hdfSuspect").value = strSuspect;
        document.getElementById("hdfSuspectSave").value = strSaveSuspect;
        document.getElementById("hdfSuspectString").value = intCount;

        strNOR = $('#txtCourseName').val("");
        strRelation = $('#txtBoard').val("");
        strAddress = $('#txtLastAttend').val("");
        strMobile = $('#YOP').val("0");
        RegNo = $('#txtRegNo').val("");
    }
}
function DelString(DeleteString) {
    debugger;
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
    var strRegNo = "";
    var isError = false;

    strName = $('#txtCourseName').val();
    strHof = $('#txtBoard').val();
    strage = $('#txtLastAttend').val();
    strnominated = $('#YOP option:selected').val();
    strRegNo = $('#txtRegNo').val();

   // var YOPArr = $('#YOP').val().split("/");
   //strnominated = YOPArr[2] + "-" + YOPArr[1] + "-" + YOPArr[0];
   

    if (strName == "") {
        strMsg = strMsg + "</br> * Please Enter Course Name.";
        document.getElementById('txtCourseName').focus();
        isError = true;
    }

    if (strHof == "") {
        strMsg = strMsg + "</br> * Please Enter University/Board Name.";
        document.getElementById('txtBoard').focus();
        isError = true;
    }
    if (strage == "") {
        strMsg = strMsg + "</br> * Please Enter Institute Last Attended.";
        document.getElementById('txtLastAttend').focus();
        isError = true;
    }
    if (strnominated == "0") {
        strMsg = strMsg + "</br> * Please Select Year of Passing.";
        document.getElementById('YOP').focus();
        isError = true;
    }
    if (strRegNo == "") {
        strMsg = strMsg + "</br> * Please Enter University Registration No.";
        document.getElementById('txtRegNo').focus();
        isError = true;
    }

    if (isError == true) {
        document.getElementById("divmore").innerHTML = " * Below are the Last Course Attended by Student validation error(s), please rectify ! <br> " + strMsg;
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
function ValidateMobileAndAdmissionNo(Value,Type) {
    debugger;
   
    //$("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/ValidateAadhaarNo',
            data: '{"Value":"' + value + '","Type":"'+Type+'"}',
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
//Admission Branch liat
function GetCBCSCourseList() {
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

            var ddlps = $("[id=ddlBranch]");
            ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlBranch]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
               
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//Admission course/branch subject list
function GetCBCSSubjectList() {
    debugger;
    var CourseName = $("#ddlBranch").val();
    if (CourseName == "ARTS PASS") {
        ClearDropValue();
        BindSubjectDetail(CourseName);
        BindGE(CourseName); //bind GE 
        BindMIL(CourseName);
        BindAECC(CourseName);
        BindSEC(CourseName);
        $("#DivCore1").show();
        $("#DivCore2").show();
        $("#DivCore3").hide();
        $("#DivMIL").show();
        $("#DivGE").show();
        $("#DivGEII").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
    }
    else if (CourseName == "ARTS HONOURS") {

        ClearDropValue();
        BindOtherThanCore(CourseName);  //bind dsc subject type data 
        BindGE(CourseName); //bind MIL 
        BindAECC(CourseName);
        BindSEC(CourseName);
        $("#DivCore1").show();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").show();
        $("#DivGEII").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
    }
    else if (CourseName == "SCIENCE HONOURS") {

        ClearDropValue();
        BindOtherThanCore(CourseName);  //bind dsc subject type data 
        BindGE(CourseName); //bind MIL 
        BindAECC(CourseName);
        BindSEC(CourseName);
        $("#DivCore1").show();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").show();
        $("#DivGEII").show();
        $("#DivAECC").show();
        $("#DivSEC").show();
    }
    else if (CourseName == "SCIENCE PASS") {

        ClearDropValue();
        BindOtherThanCore(CourseName);  //bind dsc subject type data 
        //BindGE(); //bind MIL 
        BindAECC(CourseName);
        BindSEC(CourseName);
        $("#DivCore1").show();
        $("#DivCore2").show();
        $("#DivCore3").show();
        $("#DivMIL").hide();
        $("#DivGE").hide();
        $("#DivGEII").hide();
        $("#DivAECC").show();
        $("#DivSEC").show();
    }
    else if (CourseName == "COMMERCE HONOURS") {

        ClearDropValue();
        BindAECC(CourseName);
        BindSEC(CourseName);
        $("#DivCore1").hide();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").hide();
        $("#DivGEII").hide();
        $("#DivAECC").show();
        $("#DivSEC").show();
    }
    else if (CourseName == "COMMERCE PASS") {

        ClearDropValue();
        BindAECC(CourseName);
        BindSEC(CourseName);
        $("#DivCore1").hide();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").hide();
        $("#DivGEII").hide();
        $("#DivAECC").show();
        $("#DivSEC").show();
    }
    else {
        $("#DivCore1").hide();
        $("#DivCore2").hide();
        $("#DivCore3").hide();
        $("#DivMIL").hide();
        $("#DivGE").hide();
        $("#DivGEII").hide();
        $("#DivAECC").hide();
        $("#DivSEC").hide();
    }

}
function BindSubjectDetail(BranchName)
{
    var CourseName = BranchName;//$("#ddlBranch").val();
    var SubType = "CORE";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlSubject = $("[id=ddlAP]");
            ddlSubject.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAP]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//bind core two for arts pass
function BindArtsPassCore2(BranchName) {
    var CourseName = BranchName;// $("#ddlBranch").val();
    var SubType = "CORE";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlSubject2 = $("[id=ddlAP1]");
            ddlSubject2.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAP1]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
                jQuery("#ddlAP1 option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//bind DSC two for science pass
function BindCore2(BranchName) {
    var CourseName = BranchName;//$("#ddlBranch").val();
    var SubType = "DSC";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlAP1 = $("[id=ddlAP1]");
            ddlAP1.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAP1]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
                jQuery("#ddlAP1 option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//bind DSC three for science pass
function BindCore3(BranchName) {
    var CourseName = BranchName;// $("#ddlBranch").val();
    var SubType = "DSC";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlAP2 = $("[id=ddlAP2]");
            ddlAP2.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAP2]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
                jQuery("#ddlAP2 option:contains('" + $("#ddlAP1 option:selected").text() + "')").remove();
                jQuery("#ddlAP2 option:contains('" + $("#ddlAP option:selected").text() + "')").remove();
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//bind other than core 
function BindOtherThanCore(BranchName) {
    var CourseName = BranchName;// $("#ddlBranch").val();
    var SubType = "DSC";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlAP = $("[id=ddlAP]");
            ddlAP.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAP]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//GE Other than core for AP Branch
function BindGE(BranchName) {
    var CourseName = BranchName;//$("#ddlBranch").val();
    var SubType = "GE";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlGE = $("[id=ddlGE]");
            ddlGE.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlGE]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//MIL Other than core for Branch
function BindMIL(BranchName) {
    var CourseName = BranchName;//$("#ddlBranch").val();
    var SubType = "MIL";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlMIL = $("[id=ddlMIL]");
            ddlMIL.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlMIL]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//AECC Other than core for Branch
function BindAECC(BranchName) {
    var CourseName = BranchName;//$("#ddlBranch").val();
    var SubType = "AECC";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlAECC = $("[id=ddlAECC]");
            ddlAECC.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlAECC]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


//AECC Other than core for Branch
function BindSEC(BranchName) {
    var CourseName = BranchName;// $("#ddlBranch").val();
    var SubType = "SEC";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlSECB = $("[id=ddlSECB]");
            ddlSECB.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlSECB]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function ClearDropValue()
{
    $("#ddlAP").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlAP1").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlAP2").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlMIL").empty().append('<option selected="selected" value="0">Select</option>');
    $("#ddlGE").empty().append('<option selected="selected" value="0">Select</option>');
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

//bind relatin list
function GetRelationList() {
   // var SelState = $('#PddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetRelationList',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlrelation = $("[id=ddlRelation]");
            ddlrelation.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $("[id=ddlRelation]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//data submit by applicant
function EditStudentData() {
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

        'RollNo': $('#txtRollNo').val(),
        'AppID': $('#txtAppID').val(),
        'ProfileID': $('#UID').val(),
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
        'GuardianName':$('#GuardianName').val(),
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
        'AdmissionNo':$('#AdmissionNo').val(),
        'Branch': $('#ddlBranch option:selected').val(),
        'CollegeCode': $('#ddlCollege option:selected').val(),
        'Subject1': $('#ddlAP option:selected').val(),
        'Subject2': $('#ddlAP1 option:selected').val(),
        'Subject3': $('#ddlAP2 option:selected').val(),
        'Subject4': $('#ddlGE option:selected').val(),
        'Subject5': $('#ddlMIL option:selected').val(),
        'Subject6': $('#ddlAECC option:selected').val(),
        'Subject7': $('#ddlSECB option:selected').val(),
        'Subject8': $('#ddlGEII option:selected').val(),

        'RollNoSSC':$("#txtBoardRollNo").val(), 
        'BoardNameSSC':$("#txtBoardName").val(), 
        'ExamPassSSC':$("#txtExmntnName").val(), 
        'PassingYearSSC':$("#txtPssngYr option:selected").text(), 
        'GradeTypeSSC':$("#ddlPctgeCalclte option:selected").text(), 
        'TotalMarkSSC':$("#txtTotalMarks").val(), 
        'MarkObtainedSSC':$("#txtMarkSecure").val(), 
        'PercentageSSC': $("#txtPercentage").val(),

        'BoardType': $("#ddlBoard option:selected").val(),
        'RollNoHSC':$("#txtBoardRollNo2").val(),
        'BoardNameHSC':$("#txtBoardName2").val(),
        'ExamPassHSC':$("#txtExmntnName2").val(), 
        'PassingYearHSC':$("#txtPssngYr2 option:selected").text(), 
        'GradeTypeHSC':$("#ddlPctgeCalclte2 option:selected").text(),
        'TotalMarkHSC':$("#txtTotalMarks2").val(), 
        'MarkObtainedHSC':$("#txtMarkSecure2").val(), 
        'PercentageHSC': $("#txtPercentage2").val(),
        'Sublbl1': $('#lblAP').text(),
        'Sublbl2': $('#lblAP1').text(),
        'Sublbl3': $('#lblAP2').text(),
        'Sublbl4': $('#lblGE').text(),
        'Sublbl5': $('#lblMIL').text(),
        'Sublbl6': $('#AECC').text(),
        'Sublbl7': $('#lblSEC').text(),
        'Sublbl8': $('#lblGEII').text(),
        'Remarks': $('#txtRemarks').val(),
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
            url: '/WebApp/G2G/SU/EditStudentInfo.aspx/UpdateStudentData',
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
                alertPopup("Form Validation Failed", "Error While Saving Application., <BR> Either You Have Used MobileNumber or AadhaarNumber Which Has Been Used Earlier.");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (status == "Success") {
                    $("#progressbar").hide();
                    alertPopup("+3 Admission Form CBCS", "Application updated successfully. Reference ID : " + obj.AppID);//+ " Please Make Payment against the Application Number."
                    window.location.href = '/WebApp/Kiosk/CBCS/Acknowledgement.aspx?SvcID=1449&AppID=' + obj.AppID;
                   // window.location.href = '/WebApp/Kiosk/CBCS/AdmissionProcessBar.aspx?SvcID=1449&AppID=' + obj.AppID + '&UID=' + $("#UID").val();
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
function BindSelectedSubject(Subject, Branch) {
    debugger;
    // selectByVal("ddlBranch", Branch);
    BindBranch(Branch);
    $('#ddlBranch').prop('disabled', true);
    var str = Subject;
    if (str != null && str != 'undefined' && str != '') {
        var arr = str.split(',');


        // jQuery("#ddlAP1 option:contains('" + AP + "')").remove();

        var CourseName = Branch;
        if (CourseName == "ARTS PASS") {
            var AP = arr[0];
            var AP1 = arr[1];
            var AP2 = "";
            var GE = arr[2];
            var MIL = arr[3];
            var AECC = arr[4];
            var SECB = arr[5];
            BindSubject(CourseName, 'CORE', '#ddlAP', AP);
            BindSubject(CourseName, 'CORE', '#ddlAP1', AP1);
            BindSubject(CourseName, 'GE', '#ddlGE', GE);
            BindSubject(CourseName, 'MIL', '#ddlMIL', MIL);
            BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
            BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);
            $("#DivCore1").show();
            $("#DivCore2").show();
            $("#DivCore3").hide();
            $("#DivMIL").show();
            $("#DivGE").show();
            $("#DivGEII").show();
            $("#DivAECC").show();
            $("#DivSEC").show();
            $("#ddlAP1 option[value='" + AP + "']").remove();

            $("#lblAP").html('DSC-A');
            $("#lblAP1").html('DSC-B');
            $("#lblGE").html('GE');
            $("#lblMIL").html('MIL');
            $("#AECC").html('AECC-II');
            $("#lblSEC").html('SEC-D');
        }
        else if (CourseName == "ARTS HONOURS" || CourseName == "SCIENCE HONOURS") {
            if (arr.length == 5) {
                var AP = arr[0];
                var GE = arr[1];
                var GEII = arr[2];
                var AECC = arr[3];
                var SECB = arr[4];
                BindSubject(CourseName, 'DSC', '#ddlAP', AP);
                BindSubject(CourseName, 'GE', '#ddlGE', GE);
                BindSubject(CourseName, 'GE', '#ddlGEII', GEII);
                BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
                BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);

                $("#DivCore1").show();
                $("#DivCore2").hide();
                $("#DivCore3").hide();
                $("#DivMIL").hide();
                $("#DivGE").show();
                $("#DivGEII").show();
                $("#DivAECC").show();
                $("#DivSEC").show();

                $("#lblGE").html('GE');
                $("#lblGEII").html('GEII');
                $("#lblAP").html('DSC-A');
                $("#AECC").html('AECC-II');
                $("#lblSEC").html('SEC-B');
            }
            else {
                var AP = arr[0];
                var GE = arr[1];
                var AECC = arr[2];
                var SECB = arr[3];
                BindSubject(CourseName, 'DSC', '#ddlAP', AP);
                BindSubject(CourseName, 'GE', '#ddlGE', GE);
                BindSubject(CourseName, 'GE', '#ddlGEII', GEII);
                BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
                BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);

                $("#DivCore1").show();
                $("#DivCore2").hide();
                $("#DivCore3").hide();
                $("#DivMIL").hide();
                $("#DivGE").show();
                $("#DivGEII").show();
                $("#DivAECC").show();
                $("#DivSEC").show();

                $("#lblGE").html('GE');
                $("#lblGEII").html('GEII');
                $("#lblAP").html('DSC-A');
                $("#AECC").html('AECC-II');
                $("#lblSEC").html('SEC-B');
            }

        }
        else if (CourseName == "SCIENCE PASS") {
            var AP = arr[0];
            var AP1 = arr[1];
            var AP2 = arr[2];
            var AECC = arr[3];
            var SECB = arr[4];
            BindSubject(CourseName, 'DSC', '#ddlAP', AP);
            BindSubject(CourseName, 'DSC', '#ddlAP1', AP1);
            BindSubject(CourseName, 'DSC', '#ddlAP2', AP2);
            BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
            BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);

            $("#DivCore1").show();
            $("#DivCore2").show();
            $("#DivCore3").show();
            $("#DivMIL").hide();
            $("#DivGE").hide();
            $("#DivGEII").hide();
            $("#DivAECC").show();
            $("#DivSEC").show();

            $("#lblAP").html('DSC-A');
            $("#lblAP1").html('DSC-B');
            $("#lblAP2").html('DSC-C');
            $("#AECC").html('AECC-II');
            $("#lblSEC").html('SEC-D');
        }
        else if (CourseName == "COMMERCE HONOURS" || CourseName == "COMMERCE PASS") {
            var AECC = arr[0];
            var SECB = arr[1];
            BindSubject(CourseName, 'AECC', '#ddlAECC', AECC);
            BindSubject(CourseName, 'SEC', '#ddlSECB', SECB);
            $("#DivCore1").hide();
            $("#DivCore2").hide();
            $("#DivCore3").hide();
            $("#DivMIL").hide();
            $("#DivGE").hide();
            $("#DivGEII").hide();
            $("#DivAECC").show();
            $("#DivSEC").show();

            $("#AECC").html('AECC-II');
            if (CourseName == "COMMERCE HONOURS") {
                $("#lblSEC").html('SEC-D');
            } else { $("#lblSEC").html('SEC-B'); }

        }
        else {
            $("#DivCore1").hide();
            $("#DivCore2").hide();
            $("#DivCore3").hide();
            $("#DivMIL").hide();
            $("#DivGE").hide();
            $("#DivGEII").hide();
            $("#DivAECC").hide();
            $("#DivSEC").hide();
        }
    }

}

/*
SSC & HSC PERCENTAGE CALCULATION LOGIC FUNCTION...................
*/

function calculatepercentage(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;

    var result = 0;

    if ($("#ddlPctgeCalclte").val() == "501") {

        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alertPopup("CGPA Validate","CGPA cannot be less than 3.5");
            $('#txtTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5 || MarksObtained > 10.0) {
            alertPopup("Total Marks of CGPA Validate","Total Marks of CGPA can not be greater than 10");
            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");
            return;
        }

        if (MarksObtained == "") return;
        result = 0;

        //result = (TotalMarks - 0.5) * 10 Validate
        result = ((MarksObtained) * 9.5).toFixed(2);
    }
    else {

        if (MarksObtained == "") return;

        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alertPopup("Total & Obtained Marks Validate","Total Marks must be greater than Marks Obtained");
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
            alert("CGPA Validate","CGPA cannot be less than 3.5");
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

        var Category = $("#ddlcategory option:selected").text();

        var Physicallyhandicaped = 0;
        if ($('#CheckBoxList1_1').is(":checked")) {
            // it is checked
            Physicallyhandicaped = 1;
        }


        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alertPopup("Total Marks Validate","Total Marks must be greater than Marks Obtained");
            $('#txtTotalMarks2').val("");
            $('#txtMarkSecure2').val("");
            $("#txtPercentage2").val("");

            return;
        }

        if (TotalMarks <= 0) TotalMarks = 1;

        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);
        /*
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
        */
    }
    $("#txtPercentage2").val(result);
}
//application details by aapid on page load...............
function fnFetchUserDetails() {
    debugger;

    var RollNo = $('#txtRollNo').val();

    try {

        $.when(
          $.ajax({
              type: "POST",
              contentType: "application/json; charset=utf-8",
              url: '/WebApp/G2G/SU/EditStudentInfo.aspx/GetApplicationDetails',
              data: '{"RollNo":"' + RollNo + '"}',
              processData: false,
              dataType: "json",
              success: function (response) {

              },
              error: function (a, b, c) {
                  alert("1." + a.responseText);
              }
          })
           ).then(function (data, textStatus, jqXHR) {
               debugger;
               var obj = jQuery.parseJSON(data.d);

               var AppID = obj.AppID;
               var arr = eval(data.d);
               var html = "";
               var AadhaarNo = arr[0]["AadhaarNo"];
               var AdmissionNo = arr[0].AdmissionNo;
               var AdmissionDate = arr[0].AdmissionDate;
               var BranchCode = arr[0].BranchCode;
               var BranchName = arr[0].BranchName;
               var Name = arr[0].Name;
               var mobile = arr[0].Mobile;
               var email = arr[0].Email;
               var Father = arr[0].Father;
               var Mother = arr[0].Mother;
               var Gaurdian = arr[0].Gaurdian;
               var Relation = arr[0].Relation;
               var DOB = arr[0].DOB;
               var Gender = arr[0].Gender;
               var MotherTongue = arr[0].MotherTongue;
               var Category = arr[0].Category;
               var UserId = arr[0].UserId;
               var Age = arr[0].Age;
               var name = arr[0].Name;
               var CollegeName = arr[0].CollegeName;
               var CollegeCode = arr[0].CollegeCode;
               var SubjectList = arr[0].SubjectList;
               //address
               var AddrCareOf = arr[0]["AddrCareOf"];
               var AddrBuilding = arr[0]["AddrBuilding"];
               var AddrStreet = arr[0]["AddrStreet"];
               var AddrLandmark = arr[0]["AddrLandmark"];
               var AddrLocality = arr[0]["AddrLocality"];
               var State = arr[0]["State"];
               var District = arr[0]["District"];
               var Taluka = arr[0]["Taluka"];
               var Village = arr[0]["Village"];
               var PinCode = arr[0]["PinCode"];
               var CareOfP = arr[0]["CareOfP"];
               var CareOfLocalP = arr[0]["CareOfLocalP"];
               var houseNumberP = arr[0]["houseNumberP"];
               var LandmarkP = arr[0]["LandmarkP"];
               var LocalityP = arr[0]["LocalityP"];
               var pincodeP = arr[0]["pincodeP"];
               var StreetP = arr[0]["StreetP"];
               var StateCodeP = arr[0]["StateCodeP"];
               var DistrictCodeP = arr[0]["DistrictCodeP"];
               var BlockCodeP = arr[0]["BlockCodeP"];
               var PanchayatCodeP = arr[0]["PanchayatCodeP"];
               //SSC & HSC Marks Param
               var BoardType = arr[0]["BoardType"];
               var RollNo10 = arr[0]["RollNo10"];
               var BoardName = arr[0]["BoardName"];
               var ExamPass = arr[0]["ExamPass"];
               var PassingYear = arr[0]["PassingYear"];
               var GradeType = arr[0]["GradeType"];
               var TotalMark = arr[0]["TotalMark"];
               var MarkObtained = arr[0]["MarkObtained"];
               var Percentage = arr[0]["Percentage"];
               var Type = arr[0]["Type"];
               var BoardType12 = arr[0]["BoardType12"];
               var RollNo12 = arr[0]["RollNo12"];
               var BoardName12 = arr[0]["BoardName12"];
               var ExamPass12 = arr[0]["ExamPass12"];
               var PassingYear12 = arr[0]["PassingYear12"];
               var GradeType12 = arr[0]["GradeType12"];
               var TotalMark12 = arr[0]["TotalMark12"];
               var MarkObtained12 = arr[0]["MarkObtained12"];
               var Percentage12 = arr[0]["Percentage12"];
               var Type12 = arr[0]["Type12"];

               debugger;
               if (BranchName != null && BranchName != "") {
                   BindSelectedSubject(SubjectList, BranchName);
               }
               $('#UID').val(AadhaarNo);
               $('#UID').prop('disabled', true);
               $('#txtAppID').val(arr[0].AppID);
               $('#txtAppID').prop('disabled', true);
               if (CollegeName != null && CollegeName != "") {
                   $('#ddlCollege').val(CollegeName);
                   //$('#ddlCollege').prop('disabled', true);
               }
               if (CollegeCode != null && CollegeCode != "") {
                   $('#ddlCollege').val(CollegeCode);
                   //$('#ddlCollege').prop('disabled', true);
               }
               if (name != null && name != "") {
                   $('#FirstName').val(name);
               }

               if (email != null && email != "") {
                   $('#EmailID').val(email);
               }

               if (mobile != null && mobile != "") {
                   $('#MobileNo').val(mobile);
               }
               if (AdmissionNo != null && AdmissionNo != "") {
                   $('#AdmissionNo').val(AdmissionNo);
                   $('#AdmissionNo').prop('disabled', true);
               }

               if (AdmissionDate != null && AdmissionDate != "") {
                   AdmissionDate = AdmissionDate.split('-');
                   AdmissionDate = AdmissionDate[2] + '/' + AdmissionDate[1] + '/' + AdmissionDate[0];
                   $('#DOA').val(AdmissionDate);
               }
               if (Father != null && Father != "") {
                   $('#FatherName').val(Father);
               }
               if (Mother != null && Mother != "") {
                   $('#MotherName').val(Mother);
               }
               if (Gaurdian != null && Gaurdian != "") {
                   $('#GuardianName').val(Gaurdian);
               }

               if (Relation != null && Relation != "") {
                   // GetRelationList();
                   $("#ddlRelation option:selected").text(Relation);
               }
               if (DOB != null && DOB != "") {
                   DOB = DOB.split('-');
                   DOB = DOB[2] + '/' + DOB[1] + '/' + DOB[0];
                   $('#DOB').val(DOB);
               }
               if (Age != null && Age != "") {
                   $('#Age').val(Age);
               }
               if (Gender != null && Gender != "") {
                   selectByVal("ddlGender", Gender);
               }
               if (Category != null && Category != "") {
                   selectByVal("ddlcategory", Category);
               }

               if (MotherTongue != null && MotherTongue != "") {
                   selectByVal("txtTongue", MotherTongue);
               }
               if (UserId != null && UserId != "") {
                   $('#UserCode').val(UserId);
               }
               //Permanent  PddlState, PddlDistrict, PddlTaluka, PddlVillage
               $('#PAddressLine1').val(CareOfP);
               $('#PAddressLine2').val(CareOfLocalP);
               $('#PRoadStreetName').val(StreetP);
               $('#PLandMark').val(LandmarkP);
               $('#PLocality').val(LocalityP);
               $('#PPinCode').val(pincodeP);

               //Current/Present CAddressLine1,CAddressLine2,CRoadStreetName,CLandMark,CLocality,CPinCode
               $('#CAddressLine1').val(AddrCareOf);
               $('#CAddressLine2').val(AddrBuilding);
               $('#CRoadStreetName').val(AddrStreet);
               $('#CLandMark').val(AddrLandmark);
               $('#CLocality').val(AddrLocality);
               $('#CPinCode').val(PinCode);

               /*
       ---Address Present Details
       C--Instance For Present/Current------
       */
               $('#CddlState').val(State);
               GetPresentDist(State, District);
               GetPresentBlock(District, Taluka);
               GetPresentPanchayat(Taluka, Village);
               /*
               -----Address Permament Details
               P-Instance For Permanent Address------
               */
               $('#PddlState').val(StateCodeP);
               GetParmanentDist(StateCodeP, DistrictCodeP);
               GetPermanentBlock(DistrictCodeP, BlockCodeP);
               GetPermanentPanchayat(BlockCodeP, PanchayatCodeP);
               //SSC Marks txtBoardRollNo,txtBoardName,txtExmntnName,ddlPassYr,ddlPctgeCalclte,txtTotalMarks,txtMarkSecure,txtPercentage
               $('#txtBoardRollNo').val(RollNo10);
               $('#txtBoardName').val(BoardName);
               $('#txtExmntnName').val(ExamPass);
               $('#txtPssngYr').val(PassingYear);
               //$('#ddlPctgeCalclte').val(GradeType);
               if (GradeType == "Percentage") {
                   $('#ddlPctgeCalclte').val("502");
               }
               else { $('#ddlPctgeCalclte').val("501"); }
               $('#txtTotalMarks').val(TotalMark);
               $('#txtMarkSecure').val(MarkObtained);
               $('#txtPercentage').val(Percentage);
               //HSC Marks
               $('#ddlBoard').val(BoardType12);
               $('#txtBoardRollNo2').val(RollNo12);
               $('#txtBoardName2').val(BoardName12);
               $('#txtExmntnName2').val(ExamPass12);
               $('#txtPssngYr2').val(PassingYear12);
               $('#ddlPctgeCalclte2').val('502');
               $('#txtTotalMarks2').val(TotalMark12);
               $('#txtMarkSecure2').val(MarkObtained12);
               $('#txtPercentage2').val(Percentage12);
               //Signature & Image 
               $('#myImg').attr('src', arr[0]["ApplicantImageStr"]);
               $('#mySign').attr('src', arr[0]["ImageSign"]);
               $('#hdfSuspect').val(arr[0]["LastCourse"]);
               AddSuspectEdit('1');
           });
    }
    catch (error) {
        console.error(error);
    }
    return false;
}

//Permament Address Details---------------------
function GetParmanentDist(StateCode,selected) {
    var SelState = StateCode;
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
            $('#PddlDistrict').val(selected);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetPermanentBlock(DistrictCode, selected) {
    var SelBlock = DistrictCode;//
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
            $('#PddlTaluka').val(selected);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetPermanentPanchayat(TalukaCode,selected) {
    var SelSubDistrict = TalukaCode;
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
            $('#PddlVillage').val(selected);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

//Present Address Details-------------------
function GetPresentDist(StateCode,selected) {
    var SelState = StateCode;//$('#CddlState').val();
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
            $('#CddlDistrict').val(selected);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetPresentBlock(DistrictCode,selected) {
    var SelBlock = DistrictCode;//$('#CddlDistrict').val();
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
            $('#CddlTaluka').val(selected);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetPresentPanchayat(TalukaCode,selected) {
    var SelSubDistrict = TalukaCode;//$('#CddlTaluka').val();
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
            $('#CddlVillage').val(selected);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
////////////////


function BindSubject(BranchName,SubjectType,ddlID,SelelctedVal) {
    var CourseName = BranchName;
    var SubType = SubjectType;
    var ControlID = ddlID;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSSubjecteList',
        data: '{"CourseName":"' + CourseName + '","SubjectType":"' + SubType + '"}',
        dataType: "json",
        success: function (response) {

            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlSubject = $(ControlID);
            ddlSubject.empty().append('<option selected="selected" value="0">Select</option>');
            $.each(Category, function () {
                $(ControlID).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
            if (SelelctedVal != 'undefined' && SelelctedVal != '' && SelelctedVal != null) {
                $(ControlID).val(SelelctedVal);
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//Admission Branch liat
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

/*
-----------Validate date Format -------------
*/

function ValidateDate() {
    debugger;
    var inputText = $('#DOB').val();
    if (inputText != null && inputText != '') {
        var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
        // Match the date format through regular expression  
        if (dateformat.test(inputText)) {
            var DOB = inputText.split('/');
            var Y = DOB[2];
            var M = DOB[1];
            var D = DOB[0];
            if (M.length == 1) {
                M = '0' + M;
            }
            if (D.length == 1) {
                D = '0' + D;
            }
            
            var NewDOB = D + '/' + M + '/' + Y;
            $('#DOB').val(NewDOB);
        }
        else {
            alert("Invalid date format!");
            //document.form1.text1.focus();
            $('#DOB').val('');
            return false;
        }
    }
}


function GetCollege() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/G2G/SU/EditStudentInfo.aspx/GetCollegeDetails',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlps = $("[id=ddlCollege]");
            ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlCollege]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}