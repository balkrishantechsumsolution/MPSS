<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CitizenPortal.WebApp.Entrance.Login.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../../../Sambalpur/js/SHA256.js"></script>
    <%--<script src="~/Sambalpur/js/SHA256.js"></script>--%>
    <script type="text/javascript">
        var salt = '<%= Session["SaltKey"].ToString() %>';            
    </script>
    <script type="text/javascript">

        function submitForm() {
            debugger;
            var strhiden = sha256_digest(salt);
            var pwd1 = $('#txtPassword').val();
            var pwd1 = pwd1;
            pwd1 = sha256_digest(pwd1);


            var encipt1 = sha256_digest(pwd1.toLowerCase() + strhiden.toLowerCase());
            $('#txtPassword').val(encipt1);
        }
    </script>
    <style>
        .ouat_loginholder {
            background-image: url('/PortalImages/csvtu_bgimg.jpg');
            background-repeat:no-repeat;
            background-size: 100% 100%;
            min-height: 552px;
        }

        .ouat_bdrbg {
            background-color: rgba(255,255,255,0.6);
            border: 1px solid #EFEFEF;
            min-height: 100%;
            position: relative;
            top: 50px;
        }

        .grdnt_bg {
            background-image: linear-gradient(to bottom right, rgb(110 168 255 / 90%), rgb(160 160 160 / 5%));
            min-height: 420px;
            text-align: center;
            padding: 40px;
            margin: 16px;
        }

            .grdnt_bg h1 {
                font-family: 'proximanovaaltbold';
                color: #fff;
                margin-bottom: 60px;
                letter-spacing: 0.10em;
            }

        .h45 {
            height: 45px !important;
        }

        .captcha_code {
            background-color: #fff;
            padding: 9px 0 10px;
            font-weight: bold;
            font-size: 20px;
        }

        .btn_ouatlogin {
            background-color: #2E4742;
            color: #fff;
            width: 100%;
            border: none;
            border-radius: 2px;
            padding: 20px 20px;
            transition: all .5s;
        }

            .btn_ouatlogin:hover {
                box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
            }


        .forgot_bg {
            background-image: linear-gradient(to bottom right, rgba(229,57,53,0.9), rgba(227,93,91,0.9));
            min-height: 530px;
            text-align: center;
            padding: 40px;
            margin: 16px;
        }

            .forgot_bg h1 {
                font-family: 'proximanovaaltbold';
                color: #fff;
                margin-bottom: 60px;
                letter-spacing: 0.10em;
            }

        .btn_frgtpwd {
            background-color: #891512;
            color: #fff;
            width: 100%;
            border: none;
            border-radius: 2px;
            padding: 20px 20px;
            transition: all .5s;
        }

            .btn_frgtpwd:hover {
                box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
            }


        .btn_verifypwd {
            background-color: #001659;
            color: #fff;
            width: 100%;
            border: none;
            border-radius: 2px;
            padding: 20px 20px;
            transition: all .5s;
        }

            .btn_verifypwd:hover {
                box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="container-fluid">
            <div class="ouat_loginholder">
                <div class="col-lg-5"></div>
                <div class="col-lg-6">
                    <div class="ouat_bdrbg">
                        <div class="grdnt_bg">
                            <h1 style="color:#03112b;font-weight:bold">LOGIN</h1>

                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"></div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 p0 text-center">
                                <asp:Label ID="lblmsg" runat="server" CssClass="alert2 alert-danger"></asp:Label>
                            </div>
                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"></div>
                            <div class="clearfix"></div>
                            <div class="mtop10"></div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 p0">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <asp:TextBox ID="txtLoginID" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 p0">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-eye"></i></span>
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 pleft0 text-left">
                                <label class="form-label" for=""><b>Captcha Code <span style="color: red">*</span></b></label>
                                <img src="/Account/GetCaptcha" alt="verification code" />
                            </div>

                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 captcha_code">

                                <asp:TextBox MaxLength="6" ID="captcha" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="captcha" ErrorMessage="Captcha Required" Display="Dynamic" ForeColor="red" SetFocusOnError="True" CssClass="m0 text-right alert2 alert-danger">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="clearfix"></div>
                            <div class="mtop10"></div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 p0">
                                <div class="form-group">
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary col-md-12 pright0 btnLogin" OnClientClick="javascript: return submitForm()" />

                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>

                            <div class="clearfix"></div>
                            <div class="mtop10"></div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 pright0">
                                <div class="form-group">
                                    <span class="pull-left"><a href="ForgotPassword.aspx" style="color: #042542;font-weight:bold;">Forgot Password?</a></span>
                                    <span class="pull-right"><a href="default.aspx" style="color: #042542; font-weight:bold;">Back to Home</a></span>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
