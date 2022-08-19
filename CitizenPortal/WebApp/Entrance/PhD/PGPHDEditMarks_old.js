
var m_PH = "";
var m_ReservQta = "";
var m_Course = "";
var m_Category = "";

$(document).ready(function () {

    GetStudentDetail();
    ChangeDivision();

    if ($('#BscDivision').val() == "0") {
        $('#BscPassingYear').val('');
        $('#BscPassingYear').prop('disabled', true);
        $('#BscTotalMarks').val('');
        $('#BscTotalMarks').prop('disabled', true);
        $('#BscMarksGot').val('');
        $('#BscMarksGot').prop('disabled', true);
    }

    $('#BscTotalMarks').change(function () {
        CalculateBscPercentage($('#BscTotalMarks').val(), $('#BscMarksGot').val());
    });

    $('#BscMarksGot').change(function () {
        CalculateBscPercentage($('#BscTotalMarks').val(), $('#BscMarksGot').val());
    });

});


function ChangeDivision() {

    if ($("#BscDivision").val() == "501") {
        $('#lblBscMarksGot').removeClass("manadatory");
        $('#BscPassingYear').prop('disabled', false);
        $('#BscTotalMarks').prop('disabled', false);
        $('#BscMarksGot').prop('disabled', false);

        $('#BscTotalMarks').val("");
        $('#BscMarksGot').val("");
        $("#BscPercentage").val("");

        $("#BscTotalMarks").attr("placeholder", "Total OGPA").val("").focus().blur();
        $("#BscMarksGot").attr("placeholder", "OGPA Scored").val("").focus().blur();
        $("#lblBscTotalMarks").text("Total OGPA");
        $("#lblBscMarksGot").text("OGPA Scored");
        $("#BscTotalMarks").val('10');
        $("#BscTotalMarks").prop('disabled', true);
    }
    else {
        $('#lblBscMarksGot').addClass("manadatory");
        $('#BscPassingYear').prop('disabled', false);
        $('#BscTotalMarks').prop('disabled', false);
        $('#BscMarksGot').prop('disabled', false);

        $('#BscTotalMarks').val("");
        $('#BscMarksGot').val("");
        $("#BscPercentage").val("");

        $("#BscTotalMarks").attr("placeholder", "Total Marks").val("").focus().blur();
        $("#BscMarksGot").attr("placeholder", "Marks Scored").val("").focus().blur();
        $("#lblBscTotalMarks").text("Total Marks");
        $("#lblBscMarksGot").text("Marks Scored");
        $("#BscMarksGot").prop('disabled', false);
    }
    if ($('#BscDivision').val() == "0") {
        $('#BscPassingYear').val('');
        $('#BscPassingYear').prop('disabled', true);
        $('#BscTotalMarks').val('');
        $('#BscTotalMarks').prop('disabled', true);
        $('#BscMarksGot').val('');
        $('#BscMarksGot').prop('disabled', true);
    }
}


