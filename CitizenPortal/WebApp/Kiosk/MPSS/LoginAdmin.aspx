<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.LoginAdmin" %>

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
    <script src="../../Scripts/sha512.js"
    <!-- IE10 viewport hack END for Surface/desktop Windows 8 bug -->
    <script src="../../WebApp/Scripts/DisableBackButton.js"></script>
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
            //var vsalt = $('#HDNSaltKey').val();
            var shaObj = new jsSHA(salt, "ASCII");
            var strhiden = shaObj.getHash("SHA-512", "HEX");

            //var strhiden = sha256_digest(salt);
            var pwd1 = $('#txtPassword').val();
            var pwd1 = pwd1;
            /* pwd1 = sha256_digest(pwd1);*/

            var shaObj1 = new jsSHA(pwd1, "ASCII");
            var pwd1 = shaObj1.getHash("SHA-512", "HEX");

            var shaObj2 = new jsSHA(pwd1.toLowerCase() + strhiden.toLowerCase(), "ASCII");
            var encipt1 = shaObj2.getHash("SHA-512", "HEX");
            //var encipt1 = sha256_digest(pwd1.toLowerCase() + strhiden.toLowerCase());
            $('#txtPassword').val(encipt1);
           
        }
      

    </script>
    
</head>
<body style="background-color: #fdfdfd">
    <form id="form1" runat="server">
        <div>



            <header>
                <div class="container-fluid" style="display: none">
                    <div class="row" style="background-color: #fd3535; clear: both; color: #fff;">
                        <div class="col-lg-12" style="padding-top: 7px; font-weight: bold">
                            <marquee>
                                " Unregister Existing Student : Candidate who has not created thier Login ID & Passowrd, please click to generate Login Id & Password <b><a href="/WebApp/Examination/SearchStudent.aspx#!" style="color: yellow">GENERATE LOGIN ID & PASSWORD</a></b> "
                            </marquee>
                        </div>
                    </div>
                </div>
                <div class="container-fluid whitebg myheader">

                    <div class="row tophead">
                        <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
                            <a href="../../../Default.aspx">
                                <img src="../Images/MPSOSLogo.jpg" class="img-responsive small-view" height="124" alt="Chhattisgarh Swami Vivekanad Technical University,Bhilai" /></a>
                        </div>
                        <div class="col-xs-12 col-sm-9 col-md-5 col-lg-7">
                            <h1>MADHYA PRADESH STATE OPEN SCHOOL EDUCATION BOARD BHOPAL</h1>

                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 common-nav pull-right">
                            <div class="row">
                                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-3 text-right pull-right">
                                </div>

                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>

                </div>
            </header>
            <div class="box-body box-body-open">
                <div class="rows" style="min-height: 500px; margin: 0 auto; width: 80%">

                    <div class="col-lg-12">
                        <%--<div id="page-wrapper" style="min-height: 311px;">--%>
                        <h2 class="form-heading">
                            <span class="col-lg-12 p0" style="font-family: 'Arial Unicode MS'; font-size: 32px;"><i class="fa fa-pencil-square-o"></i>श्रमोदय (आवासीय) विद्यालय प्रवेश परीक्षा 2023-24</span>
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
                                                <br />
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
                                                        <asp:TextBox ID="txtPassword"  placeholder="Password" CssClass="form-control" TextMode="password" runat="server"></asp:TextBox>
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
