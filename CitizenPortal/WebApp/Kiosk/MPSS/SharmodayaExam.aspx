<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SharmodayaExam.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSOS.SharmodayaExam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Sambalpur/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/normalize.min.css" rel="stylesheet" />
    <link href="../../Common/Styles/style.admin.css" rel="stylesheet" />
    <script src="/Sambalpur/js/jquery-2.2.3.min.js" type="text/javascript"></script>

    <!-- IE10 viewport hack START for Surface/desktop Windows 8 bug -->
    <link href="/Sambalpur/css/ie10-viewport-bug-workaround.css" type="text/css" rel="stylesheet" />
    <script src="/Sambalpur/js/ie-emulation-modes-warning.js" type="text/javascript"></script>
    <!-- IE10 viewport hack END for Surface/desktop Windows 8 bug -->
    <script src="../../WebApp/Scripts/DisableBackButton.js"></script>

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>

    <%--<script src="bootstrap-datetimepicker.min.js"></script>--%>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=1.26"></script>
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />

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
    <script type="text/javascript">
        $(document).ready(function () {

          

            $('#txtBirthdate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                minDate: new Date('2014/03/14'),
                yearRange: "-100:+0",
                maxDate: '0',

            });

            $('#txtCertIssueDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });


            var dtValDisAbility = $('#ddlDisAbility').val();
            if (dtValDisAbility == "Y") {
                $('#divDisAble').show();
                $('#tdDisAbility').show();

            }
            else {
                $('#divDisAble').hide();
                $('#tdDisAbility').hide();
            }


            var dtValCaste = $('#ddlCaste').val();
            if (dtValCaste == "1") {
                $('#div4').hide();
                $('#tdCaste').hide();


            }
            else {
                $('#div4').show();
                $('#tdCaste').show();

            }

        

            var dtValYesMatt = $('input:radio[name="chkYesMatt"]:checked').val();

            if (dtValYesMatt == 'Yes') {
                $('#div3').hide();
                $('#tdMarksheet').hide();
                ValidatorEnable($("[id$='RequiredFieldValidator20']")[0], false);
                ValidatorEnable($("[id$='RequiredFieldValidator15']")[0], false);
                ValidatorEnable($("[id$='RequiredFieldValidator18']")[0], false);
            }
            else {
                $('#div3').show();
                $('#tdMarksheet').show();
                ValidatorEnable($("[id$='RequiredFieldValidator20']")[0], true);
                ValidatorEnable($("[id$='RequiredFieldValidator15']")[0], true);
                ValidatorEnable($("[id$='RequiredFieldValidator18']")[0], true);
            }


            var dtVal = document.getElementById("hdnClass").value;

            var sdt = document.getElementById("hdnBirthDate").value;
            $('#txtBirthdate').val(sdt);

            
            //if (sdt != '') {
            //    ValidatorEnable($("[id$='RequiredFieldValidator4']")[0], false);
            //    $('#txtBirthdate').val(sdt);
            //}
            //else
            //{
            //    ValidatorEnable($("[id$='RequiredFieldValidator4']")[0], true);
            //}



            if (dtVal == "6") {

                var maxDate = "";
                var minDate = "";

                minDate = new Date('2010/01/04');
                maxDate = new Date('2015/03/31');

                $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);

            }
            if (dtVal == "7") {
                var maxDate = "";
                var minDate = "";

                minDate = new Date('2009/01/04');
                maxDate = new Date('2013/03/31');

                $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
            }
            if (dtVal == "8") {
                var maxDate = "";
                var minDate = "";

                minDate = new Date('2008/01/04');
                maxDate = new Date('2012/03/31');


                $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
            }

            if (dtVal == "9") {
                var maxDate = "";
                var minDate = "";

                minDate = new Date('2007/01/04');
                maxDate = new Date('2011/03/31');


                $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
            }
            if (document.getElementById('chkDecl').checked == true) {
                $('#btnSubMain').removeAttr("disabled");
            }
            else {

                $('#btnSubMain').attr("disabled", "disabled");
            }

            $('#txtTotalMarks').change(function () {

                GradeAndPercent();
            });

            $('#txtMarksObtain').change(function () {

                GradeAndPercent();
            });

            $('#txtBirthdate').change(function () {
                var dtVal = $('#txtBirthdate').val();
                document.getElementById("hdnBirthDate").value = dtVal;
            });
            $('#ddlDisAbility').change(function () {
                var dtVal = $('#ddlDisAbility').val();
                if (dtVal == "Y") {
                    $('#divDisAble').show();
                    $('#tdDisAbility').show();

                }
                else {
                    $('#divDisAble').hide();
                    $('#tdDisAbility').hide();
                }
            });


            $('#ddlCaste').change(function () {
                var dtVal = $('#ddlCaste').val();
                if (dtVal == "1") {
                    $('#div4').hide();
                    $('#tdCaste').hide();
                    

                }
                else {
                    $('#div4').show();
                    $('#tdCaste').show();
                    
                }
            });

            $('input:radio[name="chkYesMatt"]').change(
                function () {
                    if (this.checked && this.value == 'Yes') {
                        $('#div3').hide();
                        $('#tdMarksheet').hide();
                        ValidatorEnable($("[id$='RequiredFieldValidator20']")[0], false);
                        ValidatorEnable($("[id$='RequiredFieldValidator15']")[0], false);
                        ValidatorEnable($("[id$='RequiredFieldValidator18']")[0], false);
                    }
                    else {
                        $('#div3').show();
                        $('#tdMarksheet').show();
                        ValidatorEnable($("[id$='RequiredFieldValidator20']")[0], true);
                        ValidatorEnable($("[id$='RequiredFieldValidator15']")[0], true);
                        ValidatorEnable($("[id$='RequiredFieldValidator18']")[0], true);
                    }
                });


            $('#ddlClass').change(function () {
                var dtVal = $('#ddlClass option:selected').val();
                document.getElementById("hdnClass").value = dtVal;


                if (dtVal == "6") {

                    var maxDate = "";
                    var minDate = "";

                    minDate = new Date('2010/01/04');
                    maxDate = new Date('2015/03/31');

                    $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                    $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);

                }
                if (dtVal == "7") {
                    var maxDate = "";
                    var minDate = "";

                    minDate = new Date('2009/01/04');
                    maxDate = new Date('2013/03/31');

                    $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                    $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
                }
                if (dtVal == "8") {
                    var maxDate = "";
                    var minDate = "";

                    minDate = new Date('2008/01/04');
                    maxDate = new Date('2012/03/31');


                    $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                    $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
                }

                if (dtVal == "9") {
                    var maxDate = "";
                    var minDate = "";

                    minDate = new Date('2007/01/04');
                    maxDate = new Date('2011/03/31');


                    $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                    $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
                }


            });



            //$("#btnShow").click(function () {
            //    $('#divSTUDENT').show();
            //});
        });

        function checkValidation() {
            ValidatorEnable($("[id$='RequiredFieldValidator4']")[0], false);
        }


        function GradeAndPercent() {
            var dTotalVal = $('#txtTotalMarks').val();
            var dMarksObtain = $('#txtMarksObtain').val();

            var per = (parseInt(dMarksObtain) / parseInt(dTotalVal)) * 100;
            $('#txtMarksPercentage').val(per);

            var rw = $('#txtMarksPercentage').val();
            var grade = "";

            if (rw >= 80.00 && rw <= 100) { grade = 'A'; }
            else if (rw >= 70.00 && rw <= 79.99) { grade = 'B'; }
            else if (rw >= 60.00 && rw <= 69.99) { grade = 'C'; }
            else if (rw >= 50.00 && rw <= 59.99) { grade = 'D'; }
            else if (rw >= 40.00 && rw <= 49.99) { grade = 'E'; }
            else if (rw >= 0.00 && rw <= 39.99) { grade = 'F'; }

            $('#txtGrade').val(grade);
        }
        function GetApplicable() {
            if (document.getElementById('chkDecl').checked == true) {
                $('#btnSubMain').removeAttr("disabled");
            }
            else {

                $('#btnSubMain').attr("disabled", "disabled");
            }
        }

        function ValidateMobile() {
            var opt = "";
            var text = "";


            var txtMobie = $('#txtMobie').val();
            if (txtMobie == null || txtMobie == "") {
                //text += "<br />" + " \u002A" + " Please Enter Mobile No.";
                text += "<br /> -Please Enter Mobile No. ";
                $('#txtMobie').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtMobie').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else if (txtMobie != null) {
                $('#txtMobie').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtMobie').css({ "background-color": "#ffffff" });

                if (txtMobie != '' || txtMobie != null) {
                    var mobmatch1 = /^[6789]\d{9}$/;
                    if (!mobmatch1.test(txtMobie)) {
                        text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
                        $("#txtMobie").attr('style', 'border:1px solid #d03100 !important;');
                        $("#txtMobie").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                }
            }
            if (opt == "1") {
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }

        function ValidateDate(p_Date) {

            var inputText = p_Date;
            if (inputText != null && inputText != '') {
                var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
                // Match the date format through regular expression  
                if (dateformat.test(inputText)) {
                    var DOB = inputText.split('/');
                    var Y = DOB[2];
                    var M = DOB[1];
                    var D = DOB[0];
                    if (M < 10) {
                        if (M.length == 1) {
                            M = '0' + M;
                        }
                        else
                            M = M;
                    }
                    if (D < 10) {
                        if (D.length == 1) {
                            D = '0' + D;
                        }
                        else
                            D = D;
                    }

                    var NewDOB = D + '/' + M + '/' + Y;
                    $('#txtIssueDate').val(NewDOB);

                    return true;
                }
                else {
                    alert("Invalid date format!");
                    //document.form1.text1.focus();
                    $('#txtIssueDate').val('');
                    return false;
                }
            }
        }
        function GenerateCaptcha() {

            var locs1 = 'http://localhost:53056';
            var locs2 = 'http://mpsos.digivarsity.online';

            var URL = "";
            if (location.href.indexOf(locs2, -1)) {
                URL = locs1;
            }
            else {
                URL = locs2;
            }


            var _randomNumber = randomNumber(100000, 999999);
            $("#captchaImage").attr("src", URL + "/Account/GetCaptcha?ver=" + parseInt(_randomNumber));

        }


        function randomNumber(min, max) {
            return Math.random() * (max - min) + min;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div style="margin: 0 auto; width: 80%">
            <header>

                <div class="container-fluid whitebg myheader">

                    <div class="row tophead">
                        <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
                            <a href="../../../Default.aspx">
                                <img src="../Images/MPSOSLogo.jpg" class="img-responsive small-view" style="width: 80px !important; text-align: left" alt="Madhya Pradesh State Open School, Bhopal" /></a>
                        </div>
                        <div class="col-xs-12 col-sm-10 col-md-9 col-lg-9">
                            <h3 style="margin: 0">MADHYA PRADESH STATE OPEN SCHOOL EDUCATION BOARD BHOPAL</h3>

                        </div>


                    </div>
            </header>


            <div>


                <div class="rows">
                    <%--<div id="page-wrapper" style="min-height: 311px;">--%>
                    <h2 class="form-heading">
                        <span class="col-lg-12 p0" style="font-family: 'Arial Unicode MS'; font-size: 32px;"><i class="fa fa-pencil-square-o"></i>श्रमोदय (आवासीय) विद्यालय प्रवेश परीक्षा 2023-24 की आवेदन फ़ार्म</span>
                        <span class="clearfix"></span>
                    </h2>
                    <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10 mb10" id="divCredential">
                        <span style="font-weight: bold; margin-bottom: 5px">निर्देश:</span><br />
                        <span>कृपया अंग्रेजी भाषा में ही डेटा दर्ज करें</span>
                    </div>
                    <div class="clearfix"></div>


                    <div class="text-justify">
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1"
                            DisplayMode="BulletList"
                            ShowMessageBox="False" ValidationGroup="G" ShowSummary="True" CssClass="alert alert-danger" />
                    </div>

                </div>


                <%----Start of SearhBasicDetails-----%>

                <div class="row" id="divSearch" runat="server">
                    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">समग्र सदस्य 
                            </h4>
                        </div>

                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">

                                <div class="row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="">
                                                &nbsp;
                                            </label>
                                            <label class="manadatory">
                                                श्रमिकों का पोर्टल कोड़ क्रमांक
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="">
                                                &nbsp;
                                            </label>
                                            <asp:TextBox ID="txtRegNo" runat="server" ToolTip="पोर्टल कोड़ क्रमांक" placeholder="पोर्टल कोड़ क्रमांक" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtRegNo" Display="Dynamic"
                                                ErrorMessage="श्रमकों का पोर्टल कोड़ क्रमांक डाले" ValidationGroup="G" ForeColor="Red" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <label class="manadatory" for="Village">
                                                Verification Code
                                            </label>

                                        </div>


                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">

                                            <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" id="captchaImage" />
                                            <a id="btnrefresh" onclick="GenerateCaptcha();">
                                                <i class="fa fa-refresh"></i>
                                            </a>
                                        </div>


                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div>
                                                <asp:TextBox type="text" class="form-control" placeholder="Verification Code" name="txtCaptcha" id="txtCaptcha" maxlength="6" runat="server"/>
                                            </div>
                                            <div>
                                                <asp:Label   name="lblCaptcha" id="lblCaptcha" runat="server" style="color:Red;"/>
                                            </div>
                                        </div>



                                    </div>

                                </div>

                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            
                                            <asp:Button ID="btnShow" runat="server" CausesValidation="True" ToolTip="तलाशी"
                                                CssClass="btn btn-success" Text="Show Data" ValidationGroup="G" OnClick="btnShow_Click1" onClientClick="return checkValidation()"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">&nbsp;</div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtSamagraNo">समग्र परिवार आईडी</label>
                                    <asp:TextBox ID="txtSamagraNo" runat="server" ToolTip="Samagra No" onkeydown="return AllowOnlyNumeric(event);" ReadOnly="true" MaxLength="9" CssClass="form-control"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSamagraNo" Display="Dynamic"
                                            ErrorMessage="Please enter SamagraNo." ValidationGroup="G" ForeColor="Red" />--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="SamagraMemberID">समग्र आईडी</label>
                                    <asp:TextBox ID="txtSamagraMemberID" runat="server" ToolTip="Samagra No" onkeydown="return AllowOnlyNumeric(event);" ReadOnly="true" MaxLength="9" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="UniqueID">यूनीककोड</label>
                                    <asp:TextBox ID="UniqueID" runat="server" ToolTip="Samagra No" onkeydown="return AllowOnlyNumeric(event);" ReadOnly="true" MaxLength="9" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="CardHolder">कार्डधारक का नाम</label>
                                    <asp:TextBox ID="CardHolder" runat="server" ToolTip="Samagra No" onkeydown="return AllowOnlyNumeric(event);" ReadOnly="true" MaxLength="9" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <asp:Panel ID="pnlPhoto" runat="server" Visible="false">
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">आवेदक का फोटो
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" Style="height: 143px; width: 143px; margin: 0 auto;" ID="myImg" />
                                            <input class="camera" id="File1" name="Photoupload" type="file" runat="server" />
                                            <asp:Button ID="btnPhoto" type="submit" Text="Upload" runat="server" OnClick="btnPhoto_Click"></asp:Button>
                                            <asp:Panel ID="frmConfirmationPhoto" Visible="False" runat="server">
                                                <asp:Label ID="lblUploadResultPhoto" runat="server"></asp:Label>
                                            </asp:Panel>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <%-----End of SearhBasicDetails------%>

                <asp:Panel ID="pnlDetails" runat="server" Visible="false">
                    <div class="row" id="divSTUDENT" runat="server">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">छात्र प्रोफ़ाइल विवरण 
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="MotherName">कक्षा (जिस के लिए आवेदन करना चाहते है) </label>
                                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlSchoolDistrict">विद्यालय में प्रवेश हेतू जिला चुनें </label>
                                        <asp:DropDownList ID="ddlSchoolDistrict" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSchoolDistrict_SelectedIndexChanged">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlSchoolDistrict" Display="Dynamic"
                                            ErrorMessage="Please enter School District Name" ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlSchool">विद्यालय का नाम प्रवेश हेतू </label>
                                        <asp:DropDownList ID="ddlSchool" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlSchool" Display="Dynamic"
                                            ErrorMessage="Please enter School Name" ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtFullName">आवेदक / छात्रा का नाम </label>
                                        <asp:TextBox ID="txtFullName" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtFullName" Display="Dynamic"
                                            ErrorMessage="Please enter Student Name" ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtFatherName">पिता का नाम </label>
                                        <asp:TextBox ID="txtFatherName" runat="server" ToolTip="Father Full Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFatherName" Display="Dynamic"
                                            ErrorMessage="Please enter Father Name" ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtMotherName">माता का नाम </label>
                                        <asp:TextBox ID="txtMotherName" runat="server" ToolTip="Mother Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMotherName" Display="Dynamic"
                                            ErrorMessage="Please enter Mother Name" ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">मोबाइल नं </label>
                                        <asp:TextBox ID="txtMobie" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidateMobile();" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtMobie" Display="Dynamic"
                                            ErrorMessage="Please enter Mobie." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>

                                <div class="clearfix">
                                </div>

                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">जन्म तिथि (DD/MM/YYYY) </label>
                                        <asp:TextBox ID="txtBirthdate" runat="server" ReadOnly="true" ToolTip="dd/mm/yyyy" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBirthdate" Display="Dynamic"
                                            ErrorMessage="Please enter Date of Birth" ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-2 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">लिंग </label>
                                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlGender" InitialValue="0" Display="Dynamic"
                                            ErrorMessage="Please select Gender." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-2 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">छात्रा की श्रेणी </label>
                                        <asp:DropDownList ID="ddlCaste" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCaste" InitialValue="0" Display="Dynamic"
                                            ErrorMessage="Please select Category." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-2 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">क्या आप दिव्यांग हैं  </label>
                                        <asp:DropDownList ID="ddlDisAbility" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                                            <asp:ListItem Value="N">No</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlDisAbility" InitialValue="0" Display="Dynamic"
                                            ErrorMessage="Please select Disability." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div id="divDisAble" style="display: none;">
                                    <div class="col-xs-6 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">यदि दिव्यांग हैं तो प्रकार  </label>
                                            <asp:DropDownList ID="ddlDisAbilityType" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="V">दृष्टिबाधित</asp:ListItem>
                                                <asp:ListItem Value="O">अस्थिबाधित</asp:ListItem>
                                                <asp:ListItem Value="H">श्रवणबाधित</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">यदि दिव्यांग हैं तो प्रमाण-पत्र क्रमांक </label>
                                            <asp:TextBox ID="txtDisAbilityNo" runat="server" ToolTip="Mother Name" CssClass="form-control" MaxLength="25"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtMotherName" Display="Dynamic"
                                                ErrorMessage="Please enter Mother Name" ValidationGroup="G" ForeColor="Red" />
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                    <div class="form-group">
                                        <label class="" for="FatherName">&nbsp;</label>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    क्या आपका परीक्षा परिणाम प्रतीक्षा मे है यदि हां  परिणाम प्रतीक्षित है , मार्कशीट अटैचमेंट की आवश्यकता नहीं है                                         
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:RadioButton ID="RadioButton1" runat="server" Text="Yes" Value="Yes" GroupName="chkYesMatt" />

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:RadioButton ID="RadioButton2" runat="server" Text="No" Value="No" GroupName="chkYesMatt" />

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="FatherName">&nbsp;</label>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    क्या आप मध्यप्रदेश के मूलनिवासी है ?                                          
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:RadioButton ID="rbnNative1" runat="server" Text="Yes" GroupName="native" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:RadioButton ID="rbnNative2" runat="server" Text="No" GroupName="native" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="row" id="div2" runat="server">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">आवेदक का पता 
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="MotherName">मकान नंबर </label>
                                        <asp:TextBox ID="txtHouse" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtHouse" Display="Dynamic"
                                            ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">कॉलोनी  </label>
                                        <asp:TextBox ID="txtColony" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtColony" Display="Dynamic"
                                            ErrorMessage="Please enter Colony." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">शहर/ग्राम </label>
                                        <asp:TextBox ID="txtCity" runat="server" ToolTip="City" CssClass="form-control" MaxLength="100" onkeypress="return Alphanumericspecialchar(event);"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" Display="Dynamic"
                                            ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">ब्लॉक </label>
                                        <asp:TextBox ID="txtBlock" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBlock" Display="Dynamic"
                                            ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>

                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            जिला</label>
                                        <asp:DropDownList ID="ddlAddDistrict" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlAddDistrict" Display="Dynamic"
                                            ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">पिन कोड </label>
                                        <asp:TextBox ID="txtPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPinCode" Display="Dynamic"
                                            ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>

                                <div class="clearfix">
                                </div>

                            </div>
                        </div>


                    </div>

                    <div class="row" id="div4" runat="server">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">जाति प्रमाण पत्र 
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="MotherName">प्रवेश परीक्षा हेतु जिला चुने  </label>
                                        <asp:DropDownList ID="ddlRegDistrict" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlRegDistrict" InitialValue="0" Display="Dynamic"
                                            ErrorMessage="Please select District." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtCertIssueDate">प्रमाण पत्र जारी दिनांक (DD/MM/YYYY) </label>
                                        <asp:TextBox ID="txtCertIssueDate" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtCastCertNo">अनुसूचित जाति/ जनजाति/ अन्य पिछड़ा वर्ग का निर्धारित प्रपत्र में स्थायी/ अस्थाई, एस.डी.ओ. या अन्य सक्षम अधिकारी द्वारा जारी प्रमाण पत्र क्र. </label>
                                        <asp:TextBox ID="txtCastCertNo" runat="server" ToolTip="Caste Certificate No" CssClass="form-control" MaxLength="40"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="clearfix">
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="row" id="div3" runat="server">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">छात्र / छात्रा द्वारा पूर्व कक्षा परीक्षा उत्तीर्ण करने का विवरण 
                                </h4>
                            </div>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                                <table class="table tab;e-border">
                                    <tr class="table-dark">
                                        <th style="width: 110px">विद्यालय का नाम *</th>
                                        <th style="width: 20px">विद्यालय का प्रकार </th>
                                        <th style="width: 50px">जिले का नाम</th>
                                        <th style="width: 5px; display: none">विकास खण्ड</th>
                                        <th style="width: 5px">कक्षा</th>
                                        <th style="width: 5px">उत्तीर्ण वर्ष</th>
                                        <th style="width: 75px">प्राप्तांक</th>
                                        <th style="width: 50px">पूर्णांक</th>
                                        <th style="width: 20px">परिणाम प्रतिशत(%)</th>
                                        <th style="width: 20px">परिणाम ग्रेड</th>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtPreviousSchoolName" runat="server" ToolTip="Father Full Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtPreviousSchoolName" Display="Dynamic"
                                                    ErrorMessage="Please enter Previous School Name" ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </td>

                                        <td>
                                            <asp:DropDownList ID="ddlSchoolType" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="P">Private</asp:ListItem>
                                                <asp:ListItem Value="G">Govt</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>

                                        <td>
                                            <asp:DropDownList ID="ddlPreviousSchoolDistrict" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="display: none">
                                            <asp:DropDownList ID="ddlSchoolVikaskhand" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlScClass" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                <asp:ListItem Value="8">8</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>

                                            <asp:DropDownList ID="ddlPassYear" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="2022">2022</asp:ListItem>
                                                <asp:ListItem Value="2021">2021</asp:ListItem>
                                                <asp:ListItem Value="2020">2020</asp:ListItem>
                                                <asp:ListItem Value="2019">2019</asp:ListItem>
                                                <asp:ListItem Value="2018">2018</asp:ListItem>
                                                <asp:ListItem Value="2017">2017</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMarksObtain" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="6" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox></td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtMarksObtain" Display="Dynamic"
                                            ErrorMessage="Please enter Marks Obtain" ValidationGroup="G" ForeColor="Red" />
                                        <td>
                                            <asp:TextBox ID="txtTotalMarks" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="6" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox></td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtTotalMarks" Display="Dynamic"
                                            ErrorMessage="Please enter Total Marks" ValidationGroup="G" ForeColor="Red" />
                                        <td>
                                            <asp:TextBox ID="txtMarksPercentage" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="6" ReadOnly="true" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="txtGrade" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="100" ReadOnly="true"></asp:TextBox></td>
                                    </tr>

                                </table>

                            </div>
                            <div class="clearfix">
                            </div>

                        </div>
                    </div>

                    <div class="row" id="div5" runat="server">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">दस्तावेज़ विवरण 
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <table class="table table-striped table-bordered">
                                            <tr class="table-dark">
                                                <td>SL.</td>
                                                <td>Document Detail</td>
                                                <td>Select File</td>
                                                <td style="white-space: nowrap">Upload file</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr id="tdMarksheet" runat="server">
                                                <td>1.</td>
                                                <td>
                                                    <label class="manadatory" for="MotherName">पूर्व कक्षा की अंक सूची स्कैन कापी संलग्न ( केवल .jpg फ़ाइल अधिकतम 200 केबी । ) यदि परिणाम प्रतीक्षित मार्कशीट अटैचमेंट की आवश्यकता नहीं है  </label>
                                                </td>
                                                <td>
                                                    <input class="camera" id="File5MSh" name="Photoupload" type="file" runat="server" /></td>
                                                <td>
                                                    <asp:Button ID="Button5MSh" type="submit" Text="Upload" runat="server" OnClick="Button5MSh_Click"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:Panel ID="Panel5MSh" Visible="False" runat="server">
                                                        <asp:Label ID="Label5MSh" runat="server"></asp:Label>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr id="tdDisAbility" runat="server">
                                                <td>2.</td>
                                                <td>विकलांगता प्रमाणपत्र की स्कैन कापी संलग्न ( केवल .jpg फ़ाइल अधिकतम 200 केबी । ) </td>
                                                <td>
                                                    <input class="camera" id="FileDisAbility" name="Photoupload" type="file" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="ButtonDisAbility" type="submit" Text="Upload" runat="server" OnClick="ButtonDisAbility_Click"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:Panel ID="PanelDisAbility" Visible="False" runat="server">
                                                        <asp:Label ID="LabelDisAbility" runat="server"></asp:Label>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr id="tdCaste" runat="server">
                                                <td>3.</td>
                                                <td>जाति प्रमाणपत्र की स्कैन कापी संलग्न ( केवल .jpg फ़ाइल अधिकतम 200 केबी । ) </td>
                                                <td>
                                                    <input class="camera" id="FileCaste" name="Photoupload" type="file" runat="server" />

                                                </td>
                                                <td>
                                                    <asp:Button ID="ButtonCaste" type="submit" Text="Upload" runat="server" OnClick="ButtonCaste_Click"></asp:Button></td>
                                                <td>
                                                    <asp:Panel ID="PanelCaste" Visible="False" runat="server">
                                                        <asp:Label ID="LabelCaste" runat="server"></asp:Label>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4.</td>
                                                <td>मध्य प्रदेश के मूल निवासी प्रमाणपत्र की स्कैन कापी संलग्न ( केवल .jpg फ़ाइल अधिकतम 200 केबी । ) </td>
                                                <td>
                                                    <input class="camera" id="FileNativeCert" name="Photoupload" type="file" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="ButtonNativeCert" type="submit" Text="Upload" runat="server" OnClick="ButtonNativeCert_Click"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:Panel ID="PanelNativeCert" Visible="False" runat="server">
                                                        <asp:Label ID="LabelNativeCert" runat="server"></asp:Label>
                                                    </asp:Panel>
                                                </td>
                                            </tr>

                                        </table>

                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="row" id="div6" runat="server">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">घोषणा 
                                </h4>
                            </div>

                            <div class="box-body box-body-open" id="divDeclaration">
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="text-danger text-danger-green mt0">
                                        <p class="text-justify">
                                            &nbsp;&nbsp;&nbsp; 
                                        <asp:CheckBox ID="chkDecl" runat="server" OnClick="GetApplicable();" />
                                            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  मैं घोषणा करती हूँ की मेरे द्वारा प्रवेश नियम पुस्तिका पढ़ ली गई है तथा तदानुसार आवेदन पत्र में मेरे द्वारा भरी गई जानकारी तथा दस्तावेजो की छाया प्रति पूर्णतः सत्य है यदि कोई भी दस्तावेज/जानकारी गलत या अपूर्ण पायी जाती है तो प्रवेश स्वतः ही निरस्त हो जायेगा ।

                                        </p>
                                        <p>प्रवेश पत्र हेतु निर्देश :-प्रवेश पत्र आवेदन पत्र की रसीद पर दिए गए आवेदन क्रमांक के माध्यम से मध्यप्रदेश  राज्‍य मुक्‍त स्‍कूल शिक्षा बोर्ड पोर्टल से डाउनलोड किये जा सकेंगे |</p>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 box-container" id="divBtn">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <asp:Button ID="btnHome" runat="server" CausesValidation="True" Text="Home" ToolTip="Home page"
                                    CssClass="btn btn-info" PostBackSection="" OnClick="btnHome_Click" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                    CssClass="btn btn-danger" PostBackSection=""
                                    Text="Cancel" />
                                <asp:Button ID="btnSubMain" runat="server" CausesValidation="True" ToolTip="Proceed to Payment"
                                    CssClass="btn btn-success" Text="Submit" ValidationGroup="G" OnClick="btnSubMain_Click" />
                            </div>
                        </div>

                    </div>
                </asp:Panel>
            </div>
        </div>

        <asp:HiddenField ID="hdnImage" runat="server" />
        <asp:HiddenField ID="hdnFile5MSh" runat="server" />
        <asp:HiddenField ID="hdnFileDisAbility" runat="server" />
        <asp:HiddenField ID="hdnFileCaste" runat="server" />
        <asp:HiddenField ID="hdnFileNativeCert" runat="server" />


        <asp:HiddenField ID="hdnImageName" runat="server" />
        <asp:HiddenField ID="hdnFile5MShName" runat="server" />
        <asp:HiddenField ID="hdnFileDisAbilityName" runat="server" />
        <asp:HiddenField ID="hdnFileCasteName" runat="server" />
        <asp:HiddenField ID="hdnFileNativeCertName" runat="server" />

        <asp:HiddenField ID="hdnClass" runat="server" />
        <asp:HiddenField ID="hdnBirthDate" runat="server" />

        <asp:HiddenField ID="hdnSamagraFamilyID" runat="server" />
        <asp:HiddenField ID="hdnSamagraMemberID" runat="server" />
        <asp:HiddenField ID="hdnCardHolderName" runat="server" />
        <asp:HiddenField ID="hdnUniqueCode" runat="server" />

    </form>
</body>
</html>