function GetStudentDetail() {

    debugger;
    $("#progressbar").show();
    var qs = getQueryStrings();
    var SvcID = qs["SvcID"];
    var AppID = qs["AppID"];
    if (SvcID != null && AppID != null) {      

        $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Kiosk/OUAT/PGPhD/PGPHDEditMarks.aspx/GetStudentDetail',
                    data: '{"SvcID":"' + SvcID + '","AppID":"' + AppID + '"}',
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
                debugger;
                JSONData = jQuery.parseJSON(data.d);

                $("#divBasicInfo").show();
                $("#divAddress").show();
                $("#divBtn").show();
                $("#UID").prop("disabled", false);


                var AppDetails = JSONData["AppDetails"];
                var EducationDetails = JSONData["EducationDetails"];
                var NRIDetails = JSONData["NRIDetails"];
                var EmployeeDetails = JSONData["EmployeeDetails"];
                var OUATSignature = JSONData["OUATSignature"];
                var AgeDataTb = JSONData["AgeDataTb"];
                var TransDetails = JSONData["TransDetails"];

                if (AppDetails != null && AppDetails != '') {


                    var AdmissionYear = AppDetails[0]["AdmissionYear"];
                    var AppDate = AppDetails[0]["AppDate"];
                    var AppID = AppDetails[0]["AppID"];

                    var ApplicantImageStr = AppDetails[0]["ApplicantImageStr"];
                    var ImageSign = AppDetails[0]["ImageSign"];

                    var ApplicantName = AppDetails[0]["candidatename"];
                    var BloodGroup = AppDetails[0]["BloodGroup"];
                    var ConvertedMobileNo = AppDetails[0]["MobileNo"];

                    var CurrentBlock = AppDetails[0]["CurrentBlock"];
                    var CurrentDistrict = AppDetails[0]["CurrentDistrict"];
                    var CurrentFullAddress = AppDetails[0]["CurrentFullAddress"];
                    var CurrentPanchayat = AppDetails[0]["CurrentPanchayat"];
                    var CurrentState = AppDetails[0]["CurrentState"];

                    var PermanentBlock = AppDetails[0]["PermanentBlock"];
                    var PermanentDistrict = AppDetails[0]["PermanentDistrict"];
                    var PermanentPanchayat = AppDetails[0]["PermanentPanchayat"];
                    var PermanentState = AppDetails[0]["PermanentState"];
                    var ResidentType = AppDetails[0]["ResidentType"];

                    var DOB = AppDetails[0]["DOB"];
                    var FatherName = AppDetails[0]["fathername"];
                    var Gender = AppDetails[0]["Gender"];
                    var MobileNo = AppDetails[0]["MobileNo"];
                    var ParentsAnnualIncome = AppDetails[0]["ParentsAnnualIncome"];
                    var StdCode = AppDetails[0]["StdCode"];

                    var UIDType = AppDetails[0]["UIDType"];
                    var UIDNo = AppDetails[0]["UIDNumber"];

                    var candidatename = AppDetails[0]["candidatename"];
                    var careOf = AppDetails[0]["fathername"];
                    var category = AppDetails[0]["category"];
                    var dateofbirth = AppDetails[0]["dateofbirth"];
                    var emailID = AppDetails[0]["email_id"];
                    var email_id = AppDetails[0]["email_id"];
                    var examcenter = AppDetails[0]["FirstChoiceOfExaminationCenter"];
                    var gender1 = AppDetails[0]["gender"];

                    var houseNumber = AppDetails[0]["houseNumber"];
                    var landmark = AppDetails[0]["landmark"];
                    var locality = AppDetails[0]["locality"];

                    var mobile = AppDetails[0]["MobileNo"];
                    var mothername = AppDetails[0]["mothername"];
                    var mothertongue = AppDetails[0]["mothertongue"];
                    var nationality = AppDetails[0]["nationality"];
                    var phone_no = AppDetails[0]["phone_no"];
                    var postOffice = AppDetails[0]["postOffice"];
                    var postOffice1 = AppDetails[0]["postOffice1"];
                    var religion = AppDetails[0]["religion"];
                    var street = AppDetails[0]["street"];

                    var TransDate = TransDetails[0]["TransDate"];
                    var TranID = TransDetails[0]["TrnID"];
                    var RollNo = AppDetails[0]["RollNo"];

                    $('#ddlSearch').change(function () {
                        var k = $(this).val();
                        if (k == 0) { $("#UID").prop('disabled', true); }
                        else if (k == "U") {
                            $("#UID").prop('disabled', false);
                            $("#UID").attr("placeholder", "Enter 12 Digit Aadhaar No.").val("").focus().blur();
                            $("#UID").attr("title", "Enter 12 Digit Aadhaar No.").val("").focus().blur();
                            $("#UID").attr("maxlength", "12").val("").focus().blur();
                        }
                        else if (k == "C") {
                            $("#UID").prop('disabled', true);
                            $("#UID").attr("placeholder", "Enter Citizen Profile ID").val("").focus().blur();
                        }
                        else if (k == "A") {
                            $("#UID").prop('disabled', false);
                            $("#UID").attr("placeholder", "Enter Application ID").val("").focus().blur();
                            $("#UID").attr("maxlength", "12").focus().blur();
                        }
                        else if (k == "R") {
                            $("#UID").prop('disabled', false);
                            $("#UID").attr("placeholder", "Enter 14 Digit Aadhaar Enrollment No.").val("").focus().blur();
                            $("#UID").attr("title", "Enter 14 Digit Aadhaar Enrollment No.").val("").focus().blur();
                            $("#UID").attr("maxlength", "14").focus().blur();
                        }
                    });

                    if (AppDetails[0]["UIDNumber"] != null) {
                        $("#UID").val(AppDetails[0]["UIDNumber"]);
                        $("#ddlSearch").val(AppDetails[0]["UIDType"]);
                    }
                    else {
                        $("#UID").val(AppDetails[0]["UIDNumber"]);
                        $("#ddlSearch").val(AppDetails[0]["UIDType"]);
                    }

                    $("#ddlProgram").bind("change", function (e) {

                        if ($("#ddlProgram").val() == "0") {
                            $("#ddlCollege").empty();
                            $("#ddlCollege").append('<option value = "0">-Select-</option>');
                            $("#ddlCollege").prop('disabled', true);
                            $("#divSubject").show(800);
                            $('#lblDegree').text('Select Degree');
                            $("#ddlDegree").empty();
                            $("#ddlDegree").append('<option value = "0">-Select-</option>');
                            $("#ddlDegree").prop('disabled', true);
                            $('#lblSubject').text('Select Subject');
                            $("#ddlSubject").empty();
                            $("#ddlSubject").append('<option value = "0">-Select-</option>');
                            $("#ddlSubject").prop('disabled', true);
                            $("input[id='CheckBoxList1_0']").hide(800);
                            $("label[for='CheckBoxList1_0']").attr('style', 'display: none !important;');
                            $("input[id='CheckBoxList1_1']").hide(800);
                            $("label[for='CheckBoxList1_1']").attr('style', 'display: none !important;');
                            $("input[id='CheckBoxList1_3']").hide(800);
                            $("label[for='CheckBoxList1_3']").attr('style', 'display: none !important;');
                            $("#SpecialClaim").hide(800);
                            $("option[value='503']").attr('style', 'display: none !important;');
                            $("option[value='504']").attr('style', 'display: none !important;');
                            $("#divMsc").hide(800);
                        }

                        if (AppDetails[0]["OUATCourse"] != null) {
                            $("#ddlProgram").val(AppDetails[0]["OUATCourse"]);
                        }

                        if ($("#ddlProgram").val() == "Master Programme") {
                            $("#ddlCollege").empty();
                            $("#ddlCollege").append('<option value = "0">-Select-</option>');
                            $("#ddlCollege").prop('disabled', false);
                            $("#ddlDegree").prop('disabled', false);
                            $("#divSubject").hide(800);
                            $('#lblDegree').text('Select Degree (For Master Prog.)');
                            $("input[id='CheckBoxList1_0']").show(800);
                            $("label[for='CheckBoxList1_0']").attr('style', 'display: block !important;');
                            $("label[for='CheckBoxList1_0']").attr('style', 'display: inline !important;');
                            $("input[id='CheckBoxList1_1']").show(800);
                            $("label[for='CheckBoxList1_1']").attr('style', 'display: block !important;');
                            $("label[for='CheckBoxList1_1']").attr('style', 'display: inline !important;');
                            $("input[id='CheckBoxList1_3']").show(800);
                            $("label[for='CheckBoxList1_3']").attr('style', 'display: block !important;');
                            $("label[for='CheckBoxList1_3']").attr('style', 'display: inline !important;');
                            $("label[for='CheckBoxList1_4']").attr('style', 'display: block !important;');
                            $("label[for='CheckBoxList1_4']").attr('style', 'display: inline !important;');
                            $("#SpecialClaim").show(800);
                            $("option[value='503']").attr('style', 'display: block !important;');
                            $("option[value='504']").attr('style', 'display: block !important;');
                            $("#divMsc").hide(800);

                            var CategoryArr = ["SC", "ST", "General, Unreserved", "Kashmiri Migrant"];
                            var CategoryArrVal = ["SC", "ST", "GN", "KM"];

                            $("#Category").empty();
                            $("#Category").append('<option value = "0">-Select-</option>');

                            var arrLen = CategoryArr.length;

                            for (i = 0; i < arrLen; i++) {
                                $("#Category").append('<option value = "' + CategoryArrVal[i] + '">' + CategoryArr[i] + '</option>');
                            }
                            $("#Category").prop('disabled', false);

                            if (AppDetails[0]["category"] != null) {
                                $("#Category").val(AppDetails[0]["category"]);
                            }

                        }

                        

                        if ($("#ddlProgram").val() == "Doctoral Programme") {
                            $("#ddlCollege").empty();
                            $("#ddlCollege").append('<option value = "0">-Select-</option>');
                            $("#ddlCollege").prop('disabled', false);
                            $('#lblDegree').text('Select Degree (For Doctoral Prog.)');
                            $("#ddlDegree").prop('disabled', false);
                            $("#ddlDegree").empty();
                            $("#ddlDegree").append('<option value = "0">-Select-</option>');
                            $('#lblSubject').text('Select Subject (For Doctoral Prog.)');
                            $("#ddlSubject").prop('disabled', false);
                            $("#ddlSubject").empty();
                            $("#ddlSubject").append('<option value = "0">-Select-</option>');
                            $("#divSubject").show(800);
                            $("input[id='CheckBoxList1_0']").show(800);
                            $("label[for='CheckBoxList1_0']").attr('style', 'display: block !important;');
                            $("label[for='CheckBoxList1_0']").attr('style', 'display: inline !important;');
                            $("input[id='CheckBoxList1_1']").hide(800);
                            $("label[for='CheckBoxList1_1']").attr('style', 'display: none !important;');
                            $("input[id='CheckBoxList1_3']").hide(800);
                            $("label[for='CheckBoxList1_3']").attr('style', 'display: none !important;');
                            $("input[id='CheckBoxList1_4']").hide(800);
                            $("label[for='CheckBoxList1_4']").attr('style', 'display: none !important;');
                            $("#SpecialClaim").hide(800);
                            //$("option[value='503']").attr('style', 'display: none !important;');
                            //$("option[value='504']").attr('style', 'display: none !important;');
                            $("#divMsc").show(800);

                            var CategoryArr2 = ["SC", "ST", "General, Unreserved"];
                            var CategoryArr2Val = ["SC", "ST", "GN"];

                            $("#Category").empty();
                            $("#Category").append('<option value = "0">-Select-</option>');

                            var arrLen = CategoryArr2.length;

                            for (i = 0; i < arrLen; i++) {
                                $("#Category").append('<option value = "' + CategoryArr2Val[i] + '">' + CategoryArr2[i] + '</option>');
                            }
                            $("#Category").prop('disabled', false);

                            if (AppDetails[0]["category"] != null) {
                                $("#Category").val(AppDetails[0]["category"]);
                            }
                        }
                    });

                    var SelCollege = $('#ddlProgram').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: '/WebApp/Kiosk/OUAT/PGPhD/PGPhdApplication.aspx/GetOUATCollege',
                        data: '{"SelCollege":"' + SelCollege + '"}',
                        processData: false,
                        dataType: "json",
                        success: function (response) {
                            var Category = eval(response.d);
                            var html = "";
                            var catCount = 0;
                            $("#ddlCollege").empty();
                            $("#ddlCollege").append('<option value = "0">-Select-</option>');
                            $.each(Category, function () {
                                $("#ddlCollege").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                catCount++;
                            });
                        },
                        error: function (a, b, c) {
                            alert("2." + a.responseText);
                        }
                    });
                   
                    // Show Hide ICAR List And Rest Application.
                    $("input[name='PGApp']").on('change', function () {
                        if ($("input[name='PGApp']:checked").val() == "No") {
                            $("#DivICARCollegeList").hide(800);
                            alert("As you have not passed the qualifying examination from" + '\n' + "Universities Recognized by State / Central Government" + '\n' + "You cannot apply for this Examination. Thanks.");
                            var rtnurl = "/g2c/forms/index.aspx";
                            window.location.href = rtnurl;
                            return;
                        }
                        //else
                        //    if ($("input[name='PGApp']:checked").val() == "Yes") {
                        //        $("#DivICARCollegeList").show(800);
                        //    }
                    });


                    $('#txtRollNo').val(RollNo);

                    $('#txtTransNo').val(TranID);
                    $('#txtTransDate').val(TransDate);

                    //hide photograph and signature control
                    $('#txtAppID').val(AppID);
                    $('#File1').hide();
                    $('#File2').hide();

                    $("#FirstName").val(AppDetails[0]["candidatename"]);
                    $('#FirstName').prop("disabled", false);
/*
                    
                    $("#FatherName").val(AppDetails[0]["fathername"]);
                    $("#MotherName").val(AppDetails[0]["mothername"]);

                    if (AppDetails[0]["fathername"] != null) {
                        $('#FatherName').prop("disabled", false);
                    }
                    else { $('#FatherName').prop("disabled", false); }

                    if (AppDetails[0]["mothername"] != null) {
                        $('#MotherName').prop("disabled", false);
                    }
                    else { $('#MotherName').prop("disabled", false); }

                    if (AppDetails[0]["BloodGroup"] != null) {
                        $('#ddlbloodgroup').val(AppDetails[0]["BloodGroup"]);
                        $('#ddlbloodgroup').prop("disabled", false);
                    } else {
                        $('#ddlbloodgroup').prop("disabled", false);
                    }
                    if (AppDetails[0]["ParentsAnnualIncome"] != null) {
                        $('#ddlParentAnnumIncome').val(AppDetails[0]["ParentsAnnualIncome"]);
                        $('#ddlParentAnnumIncome').prop("disabled", false);
                    } else {
                        $('#ddlParentAnnumIncome').prop("disabled", false);
                    }



                    if (AppDetails[0]["Gender"] != null) {
                        $('#ddlGender').val(Gender);
                        $('#ddlGender').prop("disabled", false);
                    }

                    $('#phoneno').val(phone_no);


                    if (MobileNo != null && MobileNo != "") {
                        $('#MobileNo').val(MobileNo);
                        $('#MobileNo').prop("disabled", true);
                    }
                    else { $('#MobileNo').prop("disabled", false); }

                    if (emailID != null && emailID != '') {
                        $('#EmailID').val(AppDetails[0]["email_id"]);
                        $('#EmailID').prop("disabled", true);
                    }


                    $("#txtTongue").val(AppDetails[0]["MotherTongue"]);

                    $("#religion option").each(function () {
                        if ($(this).text() == AppDetails[0]["Religion"]) {
                            $(this).attr('selected', 'selected');
                        }
                    });

                    if (AppDetails[0]["dateofbirth"] != null) {
                        var t_DOB = AppDetails[0]["dateofbirth"];
                        var D1 = t_DOB.split('-');
                        var calday = D1[2];
                        var calmon = D1[1];
                        var calyear = D1[0];
                        t_DOB = calday.toString() + "/" + calmon.toString() + "/" + calyear;

                        t_DOB = t_DOB.replace(/-/g, "/");
                        $('#DOB').val(t_DOB);
                        $('#DOB').prop("disabled", false);


                        t_DOB = $("#DOB").val();
                        t_DOB = t_DOB.replace("-", "/");
                        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                        var selectedYear = S_date.getFullYear(); // selected year

                        var Age = calcExSerDur(t_DOB, '31/12/2019');
                        $('#Age').val(Age.years);

                        $("#Year").val(Age.years);
                        $("#Month").val(Age.months);
                        $("#Day").val(Age.days);

                        $("#Year").prop("disabled", true);
                        $("#Month").prop("disabled", true);
                        $("#Day").prop("disabled", true);

                    }
                    if (AppDetails[0]["religion"] != null && AppDetails[0]["religion"] != '') {
                        $('#religion option').map(function () {
                            if ($(this).text() == AppDetails[0]["religion"]) return this;
                        }).attr('selected', 'selected');

                        $("#religion").prop("disabled", false);
                    } else {
                        $("#religion").prop("disabled", false);
                    }

                    if (AppDetails[0]["category"] != null && AppDetails[0]["category"] != '') {
                        $('#category option').map(function () {
                            if ($(this).text() == AppDetails[0]["category"]) return this;
                        }).attr('selected', 'selected');

                        $("#category").prop("disabled", false);
                    } else {
                        $("#category").prop("disabled", false);
                    }

                    if (AppDetails[0]["mothertongue"] != null && AppDetails[0]["mothertongue"] != '') {
                        $('#txtTongue option').map(function () {
                            if ($(this).text() == AppDetails[0]["mothertongue"]) return this;
                        }).attr('selected', 'selected');

                        $("#txtTongue").prop("disabled", false);
                    } else {
                        $("#txtTongue").prop("disabled", false);
                    }

                    $("#nationality").val('Indian');
                    $("#nationality").prop("disabled", true);


                    //Image Details

                    if (AppDetails[0]["ApplicantImageStr"] != null && AppDetails[0]["ApplicantImageStr"] != "") {

                        $('#myImg').attr('src', AppDetails[0]["ApplicantImageStr"]);
                    }
                    else { $('#File1').show(); }


                    if (AppDetails[0]["ImageSign"] != null && AppDetails[0]["ImageSign"] != "") {
                        $('#mySign').attr('src', AppDetails[0]["ImageSign"]);

                    }

                    //EL("HFb64").value = obj["Image"];
                    //EL("HFb64Sign").value = obj["ImageSign"];
                    var PinCode = AppDetails[0]["PerPIN"];
                    if (AppDetails[0]["PreHouse"] != null && AppDetails[0]["PreHouse"] != "") {
                        $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(AppDetails[0]["PreHouse"]);
                    }

                    if (AppDetails[0]["PerSector"] != null && AppDetails[0]["PerSector"] != "") {
                        $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(AppDetails[0]["PerSector"]);
                    }

                    if (AppDetails[0]["PerRoad"] != null && AppDetails[0]["PerRoad"] != "") {
                        $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(AppDetails[0]["PerRoad"]);
                    }

                    if (AppDetails[0]["PerLandmark"] != null && AppDetails[0]["PerLandmark"] != "") {
                        $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(AppDetails[0]["PerLandmark"]);
                    }

                    if (AppDetails[0]["PerLocality"] != null && AppDetails[0]["PerLocality"] != "") {
                        $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(AppDetails[0]["PerLocality"]);
                    }



                    $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val(PinCode);

                    $("#ContentPlaceHolder1_HFProfileID").val(AppDetails[0]["aadhaarNumber"]);
                    //bind present and current G.AddrCareOf , G.AddrBuilding , G.AddrLandmark ,'' postOffice , G.AddrLocality , G.AddrStreet , F.stdcode AS StdCode
                    var AddrBuilding = AppDetails[0]["CorHouse"];
                    var AddrcareOf = AppDetails[0]["CorSector"];
                    var Addrlandmark = AppDetails[0]["CorLandmark"];
                    var Addrlocality = AppDetails[0]["CorLocality"];
                    var Addrstreet = AppDetails[0]["CorRoad"];
                    var CurrentPinCode = AppDetails[0]["CorPIN"];

                    $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(AddrcareOf);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(AddrBuilding);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(Addrstreet);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(Addrlandmark);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(Addrlocality);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(CurrentPinCode);

                    var StateName = AppDetails[0]["PerStateCode"];
                    var DistrictName = AppDetails[0]["PerDistrictCode"];
                    var SubDistrictname = AppDetails[0]["PerBlockCode"];
                    var VillageName = AppDetails[0]["PerVillageCode"];

                    var CurrentStateName = AppDetails[0]["CorStateCode"];
                    var CurrentDistrictName = AppDetails[0]["CorDistrictCode"];
                    var CurrentSubDistrictname = AppDetails[0]["CorBlockCode"];
                    var CurrentVillageName = AppDetails[0]["CorVillageCode"];

                    if (StateName != null && DistrictName != null || SubDistrictname != null || VillageName != null) {
                        GetStateAsPerUIDUsingCode(StateName, DistrictName, SubDistrictname, VillageName, 'PddlState', 'PddlDistrict', 'PddlTaluka', 'PddlVillage');
                    }
                    if (CurrentStateName != null && CurrentDistrictName != null || CurrentSubDistrictname != null || CurrentVillageName != null) {
                        GetStateAsPerUIDUsingCode(CurrentStateName, CurrentDistrictName, CurrentSubDistrictname, CurrentVillageName, 'CddlState', 'CddlDistrict', 'CddlTaluka', 'CddlVillage');
                    }



                    var knowodia = AppDetails[0]["knowodia"];
                    var readodia = AppDetails[0]["readodia"];
                    var writeodia = AppDetails[0]["writeodia"];
                    var speakodia = AppDetails[0]["speakodia"];

                    if (knowodia == true) {

                        //$("input[name='radio1']").prop('checked', true);
                        //$("input[name='radio1']").val("yes");
                        $("input[name='radio1'][value='yes']").prop("checked", true);

                        $('#divResi').hide(500);
                        $('#divLang').show(500);

                        if (readodia == true) {
                            $('#readOdiya').prop('checked', true);
                        }

                        if (writeodia == true) {
                            $('#writeOdiya').prop('checked', true);
                        }

                        if (speakodia == true) {
                            $('#spkOdiya').prop('checked', true);
                        }


                    } else {
                        //$("input[name='radio1']").val("no");
                        $("input[name='radio1'][value='no']").prop("checked", true);

                        $('#divResi').show(500);
                        $('#divLang').hide(500);

                        $('#ddlResidence').val(ResidentType);

                        $("#ddlResidence option").each(function () {
                            if ($(this).text() == ResidentType) {
                                $(this).attr('selected', 'selected');
                            }
                        });


                    }
*/
                }
            });


    }
    $("#progressbar").hide();
}

