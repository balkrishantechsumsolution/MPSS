
$(document).ready(function () {

    $("#load").hide();
    $('#ncccrtfcte').hide();
    $('#KMigrantDetail').hide();
    $('#HavingMBDDegree').hide();
    $('#PhysHandicapDtl').hide();
    $('#ParentExDefenceDtl').hide();
    $('#PlayedTournamentDtl').hide();
    $('#HvngCertificateNCCDtl').hide();
    $("#DivBSCTab").hide(800);
    $('#btnSubmit').prop('disabled', true);

    /*--------------------Hide conditional div for graduation marks------------------------*/
    $('#GrdDivHons1').hide();
    $('#GrdDivHons2').hide();
    $('#GrdDivPass1').hide();
    $('#GrdDivPass2').hide();
    $('#LLBDiv5Yrs1').hide();
    $('#LLBDiv5Yrs2').hide();
    $('#LLBDiv3YrsCourse').hide();
    $('#LLBDiv3YrsDivision').hide();
    $('#LLBDiv3YrsHons1').hide();
    $('#LLBDiv3YrsHons2').hide();
    $('#LLBDiv3YrsPass1').hide();
    $('#LLBDiv3YrsPass2').hide();
    $('#MBADivMark').hide();
    $('#MBADivMarkSecure').hide();
    $('#MBADivMATScore').hide();
    $('#WorkExp_MBA').hide();
    $('#DivMTech_GraduateDivision').hide();
    $('#DivMTech_MscDivision').hide();
    $('#DivMTech_BTechDivision').hide();
    $('#DivBEBTechBscTotalMark').hide();
    $('#DivBEBTechBscMarkSecure').hide();
    $('#DivHonsDivision').hide();
    $('#DivPassDivision').hide();
    $('#DivMTech_PG_RSAndGIS').hide();
    $('#MsgInfo').hide();
    /*-------------End Here------------------*/
 
    GetOUATState();
    GetOUATState2();

    
    $('#DOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        onSelect: function (date) {
            var Age = calcDobAge(date);
            var Age = calcExSerDur(date, '31/12/2018');
            $('#Age').val(Age.years);
            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);

            if (parseInt(Age.years) < 20) {
                $('#DOB').val('');
                alertPopup("Age Validation", "Min. age 20 years allowed as on 31/12/2018");

            }
        }
    });

    $('#btnSubmit').bind('click', function () {
        SubmitData();
    });
    //Permanent Address
    $('#PddlState').bind('change',function () {
        GetOUATDistrict();
    });

    $('#PddlDistrict').change(function () {
        GetOUATBlock();
    });

    $('#PddlTaluka').change(function () {
        GetOUATPanchayat();
    });
    //Current Address
    $('#CddlState').bind('change', function () {
        GetOUATDistrict2();
    });

    $('#CddlDistrict').change(function () {
        GetOUATBlock2();
    });

    $('#CddlTaluka').change(function () {        
        GetOUATPanchayat2();
    });

    $('#ddlDepartment').bind("change", function () {
        //QualifyingCourse();
        $("#ddlCourseType").val("0");
        $("#ddlProgram").val("0");
        $('#ddlApplyFor').val('0');
    });

    $("#ddlApplyFor").bind("change", function () {
        ApplyingForOnChange();
    });

    $("#ddlProgram").bind("change", function () {
        GetSU_EligibilityCriterea();
        QualifyingCourse();
        ApplyingForOnChange();
        //ApplyingForOnChange();
    });
    

    /*----------LLB Course------------*/
    $('#ddlLLM3YrsCourse').bind("change", function () {
        var SelectedVal = $('#ddlLLM3YrsCourse').val();

        $('#ddlLLBHonsDivision').val("0");
        $('#txtLLBHonsTotalMark').val("");
        $('#txtLLBHonsMarksSecured').val("");
        $('#txtLLBPassTotalMark').val("");
        $('#txtLLBPassMarksSecured').val("");

        if (SelectedVal == "Honours graduate with LLB") {
            $('#LLBDiv3YrsDivision').show();
            $('#LLBDiv3YrsHons1').show();
            $('#LLBDiv3YrsHons2').show();
            $('#LLBDiv3YrsPass1').hide();
            $('#LLBDiv3YrsPass2').hide();
            $('#GrdDivPass1').hide();
            $('#GrdDivPass2').hide();
        }
        else if (SelectedVal == "Pass Graduate/Equivalent with LLB") {
            $('#LLBDiv3YrsDivision').hide();
            $('#LLBDiv3YrsHons1').hide();
            $('#LLBDiv3YrsHons2').hide();
            $('#LLBDiv3YrsPass1').show();
            $('#LLBDiv3YrsPass2').show();
            $('#GrdDivPass1').show();
            $('#GrdDivPass2').show();
        }
        else {
            $('#LLBDiv3YrsDivision').hide();
            $('#LLBDiv3YrsHons1').hide();
            $('#LLBDiv3YrsHons2').hide();
            $('#LLBDiv3YrsPass1').hide();
            $('#LLBDiv3YrsPass2').hide();
            $('#GrdDivPass1').hide();
            $('#GrdDivPass2').hide();
        }


    });
    //MBA Work Exp. Validate for min 2 years
    $("#txtWorkExp_MBA").bind("change", function () {
        var Exp = $("#txtWorkExp_MBA").val();
        if (parseInt(Exp) < 2)
        {
            $("#txtWorkExp_MBA").val("");
            alertPopup("Work Experience Validation", "Work experience min. 2 year allowed.");
        }
    });

    GetSUDepartment();
   
    EL("File1").addEventListener("change", readFile, false);
    EL("File2").addEventListener("change", readFile2, false);
   
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

    //-------HSC Calculation Logic
    $('#txtTotalMarks').change(function () {
        CalculateHscPercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtMarkSecure').change(function () {
        CalculateHscPercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });
    //----END HERE

    //-------SSC Calculation Logic
    $('#txtTotalMarks2').change(function () {
        CalculateSscPercentage($('#txtTotalMarks2').val(), $('#txtMarkSecure2').val());
    });

    $('#txtMarkSecure2').change(function () {
        CalculateSscPercentage($('#txtTotalMarks2').val(), $('#txtMarkSecure2').val());
    });
    //----END HERE

    $('#BscTotalMarks').change(function () {
        CalculateBscPercentage($('#BscTotalMarks').val(), $('#BscMarksGot').val());
    });

    $('#BscMarksGot').change(function () {
        CalculateBscPercentage($('#BscTotalMarks').val(), $('#BscMarksGot').val());
    });

    $('#MscMarksGot').change(function () {
        CalculateMscPercentage($('#MscTotalMarks').val(), $('#MscMarksGot').val());
    });

    
    $("input[name='RadioBSC']").bind("change", function () {
        var RadioBSC = $("input[name='RadioBSC']:checked").val();
        if (RadioBSC == "Yes") {
            $("#DivBSCTab").show(800); 
            $("#DivSection10").show(800);
            $("input[name='radio13'][value='no']").prop("checked", false);
        }
        else {
            $("#DivBSCTab").hide(800);
            $("#DivSection10").hide();
            $("input[name='radio13'][value='no']").prop("checked", true);
        }
    });
    
    $("#ddlPctgeCalclte").bind("change", function () {
        if ($("#ddlPctgeCalclte").val() == "501") {
            $("#lblTotalMarks").text("CGPA Secured");
            $("#txtMarkSecure").prop("disabled", true);
        }
        else {
             $("#lblTotalMarks").text("Total Marks");
            $("#txtMarkSecure").prop("disabled", false);
        }
    });

    $("#DisabilityPercent").bind("change", function () {
        var percent = $("#DisabilityPercent").val();
        if (percent < 40)
        {
            alertPopup("Physical Candidate Category Validation", "PH category percentage can not be less than 40 % !");
            $("#DisabilityPercent").val("");
        }
    });
    
});
//global AppID variable
var AppID = "";
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



function CalculateHscPercentage(TotalMarks, MarksObtained) {
    debugger;
    if (TotalMarks == "") return;
    var result = 0;

    //var category = $('#Category').val();
    //var ReservQta = $("input[name='ReservedQuota']:checked").val();

    //var Physicallyhandicaped = 0;
    //if ($('#CheckBoxList1_0').is(":checked")) {
    //    Physicallyhandicaped = 1;
    //}

    //if (ReservQta == "Yes" && Physicallyhandicaped == 1) {
    //    category = "SC";
    //}

    if ($("#ddlPctgeCalclte").val() == "501") { //501--CGPA,502--Percentage
        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.25) {
            alert("CGPA cannot be less than 3.25");
            $('#txtTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid CGPA");
            $('#txtTotalMarks').val("");
            return;
        }
        result = ((TotalMarks) * 9.5).toFixed(2);

    }
    else if ($("#ddlPctgeCalclte").val() == "502") {

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
    else if ($("#ddlPctgeCalclte").val() == "0") {
        alert("Please select grade system !");
        $('#txtTotalMarks').val("");
        $('#txtMarkSecure').val("");
        $("#txtPercentage").val("");
        return
    }

    $("#txtPercentage").val(result + ' %');
}


function CalculateSscPercentage(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;
    var result = 0;

    //var category = $('#Category').val();
    //var ReservQta = $("input[name='ReservedQuota']:checked").val();

    //var Physicallyhandicaped = 0;
    //if ($('#CheckBoxList1_0').is(":checked")) {
    //    Physicallyhandicaped = 1;
    //}

    //if (ReservQta == "Yes" && Physicallyhandicaped == 1) {
    //    category = "SC";
    //}

    if ($("#ddlPctgeCalclte2").val() == "501") {
        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("OGPA cannot be less than 3.5");
            $('#txtTotalMarks2').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid OGPA");
            $('#txtTotalMarks2').val("");
            return;
        }
        result = ((TotalMarks) * 9.5).toFixed(2);

    }
    else {

        if (MarksObtained == "") return;
        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#txtTotalMarks2').val("");
            $('#txtMarkSecure2').val("");
            $("#txtPercentage2").val("");
            return;
        }
        if (TotalMarks <= 0) TotalMarks = 1;
        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);
    }
    $("#txtPercentage2").val(result + ' %');
}

