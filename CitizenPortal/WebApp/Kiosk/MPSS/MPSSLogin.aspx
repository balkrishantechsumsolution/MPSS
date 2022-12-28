<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MPSSLogin.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.MPSSLogin" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Sambalpur/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/normalize.min.css" rel="stylesheet" />

    <script src="/Sambalpur/js/jquery-2.2.3.min.js" type="text/javascript"></script>

    <!-- IE10 viewport hack START for Surface/desktop Windows 8 bug -->
    <link href="/Sambalpur/css/ie10-viewport-bug-workaround.css" type="text/css" rel="stylesheet" />
    <script src="/Sambalpur/js/ie-emulation-modes-warning.js" type="text/javascript"></script>
    <script src="/Sambalpur/js/SHA256.js"></script>

    <!-- IE10 viewport hack END for Surface/desktop Windows 8 bug -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="/Sambalpur/js/html5shiv.js" type="text/javascript"></script>
        <script src="/Sambalpur/js/respond.min.js" type="text/javascript"></script>
    <![endif]-->
    <style>
        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

            .form-heading span {
                font-size: 25px;
                padding-left: 0;
            }

        .w3-note {
            background: #99FFE5; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(#99FFE5, #4DA6FF); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(#99FFE5, #4DA6FF); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(#99FFE5, #4DA6FF); /* For Firefox 3.6 to 15 */
            background: linear-gradient(#99FFE5, #4DA6FF); /* Standard syntax */
            border-left: 6px solid #ffeb3b;
            text-align: center;
            box-shadow: 0 15px 10px -10px rgba(31, 31, 31, 0.5);
        }

        .w3-panel {
            text-align: center;
            height: 100px;
            padding: 0.01em 16px;
            margin-top: 16px !important;
            margin-bottom: 16px !important;
        }

            .w3-panel p {
                font-size: 30px !important;
                font-weight: bold;
                color: #002CB2 !important;
                padding: 25px 0 0 0;
            }

            .w3-panel span {
                font-size: 18px !important;
                font-weight: bold;
                color: #002751 !important;
            }

        #container {
            width: 100%;
        }

        @media only screen and (max-width: 768px) {
            #container {
                width: 100%;
                margin: 0 auto;
            }
        }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 49%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #337ab7;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }

        .form-heading {
            color: #820000 !important;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px !important;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            font-weight: bold;
        }

        #divElement {
            position: absolute;
            left: 70px;
            width: 96%;
            margin-left: -50px;
            background-color: #E3EAEB;
            color: #820000;
        }

            #divElement label {
                font-size: 22px;
                font-weight: bolder;
                font-family: 'Arial Unicode MS';
            }

        .main-content {
            width: 100%;
            height: 100%;
            background-image: url(/mpss/mpss/images/wallpaperSchool.jpg);
            background-repeat: no-repeat;
            background-size: 450px;
            margin-top: -48px;
            padding-top: 3em;
        }

        ​
    </style>
    <script type="text/javascript">           
        var salt = '<%= Session["SaltKey"] == null ? "":Session["SaltKey"].ToString() %>';
    </script>
    <script>
        $(document).ready(function () {
            $('#divLogin').hide();
        });
        function calcHash(variant) {
            var tmp = document.getElementById("ascii-comp");
            var shaObj = new jsSHA(document.getElementById("ascii-input").value, "ASCII");
            document.getElementById("ascii-result").value = shaObj.getHash(variant, "HEX");
            document.getElementById("ascii-result").select();
        }
        function submitForm() {
            debugger;

            //var shaObj = new jsSHA(salt, "ASCII");
            //var strhiden = shaObj.getHash("SHA-512", "HEX");

            var strhiden = sha256_digest(salt);
            var pwd = $('#txtPassword').val();
            var pwd1 = sha256_digest(pwd);

            //var shaObj1 = new jsSHA(pwd1, "ASCII");
            //var pwd1 = shaObj1.getHash("SHA-512", "HEX");

            //var shaObj2 = new jsSHA(pwd1.toLowerCase() + strhiden.toLowerCase(), "ASCII");
            //var encipt1 = shaObj2.getHash("SHA-512", "HEX");
            var encipt1 = sha256_digest(pwd1.toLowerCase() + strhiden.toLowerCase());
            $('#txtPassword').val(encipt1);

        }


    </script>