function CalculateBscPercentage_old(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;
    var result = 0;

    {
        if ($("#BscDivision").val() == "501") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (TotalMarks < 6.60) {
                alert("OGPA cannot be less than 6.60");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (TotalMarks > 10.0) {
                alert("Please enterr valid OGPA");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }
            result = ((TotalMarks / 10) * 100).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else {

            if (MarksObtained == "") return;
            if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
                alert("Total Marks must be greater than Marks Obtained");
                $('#BscTotalMarks').val("");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            if (TotalMarks <= 0) TotalMarks = 1;
            result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

            if ($('#ddlProgram').val() == "Master Programme") {
                if (result < 60.00) {
                    alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                    $('#BscMarksGot').val("");
                    $("#BscPercentage").val("");
                }

                if (result < 50.00) {
                    alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                    $('#BscMarksGot').val("");
                    $("#BscPercentage").val("");
                }
            }

            if ($('#ddlProgram').val() == "Doctoral Programme") {
                if ($("#BscDivision").val() == "502") {
                    if (result < 65.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 65.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                        return;
                    }
                }
            }
            $("#BscPercentage").val(result + ' %');
        }
    }

    if ($('#ddlProgram').val() == "Doctoral Programme") {
        if ($("#BscDivision").val() != "502" || $("#BscDivision").val() != "0")
            if (TotalMarks < 7.0) {
                alertPopup("Doctoral Programme Validation", "<BR> For Doctoral Programme OGPA cannot be less than 7.0");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                $('#BscDivision').val('501');
                return;
            }
    }

    else {

        if (MarksObtained == "") return;
        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#BscTotalMarks').val("");
            $('#BscMarksGot').val("");
            $("#BscPercentage").val("");
            return;
        }

        if (TotalMarks <= 0) TotalMarks = 1;
        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

        if ($('#ddlProgram').val() == "Master Programme") {
            if (result < 60.00) {
                alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
            }

            if (result < 50.00) {
                alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
            }
        }

        if ($('#ddlProgram').val() == "Doctoral Programme") {
            if ($("#BscDivision").val() == "502") {
                if (result < 65.00) {
                    alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 65.00 %");
                    $('#BscMarksGot').val("");
                    $("#BscPercentage").val("");
                    return;
                }
            }
        }
        $("#BscPercentage").val(result + ' %');
    }
}