function CalculateBscPercentage(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;
    var result = 0;

    //var category = $('#Category').val();
    //var ReservQta = $("input[name='ReservedQuota']:checked").val();

    //var Physicallyhandicaped = 0;
    //if ($('#CheckBoxList1_0').is(":checked")) {
    //    Physicallyhandicaped = 1;
    //}

    //if (ReservQta == "Yes" && Physicallyhandicaped == 1) {
    //    category = "SC";
    //}


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
    
    var FirstName = $("#AppcntFullName");
    var FatherName = $("#AppcntFatherName");
    var MotherName = $("#AppcntMotherName");
    var FatherOccupation = $("#FatherOccupation");
    var MotherOccupation = $("#MotherOccupation");
    var GuardianName = $("#GuardianName");
    var GuardianOccupation = $("#GuardianOccupation");
    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Category = $('#category').val();
    var Religion = $("#religion").val();
    var Nationality = $("#nationality option:selected").text();
    var Gender = $("#ddlGender option:selected").text();
    var Tongue = $("#ddlTongue").val();
    var MaritalStatus = $('#ddlMaritalStatus').val();
    var AadhaarNo = $('#AadhaarNo').val();
    var UniversityRegNo = $('#UniversityRegNo').val();
    var Subject = $('#ddlSubject').val();


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

    if ($("#ddlProgram").val() == "" || $("#ddlProgram").val() == '-Select-' || $("#ddlProgram").val() == "0") {
        text += "<BR>" + " \u002A" + " Please Select Name Of The Subject.";
        $("#ddlProgram").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlProgram").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlProgram").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlProgram").css({ "background-color": "#ffffff" });
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
    if (FatherOccupation.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Father Occupation. ";
        FatherOccupation.attr('style', 'border:1px solid #d03100 !important;');
        FatherOccupation.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FatherOccupation.attr('style', 'border:1px solid #cdcdcd !important;');
        FatherOccupation.css({ "background-color": "#ffffff" });
    }

    if (MotherOccupation.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mother Occupation. ";
        MotherOccupation.attr('style', 'border:1px solid #d03100 !important;');
        MotherOccupation.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        MotherOccupation.attr('style', 'border:1px solid #cdcdcd !important;');
        MotherOccupation.css({ "background-color": "#ffffff" });
    }

    //if (GuardianName.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Guardian Name. ";
    //    GuardianName.attr('style', 'border:1px solid #d03100 !important;');
    //    GuardianName.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    GuardianName.attr('style', 'border:1px solid #cdcdcd !important;');
    //    GuardianName.css({ "background-color": "#ffffff" });
    //}
    
    //if (GuardianOccupation.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Guardian Occupation. ";
    //    GuardianOccupation.attr('style', 'border:1px solid #d03100 !important;');
    //    GuardianOccupation.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    GuardianOccupation.attr('style', 'border:1px solid #cdcdcd !important;');
    //    GuardianOccupation.css({ "background-color": "#ffffff" });
    //}
    
    if (DOB.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
        DOB.attr('style', 'border:1px solid #d03100 !important;');
        DOB.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }

    if (Gender == '' || Gender == '-Select-' || Gender == "0") {
        text += "<BR>" + " \u002A" + " Please Select Gender. ";
        $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlGender").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlGender").css({ "background-color": "#ffffff" });
    }

    if (Religion == '' || Religion == '-Select-' || Religion == "0") {
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
        $("#category").attr('style', 'border:1px solid #d03100 !important;');
        $("#category").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#category").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#category").css({ "background-color": "#ffffff" });
    }

    if (($("#ddlMaritalStatus").val() == '' || $("#ddlMaritalStatus").val() == '-Select-' || $("#ddlMaritalStatus").val() == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Your Marital Status";
        $("#ddlMaritalStatus").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlMaritalStatus").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlMaritalStatus").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlMaritalStatus").css({ "background-color": "#ffffff" });
    }

    if ((Tongue == '' || Tongue == '-Select-' || Tongue == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Mother Tongue ";
        $("#ddlTongue").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlTongue").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlTongue").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlTongue").css({ "background-color": "#ffffff" });
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


    //if (RoadStreetName != null && RoadStreetName.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Road /Street Name in Present Address. ";
    //    RoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
    //    RoadStreetName.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    RoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
    //    RoadStreetName.css({ "background-color": "#ffffff" });
    //}


    //if (Locality != null && Locality.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Locality in Present Address. ";
    //    Locality.attr('style', 'border:1px solid #d03100 !important;');
    //    Locality.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    Locality.attr('style', 'border:1px solid #cdcdcd !important;');
    //    Locality.css({ "background-color": "#ffffff" });
    //}


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

    //if (PreRoadStreetName != null && PreRoadStreetName.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Care of Address in Present Address. ";
    //    PreRoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
    //    PreRoadStreetName.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    PreRoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
    //    PreRoadStreetName.css({ "background-color": "#ffffff" });
    //}

    //if (PreLocality != null && PreLocality.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Locality in Present Address. ";
    //    PreLocality.attr('style', 'border:1px solid #d03100 !important;');
    //    PreLocality.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    PreLocality.attr('style', 'border:1px solid #cdcdcd !important;');
    //    PreLocality.css({ "background-color": "#ffffff" });
    //}
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

    //-----HSC Marks Validation
    var HSCBoard = $('#ddlBoard').val();
    var HSCExamName = $('#txtExmntnName');
    var HSCRollNo = $('#txtRoll10');
    var HSCPassYear = $('#txtPssngYr').val();
    var HSCPassType = $('#ddlPasstype').val();
    var HSCGradSystem = $('#ddlPctgeCalclte').val();
    var HSCTotalMark = $('#txtTotalMarks');
    var HSCTotalSecured = $('#txtMarkSecure');
    var HSCPercentage = $('#txtPercentage');

    if (HSCBoard == '' || HSCBoard == '-Select-' || HSCBoard == "0") {
        text += "<BR>" + " \u002A" + " Please Select HSC board ";
        $("#ddlBoard").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlBoard").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlBoard").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlBoard").css({ "background-color": "#ffffff" });
    }

    if (HSCExamName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter HSC name of examination passed. ";
        HSCExamName.attr('style', 'border:1px solid #d03100 !important;');
        HSCExamName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        HSCExamName.attr('style', 'border:1px solid #cdcdcd !important;');
        HSCExamName.css({ "background-color": "#ffffff" });
    }

    if (HSCRollNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter HSC roll number. ";
        HSCRollNo.attr('style', 'border:1px solid #d03100 !important;');
        HSCRollNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        HSCRollNo.attr('style', 'border:1px solid #cdcdcd !important;');
        HSCRollNo.css({ "background-color": "#ffffff" });
    }

    if (HSCPassYear == '' || HSCPassYear == '-Select-' || HSCPassYear == "0") {
        text += "<BR>" + " \u002A" + " Please Select HSC passing year ";
        $("#txtPssngYr").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtPssngYr").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtPssngYr").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtPssngYr").css({ "background-color": "#ffffff" });
    }

    if ((HSCPassType == '' || HSCPassType == '-Select-' || HSCPassType == "0")) {
        text += "<BR>" + " \u002A" + " Please Select HSC exam cleared ";
        $("#ddlPasstype").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlPasstype").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlPasstype").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlPasstype").css({ "background-color": "#ffffff" });
    }

    if ((HSCGradSystem == '' || HSCGradSystem == '-Select-' || HSCGradSystem == "0")) {
        text += "<BR>" + " \u002A" + " Please Select HSC exam grad system ";
        $("#ddlPctgeCalclte").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlPctgeCalclte").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlPctgeCalclte").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlPctgeCalclte").css({ "background-color": "#ffffff" });
    }
    
    if (HSCTotalMark.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter HSC total marks. ";
        HSCTotalMark.attr('style', 'border:1px solid #d03100 !important;');
        HSCTotalMark.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        HSCTotalMark.attr('style', 'border:1px solid #cdcdcd !important;');
        HSCTotalMark.css({ "background-color": "#ffffff" });
    }
    if ($("#ddlPctgeCalclte").val() == "502") {

        if (HSCTotalSecured.val() == '') {
            text += "<BR>" + " \u002A" + " Please enter HSC marks secured. ";
            HSCTotalSecured.attr('style', 'border:1px solid #d03100 !important;');
            HSCTotalSecured.css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            HSCTotalSecured.attr('style', 'border:1px solid #cdcdcd !important;');
            HSCTotalSecured.css({ "background-color": "#ffffff" });
        }
    }
    if (HSCPercentage.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter HSC percentage. ";
        HSCPercentage.attr('style', 'border:1px solid #d03100 !important;');
        HSCPercentage.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        HSCPercentage.attr('style', 'border:1px solid #cdcdcd !important;');
        HSCPercentage.css({ "background-color": "#ffffff" });
    }

    //----------SSC Marks Validation
    var SSCBoard = $('#SSCddlBoard').val();
    var SSCExamName = $('#txtExmntnName2');
    var SSCRollNo = $('#txtBoardRollNo2');
    var SSCPassYear = $('#txtPssngYr2').val();
    var SSCGradSystem = $('#ddlPctgeCalclte2').val();
    var SSCTotalMark = $('#txtTotalMarks2');
    var SSCTotalSecured = $('#txtMarkSecure2');
    var ddlSSCDivision=$('#ddlSSCDivision').val();

    if (SSCBoard == 'Select' || SSCBoard == '-Select-' || SSCBoard == "0") {
        text += "<BR>" + " \u002A" + " Please Select SSC board ";
        $("#SSCddlBoard").attr('style', 'border:1px solid #d03100 !important;');
        $("#SSCddlBoard").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#SSCddlBoard").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#SSCddlBoard").css({ "background-color": "#ffffff" });
    }

    if (SSCExamName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter SSC name of examination passed. ";
        SSCExamName.attr('style', 'border:1px solid #d03100 !important;');
        SSCExamName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        SSCExamName.attr('style', 'border:1px solid #cdcdcd !important;');
        SSCExamName.css({ "background-color": "#ffffff" });
    }

    if (SSCRollNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter SSC roll number. ";
        SSCRollNo.attr('style', 'border:1px solid #d03100 !important;');
        SSCRollNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        SSCRollNo.attr('style', 'border:1px solid #cdcdcd !important;');
        SSCRollNo.css({ "background-color": "#ffffff" });
    }

    if (SSCPassYear == '' || SSCPassYear == '-Select-' || SSCPassYear == "0") {
        text += "<BR>" + " \u002A" + " Please Select SSC passing year ";
        $("#txtPssngYr2").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtPssngYr2").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtPssngYr2").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtPssngYr2").css({ "background-color": "#ffffff" });
    }

    if (SSCGradSystem == 'Select' || SSCGradSystem == '-Select-' || SSCGradSystem == "0") {
        text += "<BR>" + " \u002A" + " Please Select SSC exam grad system ";
        $("#ddlPctgeCalclte2").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlPctgeCalclte2").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlPctgeCalclte2").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlPctgeCalclte2").css({ "background-color": "#ffffff" });
    }
    if (ddlSSCDivision == 'Select Division' || ddlSSCDivision == '-Select-' || ddlSSCDivision == "0") {
        text += "<BR>" + " \u002A" + " Please Select SSC division ";
        $("#ddlSSCDivision").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlSSCDivision").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlSSCDivision").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlSSCDivision").css({ "background-color": "#ffffff" });
    }
    if (SSCTotalMark.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter SSC total marks. ";
        SSCTotalMark.attr('style', 'border:1px solid #d03100 !important;');
        SSCTotalMark.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        SSCTotalMark.attr('style', 'border:1px solid #cdcdcd !important;');
        SSCTotalMark.css({ "background-color": "#ffffff" });
    }
    if (SSCTotalSecured.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter SSC marks secured. ";
        SSCTotalSecured.attr('style', 'border:1px solid #d03100 !important;');
        SSCTotalSecured.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        SSCTotalSecured.attr('style', 'border:1px solid #cdcdcd !important;');
        SSCTotalSecured.css({ "background-color": "#ffffff" });
    }
   
    //--------------------BSC / Graduatio details------------
    var DegreeDiploma = $("#DegreeDiploma").val();
    var BoardUniversity = $("#BoardUniversity").val();
    var MaxMarks = $("#MaxMarks").val();
    var MarksSecured = $("#MarksSecured").val();
    var Grade = $("#Grade").val();
    var Division = $("#Division").val();
    var Passyear = $("#Passyear").val();
    var MainOptionalSubject = $("#MainOptionalSubject").val();
    var RadioBSC = $("input[name=RadioBSC]:checked").val();
    if (RadioBSC == null || RadioBSC == "" || RadioBSC == "undefined")
    {
        text += "<BR>" + " \u002A" + " Please select graduation section. ";
        opt = 1;
    }
    //if (RadioBSC == "Yes")
    //{
    //    if (DegreeDiploma == '') {
    //        text += "<BR>" + " \u002A" + " Please enter degree diploma. ";
    //        $("#DegreeDiploma").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#DegreeDiploma").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#DegreeDiploma").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#DegreeDiploma").css({ "background-color": "#ffffff" });
    //    }
    //    if (BoardUniversity == '') {
    //        text += "<BR>" + " \u002A" + " Please enter board university. ";
    //        $("#BoardUniversity").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#BoardUniversity").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#BoardUniversity").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#BoardUniversity").css({ "background-color": "#ffffff" });
    //    }
    //    if (MaxMarks == '') {
    //        text += "<BR>" + " \u002A" + " Please enter max marks. ";
    //        $("#MaxMarks").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#MaxMarks").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#MaxMarks").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#MaxMarks").css({ "background-color": "#ffffff" });
    //    }
    //    if (MarksSecured == '') {
    //        text += "<BR>" + " \u002A" + " Please enter marks secured. ";
    //        $("#MarksSecured").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#MarksSecured").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#MarksSecured").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#MarksSecured").css({ "background-color": "#ffffff" });
    //    }
    //    if (Grade == '' || Grade=='-Select-') {
    //        text += "<BR>" + " \u002A" + " Please select grade. ";
    //        $("#Grade").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#Grade").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#Grade").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#Grade").css({ "background-color": "#ffffff" });
    //    }

    //    if (Division == '') {
    //        text += "<BR>" + " \u002A" + " Please enter division. ";
    //        $("#Division").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#Division").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#Division").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#Division").css({ "background-color": "#ffffff" });
    //    }
    //    if (Passyear == '0' || Passyear == '-Select-') {
    //        text += "<BR>" + " \u002A" + " Please select passing year. ";
    //        $("#Passyear").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#Passyear").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#Passyear").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#Passyear").css({ "background-color": "#ffffff" });
    //    }
        
    //    if (MainOptionalSubject == '') {
    //        text += "<BR>" + " \u002A" + " Please enter division. ";
    //        $("#MainOptionalSubject").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#MainOptionalSubject").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#MainOptionalSubject").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#MainOptionalSubject").css({ "background-color": "#ffffff" });
    //    }

    //}

    /*-------------------Graduation Calculation part------------*/
    //Regular
    var txtMarksHons=$("#txtMarksHons").val();
    var txtMarksSecuredHons=$("#txtMarksSecuredHons").val();
    var txtMarksPass=$("#txtMarksPass").val();
    var txtMarksSecuredPass=$("#txtMarksSecuredPass").val();
    var txtLLMTotalMarks5Yrs = $("#txtLLMTotalMarks5Yrs").val(); 
    var txtLLMmarksSecured5Yrs=$("#txtLLMmarksSecured5Yrs").val();
    var ddlLLM3YrsCourse=$("#ddlLLM3YrsCourse").val();
    var ddlLLBHonsDivision=$("#ddlLLBHonsDivision").val();
    var txtLLBHonsTotalMark=$("#txtLLBHonsTotalMark").val();
    var txtLLBHonsMarksSecured=$("#txtLLBHonsMarksSecured").val();
    var txtLLBPassTotalMark=$("#txtLLBPassTotalMark").val();
    var txtLLBPassMarksSecured=$("#txtLLBPassMarksSecured").val();
    var txtMBA_GrdTotalMarks=$("#txtMBA_GrdTotalMarks").val();
    var txtMBA_GrdTotalMarksSecure=$("#txtMBA_GrdTotalMarksSecure").val();
    var txtMBA_MATScore = $("#txtMBA_MATScore").val();
    var SelectedVal = $("#ddlApplyFor").val();
    

    var CourseType = $("#ddlCourseType").val();

    //if (RadioBSC == "Yes") {
    //    if (SelectedVal == null || SelectedVal == 'undefined' || SelectedVal == '0' || SelectedVal == '-Select-') {
    //        text += "<BR>" + " \u002A" + " Please select qualifying exam. ";
    //        $("#ddlApplyFor").attr('style', 'border:1px solid #d03100 !important;');
    //        $("#ddlApplyFor").css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $("#ddlApplyFor").attr('style', 'border:1px solid #cdcdcd !important;');
    //        $("#ddlApplyFor").css({ "background-color": "#ffffff" });
    //    }
    //}
    if (RadioBSC == "Yes") {
        if (CourseType == "Regular") {
            if (SelectedVal == null || SelectedVal == 'undefined' || SelectedVal == '0' || SelectedVal == '-Select-') {
                text += "<BR>" + " \u002A" + " Please select qualifying exam. ";
                $("#ddlApplyFor").attr('style', 'border:1px solid #d03100 !important;');
                $("#ddlApplyFor").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#ddlApplyFor").attr('style', 'border:1px solid #cdcdcd !important;');
                $("#ddlApplyFor").css({ "background-color": "#ffffff" });
            }

            if (SelectedVal == 'Graduate with honours') {
                if (txtMarksHons == null || txtMarksHons == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks honours. ";
                    $("#txtMarksHons").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksHons").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksHons").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksHons").css({ "background-color": "#ffffff" });
                }
                if (txtMarksSecuredHons == null || txtMarksSecuredHons == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks honours. ";
                    $("#txtMarksSecuredHons").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksSecuredHons").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksSecuredHons").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksSecuredHons").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == 'Graduate with PASS/EQUIVALENT') {
                if (txtMarksPass == null || txtMarksPass == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks pass. ";
                    $("#txtMarksPass").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksPass").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksPass").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksPass").css({ "background-color": "#ffffff" });
                }
                if (txtMarksSecuredPass == null || txtMarksSecuredPass == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks pass. ";
                    $("#txtMarksSecuredPass").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksSecuredPass").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksSecuredPass").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksSecuredPass").css({ "background-color": "#ffffff" });
                }
            }
            else if (SelectedVal == 'Law graduates under 5-year LL.B. integrated course') {
                if (txtLLMTotalMarks5Yrs == null || txtLLMTotalMarks5Yrs == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks 5-year LL.B. integrated course. ";
                    $("#txtLLMTotalMarks5Yrs").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtLLMTotalMarks5Yrs").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtLLMTotalMarks5Yrs").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtLLMTotalMarks5Yrs").css({ "background-color": "#ffffff" });
                }
                if (txtLLMmarksSecured5Yrs == null || txtLLMmarksSecured5Yrs == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks 5-year LL.B. integrated course. ";
                    $("#txtLLMmarksSecured5Yrs").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtLLMmarksSecured5Yrs").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtLLMmarksSecured5Yrs").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtLLMmarksSecured5Yrs").css({ "background-color": "#ffffff" });
                }
            }
            else if (SelectedVal == 'Law graduates under 3-years LL.B. course') {

                if (ddlLLM3YrsCourse == '0' || ddlLLM3YrsCourse == '-select-' || ddlLLM3YrsCourse == 'undefined') {
                    text += "<BR>" + " \u002A" + " Please select LLM 3 years course type. ";
                    $("#ddlLLM3YrsCourse").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlLLM3YrsCourse").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlLLM3YrsCourse").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlLLM3YrsCourse").css({ "background-color": "#ffffff" });
                }
                var SelectedVal = $('#ddlLLM3YrsCourse').val();

                var ddlLLM3YrsCourse = $("#ddlLLM3YrsCourse").val();

                if (SelectedVal == "Honours graduate with LLB") {
                    if (ddlLLBHonsDivision == null || ddlLLBHonsDivision == '0') {
                        text += "<BR>" + " \u002A" + " Please select LLM 3 years division. ";
                        $("#ddlLLBHonsDivision").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ddlLLBHonsDivision").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#ddlLLBHonsDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#ddlLLBHonsDivision").css({ "background-color": "#ffffff" });
                    }
                    if (txtLLBHonsTotalMark == null || txtLLBHonsTotalMark == '') {
                        text += "<BR>" + " \u002A" + " Please select LLM 3 years total marks honours. ";
                        $("#txtLLBHonsTotalMark").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtLLBHonsTotalMark").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtLLBHonsTotalMark").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtLLBHonsTotalMark").css({ "background-color": "#ffffff" });
                    }
                    if (txtLLBHonsMarksSecured == null || txtLLBHonsMarksSecured == '') {
                        text += "<BR>" + " \u002A" + " Please select LLM 3 years total secured marks honours. ";
                        $("#txtLLBHonsMarksSecured").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtLLBHonsMarksSecured").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtLLBHonsMarksSecured").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtLLBHonsMarksSecured").css({ "background-color": "#ffffff" });
                    }


                }
                else if (SelectedVal == "Pass Graduate/Equivalent with LLB") {

                    if (txtLLBPassTotalMark == null || txtLLBPassTotalMark == '') {
                        text += "<BR>" + " \u002A" + " Please enter 3 years LLB total marks pass. ";
                        $("#txtLLBPassTotalMark").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtLLBPassTotalMark").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtLLBPassTotalMark").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtLLBPassTotalMark").css({ "background-color": "#ffffff" });
                    }
                    if (txtLLBPassMarksSecured == null || txtLLBPassMarksSecured == '') {
                        text += "<BR>" + " \u002A" + " Please enter 3 years LLB total secured marks pass. ";
                        $("#txtLLBPassMarksSecured").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtLLBPassMarksSecured").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtLLBPassMarksSecured").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtLLBPassMarksSecured").css({ "background-color": "#ffffff" });
                    }

                    //graduate pass course
                    if (txtMarksPass == null || txtMarksPass == '') {
                        text += "<BR>" + " \u002A" + " Please enter total marks pass. ";
                        $("#txtMarksPass").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtMarksPass").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtMarksPass").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtMarksPass").css({ "background-color": "#ffffff" });
                    }
                    if (txtMarksSecuredPass == null || txtMarksSecuredPass == '') {
                        text += "<BR>" + " \u002A" + " Please enter total secured marks pass. ";
                        $("#txtMarksSecuredPass").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtMarksSecuredPass").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtMarksSecuredPass").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtMarksSecuredPass").css({ "background-color": "#ffffff" });
                    }

                }

            }
            else if (SelectedVal == 'Graduate/equivalent with MAT') {

                if (txtMBA_GrdTotalMarks == null || txtMBA_GrdTotalMarks == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks of Graduate/equivalent. ";
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_GrdTotalMarks").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarks").css({ "background-color": "#ffffff" });
                }
                if (txtMBA_GrdTotalMarksSecure == null || txtMBA_GrdTotalMarksSecure == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks of Graduate/equivalent. ";
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#ffffff" });
                }
                if (txtMBA_MATScore == null || txtMBA_MATScore == '') {
                    text += "<BR>" + " \u002A" + " Please enter total MAT score. ";
                    $("#txtMBA_MATScore").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_MATScore").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_MATScore").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_MATScore").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == 'Graduate/Equivalent with non MAT') {

                if (txtMBA_GrdTotalMarks == null || txtMBA_GrdTotalMarks == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks of Graduate/equivalent. ";
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_GrdTotalMarks").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarks").css({ "background-color": "#ffffff" });
                }
                if (txtMBA_GrdTotalMarksSecure == null || txtMBA_GrdTotalMarksSecure == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks of Graduate/equivalent. ";
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#ffffff" });
                }
            }
            else {

            }
        }
        else if (CourseType == "Self Financing") {
            //Self
            var txtWorkExp_MBA = $("#txtWorkExp_MBA").val();
            var ddlMTechGrdDivision = $("#ddlMTechGrdDivision").val();
            var ddlMTechMscDivision = $("#ddlMTechMscDivision").val();
            var ddlMTechBTechDivision = $("#ddlMTechBTechDivision").val();
            var txtBEBTechBscTotalMark = $("#txtBEBTechBscTotalMark").val();
            var txtBEBTechBscMarkSecure = $("#txtBEBTechBscMarkSecure").val();
            var ddlPassDiv = $("#ddlPassDiv").val();
            var ddlHonsDiv = $("#ddlHonsDiv").val();
            var ddlMTech_PG_RSAndGIS = $("#ddlMTech_PG_RSAndGIS").val();

            var Programme = $("#ddlProgram").val();

            if (Programme != "P033" && Programme != "P051") {
                if (SelectedVal == null || SelectedVal == 'undefined' || SelectedVal == '0' || SelectedVal == '-Select-') {
                    text += "<BR>" + " \u002A" + " Please select qualifying exam. ";
                    $("#ddlApplyFor").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlApplyFor").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlApplyFor").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlApplyFor").css({ "background-color": "#ffffff" });
                }
            }
            else {

            }

            if (SelectedVal == 'Graduate with honours') {
               

                if (Programme == "P039") {

                    if (ddlMTechGrdDivision == null || ddlMTechGrdDivision == '0') {
                        text += "<BR>" + " \u002A" + " Please select +3 division. ";
                        $("#ddlMTechGrdDivision").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ddlMTechGrdDivision").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#ddlMTechGrdDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#ddlMTechGrdDivision").css({ "background-color": "#ffffff" });
                    }

                    if (ddlMTech_PG_RSAndGIS == null || ddlMTech_PG_RSAndGIS == '0') {
                        text += "<BR>" + " \u002A" + " Please select PG diploma division. ";
                        $("#ddlMTech_PG_RSAndGIS").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ddlMTech_PG_RSAndGIS").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#ddlMTech_PG_RSAndGIS").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#ddlMTech_PG_RSAndGIS").css({ "background-color": "#ffffff" });
                    }
                }
                else {

                    if (txtMarksHons == null || txtMarksHons == '') {
                        text += "<BR>" + " \u002A" + " Please enter total marks honours. ";
                        $("#txtMarksHons").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtMarksHons").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtMarksHons").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtMarksHons").css({ "background-color": "#ffffff" });
                    }
                    if (txtMarksSecuredHons == null || txtMarksSecuredHons == '') {
                        text += "<BR>" + " \u002A" + " Please enter total secured marks honours. ";
                        $("#txtMarksSecuredHons").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtMarksSecuredHons").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtMarksSecuredHons").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtMarksSecuredHons").css({ "background-color": "#ffffff" });
                    }
                }
            }
            else if (SelectedVal == 'Graduate with PASS/EQUIVALENT') {


                if (Programme == "P039") {

                    if (ddlMTechGrdDivision == null || ddlMTechGrdDivision == '0') {
                        text += "<BR>" + " \u002A" + " Please select +3 division. ";
                        $("#ddlMTechGrdDivision").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ddlMTechGrdDivision").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#ddlMTechGrdDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#ddlMTechGrdDivision").css({ "background-color": "#ffffff" });
                    }

                    if (ddlMTech_PG_RSAndGIS == null || ddlMTech_PG_RSAndGIS == '0') {
                        text += "<BR>" + " \u002A" + " Please select PG diploma division. ";
                        $("#ddlMTech_PG_RSAndGIS").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ddlMTech_PG_RSAndGIS").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#ddlMTech_PG_RSAndGIS").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#ddlMTech_PG_RSAndGIS").css({ "background-color": "#ffffff" });
                    }
                }
                else {
                    if (txtMarksPass == null || txtMarksPass == '') {
                        text += "<BR>" + " \u002A" + " Please enter total marks pass. ";
                        $("#txtMarksPass").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtMarksPass").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtMarksPass").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtMarksPass").css({ "background-color": "#ffffff" });
                    }
                    if (txtMarksSecuredPass == null || txtMarksSecuredPass == '') {
                        text += "<BR>" + " \u002A" + " Please enter total secured marks pass. ";
                        $("#txtMarksSecuredPass").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtMarksSecuredPass").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    } else {
                        $("#txtMarksSecuredPass").attr('style', 'border:1px solid #cdcdcd !important;');
                        $("#txtMarksSecuredPass").css({ "background-color": "#ffffff" });
                    }
                }

            }
            else if ((SelectedVal == 'Professionals with 2yr+ exp.' || SelectedVal == 'On job Professional with 2yr+ exp.') && Programme == "P032") { //Executive MBA Programme
                if (txtMBA_GrdTotalMarks == null || txtMBA_GrdTotalMarks == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks in graduation. ";
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksSecuredPass").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarks").css({ "background-color": "#ffffff" });
                }
                if (txtMBA_GrdTotalMarksSecure == null || txtMBA_GrdTotalMarksSecure == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks in graduation. ";
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#ffffff" });
                }
                if (txtWorkExp_MBA == null || txtWorkExp_MBA == '') {
                    text += "<BR>" + " \u002A" + " Please enter total work exp. ";
                    $("#txtWorkExp_MBA").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtWorkExp_MBA").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtWorkExp_MBA").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtWorkExp_MBA").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == 'Entrepreneur and self employed person with Own-SSIS' && Programme == "P032") {

                if (txtMBA_GrdTotalMarks == null || txtMBA_GrdTotalMarks == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks in graduation. ";
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksSecuredPass").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarks").css({ "background-color": "#ffffff" });
                }
                if (txtMBA_GrdTotalMarksSecure == null || txtMBA_GrdTotalMarksSecure == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks in graduation. ";
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#ffffff" });
                }
            }
            else if (Programme == "P033" || Programme == "P051") {
                if (txtMBA_GrdTotalMarks == null || txtMBA_GrdTotalMarks == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks in Grad./equivalent. ";
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_GrdTotalMarks").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarks").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarks").css({ "background-color": "#ffffff" });
                }

                if (txtMBA_GrdTotalMarksSecure == null || txtMBA_GrdTotalMarksSecure == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks in Grad./equivalent. ";
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMBA_GrdTotalMarksSecure").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMBA_GrdTotalMarksSecure").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "Honours Graduate" && (Programme == "P040" || Programme == "P041" || Programme == "P045" || Programme == "P052")) {
                if (ddlMTechGrdDivision == null || ddlMTechGrdDivision == '0') {
                    text += "<BR>" + " \u002A" + " Please select +3 hons division. ";
                    $("#ddlMTechGrdDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechGrdDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechGrdDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechGrdDivision").css({ "background-color": "#ffffff" });
                }
                if (ddlMTechMscDivision == null || ddlMTechMscDivision == '0') {
                    text += "<BR>" + " \u002A" + " Please select M.Sc. hons division. ";
                    $("#ddlMTechMscDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechMscDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechMscDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechMscDivision").css({ "background-color": "#ffffff" });
                }


            }
            else if (SelectedVal == "Professional Degree (B.E/B.Tech)" && (Programme == "P040" || Programme == "P041" || Programme == "P045" || Programme == "P052")) {
                if (ddlMTechBTechDivision == null || ddlMTechBTechDivision == '0') {
                    text += "<BR>" + " \u002A" + " Please select division of Professional Degree (B.E/B.Tech). ";
                    $("#ddlMTechBTechDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechBTechDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechBTechDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechBTechDivision").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "Honours Graduate" && Programme == "P036") {//Msc in Applied 
                if (txtMarksHons == null || txtMarksHons == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks honours. ";
                    $("#txtMarksHons").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksHons").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksHons").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksHons").css({ "background-color": "#ffffff" });
                }
                if (txtMarksSecuredHons == null || txtMarksSecuredHons == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks honours. ";
                    $("#txtMarksSecuredHons").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksSecuredHons").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksSecuredHons").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksSecuredHons").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "Pass Graduate/Equivalent" && Programme == "P036") {//Msc in Applied 

                if (txtMarksPass == null || txtMarksPass == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks pass. ";
                    $("#txtMarksPass").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksPass").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksPass").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksPass").css({ "background-color": "#ffffff" });
                }
                if (txtMarksSecuredPass == null || txtMarksSecuredPass == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks pass. ";
                    $("#txtMarksSecuredPass").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksSecuredPass").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksSecuredPass").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksSecuredPass").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "B.Sc./B.E./B.Tech in Chemical Engineering" && Programme == "P036") {//Msc in Applied 
                if (txtBEBTechBscTotalMark == null || txtBEBTechBscTotalMark == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks in aggregate. ";
                    $("#txtBEBTechBscTotalMark").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtBEBTechBscTotalMark").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtBEBTechBscTotalMark").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtBEBTechBscTotalMark").css({ "background-color": "#ffffff" });
                }
                if (txtBEBTechBscMarkSecure == null || txtBEBTechBscMarkSecure == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks in aggregate. ";
                    $("#txtBEBTechBscMarkSecure").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtBEBTechBscMarkSecure").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtBEBTechBscMarkSecure").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtBEBTechBscMarkSecure").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "Qualifying Exam B.Sc./B.E./B.Tech/Home Sc. in B.Pharm" && Programme == "P042") {//Msc in Food Sc 

                if (txtBEBTechBscTotalMark == null || txtBEBTechBscTotalMark == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks in aggregate. ";
                    $("#txtBEBTechBscTotalMark").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtBEBTechBscTotalMark").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtBEBTechBscTotalMark").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtBEBTechBscTotalMark").css({ "background-color": "#ffffff" });
                }
                if (txtBEBTechBscMarkSecure == null || txtBEBTechBscMarkSecure == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks in aggregate. ";
                    $("#txtBEBTechBscMarkSecure").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtBEBTechBscMarkSecure").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtBEBTechBscMarkSecure").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtBEBTechBscMarkSecure").css({ "background-color": "#ffffff" });
                }
            }
            else if (SelectedVal == "Hons Graduate" && Programme == "P044") {//Msc in Nano sc
                if (ddlHonsDiv == null || ddlHonsDiv == '0') {
                    text += "<BR>" + " \u002A" + " Please select hons division. ";
                    $("#ddlHonsDiv").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlHonsDiv").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlHonsDiv").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlHonsDiv").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "Pass Graduate" && Programme == "P044") {//Msc in Nano sc
                if (ddlPassDiv == null || ddlPassDiv == '0') {
                    text += "<BR>" + " \u002A" + " Please select pass division. ";
                    $("#ddlPassDiv").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlPassDiv").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlPassDiv").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlPassDiv").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "Hons Graduate with PG Diploma in RS & GIS" && Programme == "P037") {//M.Tech Geospatial
                if (ddlMTechGrdDivision == null || ddlMTechGrdDivision == '0') {
                    text += "<BR>" + " \u002A" + " Please select +3 hons division. ";
                    $("#ddlMTechGrdDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechGrdDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechGrdDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechGrdDivision").css({ "background-color": "#ffffff" });
                }
                if (ddlMTech_PG_RSAndGIS == null || ddlMTech_PG_RSAndGIS == '0') {
                    text += "<BR>" + " \u002A" + " Please select PG diploma division. ";
                    $("#ddlMTech_PG_RSAndGIS").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTech_PG_RSAndGIS").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTech_PG_RSAndGIS").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTech_PG_RSAndGIS").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "M.Sc." && Programme == "P037") {//M.Tech Geospatial

                if (ddlMTechMscDivision == null || ddlMTechMscDivision == '0') {
                    text += "<BR>" + " \u002A" + " Please select M.Sc. hons division. ";
                    $("#ddlMTechMscDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechMscDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechMscDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechMscDivision").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "B.Tech/B.E" && Programme == "P037") {//M.Tech Geospatial

                if (ddlMTechBTechDivision == null || ddlMTechBTechDivision == '0') {
                    text += "<BR>" + " \u002A" + " Please select division of Professional Degree (B.E/B.Tech). ";
                    $("#ddlMTechBTechDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechBTechDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechBTechDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechBTechDivision").css({ "background-color": "#ffffff" });
                }
            }
            else if (SelectedVal == "Hons Graduate" && Programme == "P049") {//PG Diploma Bioinformatics

                if (ddlHonsDiv == null || ddlHonsDiv == '0') {
                    text += "<BR>" + " \u002A" + " Please select hons division. ";
                    $("#ddlHonsDiv").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlHonsDiv").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlHonsDiv").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlHonsDiv").css({ "background-color": "#ffffff" });
                }
                if (ddlMTechMscDivision == null || ddlMTechMscDivision == '') {
                    text += "<BR>" + " \u002A" + " Please select M.Sc. hons division. ";
                    $("#ddlMTechMscDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechMscDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechMscDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechMscDivision").css({ "background-color": "#ffffff" });
                }
            }
            else if (SelectedVal == "Pass Graduate" && Programme == "P049") {//PG Diploma Bioinformatics

                if (ddlPassDiv == null || ddlPassDiv == '0') {
                    text += "<BR>" + " \u002A" + " Please select pass division. ";
                    $("#ddlPassDiv").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlPassDiv").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlPassDiv").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlPassDiv").css({ "background-color": "#ffffff" });
                }
                if (ddlMTechMscDivision == null || ddlMTechMscDivision == '' || ddlMTechMscDivision == "0") {
                    text += "<BR>" + " \u002A" + " Please select M.Sc. hons division. ";
                    $("#ddlMTechMscDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechMscDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechMscDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechMscDivision").css({ "background-color": "#ffffff" });
                }
            }
            else if (SelectedVal == "Honours Graduate" && Programme == "P053") {//Msc in Applied 
                if (txtMarksHons == null || txtMarksHons == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks honours. ";
                    $("#txtMarksHons").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksHons").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksHons").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksHons").css({ "background-color": "#ffffff" });
                }
                if (txtMarksSecuredHons == null || txtMarksSecuredHons == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks honours. ";
                    $("#txtMarksSecuredHons").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksSecuredHons").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksSecuredHons").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksSecuredHons").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "Pass Graduate" && Programme == "P053") {//Msc in Applied 

                if (txtMarksPass == null || txtMarksPass == '') {
                    text += "<BR>" + " \u002A" + " Please enter total marks pass. ";
                    $("#txtMarksPass").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksPass").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksPass").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksPass").css({ "background-color": "#ffffff" });
                }
                if (txtMarksSecuredPass == null || txtMarksSecuredPass == '') {
                    text += "<BR>" + " \u002A" + " Please enter total secured marks pass. ";
                    $("#txtMarksSecuredPass").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMarksSecuredPass").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#txtMarksSecuredPass").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#txtMarksSecuredPass").css({ "background-color": "#ffffff" });
                }

            }
            else if (SelectedVal == "B.E./B.Tech./B.Sc. Home Sc./B.Pharm (4years study after +2)" && Programme == "P053") {//M.Sc. in Home Science and Nutrition

                if (ddlMTechBTechDivision == null || ddlMTechBTechDivision == '' || ddlMTechBTechDivision == "0") {
                    text += "<BR>" + " \u002A" + " Please select division of B.E./B.Tech./B.Sc. Home Sc./B.Pharm (4years study after +2). ";
                    $("#ddlMTechBTechDivision").attr('style', 'border:1px solid #d03100 !important;');
                    $("#ddlMTechBTechDivision").css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    $("#ddlMTechBTechDivision").attr('style', 'border:1px solid #cdcdcd !important;');
                    $("#ddlMTechBTechDivision").css({ "background-color": "#ffffff" });
                }

            }

        }
        else {

        }

    }

    //-----------OTHER SECTION VALIDATIONS----------------
    Section1 = $("input[name='radio4']:checked").val();
    Section2 = $("input[name='radio5']:checked").val();
    Section3 = $("input[name='radio6']:checked").val();
    Section4 = $("input[name='radio7']:checked").val();
    Section5 = $("input[name='radio8']:checked").val();
    Section6 = $("input[name='radio9']:checked").val();
    Section6A = $("input[name='radio10']:checked").val();
    Section7 = $("input[name='radio11']:checked").val();
    Section8 = $("input[name='radio12']:checked").val();
    Section9 = $("input[name='radio13']:checked").val();

    if (Section1 == null || Section1 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 1.";
        opt = 1;
    }
    else {
        if (Section1 == 'yes') {
            var TypeofHandicap = $('#TypeofHandicap').val();
            var DisabilityPercent = $('#DisabilityPercent').val();

            if (TypeofHandicap=="") {
                text += "<BR>" + " \u002A" + "Section 1 Please enter type of Handicap.";
                $('#TypeofHandicap').attr('style', 'color:red !important;');
                $('#TypeofHandicap').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#TypeofHandicap').attr('style', 'color:#000000 !important;');
                $('#TypeofHandicap').css({ "color": "#000000 " });
            }
            if (DisabilityPercent == "") {
                text += "<BR>" + " \u002A" + "Section 1 Please enter disability percent.";
                $('#DisabilityPercent').attr('style', 'color:red !important;');
                $('#DisabilityPercent').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#DisabilityPercent').attr('style', 'color:#000000 !important;');
                $('#DisabilityPercent').css({ "color": "#000000 " });
            }
        }
    }
    if (Section2 == null || Section2 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 2.";
        opt = 1;
    }
    else {
        if (Section2 == 'yes') {
            var NameOfDepartment = $('#NameOfDepartment').val();
            var NameOfPost = $('#NameOfDepartment').val();

            if (NameOfDepartment == "") {
                text += "<BR>" + " \u002A" + "Section 2 Please enter name of department.";
                $('#NameOfDepartment').attr('style', 'color:red !important;');
                $('#NameOfDepartment').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#NameOfDepartment').attr('style', 'color:#000000 !important;');
                $('#NameOfDepartment').css({ "color": "#000000 " });
            }
            if (NameOfPost == "") {
                text += "<BR>" + " \u002A" + "Section 2 Please enter name of post.";
                $('#NameOfPost').attr('style', 'color:red !important;');
                $('#NameOfPost').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#NameOfPost').attr('style', 'color:#000000 !important;');
                $('#NameOfPost').css({ "color": "#000000 " });
            }
        }
    }

    if (Section3 == null || Section3 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 3.";
        opt = 1;
    }
    else {
        if (Section3 == 'yes') {
            var TournamentName = $('#TournamentName').val();
            var TournamentYear = $('#TournamentYear').val();

            if (TournamentName == "") {
                text += "<BR>" + " \u002A" + "Section 3 Please enter tournament name.";
                $('#TournamentName').attr('style', 'color:red !important;');
                $('#TournamentName').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#TournamentName').attr('style', 'color:#000000 !important;');
                $('#TournamentName').css({ "color": "#000000 " });
            }
            if (TournamentYear == "" || TournamentYear == "0" || TournamentYear=="-Select-") {
                text += "<BR>" + " \u002A" + "Section 3 Please select tournament year.";
                $('#TournamentYear').attr('style', 'color:red !important;');
                $('#TournamentYear').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#TournamentYear').attr('style', 'color:#000000 !important;');
                $('#TournamentYear').css({ "color": "#000000 " });
            }
        }
    }

    if (Section4 == null || Section4 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 4.";
        opt = 1;
    }
    else {
        if (Section4 == 'yes') {
            var PassingYear = $('#PassingYear').val();
            var authorityName = $('#authorityName').val();

            if (PassingYear == "" || PassingYear == "0" || PassingYear=="-Select-") {
                text += "<BR>" + " \u002A" + "Section 4 Please select passing year.";
                $('#PassingYear').attr('style', 'color:red !important;');
                $('#PassingYear').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#PassingYear').attr('style', 'color:#000000 !important;');
                $('#PassingYear').css({ "color": "#000000 " });
            }
            if (authorityName == "") {
                text += "<BR>" + " \u002A" + "Section 4 Please enter authority name.";
                $('#authorityName').attr('style', 'color:red !important;');
                $('#authorityName').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#authorityName').attr('style', 'color:#000000 !important;');
                $('#authorityName').css({ "color": "#000000 " });
            }
        }
    }

    if (Section5 == null || Section5 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 5.";
        opt = 1;
    }
    else {
        if (Section5 == 'yes') {
            var MigrationYear = $('#MigrationYear').val();
            var MigrationAddress = $('#MigrationAddress').val();

            if (MigrationYear == "" || MigrationYear == "0" || MigrationYear == "-Select-") {
                text += "<BR>" + " \u002A" + "Section 5 Please select migration year.";
                $('#MigrationYear').attr('style', 'color:red !important;');
                $('#MigrationYear').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#MigrationYear').attr('style', 'color:#000000 !important;');
                $('#MigrationYear').css({ "color": "#000000 " });
            }
            if (MigrationAddress == "") {
                text += "<BR>" + " \u002A" + "Section 5 Please enter migration address.";
                $('#MigrationAddress').attr('style', 'color:red !important;');
                $('#MigrationAddress').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#MigrationAddress').attr('style', 'color:#000000 !important;');
                $('#MigrationAddress').css({ "color": "#000000 " });
            }
        }
    }

    if (Section6 == null || Section6 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 6.";
        opt = 1;
    }
    else {
        if (Section6 == 'yes') {
            var OrganisationDetails = $('#OrganisationDetails').val();
            var OgranisationPlace = $('#OgranisationPlace').val();
            var TotalExperience = $('#TotalExperience').val();
            var Designation = $('#Designation').val();

            if (OrganisationDetails=="") {
                text += "<BR>" + " \u002A" + "Section 6 Please enter organisation details.";
                $('#OrganisationDetails').attr('style', 'color:red !important;');
                $('#OrganisationDetails').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#OrganisationDetails').attr('style', 'color:#000000 !important;');
                $('#OrganisationDetails').css({ "color": "#000000 " });
            }
            if (OgranisationPlace == "") {
                text += "<BR>" + " \u002A" + "Section 6 Please enter ogranisation place.";
                $('#OgranisationPlace').attr('style', 'color:red !important;');
                $('#OgranisationPlace').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#OgranisationPlace').attr('style', 'color:#000000 !important;');
                $('#OgranisationPlace').css({ "color": "#000000 " });
            }

            if (TotalExperience == "") {
                text += "<BR>" + " \u002A" + "Section 6 Please enter total experience.";
                $('#TotalExperience').attr('style', 'color:red !important;');
                $('#TotalExperience').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#TotalExperience').attr('style', 'color:#000000 !important;');
                $('#TotalExperience').css({ "color": "#000000 " });
            }
            if (Designation == "") {
                text += "<BR>" + " \u002A" + "Section 6 Please enter designation.";
                $('#Designation').attr('style', 'color:red !important;');
                $('#Designation').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#Designation').attr('style', 'color:#000000 !important;');
                $('#Designation').css({ "color": "#000000 " });
            }
        }
    }

    if (Section6A == null || Section6A == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 6A.";
        opt = 1;
    }
    else {
        if (Section6A == 'yes') {
            var NameOfExamination = $('#NameOfExamination').val();
            var MBAPassedYear = $('#MBAPassedYear').val();
            var MBAMarkSecured = $('#MBAMarkSecured').val();

            if (NameOfExamination == "") {
                text += "<BR>" + " \u002A" + "Section 6A Please enter name of examination.";
                $('#NameOfExamination').attr('style', 'color:red !important;');
                $('#NameOfExamination').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#NameOfExamination').attr('style', 'color:#000000 !important;');
                $('#NameOfExamination').css({ "color": "#000000 " });
            }
            if (MBAPassedYear == "" || MBAPassedYear == "0" || MBAPassedYear=="-Select-") {
                text += "<BR>" + " \u002A" + "Section 6A Please select MBA passed year.";
                $('#MBAPassedYear').attr('style', 'color:red !important;');
                $('#MBAPassedYear').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#MBAPassedYear').attr('style', 'color:#000000 !important;');
                $('#MBAPassedYear').css({ "color": "#000000 " });
            }
            if (MBAMarkSecured == "") {
                text += "<BR>" + " \u002A" + "Section 6A Please enter MBA mark secured.";
                $('#MBAMarkSecured').attr('style', 'color:red !important;');
                $('#MBAMarkSecured').css({ "color": "red !important;" });
                opt = 1;
            } else {
                $('#MBAMarkSecured').attr('style', 'color:#000000 !important;');
                $('#MBAMarkSecured').css({ "color": "#000000 " });
            }
        }
    }
    if (Section7 == null || Section7 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 7.";
        opt = 1;
    }
    if (Section8 == null || Section8 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 8.";
        opt = 1;
    }
    if (Section9 == null || Section9 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 9.";
        opt = 1;
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
        else {
            $('#EmailID').attr('style', 'color:#000000 !important;');
            $('#EmailID').css({ "color": "#000000 " });
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


function GetSUCollegeList() {
    var SelCollege = $('#ddlProgram').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/PG/AdmissionForm2018.aspx/GetSUCollege',
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


function GetSUDepartment() {
    var SelPrograme = $('#ddlCollege').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/PG/AdmissionForm2018.aspx/GetSUDepartmentList',
        data: '{"CollegeCode":"' + SelPrograme + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlDepartment").empty();
            $("#ddlDepartment").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlDepartment").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function GetSubjectList() {
    var DepartmentCode = $('#ddlDegree').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/PG/AdmissionForm2018.aspx/GetSUSubjectList',
        data: '{"DepartmentCode":"' + DepartmentCode + '"}',
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

function SubmitData() {

    debugger;
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
    var ResponseType = "C";
   

    var temp = "Gunwant";
    var AppID = "";

    var rtnurl = "";

    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var datavar = {

        'aadhaarNumber': $('#AadhaarNo').val(),
        'UniversityRegNo': $('#UniversityRegNo').val(),
        'AadhaarDetail': 'Aadhaar',
        'AppMobileNo': $('#txtMobile').val(),

        'OUATCourse': $('#ddlCourseType').val(),
        'CollegeName': $('#ddlDepartment').val(),
        'DegreeName': $('#ddlProgram').val(),
        'SubjectName': $('#ddlDepartment').val(),
        'ProgramName':$('#ddlProgram option:selected').text(),

        'CandidateName': $('#AppcntFullName').val(),
        'FatherName': $('#AppcntFatherName').val(),
        'MotherName': $('#AppcntMotherName').val(),
        'DOB': DOBConverted,
        'Year': $('#Year').val(),
        'Month': $('#Month').val(),
        'Day': $('#Day').val(),
        'Gender': $('#ddlGender').val(),
        'Religion': $('#religion').val(),
        'Category': $('#category').val(),
        'MaritalStatus': $('#ddlMaritalStatus').val(),
        'MotherTongue': $('#ddlTongue').val(),
        'Nationality': $('#nationality').val(),
        'MobileNo': $('#MobileNo').val(),
        'EmailId': $('#EmailID').val(),

        'FatherOccupation': $('#FatherOccupation').val(),
        'MotherOccupation': $('#MotherOccupation').val(),
        'GuardianName': $('#GuardianName').val(),
        'GuardianOccupation': $('#GuardianOccupation').val(),        

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

        'HscBoardName': $('#ddlBoard').val(),
        'HscNameExamPass': $('#txtExmntnName').val(),
        'HscBoardRollNo': $('#txtRoll10').val(),
        'HscYearPassing': $('#txtPssngYr').val(),
        'HscExamCleard': $('#ddlPasstype').val(),
        'HscGradeSystem': $('#ddlPctgeCalclte').val(),
        'HscTotalMark': $('#txtTotalMarks').val(),
        'HscMarkSecured': $('#txtMarkSecure').val(),
        'HscPercentage': $('#txtPercentage').val(),

        'SscBoardName': $('#SSCddlBoard').val(),
        'SscNameExamPass': $('#txtExmntnName2').val(),
        'SscBoardRollNo': $('#txtBoardRollNo2').val(),
        'SscYearPassing': $('#txtPssngYr2').val(),
        'SscExamCleard':$('#ddlSSCDivision').val(),
        'SscGradeSystem': $('#ddlPctgeCalclte2').val(),
        'SscTotalMark': $('#txtTotalMarks2').val(),
        'SscMarkSecured': $('#txtMarkSecure2').val(),
        'SscPercentage': $('#txtPercentage2').val(),

        'BscDegreeDimploma': $('#DegreeDiploma').val(),
        'BscBoardUniversity': $('#BoardUniversity').val(),
        'BscMaxMarks': $('#MaxMarks').val(),
        'BscMarksSecured': $('#MarksSecured').val(),
        'BscGrade': $('#Grade').val(),
        'BscDivision': $('#Division').val(),
        'BscPassYear': $('#Passyear').val(),
        'BscMainOptionalSubject': $('#MainOptionalSubject').val(),

        'Section1_IsHandicap': $("input[name='radio4']:checked").val(),
        'Section1_HandicapType': $('#TypeofHandicap').val(),
        'Section1_DisabilityPercent': $('#DisabilityPercent').val(),
        'Section2_IsExDefence': $("input[name='radio5']:checked").val(),
        'Section2_DeptName': $('#NameOfDepartment').val(),
        'Section2_PostName':$('#NameOfPost').val(),
        'Section3_IsPlyedInInterUniv':$("input[name='radio6']:checked").val(),
        'Section3_TournamentName': $('#TournamentName').val(),
        'Section3_TournamentYear': $('#TournamentYear').val(),
        'Section4_IsPossessNcc': $("input[name='radio7']:checked").val(),
        'Section4_PassYear':$('#PassingYear').val(),
        'Section4_NameOfAuthority': $('#authorityName').val(),
        'Section5_IsKashmiri': $("input[name='radio8']:checked").val(),
        'Section5_MigrationYear': $('#MigrationYear').val(),
        'Section5_Address': $('#MigrationAddress').val(),
        'Section6_IsMLib': $("input[name='radio9']:checked").val(),
        'Section6_OrganisationDetail': $('#OrganisationDetails').val(),
        'Section6_Place': $('#OgranisationPlace').val(),
        'Section6_TotalExp': $('#TotalExperience').val(),
        'Section6_Designation':$('#Designation').val(),        
        'Section6A_IsMba': $("input[name='radio10']:checked").val(),
        'Section6A_ExaminationName': $('#NameOfExamination').val(),
        'Section6A_ExaminationYear': $('#MBAPassedYear').val(),
        'Section6A_MarkSecured': $('#MBAMarkSecured').val(),
        'Section7': $("input[name='radio11']:checked").val(),
        'Section8': $("input[name='radio12']:checked").val(),
        'Section9': $("input[name='radio13']:checked").val(),

        'ApplyingFor':$('#ddlApplyFor').val(),
        'TotalMark_Hon':$('#txtMarksHons').val(),
        'TotalMarkSecure_Hon':$('#txtMarksSecuredHons').val(),
        'TotalMark_Pass':$('#txtMarksPass').val(),
        'TotalMarkSecure_Pass':$('#txtMarksSecuredPass').val(),
        'LLM_TotalMark5Yrs':$('#txtLLMTotalMarks5Yrs').val(),
        'LLM_TotalMarkSecure5Yrs':$('#txtLLMmarksSecured5Yrs').val(),
        'LLM_3Yrs_Type':$('#ddlLLM3YrsCourse').val(),
        'LLM_3Yrs_LLBHonDiv':$('#ddlLLBHonsDivision').val(),
        'LLM_3Yrs_LLBHonTotalMark':$('#txtLLBHonsTotalMark').val(),
        'LLM_3Yrs_LLBHonMarkSecure':$('#txtLLBHonsMarksSecured').val(),
        'LLM_3Yrs_LLBPassTotalMark':$('#txtLLBPassTotalMark').val(),
        'LLM_3Yrs_LLBPassMarkSecure':$('#txtLLBPassMarksSecured').val(),
        'MBA_MatScore': $('#txtMBA_MATScore').val(),
        'MBA_TotalMarks':$('#txtMBA_GrdTotalMarks').val(),
        'MBA_TotalMarkSecured':$('#txtMBA_GrdTotalMarksSecure').val(),
        'IsPassGraduate': $("input[name='RadioBSC']:checked").val(),

        'WorkExp_MBA': $("#txtWorkExp_MBA").val(),
        'MTech_GraduateDiv': $("#ddlMTechGrdDivision").val(),
        'MTech_MscDiv': $("#ddlMTechMscDivision").val(),
        'MTech_ProDegreeDiv': $("#ddlMTechBTechDivision").val(),
        'BE_BTech_Bsc_TotalMark': $("#txtBEBTechBscTotalMark").val(),
        'BE_BTech_Bsc_MarkSecure': $("#txtBEBTechBscMarkSecure").val(),
        'Pass_Div': $("#ddlPassDiv").val(),
        'Hons_Div': $("#ddlHonsDiv").val(),
        'MTech_Hons_PG_RSAndGIS': $("#ddlMTech_PG_RSAndGIS").val(),

        'ResponseType': ResponseType,
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
    $("#load").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/PG/AdmissionForm2018.aspx/InsertData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#load").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {

            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            var IntStatus = obj.intStatus;
            var Status = obj.Status;

            result = true;
            if (IntStatus == "0") {
                $("#load").hide();
                $("#btnSubmit").prop('disabled', false);
                alertPopup("Form Validation Failed", "Error While Saving Application.!!!, <BR> You have already applied for the same department and program!!!");
                return;
            }
            else if (IntStatus == "1") {
                $("#load").hide();
                alertPopup("Addmission Into PG Courses", "Application saved successfully. Reference ID : " + obj.AppID + " Please Make Payment against the Application Number.");
                // window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=419&AppID=' + obj.AppID;
                window.location.href = '/WebApp/Kiosk/PG/PGProcessbar.aspx?SvcID=1452&AppID=' + obj.AppID;
            }
            else {
                $("#btnSubmit").prop('disabled', false);
                $("#load").hide();
                alertPopup("Form Validation Failed", Status);
            }


        });// end of Then function of main Data Insert Function

    return false;
}


/*---------------------Mobile OTP Validation-------------------*/

function fnGenOTP() {

    $('#divMsg').hide();
    $('#txtSMSCode').val("");
    var MobileNo = $("#txtMobile").val();
    var length = MobileNo.length;
    $("#divMsgTitle").text("Validate Form!");

    if ($("#txtMobile").val() == "") {
        //alert("Please enter 10 digit mobile number.");
        $("#divMsgDtls").text("Please enter 10 digit mobile number.");
        $("#txtMobile").focus();
        $('#divMsg').show();
        return false;
    }

    if (eval(length) < 10) {
        alert("Mobile number should be 10 digit");
        $("#txtMobile").focus();
        $("#txtMobile").val("");
        $('#divMsg').show();
        return false;
    }

    var mobmatch1 = /^[789]\d{9}$/;
    if (!mobmatch1.test(MobileNo)) {
        alert("Please Enter valid mobile Number.");
        return;
    }

    debugger;
    var temp = "Gunwant";

    var result = false;

    //var UID = getQueryString("aadhaarNumber");
    //var TransID = getQueryString("transactionId");

    var MobileNo = $("#txtMobile").val();
    $("#txtMobile").prop('disabled', true);
    $.when(
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Citizen/Forms/ValidateUser.aspx/GenerateOTP',
        data: '{"prefix": "","Data":"' + MobileNo + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    })).then(function (data, textStatus, jqXHR) {
        debugger;
        var obj = jQuery.parseJSON(data.d);
        var html = "";
        var strMobile = "";
        AppID = obj.AppID;
        var temp = AppID.split('_');
        strMobile = temp[3];
        result = true;
        var Status = obj.Status;

        if (Status == 'Success') {
            alert('The 6 digit OTP code has been SMS to ' + strMobile + ' \. Please enter OTP code to verify');
            $("#txtMobile").prop('disabled', true);
            $('#divOTP').show();
            $('#btnValidateOTP').prop('disabled', false);
            $('#txtSMSCode').prop('disabled', false);
            $('#btnValidateOTP').show();
            $('#btnOTP').val("Re-send SMS");
            $("#divMsgTitle").text("Information!");
            $("#divMsgDtls").text("6 Digit OTP Code has been sent on registered mobile no and is valid for 10 minutes.");
            $('#divMsg').show();
        }
        else if (Status == 'AlreadyExist') {
            $("#txtMobile").prop('disabled', false);
            $('#btnSubmit').prop('disabled', true);
            alertPopup("Mobile No already exist!", "Mobile No already registered for PG Admission Form, Please login to check application status.");
        }
        else {
            alert('Sorry! Something went wrong, please try again.');
            $("#txtMobile").prop('disabled', false);
            $('#btnOTP').val('Re-generate OTP');
            $("#MobileNo").val(MobileNo);
            $("#divCitizenProfile").show();
            $("#divSearch").hide();
            $("#HFOTPDone").val("Y");
            $("#HFMobileNo").val(MobileNo);

        }
        
    });

    return false;
}

function fnValidateOTP() {
    debugger;
    var temp = "Gunwant";

    var result = false;
    AppID = AppID;
    if (AppID == null || AppID == "" || AppID == "undefined")
    {
        alertPopup("Invalid OTP", "Either invalid OTP code OR not genrated OTP Code, please generate OTP code");
        return;
    }
    $.when(
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Citizen/Forms/ValidateUser.aspx/ValidateCitizenOTP',
        data: '{"prefix": "","Data":"' + AppID + '","EnteredOTP":"' + $('#txtSMSCode').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    })).then(function (data, textStatus, jqXHR) {
        debugger;
        var obj = jQuery.parseJSON(data.d);
        var html = "";
        var strMobile = "";
        var strReturn = obj.AppID;
        var temp = strReturn.split('_');
        var ResponseType = obj.ResponseType;
        var ProfileID = obj.ProfileID;
        var AadhaarKeyField = obj.KeyField;
        var Result = temp[0];
        var cnt = temp[0];
        result = true;

        var Status = obj.Status;//.InvalidOTP

        if (Status == 'Success' && Result==1) {
            var MobileNo = $("#txtMobile").val();
            $('#MobileNo').val(MobileNo);
            $('#btnSubmit').prop('disabled', false);
            alert('Mobile No. successfully validated. Please Fill the PG Admission Form.')
        }
        else {
            //alert('OTP Validation Failed! Please re-enter correct 6 digit OTP received as SMS from Lokaseba Adhikara -CAP, Odisha Govt.');
            alert('OTP Validation Failed! You have entered wrong OTP Code, please re-enter correct OTP Code, which you have received on your registered mobile no. Other wise resend OTP Code from Lokaseba Adhikara -CAP, Odisha Govt.');

        }
       
    });

    return false;
}

