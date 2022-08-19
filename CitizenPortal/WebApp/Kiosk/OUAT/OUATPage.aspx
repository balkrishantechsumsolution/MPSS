<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="OUATPage.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.initial_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row mbtm10">
        <div class="w95" style="min-height: 500px;">

            <div class="col-lg-2 mtop20 pleft0">
                <div class="text" style="overflow: hidden; line-height: 22px; text-align: left; background-color: #E6F2FF; border-right: 1px solid #337AB7; border-bottom: 1px solid #337AB7; border-left: 1px solid #337AB7;">
                    <div style="background-color: #337AB7; color: #fff; padding: 5px 0 5px 5px; font-size: 15px;">Help Manuals </div>
                    <label class="btn-link text-left" style="padding-top: 5px;"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px;"></i><a href="/g2c/PDF/OUAT _UG_PROSPECTUS_2017-18.pdf" target="_blank">OUAT UG Prospetus: 2017-18</a></label>
                    <label class="btn-link text-left"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px;"></i><a href="/g2c/pdf/OUAT_UG_Admission_Notice_2017-18.pdf" target="_blank">Admission Notice</a></label>
                    <label class="btn-link text-left"><i class="fa fa-hand-o-up" style="padding: 0 5px 0 5px;"></i><a href="/g2c/Downloads/PDF/ResizeImage.pdf" target="_blank">How to check and resize image</a></label>
                </div>

                <div class="clearfix"></div>
                <br />
                <div class="text" style="overflow: hidden; line-height: 22px; text-align: left; background-color: #E6F2FF; color: #777; border-right: 1px solid #337AB7; border-bottom: 1px solid #337AB7; border-left: 1px solid #337AB7; line-height: 26px; padding: 0px 0 5px 0;">
                    <div style="background-color: #337AB7; color: #fff; font-size: 15px; padding: 4px;">Important Events and Dates</div>
                    <i class="fa fa-hand-o-right" style="padding: 0 5px 0 5px; color: #337ab7;"></i>Availability of Prospectus in OUAT website:-	 01.04.2017 onwards<br />
                    <%--<img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25"/>Submission of Application online		:-  08.06.2017 to 25.06.2017 (4.00 p.m.)<br />
                    <i class="fa fa-hand-o-right" style="padding: 0 5px 0 5px; color: #337ab7;"></i>Downloading of Admit Card			:-  25.05.2017 to 04.06.2017 (9.00 a.m.)<br />
                    <i class="fa fa-hand-o-right" style="padding: 0 5px 0 5px; color: #337ab7;"></i>Date of Entrance Examination			:-  04.06.2017 (Sunday) 10.30 a.m. to 12.30 p.m.<br />--%>
                    <i class="fa fa-hand-o-right" style="padding: 0 5px 0 5px; color: #337ab7;"></i>Announcment of OUAT UG Entrance Result	:-  29.06.2017	
                </div>
            </div>
            <div class="col-lg-10">
                <%--<div id="page-wrapper" style="min-height: 311px;">--%>
                <h2 class="form-heading">
                    <span class="col-lg-10 p0"><i class="fa fa-pencil-square-o"></i>ORISSA UNIVERSITY OF AGRICULTURE & TECHNOLOGY
                    </span>

                    <span class="clearfix"></span>
                </h2>
                <div style="display:none; padding:15px; font-family:Arial, Helvetica, sans-serif; background-color:#d32f2f; font-size:14px; text-shadow: 2px 2px 14px #000000; letter-spacing:0.15em; color:#fff; text-align:center;"><i class="fa fa-hand-o-right fa-fw"></i>Please login to submit the OUAT Application Form - B. <br /><span style="color:#FFFF4D;">(Submission of Form - B for OUAT UG Admission- 2017 date extended till 25.06.2017)</span></div>
                <div class="">
                    <div class="resp-tabs-container ver_1">
                        <div style="margin-top: 20px;">
                            <div style="min-height: 4.66em; z-index: -760; display:none" class="SrvDiv" id="102">
                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=403&Mode=C">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=403&Mode=C" onclick="javascript:return RedirectToService('/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=388&Mode=C');">Submission of Online Application Form-A for OUAT Common Entrance Examination-2017</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">UNDERGRADUATE COURSE PROGRAMME</span><br />
                                <span>Candidate applying directly Click here</span>

                            </div>
                            <div style="min-height: 4.66em; z-index: -760;display:none" class="SrvDiv" id="102">
                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=403&Mode=C">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=403&Mode=D" onclick="javascript:return RedirectToService('/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=403&Mode=D');">Submission of online application Form - A for Entrance Examination - 2017 by Agro polytechnic students of OUAT</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">UNDERGRADUATE COURSE PROGRAMME for Agro-Polytechnic Student</span><br />
                                <span>Candidate applying directly Click here (Online Payment)</span>
                            </div>
                            <div style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv" id="101">
                                <a href="/Account/Login" onclick="javascript:return RedirectToService('/Account/Login');">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/Account/Login">Submission of Form-A for OUAT Common Entrance Examination-2017 through Common Service Centre(CSC)</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">UNDERGRADUATE COURSE PROGRAMME</span><br />
                                <span>VLE of CSC Click here to Fill Application</span>
                            </div>
                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="101">
                                <a href="/Account/Login" onclick="javascript:return RedirectToService('/Account/Login');">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/Account/Login">Applicant Login</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">CLICK TO LOGIN</span><br />
                                <span>for Application Status/Filling of FORM-'B'/Uploading Documents</span>
                            </div>
                            <div style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv" id="101">
                                <a href="#">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Kiosk/OUAT/OUATComplaint.aspx">Register Complaint</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Register Complaint</span><br />
                                <span>for Status of Applicantion/Payment of Form A & Agro Form A</span>
                            </div>
                             <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="101">
                                <a href="#">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Kiosk/ReFundPayment/RefundPayment.aspx">Refund Payment</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Apply for Refund </span><br />
                                <span>for Status of Applicantion/Payment of Form A & Agro Form A</span>
                            </div>
                            <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="106">
                                <a href="#">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Kiosk/OUAT/DownloadAdmitCart.aspx">Download Admit Card</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to Download Admit Card for Written Exam</span><br />
                                <span>for OUAT CEE UG Courses</span>
                            </div>
                                                  <div style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv" id="106">
                                <a href="#">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Kiosk/OUAT/AccessFormB.aspx">Access Agro Form-B</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to Submit Agro Form-B</span><br />
                                <span>for OUAT CEE UG Courses</span>
                            </div>
                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="106">
                                <a href="#">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Kiosk/OUAT/DownloadAdmitCart.aspx">Provisional Weightage</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to access the Provisional Weightage Page</span><br />
                                <span>Calculate Provisional Weightage for OUAT UG Course - 2017</span>
                            </div>
                            <div style="min-height: 4.66em; min-width:99%; z-index: -760;display:none;" class="SrvDiv" id="102">
                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=419&Mode=C">
                                    <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=419&Mode=D" onclick="javascript:return RedirectToService('/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=419&Mode=D');">Submission Of Online Application For Entrance Examination Of OUAT Masters & Doctoral Programme – 2017 In Agriculture & Allied Subjects</a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">OUAT Masters & Doctoral Programme – 2017 In Agriculture & Allied Subjects</span><br />
                                <span>Candidate Applying Directly Click Here (Online Payment)</span>
                            </div>
                        </div>
                        <div class="col-lg-12" style="text-align: left; margin-top: 20px; display: none">
                            <h2 style="color: #ce6d07; font-size: 30px; font-weight: bold; text-shadow: 0px 1px 3px #727272;">Application Form For Admission into Undergraduate Course 2017-18
                                <br />
                            </h2>
                            <p style="color: #337ab7; font-size: 12px;">
                                <i class="fa fa-hand-o-up"></i><a style="font-size: 15px;" href="pdf/detailed_advertisement_in_english_version.pdf" target="_blank">Detailed Advertisement for recruitment of Constables in 9th India Reserve Battalion (Specialised).</a>
                                <img src="img/blink_icon.gif" />
                            </p>

                            <p style="color: #337ab7; font-size: 12px;"><i class="fa fa-hand-o-up"></i><a style="font-size: 15px;" href="pdf/detailed_advertisement_in_odia_version.pdf" target="_blank">Detailed Advertisement for recruitment of Constables in 9th India Reserve Battalion (Specialised) in Odia Version.</a><img src="img/blink_icon.gif" /></p>

                            <p style="color: #337ab7; font-size: 12px;"><i class="fa fa-hand-o-up"></i><a style="font-size: 15px;" href="pdf/odisha_groupC_and_groupD_posts_contractual_appointment_ru.pdf" target="_blank">Contractual appointment Rules 2013 (For Group-C & Group-D) Posts.</a><img src="img/blink_icon.gif" /></p>
                            <p style="color: #337ab7; font-size: 12px;">
                                <i class="fa fa-hand-o-up"></i><a style="font-size: 15px;" href="pdf/recruitment_rules_of_sepoys_constables_in_battalions.pdf" target="_blank">Method of Recruitment & Conditions of Service of Sepoys/Constables in Battalion Rules,2011. </a>
                                <img src="img/blink_icon.gif" />
                            </p>
                            <p style="color: #337ab7; font-size: 12px;">
                                <i class="fa fa-hand-o-up"></i><a style="font-size: 15px;" href="pdf/notice_for_recruitment_of_constables_in_9th_IRBn_specialised.pdf" target="_blank">Notice for Recruitment of Constables in 9th India Reserve Bn (Spl.)</a>
                                <img src="img/blink_icon.gif" />
                            </p>
                            <p style="color: #337ab7; font-size: 12px;">
                                <i class="fa fa-hand-o-up"></i><a style="font-size: 15px;" href="pdf/battalion_office_of_the_supdt_of_police.pdf" target="_blank">Battalion Office of the superintendent of Police where Offline / Manual Forms will be distributed</a>
                                <img src="img/blink_icon.gif" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
