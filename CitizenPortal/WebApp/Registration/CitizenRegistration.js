



$(document).ready(function () {
     GetCaptcha(1);
    //$("#btnConfirm").bind("click", function (e) { return checkDeclaration(); });
    $("#btnAvailability").bind("click", function (e) { return CheckAvabilityButton(); });
    $("#btnResend").bind("click", function (e) { return SendMobileCode(); });
});

function declaration(chk) {
    debugger;
    if (chk) {
        var name = $('#txtName').val();
        if (name != "") {
            $("#spndecl").html(name);
        }
        else {
            ValidateForm();
            document.getElementById('disclaimercheck').checked = false;
        }
    }
    else { $("#spndecl").html(""); }
}

function CheckAvability() {
    debugger;
    var strUserId = document.getElementById("txtUserID").value;
    var temp = "Niraj";
    if (strUserId == '' || strUserId == null) {
        $("#txtUserID").focus();
        alertPopup('Information! Field required validation...','Please enter Login Id to check avability');
    }
    else if (strUserId.length < 6 || strUserId.length > 20) {
        $("#txtUserID").val("").focus();
        alertPopup('Information! Field required validation...', 'Please enter atleast greater than 6  or less than 20 characters to create Login Id');
    }
    else {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/CitizenRegistration.aspx/CheckAvability',
            data: '{"prefix": "' + temp + '","UserId": "' + strUserId + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                debugger;
                var obj = jQuery.parseJSON(response.d);
                var html = "";
                AppID = obj.AppID;
                result = true;                

                if (AppID != "0") {
                    alertPopup('Login ID Validation', 'Sorry! ' + strUserId + ' already registered. Please enter another Login Id.');
                    $("#txtUserID").val('');
                    $("#txtUserID").facus();;
                }
                else { }
                    //alertPopup('Login ID Validation', strUserId + ' is available. You can use ' + strUserId + ' as Login Id.');
            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        });
    }
}

function CheckAvabilityButton() {
    debugger;
    var strUserId = document.getElementById("txtUserID").value;
    var temp = "Niraj";
    if (strUserId == '' || strUserId == null) {
        $("#txtUserID").focus();
        alertPopup('Information! Field required validation...', 'Please enter Login Id to check avability');
    }
    else if (strUserId.length < 6) {
        $("#txtUserID").val("").focus();
        alertPopup('Information! Field required validation...', 'Please enter atleast 6 character to create Login Id');
    }
    else {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/CitizenRegistration.aspx/CheckAvability',
            data: '{"prefix": "' + temp + '","UserId": "' + strUserId + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                debugger;
                var obj = jQuery.parseJSON(response.d);
                var html = "";
                AppID = obj.AppID;
                result = true;

                if (AppID != "0") {
                    alertPopup('Login ID Validation', 'Sorry! ' + strUserId + ' already registered. Please enter another Login Id.');
                    $("#txtUserID").val('');
                    $("#txtUserID").facus();;
                }
                else { }
                alertPopup('Login ID Validation', strUserId + ' is available. You can use ' + strUserId + ' as Login Id.');
            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        });
    }
}

