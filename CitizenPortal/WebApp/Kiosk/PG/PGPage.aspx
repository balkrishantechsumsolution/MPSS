<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="PGPage.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.PG.PGPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/style.admin.css" type="text/css" rel="stylesheet" />
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .pagination {
            color: #000 !important;
            display: block !important;
            margin: 0 !important;
            padding: 10px;
        }

            .pagination label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
            }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 32.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #B65838;
        }

            .SrvDiv a {
                color: #472A26;
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

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 5px !important;
        }
    </style>
    <style type="text/css">
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
                font-size: 20px;
                padding-left: 0;
            }

        .dropdown-menu > li > a {
            color: #333 !important;
            line-height: 22px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mbtm10">
        <div class="container-fluid">
            <div class="home-contentbox">

                <div class="col-lg-12">
                    <div class="col-lg-2 mtop20 pleft0 mbtm20">
                        <div class="text" style="overflow: hidden; line-height: 22px; text-align: left; background-color: #fff; border-right: 1px solid #B65838; border-bottom: 1px solid #B65838; border-left: 1px solid #B65838;">
                            <div style="background-color: #B65838; color: #fff; padding: 5px 0 5px 5px; font-size: 15px;">Help Manuals </div>
                             <div class="text-left" style="padding-top: 5px; display: flex;">
                                <i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;">
								</i><a href="/g2c/PDF/USER_MANUAL_FOR_PG_AND_MTECH_PROGRAM_2018.pdf" target="_blank">User Manual</a>
                                
                            </div>
                            <div class="text-left" style="padding-top: 5px; display: flex;">
                                <i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;">
								</i><a href="/g2c/PDF/SU_PG_FAQ.pdf" target="_blank">Frequently asked Questions</a>
                                
                            </div>
                            <div class="text-left" style="padding-top: 5px;">
                                <i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;"></i>
                                <a href="/g2c/PDF/Admission Announcement 2018-19.pdf" target="_blank">Notification
                                </a>
                            </div>
                            <div class="text-left"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;"></i>
							<a href="/g2c/Downloads/PDF/Instruction to candidate SAMBALPUR PG.pdf" target="_blank">Instruction to candidate </a></div>
							<div class="text-left"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;"></i>
							<a href="/g2c/Downloads/PDF/REGULAR COURSES 2018-19 _PROSPECTUS.pdf" target="_blank">Prospectus_Regular</a></div>
							<div class="text-left"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px; color: #337ab7;"></i>
							<a href="/g2c/Downloads/PDF/SELF-FINANCING COURSES 2018-19 _PROSPECTUS.pdf" target="_blank">Prospectus Self-financing</a></div>
                        </div>

                        <div class="clearfix"></div>
                        <br>
                        <div class="text" style="overflow: hidden; line-height: 22px; text-align: left; background-color: #fff; color: #777; border-right: 1px solid #B65838; border-bottom: 1px solid #B65838; border-left: 1px solid #B65838; line-height: 26px; padding: 0px 0 5px 0;">
                            <div style="background-color: #B65838; color: #fff; font-size: 15px; padding: 4px;">Important Events &amp; Dates</div>
							  <a href="/g2c/pdf/Important_Dates_SUPG.pdf" target="_blank"><i class="fa fa-hand-o-right" style="padding: 0 5px 0 5px; color: #337ab7;"></i>Important Dates (Download)</a>
                    <br>
                      

                        </div>
                    </div>
                    <div class="col-lg-10">
                        <h2 class="form-heading">
                            <span class="col-lg-10 p0"><i class="fa fa-pencil-square-o"></i>ONLINE APPLICATION FOR MASTER'S & DOCTORAL PROGRAM - 2018 FOR PG
                            </span>

                            <span class="clearfix"></span>
                        </h2>
                        <div style="padding: 15px; font-family: Arial, Helvetica, sans-serif; background-color: #d32f2f; font-size: 14px; text-shadow: 2px 2px 14px #000000; letter-spacing: 0.15em; color: #fff; text-align: center; display: none;">
                            <i class="fa fa-hand-o-right fa-fw"></i>The Last date of submission of application is over.
                        </div>
                        <div class="">
                            <div class="resp-tabs-container ver_1">
                                <div style="margin-top: 20px;">
                                    <!-- Applicant Login Link PG Course-->
                                    <div class="SrvDiv" id="101" style="min-height: 4.66em; width: 47% !important; z-index: -760;">
                                        <a href="/Account/Login" onclick="javascript:return RedirectToService('/Account/Login');">
                                            <img src="/webapp/kiosk/CBCS/img/sambalpur-university-logo.png" alt="" align="left" style="height: 70px;" />
                                        </a><a href="/Account/Login">Applicant Login</a>
                                        <br />
                                        <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">CLICK TO LOGIN</span><br />
                                        <span>For Application of PG Courses (Uploading Documents)</span>
                                    </div>
                                    <!-- Register Complaint Link PG Course-->
                                    <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="101">
                                        <a href="#">
                                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                        </a><a href="/WebApp/Kiosk/OUAT/OUATComplaint.aspx">Register Complaint</a>
                                        <br />
                                        <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Register Complaint</span><br />
                                        <span>for Status of Applicantion/Payment of Form A & Agro Form A</span>
                                    </div>
                                    <!-- Download Admit Card Link PG Course-->
                                    <div style="min-height: 4.66em; z-index: -760; display: none" class="SrvDiv" id="106">
                                        <a href="#">
                                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                        </a><a href="/WebApp/Kiosk/OUAT/DownloadAdmitCart.aspx">Download Admit Card</a>
                                        <br />
                                        <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to Download Admit Card for Written Exam</span><br />
                                        <span>For OUAT PG Courses</span>
                                    </div>
                                    <!-- Payment Link PG Course-->

                                    <div style="min-height: 4.66em; width: 49% !important; z-index: -760;" class="SrvDiv" id="Div1" runat="server">
                                        <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1452&Mode=C">
                                            <img src="/webapp/kiosk/CBCS/img/sambalpur-university-logo.png" alt="" align="left" style="height: 70px;" /></a><a href="/WebApp/Kiosk/DTE/legacy/LegacyDataInterface.aspx" target="_blank">
                                            </a>
                                        <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1452&Mode=D">Online Application For PG & M.Tech Programme - 2018
                                    <!--In Agriculture & Allied Subjects-->
                                        </a>
                                        <br />
                                        <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">
                                            Post Graduate Degree/Diploma courses </span><br />
                                        <span>certificate Courses/self-financing Courses - 2018</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
