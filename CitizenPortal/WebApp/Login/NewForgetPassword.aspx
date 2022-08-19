<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="NewForgetPassword.aspx.cs" Inherits="CitizenPortal.WebApp.Login.NewForgetPassword" ClientIDMode="Static" %>

<%@ Register Src="~/g2c/controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--<script src="/Scripts/jquery.msgBox.js"></script>--%>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function isNumber1(evt)
        {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
            {
                //  alert("Please enter only Numbers.");
                return false;
            }
            return true;
        }
        function ValidateNo1()
        {
            var phoneNo = document.getElementById('TextBox1');

            if (phoneNo.value == "" || phoneNo.value == null)
            {
                alert("Validate Mobile No.!\nPlease enter your Mobile Number !");
                document.getElementById("TextBox1").style.border = "1px solid red";
                return false;
            }
            if (phoneNo.value.length < 10 || phoneNo.value.length > 10)
            {
                alert("Validate Mobile No.!\nPlease enter 10 digit Mobile Number !");
                document.getElementById("TextBox1").style.border = "1px solid red";
                phoneNo.value = "";
                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript">
        function isNumber(evt)
        {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
            {
                //  alert("Please enter only Numbers.");
                return false;
            }
            return true;
        }
        function ValidateNo()
        {
            var phoneNo = document.getElementById('txtMobile');

            if (phoneNo.value == "" || phoneNo.value == null)
            {
                alert("Validate Mobile No.!</br>Please enter Registered Mobile Number !");
                document.getElementById("txtMobile").style.border = "1px solid red";
                return false;
            }
            if (phoneNo.value.length < 10 || phoneNo.value.length > 10)
            {
                alert("Validate Mobile No.!</br>Please enter 10 digit Mobile Number !");
                document.getElementById("txtMobile").style.border = "1px solid red";
                phoneNo.value = "";

                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $('#txtDBO').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',
            });
        });

        function ShowReSMS() {
            debugger;
            //var interval = 15000;
            //document.getElementById("ContentPlaceHolder1_BtnSendOTP").disabled = true;
            //document.getElementById("ContentPlaceHolder1_BtnSendOTP").style.display = "none";

            //document.getElementById("ContentPlaceHolder1_btnResendOTP").disabled = true;
            //document.getElementById("ContentPlaceHolder1_btnResendOTP").style.visibility = "visible";

            //document.getElementById("ContentPlaceHolder1_lblTimer").style.visibility = "visible";
            //var countDownDate = new Date().getTime() + interval;
            var countDownDate = new Date();
            //countDownDate.setHours(countDownDate.getHours() + 1);
            countDownDate.setMilliseconds(120 * 1000);
            countDownDate = countDownDate.getTime();

            // Update the count down every 1 second
            var x = setInterval(function () {

                // Get today's date and time
                var now = Date.now();

                // Find the distance between now and the count down date
                var distance = countDownDate - now;

                // Time calculations for days, hours, minutes and seconds
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Output the result in an element with id="demo"
                document.getElementById("lblTimer").innerHTML = "<i class='fa fa-clock-o '></i>Time Remain :" + minutes + " Minutes, " + seconds + " Seconds";

                // If the count down is over, write some text 
                if (distance < 0) {
                    clearInterval(x);
                    // document.getElementById("demo").innerHTML = "EXPIRED";
                    document.getElementById("Button4").disabled = false;
                    document.getElementById("lblTimer").style.visibility = "hidden";
                    //document.getElementById("ContentPlaceHolder1_btnResendOTP").value = "ReSend OTP";
                }
            }, 1);

            //setTimeout(function () {

            //    document.getElementById("ContentPlaceHolder1_btnResendOTP").disabled = false;
            //    document.getElementById("ContentPlaceHolder1_lblTimer").style.visibility = "hidden";
            //    document.getElementById("ContentPlaceHolder1_btnResendOTP").value = "ReSend OTP"
            //}, interval);
            /**/
            return true;
        }
    </script>

    <style type="text/css">
        .style1 {
            width: 30%;
            background-color: #FFCCCC;
        }

        .style2 {
            color: #FF0066;
            font-size: large;
        }

        .style3 {
            color: #FF0066;
            font-size: x-large;
        }

        .forgotpwdWrapper {
            background-color: #e0e0e0;
            /*opacity:0.7;*/
            margin: 0 auto 30px auto;
            width: 100%;
        }

        .forgotPwdHolder {
            width: 550px;
            margin: 0 auto;
        }

        .box-container {
            margin-bottom: 15px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .box-container1 > .box-heading {
            background-color: #565656;
            border: 1px solid #565656;
            border-radius: 3px 3px 0 0;
            color: #fff;
            font-size: 1.4em;
            margin: 0;
            padding: 2px 15px;
        }

        .box-heading h4 {
            color: #fff;
            font-size: 25px;
        }

        .box-container1 > .box-body {
            background-color: rgba(252, 252, 252, 0.89) !important;
        }

        .box-container1 > .box-body-open {
            border: 1px solid #dddddd;
            border-radius: 3px;
        }

        .ptop20 {
            padding-top: 20px !important;
        }

        .mbtm20 {
            margin-bottom: 20px !important;
        }

        .mleft20 {
            margin-left: 20px !important;
        }

        .mtop50 {
            margin-top: 50px !important;
        }

        .mbtm50 {
            margin-bottom: 50px !important;
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        #cphbody_lblHeaderDetails {
            font-size: 22px !important;
        }

        .z-depth-4 {
            box-shadow: 0 16px 28px 0 rgba(0,0,0,0.22), 0 25px 55px 0 rgba(0,0,0,0.21);
        }
    </style>

    <script>
        function validateEmail(emailField)
        {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (reg.test(emailField.value) == false)
            {
                alert('Validate Email ID.!</br>Please enter valid Email Address!');
                document.getElementById("txtEmail").style.border = "1px solid red";
                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript">
        function isAlphaNumeric(e)
        { // Alphanumeric only
            var k;
            document.all ? k = e.keycode : k = e.which;
            if ((k > 47 && k < 58) || (k > 64 && k < 91) || (k > 96 && k < 123) || k == 0)
                return true;
            else
                alert('Validate Login ID!</br>Please enter only alphanumeric!');
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" style="padding: 4em 0;">
        <div class="col-lg-12 mtop50 mbtm50">
            <asp:HiddenField ID="TypeU" runat="server" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:Panel ID="Panel1" runat="server">
                <div class="forgotPwdHolder box-container1" id="step1">
                    <div class="box-heading">
                        <h4><i class="fa fa fa-keyboard-o"></i>
                            <asp:Label ID="lblHeaderDetails" runat="server" CssClass="box-title" Text="Label"></asp:Label>
                            &nbsp;
                            <span class="pull-right ptop5">
                                <%--     <a href="#" style="color:#fff176; text-decoration:underline; padding-top:10px; letter-spacing:0.05em;">--%>
                                <asp:LinkButton ID="lbtnLostLoginID" runat="server" Text="1" Style="color: #fff176; text-decoration: underline; padding-top: 10px; letter-spacing: 0.05em;" OnClick="lbtnLostLoginID_Click">Have you lost your Login ID ?</asp:LinkButton>
                                <%-- </a>--%>
                            </span></h4>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                        <asp:Panel ID="pnlRadioBuuton" runat="server">
                            <div class="form-group">
                                <div class="col-xs-12 pleft0 ptop15 pbottom10">
                                    <div class="col-xs-4 pleft0">
                                        <asp:RadioButton ID="rbtnMobile" runat="server" ValidationGroup="type" AutoPostBack="true" OnCheckedChanged="rbtnMobile_CheckedChanged" />
                                        <b>Mobile</b>
                                    </div>
                                    <div class="col-xs-8">
                                        <asp:RadioButton ID="rbtnLoginId" runat="server" ValidationGroup="type" CssClass="mleft20" AutoPostBack="true" OnCheckedChanged="rbtnLoginId_CheckedChanged" />
                                        <b>Login ID</b>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlMobile" runat="server">
                            <div class="form-group mtop10 mbtm50">
                                <label class="form-label"><b>Mobile Number<font size="3" color="red">*</font></b></label>
                                <div class="col-xs-12 pright0 pleft0">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-mobile-phone fa-1x"></i>
                                        </div>
                                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" onkeypress="return isNumber1(event)" onblur="ValidateNo1();" class="form-control" AutoCompleteType="Disabled" autocomplete="off" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mtop10 mbtm50">
                                <div class="col-xs-7 pleft0">
                                    <label class="form-label" for=""><b>Captcha Code<font size="3" color="red">*</font></b></label>
                                    <img src="/Account/GetCaptcha" alt="verification code" />
                                </div>
                            </div>
                            <div class="col-xs-5 pright0">
                                <asp:TextBox ID="captcha" MaxLength="6" runat="server" class="form-control" AutoCompleteType="Disabled" autocomplete="off"></asp:TextBox>
                                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="Button1" runat="server" Text="Proceed" class="btn btn-primary mtop20" OnClick="Button1_Click" />
                                <asp:Button ID="btnCancelFindAccount" runat="server" Text="Cancel" class="btn btn-danger mtop20" OnClick="btnCancelFindAccount_Click" />
                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                <asp:HiddenField ID="HiddenField3" runat="server" />
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlLoginId" runat="server">
                            <div class="form-group mtop10 mbtm50">
                                <label class="form-label"><b>Login ID<font size="3" color="red">*</font></b></label>
                                <div class="col-xs-12 pright0 pleft0">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user fa-1x"></i>
                                        </div>
                                        <asp:TextBox ID="TextBox2" runat="server" class="form-control" MaxLength="35" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mtop10 mbtm50">
                                <div class="col-xs-7 pleft0">
                                    <label class="form-label" for=""><b>Captcha Code<font size="3" color="red">*</font></b></label>
                                    <img src="/Account/GetCaptcha" alt="verification code" />
                                </div>
                            </div>
                            <div class="col-xs-5 pright0">
                                <asp:TextBox ID="TextBox3" MaxLength="6" runat="server" class="form-control"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="Button5" runat="server" Text="Proceed" class="btn btn-primary mtop20" OnClientClick="return validation();" OnClick="Button1_Click" />
                                <asp:HiddenField ID="HiddenField4" runat="server" />
                                <asp:HiddenField ID="HiddenField5" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <div class="forgotPwdHolder box-container1" id="step2">
                    <div class="box-heading">
                        <h4 class="box-title"><i class="fa fa-keyboard-o"></i>Verify OTP</h4>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                        <asp:Panel ID="pnlOtTPMobile" runat="server">
                            <div class="form-group mtop10 mbtm50">
                                <label class="form-label ptop10" for="">
                                    <b>
                                        <asp:Label ID="lblResendOTP" runat="server" Text="Re-Send OTP"></asp:Label></b>
                                </label>
                                <div class="clearfix"></div>
                                <asp:Panel ID="pnlResendOTPbyEmailId" runat="server">
                                    <div class="col-xs-9 pleft0">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-envelope fa-1x"></i></div>
                                            <asp:TextBox ID="txtEmailReSend" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlResentMobileNumber" runat="server">
                                    <div class="col-xs-9 pright0 pleft0">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-mobile-phone fa-1x"></i></div>
                                            <asp:TextBox ID="txtResendOTP" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <div class="col-xs-3 pright0">
                                    <asp:Button ID="Button4" runat="server" Text="Re-Send OTP" class="btn btn-primary pull-right" OnClick="btnResend_Click" />
                                    <asp:Label runat="server" ID="lblTimer" Style="color: #f30f0f; padding: 3px 6px; margin: 10px 0; text-align: center; font-weight: normal; font-size: 12px; letter-spacing: 0.05em; border-radius: 100px; display: block; position:relative; left:5%;"
                                    Text=""></asp:Label>
                                </div>
                                <div class="form-group mtop10 mbtm50" id="divloginid" runat="server">
                                    <div class="col-xs-12 ptop20 pright0 pleft0">
                                        <label class="form-label" for=""><b>Login ID</b></label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-qrcode fa-1x"></i>
                                            </div>
                                            <asp:TextBox ID="txtLoginIdForOTP" ReadOnly="true" MaxLength="6" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group  mtop10 mbtm50">
                                <label class="form-label ptop20" for=""><b>OTP Number<font size="3" color="red">*</font></b></label>
                                <div class="col-xs-12 pright0 pleft0">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-qrcode fa-1x"></i>
                                        </div>
                                        <asp:TextBox ID="txtOPT" runat="server" MaxLength="6" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mtop10 mbtm50 text-center">
                                <asp:Button ID="Button2" runat="server" Text="Verify" class="btn btn-primary mtop20" OnClick="Button2_Click" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server">
                <div class="forgotPwdHolder box-container1" id="step3">
                    <div class="box-heading">
                        <h4 class="box-title"><i class="fa fa-keyboard-o"></i>Authenticate your details</h4>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                        <div class="form-group mtop10 mbtm50">
                            <label class="form-label"><b>Login ID</b></label>
                            <div class="col-xs-12 pright0 pleft0">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-key fa-1x"></i>
                                    </div>
                                    <asp:TextBox ID="txtLoginId" ReadOnly="true" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mtop10 mbtm50" id="forDept" runat="server">
                            <label class="form-label"><b>Father's Name<font size="3" color="red">*</font></b></label>
                            <div class="col-xs-12 pright0 pleft0">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-mars fa-1x"></i>
                                    </div>
                                    <asp:TextBox ID="txtFather" runat="server" MaxLength="30" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mtop10 mbtm50">
                            <label class="form-label" id="forDeptDOB" runat="server"><b>Date Of Birth<font size="3" color="red">*</font></b></label>
                            <div class="col-xs-12 pright0 pleft0">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar fa-1x"></i>
                                    </div>
                                    <asp:TextBox runat="server" ID="txtDBO" CssClass="form-control" placeholder="DD/MM/YYYY" name="txtBirthDate" value="" MaxLength="10" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 pleft0 pbottom10">
                                <div class="col-xs-5 pleft0">
                                    <asp:RadioButton ID="rbtnMobileForPnl3" runat="server" ValidationGroup="pnltype" AutoPostBack="true" OnCheckedChanged="rbtnMobileForPnl3_CheckedChanged" />
                                    <b>Mobile</b>
                                </div>
                                <div class="col-xs-7">
                                    <asp:RadioButton ID="rbtnEmailForPnl3" runat="server" ValidationGroup="pnltype" AutoPostBack="true" OnCheckedChanged="rbtnEmailForPnl3_CheckedChanged" />
                                    <b>Email</b>
                                </div>
                            </div>
                        </div>
                        <asp:Panel ID="pnlForMobilePnl3" runat="server">
                            <div class="form-group mtop10 mbtm50">
                                <label class="form-label" for=""><b>Mobile<font size="3" color="red">*</font></b></label>
                                <div class="col-xs-12 pright0 pleft0">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-mobile-phone fa-1x"></i>
                                        </div>
                                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" onkeypress="return isNumber(event)" onblur="ValidateNo();" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlForEmailPnl3" runat="server">
                            <div class="form-group mtop10 mbtm50">
                                <label class="form-label" for=""><b>Email ID<font size="3" color="red">*</font></b></label>
                                <div class="col-xs-12 pright0 pleft0">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-envelope fa-1x"></i>
                                        </div>
                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="40" onblur="validateEmail(this);" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="form-group mtop10 text-center">
                            <asp:Button ID="Button3" runat="server" Text="Submit" OnClick="Button3_Click" class="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlfindmyaccount" runat="server">
                <div class="forgotPwdHolder box-container1" id="step4">
                    <div class="box-heading">
                        <h4 class="box-title"><i class="fa fa-keyboard-o"></i>Verify your User Details</h4>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                        <asp:Panel ID="pnlUsername" runat="server">
                            <div class="form-group mtop10 mbtm50">
                                <label class="form-label" for=""><b>Username<font size="3" color="red">*</font></b></label>
                                <div class="col-xs-12 pright0 pleft0">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-mars fa-1x"></i>
                                        </div>
                                        <asp:TextBox ID="txtUsername" runat="server" MaxLength="100" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mbtm20 text-center">
                                <asp:Button ID="btnfindmyaccount" CssClass="btn btn-success mtop20" runat="server" Text="Next" OnClick="btnfindmyaccount_Click" Width="120px" />
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlsendotpforfindmyaccount" runat="server">
                            <div class="form-group mtop10 mbtm50 text-center">
                                <div class="col-xs-12">
                                    <i class="fa fa-5x fa-mobile-phone" style="font-size: 130px !important;"></i>
                                </div>
                                <div class="clearfix"></div>
                                <div class="alert alert-info">
                                    <asp:Literal ID="ltlFinfmyaccount" runat="server"></asp:Literal>
                                </div>
                                <div class="clearfix"></div>
                                <asp:Button ID="btnfindmyaccountsendotp" CssClass="btn btn-success mtop20" Width="150px" runat="server" Text="Send text message" OnClick="btnfindmyaccountsendotp_Click" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>