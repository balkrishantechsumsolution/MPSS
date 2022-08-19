/*
Logic for binding the dropdowns on Page Load of Office Officer Control.
*/
$(document).ready(function () {
    debugger;
    var StateControl = "ctl00$ContentPlaceHolder1$Address2$ddlState";
    var DistrictControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlDistrict";
    var TalukaControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlTaluka";
    var VillageControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlVillage";
    var ServiceControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlServices";
    var DepartmentControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlDepartment";
    var OfficeControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlOffice";
    var OfficerControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlOfficer";    

    GetServices("", ServiceControl, DepartmentControl); //Implemented in AddressScript.js
    GetDepartment("", DepartmentControl); //Implemented in Addressscript.js
    GetDistrict("", "21", DistrictControl); //Implemented in Addressscript.js

    $("[name='" + ServiceControl + "']").bind("change", function (e) { return GetDepartmentCode("", DepartmentControl, ServiceControl); });//Implemented in AddressScript.js

    $("[name='" + DistrictControl + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl, TalukaControl); });//Implemented in AddressScript.js
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return GetVillage("", TalukaControl, VillageControl); });//Implemented in AddressScript.js

    $("[name='" + VillageControl + "']").bind("change", function (e) { return GetOffice("", OfficeControl, DistrictControl, TalukaControl, VillageControl, ServiceControl, DepartmentControl); });//Implemented in AddressScript.js

    $("[name='" + OfficeControl + "']").bind("change", function (e) { return GetOfficer("", OfficerControl, OfficeControl, ServiceControl, DistrictControl, TalukaControl); });//Implemented in AddressScript.js

    $("[name='" + DepartmentControl + "']").bind("change", function (e) { return GetDeptServices("", DepartmentControl, ServiceControl); });//Implemented in AddressScript.js
    //var ServiceType = "";

    //if (ServiceType == 'District') {

    //}

});

$(document).ready(function () {
    $("#step1").addClass("stepactive");
    $("#step2").removeClass("active");
    $("#step3").removeClass("active");
    $("#step4").removeClass("active");
    $("#step5").removeClass("active");
    $("#divGrid").hide();
    $('#divOfficeOfficer').hide();
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

//Function called when Next is clicked on the Service Selection Page.
function fnNext() {
    
    debugger;
    var t_Service = $('#ddlServices').val().split('_');
    var t_Department = $('#ddlDepartment').val();
    var t_District = $('#ddlDistrict').val();
    var t_Block = $('#ddlTaluka').val();
    var t_Panchayat = $('#ddlVillage').val();
    var t_Office = $('#ddlOffice').val();
    var t_Officer = $('#ddlOfficer').val();
    //window.location.href = 'Services.aspx?UID=' + AppID;

    var text = "";
    var opt = "";    

    if (t_Service != null && (t_Service == '0')) {

        text += "<br /> -Please select Service to continue.";
        opt = 1;

        if (t_Service[0] != null) {

        }

    }

    if (t_Department != null && (t_Department == '0')) {
        if (t_Service != "0") {
            text += "<br /> -Please select Service to continue.";
            opt = 1;
        }
    }

    if ($('#HFHideOfficerPanel').val() == "0") {

        if (t_District != null && (t_District == '0')) {
            text += "<br /> -Please select District to continue.";
            opt = 1;
        }

        if (t_Block != null && (t_Block == '0' || t_Block == '-Select-' || t_Block == "Select Block")) {
            text += "<br /> -Please select Block/Taluka to continue.";
            opt = 1;
        }


        if (t_Panchayat != null && (t_Panchayat == '0' || t_Panchayat == '-Select-' || t_Panchayat == "Select Panchayat/Village/City")) {
            text += "<br /> -Please select Panchayat/Village/City to continue.";
            opt = 1;
        }

        if (t_Office != null && (t_Office == '0' || t_Office == '-Select-' || t_Office == "Select Concerned Office")) {
            text += "<br /> -Please select Concerned Office to continue.";
            opt = 1;
        }

        if (t_Officer != null && (t_Officer == '0' || t_Officer == '-Select-' || t_Officer == "Select Designated Officer")) {
            text += "<br /> -Please select Designated Officer to continue.";
            opt = 1;
        }


    }
    else {

        t_District = "0";
        t_Block = "0";
        t_Panchayat = "0";
        t_Office = "0";
        t_Officer = "0";
    }



    if (opt == "1") {
        alertPopup("Please select following information.", text);
        return false;
    }

    var qs = getQueryStrings();

    if (t_Service[0] == 388) {
        window.location.href = "/WebApp/Kiosk/OISF/OISF.aspx?SvcID=388&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
        return true;
    }

    if (t_Service[0] == 1449) {
        window.location.href = "/WebApp/KIOSK/CBCS/SearchForm.aspx?SvcID=1449&DPT=132&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
        return true;
    }


    if (qs["UID"] != null) {
        var uid = qs["UID"];
        window.location.href = t_Service[1] + '?UID=' + uid + '&SvcID=' + t_Service[0] + '&DPT=' + t_Department + '&DIST=' + t_District + '&BLK=' + t_Block + '&PAN=' + t_Panchayat + '&OFC=' + t_Office + '&OFR=' + t_Officer;
    }
    else if (qs["UID"] == null) {
        window.location.href = 'BasicDetail.aspx?URL=' + t_Service[1] + '&SvcID=' + t_Service[0] + '&DPT=' + t_Department + '&DIST=' + t_District + '&BLK=' + t_Block + '&PAN=' + t_Panchayat + '&OFC=' + t_Office + '&OFR=' + t_Officer;
    }

    return true;
}

function BindAppleteAuthority(category, svcid) {
    debugger;
    var catCount = 0;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Kiosk/forms/OfficeOfficer.aspx/BindAppleteAuthority',
        data: '{"prefix":"' + category + '","ServiceCode":"' + svcid + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            var Applete = eval(result.d);
            var html = "";

            if (result.d.length > 2) {
                $("#divGrid").show();
            }
            else {
                $("#divGrid").hide();
            }

            $("[id=grdView]").empty();
            $("#grdView").append("<tr><th>Service Name</th><th>Time Limit</th><th>Designated Officer</th><th>Appellate Authority</th><th>Revisional Authority</th><th>FAQ</th></tr>");
            var t_student = [result];
            //for (var i = 0; i < result.d.length - 3; i++) { //Logic commented due to an issue in it.
            for (var i = 0; i < 1; i++) {
                $("#grdView").append("<tr><td>" + Applete[i].ServiceName + "</td><td>" + Applete[i].TimeLimit + " days </td><td>" + Applete[i].DesignatedOfficer + "</td><td>" + Applete[i].AppellateAuthority + "</td><td>" + Applete[i].RevisionalAuthority + "</td><td><a href='" + Applete[i].FAQURL + "' target='_blank'>How to Apply</td></tr>");
                catCount++;

            }
            if (Applete[0].HideOfficerPanel == "1") {
                //alert("Hide Officer Panel");
                $('#divOfficeOfficer').hide();
                
                $('#HFHideOfficerPanel').val("1");

            }
            else { 
                $('#divOfficeOfficer').show(); 
                $('#HFHideOfficerPanel').val("0");

            }
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}