function CalculateBscPercentage_old(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;
    var result = 0;

    var category = $('#Category').val();
    var ReservQta = $("input[name='ReservedQuota']:checked").val();

    var Physicallyhandicaped = 0;
    if ($('#CheckBoxList1_0').is(":checked")) {
        Physicallyhandicaped = 1;
    }

    if (ReservQta == "Yes" && Physicallyhandicaped == 1) {
        category = "SC";
    }

    //if (category == "KM") { category = "GN"; }


    if (category == "General, Unreserved") {
        if ($("#BscDivision").val() == "501") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 6.60) {
                alert("OGPA cannot be less than 6.60");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 10.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            result = ((MarksObtained / 10) * 100).toFixed(2);

            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "503") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 3.25) {
                alert("OGPA cannot be less than 3.25");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 5.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((MarksObtained / 10) * 100);
            result = (x * 2).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "504") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 2.60) {
                alert("OGPA cannot be less than 2.60");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 4.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((MarksObtained * MarksObtained) * 5);
            var y = ((MarksObtained) * 10);

            result = ((x - y) + 50).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }
        else {
            if (MarksObtained == "") return;
            if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
                alert("Total Marks must be greater than Marks Obtained");
                $('#BscTotalMarks').val("");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            if (TotalMarks <= 0) TotalMarks = 1;
            result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

            if ($('#ddlProgram').val() == "MasterProgramme") {
                if (category == "General, Unreserved") {
                    if (result < 60.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }

                else if (category == "ST" || category == "SC" || category == "Kashmiri Migrant") {
                    if (result < 50.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }
            }
        }
    }

    if (category == "SC" || category == "ST" || category == "Kashmiri Migrant") {
        if ($("#BscDivision").val() == "501") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 5.60) {
                alert("OGPA cannot be less than 5.60");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 10.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            result = ((MarksObtained / 10) * 100).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "503") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 2.75) {
                alert("OGPA cannot be less than 2.75");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 5.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((MarksObtained / 10) * 100);
            result = (x * 2).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "504") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 2.20) {
                alert("OGPA cannot be less than 2.20");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 4.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((MarksObtained * MarksObtained) * 5);
            var y = ((MarksObtained) * 10);

            result = ((x - y) + 50).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }
        else {
            if (MarksObtained == "") return;
            if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
                alert("Total Marks must be greater than Marks Obtained");
                $('#BscTotalMarks').val("");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            if (TotalMarks <= 0) TotalMarks = 1;
            result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

            if ($('#ddlProgram').val() == "MasterProgramme") {
                if (category == "General, Unreserved") {
                    if (result < 60.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }

                else if (category == "ST" || category == "SC" || category == "Kashmiri Migrant") {
                    if (result < 50.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }
            }
        }
    }
    $("#BscPercentage").val(result + ' %');
}

