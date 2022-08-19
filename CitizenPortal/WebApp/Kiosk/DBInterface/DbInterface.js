
function Onchange()
{
    event.preventDefault();
    return false;
}

function ValidateForm() {
   

    var text = "";
    var opt = "";
    var VesselName = $('#txtTimeLimit').val();

    if (VesselName == null || VesselName == '') {
        text += "<br /> -Please Enter Time Limit";
        $('#txtTimeLimit').attr('style', 'border:1px solid red !important;');
        $('#txtTimeLimit').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtTimeLimit').attr('style', 'border:1px solid #ddd !important;');
        $('#txtTimeLimit').css({ "background-color": "#ffffff" });
    }
    
    var VesselName = $('#txtRevisionalOffice').val();

    if (VesselName == null || VesselName == '') {
        text += "<br /> -Please Enter Revisional Authority Officer Name";
        $('#txtRevisionalOffice').attr('style', 'border:1px solid red !important;');
        $('#txtRevisionalOffice').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRevisionalOffice').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRevisionalOffice').css({ "background-color": "#ffffff" });
    }

    
    var txtRevisionalOfficeAddress = $('#txtRevisionalOfficeAddress').val();
    if (txtRevisionalOfficeAddress == null || txtRevisionalOfficeAddress == '') {
        text += "<br /> -Please Enter Revisional Authority Office Address";
        $('#txtRevisionalOfficeAddress').attr('style', 'border:1px solid red !important;');
        $('#txtRevisionalOfficeAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRevisionalOfficeAddress').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRevisionalOfficeAddress').css({ "background-color": "#ffffff" });
    }
    //
    var txtRevisionalMobileNo = $('#txtRevisionalEmailID').val();
    if (txtRevisionalMobileNo == null || txtRevisionalMobileNo == '') {
        text += "<br /> -Please Enter Revisional Authority Email ID";
        $('#txtRevisionalEmailID').attr('style', 'border:1px solid red !important;');
        $('#txtRevisionalEmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRevisionalEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRevisionalEmailID').css({ "background-color": "#ffffff" });
    }
    
    var txtRevisionalMobileNo = $('#txtRevisionalMobileNo').val();
    if (txtRevisionalMobileNo == null || txtRevisionalMobileNo == '') {
        text += "<br /> -Please Enter Revisional Authority Mobile No ";
        $('#txtRevisionalMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtRevisionalMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRevisionalMobileNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRevisionalMobileNo').css({ "background-color": "#ffffff" });
    }

    //
    var txtAppellateOffice = $('#txtAppellateOffice').val();
    if (txtAppellateOffice == null || txtAppellateOffice == '') {
        text += "<br /> -Please Enter Appellate Authority Officer Name";
        $('#txtAppellateOffice').attr('style', 'border:1px solid red !important;');
        $('#txtAppellateOffice').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAppellateOffice').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAppellateOffice').css({ "background-color": "#ffffff" });
    }

 

    var txtAppellateOfficeAddress = $('#txtAppellateOfficeAddress').val();
    if (txtAppellateOfficeAddress == null || txtAppellateOfficeAddress == '') {
        text += "<br /> -Please Enter Appellate Authority Office Address";
        $('#txtAppellateOfficeAddress').attr('style', 'border:1px solid red !important;');
        $('#txtAppellateOfficeAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAppellateOfficeAddress').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAppellateOfficeAddress').css({ "background-color": "#ffffff" });
    }
    var txtRevisionalMobileNo = $('#txtAppellateEmailID').val();
    if (txtRevisionalMobileNo == null || txtRevisionalMobileNo == '') {
        text += "<br /> -Please Enter Appellate Authority Email ID";
        $('#txtAppellateEmailID').attr('style', 'border:1px solid red !important;');
        $('#txtAppellateEmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAppellateEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAppellateEmailID').css({ "background-color": "#ffffff" });
    }
 
    var txtAppellateMobileNo = $('#txtAppellateMobileNo').val();
    if (txtAppellateMobileNo == null || txtAppellateMobileNo == '') {
        text += "<br /> -Please Enter Appellate Authority Mobile No";
        $('#txtAppellateMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtAppellateMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAppellateMobileNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAppellateMobileNo').css({ "background-color": "#ffffff" });
    }

    var txtDesignatedOffice = $('#txtDesignatedOffice').val();
    if (txtDesignatedOffice == null || txtDesignatedOffice == '') {
        text += "<br /> -Please Enter Designated Officer Name";
        $('#txtDesignatedOffice').attr('style', 'border:1px solid red !important;');
        $('#txtDesignatedOffice').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDesignatedOffice').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDesignatedOffice').css({ "background-color": "#ffffff" });
    }



    var txtDesignatedOfficeAddress = $('#txtDesignatedOfficeAddress').val();
    if (txtDesignatedOfficeAddress == null || txtDesignatedOfficeAddress == '') {
        text += "<br /> -Please Enter Designated Officer Office Address";
        $('#txtDesignatedOfficeAddress').attr('style', 'border:1px solid red !important;');
        $('#txtDesignatedOfficeAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDesignatedOfficeAddress').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDesignatedOfficeAddress').css({ "background-color": "#ffffff" });
    }
    
    var txtRevisionalMobileNo = $('#txtDesignatedEmailID').val();
    if (txtRevisionalMobileNo == null || txtRevisionalMobileNo == '') {
        text += "<br /> -Please Enter Designated Authority Email ID";
        $('#txtDesignatedEmailID').attr('style', 'border:1px solid red !important;');
        $('#txtDesignatedEmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDesignatedEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDesignatedEmailID').css({ "background-color": "#ffffff" });
    }

    var txtDesignatedMobileNo = $('#txtDesignatedMobileNo').val();
    if (txtDesignatedMobileNo == null || txtDesignatedMobileNo == '') {
        text += "<br /> -Please Enter Designated Officer Mobile No";
        $('#txtDesignatedMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtDesignatedMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDesignatedMobileNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDesignatedMobileNo').css({ "background-color": "#ffffff" });
    }
   

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}
function Emailcheck1() {
    debugger;
    var email = document.getElementById("txtDesignatedEmailID").value;
    var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{2,}))$/;
    if ($('#txtDesignatedEmailID').val() == '' || $('#txtRevisionalEmailID').val() == '0') {
        $('#txtDesignatedEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDesignatedEmailID').css({ "background-color": "#ffffff" });
        return false;
    }
    else if (email.match(reg)) {

        $('#txtDesignatedEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDesignatedEmailID').css({ "background-color": "#ffffff" });
        return true;

    }

    else {

        alert("Please Enter Correct Format Of Email ID 'abc@gmail.com'");
        $('#txtDesignatedEmailID').attr('style', 'border:1px solid red !important;');
        $('#txtDesignatedEmailID').css({ "background-color": "#fff2ee" });

        return false;
    }

}
function Emailcheck2() {
    debugger;
    var email = document.getElementById("txtAppellateEmailID").value;
    var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{2,}))$/;
    if ($('#txtAppellateEmailID').val() == '' || $('#txtAppellateEmailID').val() == '0') {
        $('#txtAppellateEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAppellateEmailID').css({ "background-color": "#ffffff" });
        return false;
    }
    if (email.match(reg)) {

        $('#txtAppellateEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAppellateEmailID').css({ "background-color": "#ffffff" });
       // return true;

    }
    //if (email == "" || email == null) {

    //    $('#txtAppellateEmailID').attr('style', 'border:1px solid #ddd !important;');
    //    $('#txtAppellateEmailID').css({ "background-color": "#ffffff" });
    //    // return true;

    //}
    else {
        alert("Please Enter Correct Format Of Email ID 'abc@gmail.com'");
        $('#txtAppellateEmailID').attr('style', 'border:1px solid red !important;');
        $('#txtAppellateEmailID').css({ "background-color": "#fff2ee" });

       // return false;
    }

}

