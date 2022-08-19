  // for md5 encryption);
  function md5auth(seed) {
        debugger;
        var oldpwd = $('#txtcurrentpass').val();
        var newpwd = $('#ContentPlaceHolder1_txtnewpass').val();
        var confirmpwd = $('#ContentPlaceHolder1_txtconfirmpass').val();
        var confirmpassword = confirmpwd;
        var oldpassword = oldpwd;
        var newpassword = newpwd;
        pwd1 = calcMD5(oldpassword);

        var hash = calcMD5(seed + pwd1.toUpperCase());
        //oldpwd.value = seed + hash.oldpassword();

        var newHash = calcMD5(newpassword).toUpperCase();
        //newpwd.value = newHash;

        var conhash = calcMD5(confirmpassword).toUpperCase();
        //repwd.value = conhash;

        if (newHash != conhash)
        {
            alert("Password mismatch.");
            return false;
        }
        
        $('#txtcurrentpass').val(hash.toUpperCase());
        $('#ContentPlaceHolder1_txtnewpass').val(newHash);
        $('#ContentPlaceHolder1_txtconfirmpass').val(conhash);


        return true;


    }
  
  function md5authlogin(seed) {
    debugger;
    var newpwd = $('#txtnewpass').val();
    var newpassword = newpwd;
    $('#hdnfldPass').val(newpassword);

    var confirmpwd = $('#txtconfirmpass').val();
    var confirmpassword = confirmpwd;
    //$('#ContentPlaceHolder1_hdnfldPass1').val(confirmpassword);


    var newHash = calcMD5(seed + (calcMD5(newpassword).toUpperCase()));
    var confirmHash = calcMD5(seed + (calcMD5(confirmpassword).toUpperCase()));

    if (newHash != confirmHash) {
        alert("Password mismatch.");
        return false;
    }

    $('#txtnewpass').val(newHash);
    $('#txtconfirmpass').val(confirmHash);


    return true;


}


function GetCitizenLoginCount() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Login/ChangePassword.aspx/GetCitizenUserCount',
        data: '{"LoginId":"' + $('#HdnField').val() + '","Password":"' + sha256_digest($('#txtcurrentpass').val()).toLowerCase() + '","Flag":"' + 2 + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            if (result.d == "1") {
                $('#lblmsg').text("");
                $('#lblmsg').text("Password Matched In DataBase!!!");
                $('#lblmsg').removeClass('alert2 alert-danger');
                $('#lblmsg').attr('style', 'color: green !important;');
                $('#lblmsg').addClass('alert2 alert-success');
            }
            else {
                $('#lblmsg').text("");
                $('#lblmsg').text("*Invalid Password or Password Not Matched In DataBase!!!");
                $('#lblmsg').attr('style', 'color: red !important;');
                $('#lblmsg').addClass('alert2 alert-danger');
            }
        },
        error: function (a, b, c) {
            //alert("4." + a.responseText);
        }
    });
}


function GetDeptLoginCount() {
    //var oldpwd = $('#txtcurrentpass').val();
    //pwd1 = calcMD5(oldpwd);
    //var hash = calcMD5(seed + pwd1.toUpperCase());
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/G2G/ChangePassword.aspx/GetDeptUserCount',
        data: '{"LoginId":"' + $('#ContentPlaceHolder1_HdnField').val() + '","Password":"' + sha256_digest($('#txtcurrentpass').val()).toLowerCase() + '","Flag":"' + 1 + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            if (result.d == "1") {
                $('#ContentPlaceHolder1_lblmsg').text("");
                $('#ContentPlaceHolder1_lblmsg').text("Password Matched In DataBase!!!");
                $('#ContentPlaceHolder1_lblmsg').removeClass('alert2 alert-danger');
                $('#ContentPlaceHolder1_lblmsg').attr('style', 'color: green !important;');
                $('#ContentPlaceHolder1_lblmsg').addClass('alert2 alert-success');
            }
            else {
                $('#ContentPlaceHolder1_lblmsg').text("");
                $('#ContentPlaceHolder1_lblmsg').text("*Invalid Password or Password Not Matched In DataBase!!!");
                $('#ContentPlaceHolder1_lblmsg').attr('style', 'color: red !important;');
                $('#ContentPlaceHolder1_lblmsg').addClass('alert2 alert-danger');
            }
        },
        error: function (a, b, c) {
            //alert("4." + a.responseText);
        }
    });
}

//SHA256 Logic For Change Password
function submitForm() {
    debugger;
    //var vsalt = $('#HDNSaltKey').val();
    var strhiden = sha256_digest(salt);
    var pwd1 = $('#txtcurrentpass').val();
    var pwd1 = pwd1;
    pwd1 = sha256_digest(pwd1);

    var newpasspwd = $("#txtnewpass").val();
    var cnfnewpasspwd = $("#txtconfirmpass").val();
    newpasspwd = sha256_digest(newpasspwd);//sha256_digest(newpasspwd + strhiden);
    cnfnewpasspwd = sha256_digest(cnfnewpasspwd);

    var encipt1 = sha256_digest(pwd1.toLowerCase() + strhiden.toLowerCase());
    $('#txtcurrentpass').val(encipt1);
    $("#txtnewpass").val(newpasspwd);
    $("#txtconfirmpass").val(cnfnewpasspwd);
}