<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="TPSC.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.TPSC.TPSC" %>

<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>
<%@ Register Src="~/WebApp/Control/TPSCDeclaration.ascx" TagPrefix="uc1" TagName="TPSCDeclaration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="TPSC.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#subdiv_vsble').hide();
            $('#chklist').hide();
            $('#cndtemrd').hide();
            $('#exsrvmn').hide();
            $('#sptprtptd').hide();
            $('#winmdl').hide();
            $('#ncccrtfcte').hide();
            $('#hvngdl').hide();
            $('#hvngcrmnlcse').hide();
            $('#plyntnl').hide();
            $('#divCirmeCase').hide();
        });
        //Function For ChkInfo
        function ckhInfo() {

            if (bool == 1) {
                bool = 0;
                $('#chklist').slideDown(500);
            }
            else {
                bool = 1;
                $('#chklist').slideUp(500);
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 311px;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>

        <div class="row" id="divCitizenProfile">


            <div>
                <div class="clearfix">
                    <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                        TRIPURA PUBLIC SERVICE COMMISSION (Akhaura Road, Agartala - 799001)
                    </h2>
                </div>
                <%--<div class="row">
                    <div class="col-md-12 box-container" id="">
                        <div class="box-heading">
                            <h4 class="box-title">Instruction to Fill the Form 
                               
                                <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i></span><span class="clearfix"></span>
                            </h4>
                        </div>
                        <uc1:serviceinformation runat="server" ID="ServiceInformation" />
                    </div>
                </div>--%>

                <div class="row">
                </div>
                <div class="row">
                    <div id="" class="col-md-9 p0">
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Fetch detail from Aadhaar 
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
        <div class="row">
            <div class="form-group col-lg-3">
                <select class="form-control" data-val="true" data-val-number="search application"
                    data-val-required="Please select search type" id="ddlSearch" name="Search">
                    <option selected value="U">Aadhaar UID</option>
                </select>
            </div>
            <div class="form-group col-lg-4">
                <input class="form-control" placeholder="Enter 12 digit Aadhaar No." name="txtAadhaar" type="text" value="" id="UID" maxlength="12" onkeypress="return isNumberKey(event);"
                    autofocus />
            </div>
            <div class="form-group col-lg-2 text-left">
                <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                    Text="Proceed" OnClientClick="return openWindow(1,2,'UIDCasteCertificate1'); " />
             
                
            </div>
            <%--<div id="divNonAadhar" class="form-group col-lg-3 text-right" style="white-space:nowrap;margin-top: 10px;"><a href="#" onclick="fnNonUID();" title="Click if Aadhaar UID is not available">I don't have Aadhaar No.</a></div>--%>
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
                           
                        </div>
                        <div id="divDetails" class="col-md-12 box-container">
                            <div class="box-heading" id="Div4">
                                <h4 class="box-title">Applicant Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="firstname">
                                            Name of the Applicant</label>
                                        <input id="FullName" class="form-control" placeholder="Full Name" name="
                                                    FullName"
                                            type="text" value="" autofocus="" />
                                    </div>
                                </div>
                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="FatherName">
                                            Father's Name</label>
                                        <input id="FatherName" class="form-control" placeholder="Father Name" name="Father Name" type="text" value="" autofocus="" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="MotherName">
                                            Mother's Name</label>
                                        <input id="MotherName" class="form-control" placeholder="Mother Name" name="Mother Name" type="text" value="" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            Gender</label>
                                        <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                            <option value="Select">Select</option>
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlMaritalStatus">
                                            Marital Status</label>
                                        <select class="form-control" data-val="true" data-val-number="MaritalStatus" data-val-required="Please select." id="ddlMaritalStatus" name="MaritalStatus" style="">
                                            <option value="Select">Select</option>
                                            <option value="S">Single</option>
                                            <option value="M">Married</option>

                                        </select>
                                    </div>
                                </div>

                               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="HusbandName">
                                             Husband Name (Only for Married Women)</label>
                                        <input id="HusbandName" class="form-control" placeholder="Husband Name" name="Husband Name" type="text" value="" autofocus="" readonly="readonly" />
                                    </div>
                                </div>
                                

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="padding-right:-7px;">
                                    <div class="form-group">
                                        <label class="manadatory" for="DOB">
                                            Date of Birth <%--<span style="font-size: 11px;">(As per HSC Certificate)</span>--%></label>
                                        <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" maxlength="8" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 pright0">

                                    <div class="form-group">
                                        <label for="Age">
                                            Age as on 01.01.2016</label>
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
                                        <label class="manadatory" for="MobileNo">
                                            Religion</label>

                                        <select class="form-control" data-val="true" data-val-number="Religion" data-val-required="Please select your Category" id="religion" name="Religion">
                                            <option value="Select Religion">Select</option>
                                            <option value="Hndu">Hindu</option>
                                            <option value="Mslm">Islam</option>
                                            <option value="Jnsm">Jain</option>
                                            <option value="Skhsm">Sikh</option>
                                            <option value="Crstn">Christian</option>
                                            <option value="Crstn">Other's</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="category">
                                            Category</label>
                                        <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="category" name="Category">
                                            <option value="Select Category">Select</option>
                                            <option value="Gnrl">General</option>
                                            <option value="SC">SC</option>
                                            <option value="ST">ST</option>
                                            <%--<option value="SEBC">SEBC</option>--%>
                                            <option value="OBC">OBC</option>
                                        </select>
                                    </div>
                                </div>

                                   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Nationality">
                                            Nationality</label>
                                        <select class="form-control" data-val="true" data-val-number="Nationality" readonly="true" id="nationality" name="Nationality">

                                            <option value="SC">Indian</option>
                                        </select>
                                    </div>
                                </div>

                                


                               

                              <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label for="EmailID">
                                            Email ID</label>
                                        <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50" autofocus="" style="" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="MobileNo">
                                            Mobile No</label><%--onblur="return MobileNoValidation();"--%>
                                        <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile No." onkeypress="return isNumberKey(event); " type="text" value="" autocomplete="off" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="" for="phoneno">
                                            Telelphone <span style="font-size: 11px;">(with STD Code)</span></label>
                                        <div class="col-xs-4 pleft0" style="padding-right:3px !important;">
                                            <input id="stdcode" class="form-control" placeholder="STD Code" name="Std" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />
                                        </div>
                                        <div class="col-xs-8 pright0 pleft0">
                                            <input id="phoneno" class="form-control" placeholder="Telephone No." name="Telephone No." value="" maxlength="10" onkeypress="return isNumberKey(event);" autofocus="" />
                                        </div>

                                    </div>
                                </div>
                                <div class="clearfix"></div>
                               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlPhsclHdicpd">
                                            Physically Handicapped</label>
                                        <select class="form-control" data-val="true" data-val-number="Handicapped" data-val-required="Please select" id="ddlPhsclHdicpd" name="Handicapped" style="">
                                            <option value="Select">Select</option>
                                            <option value="Y">Yes</option>
                                            <option value="N">No</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlBPL">
                                            Are You a BPL Card Holder</label>
                                        <select class="form-control" data-val="true" data-val-number="BPL" data-val-required="Please select gender." id="ddlBPL" name="BPLNo." style="">
                                            <option value="Select">Select</option>
                                            <option value="Y">Yes</option>
                                            <option value="N">No</option>

                                        </select>
                                    </div>
                                </div>
                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ChceCenter">
                                            Choice of Center</label>

                                        <select class="form-control" data-val="true" data-val-number="Center" data-val-required="Please select your Center" id="ChceCenter" name="ChceCenter">
                                            <option value="Select Center">Select</option>
                                            <option value="Agrtla">Agartala</option>
                                            <option value="Klkta">Kolkata</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Height">
                                            Height (in cm)</label>
                                        
                                            <input id="height" class="form-control" placeholder="Height in cm" name="height" value="" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" />

                                        
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Weight">
                                            Weight (in Kg.)</label>
                                        <input id="weight" class="form-control" placeholder="Weight in kg" name="Weight" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        
                                        <label class="manadatory" for="UnexpndChest">
                                            Unexpaned / Expanded Chest (in cm)</label>
                                        <div class="col-xs-6 pleft0 pright0"> <input id="unexpdchest" class="form-control" placeholder="Unexpanded" name="Unexpdchest" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" /></div>
                                        <div class="col-xs-6 pright0" style="padding-left:2px;"><input id="expdchest" class="form-control" placeholder="Expanded" name="Expdchest" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" /></div>
                                       

                                    </div>
                                </div>

                                <%--<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ExpndChest">
                                            Expanded Chest (in cm)</label>
                                        <input id="expdchest" class="form-control" placeholder="Expanded Chest in cm" name="Expdchest" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />


                                    </div>
                                </div>--%>
                              
                                <div class="col-xs-12" style="display: none">
                                    

                                </div>

                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>

                    <div id="" class="col-md-3 p0">
                        <div id="divPhoto" class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">Applicant Photograph
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0" style="">
                                <div class="alert alert-info col-xs-12 col-sm-6 col-md-12 col-lg-12" style="display: none">
                                    Please, upload your recent pasport size photograph size between 200 to 250 pixels.
                                </div>



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
                                <h4 class="box-title manadatory">Applicant Signature
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0" style="">
                                <div class="col-lg-12">
                                    <img class="form-control" src="img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
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
                            <h4 class="box-title">Permanent Address
                            </h4>
                        </div>

                        <div class="box-body box-body-open">
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="AddressLine1">
                                            Address Line-1 (Care of)
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address1$AddressLine1" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="AddressLine2">
                                            Address Line-2 (Building)
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address1$AddressLine2" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="RoadStreetName">
                                            Road/Street Name
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address1$RoadStreetName" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="LandMark">
                                            Landmark
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address1$LandMark" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Locality">
                                            Locality
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address1$Locality" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlState">
                                            State
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
                                            District
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
                                            Block/Taluka
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
                                            Panchayat/Village/City
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
                                            Pincode
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
                            <h4 class="box-title">Present Address <span style="font-size: 13px;">(For correspondence)</span>
                                <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; margin-top: -18px; padding-right: 0;">
                                    <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="fnCopyAddress();" />Same as Permanent Address</span><span class="clearfix">
                                    </span>
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="AddressLine1">
                                            Address Line-1 (Care of)
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$AddressLine1" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="AddressLine2">
                                            Address Line-2 (Building)
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$AddressLine2" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="RoadStreetName">
                                            Road/Street Name
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$RoadStreetName" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="LandMark">
                                            Landmark
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$LandMark" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Locality">
                                            Locality
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$Locality" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="20" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlState">
                                            State
                                        </label>
                                        <select name="ctl00$ContentPlaceHolder1$Address2$ddlState" id="CddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlDistrict">
                                            District
                                        </label>
                                        <select name="ctl00$ContentPlaceHolder1$Address2$ddlDistrict" id="CddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                            <option value="0">Select District</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlTaluka">
                                            Block/Taluka
                                        </label>
                                        <select name="ctl00$ContentPlaceHolder1$Address2$ddlTaluka" id="CddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                            <option value="0">Select Block</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory text-nowrap" for="ddlVillage">
                                            Panchayat/Village/City
                                        </label>
                                        <select name="ctl00$ContentPlaceHolder1$Address2$ddlVillage" id="CddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                            <option value="0">Select Panchayat</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">
                                            Pincode
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
                <div class="col-md-12 box-container pleft0 pright0">
                    <div class="box-heading">
                        <h4 class="box-title">Educational Qualification (From Madhayamik onwards)
                        </h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                            <div class="form-group" style="margin-bottom: 0">
                                <table style="width: 99%; margin: 5px auto;" class="table-striped table-bordered table">
                                    <tbody>
                                        <tr>
                                             <th style="width: 20%">
                                                <label class="manadatory">
                                                    Name of the Examination Passed                                                        
                                                    </label>
                                            </th>
                                            <th style="width: 15%">
                                                <label class="manadatory">
                                                    Name of the Board / University</label></th>
                                           
                                            <th style="width: 75px;">
                                                <label class="manadatory">
                                                    Year of Passing</label>
                                            </th>
                                            <th style="width: 75px;">
                                                <label class="manadatory">
                                                    Division</label>
                                            </th>
                                            
                                            <th style="width: 75px;">
                                                <label class="manadatory">
                                                    Total Marks</label></th>
                                            <th style="width: 75px;">
                                                <label class="manadatory">
                                                    Mark Secured</label></th>
                                            <th style="width: 75px;">
                                                <label class="">
                                                    Marks secured (%)</label></th>

                                             <th style="width: 110px;">
                                                <label class="">
                                                   Action</label></th>

                                        </tr>
                                        <tr>
                                             <td>
                                                <input id="txtExmntnName" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" value="" autofocus="" />

                                            </td>
                                            <td>
                                                <select name="ddlBoard" id="ddlBoard" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                    <option value="0">List of Board</option>
                                                    <option value="120">Tripura Board of  Secondary Education, Gurkha Basti, Kunjaban Asartala-799006</option>
                                                    <option value="108">Nagaland Board of Secondary, Education Kohima - 797001</option>
                                                    <option value="101">Board of Secondary Education, Manipur, Imphal - 795001</option>
                                                    <option value="100">Meghalaya Board of School Education, Tura - 794001</option>
                                                    <option value="109">Punjab School Education Board, S.A.S. Nagar, Phase-8, Mohali-160059</option>
                                                    <option value="122">Board of Secondary Education, Haryana, Bhiwani, Pin-127021</option>
                                                    <option value="112">Himachal Pradesh Board of School Education Dharamsala, Kangra-176700</option>
                                                    <option value="104">Goa Board of Secondary & Higher Secondary Education, Alltobetim, Beralez, Goa-403521</option>
                                                    <option value="114">Board of Secondary Education, Andhra Pradesh, Hyderabad-500001</option>
                                                    <option value="119">West Bangal Board of Secondary Education, 77/2, Park Street, Kolkata-700016</option>
                                                    <option value="111">Board of Secondary Education, Rajasthan, Jaipur Road, Ajmer-305001</option>
                                                    <option value="113">Jammu & Kashmir State Board of School Education, Srinagar, Jammu, Lalmandi, Srinagar, Rehari Colony, Jammu-180005</option>
                                                    <option value="102">Bihar School Examniation Board, Patna-800001</option>
                                                    <option value="126">U.P.Board of High School & International Education Allahabad-211001</option>
                                                    <option value="121">Mizoram Borad of School Education, Aizwal-796012</option>
                                                    <option value="110">Board of Secondary Education, Guwahati, Assam-781019</option>
                                                    <option value="106">Maharashtra Board of Secondary & Higher Secondary Education, Shivaji Nagar, Pune-411004</option>
                                                    <option value="117">Sri Jagannath Sanskrit Universty, Shree Vihar, Puri</option>
                                                    <option value="129">Kerala Board of Public Examinations, Pooja Pura, Thiruvananthpuram-695012</option>
                                                    <option value="130">Borad of  Secondary Education, Madhya Pradesh, Bhopal-462011</option>
                                                    <option value="107">Board of Secondary Education, Odisha, Cuttack-01 (Year 2001 & Onwards)</option>
                                                    <option value="128">Jharkhand Academic Council, Ranchi-834010</option>
                                                    <option value="116">Orrissa State Board of Madrass Education, BBSR</option>
                                                    <option value="125">Chhatisgarh Board of Secondary Education, Raipur</option>
                                                    <option value="118">Gujarat Secondary & Higher Secondary Education Board, Gandhi Nagar, Gujarat-382043</option>
                                                    <option value="127">Karnataka Secondary Education Board, Malleswaram, Banglore-560003</option>
                                                    <option value="103">Tamilnadu State Board of School Examination, College Road, Chennai-600006</option>
                                                    <option value="123">Board of  Secondary Education, Sikkim, Gangtok </option>
                                                    <option value="105">Central Board of Secondary Education, 02-Community Centre, Shaiksha Kendra, Preet Vihar, Delhi-110301</option>
                                                    <option value="150">Council for the Indian School Certification Examinations, Pragati House, 3rd Floor 47/48 Nehru Place, New Delhi-110505</option>
                                                    <option value="151">National Institute of open Schooling, A-24-25, Institutional Area, NH-24, Sector-12, Nodia-201309(U.P)</option>
                                                    <option value="152">West Bengal Council of Rabindra Open Schooling, Bikash Bhavan, East Block, Salt Lake, Kolkata-700091</option>
                                                    <option value="153">Andhra Pradesh Open School Society(APOSS) Under the Govt. Of Andhra Pradesh School Education Dept. Hyderabad</option>
                                                    <option value="154">Bhutan Board of Examination, Ministry of Education, Thimpu, Bhutan</option>
                                                    <option value="155">Ministry of Education & Sports, Nepal</option>
                                                    <option value="156">Others</option>
                                                </select></td>
                                           
                                            <td>

                                                <input id="txtPssngYr" class="form-control" placeholder="YYYY" name="txtPssngYr" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />

                                            </td>
                                           
                                             <td>
                                                <input id="txtDivision" class="form-control" placeholder="Division" name="txtDivision" type="text" value="" autofocus="" maxlength="2" onkeypress="return isNumberKey(event); " />
                                            </td>

                                            <td>
                                                <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />
                                            </td>


                                            <td>
                                                <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />
                                            </td>
                                            <td>
                                                <input id="txtPercentage" class="form-control" name="txtPrcntge" type="text" value="" readonly="true" />
                                            </td>
                                            <td>
                                              <div class="pull-left"> <button  type="button" class="btn btn-success" value="add" style="margin-right:2px;">ADD</button> </div>
                                                <button type="button" class="btn btn-info" value="edit">EDIT</button> 
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                                <table style="width: 99%; margin: 5px auto;"  class="table-striped table-bordered table">
                                    <tbody>
                                        <tr>
                                             <th colspan="4" style="text-align:left;" >
                                               
                                                Name of optional papers / subjects in abbreviated form (as mentioned in respective service rules.</th>
                                        </tr>
                                        <tr>
                                          <th style="background-color:#fff !important;"><input id="txtSubjt1" class="form-control" placeholder="Mention Subject" name="txtSubjt1" type="text" value="" autofocus="" /></th>
                                          <th style="background-color:#fff !important;"><input id="txtSubjt2" class="form-control" placeholder="Mention Subject" name="txtSubjt2" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " /></th>
                                          <th style="background-color:#fff !important;"><input id="txtSubjt3" class="form-control" placeholder="Mention Subject" name="txtSubjt3" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " /></th>
                                          <th style="background-color:#fff !important;"><input id="txtSubjt4" class="form-control" placeholder="Mention Subject" name="txtSubjt4" type="text" value="" autofocus="" maxlength="2" onkeypress="return isNumberKey(event); " /></th>
                                        </tr>
                                        <tr>
                                          <th colspan="4" style="text-align:left;">Whether opted for Bengali Composition & Translation (0R) Alternative English<br/>
                                          <span> (For TCS / TPS Grade-II and other examination)</span></th>
                                        </tr>
                                        <tr>
                                          <th colspan="4" style="background-color:#fff !important;"><input id="OptdBngliorEng" class="form-control" placeholder="Please mention here" name="OptdBngliorEng" type="text" style="width:50%;" value="" autofocus="" /></th>
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
                <div class="col-md-12 box-container pleft0 pright0">
                    <div class="box-heading">
                        <h4 class="box-title pleft0">Other Information
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0 ">
                                        <p><span class="dplyflex manadatory"><span class="fom-Numbx">1.</span> Whether the Candidate Currently Employed?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio1" id="yes" value="yes" onclick="return fuShowHideDiv('subdiv_vsble', 1);" />Yes
                                            <label for="yes"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio1" id="no" value="no" onclick="return fuShowHideDiv('subdiv_vsble', 0);" />
                                            No
                                            <label for="no"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div id="subdiv_vsble" class="form-group">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Whether NOC Enclosed.</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio1" id="NOCEncldyes" value="yes" />Yes
                                            <label for="yes"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio1" id="NOCEncldno" value="no" />
                                            No
                                            <label for="no"></label>

                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                                                       
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">2.</span> Whether the Candidate Ex-Serviceman?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">

                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio3" id="exarmyyes" value="yes" onclick="return fuShowHideDiv('exsrvmn', 1);" />
                                            Yes
                                            <label for="exarmyyes"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio3" id="exarmyno" value="no" onclick="return fuShowHideDiv('exsrvmn', 0);" />
                                            No
                                            <label for="exarmyno"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="clearfix"></div>
                            <div id="exsrvmn">
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Qualifying Service Rendered in war service.</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                From
                                        <input id="txtRndDrtinstrt" class="form-control" name="txtRndDrtinstrt" type="text" placeholder="DD/MM/YY" value="" autofocus="" />

                                            </div>
                                            <div class="col-xs-6 pleft0 pright0">
                                                To
                                                <input id="txtRndDrtinend" class="form-control" name="txtRndDrtinend" type="text" placeholder="DD/MM/YY" value="" autofocus="" />

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>No.of service years</p>
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
                                        <p><span><span class="fom-Numbx">3.</span> Whether the candidate want any relxaxation in Height?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio4a" id="sptprsnYes" value="yes" onclick="return fuShowHideDiv('sptprtptd', 1);" />
                                            Yes
                                            <label for="exarmy"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio4a" id="sptprsnNo" value="no" onclick="return fuShowHideDiv('sptprtptd', 0);" />
                                            No
                                            <label for="sptprsn"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="clearfix"></div>

                            <div id="sptprtptd">
                                

                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>If yes, reason</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0 mbtm10">
                                            
                                            
                                            <div class="col-xs-12 pright0 pleft0">
                                                    <input id="txtRlxtoninhght" class="form-control" name="txtRlxtoninhght" type="text" value="" autofocus="" placeholder="Reason"/>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="clearfix"></div>
                            
                            <div class="clearfix"></div>


                            <div class="form-group mtop5" style="display: none">

                                <div class="col-lg-12 othrinfohd">
                                    <p><span><span class="fom-Numbx">6.</span> Registration No., Date and Name of Employment Exchange</span></p>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Registration No. & Date</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-7 pright0 pleft0">
                                        </div>
                                        <div class="col-xs-5 pright0">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Name of Employment Exchange</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">

                                        <div class="col-xs-12 pright0 pleft0">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">4.</span> Have you ever debarred / disqualified by the U.P.S.C / State P.S.Cs from appearing at its examination / selection?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio9" id="rdoCrmYes" value="yes" onclick="return fuShowHideDiv('hvngcrmnlcse', 1);" />Yes
                                            <label for="CrmnlInvlv"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio9" id="rdoCrmNo" value="no" onclick="return fuShowHideDiv('hvngcrmnlcse', 0);" />
                                            No
                                            <label for="NtCrmnlInvlv"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="hvngcrmnlcse">
                                
                                    <div class="form-group">
                                         <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>If yes, give details</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-12 pright0 pleft0">
                                                    <input id="txtdbrdfrmexmntion" class="form-control" name="txtdbrdfrmexmntion" type="text" value="" autofocus="" placeholder="Please mention here" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                  
                               
                            </div>

                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>

            <%---Start of Declaration----%>
            <div class="row">
                <div class="col-md-12 box-container" id="Div2">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Declaration
                        </h4>
                    </div>
                   <uc1:tpscdeclaration runat="server" ID="TPSCDeclaration"  ClientIDMode="Static"/>
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
                        
                    </div>
                </div>
                <div class="clearfix">
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
</asp:Content>
