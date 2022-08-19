<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CitizenPortal.WebApp.Registration.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/usrreg.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="w95" style="margin: 20px auto;">
            <div class="box-container">
                <h1>Register Yourself </h1>
                <div class="col-lg-12 pleft0">
                    <p><b class="ftcl_black" style="font-size: 19px !important;">CREATE YOUR PROFILE WITH THIS PORTAL TO APPLY ONLINE FOR NOTIFIED SERVICES UNDER ODISHA RIGHT TO PUBLIC SERVICES ACT 2016</b><span class="pull-right pright15"><a href="#" style="color:#FF9900; font-weight:bold; text-decoration:underline;" target="_blank">READ MORE <i class="fa fa-angle-double-right"></i></a> &nbsp;  <b><a href="#" style="color:#FF9900; font-weight:bold; text-decoration:underline;" target="_blank"><i class="fa fa-file-pdf-o pright5"></i>Download ACT </a></b></span>
                </div>
                <div class="col-lg-12 pleft0">
                    <div class="text-danger register-note">
                            <ul>
                                <li>Information entered on this page will be used as base for most certificates that will be issued by the Government.  Please take your time and patiently fill up all the details. Please take special care to recheck spellings in all information that you enter.  You can also later modify and alter information on this page.</li>
                                
                            </ul>
                        </div>
                </div>
                <div class="col-md-12 mtop15 mbtm10 pleft0">
                    <p><b class="ftcl_black" style="font-size: 19px !important;">SELECT ANY ONE FROM BELOW GIVEN OPTIONS TO APPLY ON THIS PORTAL. </b></p>
                    <div class="col-lg-6 pleft0" style="display:none;">
                        <a href="#">
                            <div class="reg_opt1">
                                <div class="icon">
                                    <img src="img/ekyc_opt1.png" />
                                </div>
                                <div class="txt">
                                    <h2 style="background-color: #D52736;">OPTION 1</h2>
                                    <p><b class="ftcl_black">Create UserID and Password by verifying UID.</b></p>
                                    <p>Your information will be downloaded here and will be saved in your user profile after completion of eKYC.</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-6 pright0">
                        <a href="#">
                            <div class="reg_opt1">
                                <div class="icon">
                                    <img src="img/photo_icon_opt2.png" />
                                </div>
                                <div class="txt">
                                    <h2>OPTION 2</h2>
                                    <p><b class="ftcl_black">Upload complete self details, photo,Identity Proof, Address Proof etc.Create own user profile using OTP verification on your mobile number.</b></p>
                                    <p>After this process while applying online for service , No need to attach Photo, Identity Proof and Address Proof.</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-12 pleft0">
                    <p class="text-danger">
                        I hereby state that I have no objection in authenticating myself with Aadhaar based
                authentication system and consent to providing my Aadhaar number and One Time Pin
                (OTP) data for Aadhaar based authentication for the purposes of availing of the
                services under 'Aaple Sarkar’ portal from MahaOnline Ltd. I understand that the
                OTP I provide for authentication shall be used only for authenticating my identity
                through the Aadhaar Authentication system for that specific transaction and for
                no other purposes.
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