function SendMobileCode() {
    debugger;
    var strMobile = document.getElementById("txtMobile").value;
   
    var error = 'Please enter 10 digit mobile no.';
    if (strMobile == '' || strMobile == null) {
        $("#txtMobile").focus;
        alertPopup('Error! Mandatory fields required...', error);
        return false;
    }
    else if (strMobile.length != 10) {
        $("#txtMobile").focus;
        alertPopup('Error! Mandatory fields required...', error);
        return false;
    }
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebÁpp/Registration/CitizenRegistration.aspx/SendOTP',
        data: '{"prefix": ""}',
        data: '{"DataBase": "' + DataBase + '","MobileNo": "' + strMobile + '","FormName": "' + strFormName + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Code = eval(response.d);
            var html = "";
            $.each(Code, function () {
                var strMobile = this.regMobile;
                var strOTP = this.strOTP;
                m_SMSID = this.SMSID;
            });


            if (strOTP != "" && strOTP != null)
                alert('The 6 digit  OTP Code has been SMS to  Your' + strMobile + '\Please enter the OTP Code verify the Mobile No.');
            else {
                alert('Sorry! Something went wrong, please try again.');
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function AuthenticateMobile() {
    debugger;
    alert(m_SMSID);
    var strMobile = document.getElementById("txtMobile").value;
    var strFormName = "UserProfile";
    var strSMSCode = document.getElementById("txtSMSCode").value;

    DataBase = $("#hdfDBName").val();
    DataBase = document.getElementById("hdfDBName").value;

    if (strSMSCode == '' || strSMSCode == null) {
        $("#txtSMSCode").focus;
        alert('Please enter 6 digit OTP Code sent  to ' + strMobile + ' mobile no.');
    }
    else if (strSMSCode.length != 6) {
        $("#txtSMSCode").focus;
        alert('Please enter 6 digit OTP Code sent  to ' + strMobile + ' mobile no.');
    }
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '<%=ResolveUrl("~/WebServices/SMSServices.svc/AuthSMSCode") %>',
        data: '{"prefix": ""}',
        data: '{"DataBase": "' + DataBase + '","MobileNo": "' + strMobile + '","FormName": "' + strFormName + '","SMSCode": "' + strSMSCode + '","SMSId": "' + m_SMSID + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Code = eval(response.d);
            var html = "";

            if (Code.Id.length == 0)
                alert('Please enter valid 6 digit OTP Code sent  to ' + strMobile + ' mobile no.');

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function checkDeclaration123() {
    debugger;

    if (!ValidateForm()) {
        return;
    }

    if (!(document.getElementById('disclaimercheck').checked == true)) {
        var merror = "Please read and check Disclaimer carefully and tick if you agree with the terms and conditions.";
        //$('[id$="errDec"]').html('<b>Below are the validation error(s), please rectify !</b><br/><br/>' + merror).css('display', 'block');
        document.getElementById('disclaimercheck').focus();
        alert("please check desclamar ");
        return false;
    }
    else {
        debugger;
        GetGridValue();
        var strUniv = document.getElementById("ddlUniv").value;
        var strFName = document.getElementById("txtFname").value;
        var strLName = document.getElementById("txtLName").value;
        var strMobileNo = document.getElementById("txtMobile").value;
        var strEmailId = document.getElementById("txtEmail").value;
        var strUserId = document.getElementById("txtUserId").value;
        var strPassword = document.getElementById("txtPassConfirm").value;
        var strCreatedBy = strUserId;
        var strUnqId = m_SMSID;
        var strCaptchaCode = "";
        var strFormName = "ProfileUpdate";
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '<%=ResolveUrl("~/WebServices/SMSServices.svc/CreateProfile") %>',
            data: '{"prefix": ""}',
            data: '{"UnivCode":"' + strUniv + '","FirstName":"' + strFName + '","LastName":"' +
            strLName + '","Mobile":"' + strMobileNo + '","Email":"' + strEmailId + '","CreatedBy":"' +
            strCreatedBy + '","UserId":"' + strUserId + '","Password":"' + strPassword + '","UnqUserID":"' + strUnqId + '","CaptchaCode":"' + strCaptchaCode + '","FormName":"' + strFormName + '"}',

            processData: false,
            dataType: "json",
            success: function (response) {
                var Submit = eval(response.d);
                var html = "";
                $.each(Submit, function () {

                });

            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        });
    }

}
var msg = "";
function fnCompairPassword() {
    debugger;
    if ($('#txtPassword').val() != $('#txtConfirm').val()) {
        msg = 'Password and confirm Password are not same.';
        alertPopup("Please check information.", msg);
        $('#txtConfirm').focus();
    }
}

function ValidateForm() {

    //CheckAvability();
    var text = "";
    var opt = "";

    /// Basic Information 
    var FullName = $("#txtName");
    var LoginID = $("#txtUserID");
    var Password = $("#txtPassword");
    var Confirm = $("#txtConfirm");
    var MobileNo = $("#txtMobile");
    var EmailID = $("#txtEmail");

    if (FullName.val() == '') {
        text += "<br /> -Please enter Full Name. ";
        opt = 1;
    }

    if (LoginID.val() == '') {
        text += "<br /> -Please enter Login ID Name. ";
        opt = 1;
    }

    if (Password.val() == '') {
        text += "<br /> -Please enter Password. ";
        opt = 1;
    }

    if (Confirm.val() == '') {
        text += "<br /> -Please enter Confirm Password. ";
        opt = 1;
    }

    if ($('#txtPassword').val() != $('#txtConfirm').val()) {
        text += "<br /> -Passwor and Confirm Password are not same";
        opt = 1;
    }

    if (MobileNo.val() == '') {
        text += "<br /> -Please enter Mobile No. ";
        opt = 1;
    }

    if (MobileNo.val() != '') {
        var mobmatch1 = /^[789]\d{9}$/;
        if (!mobmatch1.test(MobileNo.val())) {
            text += "<br /> -Please enter valid mobile Number.";
            opt = 1;
        }
    }

    if (EmailID.val() == '') {
        text += "<br /> -Please enter EMail ID. ";
        opt = 1;
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}

function fnCheckMobileNo() {
    debugger;
    //alert($('#HFCapID').val());
    var capid = $('#captcha').val();
    
    //if (capid != txtcapid)
    //{
    //    alert('Invalid Captcha Entered. Please Enter Captcha Again!!!' + capid+' enterd: '+txtcapid);
    //    return false;
    //}
    $('#divMsg').hide();
    $('#txtSMSCode').val("");
    var MobileNo = $("#txtMobile").val();
    var length = MobileNo.length;
    $("#divMsgTitle").text("Validate Form!");

    if ($("#txtMobile").val() == "") {
        //alert("Please enter 10 digit mobile number.");
        $("#divMsgDtls").text("Please enter 10 digit mobile number.");
        $("#txtMobile").focus();
        $('#divMsg').show();
        return false;
    }

    if (eval(length) < 10) {
        alert("Mobile number should be 10 digit");
        $("#txtMobile").focus();
        $("#txtMobile").val("");
        $('#divMsg').show();
        return false;
    }

    var mobmatch1 = /^[789]\d{9}$/;
    if (!mobmatch1.test(MobileNo)) {
        alert("Please Enter valid mobile Number.");
        return false;
    }

    var strUserId = document.getElementById("txtMobile").value;
    var temp = "Niraj";
    var result = false;

    $.when(
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/CitizenRegistration.aspx/CheckMobileNo',
        data: '{"prefix": "' + temp + '","MobileNo": "' + strUserId + '","CaptchaID":"' + capid + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {         
            debugger;
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    })).then(function (data, textStatus, jqXHR) {
        debugger;
        var obj = jQuery.parseJSON(data.d);
        var html = "";
        var strMobile = "";
        AppID = obj.AppID;
        if (obj.intStatus == 4)
        {
            alert(obj.Status);
            return false;
        }
                
        result = true;

        if (AppID > "0") {
            alertPopup('Login ID Validation', 'Sorry! Mobile No.: ' + strUserId + ' already registered. Please enter another Mobile No or check with Forget Password.');
        }
        else {
                
            GetCaptcha(2);
            $('#btnOTP').css("display", "none");
            $('#btnOTP').prop('disabled', true);
            //fnGenOTP();

        }
        //alert("Basic detail saved from Aadhaar.");
        //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

    });// end of Then function of main Data Insert Function

}
$("#btnOTP1").bind("click", function () {
    debugger;
    var M = '#txtMobile';
    var Mob = "";
    Mob = $(M).val();
    if (Mob != null && Mob != "") {
        $("#btnOTP").attr("style", "pointer-events:none;").html('<i class="fa fa-refresh fa-spin"></i> Loading wait ..');
        //$("#btnOTP").attr("disabled", true).html('<i class="fa fa-refresh fa-spin"></i> Loading wait ..');
        $(M).attr('style', 'border:2px solid green !important;');
        $(M).css({ "background-color": "#ffffff" });
        fnGenOTP();
    }
    else {
        $(M).attr('style', 'border:2px solid red !important;');
        $(M).css({ "background-color": "#fff2ee" });
        alertPopup("Mobile Information", "Please enter mobile number !");
        return;
    }

});

function submitForm() {
    debugger;
    var vsalt = $('#HDNSaltKey').val();
    var strhiden = sha256_digest($("#txtPassword").val());

    var newpasspwd = $("#txtPassword").val();
    var cnfnewpasspwd = $("#txtConfirm").val();
    newpasspwd = sha256_digest(newpasspwd);
    cnfnewpasspwd = sha256_digest(cnfnewpasspwd);

    $("#txtPassword").val(newpasspwd);
    $("#txtConfirm").val(cnfnewpasspwd);
}

function GetCaptcha(Cnt)
{
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/CitizenRegistration.aspx/CreateImage',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;
            var obj = response.d;//jQuery.parseJSON(response.d);
            $("#imgCaptcha").attr("src", "data:image/jpeg;base64," + obj);
            if(Cnt=='2')
            {
            fnGenOTP();
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}