function CalculateBscPercentage(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;
    var result = 0;

    //if (TotalMarks < MarksObtained) { 
    //    alertPopup("Marks Validation","Total Marks cannot be grester than MarksObtained %");
    //    $('#BscTotalMarks').val("");
    //    $('#BscMarksGot').val("");
    //    $('#BscTotalMarks').focus();
    //    return;
    //}

    var category = m_Category;
    var ReservQta = m_ReservQta;

    var Physicallyhandicaped = m_PH;
    if (m_PH=="Yes") {
        Physicallyhandicaped = 1;
    }

    if (ReservQta == "Yes" && Physicallyhandicaped == 1) {
        category = "SC";
    }

    //if (category == "KM") { category = "GN"; }


    if (category == "General, Unreserved") {
        if ($("#BscDivision").val() == "501") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 6.60) {
                alert("OGPA cannot be less than 6.60");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 10.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            result = ((MarksObtained / 10) * 100).toFixed(2);

            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "503") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 3.25) {
                alert("OGPA cannot be less than 3.25");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 5.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((MarksObtained / 10) * 100);
            result = (x * 2).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "504") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 2.60) {
                alert("OGPA cannot be less than 2.60");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 4.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((MarksObtained * MarksObtained) * 5);
            var y = ((MarksObtained) * 10);

            result = ((x - y) + 50).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }
        else {
            if (MarksObtained == "") return;
            if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
                alertPopup("Marks Validation", "Total Marks cannot be grester than Marks Obtained");
                $('#BscTotalMarks').val("");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                $('#BscTotalMarks').focus();
                return;
            }
            if (TotalMarks <= 0) TotalMarks = 1;
            result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

            if ($('#ddlProgram').val() == "Master Programme") {
                if (category == "General, Unreserved") {
                    if (result < 60.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }

                else if (category == "ST" || category == "SC" || category == "Kashmiri Migrant") {
                    if (result < 50.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }
            }
        }
    }

    if (category == "SC" || category == "ST" || category == "Kashmiri Migrant") {
        if ($("#BscDivision").val() == "501") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 5.60) {
                alert("OGPA cannot be less than 5.60");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 10.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            result = ((MarksObtained / 10) * 100).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "503") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 2.75) {
                alert("OGPA cannot be less than 2.75");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 5.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((MarksObtained / 10) * 100);
            result = (x * 2).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "504") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 2.20) {
                alert("OGPA cannot be less than 2.20");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (MarksObtained > 4.0) {
                alert("Please enterr valid OGPA");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((MarksObtained * MarksObtained) * 5);
            var y = ((MarksObtained) * 10);

            result = ((x - y) + 50).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }
        else {
            if (MarksObtained == "") return;
            if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
                alertPopup("Marks Validation", "Total Marks cannot be grester than Marks Obtained");
                $('#BscTotalMarks').val("");
                $('#BscMarksGot').val("");
                $("#BscPercentage").val("");
                $('#BscTotalMarks').focus();
                return;
            }

            if (TotalMarks <= 0) TotalMarks = 1;
            result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

            if ($('#ddlProgram').val() == "MasterProgramme") {
                if (category == "General, Unreserved") {
                    if (result < 60.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }

                else if (category == "ST" || category == "SC" || category == "Kashmiri Migrant") {
                    if (result < 50.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }
            }
        }
    }
    $("#BscPercentage").val(result + ' %');
}


