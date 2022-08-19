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

function fnNext() {
    SubmitData();
}

function SubmitData() {
    //document.getElementById("btnSubmit").disabled = true;
    if (!ValidateForm()) {
        return;
    }

    var temp = "Mohan";
    var AppID = "";
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
    debugger;
    var datavar = {
        'aadhaarNumber': uid,
        'RegistrationNumber': $('#txtRegistrationNo').val(),
        'AdmissionYear': $('#drpAdmisionYear').val(),
        'Semester': $('#drpSemester').val(),
        'TypeOfInstitute': $('#drpInstituteType').val(),
        'InstituteName': $('#drpInstitutionName').val(),
        'Branch': $('#drpBranchName').val(),
        'DateOfDeath': $('#DODGuardian').val(),
        'Category': $('#drpCategory').val(),
        'AnnualIncome': $('#txtAnnualIncome').val(),
        'TuitionFee': $('#txtTuitionFee').val(),
        'DevelopmentFee': $('#txtDevelopmentFee').val(),
        'ExaminationFee': $('#txtExaminationFee').val(),
        'StudyBooks': $('#txtStudyBooks').val(),
        'StudyMaterial': $('#txtStudyMaterial').val(),
        'Conveyance': $('#txtConveyance').val(),
        'GovHostelCharges': $('#txtHostelRentElect').val(),
        'GovHostelDevFee': $('#txtHostelContDevFee').val(),
        'PriHostelType': $('#drpHostelType').val(),
        'PriHostelDevFee': $('#txtPriAnnualIncome').val(),
        'PrerenaScheme': $('#txtPreranaScheme').val(),
        'TuitionFeeWaiver': $('#drpTuitionFeeWaiver').val(),
        'StudentType': $('#drpStudentType').val(),
        'KiloMeter': $('#drpConveyanceKm').val(),
        'TotalFeeAmt': $('#txtTotalFee').val(),
        'BankName': $('#txtBankName').val(),
        'AccountHolderName': $('#txtAcHolderName').val(),
        'BankAccountNo': $('#txtBankAcNo').val(),
        'BankIFSCcode': $('#txtBankIFSCode').val(),
        'IssuingAuthorityName': $('#txtIssuingAuthority').val(),
        'IssuingAddress': $('#txtAddress').val(),
        'IssuingContactNo': $('#txtContactNo').val(),
        'IssuingEmailId': $('#txtEmailid').val(),
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

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/DTE/FinancingAssistanceForm1.aspx/InsertFinancialAssistance',
            data: $.stringify(obj, null, 4),
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
            if (result /*&& jqXHRData_IMG_result*/) {
                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=401&AppID=' + obj.AppID + '&UID=' + uid;
            }
        });// end of Then function of main Data Insert Function

    return false;
}

$(document).ready(function () {

    $("#drpAdmisionYear").bind("change", function (e) {
        $("#DODGuardian").datepicker("destroy");
        var value = 0, intval = 0, year = 0;
        value = $('#drpAdmisionYear').val();
        intval = parseInt(value);
        year = intval + 3;
        $('#DODGuardian').datepicker({
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            //maxDate: '0',
            yearRange: "" + intval + ":" + year + "",
            onSelect: function (date) {
                //var day = date.getDay();return [day == day1];
            }
        });
    });

    $('#PreranaScheme').hide();
    $('#ddlGovinstitude').hide();
    $('#ddlpriinstitude').hide();
    $('#Transportation').show();
    $("#drpStudentType").val('0');
    $("#drpStudentType").prop('disabled', true);
    $("#drpConveyanceKm").prop('disabled', true);
    $("#txtConveyance").prop('disabled', true);
    $("#drpHostelType").prop('disabled', true);
    $("#txtPriAnnualIncome").prop('disabled', true);

    $("#drpCategory").bind("change", function (e) {
        if ($("#drpCategory").val() == "General" || $("#drpCategory").val() == "0" || $("#drpCategory").val() == "-Select-") {
            $('#PreranaScheme').hide();
        }
        else {
            $('#PreranaScheme').show();
        }
    });

    $("#drpStudentType").bind("change", function (e) {
        if ($('#drpInstituteType' == "Private")) {
            if ($("#drpStudentType").val() == "DayScholar") {
                $("#drpHostelType").prop('disabled', true);
                $("#txtPriAnnualIncome").prop('disabled', true);
                $("#drpHostelType").val('0');
                $("#txtPriAnnualIncome").val('');
                $("#drpConveyanceKm").prop('disabled', false);
                $("#txtConveyance").prop('disabled', false);
            }
            else if ($("#drpStudentType").val() == "HostelBorders") {
                $("#drpConveyanceKm").prop('disabled', true);
                $("#txtConveyance").prop('disabled', true);
                $("#drpConveyanceKm").val('0');
                $("#txtConveyance").val('');
                $("#drpHostelType").prop('disabled', false);
                $("#txtPriAnnualIncome").prop('disabled', false);
            }
            else {
                $("#drpConveyanceKm").val('0');
                $("#txtConveyance").val('');
                $("#drpHostelType").val('0');
                $("#txtPriAnnualIncome").val('');
                $("#drpConveyanceKm").prop('disabled', true);
                $("#txtConveyance").prop('disabled', true);
                $("#drpHostelType").prop('disabled', true);
                $("#txtPriAnnualIncome").prop('disabled', true);
            }
        }

        if ($('#drpInstituteType').val() == "Government") {
            if ($("#drpStudentType").val() == "DayScholar") {
                $("#txtHostelRentElect").prop('disabled', true);
                $("#txtHostelContDevFee").prop('disabled', true);
                $("#drpConveyanceKm").prop('disabled', true);
                $("#txtConveyance").prop('disabled', true);
            }
            else if ($("#drpStudentType").val() == "HostelBorders") {
                $("#drpConveyanceKm").prop('disabled', true);
                $("#txtConveyance").prop('disabled', true);
                $("#txtHostelRentElect").prop('disabled', false);
                $("#txtHostelContDevFee").prop('disabled', false);
            }
            else {
                $("#drpConveyanceKm").val('0');
                $("#txtConveyance").val('');
                $("#txtHostelRentElect").val('');
                $("#txtHostelContDevFee").val('');
                $("#txtHostelRentElect").prop('disabled', true);
                $("#txtHostelContDevFee").prop('disabled', true);
                $("#drpConveyanceKm").prop('disabled', true);
                $("#txtConveyance").prop('disabled', true);
            }
        }
    });


    $("#drpInstituteType").bind("change", function (e) {
        if ($("#drpInstituteType").val() == "Government") {
            $("#drpStudentType").val('0');
            $("#drpStudentType").prop('disabled', false);
            $('#txtTuitionFee').val(2500);
            $('#txtDevelopmentFee').val(2000);
            $('#txtExaminationFee').val(500);
            $("#txtHostelRentElect").prop('disabled', true)
            $("#txtHostelContDevFee").prop('disabled', true);
        }
        else if ($("#drpInstituteType").val() == "Private") {
            $("#drpStudentType").val('0');
            $("#drpStudentType").prop('disabled', false);
            $('#txtTuitionFee').val(20000);
            $('#txtDevelopmentFee').val(5800);
            $('#txtExaminationFee').val(500);
        }
        else {
            $("#drpStudentType").val('0');
            $("#drpStudentType").prop('disabled', true);
            $('#txtTuitionFee').val('');
            $('#txtDevelopmentFee').val('');
            $('#txtExaminationFee').val('');
            $('#txtStudyBooks').val('');
            $('#txtStudyMaterial').val('');
        }

        var institudetype = $('#drpInstituteType :selected').val();
        if (institudetype == "Private") {
            $("#drpConveyanceKm").bind("change", function (e) {
                if ($("#drpConveyanceKm").val() == "Upto20km") {
                    $('#txtConveyance').val(8000);
                }
                else if ($("#drpConveyanceKm").val() == "Beyond20km") {
                    $('#txtConveyance').val(12000);
                }
                else {
                    $('#txtConveyance').val('');
                }
            });
        }
    });
});

