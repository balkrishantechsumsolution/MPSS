$(document).ready(function () {
    var StateControl = "ctl00$ContentPlaceHolder1$Address$ddlState";
    var DistrictControl = "ctl00$ContentPlaceHolder1$Address$ddlDistrict";
    var TalukaControl = "ctl00$ContentPlaceHolder1$Address$ddlTaluka";
    var VillageControl = "ctl00$ContentPlaceHolder1$Address$ddlVillage";
    var category = "";
    GetState();

    //ctl00$ContentPlaceHolder1$Address$ddlDistrict
   //GetDistrict(category, StateControl, DistrictControl)
    $('#DOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {

            var t_DOB = $("#DOB").val();

            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear();

        }
    });


    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    $("[name='" + StateControl + "']").bind("change", function (e) { return GetDistrictV2("", StateControl ,DistrictControl); });
    $("[name='" + DistrictControl + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl, TalukaControl); });
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return GetVillage("", TalukaControl, VillageControl); });


});



function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }

    var temp = "Gunwant";
    var RegNo = "";
    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var datavar = {

        'DateOfBirth': DOBConverted,
        'TimeOfBirth': $('#TOB').val(),
        'BirthPlace': $('#txtPOB').val(),
        'Weight': $('#txtWeight').val(),
        'Gender': $('#ddlGender').val(),
        'ChildName': $('#txtChildName').val(),
        'FatherName': $('#txtFatherName').val(),
        'MotherName': $('#txtMotherName').val(),
        'InstitutionNo': $('#UID').val(),
        'InstitutionName': $('#txtHospname').val(),
        'AddressLine1': $('#ContentPlaceHolder1_Address_AddressLine1').val(),
        'AddressLine2': $('#ContentPlaceHolder1_Address_AddressLine2').val(),
        'StreetRoadName': $('#ContentPlaceHolder1_Address_RoadStreetName').val(),
        'LandMark': $('#ContentPlaceHolder1_Address_LandMark').val(),
        'Locality': $('#ContentPlaceHolder1_Address_Locality').val(),
        'StateCode': $('#ContentPlaceHolder1_Address_ddlState').val(),
        'DistrictCode': $('#ContentPlaceHolder1_Address_ddlDistrict').val(),
        'BlockTalukaCode': $('#ContentPlaceHolder1_Address_ddlTaluka').val(),
        'PanchayatVillageCode': $('#ContentPlaceHolder1_Address_ddlVillage').val(),
        'PinCode': $('#ContentPlaceHolder1_Address_PinCode').val(),
        'MobileNo': $('#txtMobileNo').val(),
        'EmailID"': $('#txtEmailID').val()
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/G2G/Birth/BirthRegistration.aspx/InsertBirthRegistration',
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
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            RegNo = obj.AppID;
            result = true;

            if (result) {
                
                alert("Birth Registration done sucessfully. The Registration No. is " + RegNo + ".");
                window.location.href = '../G2GDashboard.aspx?UID=' + RegNo

                
            }
        });// end of Then function of main Data Insert Function

    return false;
}

function ValidateForm() {
    return true;

}