function Emailcheck3() {
    debugger;
    var email = document.getElementById("txtRevisionalEmailID").value;
    var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{2,}))$/;
    if($('#txtRevisionalEmailID').val()== '' ||$('#txtRevisionalEmailID').val()=='0' )
    {
        $('#txtRevisionalEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRevisionalEmailID').css({ "background-color": "#ffffff" });
        return false;
    }
   else if (email.match(reg)) {

        $('#txtRevisionalEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRevisionalEmailID').css({ "background-color": "#ffffff" });
        return true;

    }
    
    else {

        alert("Please Enter Correct Format Of Email ID 'abc@gmail.com'");
        $('#txtRevisionalEmailID').attr('style', 'border:1px solid red !important;');
        $('#txtRevisionalEmailID').css({ "background-color": "#fff2ee" });

         return false;
    }

}

//  validation for mobile number
 function checkmobile1() {
    debugger;
    var emailid = document.getElementById('txtMobileNo').value;
    if (isNaN(emailid) || emailid.indexOf(" ") != -1) {
        alert("Invalid Mobile No.");
        $('#txtMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtMobileNo').css({ "background-color": "#fff2ee" });
        return false;
    }
    if (emailid.length > 10 || emailid.length < 10) {
        alert("Mobile No. should be 10 digit");
        $('#txtMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtMobileNo').css({ "background-color": "#fff2ee" });
        return false;
    }
    if (!(emailid.charAt(0) == "9" || emailid.charAt(0) == "8" || emailid.charAt(0) == "7")) {
        alert("Mobile No. should start with 9 ,8 or 7 ");
        $('#txtMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtMobileNo').css({ "background-color": "#fff2ee" });
        return false
    }
 
    else {
        //alert("You Entered Wrong IFSC Code");
        $('#txtMobileNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtMobileNo').css({ "background-color": "#ffffff" });

       // return true;
    }
    
}
function checkmobile2() {
    debugger;
    var emailid = document.getElementById('txtAppellateMobileNo').value;
    if (isNaN(emailid) || emailid.indexOf(" ") != -1) {
        alert("Invalid Mobile No.");
        $('#txtAppellateMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtAppellateMobileNo').css({ "background-color": "#fff2ee" });
      //  return false;
    }
    if (emailid.length > 10 || emailid.length < 10) {
        alert("Mobile No. should be 10 digit");
        $('#txtAppellateMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtAppellateMobileNo').css({ "background-color": "#fff2ee" });
      //  return false;
    }
    if (!(emailid.charAt(0) == "9" || emailid.charAt(0) == "8" || emailid.charAt(0) == "7")) {
        alert("Mobile No. should start with 9 ,8 or 7 ");
        $('#txtAppellateMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtAppellateMobileNo').css({ "background-color": "#fff2ee" });
       // return false
    }
 
    else {
        //alert("You Entered Wrong IFSC Code");
        $('#txtAppellateMobileNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAppellateMobileNo').css({ "background-color": "#ffffff" });

       // return true;
    }

}
 function checkmobile3() {
    debugger;
    var emailid = document.getElementById('txtRevisionalMobileNo').value;
    if (isNaN(emailid) || emailid.indexOf(" ") != -1) {
        alert("Invalid Mobile No.");
        $('#txtRevisionalMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtRevisionalMobileNo').css({ "background-color": "#fff2ee" });
      //  return false;
    }
    if (emailid.length > 10 || emailid.length < 10) {
        alert("Mobile No. should be 10 digit");
        $('#txtRevisionalMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtRevisionalMobileNo').css({ "background-color": "#fff2ee" });
        //return false;
    }
    if (!(emailid.charAt(0) == "9" || emailid.charAt(0) == "8" || emailid.charAt(0) == "7")) {
        alert("Mobile No. should start with 9 ,8 or 7 ");
        $('#txtRevisionalMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtRevisionalMobileNo').css({ "background-color": "#fff2ee" });
        //return false
    }

    else {
        //alert("You Entered Wrong IFSC Code");
        $('#txtRevisionalMobileNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRevisionalMobileNo').css({ "background-color": "#ffffff" });

        //return true;
    }

}