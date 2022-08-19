
$(document).ready(function () {

    $("#progressbar").hide();
    $('#txtPoliceStation').hide();
    $("#divMsc").hide(800);
    GetOUATState();
    GetOUATState2();

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

    $('#DOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        onSelect: function (date) {
            var Age = calcDobAge(date);
            var Age = calcExSerDur(date, '31/12/2017');
            $('#Age').val(Age.years);
            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);
        }
    });

    $("#ddlCollege").prop('disabled', true);
    $("#ddlDegree").prop('disabled', true);
    $("#ddlSubject").prop('disabled', true);


    $("#ddlSearch").bind("change", function (e) {
        if ($("#ddlSearch").val() == "Aadhaar Enrollment Number") {
            $("#UID").val('');
            $("#UID").prop('disabled', false);
            $("#UID").attr("placeholder", "Enter 14 digit Aadhaar Enrollment Number");
            $("#UID").attr("maxlength", 14);
        }

        if ($("#ddlSearch").val() == "Aadhaar Number") {
            $("#UID").val('');
            $("#UID").prop('disabled', false);
            $("#UID").attr("placeholder", "Enter 12 digit Aadhaar Number");
            $("#UID").attr("maxlength", 12);
        }
    });

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

        if ($("#ddlProgram").val() == "MasterProgramme") {
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
            $("#SpecialClaim").show(800);
            $("option[value='503']").attr('style', 'display: block !important;');
            $("option[value='504']").attr('style', 'display: block !important;');
            $("#divMsc").hide(800);
        }

        if ($("#ddlProgram").val() == "DoctoralProgramme") {
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
            $("input[id='CheckBoxList1_0']").hide(800);
            $("label[for='CheckBoxList1_0']").attr('style', 'display: none !important;');
            $("input[id='CheckBoxList1_1']").hide(800);
            $("label[for='CheckBoxList1_1']").attr('style', 'display: none !important;');
            $("input[id='CheckBoxList1_3']").hide(800);
            $("label[for='CheckBoxList1_3']").attr('style', 'display: none !important;');
            $("#SpecialClaim").hide(800);
            $("option[value='503']").attr('style', 'display: none !important;');
            $("option[value='504']").attr('style', 'display: none !important;');
            $("#divMsc").show(800);
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


    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);


    $("#OthrInfo1N").on('change', function () {
        $("#txtDocType").val('');
    });

    $("#OthrInfo3N").on('change', function () {
        $("#txtDesgntnName").val('');
        $("#txtEmployerName").val('');
        $("#txtEmployerAddrss").val('');
        $("#EmployerNoc").val('0');
    });


    $("#OthrInfo2N").on('change', function () {
        $("input[name='radio6']").prop('checked', false);
    });

    $("#divPCPercent").hide(800);
    $("input[name='HandicapType']").on('change', function () {
        var PCPercent = $("input[name='HandicapType']:checked").val();
        if (PCPercent == "Permanent") {
            $("#divPCPercent").hide(800);
            $("#txtHandiPercent").val('');
        }
        else {
            $("#divPCPercent").show(800);
        }
    });


    $("input[name='radio5']").on('change', function () {
        var specialclaim = $("input[name='radio5']:checked").val();
        if (specialclaim == "Yes") {
            $("#divSpecialClaim").show(800);
        }
        else {
            $("#divSpecialClaim").hide(800);
        }
    });


    $("input[name='radio6']").on('change', function () {
        var chkNCC = $("input[name='radio6']:checked").val();

        if ($("input[name='radio6']:checked").val() == "Sports") {
            $("#ddlSports").show(800);
            $("#divNCC").hide(800);
            $("#ddlNSS").hide(800);
        }
        else {
            $("#ddlSports").hide(800);
        }


        if ($("input[name='radio6']:checked").val() == "N.C.C") {
            $("#divNCC").show(800);
            $("#ddlSports").hide(800);
            $("#ddlNSS").hide(800);
        }
        else {
            $("#divNCC").hide(800);
        }


        if ($("input[name='radio6']:checked").val() == "N.S.S") {
            $("#ddlNSS").show(800);
            $("#ddlSports").hide(800);
            $("#divNCC").hide(800);
        }
        else {
            $("#ddlNSS").hide(800);
        }
    });


    //var otherState = $("input[id='CheckBoxList1_2']").prop('checked', true);
    var otherState = $("input[id='CheckBoxList1_2']:checked").val();
    if (otherState = "206") {
        var SelState = $('#ddlOtherState').val();
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

                var ddlState = $("[id=ddlOtherState]");
                ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
                $.each(Category, function () {
                    $("[id=ddlOtherState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    catCount++;
                });
            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        });
    }
    else {
        var ddlState = $("[id=ddlOtherState]");
        ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
    }


    //Section 1
    $("#Yes").on('change', function () {
        $("#readOdiya").prop('disabled', false);
        $("#writeOdiya").prop('disabled', false);
        $("#spkOdiya").prop('disabled', false);
    });


    $("#No").on('change', function () {
        $("#readOdiya").prop('disabled', true);
        $("#writeOdiya").prop('disabled', true);
        $("#spkOdiya").prop('disabled', true);

        $("#readOdiya").prop('checked', false);
        $("#writeOdiya").prop('checked', false);
        $("#spkOdiya").prop('checked', false);
    });


    $('#HscPassingYear').prop('disabled', true);
    $('#HscTotalMarks').prop('disabled', true);
    $('#HscMarksGot').prop('disabled', true);

    $('#SscPassingYear').prop('disabled', true);
    $('#SscTotalMarks').prop('disabled', true);
    $('#SscMarksGot').prop('disabled', true);

    $('#MscPassingYear').prop('disabled', true);
    $('#MscTotalMarks').prop('disabled', true);
    $('#MscMarksGot').prop('disabled', true);

    $('#BscPassingYear').prop('disabled', true);
    $('#BscTotalMarks').prop('disabled', true);
    $('#BscMarksGot').prop('disabled', true);


    $('#HscTotalMarks').change(function () {
        CalculateHscPercentage($('#HscTotalMarks').val(), $('#HscMarksGot').val());
    });

    $('#SscTotalMarks').change(function () {
        CalculateSscPercentage($('#SscTotalMarks').val(), $('#SscMarksGot').val());
    });

    $('#BscTotalMarks').change(function () {
        CalculateBscPercentage($('#BscTotalMarks').val(), $('#BscMarksGot').val());
    });

    $('#MscTotalMarks').change(function () {
        CalculateMscPercentage($('#MscTotalMarks').val(), $('#MscMarksGot').val());
    });



    $('#HscMarksGot').change(function () {
        CalculateHscPercentage($('#HscTotalMarks').val(), $('#HscMarksGot').val());
    });

    $('#SscMarksGot').change(function () {
        CalculateSscPercentage($('#SscTotalMarks').val(), $('#SscMarksGot').val());
    });

    $('#BscMarksGot').change(function () {
        CalculateBscPercentage($('#BscTotalMarks').val(), $('#BscMarksGot').val());
    });

    $('#MscMarksGot').change(function () {
        CalculateMscPercentage($('#MscTotalMarks').val(), $('#MscMarksGot').val());
    });



    $("#HscDivision").bind("change", function (e) {
        if ($("#HscDivision").val() == "501") {

            $('#lblHscMarksGot').removeClass("manadatory");
            $('#HscPassingYear').prop('disabled', false);
            $('#HscTotalMarks').prop('disabled', false);
            $('#HscMarksGot').prop('disabled', false);

            $("#HscTotalMarks").attr("placeholder", "CGPA").val("").focus().blur();
            $("#lblHscTotalMarks").text("CGPA Secured");
            $("#HscMarksGot").prop('disabled', true);

            $('#HscTotalMarks').val("");
            $('#HscMarksGot').val("");
            $("#HscPercentage").val("");

        }
        else {

            $('#lblHscMarksGot').addClass("manadatory");
            $('#HscPassingYear').prop('disabled', false);
            $('#HscTotalMarks').prop('disabled', false);
            $('#HscMarksGot').prop('disabled', false);

            $("#HscTotalMarks").attr("placeholder", "Total Marks").val("").focus().blur();
            $("#lblHscTotalMarks").text("Total Marks");
            $("#HscMarksGot").prop('disabled', false);

            $('#HscTotalMarks').val("");
            $('#HscMarksGot').val("");
            $("#HscPercentage").val("");
        }

        if ($('#HscDivision').val() == "0") {
            $('#HscPassingYear').val('');
            $('#HscPassingYear').prop('disabled', true);
            $('#HscTotalMarks').val('');
            $('#HscTotalMarks').prop('disabled', true);
            $('#HscMarksGot').val('');
            $('#HscMarksGot').prop('disabled', true);
        }

    });


    $("#SscDivision").bind("change", function (e) {
        if ($("#SscDivision").val() == "501") {

            $('#lblSscMarksGot').removeClass("manadatory");
            $('#SscPassingYear').prop('disabled', false);
            $('#SscTotalMarks').prop('disabled', false);
            $('#SscMarksGot').prop('disabled', false);

            $("#SscTotalMarks").attr("placeholder", "OGPA").val("").focus().blur();
            $("#lblSscTotalMarks").text("OGPA Secured");
            $("#SscMarksGot").prop('disabled', true);

            $('#SscTotalMarks').val("");
            $('#SscMarksGot').val("");
            $("#SscPercentage").val("");

        }
        else {

            $('#lblSscMarksGot').addClass("manadatory");
            $('#SscPassingYear').prop('disabled', false);
            $('#SscTotalMarks').prop('disabled', false);
            $('#SscMarksGot').prop('disabled', false);

            $("#SscTotalMarks").attr("placeholder", "Total Marks").val("").focus().blur();
            $("#lblSscTotalMarks").text("Total Marks");
            $("#SscMarksGot").prop('disabled', false);

            $('#SscTotalMarks').val("");
            $('#SscMarksGot').val("");
            $("#SscPercentage").val("");
        }

        if ($('#SscDivision').val() == "0") {
            $('#SscPassingYear').val('');
            $('#SscPassingYear').prop('disabled', true);
            $('#SscTotalMarks').val('');
            $('#SscTotalMarks').prop('disabled', true);
            $('#SscMarksGot').val('');
            $('#SscMarksGot').prop('disabled', true);
        }
    });


    $("#BscDivision").bind("change", function (e) {

        if ($("#BscDivision").val() == "501" || $("#BscDivision").val() == "503" || $("#BscDivision").val() == "504") {

            $('#lblBscMarksGot').removeClass("manadatory");
            $('#BscPassingYear').prop('disabled', false);
            $('#BscTotalMarks').prop('disabled', false);
            $('#BscMarksGot').prop('disabled', false);

            $("#BscTotalMarks").attr("placeholder", "OGPA").val("").focus().blur();
            $("#lblBscTotalMarks").text("OGPA Secured");
            $("#BscMarksGot").prop('disabled', true);

            $('#BscTotalMarks').val("");
            $('#BscMarksGot').val("");
            $("#BscPercentage").val("");

        }
        else {

            $('#lblBscMarksGot').addClass("manadatory");
            $('#BscPassingYear').prop('disabled', false);
            $('#BscTotalMarks').prop('disabled', false);
            $('#BscMarksGot').prop('disabled', false);

            $("#BscTotalMarks").attr("placeholder", "Total Marks").val("").focus().blur();
            $("#lblBscTotalMarks").text("Total Marks");
            $("#BscMarksGot").prop('disabled', false);

            $('#BscTotalMarks').val("");
            $('#BscMarksGot').val("");
            $("#BscPercentage").val("");
        }

        if ($('#BscDivision').val() == "0") {
            $('#BscPassingYear').val('');
            $('#BscPassingYear').prop('disabled', true);
            $('#BscTotalMarks').val('');
            $('#BscTotalMarks').prop('disabled', true);
            $('#BscMarksGot').val('');
            $('#BscMarksGot').prop('disabled', true);
        }
    });


    $("#MscDivision").bind("change", function (e) {
        if ($("#MscDivision").val() == "501" || $("#MscDivision").val() == "503" || $("#MscDivision").val() == "504") {

            $('#lblMscMarksGot').removeClass("manadatory");
            $('#MscPassingYear').prop('disabled', false);
            $('#MscTotalMarks').prop('disabled', false);
            $('#MscMarksGot').prop('disabled', false);

            $("#MscTotalMarks").attr("placeholder", "OGPA").val("").focus().blur();
            $("#lblMscTotalMarks").text("OGPA Secured");
            $("#MscMarksGot").prop('disabled', true);

            $('#MscTotalMarks').val("");
            $('#MscMarksGot').val("");
            $("#MscPercentage").val("");

        }
        else {

            $('#lblMscMarksGot').addClass("manadatory");
            $('#MscPassingYear').prop('disabled', false);
            $('#MscTotalMarks').prop('disabled', false);
            $('#MscMarksGot').prop('disabled', false);

            $("#MscTotalMarks").attr("placeholder", "Total Marks").val("").focus().blur();
            $("#lblMscTotalMarks").text("Total Marks");
            $("#MscMarksGot").prop('disabled', false);

            $('#MscTotalMarks').val("");
            $('#MscMarksGot').val("");
            $("#MscPercentage").val("");
        }

        if ($('#MscDivision').val() == "0") {
            $('#MscPassingYear').val('');
            $('#MscPassingYear').prop('disabled', true);
            $('#MscTotalMarks').val('');
            $('#MscTotalMarks').prop('disabled', true);
            $('#MscMarksGot').val('');
            $('#MscMarksGot').prop('disabled', true);
        }
    });
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