function ValidateForm() {
    var text = "";
    var opt = "";

    var RegistrationNo = $('#txtRegistrationNo').val();
    var AdmisionYear = $('#drpAdmisionYear').val();
    var Semester = $('#drpSemester').val();
    var InstituteType = $('#drpInstituteType').val();
    var InstitutionName = $('#drpInstitutionName').val();
    var BranchName = $('#drpBranchName').val();
    var DOD = $('#DODGuardian').val();
    var Category = $('#drpCategory').val();
    var AnnualIncome = $('#txtAnnualIncome').val();
    var TuitionFee = $('#txtTuitionFee').val();
    var DevelopmentFee = $('#txtDevelopmentFee').val();
    var ExaminationFee = $('#txtExaminationFee').val();
    var StudyBooks = $('#txtStudyBooks').val();
    var StudyMaterial = $('#txtStudyMaterial').val();
    var Conveyance = $('#txtConveyance').val();
    var HostelRentElect = $('#txtHostelRentElect').val();
    var HostelContDevFee = $('#txtHostelContDevFee').val();
    var HostelType = $('#drpHostelType').val();
    var PriAnnualIncome = $('#txtPriAnnualIncome').val();
    var PreranaScheme = $('#txtPreranaScheme').val();
    var TuitionFeeWaiver = $('#drpTuitionFeeWaiver').val();
    var TuitionFeeAmt = $('#txtTuitionFeeAmt').val();
    var ConveyanceKm = $('#drpConveyanceKm').val();
    var TotalFee = $('#txtTotalFee').val();


    if (InstituteType == null || InstituteType == " " || InstituteType == "0") {
        text += "<br /> -Please select InstituteType.";
        $('#drpInstituteType').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstituteType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstituteType != null) {
        $('#drpInstituteType').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstituteType').css({ "background-color": "#ffffff" });
    }


    if (RegistrationNo == null || RegistrationNo == '') {
        text += "<br /> -Please Enter RegistrationNo ";
        $('#txtRegistrationNo').attr('style', 'border:1px solid red !important;');
        $('#txtRegistrationNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRegistrationNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRegistrationNo').css({ "background-color": "#ffffff" });
    }


    if (AdmisionYear == null || AdmisionYear == " " || AdmisionYear == "0") {
        text += "<br /> -Please select AdmisionYear.";
        $('#drpAdmisionYear').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpAdmisionYear').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (AdmisionYear != null) {
        $('#drpAdmisionYear').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpAdmisionYear').css({ "background-color": "#ffffff" });
    }


    if (Semester == null || Semester == " " || Semester == "0") {
        text += "<br /> -Please select Semester.";
        $('#drpSemester').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpSemester').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Semester != null) {
        $('#drpSemester').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpSemester').css({ "background-color": "#ffffff" });
    }


    if (DOD == null || DOD == "") {
        text += "<br /> -Please select DODGuardian.";
        $('#DODGuardian').attr('style', 'border:1px solid #d03100 !important;');
        $('#DODGuardian').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (DOD != null) {
        $('#DODGuardian').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#DODGuardian').css({ "background-color": "#ffffff" });
    }


    if (AnnualIncome == null || AnnualIncome == '') {
        text += "<br /> -Please Enter AnnualIncome ";
        $('#txtAnnualIncome').attr('style', 'border:1px solid red !important;');
        $('#txtAnnualIncome').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAnnualIncome').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAnnualIncome').css({ "background-color": "#ffffff" });
    }


    if (InstitutionName == null || InstitutionName == " " || InstitutionName == "0") {
        text += "<br /> -Please select InstitutionName.";
        $('#drpInstitutionName').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstitutionName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstitutionName != null) {
        $('#drpInstitutionName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstitutionName').css({ "background-color": "#ffffff" });
    }
    if (BranchName == null || BranchName == " " || BranchName == "0") {
        text += "<br /> -Please select BranchName.";
        $('#drpBranchName').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpBranchName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (BranchName != null) {
        $('#drpBranchName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpBranchName').css({ "background-color": "#ffffff" });
    }


    if (StudyBooks == null || StudyBooks == '') {
        text += "<br /> -Please Enter StudyBooks ";
        $('#txtStudyBooks').attr('style', 'border:1px solid red !important;');
        $('#txtStudyBooks').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtStudyBooks').attr('style', 'border:1px solid #ddd !important;');
        $('#txtStudyBooks').css({ "background-color": "#ffffff" });
    }


    if (StudyMaterial == null || StudyMaterial == '') {
        text += "<br /> -Please Enter StudyMaterial ";
        $('#txtStudyMaterial').attr('style', 'border:1px solid red !important;');
        $('#txtStudyMaterial').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtStudyMaterial').attr('style', 'border:1px solid #ddd !important;');
        $('#txtStudyMaterial').css({ "background-color": "#ffffff" });
    }


    if (Category == null || Category == " " || Category == "0") {
        text += "<br /> -Please select Category.";
        $('#drpCategory').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpCategory').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Category != null) {
        $('#drpCategory').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpCategory').css({ "background-color": "#ffffff" });
    }


    if (TuitionFee == null || TuitionFee == '') {
        text += "<br /> -Please Enter TuitionFee ";
        $('#txtTuitionFee').attr('style', 'border:1px solid red !important;');
        $('#txtTuitionFee').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtTuitionFee').attr('style', 'border:1px solid #ddd !important;');
        $('#txtTuitionFee').css({ "background-color": "#ffffff" });
    }

    if (DevelopmentFee == null || DevelopmentFee == '') {
        text += "<br /> -Please Enter DevelopmentFee ";
        $('#txtDevelopmentFee').attr('style', 'border:1px solid red !important;');
        $('#txtDevelopmentFee').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDevelopmentFee').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDevelopmentFee').css({ "background-color": "#ffffff" });
    }

    if (ExaminationFee == null || ExaminationFee == '') {
        text += "<br /> -Please Enter ExaminationFee ";
        $('#txtExaminationFee').attr('style', 'border:1px solid red !important;');
        $('#txtExaminationFee').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtExaminationFee').attr('style', 'border:1px solid #ddd !important;');
        $('#txtExaminationFee').css({ "background-color": "#ffffff" });
    }


    var StudentType = $('#drpStudentType').val();
    if (InstituteType == "Private" || InstituteType == "Government") {
        if (StudentType == "0" || StudentType == "-Select-") {
            text += "<br /> -Please Select Student Type ";
            $('#drpStudentType').attr('style', 'border:1px solid red !important;');
            $('#drpStudentType').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#drpStudentType').attr('style', 'border:1px solid #ddd !important;');
            $('#drpStudentType').css({ "background-color": "#ffffff" });
        }

        if (InstituteType == "Private" && StudentType == "DayScholar") {
            debugger;
            if (ConveyanceKm == "0" || ConveyanceKm == "-Km-") {
                text += "<br /> -Please Enter ConveyanceKm ";
                $('#drpConveyanceKm').attr('style', 'border:1px solid red !important;');
                $('#drpConveyanceKm').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#drpConveyanceKm').attr('style', 'border:1px solid #ddd !important;');
                $('#drpConveyanceKm').css({ "background-color": "#ffffff" });
            }

            if (Conveyance == null || Conveyance == '') {
                text += "<br /> -Please Enter Conveyance Amount";
                $('#txtConveyance').attr('style', 'border:1px solid red !important;');
                $('#txtConveyance').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtConveyance').attr('style', 'border:1px solid #ddd !important;');
                $('#txtConveyance').css({ "background-color": "#ffffff" });
            }
        }

        if (InstituteType == "Private" && StudentType == "HostelBorders") {
            if (HostelType == "0" || ConveyanceKm == "-Select-") {
                text += "<br /> -Please Select Hostel Type ";
                $('#drpHostelType').attr('style', 'border:1px solid red !important;');
                $('#drpHostelType').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#drpHostelType').attr('style', 'border:1px solid #ddd !important;');
                $('#drpHostelType').css({ "background-color": "#ffffff" });
            }

            if (AnnualIncome == null || AnnualIncome == '') {
                text += "<br /> -Please Enter Hostel Amount ";
                $('#txtPriAnnualIncome').attr('style', 'border:1px solid red !important;');
                $('#txtPriAnnualIncome').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtPriAnnualIncome').attr('style', 'border:1px solid #ddd !important;');
                $('#txtPriAnnualIncome').css({ "background-color": "#ffffff" });
            }
        }
    }


    if (InstituteType == "Government" && StudentType == "HostelBorders") {
        if (HostelRentElect == null || HostelRentElect == '') {
            text += "<br /> -Please Enter Hostel Seat Rent & Electricity Charges ";
            $('#txtHostelRentElect').attr('style', 'border:1px solid red !important;');
            $('#txtHostelRentElect').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtHostelRentElect').attr('style', 'border:1px solid #ddd !important;');
            $('#txtHostelRentElect').css({ "background-color": "#ffffff" });
        }

        if (HostelContDevFee == null || HostelContDevFee == '') {
            text += "<br /> -Please Enter Hostel Contingency & Dev.Fee ";
            $('#txtHostelContDevFee').attr('style', 'border:1px solid red !important;');
            $('#txtHostelContDevFee').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtHostelContDevFee').attr('style', 'border:1px solid #ddd !important;');
            $('#txtHostelContDevFee').css({ "background-color": "#ffffff" });
        }
    }


    if (Category == "SC" || Category == "ST") {
        if (PreranaScheme == null || PreranaScheme == '') {
            text += "<br /> -Please Enter PreranaScheme ";
            $('#txtPreranaScheme').attr('style', 'border:1px solid red !important;');
            $('#txtPreranaScheme').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtPreranaScheme').attr('style', 'border:1px solid #ddd !important;');
            $('#txtPreranaScheme').css({ "background-color": "#ffffff" });
        }
    }

    if (TuitionFeeWaiver == null || TuitionFeeWaiver == " " || TuitionFeeWaiver == "0") {
        text += "<br /> -Please Enter TuitionFeeWaiver ";
        $('#drpTuitionFeeWaiver').attr('style', 'border:1px solid red !important;');
        $('#drpTuitionFeeWaiver').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpTuitionFeeWaiver').attr('style', 'border:1px solid #ddd !important;');
        $('#drpTuitionFeeWaiver').css({ "background-color": "#ffffff" });
    }


    var BankName = $('#txtBankName').val();
    if (BankName == null || BankName == '') {
        text += "<br /> -Please Enter Bank Name.";
        $('#txtBankName').attr('style', 'border:1px solid red !important;');
        $('#txtBankName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankName').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankName').css({ "background-color": "#ffffff" });
    }


    var AccountHolderName = $('#txtAcHolderName').val();
    if (AccountHolderName == null || AccountHolderName == '') {
        text += "<br /> -Please Enter Bank Name.";
        $('#txtAcHolderName').attr('style', 'border:1px solid red !important;');
        $('#txtAcHolderName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAcHolderName').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAcHolderName').css({ "background-color": "#ffffff" });
    }


    var BankAcNo = $('#txtBankAcNo').val();
    if (BankAcNo == null || BankAcNo == '') {
        text += "<br /> -Please Enter Bank Account No.";
        $('#txtBankAcNo').attr('style', 'border:1px solid red !important;');
        $('#txtBankAcNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankAcNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankAcNo').css({ "background-color": "#ffffff" });

        if (BankAcNo.length > 12 || BankAcNo.length < 12) {
            text += "<br /> -Bank Account No. should be 12 digit";
            $('#txtBankAcNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtBankAcNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtBankAcNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtBankAcNo').css({ "background-color": "#ffffff" });
        }
    }

    var BankIFSCode = $('#txtBankIFSCode').val();
    if (BankIFSCode == null || BankIFSCode == '') {
        text += "<br /> -Please Enter Bank IFSC Code.";
        $('#txtBankIFSCode').attr('style', 'border:1px solid red !important;');
        $('#txtBankIFSCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankIFSCode').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankIFSCode').css({ "background-color": "#ffffff" });
    }

    var IssuingAuthority = $('#txtIssuingAuthority').val();
    if (IssuingAuthority == null || IssuingAuthority == '') {
        text += "<br /> -Please Enter Name of Issuing Authority.";
        $('#txtIssuingAuthority').attr('style', 'border:1px solid red !important;');
        $('#txtIssuingAuthority').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtIssuingAuthority').attr('style', 'border:1px solid #ddd !important;');
        $('#txtIssuingAuthority').css({ "background-color": "#ffffff" });
    }

    var Address = $('#txtAddress').val();
    if (Address == null || Address == '') {
        text += "<br /> -Please Enter Address Issuing Authority.";
        $('#txtAddress').attr('style', 'border:1px solid red !important;');
        $('#txtAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAddress').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAddress').css({ "background-color": "#ffffff" });
    }

    var ContactNo = $('#txtContactNo').val();
    if (ContactNo == null || ContactNo == '') {
        text += "<br /> -Please Enter Issuing Authority Contact No (both Desk and Cell).";
        $('#txtContactNo').attr('style', 'border:1px solid red !important;');
        $('#txtContactNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtContactNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtContactNo').css({ "background-color": "#ffffff" });
    }

    var EmailId = $('#txtEmailid').val();
    if (EmailId == null || EmailId == '') {
        text += "<br /> -Please Enter EmailId Issuing Authority.";
        $('#txtEmailid').attr('style', 'border:1px solid red !important;');
        $('#txtEmailid').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtEmailid').attr('style', 'border:1px solid #ddd !important;');
        $('#txtEmailid').css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function SelectInstitude() {

    var institudetype = $('#drpInstituteType :selected').val();
    var HostelRentElect = $('#txtHostelRentElect').val();
    var HostelContDevFee = $('#txtHostelContDevFee').val();
    var Conveyance = $('#txtConveyance').val();
    var Category = $('#drpCategory').val();
    var TuitionFeeWaiver = $('#drpTuitionFeeWaiver').val();
    var TuitionFeeAmt = $('#txtTuitionFeeAmt').val();
    var ConveyanceKm = $('#drpConveyanceKm').val();

    if (institudetype != 0) {
        if (institudetype == 'Government') {
            $('#ddlGovinstitude').show();
            $('#ddlpriinstitude').hide();
        }
        else {
            $('#ddlpriinstitude').show();
            $('#ddlGovinstitude').hide();
        }
        if (institudetype == 'Private') {

            $('#ddlpriinstitude').show();
            $('#ddlGovinstitude').hide();
        }
        else {
            $('#ddlGovinstitude').show();
            $('#ddlpriinstitude').hide();
        }
    }
    else {
        $('#ddlGovinstitude').hide();
        $('#ddlpriinstitude').hide();
    }
}//show hide

function GovernmentIncome() {
    var text = "";
    var opt = "";

    var InstituteType = $('#drpInstituteType').val();
    var tutionfee = $('#txtTuitionFee').val();
    var DevelopmentFee = $('#txtDevelopmentFee').val();
    var Conveyance = $('#txtConveyance').val();
    var ConveyanceKm = $('#drpConveyanceKm').val();
    var HostelType = $('#drpHostelType').val();
    var HostelRentElect = $('#txtHostelRentElect').val();
    var HostelContDevFee = $('#txtHostelContDevFee').val();
    var Semester = $('#drpSemester').val();
    var ExaminationFee = $('#txtExaminationFee').val();
    var PriAnnualIncome = $('#txtPriAnnualIncome').val();
    var TotalFee = $('#txtTotalFee').val();


    if (InstituteType == "Private") {
        if (HostelType == "-Select-" || HostelType == "0") {
            $('#drpHostelType').attr('style', 'border:1px solid #d03100 !important;');
            $('#drpHostelType').css({ "background-color": "#fff2ee" });
            $('#txtPriAnnualIncome').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtPriAnnualIncome').css({ "background-color": "#fff2ee" });
            $('#txtPriAnnualIncome').val('');
        }
        else {
            $('#drpHostelType').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#drpHostelType').css({ "background-color": "#ffffff" });
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function Studymaterial() {
    var text = "";
    var opt = "";
    var StudyBooks = $('#txtStudyBooks').val();
    var StudyMaterial = $('#txtStudyMaterial').val();

    if (StudyBooks !== null || StudyBooks !== "") {
        if (StudyBooks <= 5000) {
            $('#txtStudyBooks').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtStudyBooks').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Ammount of Study Book is Greater than or equal to 5000";
            $('#txtStudyBooks').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtStudyBooks').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }
    if (StudyMaterial !== null || StudyMaterial !== "") {
        if (StudyMaterial <= 5000) {
            $('#txtStudyMaterial').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtStudyMaterial').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Ammount of Study material is Greater than or equal to 5000";
            $('#txtStudyMaterial').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtStudyMaterial').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;

}//Study material amount

function AnnualIncome() {

    var text = "";
    var opt = "";
    var AnnualIncome = $('#txtAnnualIncome').val();

    if (AnnualIncome !== null || AnnualIncome !== "") {
        if (AnnualIncome <= 600000) {
            $('#txtAnnualIncome').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtAnnualIncome').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Annual Income should be Rs 600000)";
            $('#txtAnnualIncome').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtAnnualIncome').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function RegistrationNo() {
    var text = "";
    var opt = "";
    var RegistrationNo = document.getElementById('txtRegistrationNo').value;
    debugger;
    if (RegistrationNo.length > 12 || RegistrationNo.length < 12) {
        // alert("Mobile No. should be 10 digit");
        text += "<br /> -Registration No. should be 12 digit";
        $('#txtRegistrationNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistrationNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#txtRegistrationNo').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistrationNo').css({ "background-color": "#ffffff" });

        if (!(RegistrationNo.charAt(0) == "F" || RegistrationNo.charAt(0) == "L" || RegistrationNo.charAt(0) == "f" || RegistrationNo.charAt(0) == "l")) {
            // alert("Mobile No. should start with 9 ,8 or 7 ");
            text += "<br /> -Registration No. should start with F and L";
            $('#txtRegistrationNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistrationNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtRegistrationNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistrationNo').css({ "background-color": "#ffffff" });
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GovHostelcharge() {
    debugger;
    var text = "";
    var opt = "";

    var HostelRentElect = $('#txtHostelRentElect').val();
    var HostelContDevFee = $('#txtHostelContDevFee').val();

    if (HostelRentElect <= 2000) {
        $('#txtHostelRentElect').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtHostelRentElect').css({ "background-color": "#ffffff" });
    }
    else {
        text += "<br /> -Please Enter Hostel Rent Electricity ammount 2000";
        $('#txtHostelRentElect').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtHostelRentElect').css({ "background-color": "#fff2ee" });

        opt = 1;
    }
    if (HostelContDevFee <= 1000) {
        $('#txtHostelContDevFee').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtHostelContDevFee').css({ "background-color": "#ffffff" });
    }
    else {
        text += "<br /> -Please Enter Government  Hostel Contingency Fee 1000";
        $('#txtHostelContDevFee').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtHostelContDevFee').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GrandTotale() {
    debugger;
    var TuitionFeeWaiver = $('#drpTuitionFeeWaiver').val();
    var TuitionFee = $('#txtTuitionFee').val();
    var DevelopmentFee = $('#txtDevelopmentFee').val();
    var ExaminationFee = $('#txtExaminationFee').val();
    var StudyBooks = $('#txtStudyBooks').val();
    var StudyMaterial = $('#txtStudyMaterial').val();
    var Conveyance = $('#txtConveyance').val();
    var HostelRentElect = $('#txtHostelRentElect').val();
    var HostelContDevFee = $('#txtHostelContDevFee').val();
    var TotalFee = $('#txtTotalFee').val();
    var HostelCharges =$('#txtPriAnnualIncome').val();

    if (Conveyance == "" || Conveyance == null) {
        Conveyance = "0";
    }

    if (HostelRentElect == "" || HostelRentElect == null) {
        HostelRentElect = "0";
    }

    if (HostelContDevFee == "" || HostelContDevFee == null) {
        HostelContDevFee = "0";
    }

    if (HostelCharges == "" || HostelCharges == null) {
        HostelCharges = "0";
    }

    debugger;
    if (TuitionFeeWaiver == "No") {
        var TotalFee = parseInt(TuitionFee) + parseInt(DevelopmentFee) + parseInt(ExaminationFee) + parseInt(StudyBooks) + parseInt(StudyMaterial) + parseInt(Conveyance) + parseInt(HostelRentElect) + parseInt(HostelContDevFee) + parseInt(HostelCharges)
        var SumTotal = (TotalFee > 0) ? TotalFee : 0;
        $('#txtTotalFee').val(SumTotal);
    }
    else if (TuitionFeeWaiver == "Yes") {
        var TotalFee = parseInt(DevelopmentFee) + parseInt(ExaminationFee) + parseInt(Conveyance) + parseInt(StudyBooks) + parseInt(StudyMaterial) + parseInt(HostelRentElect) + parseInt(HostelContDevFee) + parseInt(HostelCharges) + parseInt(TuitionFee) - parseInt(TuitionFee)
        var SumTotal = (TotalFee < 0) ? 0 : TotalFee;
        $('#txtTotalFee').val(SumTotal);
    }
    else {
        $('#txtTotalFee').val('');
    }
}

function GetInstituteName() {
    var InstituteType = $('#drpInstituteType').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm1.aspx/InstituteData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpInstitutionName]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpInstitutionName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetBranchName() {
    var InstituteType = $('#drpInstituteType').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm1.aspx/BranchData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpBranchName]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpBranchName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function ConvenceKm() {
    debugger;
    var text = "";
    var opt = "";
    var institudetype = $('#drpInstituteType :selected').val();
    if (institudetype == "Private") {
        if ($("#drpConveyanceKm").val() == "Upto20km") {
            if ($('#txtConveyance').val() <= 8000) {
                $('#txtConveyance').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtConveyance').css({ "background-color": "#ffffff" });
            }
            else {
                text += "<br /> -Amount Should Not Exceed 8000.";
                $('#txtConveyance').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtConveyance').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
        }
        else if ($("#drpConveyanceKm").val() == "Beyond20km") {
            if ($('#txtConveyance').val() <= 12000) {
                $('#txtConveyance').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtConveyance').css({ "background-color": "#ffffff" });
            }
            else {
                text += "<br /> -Amount Should Not Exceed 12000.";
                $('#txtConveyance').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtConveyance').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
        }
        else {
            $('#txtConveyance').val('');
            $('#txtConveyance').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtConveyance').css({ "background-color": "#ffffff" });
        }
    }
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function OnchangeFunction() {
    SelectInstitude();
    GovernmentIncome();
    GetInstituteName();
    GetBranchName();
}



function AllowIFSCode() {

    var text = "";
    var opt = "";

    var Servicetype = $('#drpSelectService :selected').val();
    var reg = /^[A-Z|a-z]{4}[0][0-9]{6}$/;

    if (Servicetype == "Service1") {
        var ifsc = document.getElementById('txtBankIFSCode').value;

        if (ifsc.match(reg)) {
            $('#txtBankIFSCode').attr('style', 'border:1px solid #ddd !important;');
            $('#txtBankIFSCode').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Correct IFSC Code(IFSC0XXXXXX).";
            $('#txtBankIFSCode').attr('style', 'border:1px solid red !important;');
            $('#txtBankIFSCode').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }


    if (Servicetype == "Service2") {
        var ifsc2 = document.getElementById('txtBankIFSCode2').value;

        if (ifsc2.match(reg)) {
            $('#txtBankIFSCode2').attr('style', 'border:1px solid #ddd !important;');
            $('#txtBankIFSCode2').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Correct IFSC Code(IFSC0XXXXXX).";
            $('#txtBankIFSCode2').attr('style', 'border:1px solid red !important;');
            $('#txtBankIFSCode2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (Servicetype == "Service3") {
        var ifsc2 = document.getElementById('txtBankIFSCode3').value;

        if (ifsc2.match(reg)) {
            $('#txtBankIFSCode3').attr('style', 'border:1px solid #ddd !important;');
            $('#txtBankIFSCode3').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Correct IFSC Code(IFSC0XXXXXX).";
            $('#txtBankIFSCode3').attr('style', 'border:1px solid red !important;');
            $('#txtBankIFSCode3').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function EmailValidation() {
    var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{2,}))$/;
    var text = "";
    var opt = "";
    var Servicetype = $('#drpSelectService :selected').val();
    debugger;
    if (Servicetype == "Service1") {
        var emailid1 = document.getElementById('txtEmailid').value;
        if (emailid1.match(reg)) {
            $('#txtEmailid').attr('style', 'border:1px solid #ddd !important;');
            $('#txtEmailid').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Email-Id in Correct Format";
            $('#txtEmailid').attr('style', 'border:1px solid red !important;');
            $('#txtEmailid').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (Servicetype == "Service2") {
        var emailid2 = document.getElementById('txtEmailid2').value;

        if (emailid2.match(reg)) {
            $('#txtEmailid2').attr('style', 'border:1px solid #ddd !important;');
            $('#txtEmailid2').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Email-Id in Correct Format";
            $('#txtEmailid2').attr('style', 'border:1px solid red !important;');
            $('#txtEmailid2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (Servicetype == "Service3") {
        var emailid3 = document.getElementById('txtEmailid3').value;

        if (emailid3.match(reg)) {
            $('#txtEmailid3').attr('style', 'border:1px solid #ddd !important;');
            $('#txtEmailid3').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Email-Id in Correct Format";
            $('#txtEmailid3').attr('style', 'border:1px solid red !important;');
            $('#txtEmailid3').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (Servicetype == "Service4") {
        var emailid4 = document.getElementById('txtEmailid4').value;

        if (emailid4.match(reg)) {
            $('#txtEmailid4').attr('style', 'border:1px solid #ddd !important;');
            $('#txtEmailid4').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Email-Id in Correct Format";
            $('#txtEmailid4').attr('style', 'border:1px solid red !important;');
            $('#txtEmailid4').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function MobileValidation() {
    var emailid = document.getElementById('btnmobile').value;
    if (isNaN(emailid) || emailid.indexOf(" ") != -1) {
        alert("Invalid Mobile No.");
        return false;
    }
    if (emailid.length > 10 || emailid.length < 10) {
        alert("Mobile No. should be 10 digit");

        return false;
    }
    if (!(emailid.charAt(0) == "9" || emailid.charAt(0) == "8" || emailid.charAt(0) == "7")) {
        alert("Mobile No. should start with 9 ,8 or 7 ");

        return false
    }

}



function SubmitData2() {
    if (!ValidateForm2()) {
        return;
    }

    var temp = "Mohan";
    var AppID = "";
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

    var datavar = {
        'aadhaarNumber': uid,
        'RegistrationNumber': $('#txtRegistrationNo2').val(),
        'AdmissionYear': $('#drpAdmisionYear2').val(),
        'Semester': $('#drpSemester2').val(),
        'Branch': $('#drpBranchName2').val(),
        'TypeOfInstitute': $('#drpInstituteType2').val(),
        'InstituteName': $('#drpInstitutionName2').val(),
        'Category': $('#drpCategory2').val(),
        'AnnualIncome': $('#txtAnnualIncome2').val(),
        'FinancingGuardianName': $('#txtFinancingGuardianName').val(),
        'FinancingGuardianRelation': $('#txtFinancingGuardianRelation').val(),
        'BankName': $('#txtBankName2').val(),
        'AccountHolderName': $('#txtAcHolderName2').val(),
        'BankAccountNo': $('#txtBankAcNo2').val(),
        'BankIFSCcode': $('#txtBankIFSCode2').val(),
        'IssuingAuthorityName': $('#txtIssuingAuthority2').val(),
        'IssuingAddress': $('#txtAddress2').val(),
        'IssuingContactNo': $('#txtContactNo2').val(),
        'IssuingEmailId': $('#txtEmailid2').val(),
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

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/DTE/FinancingAssistanceForm2.aspx/InsertFinancialAssistance2',
            data: $.stringify(obj, null, 4),
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

            if (result /*&& jqXHRData_IMG_result*/) {
                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=402&AppID=' + obj.AppID + '&UID=' + uid;
            }
        });// end of Then function of main Data Insert Function

    return false;
}

function ValidateForm2() {
    debugger;
    var text = "";
    var opt = "";


    var RegistrationNo = $('#txtRegistrationNo2').val();
    var AdmisionYear = $('#drpAdmisionYear2').val();
    var Semester = $('#drpSemester2').val();
    var InstituteType = $('#drpInstituteType2').val();
    var InstitutionName = $('#drpInstitutionName2').val();
    var BranchName = $('#drpBranchName2').val();
    var Category = $('#drpCategory2').val();
    var AnnualIncome = $('#txtAnnualIncome2').val();
    var FinancingGuardianName = $('#txtFinancingGuardianName').val();
    var FinancingGuardianRelation = $('#txtFinancingGuardianRelation').val();

    if (RegistrationNo == null || RegistrationNo == '') {
        text += "<br /> -Please Enter RegistrationNo ";
        $('#txtRegistrationNo2').attr('style', 'border:1px solid red !important;');
        $('#txtRegistrationNo2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRegistrationNo2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRegistrationNo2').css({ "background-color": "#ffffff" });
    }

    if (AdmisionYear == null || AdmisionYear == " " || AdmisionYear == "0") {
        text += "<br /> -Please select AdmisionYear.";
        $('#drpAdmisionYear2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpAdmisionYear2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (AdmisionYear != null) {
        $('#drpAdmisionYear2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpAdmisionYear2').css({ "background-color": "#ffffff" });
    }

    if (Semester == null || Semester == " " || Semester == "0") {
        text += "<br /> -Please select Semester.";
        $('#drpSemester2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpSemester2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Semester != null) {
        $('#drpSemester2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpSemester2').css({ "background-color": "#ffffff" });
    }
    if (InstituteType == null || InstituteType == " " || InstituteType == "0") {
        text += "<br /> -Please select InstituteType.";
        $('#drpInstituteType2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstituteType2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstituteType != null) {
        $('#drpInstituteType2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstituteType2').css({ "background-color": "#ffffff" });
    }

    if (InstitutionName == null || InstitutionName == " " || InstitutionName == "0") {
        text += "<br /> -Please select InstitutionName.";
        $('#drpInstitutionName2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstitutionName2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstitutionName != null) {
        $('#drpInstitutionName2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstitutionName2').css({ "background-color": "#ffffff" });
    }

    if (BranchName == null || BranchName == " " || BranchName == "0") {
        text += "<br /> -Please select BranchName.";
        $('#drpBranchName2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpBranchName2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (BranchName != null) {
        $('#drpBranchName2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpBranchName2').css({ "background-color": "#ffffff" });
    }

    if (FinancingGuardianName == null || FinancingGuardianName == "") {
        text += "<br /> -Please Enter Financing Guardian Name.";
        $('#txtFinancingGuardianName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFinancingGuardianName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (FinancingGuardianName != null) {
        $('#txtFinancingGuardianName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtFinancingGuardianName').css({ "background-color": "#ffffff" });
    }

    if (FinancingGuardianRelation == null || FinancingGuardianRelation == "") {
        text += "<br /> -Please Enter Financing Guardian Name.";
        $('#txtFinancingGuardianRelation').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFinancingGuardianRelation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (FinancingGuardianRelation != null) {
        $('#txtFinancingGuardianRelation').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtFinancingGuardianRelation').css({ "background-color": "#ffffff" });
    }

    if (Category == null || Category == " " || Category == "0") {
        text += "<br /> -Please select Category.";
        $('#drpCategory2').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpCategory2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Category != null) {
        $('#drpCategory2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpCategory2').css({ "background-color": "#ffffff" });
    }

    if (AnnualIncome == null || AnnualIncome == '') {
        text += "<br /> -Please Enter AnnualIncome ";
        $('#txtAnnualIncome2').attr('style', 'border:1px solid red !important;');
        $('#txtAnnualIncome2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAnnualIncome2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAnnualIncome2').css({ "background-color": "#ffffff" });
    }

    var BankName2 = $('#txtBankName2').val();
    if (BankName2 == null || BankName2 == '') {
        text += "<br /> -Please Enter Bank Name.";
        $('#txtBankName2').attr('style', 'border:1px solid red !important;');
        $('#txtBankName2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankName2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankName2').css({ "background-color": "#ffffff" });
    }


    var AccountHolderName2 = $('#txtAcHolderName2').val();
    if (AccountHolderName2 == null || AccountHolderName2 == '') {
        text += "<br /> -Please Enter Bank Name.";
        $('#txtAcHolderName2').attr('style', 'border:1px solid red !important;');
        $('#txtAcHolderName2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAcHolderName2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAcHolderName2').css({ "background-color": "#ffffff" });
    }


    var BankAcNo2 = $('#txtBankAcNo2').val();
    if (BankAcNo2 == null || BankAcNo2 == '') {
        text += "<br /> -Please Enter Bank Account No.";
        $('#txtBankAcNo2').attr('style', 'border:1px solid red !important;');
        $('#txtBankAcNo2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankAcNo2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankAcNo2').css({ "background-color": "#ffffff" });

        if (BankAcNo2.length > 12 || BankAcNo2.length < 12) {
            text += "<br /> -Bank Account No. should be 12 digit";
            $('#txtBankAcNo2').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtBankAcNo2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtBankAcNo2').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtBankAcNo2').css({ "background-color": "#ffffff" });
        }
    }

    var BankIFSCode2 = $('#txtBankIFSCode2').val();
    if (BankIFSCode2 == null || BankIFSCode2 == '') {
        text += "<br /> -Please Enter Bank IFSC Code.";
        $('#txtBankIFSCode2').attr('style', 'border:1px solid red !important;');
        $('#txtBankIFSCode2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankIFSCode2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankIFSCode2').css({ "background-color": "#ffffff" });
    }


    var IssuingAuthority2 = $('#txtIssuingAuthority2').val();
    if (IssuingAuthority2 == null || IssuingAuthority2 == '') {
        text += "<br /> -Please Enter Name of Issuing Authority.";
        $('#txtIssuingAuthority2').attr('style', 'border:1px solid red !important;');
        $('#txtIssuingAuthority2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtIssuingAuthority2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtIssuingAuthority2').css({ "background-color": "#ffffff" });
    }


    var Address2 = $('#txtAddress2').val();
    if (Address2 == null || Address2 == '') {
        text += "<br /> -Please Enter Address Issuing Authority.";
        $('#txtAddress2').attr('style', 'border:1px solid red !important;');
        $('#txtAddress2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAddress2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAddress2').css({ "background-color": "#ffffff" });
    }


    var ContactNo2 = $('#txtContactNo2').val();
    if (ContactNo2 == null || ContactNo2 == '') {
        text += "<br /> -Please Enter Issuing Authority Contact No (both Desk and Cell).";
        $('#txtContactNo2').attr('style', 'border:1px solid red !important;');
        $('#txtContactNo2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtContactNo2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtContactNo2').css({ "background-color": "#ffffff" });
    }


    var EmailId2 = $('#txtEmailid2').val();
    if (EmailId2 == null || EmailId2 == '') {
        text += "<br /> -Please Enter EmailId Issuing Authority.";
        $('#txtEmailid2').attr('style', 'border:1px solid red !important;');
        $('#txtEmailid2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtEmailid2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtEmailid2').css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function RegistrationNo2() {
    var text = "";
    var opt = "";
    var RegistrationNo = document.getElementById('txtRegistrationNo2').value;
    if (RegistrationNo.length > 12 || RegistrationNo.length < 12) {
        text += "<br /> -Registration No. should be 12 digit";
        $('#txtRegistrationNo2').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistrationNo2').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#txtRegistrationNo2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistrationNo2').css({ "background-color": "#ffffff" });

        if (!(RegistrationNo.charAt(0) == "F" || RegistrationNo.charAt(0) == "L" || RegistrationNo.charAt(0) == "f" || RegistrationNo.charAt(0) == "l")) {
            text += "<br /> -Registration No. should start with F and L";
            $('#txtRegistrationNo2').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistrationNo2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtRegistrationNo2').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistrationNo2').css({ "background-color": "#ffffff" });
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function AnnualIncome2() {

    var text = "";
    var opt = "";
    var AnnualIncome = $('#txtAnnualIncome2').val();

    if (AnnualIncome !== null || AnnualIncome !== "") {
        if (AnnualIncome <= 600000) {
            $('#txtAnnualIncome2').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtAnnualIncome2').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Annual Income should be Rs 600000)";
            $('#txtAnnualIncome2').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtAnnualIncome2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GetInstituteName2() {
    var InstituteType = $('#drpInstituteType2').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm1.aspx/InstituteData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpInstitutionName2]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType2]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpInstitutionName2]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetBranchName2() {
    var InstituteType = $('#drpInstituteType2').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm1.aspx/BranchData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpBranchName2]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType2]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpBranchName2]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function OnchangeFunction2() {
    GetInstituteName2();
    GetBranchName2();
}




function SubmitData3() {
    if (!ValidateForm3()) {
        return;
    }

    var temp = "Mohan";
    var AppID = "";
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

    var datavar = {
        'aadhaarNumber': uid,
        'RegistrationNumber': $('#txtRegistrationNo3').val(),
        'AdmissionYear': $('#drpAdmisionYear3').val(),
        'Semester': $('#drpSemester3').val(),
        'Branch': $('#drpBranchName3').val(),
        'TypeOfInstitute': $('#drpInstituteType3').val(),
        'InstituteName': $('#drpInstitutionName3').val(),
        'Category': $('#drpCategory3').val(),
        'AnnualIncome': $('#txtAnnualIncome3').val(),
        'FinancingGuardianName': $('#txtFinancingGuardianName3').val(),
        'FinancingGuardianRelation': $('#txtFinancingGuardianRelation3').val(),
        'BankName': $('#txtBankName3').val(),
        'AccountHolderName': $('#txtAcHolderName3').val(),
        'BankAccountNo': $('#txtBankAcNo3').val(),
        'BankIFSCcode': $('#txtBankIFSCode3').val(),
        'IssuingAuthorityName': $('#txtIssuingAuthority3').val(),
        'IssuingAddress': $('#txtAddress3').val(),
        'IssuingContactNo': $('#txtContactNo3').val(),
        'IssuingEmailId': $('#txtEmailid3').val(),
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

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/DTE/FinancingAssistanceForm1.aspx/InsertFinancialAssistance3',
            data: $.stringify(obj, null, 4),
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

            if (result /*&& jqXHRData_IMG_result*/) {
                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=410&AppID=' + obj.AppID + '&UID=' + uid;
            }
        });// end of Then function of main Data Insert Function

    return false;
}

function ValidateForm3() {
    debugger;
    var text = "";
    var opt = "";


    var RegistrationNo = $('#txtRegistrationNo3').val();
    var AdmisionYear = $('#drpAdmisionYear3').val();
    var Semester = $('#drpSemester3').val();
    var InstituteType = $('#drpInstituteType3').val();
    var InstitutionName = $('#drpInstitutionName3').val();
    var BranchName = $('#drpBranchName3').val();
    var Category = $('#drpCategory3').val();
    var AnnualIncome = $('#txtAnnualIncome3').val();
    var FinancingGuardianName = $('#txtFinancingGuardianName3').val();
    var FinancingGuardianRelation = $('#txtFinancingGuardianRelation3').val();

    if (RegistrationNo == null || RegistrationNo == '') {
        text += "<br /> -Please Enter RegistrationNo ";
        $('#txtRegistrationNo3').attr('style', 'border:1px solid red !important;');
        $('#txtRegistrationNo3').css({ "background-color": "#fff3ee" });
        opt = 1;
    } else {
        $('#txtRegistrationNo3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRegistrationNo3').css({ "background-color": "#ffffff" });
    }

    if (AdmisionYear == null || AdmisionYear == " " || AdmisionYear == "0") {
        text += "<br /> -Please select AdmisionYear.";
        $('#drpAdmisionYear3').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpAdmisionYear3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (AdmisionYear != null) {
        $('#drpAdmisionYear3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpAdmisionYear3').css({ "background-color": "#ffffff" });
    }

    if (Semester == null || Semester == " " || Semester == "0") {
        text += "<br /> -Please select Semester.";
        $('#drpSemester3').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpSemester3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Semester != null) {
        $('#drpSemester3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpSemester3').css({ "background-color": "#ffffff" });
    }

    if (InstituteType == null || InstituteType == " " || InstituteType == "0") {
        text += "<br /> -Please select InstituteType.";
        $('#drpInstituteType3').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstituteType3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstituteType != null) {
        $('#drpInstituteType3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstituteType3').css({ "background-color": "#ffffff" });
    }

    if (InstitutionName == null || InstitutionName == " " || InstitutionName == "0") {
        text += "<br /> -Please select InstitutionName.";
        $('#drpInstitutionName3').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstitutionName3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstitutionName != null) {
        $('#drpInstitutionName3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstitutionName3').css({ "background-color": "#ffffff" });
    }

    if (BranchName == null || BranchName == " " || BranchName == "0") {
        text += "<br /> -Please select BranchName.";
        $('#drpBranchName3').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpBranchName3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (BranchName != null) {
        $('#drpBranchName3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpBranchName3').css({ "background-color": "#ffffff" });
    }

    if (FinancingGuardianName == null || FinancingGuardianName == "") {
        text += "<br /> -Please Enter Financing Guardian Name.";
        $('#txtFinancingGuardianName3').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFinancingGuardianName3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (FinancingGuardianName != null) {
        $('#txtFinancingGuardianName3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtFinancingGuardianName3').css({ "background-color": "#ffffff" });
    }

    if (FinancingGuardianRelation == null || FinancingGuardianRelation == "") {
        text += "<br /> -Please Enter Financing Guardian Relation.";
        $('#txtFinancingGuardianRelation3').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFinancingGuardianRelation3').css({ "background-color": "#fff3ee" });
        opt = 1;
    } else if (FinancingGuardianRelation != null) {
        $('#txtFinancingGuardianRelation3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtFinancingGuardianRelation3').css({ "background-color": "#ffffff" });
    }

    if (Category == null || Category == " " || Category == "0") {
        text += "<br /> -Please select Category.";
        $('#drpCategory3').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpCategory3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Category != null) {
        $('#drpCategory3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpCategory3').css({ "background-color": "#ffffff" });
    }

    if (AnnualIncome == null || AnnualIncome == '') {
        text += "<br /> -Please Enter AnnualIncome ";
        $('#txtAnnualIncome3').attr('style', 'border:1px solid red !important;');
        $('#txtAnnualIncome3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAnnualIncome3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAnnualIncome3').css({ "background-color": "#ffffff" });
    }


    var AccountHolderName3 = $('#txtAcHolderName3').val();
    if (AccountHolderName3 == null || AccountHolderName3 == '') {
        text += "<br /> -Please Enter Account Holder Name.";
        $('#txtAcHolderName3').attr('style', 'border:1px solid red !important;');
        $('#txtAcHolderName3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAcHolderName3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAcHolderName3').css({ "background-color": "#ffffff" });
    }

    var BankName3 = $('#txtBankName3').val();
    if (BankName3 == null || BankName3 == '') {
        text += "<br /> -Please Enter Bank Name.";
        $('#txtBankName3').attr('style', 'border:1px solid red !important;');
        $('#txtBankName3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankName3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankName3').css({ "background-color": "#ffffff" });
    }

    var BankAcNo3 = $('#txtBankAcNo3').val();
    if (BankAcNo3 == null || BankAcNo3 == '') {
        text += "<br /> -Please Enter Bank Account No.";
        $('#txtBankAcNo3').attr('style', 'border:1px solid red !important;');
        $('#txtBankAcNo3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankAcNo3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankAcNo3').css({ "background-color": "#ffffff" });

        if (BankAcNo3.length > 12 || BankAcNo3.length < 12) {
            text += "<br /> -Bank Account No. should be 12 digit";
            $('#txtBankAcNo3').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtBankAcNo3').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtBankAcNo3').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtBankAcNo3').css({ "background-color": "#ffffff" });
        }
    }

    var BankIFSCode3 = $('#txtBankIFSCode3').val();
    if (BankIFSCode3 == null || BankIFSCode3 == '') {
        text += "<br /> -Please Enter Bank IFSC Code.";
        $('#txtBankIFSCode3').attr('style', 'border:1px solid red !important;');
        $('#txtBankIFSCode3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankIFSCode3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankIFSCode3').css({ "background-color": "#ffffff" });
    }


    var IssuingAuthority3 = $('#txtIssuingAuthority3').val();
    if (IssuingAuthority3 == null || IssuingAuthority3 == '') {
        text += "<br /> -Please Enter Name of Issuing Authority.";
        $('#txtIssuingAuthority3').attr('style', 'border:1px solid red !important;');
        $('#txtIssuingAuthority3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtIssuingAuthority3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtIssuingAuthority3').css({ "background-color": "#ffffff" });
    }


    var Address3 = $('#txtAddress3').val();
    if (Address3 == null || Address3 == '') {
        text += "<br /> -Please Enter Address Issuing Authority.";
        $('#txtAddress3').attr('style', 'border:1px solid red !important;');
        $('#txtAddress3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAddress3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAddress3').css({ "background-color": "#ffffff" });
    }


    var ContactNo3 = $('#txtContactNo3').val();
    if (ContactNo3 == null || ContactNo3 == '') {
        text += "<br /> -Please Enter Issuing Authority Contact No (both Desk and Cell).";
        $('#txtContactNo3').attr('style', 'border:1px solid red !important;');
        $('#txtContactNo3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtContactNo3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtContactNo3').css({ "background-color": "#ffffff" });
    }


    var EmailId3 = $('#txtEmailid3').val();
    if (EmailId3 == null || EmailId3 == '') {
        text += "<br /> -Please Enter EmailId Issuing Authority.";
        $('#txtEmailid3').attr('style', 'border:1px solid red !important;');
        $('#txtEmailid3').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtEmailid3').attr('style', 'border:1px solid #ddd !important;');
        $('#txtEmailid3').css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function RegistrationNo3() {
    var text = "";
    var opt = "";
    var RegistrationNo = document.getElementById('txtRegistrationNo3').value;
    if (RegistrationNo.length > 12 || RegistrationNo.length < 12) {
        text += "<br /> -Registration No. should be 12 digit";
        $('#txtRegistrationNo3').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistrationNo3').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#txtRegistrationNo3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistrationNo3').css({ "background-color": "#ffffff" });

        if (!(RegistrationNo.charAt(0) == "F" || RegistrationNo.charAt(0) == "L" || RegistrationNo.charAt(0) == "f" || RegistrationNo.charAt(0) == "l")) {
            text += "<br /> -Registration No. should start with F and L";
            $('#txtRegistrationNo3').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistrationNo3').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtRegistrationNo3').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistrationNo3').css({ "background-color": "#ffffff" });
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function AnnualIncome3() {

    var text = "";
    var opt = "";
    var AnnualIncome = $('#txtAnnualIncome3').val();

    if (AnnualIncome !== null || AnnualIncome !== "") {
        if (AnnualIncome <= 600000) {
            $('#txtAnnualIncome3').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtAnnualIncome3').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Annual Income should be Rs 600000)";
            $('#txtAnnualIncome3').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtAnnualIncome3').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GetInstituteName3() {
    var InstituteType = $('#drpInstituteType3').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm2.aspx/InstituteData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpInstitutionName3]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType2]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpInstitutionName3]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetBranchName3() {
    var InstituteType = $('#drpInstituteType3').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm2.aspx/BranchData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpBranchName3]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType2]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpBranchName3]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function OnchangeFunction3() {
    GetInstituteName3();
    GetBranchName3();
}



function SubmitData4() {
    if (!ValidateForm4()) {
        return;
    }

    var temp = "Mohan";
    var AppID = "";
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

    var datavar = {
        'aadhaarNumber': uid,
        'RegistrationNumber': $('#txtRegistrationNo4').val(),
        'AdmissionYear': $('#drpAdmisionYear4').val(),
        'Semester': $('#drpSemester4').val(),
        'Branch': $('#drpBranchName4').val(),
        'TypeOfInstitute': $('#drpInstituteType4').val(),
        'InstituteName': $('#drpInstitutionName4').val(),
        'Category': $('#drpCategory4').val(),
        'AnnualIncome': $('#txtAnnualIncome4').val(),
        'FinancingGuardianName': $('#txtFinancingGuardianName4').val(),
        'FinancingGuardianRelation': $('#txtFinancingGuardianRelation4').val(),
        'BankName': $('#txtBankName4').val(),
        'AccountHolderName': $('#txtAcHolderName4').val(),
        'BankAccountNo': $('#txtBankAcNo4').val(),
        'BankIFSCcode': $('#txtBankIFSCode4').val(),
        'IssuingAuthorityName': $('#txtIssuingAuthority4').val(),
        'IssuingAddress': $('#txtAddress4').val(),
        'IssuingContactNo': $('#txtContactNo4').val(),
        'IssuingEmailId': $('#txtEmailid4').val(),
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

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/DTE/FinancingAssistanceForm1.aspx/InsertFinancialAssistance4',
            data: $.stringify(obj, null, 4),
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

            if (result /*&& jqXHRData_IMG_result*/) {
                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=411&AppID=' + obj.AppID + '&UID=' + uid;
            }
        });// end of Then function of main Data Insert Function

    return false;
}

function ValidateForm4() {
    debugger;
    var text = "";
    var opt = "";


    var RegistrationNo = $('#txtRegistrationNo4').val();
    var AdmisionYear = $('#drpAdmisionYear4').val();
    var Semester = $('#drpSemester4').val();
    var InstituteType = $('#drpInstituteType4').val();
    var InstitutionName = $('#drpInstitutionName4').val();
    var BranchName = $('#drpBranchName4').val();
    var Category = $('#drpCategory4').val();
    var AnnualIncome = $('#txtAnnualIncome4').val();
    var FinancingGuardianName = $('#txtFinancingGuardianName4').val();
    var FinancingGuardianRelation = $('#txtFinancingGuardianRelation4').val();

    if (RegistrationNo == null || RegistrationNo == '') {
        text += "<br /> -Please Enter RegistrationNo ";
        $('#txtRegistrationNo4').attr('style', 'border:1px solid red !important;');
        $('#txtRegistrationNo4').css({ "background-color": "#fff3ee" });
        opt = 1;
    } else {
        $('#txtRegistrationNo4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRegistrationNo4').css({ "background-color": "#ffffff" });
    }

    if (AdmisionYear == null || AdmisionYear == " " || AdmisionYear == "0") {
        text += "<br /> -Please select AdmisionYear.";
        $('#drpAdmisionYear4').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpAdmisionYear4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (AdmisionYear != null) {
        $('#drpAdmisionYear4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpAdmisionYear4').css({ "background-color": "#ffffff" });
    }

    if (Semester == null || Semester == " " || Semester == "0") {
        text += "<br /> -Please select Semester.";
        $('#drpSemester4').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpSemester4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Semester != null) {
        $('#drpSemester4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpSemester4').css({ "background-color": "#ffffff" });
    }

    if (InstituteType == null || InstituteType == " " || InstituteType == "0") {
        text += "<br /> -Please select InstituteType.";
        $('#drpInstituteType4').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstituteType4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstituteType != null) {
        $('#drpInstituteType4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstituteType4').css({ "background-color": "#ffffff" });
    }

    if (InstitutionName == null || InstitutionName == " " || InstitutionName == "0") {
        text += "<br /> -Please select InstitutionName.";
        $('#drpInstitutionName4').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpInstitutionName4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (InstitutionName != null) {
        $('#drpInstitutionName4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpInstitutionName4').css({ "background-color": "#ffffff" });
    }

    if (BranchName == null || BranchName == " " || BranchName == "0") {
        text += "<br /> -Please select BranchName.";
        $('#drpBranchName4').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpBranchName4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (BranchName != null) {
        $('#drpBranchName4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpBranchName4').css({ "background-color": "#ffffff" });
    }

    if (FinancingGuardianName == null || FinancingGuardianName == "") {
        text += "<br /> -Please Enter Financing Guardian Name.";
        $('#txtFinancingGuardianName4').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFinancingGuardianName4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (FinancingGuardianName != null) {
        $('#txtFinancingGuardianName4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtFinancingGuardianName4').css({ "background-color": "#ffffff" });
    }

    if (FinancingGuardianRelation == null || FinancingGuardianRelation == "") {
        text += "<br /> -Please Enter Financing Guardian Relation.";
        $('#txtFinancingGuardianRelation4').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFinancingGuardianRelation4').css({ "background-color": "#fff3ee" });
        opt = 1;
    } else if (FinancingGuardianRelation != null) {
        $('#txtFinancingGuardianRelation4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtFinancingGuardianRelation4').css({ "background-color": "#ffffff" });
    }

    if (Category == null || Category == " " || Category == "0") {
        text += "<br /> -Please select Category.";
        $('#drpCategory4').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpCategory4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Category != null) {
        $('#drpCategory4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#drpCategory4').css({ "background-color": "#ffffff" });
    }

    if (AnnualIncome == null || AnnualIncome == '') {
        text += "<br /> -Please Enter AnnualIncome ";
        $('#txtAnnualIncome4').attr('style', 'border:1px solid red !important;');
        $('#txtAnnualIncome4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAnnualIncome4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAnnualIncome4').css({ "background-color": "#ffffff" });
    }

    var BankName4 = $('#txtBankName4').val();
    if (BankName4 == null || BankName4 == '') {
        text += "<br /> -Please Enter Bank Name.";
        $('#txtBankName4').attr('style', 'border:1px solid red !important;');
        $('#txtBankName4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankName4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankName4').css({ "background-color": "#ffffff" });
    }

    var AccountHolderName4 = $('#txtAcHolderName4').val();
    if (AccountHolderName4 == null || AccountHolderName4 == '') {
        text += "<br /> -Please Enter Account Holder Name.";
        $('#txtAcHolderName4').attr('style', 'border:1px solid red !important;');
        $('#txtAcHolderName4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAcHolderName4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAcHolderName4').css({ "background-color": "#ffffff" });
    }

    var BankAcNo4 = $('#txtBankAcNo4').val();
    if (BankAcNo4 == null || BankAcNo4 == '') {
        text += "<br /> -Please Enter Bank Account No.";
        $('#txtBankAcNo4').attr('style', 'border:1px solid red !important;');
        $('#txtBankAcNo4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankAcNo4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankAcNo4').css({ "background-color": "#ffffff" });

        if (BankAcNo4.length > 12 || BankAcNo4.length < 12) {
            text += "<br /> -Bank Account No. should be 12 digit";
            $('#txtBankAcNo4').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtBankAcNo4').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtBankAcNo4').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtBankAcNo4').css({ "background-color": "#ffffff" });
        }
    }

    var BankIFSCode4 = $('#txtBankIFSCode4').val();
    if (BankIFSCode4 == null || BankIFSCode4 == '') {
        text += "<br /> -Please Enter Bank IFSC Code.";
        $('#txtBankIFSCode4').attr('style', 'border:1px solid red !important;');
        $('#txtBankIFSCode4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBankIFSCode4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBankIFSCode4').css({ "background-color": "#ffffff" });
    }


    var IssuingAuthority4 = $('#txtIssuingAuthority4').val();
    if (IssuingAuthority4 == null || IssuingAuthority4 == '') {
        text += "<br /> -Please Enter Name of Issuing Authority.";
        $('#txtIssuingAuthority4').attr('style', 'border:1px solid red !important;');
        $('#txtIssuingAuthority4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtIssuingAuthority4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtIssuingAuthority4').css({ "background-color": "#ffffff" });
    }


    var Address4 = $('#txtAddress4').val();
    if (Address4 == null || Address4 == '') {
        text += "<br /> -Please Enter Address Issuing Authority.";
        $('#txtAddress4').attr('style', 'border:1px solid red !important;');
        $('#txtAddress4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAddress4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAddress4').css({ "background-color": "#ffffff" });
    }


    var ContactNo4 = $('#txtContactNo4').val();
    if (ContactNo4 == null || ContactNo4 == '') {
        text += "<br /> -Please Enter Issuing Authority Contact No (both Desk and Cell).";
        $('#txtContactNo4').attr('style', 'border:1px solid red !important;');
        $('#txtContactNo4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtContactNo4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtContactNo4').css({ "background-color": "#ffffff" });
    }


    var EmailId4 = $('#txtEmailid4').val();
    if (EmailId4 == null || EmailId4 == '') {
        text += "<br /> -Please Enter EmailId Issuing Authority.";
        $('#txtEmailid4').attr('style', 'border:1px solid red !important;');
        $('#txtEmailid4').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtEmailid4').attr('style', 'border:1px solid #ddd !important;');
        $('#txtEmailid4').css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function RegistrationNo4() {
    var text = "";
    var opt = "";
    var RegistrationNo = document.getElementById('txtRegistrationNo4').value;
    if (RegistrationNo.length > 12 || RegistrationNo.length < 12) {
        text += "<br /> -Registration No. should be 12 digit";
        $('#txtRegistrationNo4').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistrationNo4').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#txtRegistrationNo4').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistrationNo4').css({ "background-color": "#ffffff" });

        if (!(RegistrationNo.charAt(0) == "F" || RegistrationNo.charAt(0) == "L" || RegistrationNo.charAt(0) == "f" || RegistrationNo.charAt(0) == "l")) {
            text += "<br /> -Registration No. should start with F and L";
            $('#txtRegistrationNo4').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistrationNo4').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtRegistrationNo4').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistrationNo4').css({ "background-color": "#ffffff" });
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function AnnualIncome4() {

    var text = "";
    var opt = "";
    var AnnualIncome = $('#txtAnnualIncome4').val();

    if (AnnualIncome !== null || AnnualIncome !== "") {
        if (AnnualIncome <= 600000) {
            $('#txtAnnualIncome4').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtAnnualIncome4').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Annual Income should be Rs 600000)";
            $('#txtAnnualIncome4').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtAnnualIncome4').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GetInstituteName4() {
    var InstituteType = $('#drpInstituteType4').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm2.aspx/InstituteData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpInstitutionName4]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType2]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpInstitutionName4]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetBranchName4() {
    var InstituteType = $('#drpInstituteType4').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/DTE/FinancingAssistanceForm2.aspx/BranchData",
        data: '{"InstituteType":"' + InstituteType + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpBranchName4]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                //$("[id*=drpInstituteType2]").append($("<option></option>").val(this['Value']).html(this['Text']));
                $("[id*=drpBranchName4]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function OnchangeFunction4() {
    GetInstituteName4();
    GetBranchName4();
}