function CalculateMscPercentage(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;
    var result = 0;

    {
        if ($("#MscDivision").val() == "501") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (MarksObtained < 7.00) {
                alert("OGPA cannot be less than 7.00");
                $('#MscMarksGot').val("");
                $("#MscPercentage").val("");
                return;
            }

            if (MarksObtained > 10.0) {
                alert("Please enterr valid OGPA");
                $('#MscMarksGot').val("");
                $("#MscPercentage").val("");
                return;
            }
            result = ((MarksObtained / 10) * 100).toFixed(2);
            $("#MscPercentage").val(result + ' %');
        }

        else {

            if (MarksObtained == "") return;
            if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
                alert("Total Marks must be greater than Marks Obtained");
                $('#MscTotalMarks').val("");
                $('#MscMarksGot').val("");
                $("#MscPercentage").val("");
                return;
            }
            if (TotalMarks <= 0) TotalMarks = 1;
            result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

            if ($('#ddlProgram').val() == "MasterProgramme") {
                if (result < 60.00) {
                    alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                    $('#MscMarksGot').val("");
                    $("#MscPercentage").val("");
                }

                if (result < 50.00) {
                    alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                    $('#MscMarksGot').val("");
                    $("#MscPercentage").val("");
                }
            }

            if ($('#ddlProgram').val() == "DoctoralProgramme") {
                if ($("#MscDivision").val() == "502") {
                    if (result < 65.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 65.00 %");
                        $('#MscMarksGot').val("");
                        $("#MscPercentage").val("");
                        return;
                    }
                }
            }
            $("#MscPercentage").val(result + ' %');
        }
    }

    if ($('#ddlProgram').val() == "DoctoralProgramme") {
        if ($("#MscDivision").val() != "502" || $("#MscDivision").val() != "0")
            if (MarksObtained < 7.0) {
                alertPopup("Doctoral Programme Validation", "<BR> For Doctoral Programme OGPA cannot be less than 7.0");
                $('#MscMarksGot').val("");
                $("#MscPercentage").val("");
                $('#MscDivision').val('501');
                return;
            }
    }


    else {

        if (MarksObtained == "") return;
        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#MscTotalMarks').val("");
            $('#MscMarksGot').val("");
            $("#MscPercentage").val("");
            return;
        }
        if (TotalMarks <= 0) TotalMarks = 1;
        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

        if ($('#ddlProgram').val() == "MasterProgramme") {
            if (result < 60.00) {
                alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                $('#MscMarksGot').val("");
                $("#MscPercentage").val("");
            }

            if (result < 50.00) {
                alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                $('#MscMarksGot').val("");
                $("#MscPercentage").val("");
            }
        }

        if ($('#ddlProgram').val() == "DoctoralProgramme") {
            if ($("#MscDivision").val() == "502") {
                if (result < 65.00) {
                    alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 65.00 %");
                    $('#MscMarksGot').val("");
                    $("#MscPercentage").val("");
                    return;
                }
            }
        }
        $("#MscPercentage").val(result + ' %');
    }
}


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
    var AppID = qs["AppID"];

    var t_Message = "";
    var result = false;
    var temp = "Mohan";
    var rtnurl = "";
    var result = false;


    var datavar = {
        'AppID': AppID,
        'BscName': $('#BscName').val(),
        'BscDivision': $('#BscDivision').val(),
        'BscPassingYear': $('#BscPassingYear').val(),
        'BscTotalMarks': $('#BscTotalMarks').val(),
        'BscMarksGot': $('#BscMarksGot').val(),
        'BscPercentage': $('#BscPercentage').val(),
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
            url: '/WebApp/Kiosk/OUAT/PGphD/PGPHDEditMarks.aspx/InsertPGPHDMarks',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $('#g207').hide();
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
            $("#btnSubmit").prop('disabled', false);
            alertPopup("Form Validation Failed", "Error While Saving Application.!!!, <BR> Either You Have MobileNumber or AadhaarNumber Which Has Been Used Earlier!!!");
            return;
        }
        else {
            if (result /*&& jqXHRData_IMG_result*/) {
                $("#btnSubmit").prop('disabled', true);
                alert('Application Updated Sucessfully! Please upload the necessary Document.');
                window.location.href = '/WebApp/Kiosk/Forms/Acknowledgement.aspx?SvcID=419&AppID=' + obj.AppID + '&UID=' + uid;
            }
            else {
                $('#g207').hide();
                $("#btnSubmit").prop('disabled', false);
                alertPopup("Form Validation Failed", "Unable to save Applicatin, Please refresh the browser and try again");
            }
        }
    });

    return false;
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