function EduValidation()
{
    var ddlState = $("[id=ddlOtherState]");
    ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
    $.each(Category, function () {
        $("[id=ddlOtherState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
        catCount++;
    });
}



function CalculateHscPercentage(TotalMarks, MarksObtained) {

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



    if ($("#HscDivision").val() == "501") {
        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.25) {
            alert("CGPA cannot be less than 3.25");
            $('#HscTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid CGPA");
            $('#HscTotalMarks').val("");
            return;
        }
        result = ((TotalMarks) * 9.5).toFixed(2);

        //if ($('#ddlProgram').val() == "MasterProgramme") {
        //    if (category == "GN") {
        //        if (result < 60.00) {
        //            alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
        //            $('#HscTotalMarks').val("");
        //        }
        //    }

        //    else if (category != "GN" || category != "0") {
        //        if (result < 50.00) {
        //            alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
        //            $('#HscTotalMarks').val("");
        //        }
        //    }
        //}
    }

    else {

        if (MarksObtained == "") return;
        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#HscTotalMarks').val("");
            $('#HscMarksGot').val("");
            $("#HscPercentage").val("");
            return;
        }
        if (TotalMarks <= 0) TotalMarks = 1;
        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

        //if ($('#ddlProgram').val() == "MasterProgramme") {
        //    if (category == "GN") {
        //        if (result < 60.00) {
        //            alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
        //            $('#HscMarksGot').val("");
        //        }
        //    }

        //    else if (category != "GN" || category != "0") {
        //        if (result < 50.00) {
        //            alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
        //            $('#HscMarksGot').val("");
        //        }
        //    }
        //}
    }
    $("#HscPercentage").val(result + ' %');
}


