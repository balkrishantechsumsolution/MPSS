<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CitizenPortal.WebApp.Login.ForgotPassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Sambalpur/js/SHA256.js"></script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $("#step2").show();
            $("#step3").hide();
            $("#proceedStep1").click(function () {
                if ($("#step1").hide("slow")) {
                    $("#step2").slideDown("slow");
                    $("#step3").hide("slow");
                }
            });
            $("#proceedStep2").click(function () {
                if ($("#step1").hide("slow")) {
                    $("#step2").hide("slow");
                    $("#step3").slideDown("slow");
                }
            });
        });
    </script>--%>
    <script type="text/javascript">
        function submitForm() {
            debugger;
            //var vsalt = $('#HDNSaltKey').val();
            var strhiden = sha256_digest(salt);

            var newpasspwd = $("#txtPwd").val();
            var cnfnewpasspwd = $("#txtConfPwd").val();
            newpasspwd = sha256_digest(newpasspwd);
            cnfnewpasspwd = sha256_digest(cnfnewpasspwd);



            $("#txtPwd").val(newpasspwd);
            $("#txtConfPwd").val(newpasspwd);
        }
    </script>

    <script type="text/javascript">
        var salt = '<%= Session["SaltKey"].ToString() %>';   
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
            background-color: #e6e6e6;
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
            background-color: #523b2d;
            border: 1px solid #523b2d;
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

        .mbtm20 {
            margin-bottom: 20px !important;
        }

        .mtop50 {
            margin-top: 50px !important;
        }

        .mbtm50 {
            margin-bottom: 50px !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div class="row">
        <div class="col-lg-12 mtop50 mbtm50">
            <asp:HiddenField ID="TypeU" runat="server" />
            <div class="forgotPwdHolder box-container1" id="step1" runat="server">
                <div class="box-heading">
                    <h4 class="box-title"><i class="fa fa-keyboard-o fa-fw"></i>Forgot Password</h4>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                    <div class="col-lg-5 p0">
                        <div class="form-group mtop10 mbtm50">
                            <label class="form-label" for=""><b>Roll Number*</b></label>
                            <div class="col-xs-12 pright0 pleft0">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-mobile-phone fa-1x"></i>
                                    </div>
                                    <%--<input type="number" name="Mobile" class="form-control"/>--%>
                                    <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="col-lg-2 text-center" style="padding-top: 40px;"><b>---- OR ----</b></div>
                    <div class="col-lg-5 p0">
                        <div class="form-group mtop10 mbtm50">
                            <label class="form-label" for=""><b>Admisson Number*</b></label>
                            <div class="col-xs-12 pright0 pleft0">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user fa-1x"></i>
                                    </div>
                                    <%--<input type="text" name="Name" class="form-control"/>--%>
                                    <asp:TextBox ID="txtAdmissionNumber" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                </div>

                            </div>

                        </div>

                    </div>

                    <div class="col-lg-12 pleft0">
                        <div class="form-group mtop10 mbtm50">
                            <div class="col-xs-7 pleft0">
                                <label class="form-label" for=""><b>Captcha Code*</b></label>
                                <img src="/Account/GetCaptcha" alt="verification code" />
                            </div>
                            <div class="col-xs-5 pright0">
                                <%--<input type="text" name="Name" class="form-control" />--%>
                                <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" placeholder="Enter Captcha Code"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-lg-12 ptop15" style="padding-bottom: 15px;">
                        <div class="form-group text-center">
                            <asp:Button ID="btnProceed" runat="server" OnClick="btnProceed_Click" Text="Proceed" CssClass="btn btn-primary" />&nbsp;
                        <asp:Button ID="btnBackLogin" runat="server" OnClick="btnBackLogin_Click" Text="Back To Login" CssClass="btn btn-primary" />
                            <%--<button type="button" class="btn btn-primary mtop20" id="proceedStep1">Proceed <i class="fa fa-arrow-circle-right"></i></button>--%>
                        </div>
                    </div>
                </div>
            </div>


            <div class="forgotPwdHolder box-container1" id="step2" runat="server" visible="false">
                <div class="box-heading">
                    <h4 class="box-title"><i class="fa fa-keyboard-o"></i>Verify OTP</h4>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>OTP Number*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-qrcode fa-1x"></i>
                                </div>
                                <asp:TextBox ID="txtVerifyOTP" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>

                        </div>

                    </div>
                    <div class="form-group mtop10 mbtm50 text-center">
                        <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP" CssClass="btn btn-primary" OnClick="btnVerifyOTP_Click" />
                        <%--    <button type="button" class="btn btn-primary mtop20" id="proceedStep2">Verify</button>--%>
                    </div>
                </div>
            </div>

            <div class="forgotPwdHolder box-container1" id="step4" runat="server" visible="false">
                <div class="box-heading">
                    <h4 class="box-title"><i class="fa fa-keyboard-o"></i>Reset Password</h4>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Login ID*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user fa-1x"></i>
                                </div>
                                <%--<input type="text" name="Name" class="form-control"/>--%>
                                <asp:TextBox ID="txtLoginID" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>New Password*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user fa-1x"></i>
                                </div>
                                <%--<input type="text" name="Name" class="form-control"/>--%>
                                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Confirm Password*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user fa-1x"></i>
                                </div>
                                <%--<input type="text" name="Name" class="form-control"/>--%>
                                <asp:TextBox ID="txtConfPwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mtop10 mbtm50 text-center">
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        <asp:Button CssClass="btn btn-primary mtop20" runat="server" ID="btnResetPwd" Text="Reset Password" OnClick="btnResetPwd_Click" OnClientClick="javascript: return submitForm()"></asp:Button>
                    </div>
                </div>
            </div>

            <div class="forgotPwdHolder box-container1" id="step3" runat="server" visible="false">
                <div class="box-heading">
                    <h4 class="box-title"><i class="fa fa-keyboard-o"></i>Authenticate your Details</h4>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Login ID*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-key fa-1x"></i>
                                </div>
                                <input type="text" name="Name" class="form-control" />

                            </div>

                        </div>

                    </div>

                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Father Name*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-mars fa-1x"></i>
                                </div>
                                <input type="text" name="Name" class="form-control" />

                            </div>

                        </div>

                    </div>

                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>DOB</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar fa-1x"></i>
                                </div>
                                <input type="date" name="DOB" class="form-control" />

                            </div>

                        </div>

                    </div>

                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Mobile No.</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-mobile-phone fa-1x"></i>
                                </div>
                                <input type="number" name="OTP CODE" class="form-control" />

                            </div>

                        </div>

                    </div>

                    <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Email ID</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-envelope fa-1x"></i>
                                </div>
                                <input type="email" name="Name" class="form-control" />

                            </div>

                        </div>

                    </div>
                    <div class="form-group mtop10 text-center">
                        <%--<button type="button" class="btn btn-primary">Submit</button>--%>
                    </div>

                    
                </div>
            </div>
        
            <div class="" style="clear: both">
            </div>
            <div class="forgotPwdHolder box-container1">
                <div class="box-heading">
                    <h4 class="box-title">Instruction for Reset Password</h4>
                </div>
                <div class="box-body box-body-open p10" style="">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group padding20">
                            <div>
                                <strong>STEP 1</strong>: 
                                    
                            </div>
                            <div class="padding20 ptop0">
                                a. Enter <strong>Admission No.</strong>(for New Student enrolled in 2017) OR enter<strong> Roll No.</strong> (for student enrolled in before 2017) and <b>Captcha</b>
                                <br />
                                b. OTP will be SMS to registered Mobile No of the student along with <b>LOGIN ID</b>
                                <br />
                                c. Enter 6 digit OTP in the text box
                                    <br />
                                d. After sucessfully validation of OTP, enterr LOGIN ID and New Password and Confrim the password enter.
                                    <br />
                                e. Your Password is reset with new password.
                                    <br />
                            </div>
                        </div>
                    </div>
                    <div class="" style="clear: both"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
