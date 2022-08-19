
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

    $('#MscTotalMarks').change(function () {
        CalculateMscPercentage($('#MscTotalMarks').val(), $('#MscMarksGot').val());
    });
    $('#MscMarksGot').change(function () {
        CalculateMscPercentage($('#MscTotalMarks').val(), $('#MscMarksGot').val());
    });
    $("#MscDivision").bind("change", function (e) {
        if ($("#MscDivision").val() == "501" || $("#MscDivision").val() == "503" || $("#MscDivision").val() == "504") {

            $('#lblMscMarksGot').removeClass("manadatory");
            $('#MscPassingYear').prop('disabled', false);
            $('#MscTotalMarks').prop('disabled', true);
            $('#MscMarksGot').prop('disabled', false);

            var str = $("#MscDivision option:selected").text();
            $("#MscTotalMarks").attr("placeholder", "OGPA").val("").focus().blur();
            $("#MscTotalMarks").val(str.replace('OGPA - ', '').replace('Scale', '').trim());

            $("#lblMscTotalMarks").text("OGPA Secured");

            //$('#MscTotalMarks').val("");
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

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/PGPhD/PGPHDEditMarks.aspx/GetStudentDetail',
        data: '{}',
        dataType: "json",
        success: function (data) {

            var StudentData = jQuery.parseJSON(data.d);

            $('#FirstName').val(StudentData.AppDetails[0]["ApplicantName"]);
            $('#txtAppID').val(StudentData.AppDetails[0]["AppID"]);
            $('#EmailID').val(StudentData.AppDetails[0]["emailId"]);
            $('#MobileNo').val(StudentData.AppDetails[0]["MobileNo"]);

            $('#txtCollegeName').val(StudentData.AppDetails[0]["CollegeName"]);
            $('#txtProgramme').val(StudentData.AppDetails[0]["OUATCourse"]);
            $('#txtDegree').val(StudentData.AppDetails[0]["DegreeName"]);

            m_PH = StudentData.AppDetails[0]["PhysicallyChallenged"];
            m_ReservQta = StudentData.AppDetails[0]["ReservationQuota"];
            m_Course = StudentData.AppDetails[0]["OUATCourse"];
            m_Category = StudentData.AppDetails[0]["category"];

            if (StudentData.AppDetails[0]["SubjectName"] == '-Select-') {
                $('#txtSubject').val('---');
            }
            else {
                $('#txtSubject').val(StudentData.AppDetails[0]["SubjectName"]);
            }

            if ($('#txtProgramme').val() == "Doctoral Programme")
            {
                $('#MscName').val(StudentData.EducationDetails[0]["MscName"].trim());
                $('#MscDivision').val(StudentData.EducationDetails[0]["MscDivision"].trim());
                $('#MscPassingYear').val(StudentData.EducationDetails[0]["MscPassingYear"].trim());
                $('#MscTotalMarks').val(StudentData.EducationDetails[0]["MscTotalMarks"].trim());
                $('#MscMarksGot').val(StudentData.EducationDetails[0]["MscMarksGot"].trim());
                $('#MscPercentage').val(StudentData.EducationDetails[0]["MscPercentage"].trim());

                $("#divMsc").show(800);
                $("#divBsc").hide(800);
            }
            else {

                $('#BscName').val(StudentData.EducationDetails[0]["BscName"]);
                $('#BscDivision').val(StudentData.EducationDetails[0]["BscDivision"]);

                if (StudentData.EducationDetails[0]["BscDivision"] == "501") {
                    ChangeDivision();
                    $('#BscPassingYear').val(StudentData.EducationDetails[0]["BscPassingYear"]);
                    $('#BscTotalMarks').val('10');
                    $('#BscTotalMarks').prop('disabled',true);
                    $('#BscMarksGot').val(StudentData.EducationDetails[0]["BscTotalMarks"]);
                    $('#BscPercentage').val(StudentData.EducationDetails[0]["BscPercentage"]);
                }
                else {
                    ChangeDivision();
                    $('#BscPassingYear').val(StudentData.EducationDetails[0]["BscPassingYear"]);
                    if (StudentData.EducationDetails[0]["BscTotalMarks"] < StudentData.EducationDetails[0]["BscMarksGot"]) {
                        $('#BscTotalMarks').val(StudentData.EducationDetails[0]["BscTotalMarks"]);
                        $('#BscMarksGot').val(StudentData.EducationDetails[0]["BscMarksGot"]);
                        $('#BscPercentage').val(StudentData.EducationDetails[0]["BscPercentage"]);
                    }
                    else {
                        $('#BscTotalMarks').val(StudentData.EducationDetails[0]["BscMarksGot"]);
                        $('#BscMarksGot').val(StudentData.EducationDetails[0]["BscTotalMarks"]);
                        $('#BscPercentage').val(StudentData.EducationDetails[0]["BscPercentage"]);
                    }
                }


                $("#divMsc").hide(800);
                $("#divBsc").show(800);
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
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

            if ($('#txtProgramme').val() == "Master Programme") {
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

            if ($('#txtProgramme').val() == "Doctoral Programme") {
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

    if ($('#txtProgramme').val() == "Doctoral Programme") {
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

        if ($('#txtProgramme').val() == "Master Programme") {
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

        if ($('#txtProgramme').val() == "Doctoral Programme") {
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

            if ($('#txtProgramme').val() == "Master Programme") {
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

            if ($('#txtProgramme').val() == "Master Programme") {
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

            if ($('#txtProgramme').val() == "Master Programme") {
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

            if ($('#txtProgramme').val() == "Master Programme") {
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

    var category = m_Category;
    var ReservQta = m_ReservQta;

    var Physicallyhandicaped = m_PH;
    if (m_PH == "Yes") {
        Physicallyhandicaped = 1;
    }

    if (ReservQta == "Yes" && Physicallyhandicaped == 1) {
        category = "SC";
    }

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

            if ($('#txtProgramme').val() == "Doctoral Programme") {
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

    if ($('#txtProgramme').val() == "Doctoral Programme") {
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

        if ($('#txtProgramme').val() == "Master Programme") {
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

        if ($('#txtProgramme').val() == "Doctoral Programme") {
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

        'MscName': $('#MscName').val(),
        'MscTotalMarks': $('#MscTotalMarks').val(),
        'MscMarksGot': $('#MscMarksGot').val(),
        'MscPercentage': $('#MscPercentage').val(),
        'MscDivision': $('#MscDivision').val(),
        'MscPassingYear': $('#MscPassingYear').val(),
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

    if ($('#txtProgramme').val() == "Doctoral Programme") {
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
    else {

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