function CalculateSscPercentage(TotalMarks, MarksObtained) {

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

    if ($("#SscDivision").val() == "501") {
        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("OGPA cannot be less than 3.5");
            $('#SscTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid OGPA");
            $('#SscTotalMarks').val("");
            return;
        }
        result = ((TotalMarks) * 9.5).toFixed(2);

        //if ($('#ddlProgram').val() == "MasterProgramme") {
        //    if (category == "GN") {
        //        if (result < 60.00) {
        //            alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
        //            $('#SscTotalMarks').val("");
        //        }
        //    }

        //    else if (category != "GN" || category != "0") {
        //        if (result < 50.00) {
        //            alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
        //            $('#SscTotalMarks').val("");
        //        }
        //    }
        //}
    }
    else {

        if (MarksObtained == "") return;
        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#SscTotalMarks').val("");
            $('#SscMarksGot').val("");
            $("#SscPercentage").val("");
            return;
        }
        if (TotalMarks <= 0) TotalMarks = 1;
        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

        //if ($('#ddlProgram').val() == "MasterProgramme") {
        //    if (category == "GN") {
        //        if (result < 60.00) {
        //            alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
        //            $('#SscMarksGot').val("");
        //        }
        //    }

        //    else if (category != "GN" || category != "0") {
        //        if (result < 50.00) {
        //            alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
        //            $('#SscMarksGot').val("");
        //        }
        //    }
        //}
    }
    $("#SscPercentage").val(result + ' %');
}




