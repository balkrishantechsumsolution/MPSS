<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="MPSOSPage.aspx.cs" Inherits="CitizenPortal.WebApp.Entrance.PhD.CSVTUPage" %>


<!DOCTYPE html>

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
    </style>
    <script>
        $(document).ready(function () {
            $('#divLogin').hide();
        });
    </script>
</head>
<body style="background-color:#fdfdfd">
    <form id="form1" runat="server">
        <div>



            <header>
                <div class="container-fluid" style="display:none">
                    <div class="row" style="background-color: #fd3535; clear: both; color: #fff;">
                        <div class="col-lg-12" style="padding-top: 7px; font-weight: bold">
                            <marquee>
                        " Unregister Existing Student : Candidate who has not created thier Login ID & Passowrd, please click to generate Login Id & Password <b><a href ="/WebApp/Examination/SearchStudent.aspx#!" style="color:yellow">GENERATE LOGIN ID & PASSWORD</a></b> "
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
                            <h1>Madhya Pradesh State Open School, Bhopal</h1>

                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 common-nav pull-right">
                            <div class="row">
                                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-3 text-right pull-right">
                                    <img src="/Sambalpur/img/DigiVarsity.png" class="img-responsive small-view" style="height: 80px !important; text-align: right" alt="DigiUarsity (A complete University Module)" />
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
                            <span class="col-lg-12 p0" style="font-family: 'Arial Unicode MS'; font-size: 32px;"><i class="fa fa-pencil-square-o"></i>श्रमोदय (आवासीय) विद्यालय प्रवेश परीक्षा 2023-24 की आवेदन फ़ार्म</span>
                            <span class="clearfix"></span>
                        </h2>
                        <div class="">
                            <div class="resp-tabs-container ver_1">
                                <div style="margin-top: 10px;">
                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="101">
                                        <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1466">
                                            <img src="/Sambalpur/img/DigiVarsity.png" alt="" align="left" style="height: 60px; margin-top: 5px;" />
                                        </a>
                                        <a href="SharmodayaExam.aspx" onclick="javascript:return RedirectToService('/WebApp/Kiosk/MPSS/SharmodayaExam.aspx');">Application form for appearing in the Entrance Examination</a>
                                        <br />
                                        <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">(SHARMODAYA EXAM 2023-24)</span><br />
                                        <span>Click to Fill Application</span>
                                    </div>
                                    <div style="min-height: 4.66em; z-index: -760; display:block;" class="SrvDiv" id="102">
                                        <a href="MISReports.aspx" onclick="javascript:return RedirectToService('/WebApp/Kiosk/MPSS/MISReports.aspx');">
                                            <img src="/Sambalpur/img/DigiVarsity.png" alt="" align="left" style="height: 60px; margin-top: 5px;" />
                                        </a><a href="MISReports.aspx">Report of Filled Application</a>
                                        <br />
                                        <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to Print Filled Application</span><br />
                                        <span>Click to Print Report</span>
                                    </div>


                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="/Sambalpur/js/bootstrap.min.js" type="text/javascript"></script>
        <%--Modal JS START HERE--%>
        <script src="/Sambalpur/js/velocity.min.js" type="text/javascript"></script>
        <script src="/Sambalpur/js/velocity.ui.min.js" type="text/javascript"></script>
        <script src="/Sambalpur/js/modaleffect.js" type="text/javascript"></script>
    </form>
</body>
</html>
