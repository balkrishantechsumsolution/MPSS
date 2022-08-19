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
        'InstituteName': $('#ddlInstitute option:selected').val(),
        'RegistrationNo': $('#txtRegistration').val(),
        'StudentName': $('#txtName').val(),
        'LeavingYear': $('#ddlPassing option:selected').text(),
        'Session': $('#ddlSession option:selected').text(),
        'JoiningYear': '',//$('#ddlLeaving option:selected').text(),
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
        'TradeName': $('#ddlBranch :selected').text(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/ITITranscript/ITITranscript.aspx/InsertTranscript',
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
    $("#liBasic").removeClass("active");
    $("#liService").removeClass("active");
    $("#liDetails").addClass("active");
    $("#liDoc").removeClass("active");
    $("#liPayment").removeClass("active");

    $("#step1").addClass("stepfinish");
    $("#step2").addClass("stepfinish");
    $("#step3").addClass("stepactive");
    $("#step4").addClass("active");
    $("#step5").addClass("active");
    $("#step6").addClass("active");
    $("#step7").addClass("active");

    //var qs = getQueryStrings();
    //var svcid = qs["SvcID"];

    //if (svcid == '371')
    //{ $('#lblApplicant').text('Name of ' + $('#ddlApplicantType :selected').text()); }
    //else
    //{ $('#lblApplicant').text('Name of ' + $('#ddlApplicantType :selected').text()); }

    //$('#divApplicant').hide();

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    GetInstituteMaster();
    GetBranchMaster();
   

});

function fnApplicantType() {
    //if ($('#ddlApplicantType :selected').val() != 0) {
    //    $('#divApplicant').show();
    //    $('#lblApplicant').text('Name of ' + $('#ddlApplicantType :selected').text());
    //}
    //else { $('#divApplicant').hide(); }
}

function GetInstituteMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/ITIMigration/MigrationITI.aspx/GetInstituteMasterITI',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlInstitute").empty();
            $("#ddlInstitute").append('<option value = "0">-Select Institute Name-</option>');
            $.each(Category, function () {
                $("#ddlInstitute").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Institute Name" + a.responseText);
        }
    });
}

function ValidateForm() {

    debugger;
    var text = "";
    var opt = "";

  



    

        var Registration = $('#txtRegistration').val();
        var yearofpassing = $('#ddlPassing').val();
        var nameofinstitude = $('#ddlInstitute').val();
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
        var TradeName = $('#ddlBranch :selected').text();




        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
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
       

        if (nameofinstitude == null || nameofinstitude == " " || nameofinstitude == "0") {
            text += "<br /> -Please select Name of institude.";
            $('#ddlInstitute').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlInstitute').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (nameofinstitude != null) {
            $('#ddlInstitute').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlInstitute').css({ "background-color": "#ffffff" });
        }

        if (TradeName == null || TradeName == " " || TradeName == "0") {
            text += "<br /> -Please select Name of Trade.";
            $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (TradeName != null) {
            $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlBranch').css({ "background-color": "#ffffff" });
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

function GetBranchMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/ITIMigration/MigrationITI.aspx/GetCourseMasterITI',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlBranch").empty();
            $("#ddlBranch").append('<option value = "0">-Select Trade Name-</option>');
            $.each(Category, function () {
                $("#ddlBranch").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Trade Name" + a.responseText);
        }
    });
}
