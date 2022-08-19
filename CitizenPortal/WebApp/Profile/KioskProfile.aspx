<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KioskProfile.aspx.cs" Inherits="CitizenPortal.WebApp.Profile.KioskProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <link href="../bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../Styles/timeline.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .navbar-brand > img {
            width: 188px;
            margin-top: -13px;
        }

        .title {
            margin: 10px auto 0 50px;
            font-size: 2em;
            font-weight: bold;
            display: block;
            text-align: center;
        }

        .camera {
            display: block;
            margin: -60px auto 0;
            width: 1px;
            border-radius: 50px;
            position: relative;
            border: 4px solid #f2f2f2;
            background: #ccc;
            padding: 10px;
            width: 75px;
            height: 75px;
            background-image: url('../Images/camera.png');
            cursor: pointer;
        }

            .camera:hover {
                box-shadow: 0 -4px 18px 0 rgba(0, 0, 0, 0.2), 0 6px 5px 0 rgba(0, 0, 0, 0.2);
                width: 74px;
                height: 74px;
            }

        .panel-success {
            margin-top: -2px;
        }

        .panel {
            background-color: #f6f6f6;
        }

        .profile-wapper {
            height: 150px;
            font-weight: 700;
            color: Maroon;
        }

        .profile {
            border-radius: 50px;
            width: 105px;
            height: 105px;
            margin: 20px auto 10px;
            border: 3px solid #b1b1b1;
            display: block;
            background: #ccc;
        }

            .profile > img {
                border-radius: 50px;
                width: 100px;
                height: 100px;
                margin: 0 auto 10px;
                border: 2px solid #cfcfcf;
                display: block;
            }

        #wrapper {
            margin-bottom: 50px;
        }

        .modalBackground {
            background-color: #F4F4F4;
            filter: alpha(opacity=90);
            opacity: 0.9;
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 10000;
        }

        #divSteps {
            position: relative;
            top: 0;
            z-index: 10;
            display: block;
            margin: 0 auto;
        }

        .register-num {
            padding: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="progressbar" class="modalBackground" clientidmode="Static"
                style="display: none;">
                <center style="z-index: 105; left: 45%; position: absolute; top: 50%">
        <img id="imgloader" alt=""  src="../Images/waiting.gif"
             style="width: 150px;" />
        <center style="font-size: 15px; font-weight: bold; color: Maroon">
            <br />
            Please Wait It's Processing
        </center>
    </center>
            </div>

            <div id="wrapper">
                <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">


                    <div class="navbar-default sidebar" role="navigation">
                        <div class="sidebar-nav navbar-collapse">
                            <ul class="nav" id="side-menu">
                                <li>
                                    <center class="profile-wapper">
                            <div class="profile">
                                <img src="../Images/user_1.png" alt="Name of the Agent" />
                            </div>
                            <p><span id="profileanme">Niraj Gupta </span><span id="profileId">[MPO-337]</span></p>
                        </center>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                                </li>
                                <li>
                                    <a class="active" href="#"><i class="fa fa-google-wallet fa-fw"></i>Top Up Walet</a>
                                </li>
                                <li class="">
                                    <a href="#"><i class="fa fa-anchor fa-fw"></i>Citizen Services<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                                        <li>
                                            <a href="#">Senior Citizen</a>
                                        </li>
                                        <li>
                                            <a href="#">Age Certificate</a>
                                        </li>
                                        <li>
                                            <a href="#">Birth Certificate</a>
                                        </li>
                                        <li>
                                            <a href="#">Income Certificate</a>
                                        </li>
                                        <li>
                                            <a href="#">Residence Certificate</a>
                                        </li>
                                        <li>
                                            <a href="#">Marrage Certificate</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="">
                                    <a href="#"><i class="fa fa-book fa-fw"></i>Application<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                                        <li>
                                            <a href="#">Drafted Application</a>
                                        </li>
                                        <li>
                                            <a href="#">Send Reports</a>
                                        </li>
                                        <li>
                                            <a href="#">Transaction Reports</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="">
                                    <a href="#"><i class="fa fa-book fa-fw"></i>Reports<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                                        <li>
                                            <a href="#">Drafted Reports</a>
                                        </li>
                                        <li>
                                            <a href="#">Send Reports</a>
                                        </li>
                                        <li>
                                            <a href="#">Transaction Reports</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div id="page-wrapper" style="min-height: 500px !important;">
                    <div class="row">
                        <div class="col-lg-12">
                        </div>
                    </div>
                    <%---Start of Information----%>
                    <div class="row mt10 mb5">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-primary mb5">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-2">
                                            <i class="fa fa-calendar fa-4x"></i>
                                        </div>
                                        <div class="col-xs-10 text-right">
                                            <div class="huge">
                                                04
                                            </div>
                                            <div>
                                                September 2016
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-green  mb5">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-rupee fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                90832
                                            </div>
                                            <div>
                                                Balance Amount
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-red mb5">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-tasks fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                2401
                                            </div>
                                            <div>
                                                Total Transaction
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-yellow mb5">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-support fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                1300
                                            </div>
                                            <div>
                                                Approved Certificate
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%----END of Information-----%>
                    <%---Start of Steps----%>
                    <div class="row" id="divSteps">
                        <div class="col-md-12 box-container" style="padding: 0">
                            <div class="text-danger text-danger-green mt0">
                                <div class="col-md-12" style="margin: 0 auto; width: 100%;">
                                    <div class="step1" id="step1">
                                        <p class="steptext">
                                            1
                                        </p>
                                        <p class="optiontext">
                                            Basic Information
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step2" id="step2">
                                        <p class="steptext">
                                            2
                                        </p>
                                        <p class="optiontext">
                                            Shop Details
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step3" id="step3">
                                        <p class="steptext">
                                            3
                                        </p>
                                        <p class="optiontext">
                                            Documents
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step4" id="step4">
                                        <p class="steptext">
                                            4
                                        </p>
                                        <p class="optiontext">
                                            Supervisor Approval
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step5" id="step5">
                                        <p class="steptext">
                                            5
                                        </p>
                                        <p class="optiontext">
                                            Financial Approval
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step6" id="step6">
                                        <p class="steptext">
                                            6
                                        </p>
                                        <p class="optiontext">
                                            Available Services
                                        </p>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%----END of Steps-----%>
                    <%---Start of Instruction----%>
                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">KIOSK Registration
                                </h4>
                            </div>
                            <div class="">
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-info">
                                        <span><i class="fa fa-gear fa-fw"></i>Instruction</span>
                                        <ul class="">
                                            <li>All astric (*) marked field are mandatory
                                            </li>
                                            <li>UID / Voter Id No / PAN No is mandatory
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item list-group-item-success">
                                        <span class=""><i class="fa fa-gear fa-fw"></i>Applicant Photograph</span>
                                        <ul class="">
                                            <li>The file format needs to be in .bmp / .jpg / .png
                                            </li>
                                            <li>Size Photograph should be between 5KB to 500KB.
                                            </li>
                                            <li>The width of the photograph should be 160 pixels
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="list-group-item list-group-item-info">
                                        <span><i class="fa fa-gear fa-fw"></i>Verification</span>
                                        <ul class="">
                                            <li>Verify the mobile and email id, through verification code send through SMS and email
                                            </li>
                                            <li>Enter the captcha to verify youself
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%----END of Instruction-----%>
                    <div class="row">
                        <%---Start of PhotoUpload----%>
                        <div class="col-md-4 box-container">
                            <div class="box-heading">
                                <h4 class="box-title register-num">KIOSK Photograph
                                </h4>
                            </div>
                            <div class="panel panel-success">
                                <div class="panel-body">
                                    <div class="alert alert-info col-xs-12 col-sm-6 col-md-12 col-lg-12" style="display: none">
                                        Please, upload your recent pasport size photograph size between 200 to 250 pixels.
                                    </div>
                                    <div class="col-lg-12">
                                        <img class="form-control" src="../Images/photo1.png" name="photoshop" style="height: 220px" />
                                        <input class="camera"
                                            id="File1" name="Photoupload" type="file">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%----END of PhotoUpload-----%>
                        <%---Start of ShopDetail----%>
                        <div class="col-md-8 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">KIOSK Information
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="lblKIOSKID">
                                            KIOSK ID
                                        </label>
                                        <input class="form-control" placeholder="KIOSK ID" name="KIOSK ID" type="text" value="162133987659001" readonly
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="lblUserId">
                                            User Id
                                        </label>
                                        <input class="form-control" placeholder="User Id" name="lblUserId" type="text" value="userid@we010" readonly
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="lblRegistered">
                                            Registered On
                                        </label>
                                        <input class="form-control" placeholder="" name="lblRegistered" type="text" value="22-04-2016 16:32:221" readonly
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                    <div class="form-group">
                                        <label class="manadatory" for="lblShopName">
                                            KIOSK Name
                                        </label>
                                        <input class="form-control" placeholder="Shop Name" name="lblShopName" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="lblPhone">
                                            Land Line No. (Phone No)
                                        </label>
                                        <input class="form-control" placeholder="(022) 456-235002" name="lblPhone" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="lblFax">
                                            Fax No.
                                        </label>
                                        <input class="form-control" placeholder="Enter FAX no." name="lblFax" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="lblLoc">
                                            Geographical Location
                                        </label>
                                        <input class="form-control" placeholder="Enter Longitude / Latitude" name="lblLoc" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                        <%----END of ShopDetail-----%>
                    </div>
                    <%---Start of KIOSKAddress----%>
                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">KIOSK Address
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Address Line-1 (Shop Name)
                                        </label>
                                        <input class="form-control" placeholder="First Line Address" name="Address Line-1 (Care of)" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="" for="Village">
                                            Address Line-2 (Shop No)
                                        </label>
                                        <input class="form-control" placeholder="Second Line Address" name="Address Line-2 (Building)" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Road / Street Name Road
                                        </label>
                                        <input class="form-control" placeholder="Road / Street Name Road" name="Road / Street Name Road" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="" for="ddlYearTerm">
                                            Landmark
                                        </label>
                                        <input class="form-control" placeholder="Landmark" name="Landmark" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Locality
                                        </label>
                                        <input class="form-control" placeholder="Locality" name="Locality" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            State
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="State."
                                            data-val-required="Please select gender." id="ddlState" name="State">
                                            <option>Select Sate</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Sikkim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            District
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="District."
                                            data-val-required="Please select District." id="ddlDistrict" name="District">
                                            <option>Select District</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Sikkim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            Taluka
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="Taluka."
                                            data-val-required="Please select gender." id="ddlTaluka" name="Taluka">
                                            <option>Select Taluka</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Sikkim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            City/Town/Village
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="State."
                                            data-val-required="Please select gender." id="ddlVillage" name="State">
                                            <option>Select Village</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Sikkim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">
                                            PIN
                                        </label>
                                        <input class="form-control" placeholder="PIN" name="PIN" type="" value="" max-length="6" pattern="[09]{6}"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%----END of KIOSKAddress-----%>
                    <%---Start of KIOSKAddress----%>
                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Infrastructure Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Internet connection type
                                        </label>
                                        <select id="ddl_InternetType"
                                            class="form-control" tooltip="Select Internet Type">
                                            <option>Select Internet Type</option>
                                            <option value="Dial Up">Dial Up</option>
                                            <option>ISDN</option>
                                            <option>Broad Band</option>
                                            <option>ADSL</option>
                                            <option>Cable</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Power-cut time
                                        </label>
                                        <input class="form-control" placeholder="Power cut duration in Hours" name="" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Back-up power time
                                        </label>
                                        <input class="form-control" placeholder="Power backup available time" name="Road / Street Name Road" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="" for="ddlYearTerm">
                                            No. of computers
                                        </label>
                                        <input class="form-control" placeholder="No. of computers" name="lblComputer" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            No. of Scanner
                                        </label>
                                        <input class="form-control" placeholder="No. of Scanner" name="No. of Scanner" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            No. of printer
                                        </label>
                                        <input class="form-control" placeholder="No. of printer" name="No. of Scanner" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">
                                            No. of Camera
                                        </label>
                                        <input class="form-control" placeholder="No. of Camera" name="No. of Camera" type="" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">
                                            Average User
                                        </label>
                                        <input class="form-control" placeholder="Average User" name="No. of Camera" type="" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">
                                            Nearby Institute
                                        </label>
                                        <input class="form-control" placeholder="No. of Institute" name="No. of Camera" type="" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">
                                            Nearby Offices
                                        </label>
                                        <input class="form-control" placeholder="No. of Offices" name="No. of Camera" type="" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%----END of KIOSKAddress-----%>
                    <%---Start of Operators Information----%>
                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Operator Information
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Educational Qualification
                                        </label>
                                        <select id="DropDownList1"
                                            class="form-control">
                                            <option>Select Educational Qualification</option>
                                            <option value="Dial Up">Dial Up</option>
                                            <option>ISDN</option>
                                            <option>Broad Band</option>
                                            <option>ADSL</option>
                                            <option>Cable</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Computer Experience
                                        </label>
                                        <select id="DropDownList2"
                                            class="form-control" tooltip="Select Internet Type">
                                            <option>Select Computer Experience</option>
                                            <option value="Dial Up">5 Years Experience</option>
                                            <option>5 Years Experience</option>
                                            <option>3 Years Experience</option>
                                            <option>2 Years Experience</option>
                                            <option>1 Years Experience</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Computer Certification
                                        </label>
                                        <select id="DropDownList3"
                                            class="form-control" tooltip="Select Internet Type">
                                            <option value="Select">Select</option>
                                            <option value="16_5">MHSCIT Certification</option>

                                            <option value="17_4">MCA</option>
                                            <option value="18_3">BCA</option>
                                            <option value="19_2">B-Tech</option>
                                            <option value="20_1">B-E</option>
                                            <option value="51_1">CCC</option>
                                            <option value="9_0">Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%----END of KIOSKAddress-----%>
                    <%---Start of Document----%>
                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Supporting Documents
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Shop Establishment
                                        </label>
                                        <input class="form-control" name="KIOSK ID" type="file"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Proof of Divine Body
                                        </label>
                                        <input class="form-control" name="KIOSK ID" type="file"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Residencial Proof
                                        </label>
                                        <input class="form-control" name="KIOSK ID" type="file"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="ddlYearTerm">
                                            Aadhar Card
                                        </label>
                                        <input class="form-control" name="KIOSK ID" type="file"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            PAN Card
                                        </label>
                                        <input class="form-control" name="KIOSK ID" type="file"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Highest Qualification Document
                                        </label>
                                        <input class="form-control" name="KIOSK ID" type="file"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>

                        </div>
                    </div>

                    <%----END of Document-----%>
                    <%---Start of Button----%>
                    <div class="row">
                        <div class="col-md-12 box-container" id="divBtn">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <%--<asp:Button ID="btnConfirm"  Text="Submit" class="btn btn-success"
                                    OnClientClick="return checkDeclaration();" />--%>
                                <input type="button" id="btnConfirm" class="btn btn-success" value="Submit" onclick="checkDeclaration();" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <%----END of Button-----%>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