function ValidateRegisteredMobile(Mobile, Type)//Here Type use for validation 1-Profile,2-PG Form
{
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/PG/AdmissionForm2018.aspx/ValidateRegisteredMobile',
        data: '{"Mobile": "' + Mobile + '","Type":"' + Type + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;
            var Resp = jQuery.parseJSON(response.d);
            var UserName = Resp[0]["UserName"];
            var Mobile = Resp[0]["Mobile"];
            var Email = Resp[0]["Email"];
            var Result = Resp[0]["Result"]; // Always return 0 if mobile not exist
            var Msg = Resp[0]["Msg"]; //Not Exist
            var MsgHeader = Resp[0]["MsgHeader"];

            if (Result == '0') {
                fnGenOTP();
            }
            else if (Result == '1') {
                //Validate Here for further processing the application.........
                bootbox.confirm({
                    message: Msg,
                    buttons: {
                        confirm: {
                            label: 'Yes',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: 'No',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {
                        //console.log('This was logged in the callback: ' + result);
                        if (result == true) {
                            fnGenOTP();
                        }
                        else {
                            $("#txtMobile").prop('disabled', false);
                            $('#btnSubmit').prop('disabled', true);
                        }
                    }
                });

            }
            else if (Result == '2') {
                $("#txtMobile").prop('disabled', false);
                $('#btnSubmit').prop('disabled', true);
                alertPopup(MsgHeader, Msg);
            }
            else {
                $("#txtMobile").prop('disabled', false);
                $('#btnSubmit').prop('disabled', true);

            }


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function ValidateUserM() {
    debugger;
    var MobileNo = $("#txtMobile").val();
    var length = MobileNo.length;

    if ($("#txtMobile").val() == "") {
        //alert("Please enter 10 digit mobile number.");
        $("#divMsgDtls").text("Please enter 10 digit mobile number.");
        $("#txtMobile").focus();
        $('#divMsg').show();
        return;
    }

    if (eval(length) < 10) {
        alert("Mobile number should be 10 digit");
        $("#txtMobile").focus();
        $("#txtMobile").val("");
        $('#divMsg').show();
        return;
    }

    var mobmatch1 = /^[789]\d{9}$/;
    if (!mobmatch1.test(MobileNo)) {
        alert("Please Enter valid mobile Number.");
        return;
    }
    $("#txtMobile").prop('disabled', true);

    ValidateRegisteredMobile(MobileNo, "");
}


function PGDeclaration(chk) {

    debugger;

    if (chk) {
        if ($('#AppcntFullName').val() == "" || $('#AppcntFullName').val() == "") {
            //alert("Please enter the all the mandatory fields.");
            alert("Please enter your Full Name, Father Name  to continue.");
            chkPhysical.checked = false;
            return false;
        }

        if ($('#CddlDistrict').val() == 0) {
            alert("Please select Present District to continue.");
            chkPhysical.checked = false;
            return false;
        }
        if ($('#ddlGender').val() != '0') {
            if ($('#ddlGender').val() == "M" || $('#ddlGender').val() == "Male") {
                $('#lblGender').text("Son of ");
                $('#lblTitle').text("Mr.");
            } else if ($('#ddlGender').val() == "F" || $('#ddlGender').val() == "Female") {
                $('#lblGender').text("Daughter of ");
                $('#lblTitle').text("Ms.");
            } else { $('#lblGender').text("Child of"); $('#lblTitle').text("Mr./Ms."); }
        }
        else {
            alert("Please, seect Gender");
        }

        var name = $('#AppcntFullName').val();
        var fname = $('#AppcntFatherName').val();
        var place = $("#CddlDistrict option:selected").text();//$('#CddlDistrict').val();
        //alert(name);
        $("#lblName").text(name);
        $("#lblApplicant").text(name);
        $("#lblNameAadhaar").text(name);
        $("#lblPhsclFthrName").text(fname);
        //$("#lblPhsclDstName").text(fname);
        $("#cndidteplce").text(place);

       // $('#btnSubmit').prop('disabled', false);


        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!

        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        var today = dd + '/' + mm + '/' + yyyy;
        $("#currntdte").text(today);
        $('#divDeclaration').show();
    }
    else {
        $("#lblName").text("");
        $("#lblNameAadhaar").text("");
        $("#lblApplicant").text("");
        $("#lblPhsclFthrName").text("");
        $("#lblPhsclDstName").text("");
        //$('#btnSubmit').prop('disabled', true);
        $('#divDeclaration').hide();
    }
}

function GetSUProgrammList() {
    var DepartmentCode = $('#ddlDepartment').val();
    var CourseType = $('#ddlCourseType').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/PG/AdmissionForm2018.aspx/GetProgramList',
        data: '{"DepartmentCode":"' + DepartmentCode + '","CourseType":"' + CourseType + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlProgram").empty();
            $("#ddlProgram").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlProgram").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetSU_EligibilityCriterea() {
   // $("#ddlApplyFor").val("0");
    var ProgramId = $('#ddlProgram').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/PG/AdmissionForm2018.aspx/GetEligibilityCriterea',
        data: '{"ProgramId":"' + ProgramId + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var data = Category[0]["EligibilityCriteria"];
            if (data != null && data != "") {
                $('#lblMsg').text(data);
                $("#PopupModal").modal('show');
            }
            else {
                $("#PopupModal").modal('hide');
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function ClearValue() {
    $("#txtMarksHons").val("");
    $("#txtMarksSecuredHons").val("");
    $("#txtMarksPass").val("");
    $("#txtMarksSecuredPass").val("");
    $("#txtLLMTotalMarks5Yrs").val("");
    $("#txtLLMmarksSecured5Yrs").val("");
    $("#ddlLLM3YrsCourse").val("0");
    $("#ddlLLBHonsDivision").val("0");
    $("#txtLLBHonsTotalMark").val("");
    $("#txtLLBHonsMarksSecured").val("");
    $("#txtLLBPassTotalMark").val("");
    $("#txtLLBPassMarksSecured").val("");
    $("#txtMBA_GrdTotalMarks").val("");
    $("#txtMBA_GrdTotalMarksSecure").val("");
    $("#txtMBA_MATScore").val("");
    $("#txtWorkExp_MBA").val("");

    $("#txtWorkExp_MBA").val("");
    $("#ddlMTechGrdDivision").val("0");
    $("#ddlMTechMscDivision").val("0");
    $("#ddlMTechBTechDivision").val("0");
    $("#txtBEBTechBscTotalMark").val("");
    $("#txtBEBTechBscMarkSecure").val("");
    $("#ddlPassDiv").val("0");
    $("#ddlHonsDiv").val("0");
    $("#ddlMTech_PG_RSAndGIS").val("0");

}

function MarksValidate(MarksId, MarksSecuredId)
{
    debugger;
    MarksId = '#' + MarksId;
    MarksSecuredId = '#' + MarksSecuredId;
    var TotalM=$(MarksId).val();
    var TotalMSecure=$(MarksSecuredId).val();

    if (TotalM != null && TotalM != "" && TotalMSecure != null && TotalMSecure != "")
    {
        if (parseInt(TotalM) < parseInt(TotalMSecure)) {
            alertPopup("Marks Validation", "Marks secured can not be more than total marks !");
            $(MarksId).val("");
            $(MarksSecuredId).val("");
        }
        else {
            /*--------Marks validate for pass pg courses not to allow less than 45% -------*/
            /*------Except mention program/course-------*/
            var Programme = $("#ddlProgram").val();
            var CourseType = $("#ddlCourseType").val();
            var SelectedVal = $("#ddlApplyFor").val();
            var Category = $("#category").val();

            if (CourseType == "Regular") {
                if (SelectedVal == "Graduate with PASS/EQUIVALENT" && (Programme != "P020" || Programme != "P023" || Programme != "P029" || Programme != "P030" || Programme != "P028")) {
                    //formula for pass course-------  (AggregateMarksSecure X 12 / Maximam Marks)
                    //var CalMarks = ((parseInt(TotalMSecure) * 12) / parseInt(TotalM));
                    var CalMarks = ((parseInt(TotalMSecure) * 100) / parseInt(TotalM));
                    CalMarks = CalMarks.toFixed(2);
                    if (CalMarks < 45) {
                        $(MarksId).val("");
                        $(MarksSecuredId).val("");
                        alertPopup("Pass Course Aggregate Marks Validate", "Less than 45% in aggregate in pass course not allowed");
                    }
                }
            }
            else if (CourseType == "Self Financing") {

                var CalMarks = ((parseInt(TotalMSecure) * 100) / parseInt(TotalM));
                CalMarks = CalMarks.toFixed(2);

                if (Programme == "P033" || Programme == "P051") {
                    if (Category == "Select Category" || Category == "0" || Category == null) {
                        $(MarksId).val("");
                        $(MarksSecuredId).val("");
                        alertPopup("Category Validation", "Before filling the marks, Please select category !");
                    }
                    else if (Category != "SC" && Category != "ST") {
                        if (CalMarks < 45) {
                            $(MarksId).val("");
                            $(MarksSecuredId).val("");
                            alertPopup("Aggregate Marks Validate", "Less than 45% in aggregate in MBA course not allowed");
                        }
                    }

                }
                else if (SelectedVal == "Graduate with PASS/EQUIVALENT" && (Programme == "P034" || Programme == "P035" || Programme == "P038" || Programme == "P046" || Programme == "P047" || Programme == "P048")) {
                    if (CalMarks < 45) {

                        $(MarksId).val("");
                        $(MarksSecuredId).val("");
                        alertPopup("Pass Course Aggregate Marks Validate", "Less than 45% in aggregate in pass course not allowed");
                    }
                }
                else if (SelectedVal == "Pass Graduate/Equivalent" && (Programme == "P036")) {
                    if (CalMarks < 45) {

                        $(MarksId).val("");
                        $(MarksSecuredId).val("");
                        alertPopup("Pass Course Aggregate Marks Validate", "Less than 45% in aggregate in pass course not allowed");
                    }
                }
                else if (SelectedVal == "Qualifying Exam B.Sc./B.E./B.Tech/Home Sc. in B.Pharm" && Programme == "P042") {

                    if (CalMarks < 45) {

                        $(MarksId).val("");
                        $(MarksSecuredId).val("");
                        alertPopup("Pass Course Aggregate Marks Validate", "Less than 45% in aggregate in pass course not allowed");
                    }
                }
                else if (SelectedVal == "Pass Graduate" && Programme == "P053") {

                    if (CalMarks < 45) {

                        $(MarksId).val("");
                        $(MarksSecuredId).val("");
                        alertPopup("Pass Course Aggregate Marks Validate", "Less than 45% in aggregate in pass course not allowed");
                    }
                }
            }

        }
    }
}

/*-----------------Self Financing Marks------------------*/

function SelfFinancing() {
    var Programme = $("#ddlProgram").val();

    if (Programme == "P034" || Programme == "P035" || Programme == "P047" || Programme == "P043" || Programme == "P046" || Programme == "P048" || Programme == "P039" || Programme == "P038") {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Graduate with honours">Graduate with honours</option>');
        $("#ddlApplyFor").append('<option value = "Graduate with PASS/EQUIVALENT">Graduate with PASS / EQUIVALENT</option>');
    }
    else if (Programme == "P032") {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Professionals with 2yr+ exp.">Professionals with 2yr+ exp.</option>');
        $("#ddlApplyFor").append('<option value = "On job Professional with 2yr+ exp.">On job Professional with 2yr+ exp.</option>');
        $("#ddlApplyFor").append('<option value = "Entrepreneur and self employed person with Own-SSIS">Entrepreneur and self employed person with Own-SSIS</option>');
        
    }
    else if (Programme == "P033" || Programme == "P051") {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
    }
    else if (Programme == "P040" || Programme == "P041" || Programme == "P045" || Programme == "P052") { //M.Tech
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Honours Graduate">Honours Graduate</option>');
        $("#ddlApplyFor").append('<option value = "Professional Degree (B.E/B.Tech)">Professional Degree (B.E/B.Tech)</option>');
    }
    else if (Programme == "P036") {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Honours Graduate">Honours Graduate</option>');
        $("#ddlApplyFor").append('<option value = "Pass Graduate/Equivalent">Pass Graduate/Equivalent</option>');
        $("#ddlApplyFor").append('<option value = "B.Sc./B.E./B.Tech in Chemical Engineering">B.Sc./B.E./B.Tech in Chemical Engineering</option>');
    }
    else if (Programme == "P042") {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Qualifying Exam B.Sc./B.E./B.Tech/Home Sc. in B.Pharm">Qualifying Exam B.Sc./B.E./B.Tech/Home Sc. in B.Pharm</option>');
    }
    else if (Programme == "P044") {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Hons Graduate">Hons Graduate</option>');
        $("#ddlApplyFor").append('<option value = "Pass Graduate">Pass Graduate</option>');
    }
    else if (Programme == "P037") {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Hons Graduate with PG Diploma in RS & GIS">Hons Graduate with PG Diploma in RS & GIS</option>');
        $("#ddlApplyFor").append('<option value = "M.Sc.">M.Sc.</option>');
        $("#ddlApplyFor").append('<option value = "B.Tech/B.E">B.Tech/B.E</option>');
    }
    else if (Programme == "P049") {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Hons Graduate">Hons Graduate</option>');
        $("#ddlApplyFor").append('<option value = "Pass Graduate">Pass Graduate</option>');
    }
    else if (Programme == "P053") {//M.Sc. in Home Science and Nutrition
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
        $("#ddlApplyFor").append('<option value = "Honours Graduate">Honours Graduate</option>');
        $("#ddlApplyFor").append('<option value = "Pass Graduate">Pass Graduate</option>');
        $("#ddlApplyFor").append('<option value = "B.E./B.Tech./B.Sc. Home Sc./B.Pharm (4years study after +2)">B.E./B.Tech./B.Sc. Home Sc./B.Pharm (4years study after +2)</option>');
    }
    else {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
    }
  
}

function QualifyingCourse() {
    var CourseType = $("#ddlCourseType").val();

    if (CourseType == "Regular") {
        //---------Append value ApplyingFor in Other Than MBA & LAW Dept.
        var DeptValue = $('#ddlDepartment').val();
        //D003- Law 
        //D003- Business Administration
        if (DeptValue == 'D003') {
            //1.Graduate/ equivalent with MAT 
            //2.Graduate /Equivalent with non MAT
            $("#ddlApplyFor").empty();
            $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
            $("#ddlApplyFor").append('<option value = "Graduate/equivalent with MAT">Graduate/ equivalent with MAT</option>');
            $("#ddlApplyFor").append('<option value = "Graduate/Equivalent with non MAT">Graduate/ Equivalent with non MAT</option>');
        }
        else if (DeptValue == 'D033') {
            //1.Law graduates under 5-year LL.B. integrated course  
            //2.Law graduates under three years LL.B. course
            $("#ddlApplyFor").empty();
            $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
            $("#ddlApplyFor").append('<option value = "Law graduates under 5-year LL.B. integrated course">Law graduates under 5-year LL.B. integrated course</option>');
            $("#ddlApplyFor").append('<option value = "Law graduates under 3-years LL.B. course">Law graduates under 3-years LL.B. course</option>');
        }
        else if (DeptValue == "D014") {
            $("#ddlApplyFor").empty();
            $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
            $("#ddlApplyFor").append('<option value = "Graduate with PASS/EQUIVALENT">Graduate with PASS / EQUIVALENT</option>');
        }
        else { //Other department
            $("#ddlApplyFor").empty();
            $("#ddlApplyFor").append('<option value = "0">-Select-</option>');
            $("#ddlApplyFor").append('<option value = "Graduate with honours">Graduate with honours</option>');
            $("#ddlApplyFor").append('<option value = "Graduate with PASS/EQUIVALENT">Graduate with PASS / EQUIVALENT</option>');
        }

        $('#ddlApplyFor').val('0');
    }
    else if (CourseType == "Self Financing") {
        SelfFinancing();
        $('#ddlApplyFor').val('0');
    }
    else {
        $("#ddlApplyFor").empty();
        $("#ddlApplyFor").append('<option value = "0">-Select-</option>');

        $('#ddlApplyFor').val('0');
    }
}

function ApplyingForOnChange() {
    debugger;
    var CourseType = $("#ddlCourseType").val();

    /*---------------------------------REGULAR COURSES/PROGRAMME------------------------------------------*/
    if (CourseType == "Regular") {

        var SelectedVal = $("#ddlApplyFor").val();
        ClearValue();

        $('#GrdDivHons1').hide();
        $('#GrdDivHons2').hide();
        $('#GrdDivPass1').hide();
        $('#GrdDivPass2').hide();
        $('#LLBDiv5Yrs1').hide();
        $('#LLBDiv5Yrs2').hide();
        $('#LLBDiv3YrsCourse').hide();
        $('#LLBDiv3YrsDivision').hide();
        $('#LLBDiv3YrsHons1').hide();
        $('#LLBDiv3YrsHons2').hide();
        $('#LLBDiv3YrsPass1').hide();
        $('#LLBDiv3YrsPass2').hide();
        $('#MBADivMark').hide();
        $('#MBADivMarkSecure').hide();
        $('#MBADivMATScore').hide();
        $('#WorkExp_MBA').hide();
        $('#DivMTech_GraduateDivision').hide();
        $('#DivMTech_MscDivision').hide();
        $('#DivMTech_BTechDivision').hide();
        $('#DivBEBTechBscTotalMark').hide(); 
        $('#DivBEBTechBscMarkSecure').hide();
        $('#DivHonsDivision').hide();
        $('#DivPassDivision').hide();
        $('#DivMTech_PG_RSAndGIS').hide();
        $('#MsgInfo').hide();

        if (SelectedVal == 'Graduate with honours') {
            $('#GrdDivHons1').show();
            $('#GrdDivHons2').show();

        }
        else if (SelectedVal == 'Graduate with PASS/EQUIVALENT') {
           
            $('#GrdDivPass1').show();
            $('#GrdDivPass2').show();
        }
        else if (SelectedVal == 'Law graduates under 5-year LL.B. integrated course') {
            
            $('#LLBDiv5Yrs1').show();
            $('#LLBDiv5Yrs2').show();
        }
        else if (SelectedVal == 'Law graduates under 3-years LL.B. course') {
           
            $('#LLBDiv3YrsCourse').show();
        }
        else if (SelectedVal == 'Graduate/equivalent with MAT') {
           
            $('#MBADivMark').show();
            $('#MBADivMarkSecure').show();
            $('#MBADivMATScore').show();
        }
        else if (SelectedVal == 'Graduate/Equivalent with non MAT') {
           
            $('#MBADivMark').show();
            $('#MBADivMarkSecure').show();
        }
        else {
           
        }
    }/*---------------------------------SELF FINANCING COURSES/PROGRAMME------------------------------------------*/
    else if (CourseType == "Self Financing") {
        debugger;
        var Programme = $("#ddlProgram").val();
        var SelectedVal = $("#ddlApplyFor").val();
        ClearValue();
        HideDiv();

        $("#ddlPassDiv").empty();
        $("#ddlPassDiv").append('<option value = "0">-Select-</option>');
        $("#ddlPassDiv").append('<option value = "1st Division">1st Division</option>');

        $("#ddlMTechBTechDivision option[value='Pass or equivalent grade']").remove();

        //PG Division append RS and GIS
        $("#ddlMTech_PG_RSAndGIS option[value='3rd Division']").remove();
        $("#ddlMTech_PG_RSAndGIS").append('<option value = "3rd Division">3rd Division</option>');
        //+3 Hons Division 
        $("#ddlMTechGrdDivision").empty();
        $("#ddlMTechGrdDivision").append('<option value = "0">-Select-</option>');
        $("#ddlMTechGrdDivision").append('<option value = "1st Division">1st Division</option>');
        $("#ddlMTechGrdDivision").append('<option value = "2nd Division">2nd Division</option>');
        $("#ddlMTechGrdDivision").append('<option value = "3rd Division">3rd Division</option>');

        $("#lblPGDivision").text("PG Diploma Division");

        if (SelectedVal == 'Graduate with honours') {

            if (Programme == "P039") {
                //+3 Hons Division 
                $("#ddlMTechGrdDivision").empty();
                $("#ddlMTechGrdDivision").append('<option value = "0">-Select-</option>');
                $("#ddlMTechGrdDivision").append('<option value = "1st Class Hons">1st Class Hons</option>');
                $("#ddlMTechGrdDivision").append('<option value = "2nd Class Hons">2nd Class Hons</option>');
                $("#ddlMTechGrdDivision").append('<option value = "Pass">Pass</option>');
                $('#DivMTech_GraduateDivision').show();
                $("#lblPGDivision").text("PG in Arts/ Science");
                $("#ddlMTech_PG_RSAndGIS option[value='3rd Division']").remove();
                $('#DivMTech_PG_RSAndGIS').show();
            }
            else {
                $('#GrdDivHons1').show();
                $('#GrdDivHons2').show();
            }

        }
        else if (SelectedVal == 'Graduate with PASS/EQUIVALENT') {



            if (Programme == "P039") {
                //+3 Hons Division 
                $("#ddlMTechGrdDivision").empty();
                $("#ddlMTechGrdDivision").append('<option value = "0">-Select-</option>');
                $("#ddlMTechGrdDivision").append('<option value = "1st Class Hons">1st Class Hons</option>');
                $("#ddlMTechGrdDivision").append('<option value = "2nd Class Hons">2nd Class Hons</option>');
                $("#ddlMTechGrdDivision").append('<option value = "Pass">Pass</option>');
                $('#DivMTech_GraduateDivision').show();
                 $("#lblPGDivision").text("PG in Arts/ Science");
                $("#ddlMTech_PG_RSAndGIS option[value='3rd Division']").remove();
                $('#DivMTech_PG_RSAndGIS').show();
            }
            else {
                $('#GrdDivPass1').show();
                $('#GrdDivPass2').show();
            }


        }
        else if (SelectedVal == 'Professionals with 2yr+ exp.' && Programme == "P032") { //Executive MBA Programme

            $('#MsgInfo').show();
            var Msg = "The applicant need to furnish experience certificate of Professionals with 2yr+ exp.";
            $('#txtMsgInfo').text(Msg);

            $('#MBADivMark').show();
            $('#MBADivMarkSecure').show();
            $('#WorkExp_MBA').show();

        }
        else if (SelectedVal == 'On job Professional with 2yr+ exp.' && Programme == "P032") {

            $('#MsgInfo').show();
            var Msg = "The applicant need to furnish experience certificate with NOC from his/her concerned office of On job Professional.";
            $('#txtMsgInfo').text(Msg);

            $('#MBADivMark').show();
            $('#MBADivMarkSecure').show();
            $('#WorkExp_MBA').show();
        }
        else if (SelectedVal == 'Entrepreneur and self employed person with Own-SSIS' && Programme == "P032") {

            $('#MsgInfo').show();
            var Msg = "The applicant need to furnish  valid License, TIN, PAN  with annual sales turn over of Rs.50.00 Lakh or more.";
            $('#txtMsgInfo').text(Msg);

            $('#MBADivMark').show();
            $('#MBADivMarkSecure').show();
            //$('#WorkExp_MBA').show();
        }
        else if (Programme == "P033" || Programme == "P051") {
            $('#QualifyingExamDiv').hide();
            $('#MBADivMark').show();
            $('#MBADivMarkSecure').show();

        }
        else if (SelectedVal == "Honours Graduate" && (Programme == "P040" || Programme == "P041" || Programme == "P045" || Programme == "P052")) {

            $('#DivMTech_GraduateDivision').show();
            $('#DivMTech_MscDivision').show();
        }
        else if (SelectedVal == "Professional Degree (B.E/B.Tech)" && (Programme == "P040" || Programme == "P041" || Programme == "P045" || Programme == "P052")) {

            $('#DivMTech_BTechDivision').show();
        }
        else if (SelectedVal == "Honours Graduate" && Programme == "P036") {//Msc in Applied 

            $('#GrdDivHons1').show();
            $('#GrdDivHons2').show();

        }
        else if (SelectedVal == "Pass Graduate/Equivalent" && Programme == "P036") {//Msc in Applied 

            $('#GrdDivPass1').show();
            $('#GrdDivPass2').show();

        }
        else if (SelectedVal == "B.Sc./B.E./B.Tech in Chemical Engineering" && Programme == "P036") {//Msc in Applied 

            $('#DivBEBTechBscTotalMark').show();
            $('#DivBEBTechBscMarkSecure').show();
        }
        else if (SelectedVal == "Qualifying Exam B.Sc./B.E./B.Tech/Home Sc. in B.Pharm" && Programme == "P042") {//Msc in Food Sc 

            $('#DivBEBTechBscTotalMark').show();
            $('#DivBEBTechBscMarkSecure').show();
        }
        else if (SelectedVal == "Hons Graduate" && Programme == "P044") {//Msc in Nano sc

            $('#DivHonsDivision').show();
        }
        else if (SelectedVal == "Pass Graduate" && Programme == "P044") {//Msc in Nano sc

            $('#DivPassDivision').show();
        }
        else if (SelectedVal == "Hons Graduate with PG Diploma in RS & GIS" && Programme == "P037") {//M.Tech Geospatial

            $('#DivMTech_GraduateDivision').show();
            $('#DivMTech_PG_RSAndGIS').show();
        }
        else if (SelectedVal == "M.Sc." && Programme == "P037") {//M.Tech Geospatial

            $('#DivMTech_MscDivision').show();

        }
        else if (SelectedVal == "B.Tech/B.E" && Programme == "P037") {//M.Tech Geospatial

            $('#DivMTech_BTechDivision').show();
        }
        else if (SelectedVal == "Hons Graduate" && Programme == "P049") {//PG Diploma Bioinformatics

            $('#DivHonsDivision').show();
            $('#DivMTech_MscDivision').show();
        }
        else if (SelectedVal == "Pass Graduate" && Programme == "P049") {//PG Diploma Bioinformatics

            //$("#ddlPassDiv option[value='1st Division']").remove();

            $("#ddlPassDiv").empty();
            $("#ddlPassDiv").append('<option value = "0">-Select-</option>');
            $("#ddlPassDiv").append('<option value = "Pass">Pass</option>');

            $('#DivPassDivision').show();
            $('#DivMTech_MscDivision').show();
        }
        else if (SelectedVal == "Honours Graduate" && Programme == "P053") {//M.Sc. in Home Science and Nutrition

            $('#GrdDivHons1').show();
            $('#GrdDivHons2').show();
        }
        else if (SelectedVal == "Pass Graduate" && Programme == "P053") {//M.Sc. in Home Science and Nutrition
            $('#GrdDivPass1').show();
            $('#GrdDivPass2').show();
        }
        else if (SelectedVal == "B.E./B.Tech./B.Sc. Home Sc./B.Pharm (4years study after +2)" && Programme == "P053") {//M.Sc. in Home Science and Nutrition

            $("#ddlMTechBTechDivision").append('<option value = "Pass or equivalent grade">Pass or equivalent grade</option>');
            $('#DivMTech_BTechDivision').show();

        }
       
    }
    else {

    }

}

function HideDiv() {
    $('#QualifyingExamDiv').show();
    $('#GrdDivHons1').hide();
    $('#GrdDivHons2').hide();
    $('#GrdDivPass1').hide();
    $('#GrdDivPass2').hide();
    $('#LLBDiv5Yrs1').hide();
    $('#LLBDiv5Yrs2').hide();
    $('#LLBDiv3YrsCourse').hide();
    $('#LLBDiv3YrsDivision').hide();
    $('#LLBDiv3YrsHons1').hide();
    $('#LLBDiv3YrsHons2').hide();
    $('#LLBDiv3YrsPass1').hide();
    $('#LLBDiv3YrsPass2').hide();
    $('#MBADivMark').hide();
    $('#MBADivMarkSecure').hide();
    $('#MBADivMATScore').hide();
    $('#WorkExp_MBA').hide();
    $('#DivMTech_GraduateDivision').hide();
    $('#DivMTech_MscDivision').hide();
    $('#DivMTech_BTechDivision').hide();
    $('#DivBEBTechBscTotalMark').hide();
    $('#DivBEBTechBscMarkSecure').hide();
    $('#DivHonsDivision').hide();
    $('#DivPassDivision').hide();
    $('#DivMTech_PG_RSAndGIS').hide();
    $('#MsgInfo').hide();
}


function isNumberKey(event) {
    if (event.shiftKey || event.ctrlKey || event.altKey) {
        event.preventDefault();
    } else {
        var key = event.keyCode;
        if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
            event.preventDefault();
        }
    }
}
