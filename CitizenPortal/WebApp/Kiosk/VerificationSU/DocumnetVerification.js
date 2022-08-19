function SubmitData() {

    if (!ValidateForm()) {
        return;
    }

    var temp = "Gunwant";
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
        'ProfileID': uid,
        'CollegeCode': $('#ddlCollege option:selected').val(),
        'CollegeName': $('#ddlCollege option:selected').text(),
        'RegistrationNo': $('#txtRegistration').val(),
        'RollNo': $('#txtRoll').val(),
        'StudentType': $('#ddlStudent option:selected').val(),

        'StudentName': $('#txtName').val(),
        'PassingYear': $('#ddlPassing option:selected').text(),
        'Branch': $('#ddlBranch option:selected').text(),
        'Result': $('#ddlResult option:selected').text(),
        'Reason': $('#txReason').val(),

        'CompanyApplicantName':$('#txtInstitute').val(),
        'AppAddressLine1': $('#AddressLine1').val(),
        'AppAddressLine2': $('#AddressLine2').val(),
        'AppStreetName': $('#RoadStreetName').val(),
        'AppLandmark': $('#LandMark').val(),
        'AppLocality': $('#Locality').val(),
        'AppStateCode': $('#ddlState').val(),
        'AppDistrictCode': $('#ddlDistrict').val(),
        'AppSubDistrictCode': $('#ddlTaluka').val(),
        'AppVillageCode': $('#ddlVillage').val(),
        'AppPinCode': $('#PinCode').val(),        
        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'ServiceID':svcid,
        'ApplicantType': $('#ddlApplicantType :selected').text(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/VerificationSu/DocumnetVerification.aspx/InsertDocumnetVerification',
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
                window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
}

$(document).ready(function () {
    $("#btnSubmit").prop('disabled',true);
    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    GetCollegeMaster();
    
});

function fnApplicantType() {
    //if ($('#ddlApplicantType :selected').val() != 0) {
    //    $('#divApplicant').show();
    //    $('#lblApplicant').text('Name of ' + $('#ddlApplicantType :selected').text());
    //}
    //else { $('#divApplicant').hide(); }
}

function GetCollegeMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/MigrationSU/MigrationSU.aspx/GetCollegeMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlCollege").empty();
            $("#ddlCollege").append('<option value = "0">-Select College Name-</option>');
            $.each(Category, function () {
                $("#ddlCollege").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch College Name" + a.responseText);
        }
    });
}

function ValidateForm() {

    debugger;
    var text = "";
    var opt = "";
     
        var StudentType = $('#ddlStudent').val();
        var Registration = $('#txtRegistration').val();
        var RollNo = $('#txtRoll').val();
        var Branch = $("#ddlBranch").val();
        var yearofpassing = $('#ddlPassing').val();
        var nameofinstitude = $('#ddlCollege').val();
        var nameofcandidate = $('#txtName').val();

        var nameofcompany=$('#txtInstitute').val();
        var Address1 = $("#AddressLine1").val();
        var StreetRoad = $("#RoadStreetName").val();
        var locality = $("#Locality").val();
        var state = $("#ddlState").val();
        var district = $("#ddlDistrict").val();
        var block1 = $("#ddlTaluka").val();
        var village = $("#ddlVillage :selected").text();
        var village1 = $("#ddlVillage").val();
        var pincode = $("#PinCode").val();



        if (StudentType == null || StudentType == " " || StudentType == "0") {
            text += "<br /> -Please select Student Type-";
            $('#ddlStudent').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlStudent').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (StudentType != null) {
            $('#ddlStudent').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlStudent').css({ "background-color": "#ffffff" });
        }

        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }

        if (RollNo == null || RollNo == "") {
            text += "<br /> -Please Enter Roll No.-";
            $('#txtRoll').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRoll').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (RollNo != null) {
            $('#txtRoll').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRoll').css({ "background-color": "#ffffff" });
        }

        if (yearofpassing == null || yearofpassing == " " || yearofpassing == "0") {
            text += "<br /> -Please select Year Of passing.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (yearofpassing != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }
       
        if (Branch == null || Branch == " " || Branch == "0") {
            text += "<br /> -Please select Branch-";
            $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Branch != null) {
            $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlBranch').css({ "background-color": "#ffffff" });
        }

        if (nameofinstitude == null || nameofinstitude == " " || nameofinstitude == "0") {
            text += "<br /> -Please select Name of institude.";
            $('#ddlInstitute').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlInstitute').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (nameofinstitude != null) {
            $('#ddlInstitute').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlInstitute').css({ "background-color": "#ffffff" });
        }

        if (nameofcandidate == null || nameofcandidate == "") {
            text += "<br /> -Please select Name of candidate.";
            $("#txtName").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtName").css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (nameofcandidate != null) {
            $("#txtName").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#txtName").css({ "background-color": "#ffffff" });
        }
        if (nameofcompany == null || nameofcompany == "") {
            text += "<br /> -Please Enter Name of company.";
            $('#txtInstitute').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtInstitute').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (nameofcompany != null) {
            $('#txtInstitute').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtInstitute').css({ "background-color": "#ffffff" });
        }

        if (Address1 == null || Address1 == "") {
            text += "<br /> -Please select Address1.";
            $('#AddressLine1').attr('style', 'border:1px solid #d03100 !important;');
            $('#AddressLine1').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Address1 != null) {
            $('#AddressLine1').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AddressLine1').css({ "background-color": "#ffffff" });
        }
        if (StreetRoad == null || StreetRoad == "") {
            text += "<br /> -Please select Street Road.";
            $('#RoadStreetName').attr('style', 'border:1px solid #d03100 !important;');
            $('#RoadStreetName').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (StreetRoad != null) {
            $('#RoadStreetName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#RoadStreetName').css({ "background-color": "#ffffff" });
        }
        if (locality == null || locality == "") {
            text += "<br /> -Please Enter locality";
            $('#Locality').attr('style', 'border:1px solid #d03100 !important;');
            $('#Locality').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (locality != null) {
            $('#Locality').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#Locality').css({ "background-color": "#ffffff" });
        }

        if (state == null || state == "" || state == "0") {
            text += "<br /> -Please select state.";
            $('#ddlState').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlState').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (state != null) {
            $('#ddlState').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlState').css({ "background-color": "#ffffff" });
        }
        if (district == null || district == "" || district == '0') {
            text += "<br /> -Please select District.";
            $('#ddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlDistrict').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (district != null) {
            $('#ddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlDistrict').css({ "background-color": "#ffffff" });
        }
        if (block1 == "Select Block" || block1 == "-Select-" || block1 == "0") {
            text += "<br /> -Please select Block.";
            $('#ddlTaluka').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlTaluka').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (block1 != null) {
            $('#ddlTaluka').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlTaluka').css({ "background-color": "#ffffff" });
        }
        else if (block1 != null) {
            $('#ddlTaluka').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlTaluka').css({ "background-color": "#ffffff" });
        }
        
        if (village == null || village == "" || village == "-Select-" || village == "Select Panchayat") {
            text += "<br /> -Please select Village.";
            $("#ddlVillage").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlVillage").css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (village != null) {
            $("#ddlVillage").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#ddlVillage").css({ "background-color": "#ffffff" });
        }
        if (pincode == null || pincode == "") {
            text += "<br /> -Please Enter pincode";
            $("#PinCode").attr('style', 'border:1px solid #d03100 !important;');
            $("#PinCode").css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (pincode != null) {
            $("#PinCode").attr('style', 'border:1px solid #cdcdcd !important;');
            $("#PinCode").css({ "background-color": "#ffffff" });
        }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}
