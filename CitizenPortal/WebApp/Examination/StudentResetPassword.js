

$(document).ready(function () {
debugger;
var qs = getQueryStrings();
    if (qs['AppID'] != null) {
        fnFetchStudentDetails(qs['AppID']);
    }

    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);
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

function selectByVal(p_Control, txt) {
    var t_Value = txt;
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }
    return t_Value;
}

// function ValiateEmail() {
    // var EmailID = $("#EmailID");
    // if (EmailID.val() != '') {
        // var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        // if (!emailmatch.test(EmailID.val())) {
            // $("#EmailID").val('');
            // EmailID.attr('style', 'border:1px solid #d03100 !important;');
            // EmailID.css({ "background-color": "#fff2ee" });
            // alertPopup("Email Validation", "<BR>" + " \u002A" + " Please Enter EmailID In Proper Format.")
        // }
    // }
// }

function fnFetchStudentDetails(AppID) {
    debugger;
    $.when(
      $.ajax({
          type: "POST",
          contentType: "application/json; charset=utf-8",
          url: '/WebApp/Examination/StudentResetPassword.aspx/GetApplicationDetails',
          data: '{"AppID":"' + AppID + '"}',
          processData: false,
          dataType: "json",
          success: function (response) {

          },
          error: function (a, b, c) {
              alert("1." + a.responseText);
          }
      })
       ).then(function (data, textStatus, jqXHR) {
           var obj = jQuery.parseJSON(data.d);
           var AppID = obj.ApplicationTB[0].RegNo;
           var arr = eval(obj.ApplicationTB);

           var html = "";
           var RegdNo = arr[0].RegNo;
           var RollNo = arr[0].RollNo
           var Name = arr[0].Name;
           var mobile = arr[0].Mobile;
           var email = arr[0].Email;           
           var Gender = arr[0].Gender;           
           var CollegeName = arr[0].College;
           var Branch = arr[0].Branch;
           var CourseName = arr[0].CourseName;
           var Program = arr[0].ProgramName;
           var AdmissionYear = arr[0].AdmissionYear;
           var Session = arr[0].Session;
           var CurrentSemester = arr[0].CurrentSemester;
           var Photograph = arr[0].Photograph;
           var Signature = arr[0].Signature;

           $('#hdnLoginID').val(RegdNo);

           if (AdmissionYear != null && AdmissionYear != "") {
               $('#txtAdmissionYear').val(AdmissionYear);
               $('#txtAdmissionYear').prop('disabled', true);
           }
           if (Session != null && Session != "") {
               $('#Session').val(Session);
               $('#Session').prop('disabled', true);
           }

           if (CollegeName != null && CollegeName != "") {
               $('#CollegeName').val(CollegeName);
               $('#CollegeName').prop('disabled', true);
           }
           if (CurrentSemester != null && CurrentSemester != "") {
               $('#CurrentSemester').val(CurrentSemester);
               $('#CurrentSemester').prop('disabled', true);
           }
           
            if (CourseName != null && CourseName != "") {
                $('#txtCourse').val(CourseName);
                $('#txtCourse').prop('disabled', true);
            }

            if (Program != null && Program != "") {
                $('#txtProgram').val(Program);
                $('#txtProgram').prop('disabled', true);
            }

           if (Name != null && Name != "") {
               $('#txtName').val(Name);
               $('#txtName').prop('disabled', true);
           }
          
           if (email != null && email != "") {
               $('#EmailID').val(email);
           }

           if (mobile != null && mobile != "") {
               $('#mobileNo').val(mobile);
           }
          
           if (CourseName != null && CourseName != "") {
               $('#CourseName').val(CourseName);
               $('#CourseName').prop('disabled', true);
           }
           if (RegdNo != null && RegdNo != "") {
               $('#RegdNo').val(RegdNo);
               $('#RegdNo').prop('disabled', true);

               $('#txtUserID').val(RegdNo);
               $('#txtUserID').prop('disabled', true);
           }
           
           if (RollNo != null && RollNo != "") {
               $('#RollNo').val(RollNo);
               $('#RollNo').prop('disabled', true);
           }          

           if (Gender != null && Gender != "") {
               selectByVal("ddlGender", Gender);
               $('#ddlGender').prop('disabled', true);
           }

           if (Photograph != null && Photograph != "") {
               $('#myImg').attr("src", Photograph);
               $('#myImg').prop('disabled', true);
               $('#ApplicantImage').hide();
           }
           else{$('#ApplicantImage').show();}

           if (Signature != null && Signature != "") {
               $('#mySign').attr("src", Signature);
               $('#mySign').prop('disabled', true);
               $('#ApplicantSign').hide();
           }else{$('#ApplicantSign').show();}

       });
}

//Strong password
function pwdStrength(p1) {
    var lenPwd = p1.value;
    var password = p1.value;

    if (p1.value == "") {
        alertPopup('Form Validation', "Please Enter New Password");
        p1.focus();
        return false;
    }
    if ((lenPwd.length > 7) && password.match(/[a-z]/) && password.match(/[A-Z]/) && password.match(/\d+/) && password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/)) {
        return true;
    }
    else {
        var text = "Password should be minimum of 8 Digit & it should contain combination of Numeric, Special character and Alphabets (Both in Upper and Lower Cases)";
        alertPopup("Please fill following information.", text);
        p1.focus();
        p1.value = "";
        return false;
    }
}

