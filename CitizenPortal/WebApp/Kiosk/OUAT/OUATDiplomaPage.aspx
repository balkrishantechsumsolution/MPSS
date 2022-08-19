<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" CodeBehind="OUATDiplomaPage.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.OUATDiplomaPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .blink_text {
            animation: 4s blinker linear infinite;
            -webkit-animation: 4s blinker linear infinite;
            -moz-animation: 4s blinker linear infinite;
            background-color: red;
            color: white;
            height: 20px;
            font-size: 9px;
            border-radius: 20px;
            letter-spacing: 0.08em;
            padding: 0px 3px 0 3px;
            margin-top: 25px;
        }

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mbtm10">
        <div class="w95" style="min-height: 500px;">
            <div class="col-lg-2 mtop20 pleft0">
                <div class="text" style="overflow: hidden; line-height: 25px; text-align: left; background-color: #E6F2FF; border-right: 1px solid #337AB7; border-bottom: 1px solid #337AB7; border-left: 1px solid #337AB7;">
                    <div style="background-color: #337AB7; color: #fff; padding: 5px 0 5px 5px; font-size: 15px;">Help Manuals </div>
                    <div class="text-left" style="padding-top: 5px; display: flex;"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;"></i><a href="/g2c/PDF/Advt.Notice_OUAT_PG_Course_2017.pdf" target="_blank">Advertisement Notice for OUAT Polytechnic Diploma Prospetus: 2017-18</a> <span class="blink_text">New</span></div>
                    <div class="text-left" style="padding-top: 5px;"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;"></i><a href="/g2c/PDF/Diploma in Agro-Polytechnic Prostectus 2017-18.pdf" target="_blank">OUAT Agro Polytechnic Diploma Prospetus: 2017-18</a></div>
                    <div class="text-left"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;"></i><a href="/g2c/pdf/Admission Notice for Diploma in Agro-Polytechnic.pdf" target="_blank">Admission Notice</a></div>
                    <div class="text-left"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;"></i><a href="/g2c/Downloads/PDF/ResizeImage.pdf" target="_blank">How to check and resize image</a></div>
                </div>

                <div class="clearfix"></div>
                <br />
                <div class="text" style="overflow: hidden; line-height: 22px; text-align: left; background-color: #E6F2FF; color: #777; border-right: 1px solid #337AB7; border-bottom: 1px solid #337AB7; border-left: 1px solid #337AB7; line-height: 26px; padding: 0px 0 5px 0;">
                    <div style="background-color: #337AB7; color: #fff; font-size: 15px; padding: 4px;">Important Events and Dates</div>
                    <div class="text-left" style="display: flex;">
                        <i class="fa fa-hand-o-right" style="padding: 6px 5px 0 5px; color: #337ab7; display: flex;"></i><span>Last Date for Upload Document till:-	 20.07.2017</span>
                    </div>
                    <div class="text-left" style="display: flex;">
                        <i class="fa fa-hand-o-right" style="padding: 6px 5px 0 5px; color: #337ab7;"></i><span>Submission of Application online		:-  01.07.2017 to 20.07.2017</span>
                    </div>
                    <div class="text-left" style="display: flex; display:none">
                        <i class="fa fa-hand-o-right" style="padding: 6px 5px 0 5px; color: #337ab7;"></i><span>Last Date of Payment		:-  06.07.2017</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-10">
                <%--<div id="page-wrapper" style="min-height: 311px;">--%>
                <h2 class="form-heading">
                    <span class="col-lg-12 p0"><i class="fa fa-pencil-square-o"></i>ONLINE APPLICATION FOR POLYTECHNIC DIPLOMA PROGRAM - 2017 FOR OUAT
                    </span>

                    <span class="clearfix"></span>
                </h2>
                <div class="">
                    <div class="resp-tabs-container ver_1">
                        <div style="margin-top: 20px;">
                            <%-- Applicant Login Link PG Course--%>
                            <div class="SrvDiv" id="101" style="min-height: 4.66em; z-index: -760;">
                                <a href="/Account/Login" onclick="javascript:return RedirectToService('/Account/Login');">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/Account/Login">Applicant Login</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">CLICK TO LOGIN</span><br />
                                <span>For Application of Diploma Courses OUAT (Uploading Documents)</span>
                            </div>
                            <%-- Register Complaint Link PG Course--%>
                            <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="101">
                                <a href="#">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Kiosk/OUAT/OUATComplaint.aspx">Register Complaint</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Register Complaint</span><br />
                                <span>for Status of Applicantion/Payment of Form A & Agro Form A</span>
                            </div>
                            <%-- Download Admit Card Link PG Course--%>
                            <div style="min-height: 4.66em; z-index: -760; display: none" class="SrvDiv" id="106">
                                <a href="#">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Kiosk/OUAT/DownloadAdmitCart.aspx">Download Admit Card</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to Download Admit Card for Written Exam</span><br />
                                <span>For OUAT Diploma Courses</span>
                            </div>
                            <%-- Payment Link PG Course--%>
                            <div style="min-height: 4.66em; min-width: 99%; z-index: -760;" class="SrvDiv" id="102">
                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=430&Mode=C">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=430&Mode=D" onclick="javascript:return RedirectToService('/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=430&Mode=D');">Submission of Online Application For Polytechnic Diploma Programme – 2017 In Agriculture & Allied Subjects</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">OUAT Diploma Courses – 2017 (In Agriculture & Allied Subjects)</span><br />
                                <span>OUAT Diploma Courses – 2017 (In Agriculture & Allied Subjects)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
