<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AgroFormB.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.AgroFormB" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/PhysicalTestDeclaration.ascx" TagPrefix="uc1" TagName="PhysicalTestDeclaration" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>
<%@ Register Src="~/WebApp/Control/OUATUndertaking.ascx" TagPrefix="uc1" TagName="OUATUndertaking" %>
<%@ Register Src="~/WebApp/Control/OUATDeclaration.ascx" TagPrefix="uc1" TagName="OUATDeclaration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.msgBox.js"></script>
    <link type="text/css" href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script type="text/javascript" src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script type="text/javascript" src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link type="text/css" href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script type="text/javascript" src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript" src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript" src="AgroFormB.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $("#divInstruction").hide();
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
                hidedive();
                $('#' + divID).hide(500);
            }
        }

        function fnLanguage(divID) {
            debugger;
            //alert(divID);
            if (divID == "divResi") {
                $('#divResi').show(500);
                $('#divLang').hide(500);
                $("#divInstruction").show(500);
            }
            if (divID == "divLang") {
                $('#divResi').hide(500);
                $('#divLang').show(500);
                $("#divInstruction").hide(500);
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
        function OUATDeclaration(chk) {

            debugger;

            if (chk) {
                if ($('#FirstName').val() == "" || $('#FatherName').val() == "") {
                    //alert("Please enter the all the mandatory fields.");
                    alert("Please enter your Full Name, Father Name  to continue.");
                    chkPhysical.checked = false;
                    return false;
                }

                if ($('#CddlDistrict').val() == 0) {
                    alert("Please select Present District to continue.");
                    chkPhysical.checked = false;
                    return false;
                }
                if ($('#ddlGender').val() != '0') {
                    if ($('#ddlGender').val() == "M") {
                        $('#lblGender').text("son of ");
                        $('#lblTitle').text("Mr.");
                    } else if ($('#ddlGender').val() == "F") {
                        $('#lblGender').text("daughter of ");
                        $('#lblTitle').text("Ms.");
                    } else { $('#lblGender').text("transgender of"); $('#lblTitle').text("Mr./Ms."); }
                }
                else {
                    alert("Please, select Gender");
                }

                var name = $('#FirstName').val();
                var fname = $('#FatherName').val();
                var place = $("#CddlDistrict option:selected").text();//$('#CddlDistrict').val();
                //alert(name);
                $("#lblName").text(name);
                $("#lblApplicant").text(name);
                $("#lblNameAadhaar").text(name);
                $("#lblPhsclFthrName").text(fname);
                //$("#lblPhsclDstName").text(fname);
                $("#cndidteplce").text(place);

                $('#btnSubmit').prop('disabled', false);


                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!

                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                var today = dd + '/' + mm + '/' + yyyy;
                $("#currntdte").text(today);
                $('#divDeclaration').show();
            }
            else {
                $("#lblName").text("");
                $("#lblNameAadhaar").text("");
                $("#lblApplicant").text("");
                $("#lblPhsclFthrName").text("");
                $("#lblPhsclDstName").text("");
                $('#btnSubmit').prop('disabled', true);
                $('#divDeclaration').hide();
            }
        }
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

        #CheckBoxList1 > tbody > tr > td {
            padding: 0px 20px 10px 10px !important;
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
                font-size: 30px;
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
            height: 656px;
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

        .auto-style1 {
            left: -1px;
            top: 0px;
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
                    <div>
                        <div class="clearfix">
                            <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                            <h2 class="form-heading">
                                <span class="col-lg-10 p0"><i class="fa fa-pencil-square-o"></i>Application Form For Admission Into OUAT- UG Course 2017-18 For Agro Polytechnic Students of OUAT  <%--{{resourcesData.lblOISFTitle}}--%>
                                </span>
                                <span class="col-lg-2 p0 text-right" style="font-size: 15px;">Language : 
                            <input type="button" id="btnLang" class="btn-link" runat="server" onclick="javascript: return ChangeLanguage();" /><i class="fa fa-hand-o-up"></i></span>
                                <span class="clearfix"></span>
                            </h2>
                        </div>
                        <div style="margin-top: -10px">
                            <h2 class="text-center">
                                <span style="font-family: 'Arial Rounded MT'; color: #ce6d07; font-size: 30px; font-weight: bold; text-shadow: 0px 1px 3px #727272;">FORM-'B'
                                </span><span class="clearfix"></span>
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

                            <div id="" class="col-md-9 p0">
                                <div class="col-md-12 box-container" style="">
                                    <div class="box-heading">
                                        <h4 class="box-title">Application Details 
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label for="txtAppID">
                                                    Application Number
                                                </label>
                                                <input class="form-control" name="ApplicationNo" type="text" value="KH1289600442" id="txtAppID" maxlength="12" readonly="true" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label for="chkPreference">
                                                    Entrance Roll No.
                                                </label>
                                                <input class="form-control" placeholder="" name="txtRollNo" type="text" value="" id="txtRollNo" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlApplication">
                                                    Transaction Number
                                                </label>
                                                <input class="form-control" placeholder="Unpaid" name="txtAadhaar" type="text" value="" id="txtTransNo" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlApplication">
                                                    Transaction Date
                                                </label>
                                                <input class="form-control" placeholder="Unpaid" name="txtTransDate" type="text" value="" id="txtTransDate" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlApplication">
                                                    Discipline
                                                </label>
                                                <input class="form-control" placeholder="Unpaid" name="txtTransDate" type="text" value="" id="txtDiscipline" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div id="divDetails" class="col-md-12 box-container">
                                    <div class="box-heading" id="Div4">
                                        <h4 class="box-title">{{resourcesData.applicantDetails}}
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="firstname">
                                                    {{resourcesData.nameoftheCandidate}}</label>
                                                <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="40" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="MotherName">
                                                    {{resourcesData.motherName}}</label>
                                                <input id="MotherName" class="form-control" placeholder="Mother's Name" name="Mother Name" type="text" value="" autofocus="" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="FatherName">
                                                    {{resourcesData.fatherName}}</label>
                                                <input id="FatherName" class="form-control" placeholder="Father's Name" name="Father Name" type="text" value="" autofocus="" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlApplication">
                                                    Aadhaar Number
                                                </label>
                                                <input class="form-control" placeholder="Enter 12 digit Aadhaar Number" name="txtAadhaar" type="text" value="" id="UID" maxlength="12" onkeypress="return isNumberKey(event);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="DOB">
                                                    {{resourcesData.dateofBirth}} <span style="font-size: 11px;">{{resourcesData.AsperHSCCertificate}}</span></label>
                                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="12" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 pright0">

                                            <div class="form-group">
                                                <label for="Age">
                                                    Age as on 31.12.2017</label>
                                                <div class="col-xs-4 pleft0 pright0">
                                                    <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" value="" maxlength="3" autofocus="" />
                                                </div>
                                                <div class="col-xs-4 pleft0 pright0">
                                                    <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" value="" maxlength="3" autofocus="" />
                                                </div>
                                                <div class="col-xs-4 pleft0 ">
                                                    <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" value="" maxlength="3" autofocus="" />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlGender">
                                                    {{resourcesData.lblAppGender}}</label>
                                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender">
                                                    <option value="0">--Select Gender--</option>
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                    <option value="T">Transgender</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="MobileNo">
                                                    {{resourcesData.religion}}</label>

                                                <select class="form-control" data-val="true" data-val-number="Religion" data-val-required="Please select your Category" id="religion" name="Religion">
                                                    <option value="Select Religion">Select</option>
                                                    <option value="Hindu">Hindu</option>
                                                    <option value="Islam">Islam</option>
                                                    <option value="Jain">Jain</option>
                                                    <option value="Sikh">Sikh</option>
                                                    <option value="Christian">Christian</option>
                                                    <option value="Budhist">Budhist</option>
                                                    <option value="Other">Other's</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="category">
                                                    {{resourcesData.category}}</label>
                                                <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="category" name="Category">
                                                    <option value="Select Category">--Select Category--</option>
                                                    <option value="SC">SC</option>
                                                    <option value="ST">ST</option>
                                                    <option value="General">General</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="txtTongue">
                                                    {{resourcesData.motherTongue}}</label>
                                                <select class="form-control" data-val="true" data-val-number="mothertongue" id="txtTongue" name="txtTongue">
                                                    <option value="0">--Select Mother Tongue--</option>
                                                    <option value="Assamese (Asamiya)">Assamese (Asamiya)</option>
                                                    <option value="Bengali (Bangla)">Bengali (Bangla)</option>
                                                    <option value="Bodo">Bodo</option>
                                                    <option value="Dogri">Dogri</option>
                                                    <option value="English">English</option>
                                                    <option value="Gujarati">Gujarati</option>
                                                    <option value="Hindi">Hindi</option>
                                                    <option value="Kannada">Kannada</option>
                                                    <option value="Kashmiri">Kashmiri</option>
                                                    <option value="Konkani">Konkani</option>
                                                    <option value="Maithili">Maithili</option>
                                                    <option value="Malayalam">Malayalam</option>
                                                    <option value="Marathi">Marathi</option>
                                                    <option value="Meitei (Manipuri)">Meitei (Manipuri)</option>
                                                    <option value="Nepali">Nepali</option>
                                                    <option value="Odia">Odia</option>
                                                    <option value="Punjabi">Punjabi</option>
                                                    <option value="Sanskrit">Sanskrit</option>
                                                    <option value="Santali">Santali</option>
                                                    <option value="Sindhi">Sindhi</option>
                                                    <option value="Tamil">Tamil</option>
                                                    <option value="Telugu">Telugu</option>
                                                    <option value="Urdu">Urdu</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                                <%--<input id="txtTongue" class="form-control inputbox_bluebdr" name="txtTongue" placeholder="Mother Tongue" type="text" value="" autocomplete="off" />--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="nationality">
                                                    {{resourcesData.nationality}}</label>
                                                <select class="form-control" data-val="true" data-val-number="Nationality" id="nationality" name="nationality">
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
                                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" />
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
                                            <input class="camera" id="File1" name="Photoupload" type="file" style="display: none;" />
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
                                            <input class="camera" id="File2" name="Photoupload" type="file" style="display: none;" />
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
                                                <input id="txtState" class="form-control" placeholder="Enter State Name" name="txtState" type="text" runat="server" />
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
                                                <input id="txtDistrict" class="form-control" placeholder="Enter District Name" name="txtDistrict" type="text" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="ddlTaluka">
                                                    {{resourcesData.blockTaluka}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address1$ddlTaluka" id="PddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                                    <option value="0">Select Block</option>
                                                </select>
                                                <input id="txtBlock" class="form-control" placeholder="Enter Block Name" name="txtBlock" type="text" vrunat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="text-nowrap" for="ddlVillage">
                                                    {{resourcesData.panchayatVillageCity}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address1$ddlVillage" id="PddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                                    <option value="0">Select Panchayat</option>
                                                </select>
                                                <input id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" name="txtPanchayat" type="text" runat="server" />
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
                                            <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="javascript: fnCopyAddress(this.checked);" />{{resourcesData.sameasPermanentAddress}}</span>
                                        <span class="clearfix"></span>
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
                                                <label for="ddlTaluka">
                                                    {{resourcesData.blockTaluka}}
                                                </label>
                                                <select name="ctl00$ContentPlaceHolder1$Address2$ddlTaluka" id="CddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                                    <option value="0">Select Block</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="text-nowrap" for="ddlVillage">
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
                                <h4 class="box-title">{{resourcesData.educationalQualificationofHSC}}</h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                                    <div class="form-group" style="margin-bottom: 0">
                                        <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 75px;">
                                                        <label class="">Roll No</label>
                                                    </th>
                                                    <th style="width: 300px;">
                                                        <label class="manadatory">
                                                            Name of the Board / Council, State</label></th>
                                                    <th style="width: 300px;">
                                                        <label class="manadatory">Name of the Examination Passed</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.yearofPassing}}</label>
                                                    </th>
                                                    <th style="width: 100px;">
                                                        <label class="manadatory">Grade Type</label>
                                                    </th>
                                                    <th style="width: 75px; white-space: normal;">
                                                        <label class="manadatory">Total Marks/CGPA</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">Marks/CGPA Secured</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label>
                                                            {{resourcesData.percentage}}</label>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtBoardRollNo" class="form-control" placeholder="Roll No" name="txtBoardRollNo" type="text" maxlength="15" />
                                                    </td>
                                                    <td>
                                                        <input id="txtBoardName" class="form-control" placeholder="Name of the Board / Council, State" name="txtBoardName" type="text" value="" autofocus="" maxlength="30" /></td>
                                                    <td>
                                                        <input id="txtExmntnName" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" value="" autofocus="" maxlength="30" />

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
                                                    <td>
                                                        <select name="ddlPctgeCalclte" id="ddlPctgeCalclte" class="form-control" data-val-required="Please Select.">
                                                            <option value="0">-Select-</option>
                                                            <option value="502">Percentage</option>
                                                            <option value="501">CGPA</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" maxlength="4" onkeypress="return isNumberKey(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtPercentage" class="form-control" name="txtPrcntge" type="text" readonly="true" maxlength="5" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>

                        <%-- Start Subject Details of Class 12 --%>

                        <div class="row" id="divHSc2" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">{{resourcesData.hSc2ouat}}</h4>
                                </div>
                                <div class="box-body box-body-open" style="padding-top: 15px; padding-bottom: 0px;">
                                    <div class="auto-style1" style="padding: 0px; margin-top: -15px;">
                                        <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 75px;">
                                                        <label class="">Roll No</label>
                                                    </th>
                                                    <th style="width: 300px;">
                                                        <label class="manadatory">
                                                            Name of the Board / Council, State</label></th>
                                                    <th style="width: 300px;">
                                                        <label class="manadatory">Name of the Examination Passed</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.yearofPassing}}</label>
                                                    </th>
                                                    <th style="width: 100px;">
                                                        <label class="manadatory">Grade Type</label>
                                                    </th>
                                                    <th style="width: 75px; white-space: normal;">
                                                        <label class="manadatory" id="lblTotalMarks2">Total Marks</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">Marks Secured</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="">{{resourcesData.percentage}}</label></th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtBoardRollNo2" class="form-control" placeholder="Roll No" name="txtBoardRollNo2" type="text" maxlength="15" />
                                                    </td>
                                                    <td>
                                                        <input id="txtBoardName2" class="form-control" placeholder="Name of the Board / Council, State" name="txtBoardName2" type="text" value="" autofocus="" maxlength="30" /></td>
                                                    <td>
                                                        <input id="txtExmntnName2" class="form-control" placeholder="Examination Name" name="txtExmntnName2" type="text" value="" autofocus="" maxlength="30" />
                                                    </td>
                                                    <td>
                                                        <select name="txtPssngYr2" id="txtPssngYr2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
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
                                                            <option value="2017">2017</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select name="ddlPctgeCalclte2" id="ddlPctgeCalclte2" class="form-control" data-val-required="Please Select.">
                                                            <option value="0">-Select-</option>
                                                            <option value="502">Percentage</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input id="txtTotalMarks2" class="form-control" placeholder="Total Marks" name="txtTotalMarks2" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtMarkSecure2" class="form-control" placeholder="Marks Secure" name="txtMarkSecure2" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtPercentage2" class="form-control" name="txtPercentage2" type="text" readonly="true" maxlength="5" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <%--End Subject Details of Class 12--%>

                        <%-- Start Subject Details of Agro Diploma --%>
                        <div class="row" id="div1" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Educational Qualification For Diploma In Agro Polytehnic (Agricultural Science / Horticultural Science / Animal Science / Fishery Science) </h4>
                                </div>
                                <div class="box-body box-body-open" style="padding-top: 15px; padding-bottom: 0px;">
                                    <div class="auto-style1" style="padding: 0px; margin-top: -15px;">
                                        <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 75px;">
                                                        <label class="">Roll No</label>
                                                    </th>
                                                    <th style="width: 300px;">
                                                        <label class="manadatory">
                                                            Name of the Board / Council, State</label></th>
                                                    <th style="width: 300px;">
                                                        <label class="manadatory">Name of the Examination Passed</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">
                                                            {{resourcesData.yearofPassing}}</label>
                                                    </th>
                                                    <th style="width: 100px;">
                                                        <label class="manadatory">Grade Type</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="manadatory">Total OGPA</label>
                                                    </th>
                                                    <th style="width: 75px; white-space: normal;">
                                                        <label class="manadatory" id="lblTotalMarksAgro">OGPA Secured</label>
                                                    </th>
                                                    <th style="width: 75px;">
                                                        <label class="">
                                                            {{resourcesData.percentage}}</label>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="txtRollNoAgro" class="form-control" placeholder="Roll No" name="txtBoardRollNo" type="text" maxlength="15" />
                                                    </td>
                                                    <td>
                                                        <input id="txtBoardNameAgro" class="form-control" placeholder="Name of the Board / Council, State" name="txtBoardName2" type="text" maxlength="30" /></td>
                                                    <td>
                                                        <input id="txtExmntnNameAgro" class="form-control" placeholder="Examination Name" name="txtExmntnName2" type="text" maxlength="30" />
                                                    </td>
                                                    <td>
                                                        <select name="txtPssngYr2" id="txtPssngYrAgro" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
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
                                                            <option value="2017">2017</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select name="ddlPctgeCalclte2" id="ddlPctgeCalclteAgro" class="form-control" data-val-required="Please Select.">
                                                            <option value="0">-Select-</option>
                                                            <option value="501">OGPA</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input id="txtMarkSecureAgro" class="form-control" placeholder="OGPA Secure" name="txtMarkSecureAgro" readonly="true" type="text" maxlength="4" onkeypress="return isNumberKey(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtTotalMarksAgro" class="form-control" placeholder="Total OGPA" name="txtTotalMarksAgro" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                    </td>
                                                    <td>
                                                        <input id="txtPercentageAgro" class="form-control" name="txtPercentageAgro" type="text" readonly="true" maxlength="5" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <%--End Subject Details of Agro Diploma--%>

                        <%---Start of Declaration----%>
                        <uc1:OUATDeclaration runat="server" ID="OUATDeclaration" ClientIDMode="Static" />
                        <%----End of Declaration-----%>
                        <div class="row">
                            <div class="col-md-12 box-container" style="margin-top: 5px;">
                                <div class="box-body box-body-open" style="text-align: center;">
                                    <span style="color: maroon; font-size: 20px; font-weight: bold">Please recheck the Application FORM-B before submitting the Application. No edit or correction shall be entertained. 
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div id="divBtn" class="row">
                            <div class="col-md-12 box-container" style="margin-top: 5px;">
                                <div class="box-body box-body-open" style="text-align: center;">
                                    <input type="button" id="btnSubmit" class="btn btn-success" value="Next" title="Proceed to Upload Necessary Document" />
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page" CssClass="btn btn-danger" PostBackUrl="" Text="Cancel" />
                                    <asp:Button ID="btnHome" runat="server" CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page" Text="Home" />
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
    </div>
</asp:Content>
