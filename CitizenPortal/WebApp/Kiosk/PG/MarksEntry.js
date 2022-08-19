
$(document).ready(function () {

    $("#load").hide();
   // $('#btnSubmit').prop('disabled', true);

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

    $('#btnSubmit').bind('click', function () {
        SubmitData();
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
        if (parseInt(Exp) < 2) {
            $("#txtWorkExp_MBA").val("");
            alertPopup("Work Experience Validation", "Work experience min. 2 year allowed.");
        }
    });

    //GetSUDepartment();
    var qs=getQueryStrings();
    var AppID=qs["AppID"];

    if (AppID != null && AppID != "") {
        GetStudentData();
    }

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


function ValidateForm() {
    debugger;
    var text = "";
    var opt = "";
    

    /*-------------------Graduation Calculation part------------*/
    //Regular
    var txtMarksHons = $("#txtMarksHons").val();
    var txtMarksSecuredHons = $("#txtMarksSecuredHons").val();
    var txtMarksPass = $("#txtMarksPass").val();
    var txtMarksSecuredPass = $("#txtMarksSecuredPass").val();
    var txtLLMTotalMarks5Yrs = $("#txtLLMTotalMarks5Yrs").val();
    var txtLLMmarksSecured5Yrs = $("#txtLLMmarksSecured5Yrs").val();
    var ddlLLM3YrsCourse = $("#ddlLLM3YrsCourse").val();
    var ddlLLBHonsDivision = $("#ddlLLBHonsDivision").val();
    var txtLLBHonsTotalMark = $("#txtLLBHonsTotalMark").val();
    var txtLLBHonsMarksSecured = $("#txtLLBHonsMarksSecured").val();
    var txtLLBPassTotalMark = $("#txtLLBPassTotalMark").val();
    var txtLLBPassMarksSecured = $("#txtLLBPassMarksSecured").val();
    var txtMBA_GrdTotalMarks = $("#txtMBA_GrdTotalMarks").val();
    var txtMBA_GrdTotalMarksSecure = $("#txtMBA_GrdTotalMarksSecure").val();
    var txtMBA_MATScore = $("#txtMBA_MATScore").val();
    var SelectedVal = $("#ddlApplyFor").val();


    var CourseType = $("#ddlCourseType").val();
    
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
            $("#ddlCourseType").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#ddlCourseType").css({ "background-color": "#ffffff" });
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

            $("#ddlCourseType").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#ddlCourseType").css({ "background-color": "#ffffff" });

        }
        else {
            text += "<BR>" + " \u002A" + " Please select Course Type. ";
            $("#ddlCourseType").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlCourseType").css({ "background-color": "#fff2ee" });
            opt = 1;
        }


    //-----------OTHER SECTION VALIDATIONS----------------
    
    Section9 = $("input[name='radio13']:checked").val();

    if (Section9 == null || Section9 == "") {

        text += "<BR>" + " \u002A" + " Please Choose Section 10.";
        opt = 1;
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


function GetSUDepartment(DeptId) {
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
            if (DeptId != null && DeptId != "" && DeptId != "undefined") {
                $("#ddlDepartment").val(DeptId);
            }
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
    var ResponseType = "C";


    var temp = "Gunwant";
    var AppID = "";

    var rtnurl = "";

    var result = false;
   
    var datavar = {

        'aadhaarNumber': $('#AadhaarNo').val(),
        'UniversityRegNo': $('#UniversityRegNo').val(),
        'AadhaarDetail': 'Aadhaar',
        'AppMobileNo': $('#txtMobile').val(),

        'CourseType': $('#ddlCourseType').val(),
        'DepartmentId': $('#ddlDepartment').val(),
        'ProgrammId': $('#ddlProgram').val(),
        'ProgramName': $('#ddlProgram option:selected').text(),
        
        'JSONData': '',      
                
        'Section9': $("input[name='radio13']:checked").val(),

        'ApplyingFor': $('#ddlApplyFor').val(),
        'TotalMark_Hon': $('#txtMarksHons').val(),
        'TotalMarkSecure_Hon': $('#txtMarksSecuredHons').val(),
        'TotalMark_Pass': $('#txtMarksPass').val(),
        'TotalMarkSecure_Pass': $('#txtMarksSecuredPass').val(),
        'LLM_TotalMark5Yrs': $('#txtLLMTotalMarks5Yrs').val(),
        'LLM_TotalMarkSecure5Yrs': $('#txtLLMmarksSecured5Yrs').val(),
        'LLM_3Yrs_Type': $('#ddlLLM3YrsCourse').val(),
        'LLM_3Yrs_LLBHonDiv': $('#ddlLLBHonsDivision').val(),
        'LLM_3Yrs_LLBHonTotalMark': $('#txtLLBHonsTotalMark').val(),
        'LLM_3Yrs_LLBHonMarkSecure': $('#txtLLBHonsMarksSecured').val(),
        'LLM_3Yrs_LLBPassTotalMark': $('#txtLLBPassTotalMark').val(),
        'LLM_3Yrs_LLBPassMarkSecure': $('#txtLLBPassMarksSecured').val(),
        'MBA_MatScore': $('#txtMBA_MATScore').val(),
        'MBA_TotalMarks': $('#txtMBA_GrdTotalMarks').val(),
        'MBA_TotalMarkSecured': $('#txtMBA_GrdTotalMarksSecure').val(),
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

function GetSUProgrammList(DeptId,CourseType,SelectedVal) {
    var DepartmentCode = DeptId;//$('#ddlDepartment').val();
    //var CourseType = $('#ddlCourseType').val();
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

            if (SelectedVal != null && SelectedVal != "" && SelectedVal != "undefined")
            {
                $("#ddlProgram").val(SelectedVal);
            }
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

function MarksValidate(MarksId, MarksSecuredId) {
    debugger;
    MarksId = '#' + MarksId;
    MarksSecuredId = '#' + MarksSecuredId;
    var TotalM = $(MarksId).val();
    var TotalMSecure = $(MarksSecuredId).val();

    if (TotalM != null && TotalM != "" && TotalMSecure != null && TotalMSecure != "") {
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

function SelfFinancing(Program) {
    var Programme = Program; // $("#ddlProgram").val();

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

function QualifyingCourse(CourseType,DeptId,Program) {
    //var CourseType = $("#ddlCourseType").val();

    if (CourseType == "Regular") {
        //---------Append value ApplyingFor in Other Than MBA & LAW Dept.
        var DeptValue = DeptId; //$('#ddlDepartment').val();
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
        SelfFinancing(Program);
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

function GetStudentData()
{
    var qs = getQueryStrings();
    var AppID = qs["AppID"];
    var ServiceId = qs["SvcID"];

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/PG/UGAndPGMarksEntry.aspx/GetStudentData',
        data: '{"AppID":"' + AppID + '","ServiceId":"' + ServiceId + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;
            var Data = eval(response.d);
            var html = "";
            if (Data != null && Data != "") {
                var Department = Data[0]["Department"];
                var Programme = Data[0]["Programme"];
                var CourseType = Data[0]["CourseType"];
                var IsPassGraduate = Data[0]["IsPassGraduate"];
                var ApplyingFor = Data[0]["ApplyingFor"];

                if (IsPassGraduate == "No") {
                    if (Department != null && Department != "" && Department != "undefined") {
                        GetSUDepartment(Department)
                        $("#ddlDepartment").prop("disabled", true);
                    }
                    if (CourseType != null && CourseType != "" && CourseType != "undefined") {
                        $("#ddlCourseType").val(CourseType)
                        $("#ddlCourseType").prop("disabled", true);
                    }
                    if (Programme != null && Programme != "" && Department != "" && Department != null) {
                        GetSUProgrammList(Department, CourseType, Programme);
                        $("#ddlProgram").prop("disabled", true);

                        QualifyingCourse(CourseType, Department, Programme);
                        ApplyingForOnChange();
                    }
                }
                else {
                    $("#ddlDepartment").prop("disabled", true);
                    $("#ddlCourseType").prop("disabled", true);
                    $("#ddlProgram").prop("disabled", true);
                }
            }
            else {
                alert("There is some problem in server to process your request, please try after login !");
            }

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