function ValidateForm() {

    var text = "";
    var opt = "";

    if ($('#BscName').val() == null || $('#BscName').val() == '') {
        text += "<BR>" + " \u002A" + " Please Enter Name of the Board/University.";
        $('#BscName').attr('style', 'border:1px solid #d03100 !important;');
        $('#BscName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#BscName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#BscName').css({ "background-color": "#ffffff" });
    }


    if ($('#BscDivision').val() == "0" || $('#BscDivision').val() == "-Select-") {
        text += "<BR>" + " \u002A" + " Please Select Grade System from List.";
        $('#BscDivision').attr('style', 'border:1px solid #d03100 !important;');
        $('#BscDivision').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#BscDivision').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#BscDivision').css({ "background-color": "#ffffff" });

        if ($('#BscDivision').val() == "501") {
            if ($('#BscPassingYear').val() == "" || $('#BscPassingYear').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Master University Passing Year.";
                $('#BscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                $('#BscPassingYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#BscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#BscPassingYear').css({ "background-color": "#ffffff" });

                if ($('#BscMarksGot').val() == "" || $('#BscMarksGot').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your OGPA Scored Value.";
                    $('#BscMarksGot').attr('style', 'border:1px solid #d03100 !important;');
                    $('#BscMarksGot').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#BscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#BscMarksGot').css({ "background-color": "#ffffff" });
                }
            }
        }


        if ($('#BscDivision').val() == "502") {
            if ($('#BscPassingYear').val() == "" || $('#BscPassingYear').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Master University Passing Year.";
                $('#BscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                $('#BscPassingYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#BscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#BscPassingYear').css({ "background-color": "#ffffff" });

                if ($('#BscTotalMarks').val() == "" || $('#BscTotalMarks').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your Master University Total Marks.";
                    $('#BscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                    $('#BscTotalMarks').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#BscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#BscTotalMarks').css({ "background-color": "#ffffff" });

                    if ($('#BscMarksGot').val() == "" || $('#BscMarksGot').val() == null) {
                        text += "<BR>" + " \u002A" + " Please Enter Your Master University Marks Scored.";
                        $('#BscMarksGot').attr('style', 'border:1px solid #d03100 !important;');
                        $('#BscMarksGot').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#BscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#BscMarksGot').css({ "background-color": "#ffffff" });
                    }
                }
            }
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function isNumberAndYear(CntrlID) {

    var Value = $("[id=" + CntrlID + "]").val();

    if (Value.length != 4) {
        alertPopup("Passing Year Validation", "<BR>" + " \u002A" + " Year Should Be of 4 Digit.");
        $("[id=" + CntrlID + "]").val('');
        return false;
    }

    if (Value < "2000") {
        alertPopup("Passing Year Validation", "<BR>" + " \u002A" + " Year Should Not Be Less Than 2000");
        $("[id=" + CntrlID + "]").val('');
        return false;
    }

    if (Value > "2019") {
        alertPopup("Passing Year Validation", "<BR>" + " \u002A" + " Year Should Not Be More Than 2019");
        $("[id=" + CntrlID + "]").val('');
        return false;
    }

    return true;
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