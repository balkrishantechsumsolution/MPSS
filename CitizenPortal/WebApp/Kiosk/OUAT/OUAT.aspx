<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="OUAT.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.OUAT" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/PhysicalTestDeclaration.ascx" TagPrefix="uc1" TagName="PhysicalTestDeclaration" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>
<%@ Register Src="~/WebApp/Control/OUATUndertaking.ascx" TagPrefix="uc1" TagName="OUATUndertaking" %>
<%@ Register Src="~/WebApp/Control/OUATDeclaration.ascx" TagPrefix="uc1" TagName="OUATDeclaration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/OUAT/OUAT.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#subdiv_vsble').hide();
            ///$('#divInfo').hide();
            $('#cndtemrd').hide();
            $('#exsrvmn').hide();
            $('#sptprtptd').hide();
            $('#winmdl').hide();
            $('#ncccrtfcte').hide();
            $('#hvngdl').hide();
            $('#hvngcrmnlcse').hide();
            $('#plyntnl').hide();
            $('#divCirmeCase').hide();
            $('#ddlAppPref').hide();
            $('#divEmplyeeCase').hide();
            $('#divNRIDetails').hide();
            $('#divAgro').hide();
            $('#divHSc2').hide();
            $('#chkPreference').prop('disabled', true);
        });

        var bool = 0;
        function ckhInfo() {
            if (bool == 1) {
                bool = 0;
                $('#divInfo').slideDown(500);
            }
            else {
                bool = 1;
                $('#divInfo').slideUp(500);
            }
        }

        function fuShowHideDiv(divID, isTrue) {
            debugger;
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID).show(500);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(500);
            }
        }

        function fnClose() {
            $('#divLogin').hide();
        }
        function fnShowLogin() {
            $('#divLogin').show();
        }

        $(document).ready(function () {
            //debugger;
            $(function () {
                $("#Photo").change(function () {
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = imageIsLoaded;
                        reader.readAsDataURL(this.files[0]);
                    }
                });
            });

            function imageIsLoaded(e) {
                $('#imgPhoto').attr('src', e.target.result);
            };
            m_ServiceID = $('#HFServiceID').val();
        });



        $(document).ready(function () { $("#ddlSearch").prop('disabled', true); $("#divNonAadhar").hide(); });
    </script>
    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {

            var t_Lang = p_Lang;

            if (p_Lang == null) t_Lang = document.getElementById('HFCurrentLang').value;

            //if (document.getElementById('HFCurrentLang').value != "") t_Lang = document.getElementById('HFCurrentLang').value;

            if (t_Lang == "1") t_Lang = "2";
            else t_Lang = "1";


            document.getElementById('HFCurrentLang').value = t_Lang;
            //alert(p_Lang);
            //alert(document.getElementById('HFCurrentLang').value);
            //window.location.reload();
            document.forms[0].submit();
            return true;
        }
    </script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 10px !important;
        }

        .othrinfohd {
            background-color: #ececec !important;
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

        #instn p {
            line-height: 20px;
            color: #777;
            display: flex;
        }

        #instn .mleft10 {
            margin-left: 10px !important;
        }

        #instn li {
            color: #777;
            display: flex;
        }

        .msgBox {
            width: 600px !important;
            overflow: auto;
            height: 300px;
        }

        .msgBoxContent {
            width: 468px !important;
        }

        .msgError {
            background-color: yellow;
        }

        .div.msgBoxImage {
            margin: 5px 5px 0 5px;
            display: inline-block;
            float: left;
            height: 75px;
            width: 75px;
        }

        #divOtherInfo label {
            display: inline !important;
        }

        p {
            color: #000000 !important;
            font-family: Arial !important;
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

        #progressbar12 {
            width: 300px;
            height: 14px;
            background-color: #00aeff;
            filter: progid:DXImageTransform.Microsoft.gradient(GradientType=1,startColorstr=#00aeff, endColorstr=#ff0000);
            background-image: -moz-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -webkit-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -o-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -ms-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -webkit-gradient(linear, left bottom, right bottom, color-stop(40%,#00aeff), color-stop(80%,#ff0000),color-stop(100%,#2fff00));
        }

        .text-danger {
            color: maroon !important;
            font-size: 20px;
            font-family: Arial;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">

    <div id="progressbar" class="modalBackground" runat="server" clientidmode="Static" style="height: 700%; border: 1px solid #ccc; display: none;">
        <div style="z-index: 105; left: 40%; position: absolute; top: 70%;" class="text-center">
            <img id="imgloader" alt="" runat="server" src="/WebApp/Kiosk/Images/loading.gif" style="height: 200px;" />
            <p class="text-danger">
                Please do not refresh or click back button<br />
                as Request is Processing....
            </p>
        </div>
    </div>

    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 311px;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>

                <div class="row" id="divCitizenProfile">

                    <input type="button" id="btnLang1" style="display: none" class="btn btn-success" runat="server" onclick="javascript: return ChangeLanguage();" />

                    <div>
                        <div class="clearfix">
                            <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                            <h2 class="form-heading">
                                <span class="col-lg-10 p0"><i class="fa fa-pencil-square-o"></i>Application Form For Admission into Undergraduate Course 2016-17 <%--{{resourcesData.lblOISFTitle}}--%>
                                </span>
                                <span class="col-lg-2 p0 text-right" style="font-size: 15px;">Language : 
                                    <input type="button" id="btnLang" class="btn-link" runat="server" onclick="javascript: return ChangeLanguage();" /><i class="fa fa-hand-o-up"></i></span>
                                <span class="clearfix"></span>
                            </h2>
                        </div>
                        <div class="row">
                            <div class="col-md-12 box-container" id="">
                                <div class="box-heading">
                                    <h4 class="box-title">Instruction to Fill the Form 
                               
                                <span class="col-md-6 pull-right" style="font-style: normal; cursor: pointer; font-size: 12px; text-align: right; padding: 0;" onclick="ckhInfo();">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 15px;" title="Information">&nbsp;&nbsp;</i>Help&nbsp;&nbsp;<i class="fa fa-hand-o-up"></i></span><span class="clearfix"></span>
                                    </h4>
                                </div>
                                <uc1:ServiceInformation runat="server" ID="ServiceInformation" />

                            </div>
                        </div>

                        <div class="row">
                        </div>
                        <div class="row">

                            <div id="" class="col-md-9 p0">
                                <div class="col-md-12 box-container" style="display: none">
                                    <div class="box-heading">
                                        <h4 class="box-title">Choice of Preference for Application 
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlApplication">
                                                    <%--First Peference--%>{{resourcesData.lblFirstPreference}}
                                                </label>
                                                <select name="ddlApplication" id="ddlApplication" onchange="AppType();" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Application Type.">
                                                    <option value="0">Select Application Type</option>
                                                    <option value="101">IRB - Indian Reserve Battalion</option>
                                                    <option value="102">SSB - Special Security Battalion</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="" for="chkPreference">
                                                    <input type="checkbox" runat="server" id="chkPreference" onclick="javascript: PreferenceChoice(this.checked);" />
                                                    {{resourcesData.secondpreference}}
                                                </label>
                                                <select name="ddlAppPref" id="ddlAppPref" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Application Preference.">
                                                    <option value="0">Select Application Type</option>
                                                    <option value="101">IRB - Indian Reserve Battalion</option>
                                                    <option value="102">SSB - Special State Battalion</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="col-md-12 box-container">
                                    <div class="box-heading">
                                        <h4 class="box-title">{{resourcesData.appaadharno}}
                                        </h4>
                                    </div>
                                    <uc1:SearchRecord runat="server" ID="SearchRecord" />
                                </div>
                                <div id="divDetails" class="col-md-12 box-container">
                                    <div class="box-heading" id="Div4">
                                        <h4 class="box-title">{{resourcesData.applicantDetails}}
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="firstname">
                                                    {{resourcesData.nameoftheCandidate}}</label>
                                                <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="40" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlCenter">
                                                    {{resourcesData.examcenter}}</label>
                                                <select name="ddlCenter" id="ddlCenter" class="form-control" data-val="true" data-val-number="ExamCenter" data-val-required="Please select Exam Center.">
                                                    <option value="0">Select Exam Center</option>
                                                </select>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="FatherName">
                                                    {{resourcesData.fatherName}}</label>
                                                <input id="FatherName" class="form-control" placeholder="Father's Name" name="Father Name" type="text" value="" autofocus="" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="MotherName">
                                                    {{resourcesData.motherName}}</label>
                                                <input id="MotherName" class="form-control" placeholder="Mother's Name" name="Mother Name" type="text" value="" autofocus="" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlEducation">
                                                    {{resourcesData.selectEducation}}</label>
                                                <select name="ddlEducation" id="ddlEducation" class="form-control" data-val="true" data-val-number="Education" data-val-required="Please select Education.">
                                                    <option value="0">Select Education Passed</option>
                                                    <option value="HSC">High School Certificate (10)</option>
                                                    <option value="HSCII">Higher Secondary Education (Sc.+2)</option>
                                                    <option value="AGRO">Diploma in Agro</option>
                                                </select>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="DOB">
                                                    {{resourcesData.dateofBirth}} <span style="font-size: 11px;">{{resourcesData.AsperHSCCertificate}}</span></label>
                                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="12" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 pright0">

                                            <div class="form-group">
                                                <label for="Age">
                                                    {{resourcesData.ageason01012016}}</label>
                                                <div class="col-xs-4 pleft0 pright0">
                                                    <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" value="" maxlength="3" autofocus="" readonly="readonly" />
                                                </div>
                                                <div class="col-xs-4 pleft0 pright0">
                                                    <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" value="" maxlength="3" autofocus="" readonly="readonly" />
                                                </div>
                                                <div class="col-xs-4 pleft0 ">
                                                    <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" value="" maxlength="3" autofocus="" readonly="readonly" />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlGender">
                                                    {{resourcesData.lblAppGender}}</label>
                                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                                    <option value="0">--Select Gender--</option>
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                    <option value="T">Transgender</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="MobileNo">
                                                    {{resourcesData.religion}}</label>

                                                <select class="form-control" data-val="true" data-val-number="Religion" data-val-required="Please select your Category" id="religion" name="Religion">
                                                    <option value="Select Religion">Select</option>
                                                    <option value="Hndu">Hindu</option>
                                                    <option value="Mslm">Islam</option>
                                                    <option value="Jnsm">Jain</option>
                                                    <option value="Skhsm">Sikh</option>
                                                    <option value="Crstn">Christian</option>
                                                    <option value="Budhist">Budhist</option>
                                                    <option value="Othr">Other's</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="category">
                                                    {{resourcesData.category}}</label>
                                                <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="category" name="Category">
                                                    <option value="Select Category">Select</option>
                                                    <option value="SC">SC</option>
                                                    <option value="ST">ST</option>
                                                    <option value="SEBC">SEBC</option>
                                                    <option value="UR">UR</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="txtTongue">
                                                    {{resourcesData.motherTongue}}</label>
                                                <input id="txtTongue" class="form-control inputbox_bluebdr" name="txtTongue" placeholder="Mother Tongue" type="text" value="" autocomplete="off" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="nationality">
                                                    {{resourcesData.nationality}}</label>
                                                <select class="form-control" data-val="true" data-val-number="Nationality" id="nationality" name="Nationality">

                                                    <option value="Indian">Indian</option>
                                                    <option value="NRI">NRI</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="MobileNo">
                                                    {{resourcesData.mobileno}}</label><%--onblur="return MobileNoValidation();"--%>
                                                <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event); " type="text" value="" autocomplete="off" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="" for="phoneno">
                                                    {{resourcesData.alternatemobile}} <%--<span style="font-size: 11px;">{{resourcesData.withSTDCode}}</span>--%></label>
                                                <input id="phoneno" class="form-control" placeholder="Alternate Mobile Number" name="Alternate Mobile Number" value="" maxlength="10" onkeypress="return isNumberKey(event);" autofocus="" />

                                                <div class="col-xs-4 pleft0 pright1" style="display: none;">
                                                    <input id="stdcode" class="form-control" placeholder="STD Code" name="Std" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />

                                                    <div class="col-xs-12 pright0 pleft0">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="EmailID">
                                                    {{resourcesData.emailID}}</label>
                                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" autofocus="" style="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12" style="display: none">
                                            <p class="ptop10"><i class="fa fa-info-circle pright5" style="color: #000;"></i>SC,ST SEBC candidates should attach self attested copy of respective Caste Certificate.<span style="color: red;">*</span></p>

                                        </div>

                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>

                            <div id="" class="col-md-3 p0">
                                <div id="divHelp" class="col-md-12 box-container" style="display: none;">
                                    <div class="box-heading">
                                        <h4 class="box-title manadatory">Help Manuals 
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                                            <label class="btn-link text-left"><i class="fa fa-hand-o-up"></i><a href="../../../g2c/Downloads/Video/PlayVideo.html" target="_blank">Video - How to fill the form</a></label>
                                            <label class="btn-link text-left"><i class="fa fa-hand-o-up"></i><a href="../../../g2c/Downloads/PDF/ConstablesRecruitment.pdf" target="_blank">Read advertisement / Notification</a></label>
                                            <label class="btn-link text-left"><i class="fa fa-hand-o-up"></i><a href="../../../g2c/Downloads/PDF/ResizeImage.pdf" target="_blank">How to check and resize image</a></label>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                                <div id="divPhoto" class="col-md-12 box-container">
                                    <div class="box-heading">
                                        <h4 class="box-title manadatory">{{resourcesData.applicantPhotograph}}
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open p0">
                                        <div class="col-lg-12">
                                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                                            <input class="camera" id="File1" name="Photoupload" type="file" />
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                                <div id="divSign" class="col-md-12 box-container">
                                    <div class="box-heading">
                                        <h4 class="box-title manadatory">{{resourcesData.applicantSignature}}
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open p0">
                                        <div class="col-lg-12">
                                            <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
                                            <input class="camera" id="File2" name="Photoupload" type="file" />
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="divAddress" class="row">
                            <div class="col-md-6 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">{{resourcesData.permanentAddress}}
                                    </h4>
                                </div>

                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="AddressLine1">
                                                    {{resourcesData.addressLine1}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address1$AddressLine1" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">
                                                    {{resourcesData.addressLine2}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address1$AddressLine2" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="RoadStreetName">
                                                    {{resourcesData.roadStreetName}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address1$RoadStreetName" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="LandMark">
                                                    {{resourcesData.landmark}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address1$LandMark" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="Locality">
                                                    {{resourcesData.locality}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address1$Locality" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">
                                                    {{resourcesData.state}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address1$ddlState" id="PddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                </select>
                                                <input id="txtState" class="form-control" placeholder="Enter State Name" name="txtState" type="text" value=""
                                                    autofocus runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.district}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address1$ddlDistrict" id="PddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                    <option value="0">Select District</option>
                                                </select>
                                                <input id="txtDistrict" class="form-control" placeholder="Enter District Name" name="txtDistrict" type="text" value=""
                                                    autofocus runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlTaluka">
                                                    {{resourcesData.blockTaluka}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address1$ddlTaluka" id="PddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                                    <option value="0">Select Block</option>
                                                </select>
                                                <input id="txtBlock" class="form-control" placeholder="Enter Block Name" name="txtBlock" type="text" value=""
                                                    autofocus runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory text-nowrap" for="ddlVillage">
                                                    {{resourcesData.panchayatVillageCity}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address1$ddlVillage" id="PddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                                    <option value="0">Select Panchayat</option>
                                                </select>
                                                <input id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" name="txtPanchayat" type="text" value=""
                                                    autofocus runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="PIN">
                                                    {{resourcesData.pincode}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address1$PinCode" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">{{resourcesData.presentAddress}} <span style="font-size: 13px; padding-right: 0">{{resourcesData.forcorrespondence}}</span>
                                        <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                                            <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="javascript: fnCopyAddress(this.checked);" />{{resourcesData.sameasPermanentAddress}}</span><span class="clearfix">
                                            </span>
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="AddressLine1">
                                                    {{resourcesData.addressLine1}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address2$AddressLine1" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">
                                                    {{resourcesData.addressLine2}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address2$AddressLine2" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="RoadStreetName">
                                                    {{resourcesData.roadStreetName}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address2$RoadStreetName" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="LandMark">
                                                    {{resourcesData.landmark}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address2$LandMark" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="Locality">
                                                    {{resourcesData.locality}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address2$Locality" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="40" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">
                                                    {{resourcesData.state}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address2$ddlState" id="CddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.district}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address2$ddlDistrict" id="CddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                    <option value="0">Select District</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlTaluka">
                                                    {{resourcesData.blockTaluka}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address2$ddlTaluka" id="CddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                                    <option value="0">Select Block</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory text-nowrap" for="ddlVillage">
                                                    {{resourcesData.panchayatVillageCity}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address2$ddlVillage" id="CddlVillage" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select panchayat">
                                                    <option value="0">Select Panchayat</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="PIN">
                                                    {{resourcesData.pincode}}
                                                </label>
                                                <input name="ctl00$ContentPlaceHolder1$Address2$PinCode" type="text" id="CPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>

                                </div>
                                <div class="clearfix">
                                </div>
                            </div>

                        </div>
                        <div class="col-md-12 box-container pleft0 pright0" id="divHSC">
                            <div class="box-heading">
                                <h4 class="box-title">{{resourcesData.educationalQualificationofHSC}}
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                                    <div class="form-group" style="margin-bottom: 0">
                                        <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.boardRollNo}}</label>
                                                    </th>
                                                    <th style="width: 12%;">
                                                        <label class="manadatory">
                                                            {{resourcesData.state}}</label></th>
                                                    <th style="width: 15%">
                                                        <label class="manadatory">
                                                            {{resourcesData.nameoftheBoardCouncil}}</label></th>
                                                    <th style="width: 20%">
                                                        <label class="manadatory">
                                                            {{resourcesData.nameoftheExaminationPassed}}</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.yearofPassing}}</label>
                                                    </th>
                                                    <%--<th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.examCleared}}</label>
                                                    </th>--%>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.grade}}</label>
                                                    </th>
                                                    <th style="width: 100px;">
                                                        <label class="manadatory" id="lblTotalMarks">
                                                            {{resourcesData.totalMarks}}</label></th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.markSecured}}</label></th>
                                                    <th style="width: 75px;">
                                                        <label class="">
                                                            {{resourcesData.percentage}}</label></th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtBoardRollNo" class="form-control" placeholder="Roll of Board" name="txtBoardRollNo" type="text" value="" autofocus="" maxlength="30" />

                                                    </td>
                                                    <td>
                                                        <select name="EddlBoardState" id="EddlBoardState" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select State.">
                                                        </select></td>
                                                    <td>
                                                        <select name="ddlBoard" id="ddlBoard" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                            <option value="0">-Select-</option>
                                                        </select></td>
                                                    <td>
                                                        <input id="txtExmntnName" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" value="" autofocus="" maxlength="30" onkeypress="return ValidateAlpha(event);" />

                                                    </td>
                                                    <td>
                                                        <select name="txtPssngYr" id="txtPssngYr" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                            <option value="0">Select Year</option>
                                                            <option value="1998">1998</option>
                                                            <option value="1999">1999</option>
                                                            <option value="2000">2000</option>
                                                            <option value="2001">2001</option>
                                                            <option value="2002">2002</option>
                                                            <option value="2003">2003</option>
                                                            <option value="2004">2004</option>
                                                            <option value="2005">2005</option>
                                                            <option value="2006">2006</option>
                                                            <option value="2007">2007</option>
                                                            <option value="2008">2008</option>
                                                            <option value="2009">2009</option>
                                                            <option value="2010">2010</option>
                                                            <option value="2011">2011</option>
                                                            <option value="2012">2012</option>
                                                            <option value="2013">2013</option>
                                                            <option value="2014">2014</option>
                                                            <option value="2015">2015</option>
                                                            <option value="2016">2016</option>
                                                        </select>
                                                    </td>
                                                    <%--<td> 
                                                        <select name="ddlPasstype" id="ddlPasstype" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                            <option value="0">Select Passing Type</option>
                                                            <option value="101">First attempt</option>
                                                            <option value="102">Compartmental</option>
                                                            <option value="103">Suplimentary</option>
                                                        </select>                                                       
                                                    </td>--%>
                                                    <td>
                                                        <select name="ddlPctgeCalclte" id="ddlPctgeCalclte" class="form-control" data-val="" data-val-number="" data-val-required="Please Select.">
                                                            <option value="0">-Select-</option>
                                                            <option value="502">Percentage</option>
                                                            <option value="501">CGPA</option>

                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtPercentage" class="form-control" name="txtPrcntge" type="text" value="" readonly="true" maxlength="5" />
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="clearfix"></div>

                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                        <%-- Start Subject Details of Class 12 --%>
                        <div class="row" id="divHSc2" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">{{resourcesData.hSc2ouat}}
                                    </h4>
                                </div>
                                <div class="box-body box-body-open" style="">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px; margin-top: -15px">

                                        <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.boardRollNo}}</label>
                                                    </th>
                                                    <th style="width: 12%;">
                                                        <label class="manadatory">
                                                            {{resourcesData.state}}</label></th>
                                                    <th style="width: 15%">
                                                        <label class="manadatory">
                                                            {{resourcesData.nameoftheBoardCouncil}}</label></th>
                                                    <th style="width: 20%">
                                                        <label class="manadatory">
                                                            {{resourcesData.nameoftheExaminationPassed}}</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.yearofPassing}}</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.grade}}</label>
                                                    </th>
                                                    <th style="">
                                                        <label class="manadatory" id="lblTotalMarks2">
                                                            {{resourcesData.totalMarks}}</label></th>
                                                    <th style="">
                                                        <label class="manadatory">
                                                            {{resourcesData.markSecured}}</label></th>
                                                    <th style="width: 75px;">
                                                        <label class="">
                                                            {{resourcesData.percentage}}</label></th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtBoardRollNo2" class="form-control" placeholder="Roll of Board" name="txtBoardRollNo" type="text" value="" autofocus="" maxlength="30" onkeypress="return ValidateAlpha(event);" />

                                                    </td>
                                                    <td>
                                                        <select name="EddlBoardState" id="EddlBoardState2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select State.">
                                                        </select></td>
                                                    <td>
                                                        <select name="ddlBoard" id="ddlBoard2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                            <option value="0">-Select-</option>
                                                        </select></td>
                                                    <td>
                                                        <input id="txtExmntnName2" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" value="" autofocus="" maxlength="30" onkeypress="return ValidateAlpha(event);" />

                                                    </td>
                                                    <td>
                                                        <select name="txtPssngYr" id="txtPssngYr2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                            <option value="0">Select Year</option>
                                                            <option value="1998">1998</option>
                                                            <option value="1999">1999</option>
                                                            <option value="2000">2000</option>
                                                            <option value="2001">2001</option>
                                                            <option value="2002">2002</option>
                                                            <option value="2003">2003</option>
                                                            <option value="2004">2004</option>
                                                            <option value="2005">2005</option>
                                                            <option value="2006">2006</option>
                                                            <option value="2007">2007</option>
                                                            <option value="2008">2008</option>
                                                            <option value="2009">2009</option>
                                                            <option value="2010">2010</option>
                                                            <option value="2011">2011</option>
                                                            <option value="2012">2012</option>
                                                            <option value="2013">2013</option>
                                                            <option value="2014">2014</option>
                                                            <option value="2015">2015</option>
                                                            <option value="2016">2016</option>
                                                            <option value="2016">2016</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select name="ddlPctgeCalclte" id="ddlPctgeCalclte2" class="form-control" data-val="" data-val-number="" data-val-required="Please Select.">
                                                            <option value="0">-Select-</option>
                                                            <option value="502">Percentage</option>
                                                            <option value="501">CGPA</option>

                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input id="txtTotalMarks2" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtMarkSecure2" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtPercentage2" class="form-control" name="txtPrcntge" type="text" value="" readonly="true" maxlength="5" />
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </table><br />
                                        <div class="row">
                                            <div class="clearfix"></div>
                                            <div class="form-group error" id="divmore" runat="server" style="display: none;">
                                            </div>
                                            <div id="divHeirs">
                                            </div>
                                            <div class="form-group col-md-12" style="margin-bottom: 0 !important;">
                                                <table style="width: 100%; margin-bottom: 0;" class="table table-striped table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <th style="text-align: center;">
                                                                <label for="">
                                                                    Sl. No.</label></th>
                                                            <th style="text-align: center;">
                                                                <label class="manadatory" for="">
                                                                    Name of Subject</label>
                                                            </th>
                                                            <th style="text-align: center;">
                                                                <label for="">
                                                                    Total Mark</label>
                                                            </th>
                                                            <th style="text-align: center;">
                                                                <label for="">
                                                                    Marks Obtain</label>
                                                            </th>
                                                            <th style="text-align: center;">
                                                                <label class="" for="">
                                                                    Percentage</label>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td style="">1.</td>
                                                            <td style="">
                                                                <select name="ddlSubject" id="ddlSubjectPhysics" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select subject">

                                                                    <option value="Physics">Physics</option>

                                                                </select>
                                                            </td>
                                                            <td style="">
                                                                <input id="txtTotalPhysics" class="form-control" placeholder="Total Marks in Subject" name="txtTotalMarks2" type="text" value=""
                                                                    autofocus />
                                                            </td>
                                                            <td style="">
                                                                <input id="txtMarksObtainPhysics" class="form-control" placeholder="Marks Obtain in Subject" name="txtMarksObtain2" type="text" value=""
                                                                    autofocus maxlength="99" />
                                                            </td>
                                                            <td style="">
                                                                <input id="txtPercentagePhysics" class="form-control" placeholder="Percentage Obtain" name="txtPercentage2" type="text" value=""
                                                                    autofocus />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="">2.</td>
                                                            <td style="">
                                                                <select name="ddlSubject" id="ddlSubjectChemistry" class="form-control" data-val="true"  data-val-required="Please select subject">

                                                                    <option value="Chemistry">Chemistry</option>

                                                                </select>
                                                            </td>
                                                            <td style="">
                                                                <input id="txtTotalChemistry" class="form-control" placeholder="Total Marks in Subject" name="txtTotalMarks2" type="text" value=""
                                                                    autofocus />
                                                            </td>
                                                            <td style="">
                                                                <input id="txtMarksObtainChemistry" class="form-control" placeholder="Marks Obtain in Subject" name="txtMarksObtain2" type="text" value=""
                                                                    autofocus maxlength="99" />
                                                            </td>
                                                            <td style="">
                                                                <input id="txtPercentageChemistry" class="form-control" placeholder="Percentage Obtain" name="txtPercentage2" type="text" value=""
                                                                    autofocus />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="">3.</td>
                                                            <td style="">
                                                                <select name="ddlSubject" id="ddlSubjectMath" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                    <option value="Mathematics">Mathematics</option>
                                                                </select>
                                                            </td>
                                                            <td style="">
                                                                <input id="txtTotalMath" class="form-control" placeholder="Total Marks in Subject" name="txtTotalMarks2" type="text" value=""
                                                                    autofocus />
                                                            </td>
                                                            <td style="">
                                                                <input id="txtMarksObtainMath" class="form-control" placeholder="Marks Obtain in Subject" name="txtMarksObtain2" type="text" value=""
                                                                    autofocus maxlength="99" />
                                                            </td>
                                                            <td style="">
                                                                <input id="txtPercentageMath" class="form-control" placeholder="Percentage Obtain" name="txtPercentage2" type="text" value=""
                                                                    autofocus />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="">4.</td>
                                                            <td style="">
                                                                <select name="ddlSubject" id="ddlSubjectBio" class="form-control" data-val="true"  data-val-required="Please select subject">

                                                                    <option value="Biology">Biology</option>
                                                                </select>
                                                            </td>
                                                            <td style="">
                                                                <input id="txtTotalBio" class="form-control" placeholder="Total Marks in Subject" name="txtTotalMarks2" type="text" value=""
                                                                    autofocus />
                                                            </td>
                                                            <td style="">
                                                                <input id="txtMarksObtainBio" class="form-control" placeholder="Marks Obtain in Subject" name="txtMarksObtain2" type="text" value=""
                                                                    autofocus maxlength="99" />
                                                            </td>
                                                            <td style="">
                                                                <input id="txtPercentageBio" class="form-control" placeholder="Percentage Obtain" name="txtPercentage2" type="text" value=""
                                                                    autofocus />
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td style="">TOTAL</td>
                                                            <td style="">(marks obtain in Physic, Chemistry &amp; Biology/Mathematics)</td>
                                                            <td style="">&nbsp;</td>
                                                            <td style="">&nbsp;</td>
                                                            <td style="">&nbsp;</td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--End Subject Details of Class 12--%>

                        <%-- Start Subject Details of Class 12 --%>
                        <div class="row" id="divAgro" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">{{resourcesData.diplomaAgro}}
                                    </h4>
                                </div>
                                <div class="box-body box-body-open" style="">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px; margin-top: -15px">

                                        <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.boardRollNo}}</label>
                                                    </th>
                                                    <th style="width: 12%;">
                                                        <label class="manadatory">
                                                            {{resourcesData.state}}</label></th>
                                                    <th style="width: 15%">
                                                        <label class="manadatory">
                                                            {{resourcesData.nameoftheBoardCouncil}}</label></th>
                                                    <th style="width: 20%">
                                                        <label class="manadatory">
                                                            {{resourcesData.nameoftheExaminationPassed}}</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.yearofPassing}}</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.grade}}</label>
                                                    </th>
                                                    <th style="width: 100px;">
                                                        <label class="manadatory" id="lblTotalAgro">
                                                            {{resourcesData.totalMarks}}</label></th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.markSecured}}</label></th>
                                                    <th style="width: 75px;">
                                                        <label class="">
                                                            {{resourcesData.percentage}}</label></th>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtBoardRollNoAgro" class="form-control" placeholder="Roll of Board" name="txtBoardRollNo" type="text" value="" autofocus="" maxlength="30" />

                                                    </td>
                                                    <td>
                                                        <select name="EddlBoardState" id="EddlBoardStateAgro" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select State.">
                                                        </select></td>
                                                    <td>
                                                        <select name="ddlBoard" id="ddlBoardAgro" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                            <option value="0">-Select-</option>
                                                        </select></td>
                                                    <td>
                                                        <input id="txtExmntnNameAgro" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" value="" autofocus="" maxlength="30" onkeypress="return ValidateAlpha(event);" />

                                                    </td>
                                                    <td>
                                                        <select name="txtPssngYr" id="txtPssngYrAgro" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                            <option value="0">Select Year</option>
                                                            <option value="1998">1998</option>
                                                            <option value="1999">1999</option>
                                                            <option value="2000">2000</option>
                                                            <option value="2001">2001</option>
                                                            <option value="2002">2002</option>
                                                            <option value="2003">2003</option>
                                                            <option value="2004">2004</option>
                                                            <option value="2005">2005</option>
                                                            <option value="2006">2006</option>
                                                            <option value="2007">2007</option>
                                                            <option value="2008">2008</option>
                                                            <option value="2009">2009</option>
                                                            <option value="2010">2010</option>
                                                            <option value="2011">2011</option>
                                                            <option value="2012">2012</option>
                                                            <option value="2013">2013</option>
                                                            <option value="2014">2014</option>
                                                            <option value="2015">2015</option>
                                                            <option value="2016">2016</option>
                                                            <option value="2016">2016</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select name="ddlPctgeCalclte" id="ddlPctgeCalclteAgro" class="form-control" data-val="" data-val-number="" data-val-required="Please Select.">
                                                            <option value="0">-Select-</option>
                                                            <option value="502">Percentage</option>
                                                            <option value="501">CGPA</option>

                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input id="txtTotalMarksAgro" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtMarkSecureAgro" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtPercentageAgro" class="form-control" name="txtPrcntge" type="text" value="" readonly="true" maxlength="5" />
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="clearfix"></div>  
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--End Subject Details of Class 12--%>

                        <%-- Start of Sponsor Detail --%>
                        <div class="row" id="divNRIDetails">
                            <div id="" class="col-md-12 box-container">
                                <div class="box-heading" id="">
                                    <h4 class="box-title">{{resourcesData.nRISponsor}}
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtSponsor">
                                                {{resourcesData.sponsorperson}}</label>
                                            <input id="txtSponsor" class="form-control" name="txtSponsor" placeholder="Sponsoring Person Name" type="text" value="" autofocus="" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlSponsorRelation">
                                                {{resourcesData.sponsorrelation}}</label>
                                            <select name="ddlSponsorRelation" id="ddlSponsorRelation" class="form-control" data-val="true" data-val-number="Relation" data-val-required="Please select Relationship with Sponsoring Person">
                                                <option value="0">--Select--</option>
                                                <option value="101">Father</option>
                                                <option value="102">Mother</option>
                                                <option value="103">Uncle</option>
                                                <option value="104">Anuty</option>
                                                <option value="105">Brother</option>
                                                <option value="106">Sister</option>
                                                <option value="101">Grand-Father</option>
                                                <option value="102">Grand-Mother</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtSponsorEmail">
                                                {{resourcesData.sponsoremail}}</label>
                                            <input id="txtSponsorEmail" class="form-control" name="txtSponsorEmail" placeholder="Sponsoring Person Email ID" type="text" value="" autofocus="" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtSponsorMobile">
                                                {{resourcesData.sponsormobile}}</label>
                                            <input id="txtSponsorMobile" class="form-control" name="txtSponsorMobile" placeholder="Sponsoring Person Mobile No" type="text" value="" autofocus="" />

                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtNRIAddressIndia">
                                                {{resourcesData.nriadressIndia}}</label>
                                            <input id="txtNRIAddressIndia" class="form-control" name="txtNRIAddressIndia" placeholder="Complete NRI Permanent Address in India" type="text" value="" autofocus="" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtNRIAddressAbroad">
                                                {{resourcesData.nriaddressAbroad}}</label>
                                            <input id="txtNRIAddressAbroad" class="form-control" name="txtNRIAddressAbroad" placeholder="Complete NRI Present Address in Abroad" type="text" value="" autofocus="" />

                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <%--- End of Sponsor Detail ---%>

                        <div id="divOtherInfo" class="col-md-12 box-container pleft0 pright0">
                            <div class="box-heading">
                                <h4 class="box-title pleft0">{{resourcesData.otherInformation}}
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                    <div class="form-group">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">1.</span> {{resourcesData.reservedseat}}</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio2" id="Mrd" value="yes" onclick="return fuShowHideDiv('cndtemrd', 1);" />{{resourcesData.yes}}
                                            <label for="Mrd"></label>

                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio2" id="UnMrd" value="no" onclick="return fuShowHideDiv('cndtemrd', 0);" />
                                                    {{resourcesData.no}}
                                            <label for="UnMrd"></label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="cndtemrd" class="form-group">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.seatcategory}}</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-12 pleft0 pright0">
                                                    <select name="ddlSports" id="ddlReserved" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                        <option value="0">List of Reserved Category</option>
                                                        <option value="208">ICAR / VCI</option>
                                                        <option value="200">Schedule Caste</option>
                                                        <option value="201">Schedule Tribe</option>
                                                        <option value="202">Green Card Holder</option>
                                                        <option value="203">Physical Handicapped</option>
                                                        <option value="204">NRI</option>
                                                        <option value="205">Foregin</option>
                                                        <option value="206">Western Odisha</option>
                                                        <option value="207">OUAT Employee</option>
                                                        <option value="209">Kashmir Migrant</option>
                                                        <option value="210">VAW/LVW/Gardener/Fishery</option>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0 ">
                                                <p>
                                                    <span class="dplyflex manadatory"><span class="fom-Numbx">2.</span>
                                                        <%--Has the Candidate passed Odia as one of the subject in HSC Examination or an examination in Odia language equivalent to M.E. Standard recognised or conducted by the School and Mass Education Department of Odisha. (photo copy with self attestation should be enclosed)--%>
                                            {{resourcesData.section1}}
                                                    </span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio1" id="yes" value="yes" onclick="return fuShowHideDiv('subdiv_vsble', 1);" />
                                                    <label for="yes">{{resourcesData.yes}}</label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio1" id="no" value="no" onclick="return fuShowHideDiv('subdiv_vsble', 0);" />
                                                    <label for="no">{{resourcesData.no}}</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <div id="subdiv_vsble" class="form-group">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.noabilitytoOdialang}}</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-4 pleft0" style="white-space: nowrap;">
                                                    <input type="checkbox" name="readOdiya" id="readOdiya" />{{resourcesData.read}}
                                    <label for="checkbox"></label>

                                                </div>
                                                <div class="col-xs-4" style="white-space: nowrap;">
                                                    <input type="checkbox" name="writeOdiya" id="writeOdiya" />{{resourcesData.write}}
                                            <label for="checkbox"></label>

                                                </div>
                                                <div class="col-xs-4" style="white-space: nowrap;">
                                                    <input type="checkbox" name="spkOdiya" id="spkOdiya" />{{resourcesData.speak}}<label for="checkbox"></label>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.milsubject}}</p>
                                            </div>                                            
                                            <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pright0 pleft0">
                                                        <input id="txtMIL" class="form-control" name="txtMIL" type="text" value="" autofocus="" placeholder="MIL Subject" />
                                                    </div>
                                                </div>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>

                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">3.</span> {{resourcesData.section3}} <%--Whether the Candidate Ex-Serviceman?--%></span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">

                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio3" id="exarmyyes" value="yes" onclick="return fuShowHideDiv('exsrvmn', 1);" />

                                                    <label for="exarmyyes">{{resourcesData.yes}}</label>

                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio3" id="exarmyno" value="no" onclick="return fuShowHideDiv('exsrvmn', 0);" />

                                                    <label for="exarmyno">{{resourcesData.no}}</label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="clearfix"></div>
                                    <div id="exsrvmn">
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.section3a}}<%--Qualifying Service Rendered in Defence (Duration)--%></p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-6 pleft0">
                                                        {{resourcesData.from}}
                                        <input id="txtRndDrtinstrt" class="form-control" name="txtRndDrtinstrt" type="text" placeholder="DD/MM/YY" value="" autofocus="" />

                                                    </div>
                                                    <div class="col-xs-6 pleft0 pright0">
                                                        {{resourcesData.to}}
                                                <input id="txtRndDrtinend" class="form-control" name="txtRndDrtinend" type="text" placeholder="DD/MM/YY" value="" autofocus="" />

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.section3b}}<%--No.of service years--%></p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-5 pleft0 pright0">
                                                        <input id="SevsYear" class="form-control mtop0" placeholder="Year" name="SevsYear" value="" maxlength="3" readonly="readonly" />

                                                    </div>
                                                    <div class="col-xs-4  pright0">
                                                        <input id="SevsMonth" class="form-control mtop0" placeholder="Month" name="SevsMonth" value="" maxlength="3" readonly="readonly" />
                                                    </div>
                                                    <div class="col-xs-3  pright0">
                                                        <input id="SevsDay" class="form-control mtop0" placeholder="Day" name="SevsDay" value="" maxlength="3" readonly="readonly" />

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">4.</span> {{resourcesData.section4}}</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio4a" id="sptprsnYes" value="yes" onclick="return fuShowHideDiv('sptprtptd', 1);" />

                                                    <label for="exarmy">{{resourcesData.yes}}</label>

                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio4a" id="sptprsnNo" value="no" onclick="return fuShowHideDiv('sptprtptd', 0);" />

                                                    <label for="sptprsn">{{resourcesData.no}}</label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="clearfix"></div>

                                    <div id="sptprtptd">
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.section4a}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0 pright0">
                                                        <select name="ddlSports" id="ddlSports" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                            <option value="0">List of Sports</option>
                                                            <option value="200">Athletics</option>
                                                            <option value="201">Archery</option>
                                                            <option value="202">Badminton</option>
                                                            <option value="203">Basket Ball</option>
                                                            <option value="204">Body Building</option>
                                                            <option value="205">Boxing</option>
                                                            <option value="206">Cricket</option>
                                                            <option value="207">Cycling</option>
                                                            <option value="208">Equestrian</option>
                                                            <option value="209">Football</option>
                                                            <option value="210">Gymnastics</option>
                                                            <option value="211">Hockey</option>
                                                            <option value="212">Judo</option>
                                                            <option value="213">Kabaddi</option>
                                                            <option value="214">Karate Do</option>
                                                            <option value="215">Kayaking &amp; Canoeing</option>
                                                            <option value="216">Lawn Tennis</option>
                                                            <option value="217">Power Lifting</option>
                                                            <option value="218">Rowing</option>
                                                            <option value="219">Shooting</option>
                                                            <option value="220">Swimming</option>
                                                            <option value="221">Table Tennis</option>
                                                            <option value="222">Tae Kwon Do</option>
                                                            <option value="223">Volleyball</option>
                                                            <option value="224">Weight Lifting</option>
                                                            <option value="225">Wrestling</option>
                                                            <option value="999">Others</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.section4b}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0 pright0">
                                                        <input id="txtSportFedAssName" class="form-control" name="txtSportFedAssName" placeholder="Name of Sports Federation or Association Name" type="text" value="" autofocus="" />
                                                        <input id="txtOthrsport" class="form-control" name="txtOthrsport" type="text" value="" autofocus="" style="display: none;" />
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.section4c}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-6 pleft0">
                                                        <input type="radio" name="radio4c" id="wntavlrlxon" value="Yes" />
                                                        <label for="wntavlrlxon">{{resourcesData.yes}}</label>

                                                    </div>
                                                    <div class="col-xs-6">
                                                        <input type="radio" name="radio4c" id="dntavlrlxon" value="No" />

                                                        <label for="dntavlrlxon">{{resourcesData.no}}</label>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">5.</span>  {{resourcesData.section6}}<%--Whether the candidate possess NCC Certificate? If possess NCC Certificate--%></span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio6" id="HsCerfte" value="yes" onclick="return fuShowHideDiv('ncccrtfcte', 1);" />
                                                    <label for="HsCerfte">{{resourcesData.yes}}</label>

                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio6" id="NtHvgCerfte" value="no" onclick="return fuShowHideDiv('ncccrtfcte', 0);" />
                                                    <label for="NtHvgCerfte">{{resourcesData.no}}</label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="ncccrtfcte">
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.section6a}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-4 pleft0">
                                                        <input type="radio" name="radio6A" id="radio6AA" value="A Certificated" />
                                                        A
                                            <label for="ACrtfte"></label>

                                                    </div>
                                                    <div class="col-xs-4 pright0">
                                                        <input type="radio" name="radio6A" id="radio6AB" value="B Certificated" />
                                                        B
                                            <label for="BCrtfte"></label>

                                                    </div>
                                                    <div class="col-xs-4 pright0">
                                                        <input type="radio" name="radio6A" id="radio6AC" value="C Certificated" />
                                                        C
                                            <label for="CCrtfte"></label>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <%--Start Employee Detail --%>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">6.</span> {{resourcesData.ouatEmp}}</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio10" id="rdoEmpYes" value="yes" onclick="return fuShowHideDiv('divEmplyeeCase', 1);" />
                                                    <label for="CrmnlInvlv">{{resourcesData.yes}}</label>

                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio10" id="rdoEmpNo" value="no" onclick="return fuShowHideDiv('divEmplyeeCase', 0);" />

                                                    <label for="NtCrmnlInvlv">{{resourcesData.no}}</label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="divEmplyeeCase">
                                        <div class="form-group">

                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Name of the Employee<%--{{resourcesData.section8e}}--%></p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pright0 pleft0">
                                                        <input id="txtEmployeeName" class="form-control" name="txtEmployeeName" type="text" value="" autofocus="" placeholder="Name of the Employee" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.empcode}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pright0 pleft0">
                                                        <input id="txtEmpCode" class="form-control" name="txtEmpCode" type="text" value="" autofocus="" placeholder="Employee Code" title="Enter the employee code no." />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.designation}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pright0 pleft0">
                                                        <input id="txtDesignation" class="form-control" name="txtDesignation" type="text" value="" autofocus="" placeholder="Employee Designation" title="Enter the employee's designation" />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.statusservice}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pright0 pleft0">
                                                        <select name="ddlAcquitted" id="ddlServiceStatus" class="form-control" data-val="true" data-val-number="Service" data-val-required="Please select Status of Service">
                                                            <option value="0">--Select--</option>
                                                            <option value="101">Serving (Continuing)</option>
                                                            <option value="102">Retired</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.officeOUAT}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pright0 pleft0">
                                                        <input id="txtOffice" class="form-control" name="txtOffice" type="text" value="" autofocus="" placeholder="Office Name" title="Enter Name of the Office Serving / Last Served" />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.relationcandidate}}</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pright0 pleft0">
                                                        <select name="ddlEmpRelation" id="ddlEmpRelation" class="form-control" data-val="true" data-val-number="Relation" data-val-required="Please select Relation">
                                                            <option value="0">--Select--</option>
                                                            <option value="101">Father</option>
                                                            <option value="102">Mother</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <%---Start of EmployeeDetails----%>

                                            <%----End of EmployeeDetails-----%>
                                        </div>
                                    </div>
                                    <%----End of Employee Details-----%>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>

                    <%---Start of Declaration----%>
                    <div class="row">
                        <div class="col-md-12 box-container" id="">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">{{resourcesData.declaration}}
                                </h4>
                            </div>
                            <uc1:OUATDeclaration runat="server" ID="OUATDeclaration" ClientIDMode="Static"/>
                        </div>
                    </div>
                    <%----End of Declaration-----%>
                    <%---Start of Declaration----%>
                    <div class="row">
                        <div class="col-md-12 box-container" id="Div2">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">Undertaking<%--{{resourcesData.declaration2}}--%>
                                </h4>
                            </div>
                            <uc1:OUATUndertaking runat="server" ID="OUATUndertaking" ClientIDMode="Static"/>
                        </div>
                    </div>
                    <%----End of Declaration-----%>

                    <div id="divBtn" class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" title="Proceed to Upload Necessary Document" />
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                    CssClass="btn btn-danger" PostBackUrl=""
                                    Text="Cancel" />
                                <asp:Button ID="btnHome" runat="server"
                                    CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page"
                                    Text="Home" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" />
    <asp:HiddenField ID="HFb64Sign" runat="server" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />

</asp:Content>