function CalculateBscPercentage(TotalMarks, MarksObtained) {

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


    if (category == "GN") {
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

        else if ($("#BscDivision").val() == "503") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (TotalMarks < 3.25) {
                alert("OGPA cannot be less than 3.25");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (TotalMarks > 5.0) {
                alert("Please enterr valid OGPA");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((TotalMarks / 10) * 100);
            result = (x * 2).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "504") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (TotalMarks < 2.60) {
                alert("OGPA cannot be less than 2.60");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (TotalMarks > 4.0) {
                alert("Please enterr valid OGPA");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((TotalMarks * TotalMarks) * 5);
            var y = ((TotalMarks) * 10);

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
                if (category == "GN") {
                    if (result < 60.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }

                else if (category == "ST" || category == "SC") {
                    if (result < 50.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }
            }
        }
    }

    if (category == "SC" || category == "ST") {
        if ($("#BscDivision").val() == "501") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (TotalMarks < 5.60) {
                alert("OGPA cannot be less than 5.60");
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

        else if ($("#BscDivision").val() == "503") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (TotalMarks < 2.75) {
                alert("OGPA cannot be less than 2.75");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (TotalMarks > 5.0) {
                alert("Please enterr valid OGPA");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((TotalMarks / 10) * 100);
            result = (x * 2).toFixed(2);
            $("#BscPercentage").val(result + ' %');
        }

        else if ($("#BscDivision").val() == "504") {
            if (TotalMarks <= 0) TotalMarks = 1;

            if (TotalMarks < 2.20) {
                alert("OGPA cannot be less than 2.20");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }

            if (TotalMarks > 4.0) {
                alert("Please enterr valid OGPA");
                $('#BscTotalMarks').val("");
                $("#BscPercentage").val("");
                return;
            }
            var x = ((TotalMarks * TotalMarks) * 5);
            var y = ((TotalMarks) * 10);

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
                if (category == "GN") {
                    if (result < 60.00) {
                        alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
                        $('#BscMarksGot').val("");
                        $("#BscPercentage").val("");
                    }
                }

                else if (category == "ST" || category == "SC") {
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

            if (TotalMarks < 6.60) {
                alert("OGPA cannot be less than 6.60");
                $('#MscTotalMarks').val("");
                $("#MscPercentage").val("");
                return;
            }

            if (TotalMarks > 10.0) {
                alert("Please enterr valid OGPA");
                $('#MscTotalMarks').val("");
                $("#MscPercentage").val("");
                return;
            }
            result = ((TotalMarks / 10) * 100).toFixed(2);
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
            if (TotalMarks < 7.0) {
                alertPopup("Doctoral Programme Validation", "<BR> For Doctoral Programme OGPA cannot be less than 7.0");
                $('#MscTotalMarks').val("");
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


// Permananent Address Binding

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
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATDistrict',
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


function isNumberKeyDecimal(e,cntrlid) {
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
                    //url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATDistrict',
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


function ValidateForm() {
    var text = "";
    var opt = "";

    // Basic Information 

    var FirstName = $("#FirstName");
    var FatherName = $("#FatherName");
    var MotherName = $("#MotherName");
    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Category = $('#Category').val();
    var Religion = $("#religion").val();
    var Nationality = $("#nationality option:selected").text();
    var Gender = $("#ddlGender option:selected").text();
    var Tongue = $("#MotherTongue").val();

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


    if (($("#txtMobile").val() == "" || $("#txtMobile").val() == null)) {
        text += "<BR>" + " \u002A" + " Please Enter Applicant Mobile Number."
        $("#txtMobile").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtMobile").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtMobile").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMobile").css({ "background-color": "#ffffff" });
    }


    if (($("#UID").val() == "" || $("#UID").val() == null)) {
        text += "<BR>" + " \u002A" + " Please Enter Applicant Aadhaar Number."
        $("#UID").attr('style', 'border:1px solid #d03100 !important;');
        $("#UID").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#UID").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#UID").css({ "background-color": "#ffffff" });
    }

    if ($('#ddlProgram').val() != "0") {
        if (($("#ddlCollege").val() == "" || $("#ddlCollege").val() == '-Select-' || $("#ddlCollege").val() == "0")) {
            text += "<BR>" + " \u002A" + " Please Select Your College";
            $("#ddlCollege").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlCollege").css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $("#ddlCollege").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#ddlCollege").css({ "background-color": "#ffffff" });
        }

        if (($("#ddlDegree").val() == "" || $("#ddlDegree").val() == '-Select-' || $("#ddlDegree").val() == "0")) {
            text += "<BR>" + " \u002A" + " Please Select Name Of The Degree.";
            $("#ddlDegree").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlDegree").css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $("#ddlDegree").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#ddlDegree").css({ "background-color": "#ffffff" });
        }

        if (($("#ddlSubject").val() == "" || $("#ddlSubject").val() == '-Select-' || $("#ddlSubject").val() == "0" && $("#ddlSubject").val() == "DoctoralProgramme")) {
            text += "<BR>" + " \u002A" + " Please Select Name Of The Subject.";
            $("#ddlSubject").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlSubject").css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $("#ddlSubject").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#ddlSubject").css({ "background-color": "#ffffff" });
        }
    }


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

    if (MotherName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mother's Name. ";
        MotherName.attr('style', 'border:1px solid #d03100 !important;');
        MotherName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        MotherName.attr('style', 'border:1px solid #cdcdcd !important;');
        MotherName.css({ "background-color": "#ffffff" });
    }

    if (FatherName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Father's Name. ";
        FatherName.attr('style', 'border:1px solid #d03100 !important;');
        FatherName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FatherName.attr('style', 'border:1px solid #cdcdcd !important;');
        FatherName.css({ "background-color": "#ffffff" });
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

    if ((Gender == '' || Gender == '-Select-' || Gender == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Gender. ";
        $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlGender").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlGender").css({ "background-color": "#ffffff" });
    }

    if ((Religion == '' || Religion == '-Select-' || Religion == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Religion. ";
        $("#religion").attr('style', 'border:1px solid #d03100 !important;');
        $("#religion").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#religion").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#religion").css({ "background-color": "#ffffff" });
    }

    if (Category == '-Select-' || Category == "0" || Category == "") {
        text += "<BR>" + " \u002A" + " Please Select Your Category. ";
        $("#Category").attr('style', 'border:1px solid #d03100 !important;');
        $("#Category").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#Category").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#Category").css({ "background-color": "#ffffff" });
    }

    if (($("#MaritalStatus").val() == '' || $("#MaritalStatus").val() == '-Select-' || $("#MaritalStatus").val() == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Your Marital Status";
        $("#MaritalStatus").attr('style', 'border:1px solid #d03100 !important;');
        $("#MaritalStatus").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#MaritalStatus").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#MaritalStatus").css({ "background-color": "#ffffff" });
    }

    if ((Tongue == '' || Tongue == '-Select-' || Tongue == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Mother Tongue ";
        $("#MotherTongue").attr('style', 'border:1px solid #d03100 !important;');
        $("#MotherTongue").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#MotherTongue").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#MotherTongue").css({ "background-color": "#ffffff" });
    }

    if (MobileNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        MobileNo.css({ "background-color": "#ffffff" });
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
        $('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#CPinCode').css({ "background-color": "#ffffff" });
    }


    var Reservation = $("input[name='ReservedQuota']:checked").val();

    if (Reservation == null || Reservation == "undefined") {
        text += "<BR>" + " \u002A" + " Please Choose Reservation Quota.";
        $('#lblreservedseat').attr('style', 'color:red !important;');
        $('#lblreservedseat').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#lblreservedseat').attr('style', 'color:#000000 !important;');
        $('#lblreservedseat').css({ "color": "#000000 " });
    }


    //var  = $("input[id='CheckBoxList1']:checked").val();
    var Quota = 0;
    if ($("input[id='CheckBoxList1_0']").is(":checked") || $("input[id='CheckBoxList1_1']").is(":checked") || $("input[id='CheckBoxList1_2']").is(":checked") || $("input[id='CheckBoxList1_3']").is(":checked")) {
        // it is checked
        Quota = 1;
    }

    if (Reservation == "Yes") {
        if (Quota == null || Quota == "undefined" || Quota == "0") {
            text += "<BR>" + " \u002A" + " Please Select Category to Claim Reserved Seat.";
            $('#lblQuota').attr('style', 'color:red !important;');
            $('#lblQuota').css({ "color": "red !important;" });
            opt = 1;
        } else {
            $('#lblQuota').attr('style', 'color:#000000 !important;');
            $('#lblQuota').css({ "color": "#000000 " });
        }
    }



    var PhysicalHandicap = $("input[id='CheckBoxList1_0']:checked").val();
    var HandicappedPart = $('#txtHandicappedPart').val();
    var HandiPercent = $('#txtHandiPercent').val();
    var HandicapType = $("input[name='HandicapType']:checked").val();

    var NRISponsership = $("input[id='CheckBoxList1_1']:checked").val();

    if (PhysicalHandicap == '203') {

        if (HandicapType == null || HandicapType == "") {
            text += "<BR>" + " \u002A" + " Please choose Physical Handicap Type ";
            opt = 1;
        }

        if (HandicappedPart == null || HandicappedPart == "") {
            text += "<BR>" + " \u002A" + " Please Enter Handicapped Body Part ";
            $('#txtHandicappedPart').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtHandicappedPart').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtHandicappedPart').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtHandicappedPart').css({ "background-color": "#ffffff" });
        }

        if (HandicapType != null && HandicapType != "" && HandicapType == "Temporary") {

            if (HandiPercent == null || HandiPercent == "") {
                text += "<BR>" + " \u002A" + " Please Enter  Percentage Handicapped Body Percentage ";
                $('#txtHandiPercent').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtHandiPercent').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtHandiPercent').css({ "background-color": "#ffffff" });
            }

            if (HandiPercent < 39) {
                text += "<BR>" + " \u002A" + " Percentage for Handicapped Body Part must be greater than 40 %";
                $('#txtHandiPercent').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtHandiPercent').css({ "background-color": "#fff2ee" });
            } else {
                $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtHandiPercent').css({ "background-color": "#ffffff" });
            }
        } else if (HandicapType != null && HandicapType != "" && HandicapType == "P") {
            $('#txtHandiPercent').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtHandiPercent').css({ "background-color": "#ffffff" });
        }
    }





    if ($('#HscName').val() == null || $('#HscName').val() == '') {
        text += "<BR>" + " \u002A" + " Please Enter Your High School Board/University Name.";
        $('#HscName').attr('style', 'border:1px solid #d03100 !important;');
        $('#HscName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#HscName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#HscName').css({ "background-color": "#ffffff" });
    }


    if ($('#HscDivision').val() == "0" || $('#HscDivision').val() == "-Select-") {
        text += "<BR>" + " \u002A" + " Please Select Your High School Grade System.";
        $('#HscDivision').attr('style', 'border:1px solid #d03100 !important;');
        $('#HscDivision').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#HscDivision').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#HscDivision').css({ "background-color": "#ffffff" });

        if ($('#HscDivision').val() == "501") {
            if ($('#HscPassingYear').val() == "" || $('#HscPassingYear').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your High School Passing Year.";
                $('#HscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                $('#HscPassingYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#HscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#HscPassingYear').css({ "background-color": "#ffffff" });

                if ($('#HscTotalMarks').val() == "" || $('#HscTotalMarks').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your High School CGPA Value.";
                    $('#HscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                    $('#HscTotalMarks').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#HscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#HscTotalMarks').css({ "background-color": "#ffffff" });
                }
            }
        }

        if ($('#HscDivision').val() == "502") {
            if ($('#HscPassingYear').val() == "" || $('#HscPassingYear').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your High School Passing Year.";
                $('#HscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                $('#HscPassingYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#HscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#HscPassingYear').css({ "background-color": "#ffffff" });

                if ($('#HscTotalMarks').val() == "" || $('#HscTotalMarks').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your High School Total Marks.";
                    $('#HscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                    $('#HscTotalMarks').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#HscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#HscTotalMarks').css({ "background-color": "#ffffff" });

                    if ($('#HscMarksGot').val() == "" || $('#HscMarksGot').val() == null) {
                        text += "<BR>" + " \u002A" + " Please Enter Your High School Marks Scored.";
                        $('#HscMarksGot').attr('style', 'border:1px solid #d03100 !important;');
                        $('#HscMarksGot').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#HscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#HscMarksGot').css({ "background-color": "#ffffff" });
                    }
                }
            }
        }
    }



    if ($('#SscName').val() == null || $('#SscName').val() == '') {
        text += "<BR>" + " \u002A" + " Please Enter Your Higher Secondary Board/University Name.";
        $('#SscName').attr('style', 'border:1px solid #d03100 !important;');
        $('#SscName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#SscName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SscName').css({ "background-color": "#ffffff" });
    }


    if ($('#SscDivision').val() == "0" || $('#SscDivision').val() == "-Select-") {
        text += "<BR>" + " \u002A" + " Please Select Your Higher Secondary Grade System.";
        $('#SscDivision').attr('style', 'border:1px solid #d03100 !important;');
        $('#SscDivision').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#SscDivision').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SscDivision').css({ "background-color": "#ffffff" });

        if ($('#SscDivision').val() == "501") {
            if ($('#SscPassingYear').val() == "" || $('#SscPassingYear').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Higher Secondary Passing Year.";
                $('#SscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                $('#SscPassingYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#SscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#SscPassingYear').css({ "background-color": "#ffffff" });

                if ($('#SscTotalMarks').val() == "" || $('#SscTotalMarks').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your Higher Secondary OGPA Value.";
                    $('#SscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                    $('#SscTotalMarks').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#SscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#SscTotalMarks').css({ "background-color": "#ffffff" });
                }
            }
        }

        if ($('#SscDivision').val() == "502") {
            if ($('#SscPassingYear').val() == "" || $('#SscPassingYear').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Higher Secondary Passing Year.";
                $('#SscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                $('#SscPassingYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#SscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#SscPassingYear').css({ "background-color": "#ffffff" });

                if ($('#SscTotalMarks').val() == "" || $('#SscTotalMarks').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your Higher Secondary Total Marks.";
                    $('#SscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                    $('#SscTotalMarks').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#SscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#SscTotalMarks').css({ "background-color": "#ffffff" });

                    if ($('#SscMarksGot').val() == "" || $('#SscMarksGot').val() == null) {
                        text += "<BR>" + " \u002A" + " Please Enter Your Higher Secondary Marks Scored.";
                        $('#SscMarksGot').attr('style', 'border:1px solid #d03100 !important;');
                        $('#SscMarksGot').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#SscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#SscMarksGot').css({ "background-color": "#ffffff" });
                    }
                }
            }
        }
    }



    if ($('#BscName').val() == null || $('#BscName').val() == '') {
        text += "<BR>" + " \u002A" + " Please Enter Your Bachlor's University Name.";
        $('#BscName').attr('style', 'border:1px solid #d03100 !important;');
        $('#BscName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#BscName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#BscName').css({ "background-color": "#ffffff" });
    }


    if ($('#BscDivision').val() == "0" || $('#BscDivision').val() == "-Select-") {
        text += "<BR>" + " \u002A" + " Please Select Your Bachlor University Grade System.";
        $('#BscDivision').attr('style', 'border:1px solid #d03100 !important;');
        $('#BscDivision').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#BscDivision').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#BscDivision').css({ "background-color": "#ffffff" });

        if ($('#BscDivision').val() == "501") {
            if ($('#BscPassingYear').val() == "" || $('#BscPassingYear').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Bachlor University Passing Year.";
                $('#BscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                $('#BscPassingYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#BscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#BscPassingYear').css({ "background-color": "#ffffff" });

                if ($('#BscTotalMarks').val() == "" || $('#BscTotalMarks').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your Bachlor University OGPA Value.";
                    $('#BscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                    $('#BscTotalMarks').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#BscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#BscTotalMarks').css({ "background-color": "#ffffff" });
                }
            }
        }

        if ($('#BscDivision').val() == "502") {
            if ($('#BscPassingYear').val() == "" || $('#BscPassingYear').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Bachlor University Passing Year.";
                $('#BscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                $('#BscPassingYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#BscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#BscPassingYear').css({ "background-color": "#ffffff" });

                if ($('#BscTotalMarks').val() == "" || $('#BscTotalMarks').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your Bachlor University Total Marks.";
                    $('#BscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                    $('#BscTotalMarks').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#BscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#BscTotalMarks').css({ "background-color": "#ffffff" });

                    if ($('#BscMarksGot').val() == "" || $('#BscMarksGot').val() == null) {
                        text += "<BR>" + " \u002A" + " Please Enter Your Bachlor University Marks Scored.";
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

    if ($('#ddlProgram').val() == "DoctoralProgramme") {
        if ($('#MscName').val() == null || $('#MscName').val() == '') {
            text += "<BR>" + " \u002A" + " Please Enter Your Master's University Name.";
            $('#MscName').attr('style', 'border:1px solid #d03100 !important;');
            $('#MscName').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#MscName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#MscName').css({ "background-color": "#ffffff" });
        }


        if ($('#MscDivision').val() == "0" || $('#MscDivision').val() == "-Select-") {
            text += "<BR>" + " \u002A" + " Please Select Your Master University Grade System.";
            $('#MscDivision').attr('style', 'border:1px solid #d03100 !important;');
            $('#MscDivision').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#MscDivision').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#MscDivision').css({ "background-color": "#ffffff" });

            if ($('#MscDivision').val() == "501") {
                if ($('#MscPassingYear').val() == "" || $('#MscPassingYear').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your Master University Passing Year.";
                    $('#MscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                    $('#MscPassingYear').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#MscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#MscPassingYear').css({ "background-color": "#ffffff" });

                    if ($('#MscTotalMarks').val() == "" || $('#MscTotalMarks').val() == null) {
                        text += "<BR>" + " \u002A" + " Please Enter Your Master University OGPA Value.";
                        $('#MscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                        $('#MscTotalMarks').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#MscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#MscTotalMarks').css({ "background-color": "#ffffff" });
                    }
                }
            }


            if ($('#MscDivision').val() == "502") {
                if ($('#MscPassingYear').val() == "" || $('#MscPassingYear').val() == null) {
                    text += "<BR>" + " \u002A" + " Please Enter Your Master University Passing Year.";
                    $('#MscPassingYear').attr('style', 'border:1px solid #d03100 !important;');
                    $('#MscPassingYear').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#MscPassingYear').attr('style', 'border:1px solid #cdcdcd !important;');
                    $('#MscPassingYear').css({ "background-color": "#ffffff" });

                    if ($('#MscTotalMarks').val() == "" || $('#MscTotalMarks').val() == null) {
                        text += "<BR>" + " \u002A" + " Please Enter Your Master University Total Marks.";
                        $('#MscTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
                        $('#MscTotalMarks').css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                    else {
                        $('#MscTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
                        $('#MscTotalMarks').css({ "background-color": "#ffffff" });

                        if ($('#MscMarksGot').val() == "" || $('#MscMarksGot').val() == null) {
                            text += "<BR>" + " \u002A" + " Please Enter Your Master University Marks Scored.";
                            $('#MscMarksGot').attr('style', 'border:1px solid #d03100 !important;');
                            $('#MscMarksGot').css({ "background-color": "#fff2ee" });
                            opt = 1;
                        }
                        else {
                            $('#MscMarksGot').attr('style', 'border:1px solid #cdcdcd !important;');
                            $('#MscMarksGot').css({ "background-color": "#ffffff" });
                        }
                    }
                }
            }
        }
    }


    if ($("input[name='radio1']:checked").val() == null) {
        text += "<BR>" + " \u002A" + " Please Select Whether a Recepient scored 1st position in 1st class ?";
        $('#Medal').attr('style', 'color:red !important;');
        $('#Medal').css({ "color": "red !important;" });
        opt = 1;
    }
    else {
        $('#Medal').attr('style', 'color:#000000 !important;');
        $('#Medal').css({ "color": "#000000 " });
    }


    if ($("input[name='radio3']:checked").val() == null) {
        text += "<BR>" + " \u002A" + " Please Select Whether You Are Employed or Not?";
        $('#Emp').attr('style', 'color:red !important;');
        $('#Emp').css({ "color": "red !important;" });
        opt = 1;
    }
    else {
        $('#Emp').attr('style', 'color:#000000 !important;');
        $('#Emp').css({ "color": "#000000 " });

        if ($("input[name='radio3']:checked").val() == "Yes") {
            if ($('#txtDesgntnName').val() == "" || $('#txtDesgntnName').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Designation.";
                $('#txtDesgntnName').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtDesgntnName').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtDesgntnName').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtDesgntnName').css({ "background-color": "#ffffff" });
            }

            if ($('#txtEmployerName').val() == "" || $('#txtEmployerName').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Employer Name.";
                $('#txtEmployerName').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtEmployerName').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtEmployerName').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtEmployerName').css({ "background-color": "#ffffff" });
            }

            if ($('#txtEmployerAddrss').val() == "" || $('#txtEmployerAddrss').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Your Employer Address.";
                $('#txtEmployerAddrss').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtEmployerAddrss').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtEmployerAddrss').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtEmployerAddrss').css({ "background-color": "#ffffff" });
            }

            if ($('#EmployerNoc').val() == "-Select-" || $('#EmployerNoc').val() == "0") {
                text += "<BR>" + " \u002A" + " Please Select Do You Have NOC or Not?.";
                $('#EmployerNoc').attr('style', 'border:1px solid #d03100 !important;');
                $('#EmployerNoc').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#EmployerNoc').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#EmployerNoc').css({ "background-color": "#ffffff" });
            }
        }
    }

    if ($('#ddlProgram').val() == "MasterProgramme") {
        if ($("input[name='radio5']:checked").val() == null) {
            text += "<BR>" + " \u002A" + " Please Select Do You Want Any Special Claim?";
            $('#SplClmOpt').attr('style', 'color:red !important;');
            $('#SplClmOpt').css({ "color": "red !important;" });
            opt = 1;
        }

        else {
            $('#SplClmOpt').attr('style', 'color:#000000 !important;');
            $('#SplClmOpt').css({ "color": "#000000 " });

            if ($("input[name='radio5']:checked").val() == "Yes") {
                if ($("input[name='radio6']:checked").val() == null) {
                    text += "<BR>" + " \u002A" + " Please Select Any 1 Claim Option.";
                    $('#SplClmOpt').attr('style', 'color:red !important;');
                    $('#SplClmOpt').css({ "color": "red !important;" });
                    opt = 1;
                }
                else {
                    $('#SplClmOpt').attr('style', 'color:#000000 !important;');
                    $('#SplClmOpt').css({ "color": "#000000 " });
                }
            }
        }
    }

    var Section1_PassOdia = $("input[name='radio4']:checked").val();

    if (Section1_PassOdia == null) {
        text += "<br /> - Please choose, Has the Candidate passed Odia as one of the subject in HSC Examination?";
        $('#isOdia').attr('style', 'color:red !important;');
        $('#isOdia').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#isOdia').attr('style', 'color:#000000 !important;');
        $('#isOdia').css({ "color": "#000000 " });
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

    if (Section1_PassOdia == "Yes") {
        if (Section1_AbililtyRead == 0 || Section1_AbilityWrite == 0 || Section1_AbilitySpeak == 0) {
            //chkAbility
            text += "<br /> - Please choose, Wheather the Candidate has ability to Read, Write and Speak Odia Language. ";
            opt = 1;
            GovtMessage = 1;
            $('#chkAbility').attr('style', 'color:red !important;');
            $('#chkAbility').css({ "color": "red" });
        }
        else {
            $('#chkAbility').attr('style', 'color:#000000 !important;');
            $('#chkAbility').css({ "color": "#000000 " });
        }
    }
    var Residence = $('#ddlResidence option:selected').text();

    if (Section1_PassOdia == "No") {

        if (Residence == '0' || Residence == '--Select Residence Type--') {
            text += "<br /> -Please select Residence Type.";
            $('#ddlResidence').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlResidence').css({ "background-color": "#fff2ee" });
            opt = 1;
            GovtMessage = 1;
        } else {
            $('#ddlResidence').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlResidence').css({ "background-color": "#ffffff" });
        }

    }

    var Section1_AbilitySpeak = 0;
    if ($('#spkOdiya').is(":checked")) {
        // it is checked
        Section1_AbilitySpeak = 1;
    }

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
        if (!$("#chkPhysical").is(":checked")) {
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



function PinCodeValidation(PinCode) {
    var PinCodeVal = $("[id*=" + PinCode + "]").val();
    if (PinCodeVal.length >= 6) {
        $("[id*=" + PinCode + "]").attr('style', 'border:2px solid green !important;');
        $("[id*=" + PinCode + "]").css({ "background-color": "#ffffff" });
        return true;
    }
    else {
        alertPopup("Pincode Validation", "<BR>" + " \u002A" + " Please Enter 6 Digit Pincode.");
        $("[id*=" + PinCode + "]").val('');
        $("[id*=" + PinCode + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + PinCode + "]").css({ "background-color": "#fff2ee" });
        return false;
    }
}


function MobileValidation(MobileNo) {
    var MobileVal = $("[id*=" + MobileNo + "]").val();
    var text = "";
    var opt = "";

    if (isNaN(MobileVal) || MobileVal.indexOf(" ") != -1) {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Mobile Number.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (MobileVal.length > 10 || MobileVal.length < 10) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Be Atleast 10 Digit.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (!(MobileVal.charAt(0) == "9" || MobileVal.charAt(0) == "8" || MobileVal.charAt(0) == "7")) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 9 ,8 or 7.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("[id*=" + MobileNo + "]").attr('style', 'border:2px solid green !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#ffffff" });
        return true;
    }

    if (opt == "1") {
        alertPopup("Mobile Information.", text);
        $("[id*=" + MobileNo + "]").val("");
        return false;
    }
}


function GetOUATCollege() {
    var SelCollege = $('#ddlProgram').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATCollege',
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
}


function GetOUATDegree() {
    var SelPrograme = $('#ddlCollege').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATDegree',
        data: '{"SelPrograme":"' + SelPrograme + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlDegree").empty();
            $("#ddlDegree").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlDegree").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetOUATSubject() {
    var SubjectId = $('#ddlDegree').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATSubject',
        data: '{"SubjectId":"' + SubjectId + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlSubject").empty();
            $("#ddlSubject").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlSubject").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
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

    return false;
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


function fnValidateOUATOTP() {
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
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/ValidateOUATPhdOTP',
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
        //alert("Basic detail saved from Aadhaar.");
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
            alert('Mobile No. ' + $('#txtMobile').val() + ' already registered for OUAT DOCTORAL/MASTERS PROGRAMME 2017-18.' + '\n' + 'Please Login to check the details.')
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
                alert("Aadhaar Number " + $('#UID').val() + ' Already Registered for OUAT DOCTORAL/MASTERS PROGRAMME 2017-18.' + '\n' + 'Please Login To Check The Details.')
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

    var t_Message = "";
    var result = false;

    var DOB = $("#DOB");

    if (DOB.val() != '') {

        var txtDOB = DOB.val();
        var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
        var Age = calcExSerDur(txtDOB, '31/12/2017');
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

                var Age = calcExSerDur(newDate, '31/12/2017');
                ageToCompare = Age.years;
                ExSrvDay = durn.days;
                ExSrvMonth = durn.months;
                ExSrvYear = durn.years;
            }

            var AgeForRenderService = calcExSerDur(txtDOB, startDate);
        }

        if (ageToCompare < minAge) {
            ageToCompare = ageActual;
        }
        if (ageToCompare < minAge) {
            if ($("input[name='radio3']:checked").val() == 'No') {
                text += "<BR>" + " \u002A" + " Applicant age should be 18 years and above. ";
                opt = 1;
            }
        } else if (ageToCompare > maxAge) {
            check = true;
            if (check) {
                text += "<BR>" + " \u002A" + " Applicant age should be less than " + maxAge + " years. ";
                opt = 1;
            }
        }
        else if (ageToCompare == maxAge) {
            var monthdiff = $('#Month').val() - ExSrvMonth;
            if (monthdiff > 0) {
                check = true;

                if (check) {
                    text += "<BR>" + " \u002A" + " Applicant age should be less than " + maxAge + " years. ";
                    opt = 1;
                }
            }
            else {
                if ($('#Month').val() == ExSrvMonth) {
                    if (($('#Day').val() - ExSrvDay) > 0) {
                        check = true;

                        if (check) {
                            text += "<BR>" + " \u002A" + " Applicant age should be less than " + maxAge + " years. ";
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
                    text += "<BR>" + " \u002A" + " Applicant age should be less than " + maxAge + " years. ";
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
    }

    var temp = "Gunwant";
    var AppID = "";

    var rtnurl = "";

    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var ReadOdiyaLang = 'No';
    if ($('#readOdiya').is(":checked")) {
        ReadOdiyaLang = 'Yes';
    }

    var WriteOdiyaLang = 'No';
    if ($('#writeOdiya').is(":checked")) {
        WriteOdiyaLang = 'Yes';
    }

    var SpeakOdiyaLang = 'No';
    if ($('#spkOdiya').is(":checked")) {
        SpeakOdiyaLang = 'Yes';
    }

    var ResponseType = "C";

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var Physicallyhandicaped = 0;
    if ($('#CheckBoxList1_0').is(":checked")) {
        // it is checked
        Physicallyhandicaped = 1;
    }

    var NRISponsership = 0;
    if ($('#CheckBoxList1_1').is(":checked")) {
        // it is checked
        NRISponsership = 1;
    }

    var OtherState = 0;
    if ($('#CheckBoxList1_2').is(":checked")) {
        // it is checked
        OtherState = 1;
    }

    var HortiCulture = 0;
    if ($('#CheckBoxList1_3').is(":checked")) {
        // it is checked
        HortiCulture = 1;
    }

    var datavar = {

        'aadhaarNumber': $('#UID').val(),
        'AadhaarDetail': $('#ddlSearch').val(),
        'AppMobileNo': $('#txtMobile').val(),

        'OUATCourse': $('#ddlProgram option:selected').text(),
        'CollegeName': $('#ddlCollege option:selected').text(),
        'DegreeName': $('#ddlDegree option:selected').text(),
        'SubjectName': $('#ddlSubject option:selected').text(),

        'ICARYesNo': $("input[name='PGApp']:checked").val(),
        'ICARCollegeName' : $('#ddlICARCollege option:selected').text(), 

        'CandidateName': $('#FirstName').val(),
        'FatherName': $('#FatherName').val(),
        'MotherName': $('#MotherName').val(),
        'DOB': DOBConverted,
        'Year': $('#Year').val(),
        'Month': $('#Month').val(),
        'Day': $('#Day').val(),
        'Gender': $('#ddlGender').val(),
        'Religion': $('#religion').val(),
        'Category': $('#Category option:selected').text(),
        'MaritalStatus': $('#MaritalStatus').val(),
        'MotherTongue': $('#MotherTongue').val(),
        'Nationality': $('#Nationality').val(),
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

        'ImageSign': $('#HFb64Sign').val(),
        'Image': $('#HFb64').val(),
        'JSONData': '',

        'HscName': $('#HscName').val(),
        'HscTotalMarks': $('#HscTotalMarks').val(),
        'HscMarksGot': $('#HscMarksGot').val(),
        'HscPercentage': $('#HscPercentage').val(),
        'HscDivision': $('#HscDivision').val(),
        'HscPassingYear': $('#HscPassingYear').val(),
        'SscName': $('#SscName').val(),
        'SscTotalMarks': $('#SscTotalMarks').val(),
        'SscMarksGot': $('#SscMarksGot').val(),
        'SscPercentage': $('#SscPercentage').val(),
        'SscDivision': $('#SscDivision').val(),
        'SscPassingYear': $('#SscPassingYear').val(),
        'BscName': $('#BscName').val(),
        'BscTotalMarks': $('#BscTotalMarks').val(),
        'BscMarksGot': $('#BscMarksGot').val(),
        'BscPercentage': $('#BscPercentage').val(),
        'BscDivision': $('#BscDivision').val(),
        'BscPassingYear': $('#BscPassingYear').val(),
        'MscName': $('#MscName').val(),
        'MscTotalMarks': $('#MscTotalMarks').val(),
        'MscMarksGot': $('#MscMarksGot').val(),
        'MscPercentage': $('#MscPercentage').val(),
        'MscDivision': $('#MscDivision').val(),
        'MscPassingYear': $('#MscPassingYear').val(),

        'Section1_RecievedAnyGoldmadel': $("input[name='radio1']:checked").val(),
        'Section1_DocumentDescribe': $('#txtDocType').val(),
        'Section2_SpecialClaim': $("input[name='radio5']:checked").val(),
        'Section2_DescribeSpecialClaim': $("input[name='radio6']:checked").val(),
        'Section2_Sports': $('#ddlSportsOpt option:selected').text(),
        'Section2_Nss': $('#ddlNSSOpt option:selected').text(),
        'Section3_AreYouEmployed': $("input[name='radio3']:checked").val(),
        'Section3_Dsignation': $('#txtDesgntnName').val(),
        'Section3_EmployerName': $('#txtEmployerName').val(),
        'Section3_EmployerAddress': $('#txtEmployerAddrss').val(),
        'Section3_CerifiedFurnished': $('#EmployerNoc').val(),

        'BankName': $('#txtBankName').val(),
        'ChalanNumber': $('#txtChalanNumber').val(),
        'IssuedDate': $('#txtIssueDate').val(),
        'Branch': $('#txtBankBranch').val(),

        'OdiaLang': $("input[name='radio4']:checked").val(),
        'ReadOdia': ReadOdiyaLang,
        'WriteOdia': WriteOdiyaLang,
        'SpeakOdia': SpeakOdiyaLang,
        'ResidenceType': $('#ddlResidence option:selected').text(),

        'ResponseType': ResponseType,

        'ReservationQuota': $("input[name='ReservedQuota']:checked").val(),
        'PhysicallyChallenged': Physicallyhandicaped,
        'HandicapType': $("input[name='HandicapType']:checked").val(),
        'HandicappedPart': $('#txtHandicappedPart').val(),
        'HandicappedPercent': $('#txtHandiPercent').val(),
        'NRISponsership': NRISponsership,
        'OtherState': OtherState,
        'OtherStateName': $('#ddlOtherState option:selected').text(),
        'Horticulture': HortiCulture,

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
            url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/InsertData',
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
            if (AppID == "" || AppID == null) {
                alertPopup("Form Validation Failed", "Error While Saving Application.!!!, <BR> Either You Have MobileNumber or AadhaarNumber Which Has Been Used Earlier!!!");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                return;
            }
            else {
                if (result /*&& jqXHRData_IMG_result*/) {
                    $("#progressbar").hide();
                    alertPopup("Addmission Into OUAT", "Application saved successfully. Reference ID : " + obj.AppID + " Please Make Payment against the Application Number.");
                    window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=419&AppID=' + obj.AppID;
                    window.location.href = '/WebApp/Kiosk/OUAT/OUATPGProcessbar.aspx?SvcID=419&AppID=' + obj.AppID;
                }
                else {
                    $("#progressbar").hide();
                    alertPopup("Form Validation Failed", "Unable to save Applicatin, Please refresh the browser and try again");
                }
            }

        });// end of Then function of main Data Insert Function

    return false;
}


function fnReservationQuota() {
    if (CheckBoxList1_0.checked) {
        $('#divPH').show(500);
        $('#txtHandicappedPart').val("");
        $('#txtHandiPercent').val("");

    } else {
        $('#divPH').hide(500);
        $('#txtHandicappedPart').val("");
        $('#txtHandiPercent').val("");
    }

    if (CheckBoxList1_1.checked) { $('#divNRI').show(800); } else { $('#divNRI').hide(800); }

    if (CheckBoxList1_2.checked) { $('#divWO').show(800); } else { $('#divWO').hide(800); }

    //if (CheckBoxList1_3.checked) { $('#divHoriculture').show(800); } else { $('#divHoriculture').hide(800); }
}

function hidedive() {
    var reserved = $("input[name='reserved']:checked").val();

    if (reserved == "no") {
        $("#CheckBoxList1_0").prop('checked', false);
        $("#CheckBoxList1_1").prop('checked', false);
        $("#CheckBoxList1_2").prop('checked', false);
        $("#CheckBoxList1_3").prop('checked', false);
        $("#CheckBoxList1_4").prop('checked', false);
        $("#CheckBoxList1_5").prop('checked', false);
        $('#divReserved').hide();
        $('#divEmplyeeCase').hide();
        $('#divNRI').hide();
        $('#divAgro').hide();
        $('#divResevation').hide();
        $("#divMarks").hide();
        $("#divGCH").hide();
        $("#divWO").hide();
        $("#divPH").hide();
        $("#divKM").hide();
    }
}



//function PermanentPinCode() {
//    text = "";
//    opt = "";
//    var PinCode = $('#PPinCode').val();
//    var state = $('#PddlState').val();
//    if (state == 21) {
//        var pinmatch = /^[7]\d{5}$/;
//        if (!pinmatch.test(PinCode)) {
//            text += "<BR>" + " \u002A" + " Please enter valid PinCode, starting with 7";
//            $('#PPinCode').val("");
//            $("#PPinCode").attr('style', 'border:1px solid #d03100 !important;');
//            $("#PPinCode").css({ "background-color": "#fff2ee" });
//            opt = 1;
//        }
//        else {
//            $("#PPinCode").attr('style', 'border:1px solid #cdcdcd !important;');
//            $("#PPinCode").css({ "background-color": "#ffffff" });
//        }
//    }
//    if (opt == "1") {
//        alertPopup("Please fill following information.", text);
//        return false;
//    }
//    return true;
//}


//function ValidateMobile() {
//    if (MobileNo.val() != '') {
//        var mobmatch1 = /^[789]\d{9}$/;
//        if (!mobmatch1.test(MobileNo.val())) {
//            text += "<BR>" + " \u002A" + " Please enter valid mobile Number.";
//            MobileNo.attr('style', 'border:1px solid #d03100 !important;');
//            MobileNo.css({ "background-color": "#fff2ee" });
//            opt = 1;
//        } else {
//            MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
//            MobileNo.css({ "background-color": "#ffffff" });
//        }
//    }
//}


//var pinmatch = /^[0-9]\d{5}$/;
//if (Pincode != null && Pincode.val() != '') {
//    if (!pinmatch.test(Pincode.val())) {
//        text += "<BR>" + " \u002A" + " Please enter valid pincode.";
//        $('#CPinCode').attr('style', 'border:1px solid #d03100 !important;');
//        $('#CPinCode').css({ "background-color": "#fff2ee" });
//        opt = 1;
//    } else {
//        $('#CPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
//        $('#CPinCode').css({ "background-color": "#ffffff" });
//    }
//}


//function CalculateHscPercentage() {
//    debugger;
//    var TotalMarks = $('#HscTotalMarks').val();
//    var MarksObtained = $('#HscMarksGot').val();

//    if (TotalMarks == "") return;
//    if (MarksObtained == "") return;

//    if (TotalMarks < MarksObtained) {
//        alert("Total Marks Must Be Greater Than Marks Obtained");
//        $('#HscMarksGot').val("");
//        $("#HscPercentage").val("");
//        return;
//    }
//    if (TotalMarks <= 0) TotalMarks = 1;
//    var result = (MarksObtained / TotalMarks) * 100;
//    $("#HscPercentage").val(result.toFixed(2) + ' %');
//}


//function CalculateSscPercentage() {

//    var TotalMarks = $('#SscTotalMarks').val();
//    var MarksObtained = $('#SscMarksGot').val();

//    if (TotalMarks == "") return;
//    if (MarksObtained == "") return;

//    if (TotalMarks < MarksObtained) {
//        alert("Total Marks Must Be Greater Than Marks Obtained");
//        $('#SscMarksGot').val("");
//        $("#SscPercentage").val("");
//        return;
//    }
//    if (TotalMarks <= 0) TotalMarks = 1;
//    var result = (MarksObtained / TotalMarks) * 100;
//    $("#SscPercentage").val(result.toFixed(2) + ' %');
//}


//function CalculateBscPercentage() {

//    var TotalMarks = $('#BscTotalMarks').val();
//    var MarksObtained = $('#BscMarksGot').val();

//    if (TotalMarks == "") return;
//    if (MarksObtained == "") return;

//    if (TotalMarks < MarksObtained) {
//        alert("Total Marks Must Be Greater Than Marks Obtained");
//        $('#BscMarksGot').val("");
//        $("#BscPercentage").val("");
//        return;
//    }
//    if (TotalMarks <= 0) TotalMarks = 1;
//    var result = (MarksObtained / TotalMarks) * 100;
//    $("#BscPercentage").val(result.toFixed(2) + ' %');
//}


//function CalculateMscPercentage() {

//    var TotalMarks = $('#MscTotalMarks').val();
//    var MarksObtained = $('#MscMarksGot').val();

//    if (TotalMarks == "") return;
//    if (MarksObtained == "") return;

//    if (TotalMarks < MarksObtained) {
//        alert("Total Marks Must Be Greater Than Marks Obtained");
//        $('#MscMarksGot').val("");
//        $("#MscPercentage").val("");
//        return;
//    }
//    if (TotalMarks <= 0) TotalMarks = 1;
//    var result = (MarksObtained / TotalMarks) * 100;
//    $("#MscPercentage").val(result.toFixed(2) + ' %');
//}



//function MarksPercentage(mObtained, mTotal) {
//    debugger;
//    var Obtained = $('[id=' + mObtained + ']').val();
//    var Total = $('[id=' + mTotal + ']').val();

//    if ($('#ddlProgram').val() == "MasterProgramme") {
//        if ($('#Category').val() == "GN") {
//            var result = (Obtained / Total) * 100;
//            if (result < 60.00) {
//                alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 60.00 %");
//                $('[id=' + mObtained + ']').val("");
//            }
//        }

//        if ($('#Category').val() != "GN" || $('#Category').val() != "0") {
//            var result = (Obtained / Total) * 100;
//            if (result < 50.00) {
//                alertPopup("Percentage Of Marks Validation", "<BR> Percentage Of Marks Should Be Greater Than or Equal To 50.00 %");
//                $('[id=' + mObtained + ']').val("");
//            }
//        }
//    }
//}


//function NOCValidation() {
//    var EmpCheck = $("input[name='radio3']:checked").val();
//    var NocCheck = $('#EmployerNoc').val();

//    if (EmpCheck == "Yes") {
//        if (NocCheck == "No") {
//            alert('As you are Employed and you have not furnished your NOC.' + '\n' + 'Hence, you are not able to proceed further. Thank You!!!')
//            rtnurl = "/Account/Login";
//            window.location.href = rtnurl;
//        }
//    }
//}