function fnCompairPassword() {
    debugger;
    ProfileStatus = 0; opt = ""; text = '';
    $('#hdnLoginID').val($('#txtUserID').val());
    var ConfirmPassword = $("#txtConfirm");
    var Password = $("#txtPassword");

    if (Password.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Password. ";
        Password.attr('style', 'border:1px solid #d03100 !important;');
        Password.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        Password.attr('style', 'border:1px solid #cdcdcd !important;');
        Password.css({ "background-color": "#ffffff" });
    }

    if (ConfirmPassword.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Confirm Password. ";
        ConfirmPassword.attr('style', 'border:1px solid #d03100 !important;');
        ConfirmPassword.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        ConfirmPassword.attr('style', 'border:1px solid #cdcdcd !important;');
        ConfirmPassword.css({ "background-color": "#ffffff" });
    }

    if (ProfileStatus != 1 && $('#hdnLoginID').val() != "") {
        
        if (ConfirmPassword.val() != Password.val()) {
            text = 'Password and confirm Password are not same.';
            ConfirmPassword.attr('style', 'border:1px solid #d03100 !important;');
            ConfirmPassword.css({ "background-color": "#fff2ee" });

            Password.attr('style', 'border:1px solid #d03100 !important;');
            Password.css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        //else {
        //    ConfirmPassword.attr('style', '1px solid #cdcdcd !important;');
        //    ConfirmPassword.css({ "background-color": "#ffffff" });

        //    Password.attr('style', '1px solid #cdcdcd !important;');
        //    Password.css({ "background-color": "#ffffff" });
        //    text = "";
        //    opt = 0;
        //}

        if (opt == "1") {
            alertPopup("Please fill following information.", text);
            return false;
        }
        return true;
    }

    return true;
}

function MobileValidation(MobileNo) {
    var MobileVal = $("[id*=" + MobileNo + "]").val();
    var text = "";
    var opt = "";

    if (isNaN(MobileVal) || MobileVal.indexOf(" ") != -1) {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Mobile Number.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:1px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (MobileVal.length > 10 || MobileVal.length < 10) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Be of 10 Digit.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:1px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (!(MobileVal.charAt(0) == "9" || MobileVal.charAt(0) == "8" || MobileVal.charAt(0) == "7" || MobileVal.charAt(0) == "6")) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 9 ,8, 7 or 6.";
        $("[id*=" + MobileNo + "]").attr('style', 'border:1px solid red !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("[id*=" + MobileNo + "]").attr('style', 'border:1px solid green !important;');
        $("[id*=" + MobileNo + "]").css({ "background-color": "#ffffff" });
        return true;
    }

    if (opt == "1") {
        alertPopup("Mobile Information.", text);
        $("[id*=" + MobileNo + "]").focus;
        return false;
    }
}

function ValiateEmail() {
    debugger;
    var EmailID = $("#EmailID");
    var text = "";
    var opt = "";
	if (EmailID.val() == "") {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Email ID.";
        EmailID.attr('style', 'border:1px solid red !important;');
        EmailID.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (EmailID.val() != '') {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val())) {
            $("#EmailID").focus;
            EmailID.attr('style', 'border:1px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });            
            text += "<br/>" + " \u002A" + " Please enter valid email id.";
            opt = 1;
        }

        // if (opt == "1") {
            // alertPopup("Email Id Information.", text);
            // $("[id*=" + EmailID + "]").focus;
            // return false;
        // }
    }
	
	
	if (opt == "1") {
        alertPopup("Email Id Information.", text);
        EmailID.focus;
        return false;
    }
	
	return true;
}

function ValidateForm() {
    var text = "";
    var opt = "";

    var RegdNo = $("#RegdNo");
    var RollNo = $("#RollNo");

    var FirstName = $("#txtName");
    var MobileNo = $("#mobileNo");
    var EmailID = $("#EmailID");
    var Password = $("#txtPassword");
    var ConfirmPassword = $("#txtConfirm");

    if (RegdNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter DTE Registration No. ";
        RegdNo.attr('style', 'border:1px solid #d03100 !important;');
        RegdNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RegdNo.attr('style', 'border:1px solid #cdcdcd !important;');
        RegdNo.css({ "background-color": "#ffffff" });
    }

    if (RollNo.val() == null || RollNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter CSVTU Registration No.";
        RollNo.attr('style', 'border:1px solid #d03100 !important;');
        RollNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RollNo.attr('style', 'border:1px solid #cdcdcd !important;');
        RollNo.css({ "background-color": "#ffffff" });
    }
    
    if (FirstName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Full Name. ";
        FirstName.attr('style', 'border:1px solid #d03100 !important;');
        FirstName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FirstName.attr('style', '1px solid #cdcdcd !important;');
        FirstName.css({ "background-color": "#ffffff" });
    }

    if (MobileNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        MobileNo.css({ "background-color": "#ffffff" });
    }

    if (EmailID.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Email ID. ";
        EmailID.attr('style', 'border:1px solid #d03100 !important;');
        EmailID.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
        EmailID.css({ "background-color": "#ffffff" });
    }

    //if (Password.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Password and Confirm Password. ";
    //    Password.attr('style', 'border:1px solid #d03100 !important;');
    //    Password.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    Password.attr('style', 'border:1px solid #cdcdcd !important;');
    //    Password.css({ "background-color": "#ffffff" });
    //}

    //if (Password.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Password. ";
    //    Password.attr('style', 'border:1px solid #d03100 !important;');
    //    Password.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    Password.attr('style', 'border:1px solid #cdcdcd !important;');
    //    Password.css({ "background-color": "#ffffff" });
    //}

    //if (ConfirmPassword.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Confirm Password. ";
    //    ConfirmPassword.attr('style', 'border:1px solid #d03100 !important;');
    //    ConfirmPassword.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    ConfirmPassword.attr('style', 'border:1px solid #cdcdcd !important;');
    //    ConfirmPassword.css({ "background-color": "#ffffff" });
    //}


    if (EL("myImg").src.indexOf("photo.png") != -1) {
        text += "<BR>" + " \u002A" + " Please upload Applicant Photograph.";
        $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
        $('#myImg').css({ "background-color": "#fff2ee" });
        $('#myImg').css({ "height": "220px" });
        opt = 1;
    } else {
        $('#myImg').attr('style', 'border:0 !important;');
        $('#myImg').css({ "background-color": "" });
        $('#myImg').css({ "height": "220px" });
    }

    if (EL("mySign").src.indexOf("signature.png") != -1) {
        text += "<BR>" + " \u002A" + " Please upload Applicant Signature.";
        $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
        $('#mySign').css({ "background-color": "#fff2ee" });
        $('#mySign').css({ "height": "140px" });
        opt = 1;
    } else {
        $('#mySign').attr('style', '');
        $('#mySign').css({ "background-color": "" });
        $('#mySign').css({ "height": "140px" });
    }

    //END Here
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function SubmitData() {
    debugger;
    if (!MobileValidation('mobileNo')) { return false; };
    if (!ValiateEmail()) { return false; }
    
    if (!ValidateForm()) { return false; }
if (!fnCompairPassword()) { return false; }
    $("#btnSubmit").prop('disabled', true);

    var qs = getQueryStrings();
    var uid = qs["AppID"];
    var svcid = qs["SvcID"];

    var t_Message = "";
    var result = false;

    var temp = "Gunwant";
    var rtnurl = "";

    var datavar = {
        
        'LoginID' : $('#RegdNo').val(),
        'Password': $('#txtConfirm').val(),
        'MobileNo': $('#mobileNo').val(),
        'EmailID': $("#EmailID").val(),
        'EnrollmentNo': $('#RegdNo').val(),
        'RollNo': $('#RollNo').val(),
        'Photograph': $('#HFb64').val(),
        'Signature': $('#HFb64Sign').val(),
        'JSONData': ''

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
            url: '/WebApp/Examination/StudentResetPassword.aspx/InsertData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $('#g207').hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Update Password, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {

            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null) {
                $('#g207').hide();
                $("#btnSubmit").prop('disabled', false);
                alertPopup("Form Validation Failed", "Error While Saving Application.!!!, <BR> Entered '" + $('#RegdNo').val() + "' has already been updated!!!");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                return;
            }
            else {
                if (result /*&& jqXHRData_IMG_result*/) {
                    $('#g207').hide();
                    $("#btnSubmit").prop('disabled', false);
                    alertPopup("Password!!", "Password Updated successfully for Enrollment No : " + $('#RegdNo').val() + ". Please Login to use CSVTU Digivarsity.");
                    //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=419&AppID=' + obj.AppID;
                    window.location.href = "/Account/Login";
                }
                else {
                    $('#g207').hide();
                    $("#btnSubmit").prop('disabled', false);
                    alertPopup("Form Validation Failed", "Unable to update password, Please refresh the browser and try again");
                }
            }
        });// end of Then function of main Data Insert Function

    return false;
}

function EL(id) {
    return document.getElementById(id);
} // Get el by ID helper function


function readFile() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 10 || sizekb > 50) {
            // $('#imgupload').attr('src', null);
            alert('The size of the photograph should fall between 20KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }
        var ftype = this;
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Photograph only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
            }
            else {
                alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("myImg").src = e.target.result;
            EL("HFb64").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}


function readFile2() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfSign').val(sizekb);
        if (sizekb < 5 || sizekb > 20) {
            // $('#imgupload').attr('src', null);
            alert('The size of the signature should fall between 10KB to 20KB. Your signature Size is ' + sizekb + 'kb.');
            return false;
        }

        var ftype = this; //document.getElementById('File1');
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Signature only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
            }
            else {
                alert("Signature only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("mySign").src = e.target.result;
            EL("HFb64Sign").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}
