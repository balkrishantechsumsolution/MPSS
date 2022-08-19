<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="SearchForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CBCS.SearchForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--For Date Picker--%>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--For Date Picker--%>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" type="text/css" rel="stylesheet" />


    <script type="text/javascript">
        $(document).ready(function () {

            $('#txtBirthDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
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
                        Search Student List for +3 Examination Enrollment (CBCS) 
                    </h2>
                </div>
                <div style="float: right; width: 15%">
                    <h2 class="form-heading"><i class="fa fa-download"></i>    <a href="../../../Sambalpur/pdf/department_manual.pdf" target="_blank">Help Manual</a></h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                <div id="divErr" class="danger error bg-warning">
                    Please enter 
                    <strong>Admisson No.</strong> &amp; <strong>Date of Birth</strong> as Mandatory Fields and any one of <strong>Mobile Number</strong> OR <strong>Student Name</strong> OR <strong>Reference ID</strong> to access the +3 Exam. Enrollment Form
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="mtop10"></div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Applicant Details 
                    </h4>
                </div>

                <div class="box-body box-body-open">

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Admission Number</label>
                            <asp:TextBox ID="txtAdmissionNo" runat="server" CssClass="form-control" placeholder="Admission Number" ClientIDMode="Static" MaxLength="20"></asp:TextBox>

                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="DOB">
                                Date of Birth</label>
                            <asp:TextBox ID="txtBirthDate" runat="server" MaxLength="10" CssClass="form-control" placeholder="DD/MM/YYYY"
                                value="" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label for="txtMobile">
                                Mobile Number</label>
                            <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="10" placeholder="Registered mobile no"
                                value="" onkeypress="return isNumberKey(event);" ClientIDMode="Static"></asp:TextBox>

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
                                Reference Number</label>
                            <asp:TextBox MaxLength="12" ID="txtApplicationNO" runat="server" class="form-control" placeholder="Application Number"
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
            <div class="mt10"></div>
            <%----END of Filter-----%>
            <%---Start of Application Details----%>
            <div class="" style="">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Instruction for Enrollment</h4>
                    </div>
                    <div class="box-body box-body-open p0" style="">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                            <div class="form-group padding20">
                                <div>
                                    <strong>STEP 1</strong>: <strong>Search Student Record</strong>
                                    
                                </div>
                                <div class="padding20 ptop0">
                                    a. Enter <span style="color: red">*</span><b>Admission No</b> (received through SMS in registered Mobile No) mandatory
                            <br />
                                    b. Enter Register <span style="color: red">*</span><b>Mobile No.</b> (as entered in admission form) mandatory
                            <br />
                                    c. <span style="color: red">*</span><b>Date of Birth</b> (as entered in admssion form) mandatory
                            <br />
                                    d. <span style="color: red">*</span><b>Branch</b> (stream in which admission taken) mandatory
                            <br />
                                    e. Name of the Student (as entered in admission form) optional
                            <br />
                                    f. Reference No./Applicantion No. (received through SMS) optional
                            <br />
                                    g. <span style="color: red">*</span><b>Captcha</b> (enter the text as displayed in the image) mandatory.
                                </div>
                                If facing any problem in searching the record, please contact your college's DEO for details - Registered Admission No, Mobile No, Date of Birth etc.
                                        
                            <br />
                                <br />
                                
                                <strong>STEP 2</strong>: <strong>Fill the Enrollment Form</strong>
                                <br /><div class="padding20 ptop0">
                                a. Partially (basic details & subjects) filled enrollment form is displayed.
                            <br />
                                b. Commplete the Enrollment Form, Upload the Photograph and Signature, enter the present & permanent address, education qualification and check the Subject take.
                            <br />
                                c. Submit the form after entering all the mandatory details.
                            <br />
                                d. You will receive <b>LOGIN ID & PASSWORD</b> as SMS in register Mobile No. (you can also contact DEO's for Login Id & Password)
                            <br />
                                    </div>
                               
                                
                                <strong>STEP 3: Upload necessary document </strong>                               
                                <div class="padding20 ptop0">
                                a. Upload the necessary document you can upload document anytime after login into the system 
                            <br />
                                b. Please upload the original scan copy of the document.
                            <br />
                                Please note, if all the mandatory document in not uploaded the application shall not be appoved and Roll No shall not be assigned to semester examination.
                                        <br />
                                </div>
                                
                                <b>STEP 4: Make Payment</b>
                                <br /><div class="padding20 ptop0">
                                a. Make payment of the enrollment fee of <b>Rs. 59.00/-</b>
                                <br />
                                b. You can make payment after Login into the system
                            <br />
                                Please note, if enrollment fee is not paid then the Roll No shall not be assigned to semester examination
                                <br />
                                </div>
                                
                                <strong>STEP 5: Check Status</strong>
                                <br /><div class="padding20 ptop0">
                                a. You can check the current status of the application after login into the system and clicking on the <b>VIEW</b> button against the application (it will take take to next level).
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

</asp:Content>
