function ValidateForm() { //Validate Form and Controls if Logic Fails
    debugger;
    var text = "";
    var opt = "";


    var ddlDistrict = $('#ddlDistrict').val();
  
    var ddlDept = $("#ddlDept").val();
    var ddlDesignatedOfficer = $("#ddlDesignatedOfficer").val();
    var txtDesignatedOfficer = $("#txtDesignatedOfficer").val();
    var txtDesignatedAddress = $("#txtDesignatedAddress").val();
    var ddlDistrict2 = $("#ddlDistrict2").val();
   
    var ddlDept2 = $("#ddlDept2").val();
    var ddlAppellateAuthority = $("#ddlAppellateAuthority").val();
    var txtAppellateAuthority = $("#txtAppellateAuthority").val();
    var txtAppellateAddress = $("#txtAppellateAddress").val();
    var ddlDistrict3 = $("#ddlDistrict3").val();
    
    var ddlDept3 = $("#ddlDept3").val();
    var ddlRevisionalAuthority = $("#ddlRevisionalAuthority").val();
    var txtRevisionalAuthority = $("#txtRevisionalAuthority").val();
    var txtRevisionalAddress = $("#txtRevisionalAddress").val();


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

    if (ddlDesignatedOfficer == "0" || ddlDesignatedOfficer == "-Select Department-" || ddlDesignatedOfficer == "") {
        text += "<br /> -Please Select Designated Officer .";
        $('#ddlDesignatedOfficer').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDesignatedOfficer').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDesignatedOfficer').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlDesignatedOfficer').css({ "background-color": "#ffffff" });
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
    if (txtDesignatedAddress == "" || txtDesignatedAddress == null || txtDesignatedAddress == "0") {
        text += "<br /> -Please Enter Designated Address";
        $('#txtDesignatedAddress').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDesignatedAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtDesignatedAddress != null) {
        $('#txtDesignatedAddress').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDesignatedAddress').css({ "background-color": "#ffffff" });
    }

    if (txtDesignatedAddress == null || txtDesignatedAddress == "") {
        text += "<br /> -Please Enter Designated Address in Designated  Detail";
        $('#txtDesignatedAddress').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDesignatedAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (txtDesignatedAddress != null) {
        $('#txtDesignatedAddress').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDesignatedAddress').css({ "background-color": "#ffffff" });
    }

    if (ddlDistrict2 == "0" || ddlDistrict2 == "-Select District-") {
        text += "<br /> -Please Select District in Appellate Authority Detail.";
        $('#ddlDistrict2').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDistrict2').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDistrict2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlDistrict2').css({ "background-color": "#ffffff" });
    }

   
    if (ddlDept2 == "0" || ddlDept2 == "-Select Department-" || ddlDept2 == "") {
        text += "<br /> -Please Select Department in Appellate Authority Detail.";
        $('#ddlDept2').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDept2').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDept2').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlDept2').css({ "background-color": "#ffffff" });
    }
    if (ddlAppellateAuthority == "0" || ddlAppellateAuthority == "-Select Department-" || ddlAppellateAuthority == "") {
        text += "<br /> -Please Select Appellate Authority in Appellate Authority Detail.";
        $('#ddlAppellateAuthority').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlAppellateAuthority').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlAppellateAuthority').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlAppellateAuthority').css({ "background-color": "#ffffff" });
    }

    if (txtAppellateAuthority == "0" || txtAppellateAuthority == null || txtAppellateAuthority=="") {
        text += "<br /> -Please Enter Office Name  in Appellate Detail";
        $('#txtAppellateAuthority').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAppellateAuthority').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#txtAppellateAuthority').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtAppellateAuthority').css({ "background-color": "#ffffff" });
    }
    if (txtAppellateAddress == null || txtAppellateAddress == "") {
        text += "<br /> -Please Enter Appellate Address in Appellate  Detail";
        $('#txtAppellateAddress').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAppellateAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (txtAppellateAddress != null) {
        $('#txtAppellateAddress').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtAppellateAddress').css({ "background-color": "#ffffff" });
    }

    if (ddlDistrict3 == "0" || ddlDistrict3 == "-Select District-" || ddlDistrict3 == "") {
        text += "<br /> -Please Select District in Revisional Authority Detail.";
        $('#ddlDistrict3').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDistrict3').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDistrict3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlDistrict3').css({ "background-color": "#ffffff" });
    }
  
    if (ddlDept3 == "0" || ddlDept3 == "-Select Department-" || ddlDept3 == "") {
        text += "<br /> -Please Select Department in Revisional Authority Detail.";
        $('#ddlDept3').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDept3').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDept3').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlDept3').css({ "background-color": "#ffffff" });
    }

    var ddlRevisionalAuthority = $("#ddlRevisionalAuthority").val();
    var txtRevisionalAuthority = $("#txtRevisionalAuthority").val();
    var txtRevisionalAddress = $("#txtRevisionalAddress").val();

    if (ddlRevisionalAuthority == "0" || ddlRevisionalAuthority == "-Select Department-" || ddlRevisionalAuthority == "") {
        text += "<br /> -Please Select RevisionalAuthority in Revisional Authority Detail.";
        $('#ddlRevisionalAuthority').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlRevisionalAuthority').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlRevisionalAuthority').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlRevisionalAuthority').css({ "background-color": "#ffffff" });
    }

    if (txtRevisionalAuthority == null || txtRevisionalAuthority == "") {
        text += "<br /> -Please Enter Revisional Authority in Rivisional   Detail";
        $('#txtRevisionalAuthority').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRevisionalAuthority').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (txtRevisionalAuthority != null) {
        $('#txtRevisionalAuthority').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRevisionalAuthority').css({ "background-color": "#ffffff" });
    }

    if (txtRevisionalAddress == null || txtRevisionalAddress == "") {
        text += "<br /> -Please Enter Revisional Revisional Address in Rivisional   Detail";
        $('#txtRevisionalAddress').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRevisionalAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (txtRevisionalAddress != null) {
        $('#txtRevisionalAddress').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRevisionalAddress').css({ "background-color": "#ffffff" });
    }




    //************* Show alert popup for options which has not filled by user. **************
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}