</head>
<body style="background-color: #fdfdfd">
    <form id="form1" runat="server">
        <div>
            <header>
                <div class="container-fluid whitebg myheader">
                    <div class="row tophead">
                        <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
                            <img src="../../../PortalImages/MPLogo.png" class="img-responsive small-view" width="141" height="124" alt="Maharshi Patanjali Sanskrit Sansthan, Bhopal" />
                        </div>
                        <div class="col-xs-12 col-sm-9 col-md-5 col-lg-6 logo">
                            <h2 style="margin: 10px auto; font-size: 23px; font-weight: bolder">MAHARSHI PATANJALI SANSKRIT SANSTHAN</h2>
                            <h2 style="margin: 10px auto; font-size: 25px; font-weight: bolder">महर्षि पतंजलि संस्कृत संस्थान, भोपाल</h2>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-5 common-nav text-right ptop20">
                            <a href="../../../mpss/mpss/index.html" class="navtop-homebtn"><i class="fa fa-home fa-fw"></i>Home</a>


                        </div>
                    </div>

                </div>
            </header>
            <section class="main-content">
                <div class="box-body box-body-open">
                    <div class="rows" style="min-height: 500px; margin: 0 auto; width: 50%">

                        <div class="col-lg-12">
                            <%--<div id="page-wrapper" style="min-height: 311px;">--%>
                            <h2 class="form-heading">
                                <span class="col-lg-12 p0" style="font-family: 'Arial Unicode MS'; font-size: 32px;"><i class="fa fa-pencil-square-o"></i>महर्षि पतंजलि संस्कृत संस्थान, भोपाल</span>
                                <span class="clearfix"></span>
                            </h2>
                            <div class="">
                                <div class="resp-tabs-container ver_1">
                                    <div style="margin-top: 10px;">
                                        <div>
                                            <div class="rows">

                                                <h2 class="form-heading">
                                                    <span class="col-lg-12 p0" style="font-family: 'Arial Unicode MS'; font-size: 32px;"><i class="fa fa-pencil-square-o"></i>Login Form</span>
                                                    <span class="clearfix"></span>
                                                </h2>
                                                <div class="clearfix"></div>

                                                <div id="divElement">
                                                    <div class="clearfix"></div>
                                                    <div class="clearfix"></div>
                                                    <br />
                                                    <div class="clearfix"></div>

                                                    <div class="box-body box-body-open">


                                                        <div class="clearfix"></div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p10">
                                                            <div class="form-group">
                                                                <label class="manadatory col-lg-3 rbt-grp" for="lblUserType" style="padding-left: 0;">
                                                                    User Type
                                                                </label>
                                                                <label class="col-lg-9" for="rbtYes" style="padding: 0;">
                                                                    <input type="radio" id="rdSchool" name="UserType" value="1" runat="server" class="mleft40" checked="true" required />School
                                        &nbsp;&nbsp;
                                       <input type="radio" id="rdDEOE" name="UserType" value="2" runat="server" />
                                                                    DEOE
                                        &nbsp;&nbsp;
                                        <input type="radio" id="rdADMIN" name="UserType" value="3" runat="server" />Admin

                                                                </label>
                                                            </div>
                                                            <br />
                                                        </div>

                                                    </div>



                                                    <div class="clearfix"></div>
                                                    <br />
                                                    <br />

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div class="form-group">
                                                            <label class="">
                                                                Username
                                                            </label>
                                                            <asp:TextBox placeholder="User Name" CssClass="form-control" ID="txtUserName" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                ControlToValidate="txtUserName" ErrorMessage="Please Enter Your Username"
                                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div class="form-group">
                                                            <label class="">
                                                                Password
                                                            </label>
                                                            <asp:TextBox ID="txtPassword" placeholder="Password" CssClass="form-control" TextMode="password" runat="server"></asp:TextBox>
                                                            &nbsp;<i id="togglePassword" class="fa fa-eye"></i>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                ControlToValidate="txtPassword" ErrorMessage="Please Enter Your Password"
                                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>


                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div class="form-group">
                                                            <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Log In" OnClick="Button1_Click" OnClientClick="javascript: return submitForm()" />

                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div class="form-group">

                                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </div>

        <asp:HiddenField ID="HdnField" runat="server" />
        <asp:HiddenField ID="hdnRandomNo" runat="server" />
        <asp:HiddenField ID="hdnfldPass" runat="server" />
        <asp:HiddenField ID="hdnfldPass1" runat="server" />

        <script src="/Sambalpur/js/bootstrap.min.js" type="text/javascript"></script>
        <%--Modal JS START HERE--%>
        <script src="/Sambalpur/js/velocity.min.js" type="text/javascript"></script>
        <script src="/Sambalpur/js/velocity.ui.min.js" type="text/javascript"></script>
        <script src="/Sambalpur/js/modaleffect.js" type="text/javascript"></script>
        <script type="text/javascript">
            var togglePassword = document.querySelector('#togglePassword');
            var password = document.querySelector('#txtPassword');
            togglePassword.addEventListener('click', function (e) {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.classList.toggle('fa-eye-slash');
            });
        </script>
    </form>
</body>
</html>
