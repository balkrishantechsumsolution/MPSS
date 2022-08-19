

$(document).ready(function () {

});
function ValidateForm() { //Validate Form and Controls if Logic Fails
    debugger;
    var text = "";
    var opt = "";

  
    var ddlDistrict = $('#ddlDistrict').val();
    var ddlDept = $("#ddlDept").val();
    var ddlOffice = $("#ddlOffice").val();
    var ddlOfficeSub = $("#ddlOfficeSub").val();
    var ddlDesignation = $("#ddlDesignation").val();
    var txtDesignatedOfficer = $("#txtDesignatedOfficer").val();
    var txtDesignatedOfficeAddress = $("#txtDesignatedOfficeAddress").val();
    var txtDesignatedPinCode = $("#txtDesignatedPinCode").val();
    var txtDesignatedEmailID = $("#txtDesignatedEmailID").val();
    var txtDesignatedMobileNo = $("#txtDesignatedMobileNo").val();
   


    if (ddlDistrict == "0" || ddlDistrict == "-Select District-") {
        text += "<br /> -Please Select District .";
        $('#ddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlDistrict').css({ "background-color": "#ffffff" });
    }
   
    if (ddlDept == "0" || ddlDept == "-Select Department-") {
        text += "<br /> -Please Select Department .";
        $('#ddlDept').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDept').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDept').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlDept').css({ "background-color": "#ffffff" });
    }
    if (ddlOffice == "0" || ddlOffice == "-Select Office-") {
        text += "<br /> -Please Select Office .";
        $('#ddlOffice').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlOffice').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlOffice').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlOffice').css({ "background-color": "#ffffff" });
    }
    if (ddlOfficeSub == "0" || ddlOfficeSub == "-Select Office-" || ddlOfficeSub == "" || ddlOfficeSub=="undefined") {
        text += "<br /> -Please Select Sub Office Name.";
        $('#ddlOfficeSub').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlOfficeSub').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlOfficeSub').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlOfficeSub').css({ "background-color": "#ffffff" });
    }

    if (ddlDesignation == "0" || ddlDesignation == null) {
        text += "<br /> -Please Enter Designation";
        $('#ddlDesignation').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDesignation').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDesignation').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlDesignation').css({ "background-color": "#ffffff" });
    }
    if (txtDesignatedOfficer == null || txtDesignatedOfficer == "") {
        text += "<br /> -Please Enter Designated Officer";
        $('#txtDesignatedOfficer').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDesignatedOfficer').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtDesignatedOfficer != null) {
        $('#txtDesignatedOfficer').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDesignatedOfficer').css({ "background-color": "#ffffff" });
    }
    if (txtDesignatedOfficeAddress == null || txtDesignatedOfficeAddress == "") {
        text += "<br /> -Please Enter Designated Office Address.";
        $('#txtDesignatedOfficeAddress').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDesignatedOfficeAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtDesignatedOfficeAddress != null) {
        $('#txtDesignatedOfficeAddress').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDesignatedOfficeAddress').css({ "background-color": "#ffffff" });
    }

    if (txtDesignatedPinCode == null || txtDesignatedPinCode == "") {
        text += "<br /> -Please Enter Designated PinCode.";
        $('#txtDesignatedPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDesignatedPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtDesignatedPinCode != null) {
        $('#txtDesignatedPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDesignatedPinCode').css({ "background-color": "#ffffff" });
    }
    if (txtDesignatedEmailID == null || txtDesignatedEmailID == "") {
        text += "<br /> -Please Enter Designated EmailID.";
        $('#txtDesignatedEmailID').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDesignatedEmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtDesignatedEmailID != null) {
        $('#txtDesignatedEmailID').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDesignatedEmailID').css({ "background-color": "#ffffff" });
    }
    if (txtDesignatedMobileNo == null || txtDesignatedMobileNo == "") {
        text += "<br /> -Please Enter Designated MobileNo.";
        $('#txtDesignatedMobileNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDesignatedMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtDesignatedMobileNo != null) {
        $('#txtDesignatedMobileNo').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDesignatedMobileNo').css({ "background-color": "#ffffff" });
    }

   


    //************* Show alert popup for options which has not filled by user. **************
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}