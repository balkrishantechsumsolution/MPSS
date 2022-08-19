<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CitizenPortal.WebApp.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <style type="text/css">
        body {
            /*background-image: url('/WebApp/Kiosk/Images/Lingaraj-Temple-New.jpg');
        background-repeat: no-repeat;
        background-position: left;*/
        }

        h1 {
            margin: 0;
        }

        hr {
            margin: 0;
            padding: 0;
            clear: both;
            border: none;
        }

        #container_lgn {
            width: 512px;
        }

        .login-wrapper {
            width: 450px;
            margin: 0 auto;
        }

        .rbt-grp {
            padding-left: 0;
        }

        .text-align-center {
            text-align: center;
        }

        .Ltitle {
            font-weight: bolder;
            color: rgb(233, 84, 0);
        }

        .sub-title {
            color: rgb(0, 62, 0);
            margin: 2px;
            font-size: 15px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .sub-sub-title {
            color: rgb(0, 29, 0);
            margin-bottom: 10px;
            font-size: 15px;
            font-weight: bold;
            letter-spacing: 1.2px;
        }

        .box-container > .box-body {
            background-color: rgba(252, 252, 252, 0.93) !important;
        }
    </style>
</head>

<body style="width: 489px">
    <form id="form1" runat="server">
        <div class="" id="container_lgn" style="margin-top: 20px;">
            <div style="width: 115px; float: right; position: fixed; right: 0; margin: 20px 50px;">
                <img src="/webapp/kiosk/Images/odisalogo_1.png" width="115" />
            </div>
            <div class="">
                <div class="">
                    <div class="text-align-center">
                        <p class="text-align-center">
                            <img src="/WebApp/Kiosk/Images/depLgog.png" style="width: 140px" />
                        </p>
                        <h1 class="text-align-center Ltitle" style="font-size: 25px;">LOKASEBA ADHIKARA</h1>
                        <div class="sub-title">Common Application Portal (CAP)</div>
                        <div class="sub-sub-title">(An Initiative of Government of Odisha)</div>
                    </div>
                </div>
            </div>
            <div class="">
                <div class="login-wrapper box-container">
                    <div class="box-heading">
                        <h4 class="box-title">
                            <i class="fa fa-sign-in"></i>USER SIGN IN
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="divDec">
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory col-lg-3 rbt-grp" for="lblUserType">
                                    User Type
                                </label>
                                <label class="col-lg-9" for="rbtYes" style="padding: 0;">
                                    <script src="/Scripts/cscconnect.js"></script>
                                    <input runat="server" type="radio" id="UserTypeCitizen" name="UserType" value="Citizen" />Citizen
                                    <input runat="server" type="radio" id="UserTypeDept" name="UserType" value="G2G" />Department
                                </label>
                            </div>
                            <br>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory" for="UserName">
                                    Login ID
                                </label>
                                <asp:TextBox runat="server" ID="LoginID" MaxLength="20" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory" for="Password">
                                    Password
                                </label>
                                <asp:TextBox TextMode="Password" runat="server" ID="Password" MaxLength="15" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label class="manadatory" for="Village">
                                Verification Code
                            </label>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <div>
                                <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <div>
                                <asp:TextBox runat="server" ID="captcha" MaxLength="6" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="clearfix">
                            &nbsp;
                        </div>
                        <div class="col-md-5">
                            <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" OnClientClick="return submitForm();" CssClass="btn-success" Width="65px" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div style="width: 115px; float: right; position: fixed; right: 0; bottom: 0; margin: 20px 50px;">
                <img src="/webapp/kiosk/Images/cmgi.png" width="115" />
            </div>
        </div>
        <asp:HiddenField ID="hdnsaltkey" runat="server" />
        <asp:HiddenField ID="hdrandomSeed" runat="server" />
    </form>
</body>
</html>

<script src="/Scripts/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="/Scripts/md5.js"></script>

<script type="text/javascript">

    //function md5auth(seed) {
    //    var password = document.getElementById("Password").value;
    //    if (password != "") {
    //        //  var md1_password = hex_hmac_md5(password).toUpperCase();
    //        var hash = hex_md5(password);
    //        document.getElementById("Password").value = hash;
    //        return true;
    //    }
    //}


    function md5auth(seed) {
        debugger;
        var password1 = $('#Password');
        var password = password1.val();
        var hash = calcMD5(seed + calcMD5(password).toUpperCase());
        password1.val(hash.toUpperCase());
        return true;
    }

    function submitForm() {
        debugger;
        var UserName = document.getElementById("LoginID");
        var Pass = document.getElementById("Password");
        var Captcha = document.getElementById("captcha");
        var skv = document.getElementById("hdnsaltkey");

        //var UserType = document.getElementById("UserType");

        //if (!UserType.checked) {
        //    alert("* Please select User Type.");
        //    return false;
        //}

        var r = document.getElementsByName("UserType");
        var c = -1;

        for (var i = 0; i < r.length; i++) {
            if (r[i].checked) {
                c = i;
            }
        }
        if (c == -1) {
            alert("* Please select User Type.");
            return false;
        }

        if (UserName.value == null || UserName.value == "") {
            alert("* Please enter the Login Id.");
            UserName.focus();
            return false;
        }

        if (Pass.value == null || Pass.value == "") {
            alert("* Please enter the Password.");
            Pass.focus();
            return false;
        }
        if (Captcha.value == null || Captcha.value == "") {
            alert("* Please enter the Verification Code.");
            Captcha.focus();
            return false; s
        }

        //$('#hdrandomSeed').val($('#Password').val());

        //alert($('#hdrandomSeed').val());
        /*
        var strSaltKey = skv.value;

        var strPW = hex_hmac_md5(Pass.value, '');

        // alert(strPW);
        //  Pass.value = strPW;
        Pass.value = hex_hmac_md5(strPW, strSaltKey);
        */

        //if ($('#Password').val() != "") {
        //    var seed = $('#hdrandomSeed');
        //    return md5auth(seed.val());
        //}
        var strhiden = calcMD5($('#hdrandomSeed').val());
        var pwd1 = $('#Password').val();
        var pwd1 = pwd1;
        pwd1 = calcMD5(pwd1);
        var encipt1 = calcMD5(pwd1 + strhiden);
        //document.getElementById("txt_pass").maxLength = encipt1.length;
        //document.getElementById("txt_pass").value = encipt1;
        $('#Password').val(encipt1);
        //var newpassword = Pass.value;
        //var newHash = calcMD5(strSaltKey + (calcMD5(newpassword).toUpperCase()));
        //Pass.value = newHash;
        //var seed = $('#hdrandomSeed');
        //return md5auth(seed.val());
        return true;
    }
</script>
