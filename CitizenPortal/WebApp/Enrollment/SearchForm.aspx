<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="SearchForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Enrollment.SearchForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--For Date Picker--%>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--For Date Picker--%>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet3.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet4.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {

            $('#txtBirthDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-18:+0",
                onSelect: function (date) {

                }
            });
            $('#txtDOA').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
        });

        //search form validate
        function ValidateForm() {
            debugger;
            var text = "";
            var opt = "";
            var FirstName = $("#txtStudentName");
            var MobileNo = $("#txtMobile");
            var AppNo = $("#txtApplicationNO");
            var DOB = $("#txtBirthDate");
            var AdmissionNo = $("#txtAdmissionNo");
            var captcha = $("#captcha");


            if (AdmissionNo.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Admission Number. ";
                AdmissionNo.attr('style', 'border:1px solid #d03100 !important;');
                AdmissionNo.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (DOB.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
                DOB.attr('style', 'border:1px solid #d03100 !important;');
                DOB.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (MobileNo.val() == '' && FirstName.val() == '' && AppNo.val() == '') {
                text += "<BR>" + " \u002A" + " And any of one either Mobile No OR Student Name OR Reference No. ";
                //FirstName.attr('style', 'border:1px solid #d03100 !important;');
                //FirstName.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (captcha.val() == '') {
                text += "<BR>" + " \u002A" + " Please enter captcha code. ";
                captcha.attr('style', 'border:1px solid #d03100 !important;');
                captcha.css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }


    </script>
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
            margin: 1.5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
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

        .modalBackground {
            background-color: #000;
            filter: alpha(opacity=90);
            opacity: 0.6;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 10000;
            height: 1000%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="progressbar" class="modalBackground" runat="server" clientidmode="Static" style="height: 700%; border: 1px solid #ccc; display: none">
        <div style="z-index: 105; left: 40%; position: absolute; top: 70%;" class="text-center">
            <img id="imgloader" alt="" runat="server" src="/WebApp/Kiosk/Images/loading.gif" style="height: 200px;" />
            <p class="text-danger">
                Please do not refresh or click back button<br />
                as Request is Processing....
            </p>
        </div>
    </div>

    <section class="home-contentbox">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div style="float: left; width: 84%">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                        Search DTE Student Data to Enroll into CSVTU Course 
                    </h2>
                </div>
                <div style="float: right; width: 15%">
                    <h2 class="form-heading"><i class="fa fa-download"></i><a href="../../../Sambalpur/pdf/department_manual.pdf" target="_blank">Help Manual</a></h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container" id="">
                <div class="box-heading">
                    <h4 class="box-title">Instruction to Fill the Enrollment Form 
                                <span class="col-md-6 pull-right" style="font-style: normal; cursor: pointer; font-size: 12px; text-align: right; padding: 0;" onclick="ckhInfo();">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 15px;" title="Information">&nbsp;&nbsp;</i><span id="lblInfo">Hide</span>&nbsp;&nbsp;<i class="fa fa-eye"></i></span><span class="clearfix"></span>
                    </h4>
                </div>
                <div class="box-body box-body-open" id="divInfo">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div id="spnINnfo" style="line-height: 25px; margin-bottom: 5px;">


                            <div class="form-group padding10">
                                <div>
                                    <strong>STEP 1</strong>: <strong>Search Student Record</strong>

                                </div>
                                <div class="padding20 ptop0">
                                    a. Enter <span style="color: red">*</span><b>DTE Registration Number</b> mandatory
                            <br />
                                    b. <span style="color: red">*</span><b>Date of Birth</b> (as entered in DTE Counselling Form) mandatory
                            <br />
                                    c. <span style="color: red">*</span><b>DTE Roll Number</b> (as assigned by DTE) mandatory
                            <br />
                                    d. Name of the Student (as entered in admission form) optional
                            <br />
                                    e. Student Father's Name (as entered in admission form) optional
                            <br />
                                    f. <span style="color: red">*</span><b>Captcha</b> (enter the text as displayed in the image) mandatory.
                                </div>
                                If facing any problem in searching the record, please contact your resoective college for details - DTE Registered No, Date of Birth, DTE Roll No etc.
                                        
                            </div>

                        </div>

                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%--<uc1:ServiceInformation runat="server" ID="ServiceInformation" />--%>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                <div id="divErr" class="danger error bg-warning">
                    Please enter 
                    <strong>DTE Registration No.</strong> &amp; <strong>Date of Birth</strong> as Mandatory Fields and any one of <strong>DTE Roll Number</strong> OR <strong>Student Name</strong> OR <strong>Student Father&#39;s Name</strong> to Enroll into CSVTU
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="mtop10"></div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Applicant Details as per DTE Counselling
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                        <div class="form-group">
                            <label class="manadatory" for="">Course Name</label>
                            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0" Text="--Select Course Name"></asp:ListItem>
                                <asp:ListItem Value="" Text="Artificaial Intelliganece and Machine Learning"></asp:ListItem>
                                <asp:ListItem Value="" Text="CAD /CAM - Robotics"></asp:ListItem>
                                <asp:ListItem Value="" Text="Civil Engineering"></asp:ListItem>
                                <asp:ListItem Value="" Text="Computer Networks"></asp:ListItem>
                                <asp:ListItem Value="" Text="Computer Science and Engineering (Artificial Intelligence and Machine learning)"></asp:ListItem>
                                <asp:ListItem Value="" Text="Computer Science Engg."></asp:ListItem>
                                <asp:ListItem Value="" Text="Computer Technology"></asp:ListItem>
                                <asp:ListItem Value="" Text="Computer Technology & Application"></asp:ListItem>
                                <asp:ListItem Value="" Text="Data Sciences"></asp:ListItem>
                                <asp:ListItem Value="" Text="Digital Communication"></asp:ListItem>
                                <asp:ListItem Value="" Text="Digital Electronics"></asp:ListItem>
                                <asp:ListItem Value="" Text="E- Security"></asp:ListItem>
                                <asp:ListItem Value="" Text="Electric Power and Energy System"></asp:ListItem>
                                <asp:ListItem Value="" Text="Environmental Engg."></asp:ListItem>
                                <asp:ListItem Value="" Text="Geotechnical Engineering"></asp:ListItem>
                                <asp:ListItem Value="" Text="High Voltage Engineering"></asp:ListItem>
                                <asp:ListItem Value="" Text="Industrial Engg. and Management"></asp:ListItem>
                                <asp:ListItem Value="" Text="Industrial Safety"></asp:ListItem>
                                <asp:ListItem Value="" Text="Machine design"></asp:ListItem>
                                <asp:ListItem Value="" Text="Mechanical Engineering (Production)"></asp:ListItem>
                                <asp:ListItem Value="" Text="Nano Technology"></asp:ListItem>
                                <asp:ListItem Value="" Text="Power Electronics"></asp:ListItem>
                                <asp:ListItem Value="" Text="Power Electronics & Power Systems"></asp:ListItem>
                                <asp:ListItem Value="" Text="Power System & Control"></asp:ListItem>
                                <asp:ListItem Value="" Text="Power Systems"></asp:ListItem>
                                <asp:ListItem Value="" Text="Production Engg."></asp:ListItem>
                                <asp:ListItem Value="" Text="Structural Engg."></asp:ListItem>
                                <asp:ListItem Value="" Text="Thermal Engg."></asp:ListItem>
                                <asp:ListItem Value="" Text="Transportation Engg."></asp:ListItem>
                                <asp:ListItem Value="" Text="VLSI"></asp:ListItem>
                                <asp:ListItem Value="" Text="VLSI Design"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                DTE Registration Number</label>
                            <asp:TextBox ID="txtRegNo" runat="server" CssClass="form-control" placeholder="DTE Registration Number" ClientIDMode="Static" MaxLength="15"></asp:TextBox>

                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtBirthDate">
                                Date of Birth</label>
                            <asp:TextBox ID="txtBirthDate" runat="server" MaxLength="10" CssClass="form-control" placeholder="DD/MM/YYYY"
                                value="" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label for="txtMobile">
                                DTE Roll Number</label>
                            <asp:TextBox ID="txtRollNo" runat="server" class="form-control" MaxLength="20" placeholder="DTE Roll No."
                                value="" ClientIDMode="Static"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="">
                                Name of the Student</label>
                            <asp:TextBox MaxLength="100" ID="txtStudentName" runat="server" class="form-control" placeholder="Student Full Name"
                                value="" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label>
                                Student Father's Name</label>
                            <asp:TextBox MaxLength="50" ID="txtFather" runat="server" class="form-control" placeholder="Father's Name"
                                value="" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                        <div style="margin-top: -12px;">
                            <label>
                                <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />
                            </label>
                            <asp:TextBox MaxLength="6" ID="captcha" runat="server" class="form-control" placeholder="Enter Captcha" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-lg-12 text-center">
                        <label class="" for="">
                            &nbsp;
                        </label>
                        <asp:Button ID="btnSubmit" runat="server" OnClientClick="return ValidateForm();" OnClick="btnSubmit_Click"
                            class="btn btn-primary" Text="Search Application" />
                        <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();" />
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <%----END of Filter-----%>
        </div>

    </section>

</asp:Content>
