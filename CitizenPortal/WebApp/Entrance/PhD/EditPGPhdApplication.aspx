<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="EditPGPhdApplication.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.PGPhD.EditPGPhdApplication" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/PhysicalTestDeclaration.ascx" TagPrefix="uc1" TagName="PhysicalTestDeclaration" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>
<%@ Register Src="~/WebApp/Control/OUATUndertaking.ascx" TagPrefix="uc1" TagName="OUATUndertaking" %>
<%@ Register Src="~/WebApp/Control/OUATDeclaration.ascx" TagPrefix="uc1" TagName="OUATDeclaration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/WebApp/Kiosk/OUAT/bootbox.min.js"></script>
    
    <%--<script src="DoctoralMasters.js"></script>--%>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/OUAT/PGPhD/EditPGPhDForm.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#RecptHasMedal').hide();
            $('#WantClaim').hide();
            $('#applicantEmplyDtl').hide();
            $('#divLang').hide();
            $('#divResi').hide();
            //$('#divInstruction').hide();
            $('#divDeclaration').hide();
            $("#btnSubmit").prop('disabled', true);
            $('#divReserved').hide();
            $('#divEmplyeeCase').hide();
            $('#divNRI').hide();
            $('#divAgro').hide();
            $('#divResevation').hide();
            $("#divMarks").hide();
            $("#DivICARCollegeList").hide();
            $("#divPGApplication").hide();
            $("#divPH").hide();
            $("#divWO").hide();
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
            //alert(divID);
            if (divID == "divResi") {
                $('#divResi').show(500);
                $('#divLang').hide(500);
            }
            if (divID == "divLang") {
                $('#divResi').hide(500);
                $('#divLang').show(500);
            }
        }

        function fnClose() {
            $('#divLogin').hide();
        }

        function fnShowLogin() {
            $('#divLogin').show();
        }

        $(document).ready(function () {
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

        $(document).ready(function () { $("#divNonAadhar").hide(); });

    </script>

    <script type="text/javascript">
        window.CallParent = function () {
            ParentBindProfile();
        }
    </script>

    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {
            var t_Lang = p_Lang;
            if (p_Lang == null) t_Lang = document.getElementById('HFCurrentLang').value;
            if (t_Lang == "1") t_Lang = "2";
            else t_Lang = "1";
            document.getElementById('HFCurrentLang').value = t_Lang;
            document.forms[0].submit();
            return true;
        }
    </script>

    <style type="text/css">
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

        #CheckBoxList1 label {
            display: inline !important;
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

        .form-controlTemp {
            background: none repeat scroll 0 0 #fff;
            border: 1px solid #cdcdcd !important;
            border-radius: 0;
            box-shadow: 0 0 0;
            color: #333;
            padding: 3px 5px !important;
            display: block;
            width: 100%;
            height: 34px;
            font-size: 14px;
            line-height: 1.42857143;
        }

        #g207 {
            position: fixed !important;
            position: absolute;
            top: 0;
            top: expression ((t=document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop)+"px");
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #fff;
            opacity: 0.9;
            filter: alpha(opacity=90);
            display: block
        }

            #g207 p {
                opacity: 1;
                filter: none;
                font: bold 24px Verdana,Arial,sans-serif;
                text-align: center;
                margin: 20% 0
            }

                #g207 p a, #g207 p i {
                    font-size: 12px
                }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="g207" style="display: none; z-index: 1000;">
        <p>
            Please Wait a Moment...<br>
            <img src="/WebApp/Login/Loading_hourglass_88px.gif" /><br>
            Submitting Your Application...
        </p>
    </div>
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 311px;">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="form-heading">
                            <span class="col-lg-12 p0" style="font-size: 23px;"><i class="fa fa-pencil-square-o"></i> Edit Application form for Admission into OUAT Master's & Doctoral Program-2019 (Agriculture & Allied Subjects)</span>
                            <span class="clearfix"></span>
                        </h2>
                    </div>
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
                    
                    <div class="col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Select Programme</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlApplication">Select Programme</label>
                                    <select name="" id="ddlProgram" class="form-control" onchange="GetOUATCollege();">
                                        <option value="0">-Select-</option>
                                        <option value="MasterProgramme">Master Programme</option>
                                        <option value="DoctoralProgramme">Doctoral Programme</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlApplication">Select College</label>
                                    <select name="" id="ddlCollege" class="form-control" onchange="GetOUATDegree();">
                                        <option value="0">-Select-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label id="lblDegree">Select Degree</label>
                                    <select id="ddlDegree" class="form-control" onchange="GetOUATSubject();">
                                        <option value="0">-Select-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" id="divSubject">
                                <div class="form-group">
                                    <label id="lblSubject">Select Subject</label>
                                    <select name="ddlAppPref" id="ddlSubject" class="form-control" data-val="true" data-val-number="">
                                        <option value="0">-Select-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div class="col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Select Institute Type</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Have you passed/appeared the qualifying examination from Universities/Institutions recognized by State/Central Govt. </b></span></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="PGApp" id="PGYes" value="Yes" onclick="return fuShowHideDiv('divPGApplication', 1);" />
                                                Yes
                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="PGApp" id="PGNo" value="No" onclick="return fuShowHideDiv('divPGApplication', 0);" />
                                                No
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 othrinfosubhd2" id="DivICARCollegeList" style="display:none">
                                        <div class="col-md-4 pleft0">
                                            <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Choose Institutes acredited by ICAR : </b></span></p>
                                        </div>
                                        <div class="col-md-7 pleft0 pright0">
                                            <select name="ddlAppPref" id="ddlICARCollege" class="form-control" data-val="true" data-val-number="">
                                                <option value="0">-Select-</option>
                                                <option value="01">Acharya NG Ranga Agricultural University,Andhra Pradesh</option>
                                                <option value="02">Agriculture University, Jodhpur</option>
                                                <option value="03">Agriculture University, Kota</option>
                                                <option value="04">Aligarh Muslim University, Aligarh</option>
                                                <option value="05">Anand Agricultural University, Anand, Gujurat</option>
                                                <option value="06">Assam Agricultural University, Jorhat</option>
                                                <option value="07">Banaras Hindu University, Varanasi</option>
                                                <option value="08">Bidhan Chandra Krishi Viswavidyalaya, Mohanpur</option>
                                                <option value="09">Bihar Agricultural University, Bhagalpur</option>
                                                <option value="010">Birsa Agricultural University, Kanke</option>
                                                <option value="011">Central Agricultural University, Iroisemba, Manipur</option>
                                                <option value="012">Central Institute of Fisheries Education, Mumbai Maharastra</option>
                                                <option value="013">Chandra Shekhar Azad University of Agriculture and Technology, Kanpur</option>
                                                <option value="014">Chaudhary Charan Singh Haryana Agricultural University, Hissar, Haryana</option>
                                                <option value="015">Chaudhary Sarwan Kumar Himachal Pradesh Krishi Vishvavidyalaya,palampur, Himachal Pradesh</option>
                                                <option value="015">Chhatisgarha Kamadehenu Viswa Vidyalaya, Chhatisgarah</option>
                                                <option value="017">Dr. Balasaheb Sawant Konkan Krishi Vidyapeeth, Dapoli, Maharastra</option>
                                                <option value="018">Dr. Panjabrao Deshmukh Krishi Vidyapeeth, Akola, Maharastra</option>
                                                <option value="019">Dr. Rajendra Prasad Central Agriculture University, Samastipur</option>
                                                <option value="020">Dr. Y.S.R. Horticultural University, Venkataramannagudem, Tadepalli Gudem Mandal, West Godavari District</option>
                                                <option value="021">Dr. Yashwant Singh Parmar University of Horticulture and Forestry, Solan, Himachal Pradesh</option>
                                                <option value="022">G. B. Pant University of Agriculture and Technology, Pantnagar </option>
                                                <option value="023">Guru Angad Dev Veterinary and Animal Sciences University, Ludhiana</option>
                                                <option value="024">Indian Agricultural Research Institute, Jharkhand</option>
                                                <option value="025">Indian Agricultural Research Institute, New Delhi</option>
                                                <option value="026">Indian Veterinary Research Institute, Bareilly</option>
                                                <option value="027">Indira Gandhi Agricultural University, Raipur</option>
                                                <option value="028">Jawaharlal Nehru Agricultural University, Jabalpur</option>
                                                <option value="029">Junagadh Agricultural University, Junagadh, Gujurat</option>
                                                <option value="030">Kamadhenu University, Gandhi Nagar, Gujurat</option>
                                                <option value="031">Karnataka Veterinary, Animal and Fisheries Sciences University, Bidar</option>
                                                <option value="032">Kerala Agricultural University, Vellanikkara, Thrissur</option>
                                                <option value="033">Kerala University of Fisheries and Ocean Studies, Kochi</option>
                                                <option value="034">Kerala Veterinary and Animal Sciences University, Wayanad</option>
                                                <option value="034">Lala Lajpat Rai University of Veterinary and Animal Sciences, Hisar</option>
                                                <option value="036">Maharana Pratap University of Agriculture and Technology, Udaipur</option>
                                                <option value="037">Maharashtra Animal and Fishery Sciences University, Maharastra</option>
                                                <option value="038">Mahatma  Phule Krishi Vidyapith, Rahuri, Maharastra</option>
                                                <option value="039">Manyavar Shri Kansi Ram Ji University of Agriculture and Technology, Banda, U.P</option>
                                                <option value="040">Nagaland University, Lumani, Nagaland</option>
                                                <option value="041">Nanaji Dhesmukh Vety. Science University, Madhaya Paradesh</option>
                                                <option value="042">Narendra Dev University of Agriculture and Technology, Faizabad</option>
                                                <option value="042">National Dairy Research Institute, Karnal</option>
                                                <option value="043">Navsari Agricultural University, Navsari, Gujurat</option>
                                                <option value="044">Orissa University of Agriculture and Technology, Bhubaneswar</option>
                                                <option value="045">Prof. Jayashankar Telangana State Agricultural University, Telengana State</option>
                                                <option value="046">Punjab Agricultural University, Ludhiana</option>
                                                <option value="047">Rajasthan University of Veterinary and Animal Sciences, Bikaner</option>
                                                <option value="048">Rajmata Vijayaraje Scindia Krishi Vishwa Vidyalaya, Gwalior</option>
                                                <option value="049">Rani Lakshmi Bai Central Agriculture University,  Gwalior Road, UP</option>
                                                <option value="050">Sam Higginbottom University of Agriculture, Technology and Sciences, Allahabad, UP</option>
                                                <option value="051">Sardar Vallabhbhai Patel University of Agriculture and Technology, Meeruth</option>
                                                <option value="052">Sardarkrushinagar Dantiwada Agricultural University, Banaskantha, Gujurat</option>
                                                <option value="053">Sher-e-Kashmir University of Agricultural Sciences and Technology of Jammu, Jammu</option>
                                                <option value="054">Sher-e-Kashmir University of Agricultural Sciences and Technology of Kashmir, Srinagar</option>
                                                <option value="055">Shri Karan Narendra Agriculture University, Jobner</option>
                                                <option value="056">Sri Konda Laxman Telengana State Horticultural Universuty, Hyderabad, Telengana</option>
                                                <option value="057">Sri Venkateswara Veterinary University, Tirupati, Andhra Pradesh</option>
                                                <option value="058">Swami Keshwanand Rajasthan Agricultural University, Bikaner</option>
                                                <option value="059">Tamil Nadu Agricultural University, Coimbatore</option>
                                                <option value="060">Tamil Nadu Fisheries University, Nagapattinam</option>
                                                <option value="061">Tamil Nadu Veterinary and Animal Sciences University, Madhavaram, Chennai</option>
                                                <option value="062">University of Agricultural and Horticultural Sciences, Shivamogga</option>
                                                <option value="063">University of Agricultural Sciences, Bangalore</option>
                                                <option value="064">University of Agricultural Sciences, Dharwad</option>
                                                <option value="065">University of Agricultural Sciences, Raichur</option>
                                                <option value="066">University of Horticultural Sciences, Bagalkot</option>
                                                <option value="067">UP Pandit Din Dayal Upadhya Pashu Chikisha Vigyan Visway Vidyalaya, Mathura, UP</option>
                                                <option value="068">Uttar Banga Krishi Viswavidyalaya, Cooch Behar</option>
                                                <option value="069">Uttarakhand University of Horticulture and Forestry, Bharsar, Pauri garhwal</option>
                                                <option value="070">Vasantrao Naik Marathwada Krishi Vidyapeeth, Parbhani, Maharastra</option>
                                                <option value="071">Visva-Bharati University, Santiniketan</option>
                                                <option value="072">West Bengal University of Animal and Fishery Sciences, Kolkata</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div id="divPGApplication" runat="server">

                        <div class="col-lg-9 p0">

                            
                            <div class="col-md-12 box-container">
                                <div class="box-heading ">
                                    <h4 class="box-title">UIDAI - Aadhaar Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                        <div class="row">
                                            <div class="form-group col-lg-4">
                                                <select class="form-control" data-val="true" data-val-number="search application"
                                                    data-val-required="Please select search type" id="ddlSearch" name="Search" autofocus="autofocus">
                                                    <option value="0">Select UIDAI Type</option>
                                                    <option value="U">Aadhaar Number</option>
                                                    <option value="R">Aadhaar Enrollment Number</option>

                                                </select>
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <input class="form-control" placeholder="Enter UIDAI Number" name="txtAadhaar" type="text" value="" id="UID" onkeypress="return isNumberKey(event);" onchange="ValidateUIDAI();"
                                                    autofocus="autofocus" autocomplete="off" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>


                            <div id="divDetails" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Applicant Details</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">Name of the Candidate</label>
                                            <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" maxlength="40" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">Date of Birth <span style="font-size: 11px;"></span></label>
                                            <input id="DOB" class="form-control" placeholder="DOB" name="DOB" maxlength="12" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 pright0">
                                        <div class="form-group">
                                            <label id="lblAgeAsOn" for="Age">Age as on 31.12.2019</label>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" maxlength="3" readonly="readonly" />
                                            </div>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" maxlength="3" readonly="readonly" />
                                            </div>
                                            <div class="col-xs-4 pleft0 ">
                                                <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" maxlength="3" readonly="readonly" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="MotherName">Mother's Name</label>
                                            <input id="MotherName" class="form-control" placeholder="Mother's Name" name="Mother Name" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">Father's Name</label>
                                            <input id="FatherName" class="form-control" placeholder="Father's Name" name="Father Name" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                Gender</label>
                                            <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender">
                                                <option value="0">-Select-</option>
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                                <option value="Transgender">Transgender</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="Religion">Religion</label>
                                            <select class="form-control" data-val="true" data-val-number="Religion" data-val-required="Please select your Category" id="religion" name="Religion">
                                                <option value="0">-Select-</option>
                                                <option value="Hindu">Hindu</option>
                                                <option value="Jain">Jain</option>
                                                <option value="Sikh">Sikh</option>
                                                <option value="Muslim">Muslim</option>
                                                <option value="Budhist">Budhist</option>
                                                <option value="Christian">Christian</option>
                                                <option value="Other">Other's</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="category">Category</label>
                                            <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="Category">
                                                <option value="0">-Select-</option>
                                                <option value="SC">SC</option>
                                                <option value="ST">ST</option>
                                                <option value="GN">General, Unreserved</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtTongue">Marital Status</label>
                                            <select class="form-control" data-val="true" data-val-number="MaritalStatus" id="MaritalStatus" name="MaritalStatus">
                                                <option value="0">-Select-</option>
                                                <option value="Married">Married</option>
                                                <option value="Unmarried">Unmarried</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">Mother Tongue</label>
                                            <select class="form-control" data-val="true" data-val-number="MotherTongue" name="MotherTongue" id="MotherTongue">
                                                <option value="0">-Select-</option>
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
                                                <option value="Other">Other's</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label for="nationality">Nationality</label>
                                            <select class="form-control" data-val="true" data-val-number="Nationality" id="Nationality" name="Nationality">
                                                <option selected="" value="Indian">Indian</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label for="EmailID" class="manadatory ">Email ID</label>
                                            <input type="email" id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" maxlength="30" onchange="ValiateEmail();" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="MobileNo">Mobile Number</label>
                                            <input id="MobileNo" class="form-control" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event); " type="text" autocomplete="off" onchange="MobileValidation('MobileNo');" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">Applicant Blood Group</label>
                                                <select class="form-control" id="txtBloodGroup">
                                                    <option value="Select">--Select--</option>
                                                    <option value="A+">A+</option>
                                                    <option value="A-">A-</option>
                                                    <option value="B+">B+</option>
                                                    <option value="B-">B-</option>
                                                    <option value="AB+">AB+</option>
                                                    <option value="AB-">AB-</option>
                                                    <option value="O+">O+</option>
                                                    <option value="O-">O-</option>
                                                </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">Parent's Income (annually)</label>
                                                <select class="form-control" id="txtAnnualIncome">
                                                    <option value="Select">--Select--</option>
                                                    <option value="below1">Below 1 Lac</option>
                                                    <option value="below3">1 - 3 Lac</option>
                                                    <option value="below5">3 - 5 Lac</option>
                                                    <option value="below7">5 - 7 Lac</option>
                                                    <option value="below10">7 - 10 Lac</option>
                                                    <option value="below15">10 - 15 Lac</option>
                                                    <option value="above15">Above 15 Lac</option>

                                                </select>

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 p0">
                            <div id="divPhoto" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title manadatory">Applicant Photograph</h4>
                                </div>
                                <div class="box-body box-body-open p0">
                                    <div class="col-lg-12">
                                        <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                                        <input class="camera" id="ApplicantImage" name="Photoupload" type="file" style="display:none"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div id="divSign" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title manadatory">Applicant Signature
                                    </h4>
                                </div>
                                <div class="box-body box-body-open p0">
                                    <div class="col-lg-12">
                                        <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
                                        <input class="camera" id="ApplicantSign" name="Photoupload" type="file" style="display:none"/>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="divAddress" class="row">
                            <div class="col-md-6 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Permanent Address</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="AddressLine1">Address Line-1 (Care of)</label>
                                                <input type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">Address Line-2 (Building)</label>
                                                <input name="" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="" for="RoadStreetName">Road/Street Name</label>
                                                <input name="" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="LandMark">Landmark</label>
                                                <input name="" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="Locality">Locality</label>
                                                <input name="" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">State</label>
                                                <select name="" id="PddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetOUATDistrict();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">District</label>
                                                <select id="PddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." onchange="GetOUATBlock();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Block/Taluka</label>
                                                <select id="PddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." onchange="GetOUATPanchayat();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="text-nowrap">Panchayat/Village/City</label>
                                                <select id="PddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="PIN">Pin Code</label>
                                                <input name="" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" />
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
                                    <h4 class="box-title">Present Address <span style="font-size: 13px; padding-right: 0">(For correspondence)</span>
                                        <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                                            <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="javascript: fnCopyAddress(this.checked);" />Same as Permanent Address</span>
                                        <span class="clearfix"></span></h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="AddressLine1">Address Line-1 (Care of)</label>
                                                <input name="" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">Address Line-2 (Building)</label>
                                                <input name="" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="" for="RoadStreetName">Road/Street Name</label>
                                                <input name="" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="LandMark">
                                                    Landmark
                                                </label>
                                                <input name="" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="Locality">
                                                    Locality
                                                </label>
                                                <input name="" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="40" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">State</label>
                                                <select name="" id="CddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetOUATDistrict2();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">District</label>
                                                <select name="" id="CddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." onchange="GetOUATBlock2();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Block/Taluka</label>
                                                <select name="" id="CddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." onchange="GetOUATPanchayat2();">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="text-nowrap" for="ddlVillage">Panchayat/Village/City</label>
                                                <select name="" id="CddlVillage" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select panchayat">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="PIN">Pin Code</label>
                                                <input name="" type="text" id="CPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" onchange="return PinCodeValidation('CPinCode');" />
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

                        <div class="row">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title pleft0">Reservation Quota Details</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfohd">
                                                <div class="col-md-9 pleft0">
                                                    <p><span id="lblreservedseat"><span class="fom-Numbx">1.</span>  Wants to claim for Reserved Seats? <b>(PwD, NRI/PIO Sponsored, Other state and Horticulture)</b> </span></p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-6 pleft0">
                                                        <input type="radio" name="ReservedQuota" id="rbtnReservedY" value="Yes" onclick="return fuShowHideDiv('divReserved', 1);" />{{resourcesData.yes}}
                                            <label for="rbtnReservedY"></label>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <input type="radio" name="ReservedQuota" id="rbtnReservedN" value="No" onclick="return fuShowHideDiv('divReserved', 0);" />
                                                        {{resourcesData.no}}
                                            <label for="rbtnReservedN"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="clearfix"></div>--%>
                                        <div id="divReserved" class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-4 pleft0">
                                                    <p class="pleft27 manadatory" id="lblQuota"><i class="fa fa-arrow-right pright5"></i>{{resourcesData.seatcategory}}</></p>
                                                </div>
                                                <div class="col-md-8 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0 pright0">
                                                        <asp:CheckBoxList ID="CheckBoxList1" runat="Server" RepeatDirection="Vertical" onchange="fnReservationQuota();">
                                                            <asp:ListItem Text="Person with Disability (PwD)" Value="203"></asp:ListItem>
                                                            <asp:ListItem Text="NRI/PIO Sponsored" Value="204"></asp:ListItem>
                                                            <asp:ListItem Text="Other State" Value="206"></asp:ListItem>
                                                            <asp:ListItem Text="Horticulture" Value="207"></asp:ListItem>                                                                
                                                        </asp:CheckBoxList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--StartPhysical Handicap Detail--%>
                                        <div id="divPH">
                                            <div class="form-group">
                                                <div class="col-lg-12 othrinfohd">
                                                    <div class="col-md-9 pleft0">
                                                        <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Reservation details under PwD quota</b></span></p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 othrinfosubhd2">
                                                    <div class="col-md-9 pleft0 pright0">
                                                        <p class="ptop5 pleft27 manadatory"><i class="fa fa-arrow-right pright "></i>PwD?</p>
                                                    </div>
                                                    <div class="col-md-3 pleft0 pright0">
                                                        <div class="col-xs-12 pleft0">
                                                            <div class="col-xs-6 pleft0">
                                                                <input type="radio" name="HandicapType" id="rbtnHandicapTypeY" value="Permanent" />Permanent
                                                            </div>
                                                            <div class="col-xs-6 pleft0">
                                                                <input type="radio" name="HandicapType" id="rbtnHandicapTypeN" value="Temporary" />Temporary     
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 othrinfosubhd2">
                                                    <div class="col-md-9 pleft0 pright0">
                                                        <p class="ptop5 pleft27 manadatory"><i class="fa fa-arrow-right pright "></i>Which part of the body is PwD?</p>
                                                    </div>
                                                    <div class="col-md-3 pleft0 pright0">
                                                        <div class="col-xs-12 pleft0">
                                                            <input id="txtHandicappedPart" class="form-control" name="txtHandicappedPart" type="text" placeholder="Handicapped Body Part" value="" autofocus="" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group">
                                                <div class="col-lg-12 othrinfosubhd2" id="divPCPercent" runat="server">
                                                    <div class="col-md-9 pleft0">
                                                        <p class="ptop5 pleft27 manadatory"><i class="fa fa-arrow-right pright5"></i>Percentage of Handicapped.</p>
                                                    </div>
                                                    <div class="col-md-3 pleft0 pright0">
                                                        <div class="col-xs-3 pleft0 text-right">
                                                            <input id="txtHandiPercent" class="form-control mtop0" placeholder="%" name="txtHandiPercent" value="" maxlength="2" style="text-align: right" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 othrinfosubhd2">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>PwD candidate need to upload certificate as per clause no- 6.8(ii)<span style="color: red;"></span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Physical Handicap Details--%>

                                        <%--Start NRI Detail--%>
                                        <div class="form-group" id="divNRI">
                                            <div class="col-lg-12 othrinfohd">
                                                <div class="col-md-9 pleft0">
                                                    <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Reservation details under NRI/PIO Sponsored</b></span></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <div class="col-lg-12 othrinfosubhd2">
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                            <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>NRI/PIO Sponsored Candidate need to fill the <b>ANNEXURE-III,</b> and upload it (in attachment page) with supporting documents (<b>Valid passport, Valid Visa / proof of permanent residential certificate and residence proof</b>) in English version. Please refer <b>Clause 6.7(v) of OUAT PG Prospectus - 2019</b> <span style="color: red;">*</span></p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 text-right" style="display: none">
                                                            <p class="">
                                                                <i class="fa fa-file-pdf-o"></i>
                                                                <input type="button" id="Button2" class="btn-link" runat="server" onclick="javascript: return downloadAnnexure3();" value="Download ANNEXURE-III" />
                                                                <i class="fa fa-download"></i>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End of NRI Details--%>

                                        <%--Start Western Odisha Detail --%>
                                        <div id="divWO">
                                            <div class="form-group">
                                                <div class="col-lg-12 othrinfohd">
                                                    <div class="col-md-9 pleft0">
                                                        <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Reservation details under Other State quota</b></span></p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 othrinfosubhd2">
                                                    <div class="col-md-9 pleft0 pright0">
                                                        <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Please select residing  of Other State </p>
                                                    </div>
                                                    <div class="col-md-3 pleft0 pright0">
                                                        <div class="col-xs-12 pleft0">
                                                            <select name="ddlWesternDistrict" id="ddlOtherState" class="form-control" data-val="true" data-val-number="ddlWesternDistrict" data-val-required="Please select Residence Type">
                                                                <option value="0">-Select Other State-</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group">
                                                <div class="col-lg-12 othrinfosubhd2">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                        <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Other State candidate need to upload <b>Permanent Residential Certificate </b>in attachment page. Please refer <b>Clause 6.8(v) of OUAT PG Prospectus - 2019</b> <span style="color: red;">*</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--Start Horticulture Detail --%>
                                        <div class="form-group" id="divHoriculture" style="display: none">
                                            <div class="col-lg-12 othrinfohd">
                                                <div class="col-md-9 pleft0">
                                                    <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Reservation details under Horticulture Quota</b></span></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <div class="col-lg-12 othrinfosubhd2">
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                            <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Please Upload the respective required document as per clause 7.4.4 of OUAT PG prospectus 2019<span style="color: red;">*</span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Horticulture Detail --%>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Other Information </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group" style="display:none">
                                            <div class="col-lg-12 othrinfohd">
                                                <div class="col-md-9 pleft0">
                                                    <p><span id="Medal"><span class="fom-Numbx">1.</span> Whether the candidate has secured 1st position in 1st Class? </span></p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-6 pleft0">
                                                        <input type="radio" name="radio1" id="OthrInfo1Y" value="Yes" onclick="return fuShowHideDiv('RecptHasMedal', 1);" />
                                                        Yes<label for="rbtnLeeseY"></label>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <input type="radio" name="radio1" id="OthrInfo1N" value="No" onclick="return fuShowHideDiv('RecptHasMedal', 0);" />
                                                        No<label for="rbtnLeeseN"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="RecptHasMedal" class="form-group" style="display: block;">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Please submit relevant document from competent authority as per clause 7.5(a) of OUAT PG Prospectus 2019.</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0" style="display: none">
                                                    <div class="col-xs-12 pleft0 pright0">
                                                        <input id="txtDocType" class="form-control" name="txtDeedNo" placeholder="Describe Here" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group mtop5">
                                            <div class="col-lg-12 othrinfohd">
                                                <div class="col-md-9 pleft0">
                                                    <p><span id="Emp"><span class="fom-Numbx">1.</span> Are you employed?</span></p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-6 pleft0">
                                                        <input type="radio" name="radio3" id="OthrInfo3Y" value="Yes" onclick="return fuShowHideDiv('applicantEmplyDtl', 1);" />
                                                        Yes<label for="rbtnLeeseY"></label>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <input type="radio" name="radio3" id="OthrInfo3N" value="No" onclick="return fuShowHideDiv('applicantEmplyDtl', 0);" />
                                                        No<label for="rbtnLeeseN"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="applicantEmplyDtl" class="form-group" style="display: block;">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Designation</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0 pright0">
                                                        <input id="txtDesgntnName" class="form-control" name="txtDeedNo" placeholder="Describe Here" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Name of the employer</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0 pright0">
                                                        <input id="txtEmployerName" class="form-control" name="" placeholder="Employer Name" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Address of the employer</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0 pright0">
                                                        <input id="txtEmployerAddrss" class="form-control" name="txtDeedNo" placeholder="Employer Address" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>No objection certificate furnished</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <div class="col-xs-12 pleft0 pright0">
                                                        <select class="form-control" id="EmployerNoc">
                                                            <option value="0">-Select-</option>
                                                            <option value="Yes">Yes</option>
                                                            <option value="No">No</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <div class="col-lg-12 othrinfosubhd2">
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                                <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Please upload the necessary documents as per clause 2.3.2 of prospectus.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div id="SpecialClaim" style="display: none">
                                            <div class="form-group mtop5">
                                                <div class="col-lg-12 othrinfohd">
                                                    <div class="col-md-9 pleft0">
                                                        <p><span id="SplClmOpt"><span class="fom-Numbx">2.</span>Do you want any special claims?</span></p>
                                                    </div>
                                                    <div class="col-md-3 pleft0 pright0">
                                                        <div class="col-xs-6 pleft0">
                                                            <input type="radio" name="radio5" id="OthrInfo2Y" value="Yes" onclick="return fuShowHideDiv('WantClaim', 1);" />
                                                            Yes<label for="rbtnLeeseY"></label>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <input type="radio" name="radio5" id="OthrInfo2N" value="No" onclick="return fuShowHideDiv('WantClaim', 0);" />
                                                            No<label for="rbtnLeeseN"></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="WantClaim" class="form-group">
                                                <div class="col-lg-12 othrinfosubhd2">
                                                    <div class="col-md-2 pleft0">
                                                        <p class="ptop5 pleft27">
                                                            <input type="radio" name="radio6" value="Sports" />Sports
                                                        </p>
                                                    </div>

                                                    <div class="col-md-7 pleft0" id="ddlSports" style="display: none">
                                                        <p class="ptop5 pleft27">
                                                            <select class="form-control" id="ddlSportsOpt">
                                                                <option value="0">-Select-</option>
                                                                <option value="001">Candidates represented University at National level in UG career as per the certification of DSW </option>
                                                                <option value="002">Candidate who represented the State in any Sports events at All India Level at U.G.Career</option>
                                                                <option value="003">Candidates who represented the country in any Sports events at International level at UG career</option>
                                                            </select>
                                                        </p>
                                                    </div>

                                                    <div class="col-md-12 pleft0">
                                                        <p class="ptop5 pleft27">
                                                            <input type="radio" name="radio6" value="N.C.C" />N.C.C
                                                        </p>
                                                    </div>
                                                    <div class="col-md-2 pleft0">
                                                        <p class="ptop5 pleft27">
                                                            <input type="radio" name="radio6" value="N.S.S" />N.S.S
                                                        </p>
                                                    </div>

                                                    <div class="col-md-4 pleft0" id="ddlNSS" style="display: none">
                                                        <p class="ptop5 pleft27">
                                                            <select class="form-control" id="ddlNSSOpt">
                                                                <option value="0">-Select-</option>
                                                                <option value="Represented the Country in N.S.S">Represented the Country in N.S.S</option>
                                                                <option value="Received National Award">Received National Award</option>
                                                                <option value="Received State N.S.S. Award">Received State N.S.S. Award </option>
                                                                <option value="Found to be the best at University level">Found to be the best at University level</option>
                                                                <option value="Represented the Country in N.S.S at International Level">Represented the Country in N.S.S at International Level</option>
                                                            </select>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" id="divSpecialClaim" style="display: none">
                                                <div class="col-lg-12 othrinfohd">
                                                    <div class="col-md-9 pleft0">
                                                        <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Special Claim Information</b></span></p>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <div class="col-lg-12 othrinfosubhd2">
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                                <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Please Upload the respective required document details as per clause 7.4.6 of OUAT PG prospectus 2019 for Sports/NCC/NSS <span style="color: red;">*</span></p>
                                                                <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>The candidates are advised to furnish correct supporting documents in support for special weightage on NCC/NSS/Sports as per clause 7.4.6 <span style="color: red;">*</span></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" id="divNCC" style="display: none">
                                                <div class="col-lg-12 othrinfohd">
                                                    <div class="col-md-9 pleft0">
                                                        <p><span><span class="fom-Numbx"><i class="fa fa-hand-o-right"></i></span><b>Special Claim under N.C.C category</b></span></p>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <div class="col-lg-12 othrinfosubhd2">
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                                <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Candidates who have passed ‘B’ certificate at Graduation level <span style="color: red;">*</span></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="display: none">
                            <div class="col-lg-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Details of Bank Chalan </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 fltleft">
                                        <div class="form-group">
                                            <div class="col-lg-4 pleft0">
                                                <label class="manadatory">
                                                    Bank Name <span style="font-size: 11px;"></span>
                                                </label>
                                                <input id="txtBankName" class="form-control" placeholder="Bank Name" maxlength="30" />
                                            </div>
                                            <div class="col-lg-4">
                                                <label class="manadatory" for="WitnessNme2">Issue Date</label>
                                                <input id="txtIssueDate" class="form-control inputbox_bluebdr" maxlength="30" name="" placeholder="Chalan Issue Date" type="text" />
                                            </div>
                                            <div class="col-lg-4">
                                                <label class="manadatory" for="AddWtness2">Branch</label>
                                                <input id="txtBankBranch" class="form-control inputbox_bluebdr" maxlength="50" name="" placeholder="Bank Branch" type="text" />
                                            </div>
                                            <div class="col-xs-6">
                                                <label class="manadatory">Chalan Number</label>
                                                <input id="txtChalanNumber" class="form-control inputbox_bluebdr" maxlength="15" name="" placeholder="Chalan Number" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Academic Profile of Applicant - Enter Correct Details</h4>
                                </div>
                                <div class="box-body box-body-open p0">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="display:none">
                                        <div class="form-group" style="margin-bottom: 0;">
                                            <div class="table-responsive">
                                                <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                    <tr>
                                                        <td colspan="6" style="background-color: #415670; color: #fff; font-size: 15px;">Educational Qualification of High School Certificate H.S.C/Equivalent (H.S.C)</td>
                                                    </tr>
                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 25%;">
                                                                <label class="manadatory">Name of the Board/University</label>
                                                            </th>
                                                            <th style="width: 12%;">
                                                                <label class="manadatory">Grade System</label>
                                                            </th>
                                                            <th style="width: 8%;">
                                                                <label class="manadatory">Passing Year</label>
                                                            </th>
                                                            <th style="width: 8%;">
                                                                <label class="manadatory" id="lblHscTotalMarks">Total Marks</label>
                                                            </th>
                                                            <th style="width: 8%;">
                                                                <label class="manadatory" id="lblHscMarksGot">Marks Scored</label>
                                                            </th>
                                                            <th style="width: 8%;">
                                                                <label class="manadatory">Percentage of Marks</label>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input id="HscName" class="form-control" placeholder="Name Of Board/University" name="" type="text" maxlength="50" />
                                                            </td>
                                                            <td>
                                                                <select name="HscDivision" id="HscDivision" class="form-control">
                                                                    <option value="0">-Select-</option>
                                                                    <option value="501">CGPA</option>
                                                                    <option value="502">Percentage</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input id="HscPassingYear" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                            </td>
                                                            <td>
                                                                <input id="HscTotalMarks" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'HscTotalMarks'); " />
                                                            </td>
                                                            <td>
                                                                <input id="HscMarksGot" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'HscMarksGot');" />
                                                            </td>
                                                            <td>
                                                                <input id="HscPercentage" readonly="true" class="form-control" placeholder="%" type="text" maxlength="3" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" style="display:none">
                                            <div class="form-group" style="margin-bottom: 0;">
                                                <div class="table-responsive">
                                                    <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                        <tr>
                                                            <td colspan="6" style="background-color: #415670; color: #fff; font-size: 15px;">Educational Qualification of Higher Secondary Examination +2 Science/Equivalent (excluding extra optional)</td>
                                                        </tr>
                                                        <tbody>
                                                            <tr>
                                                                <th style="width: 25%;">
                                                                    <label class="manadatory">Name of the Board/University</label>
                                                                </th>
                                                                <th style="width: 12%;">
                                                                    <label class="manadatory">Grade System</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label class="manadatory">Passing Year</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label class="manadatory" id="lblSscTotalMarks">Total Marks</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label class="manadatory" id="lblSscMarksGot">Marks Scored</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label class="manadatory">Percentage of Marks</label>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input id="SscName" class="form-control" placeholder="Name Of Board/University" name="" type="text" maxlength="50" />
                                                                </td>
                                                                <td>
                                                                    <select name="SscDivision" id="SscDivision" class="form-control">
                                                                        <option value="0">-Select-</option>
                                                                        <%--<option value="501">OGPA</option>--%>
                                                                        <option value="502">Percentage</option>
                                                                    </select></td>
                                                                <td>
                                                                    <input id="SscPassingYear" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                                </td>
                                                                <td>
                                                                    <input id="SscTotalMarks" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'SscTotalMarks'); " />
                                                                </td>
                                                                <td>
                                                                    <input id="SscMarksGot" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'SscMarksGot'); " />
                                                                </td>
                                                                <td>
                                                                    <input id="SscPercentage" class="form-control" placeholder="%" readonly="true" type="text" maxlength="3" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                                            <div class="form-group" style="margin-bottom: 0;">
                                                <div class="table-responsive">
                                                    <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                        <tr>
                                                            <td colspan="6" style="background-color: #415670; color: #fff; font-size: 15px;">Educational Qualification of B.Sc (Ag)/B.sc.(Hort)B.V.Sc.& A.H/B.Tech (Ag.Engg.)/B.F.Sc/B.Sc(H.Sc)/B.Sc(Forestry)
                                                                <span class="pull-right" style="display:none" ><input type="radio" name="BSCQUAL" value="P" checked />Passed | <input type="radio" name="BSCQUAL" value="A" />Appearing</span>

                                                            </td>
                                                        </tr>
                                                        <tbody>
                                                            <tr>
                                                                <th style="width: 25%;">
                                                                    <label >Name of the Board/University</label>
                                                                </th>
                                                                <th style="width: 12%;">
                                                                    <label >Grade System</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label >Passing Year</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label id="lblBscTotalMarks">Total Marks</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label id="lblBscMarksGot">Marks Scored</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label >Percentage of Marks</label>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input id="BscName" class="form-control" placeholder="Name Of Board/University" name="" type="text" maxlength="50" />
                                                                </td>
                                                                <td>
                                                                    <select name="gradeDivision3" id="BscDivision" class="form-control">
                                                                        <option value="0">-Select-</option>
                                                                        <option value="501">OGPA - 10 Scale</option>
                                                                        <option value="503">OGPA - 5.0 Scale</option>
                                                                        <option value="504">OGPA - 4.0 Scale</option>
                                                                        <option value="502">Percentage</option>
                                                                    </select></td>
                                                                <td>
                                                                    <input id="BscPassingYear" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                                </td>
                                                                <td>
                                                                    <input id="BscTotalMarks" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'BscTotalMarks'); " />
                                                                </td>
                                                                <td>
                                                                    <input id="BscMarksGot" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'BscMarksGot'); " />
                                                                </td>
                                                                <td>
                                                                    <input id="BscPercentage" class="form-control" placeholder="%" readonly="true" type="text" maxlength="3" />
                                                                </td>
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" id="divMsc">
                                            <div class="form-group" style="margin-bottom: 0;">
                                                <div class="table-responsive">
                                                    <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                        <tr>
                                                            <td colspan="6" style="background-color: #415670; color: #fff; font-size: 15px;">Educational Qualification of M.Sc.(Ag.)/M.V. Sc./M.Tech (Agril,Engg.) M.F.Sc./Equivalent
                                                                <span class="pull-right" style="display:none"><input type="radio" name="MSCQUAL" value="P" checked />Passed | <input type="radio" name="MSCQUAL" value="A" />Appearing</span></td>
                                                        </tr>
                                                        <tbody>
                                                            <tr>
                                                                <th style="width: 25%;">
                                                                    <label >Name of the Board/University</label>
                                                                </th>
                                                                <th style="width: 12%;">
                                                                    <label >Grade System</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label >Passing Year</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label id="lblMscTotalMarks">Total Marks</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label id="lblMscMarksGot">Marks Scored</label>
                                                                </th>
                                                                <th style="width: 8%;">
                                                                    <label >Percentage of Marks</label>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input id="MscName" class="form-control" placeholder="Name Of Board/University" name="" type="text" maxlength="50" />
                                                                </td>
                                                                <td>
                                                                    <select name="MscDivision" id="MscDivision" class="form-control">
                                                                        <option value="0">-Select-</option>
                                                                        <option value="501">OGPA - 10 Scale</option>
                                                                        <%-- <option value="503">OGPA - 5.0 Scale</option>
                                                                <option value="504">OGPA - 4.0 Scale</option>--%>
                                                                        <option value="502">Percentage</option>
                                                                    </select></td>
                                                                <td>
                                                                    <input id="MscPassingYear" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                                </td>
                                                                <td>
                                                                    <input id="MscTotalMarks" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'MscTotalMarks'); " />
                                                                </td>
                                                                <td>
                                                                    <input id="MscMarksGot" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'MscMarksGot'); " />
                                                                </td>
                                                                <td>
                                                                    <input id="MscPercentage" class="form-control" placeholder="%" readonly="true" type="text" maxlength="3" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                        <div id="divDomicileInfo" class="col-md-12 box-container pleft0 pright0">
                            <div class="box-heading">
                                <h4 class="box-title pleft0">Domicile Information
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                    <div class="form-group">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0 ">
                                                <p>
                                                    <span class="dplyflex">
                                                        <span id="isOdia" class="manadatory">Has the Candidate passed Odia as one of the subject in HSC Examination?</span>
                                                    </span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio4" id="Yes" value="Yes" onclick="return fnLanguage('divLang');" />Yes
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio4" id="No" value="No" onclick="return fnLanguage('divResi');" />No
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-12 othrinfosubhd2" id="divLang" style="display: none;">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i><span id="chkAbility">Ability to read, write and speak Odia langugae</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-4 pleft0" style="white-space: nowrap;">
                                                    <input type="checkbox" name="readOdiya" id="readOdiya" />Read
                                                </div>
                                                <div class="col-xs-4" style="white-space: nowrap;">
                                                    <input type="checkbox" name="writeOdiya" id="writeOdiya" />Write
                                                </div>
                                                <div class="col-xs-4" style="white-space: nowrap;">
                                                    <input type="checkbox" name="spkOdiya" id="spkOdiya" />Speak
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2" id="divResi" style="display: block;">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Residence Type (Need to provide valid document when asked)</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-12 pleft0 pright0 mb10">
                                                    <select name="ddlResidence" id="ddlResidence" class="form-control" data-val="true" data-val-number="ddlResidence" data-val-required="Please select Residence Type">
                                                        <option value="0">--Select Residence Type--</option>
                                                        <option value="199">Other State</option>
                                                        <option value="200">Permanent resident of Odisha.</option>
                                                        <option value="201">Odia candidate residing outside Odisha.</option>
                                                        <option value="202">Outside state Candidate's whose parents are serverving in Odisha</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2" id="divInstruction" style="">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
                                                <p class=""><i class="fa fa-info-circle pright5" style="color: #000;"></i>Odisha Domicile Candidates need to upload the Domicile certificate as per clause no-2.3.1 where as other state candidates need to upload Domicile certificate of their state as per clause No 6.8(v)</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="row">
                        <uc1:OUATDeclaration runat="server" ID="OUATDeclaration" ClientIDMode="Static" />
                            </div>
                        <div class="row">
                            <div class="col-md-12 box-container" style="margin-top: 5px;">
                                <div class="box-body box-body-open" style="text-align: center;">
                                    <span style="color: maroon; font-size: 20px; font-weight: bold">Please Recheck The Application Form  Before Submitting. Once Submitted, No Edit Or Correction Shall Be Entertained.</span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 box-container" id="divBtn">
                                <div class="box-body box-body-open" style="text-align: center;">
                                    <input type="button" id="btnSubmit" class="btn btn-success" value="Register & Proceed" onclick="SubmitData();" />
                                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Cancel" id="btnCancel" class="btn btn-danger" />
                                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnHome" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnLoginID" runat="server" ClientIDMode="Static" />
</asp:Content>
