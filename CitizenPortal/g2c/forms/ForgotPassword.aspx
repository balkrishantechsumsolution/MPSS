<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CitizenPortal.g2c.forms.ForgotPassword" EnableSessionState="False"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .forgot-wrapper {
            background-color: #F0F8FF;
            width: 60%;
            height: 300px;
            border: 1px solid #1D88E8;
            padding-top: 20px;
            margin: 50px auto;
        }

        .forgot_hd {
            position:absolute;
            background-color:#1D88E8;
            color:#fff;
            font-size:25px;
            padding:10px;
            z-index:1000;
            top:24px;
            margin-left:200px;
        }
        .box-body .form-control {
            background: none repeat scroll 0 0 #fff;
            border: 1px solid #cdcdcd !important;
            border-radius: 0;
            box-shadow: 0 0 0;
            color: #333;
            padding: 3px 5px !important;
            margin: 0 0 18px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="container">
        <div class="col-lg-12">
            
            <div class="forgot-wrapper box-container">
                <div class="forgot_hd">Forgot Password</div>
                <div class="box-body box-body-open" style="margin-top:20px;">
                    <div class="form-group" style="margin-bottom: 0 !important;">
                        <div class="col-md-4 ptop10">Registered Email ID</div>
                        <div class="col-md-8">
                            <input id="RegEmailid" class="form-control" placeholder="Type your registered email id" name="RegEmailid" type="text" autofocus="" maxlength="100" />
                        </div>
                        <div class="col-md-4 ptop10">New Password</div>
                        <div class="col-md-8">
                            <input id="NewPwd" class="form-control" placeholder="Type your new password" name="NewPwd" type="text" autofocus="" maxlength="100" />
                        </div> 
                        <div class="col-md-4 ptop5">Captcha <img src="../img/captcha_img.jpg" class="pleft15" /></div>
                        <div class="col-md-8">
                            <input id="Captcha" class="form-control" placeholder="" name="Captcha" type="text" autofocus="" />
                        </div>
                        
                        <div class="col-md-4 ptop10">Generate OTP</div>
                        <div class="col-md-6">
                            <input id="OTP" class="form-control" placeholder="" name="otpCode" type="text" autofocus="" />
                        </div>
                        <div class="col-md-2 pleft0"><button type="button" class="btn btn-default">Generate OTP</button></div>
                        <div class="clearfix"></div>
                         <div class="col-md-5"></div>
                        <div class="col-md-7"><input type="submit" name="sendMail" value="Send Mail" id="sendMail" class="btn btn-primary"/></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
