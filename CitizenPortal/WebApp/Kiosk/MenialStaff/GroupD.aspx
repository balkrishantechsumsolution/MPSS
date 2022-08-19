<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="GroupD.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MenialStaff.GroupD" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/MSFDeclaration.ascx" TagPrefix="uc1" TagName="MSFDeclaration" %>
<%@ Register Src="~/WebApp/Control/PhysicalTestDeclaration.ascx" TagPrefix="uc1" TagName="PhysicalTestDeclaration" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>

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
    <script src="/WebApp/Kiosk/MenialStaff/GroupD.js"></script>
    <script type="text/javascript">
        
        
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
            width: 520px !important;
        }

        .msgBoxContent {
            width: 408px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
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
                        <span class="col-lg-10 p0"><i class="fa fa-pencil-square-o"></i>RECRUITMENT OF Group D Staff in Odisha Police
                        </span>
                        <span class="col-lg-2 p0 text-right" style="font-size: 15px;">Language :
                            <input type="button" id="btnLang" class="btn-link" value="English" runat="server" onclick="javascript: return ChangeLanguage();" /></span>
                        <span class="clearfix"></span>
                    </h2>
                </div>
                <div class="row">
                    <div class="col-md-12 box-container" id="">
                        <div class="box-heading">
                            <h4 class="box-title">Instruction to Fill the Form 
                               
                                <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;" onclick="ckhInfo();">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 15px;" title="Information"></i>Help</span><span class="clearfix"></span>
                            </h4>
                        </div>
                        <uc1:ServiceInformation runat="server" ID="ServiceInformation" />

                    </div>
                </div>

                <div class="row">
                </div>
                <div class="row">
                    <div id="" class="col-md-9 p0">
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Application Type 
                                </h4>
                            </div>
                            <div class="box-body box-body-open pbottom0">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlApplication">
                                            Applying for the Post
                                        </label>
                                        <select name="ddlApplication" id="ddlApplication" onchange="GetBatallionList();" class="form-control" data-val="true" data-val-number="Venue." data-val-required="Please select Post Applying for.">
                                            <option value="0">Select Post</option>
                                            <option value="Barber">Barber</option>
                                            <option value="Cook">Cook</option>
                                            <option value="Dhobi">Dhobi</option>
                                            <option value="Visty">Visty (Attendant)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlApplication">
                                            Applying for Battalion
                                        </label>
                                        <select name="ddlBattalion" id="ddlBattalion" class="form-control" data-val="true" data-val-number="Venue." data-val-required="Please select Post Applying for.">
                                            <option value="0">Select Battalion</option>                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Applicant Aadhaar No. (if available)
                                </h4>
                            </div>
                            <uc1:SearchRecord runat="server" ID="SearchRecord" style="padding-bottom: 0;" />
                        </div>
                        <div id="divDetails" class="col-md-12 box-container">
                            <div class="box-heading" id="Div4">
                                <h4 class="box-title">Applicant Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open" style="padding-bottom: 0;">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="firstname">
                                            Name of the Candidate</label>
                                        <input id="FirstName" class="form-control" placeholder="Enter Full Name of Applicant" name="
                                                    FirstName"
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
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="DOB">
                                            Date of Birth</label>
                                        <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" maxlength="10" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 pright0">

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
                                        <label class="manadatory" for="ddlGender">
                                            Gender</label>
                                        <select class="form-control" data-val="true" data-val-number="Gender" readonly="true" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">

                                            <option value="M">Male</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
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
                                            <option value="Budhist">Budhist</option>
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
                                            <option value="SC">SC</option>
                                            <option value="ST">ST</option>
                                            <option value="SEBC">SEBC</option>
                                            <option value="UR">UR</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="MobileNo">
                                            Nationality</label>
                                        <select class="form-control" data-val="true" data-val-number="Nationality" readonly="true" id="nationality" name="Nationality">

                                            <option value="SC">Indian</option>
                                        </select>
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
                                        <div class="col-xs-4 pleft0 pright1">
                                            <input id="stdcode" class="form-control" placeholder="STD Code" name="Std" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />
                                        </div>
                                        <div class="col-xs-8 pright0 pleft0">
                                            <input id="phoneno" class="form-control" placeholder="Telephone No." name="Telephone No." value="" maxlength="10" onkeypress="return isNumberKey(event);" autofocus="" />
                                        </div>

                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label for="EmailID">
                                            Email ID</label>
                                        <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50" autofocus="" style="" />
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
                        <div id="divPhoto" class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">Applicant Photograph
                                </h4>
                            </div>
                            <div class="box-body box-body-open" style="">
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
                            <div class="box-body box-body-open" style="">
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
                                        <input name="ctl00$ContentPlaceHolder1$Address1$AddressLine1" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="50" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="AddressLine2">
                                            Address Line-2 (Building)
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address1$AddressLine2" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="50" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="RoadStreetName">
                                            Road/Street Name
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address1$RoadStreetName" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="50" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="LandMark">
                                            Landmark
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address1$LandMark" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="50" autofocus="" />
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
                                        <input name="ctl00$ContentPlaceHolder1$Address2$AddressLine1" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="50" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="AddressLine2">
                                            Address Line-2 (Building)
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$AddressLine2" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="50" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="RoadStreetName">
                                            Road/Street Name
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$RoadStreetName" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="50" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="LandMark">
                                            Landmark
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$LandMark" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="50" autofocus="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Locality">
                                            Locality
                                        </label>
                                        <input name="ctl00$ContentPlaceHolder1$Address2$Locality" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="50" autofocus="" />
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
                        <h4 class="box-title manadatory">Educational Qualification of 7th Standard or above
                        </h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                            <div class="form-group" style="margin-bottom: 0">
                                <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                    <tbody>
                                        <tr>
                                            <th style="">
                                                <label class="manadatory">
                                                    Class/Standard                                                        
                                                </label>
                                            </th>
                                            <th style="">
                                                <label class="manadatory">
                                                    Name of the Institue / School                                                        
                                                </label>
                                            </th>
                                            <th style="">
                                                <label class="manadatory">
                                                    Address of the Institue / School                                                        
                                                </label>
                                            </th>
                                            <th style="width: 120px;">
                                                <label class="manadatory">
                                                    Year of Examination</label>
                                            </th>
                                            <th style="width: 150px;">
                                                <label class="manadatory">
                                                    Examination Result</label>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td style="width: 125px">
                                                <select name="ddlBoard" id="ddlStandard" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                    <option value="0">-Select Class/Standard-</option>
                                                    <option value="101">Class - 7th</option>
                                                    <option value="102">Class - 8th</option>
                                                    <option value="103">Class - 9th</option>
                                                    <option value="104">Class - 10th</option>
                                                </select></td>
                                            <td>
                                                <input id="txtInstitue" class="form-control" placeholder="Name of Institute / School" name="txtInstitue" type="text" value="" autofocus="" />

                                            </td>
                                            <td>
                                                <input id="txtInstituteAddress" class="form-control" placeholder="Address of the School / Institue" name="txtInstituteAddress" type="text" value="" autofocus="" /></td>
                                            <td>
                                                <select name="txtPssngYr" id="txtPssngYr" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                    <option value="0">Select Year</option>
                                                    <option value="98">1998</option>
                                                    <option value="99">1999</option>
                                                    <option value="200">2000</option>
                                                    <option value="201">2001</option>
                                                    <option value="202">2002</option>
                                                    <option value="203">2003</option>
                                                    <option value="204">2004</option>
                                                    <option value="205">2005</option>
                                                    <option value="206">2006</option>
                                                    <option value="207">2007</option>
                                                    <option value="208">2008</option>
                                                    <option value="209">2009</option>
                                                    <option value="210">2010</option>
                                                    <option value="211">2011</option>
                                                    <option value="212">2012</option>
                                                    <option value="213">2013</option>
                                                    <option value="214">2014</option>
                                                    <option value="215">2015</option>
                                                    <option value="216">2016</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="ddlBoard" id="ddlResult" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                    <option value="0">-Select Result-</option>
                                                    <option value="101">Pass</option>
                                                    <option value="102">Fail</option>
                                                    <option value="103">Compartmental</option>
                                                    <option value="104">Suplimentary</option>
                                                </select></td>
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
                <%-- Start of Employment Exchange --%>
                <div class="row">
                    <div id="" class="col-md-12 box-container">
                        <div class="box-heading" id="">
                            <h4 class="box-title manadatory">Employment Exchange Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegNo">
                                        E.Ex. Registration No.</label>
                                    <input id="txtRegNo" class="form-control" name="txtRegNo" placeholder="Employment Exchange Registration No." type="text" value="" autofocus="" />

                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegdte">
                                        E.Ex. Registration Date</label>
                                    <input id="txtRegdte" class="form-control" name="txtRegdte" type="text" placeholder="DD/MM/YY" value="" autofocus="" title="Employment Exchange Registration Date" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="EEddlDistrict">
                                        E.Ex. District</label>
                                    <select name="EEddlDistrict" id="EEddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                        <option value="0">Select District</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="form-group">
                                    <label class="manadatory" for="txtNameEmpEx">
                                        E.Ex. Registration Name</label>
                                    <select name="ddlEmploymentExchange" id="ddlEmploymentExchange" class="form-control" data-val="true" data-val-number="EmploymentExchange." data-val-required="Please Select Employment Exchange">
                                        <option value="0">Select Employment Exchange</option>
                                    </select>
                                    <%--<input id="txtNameEmpEx" class="form-control" name="txtNmeEmpEx" placeholder="Employment Ex.Name" type="text" value="" autofocus="" />--%>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <%--- End of Employment Exchange ---%>
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
                                        <p><span class="dplyflex manadatory"><span class="fom-Numbx">1.</span> Has the Candidate passed Odia as one of the subject in HSC Examination or an examination in Odia language equivalent to M.E. Standard recognised or conducted by the School and Mass Education Department of Odisha. (photo copy with self attestation should be enclosed)</span></p>
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
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Ability to Odia langugae</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-4 pleft0" style="white-space: nowrap;">
                                            <input type="checkbox" name="readOdiya" id="readOdiya" />Read
                                    <label for="checkbox"></label>

                                        </div>
                                        <div class="col-xs-4" style="white-space: nowrap;">
                                            <input type="checkbox" name="writeOdiya" id="writeOdiya" />Write<label for="checkbox"></label>

                                        </div>
                                        <div class="col-xs-4" style="white-space: nowrap;">
                                            <input type="checkbox" name="spkOdiya" id="spkOdiya" />Speak<label for="checkbox"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span class="manadatory"><span class="fom-Numbx">2.</span> Whether the candidate is married?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio2" id="Mrd" value="yes" onclick="return fuShowHideDiv('cndtemrd', 1);" />Yes
                                            <label for="Mrd"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio2" id="UnMrd" value="no" onclick="return fuShowHideDiv('cndtemrd', 0);" />
                                            No
                                            <label for="UnMrd"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="cndtemrd" class="form-group">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>If Married, whether he has more than one spouse living?</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio2a" id="LvSpse" value="yes" />Yes
                                            <label for="LvSpse"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio2a" id="NtLvSpse" value="no" />
                                            No
                                            <label for="NtLvSpse"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span class="manadatory"><span class="fom-Numbx">3.</span> Whether the Candidate Ex-Serviceman?</span></p>
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
                                            <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Qualifying Service Rendered in Defence (Duration)</p>
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

                            <div class="form-group mtop5" style="display: none">

                                <div class="col-lg-12 othrinfohd">
                                    <p><span><span class="fom-Numbx"></span>Registration No., Date and Name of Employment Exchange</span></p>
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
                            <%-- start Job Experience  --%>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span class="manadatory"><span class="fom-Numbx">4.</span> Whether the Candidate having any Job Experience?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">

                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio3" id="jobExpyes" value="yes" onclick="return fuShowHideDiv('jobExp', 1);" />
                                            Yes
                                            <label for="jobExpyes"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio3" id="jobExpyno" value="no" onclick="return fuShowHideDiv('jobExp', 0);" />
                                            No
                                            <label for="jobExpyno"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="jobExp">                                                                
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-4 pleft0">
                                            <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Detail of Work Experience</p>
                                        </div>
                                        <div class="col-md-8 pright0">
                                            <div class="col-xs-4 pleft0">
                                                Type of Orgisation
                                        <select name="ddlAcquitted" id="ddlJobType" class="form-control" data-val="true" data-val-number="Acquitted." data-val-required="Please select Acquitted">
                                            <option value="0">--Select Type of Job--</option>
                                            <option value="101">Centeral Government</option>
                                            <option value="102">State Government</option>
                                            <option value="103">Private Undertaking</option>
                                            <option value="104">Public Undertaking</option>
                                            <option value="105">Other</option>
                                        </select>
                                            </div>
                                            <div class="col-xs-4 pleft0 pright0">
                                                Name of the Organisation
                                                <input id="txtOrganisation" class="form-control" name="txtOrganisation" type="text" value="" autofocus="" placeholder="Name of the Organisation" />

                                            </div>
                                            <div class="col-xs-4 pright0">
                                                Address of the Organisation
                                                <input id="txtOrgAddress" class="form-control" name="txtOrgAddress" type="text" value="" autofocus="" placeholder="Address of the Organisation" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-4 pleft0">
                                            <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Duration of job experience</p>
                                        </div>
                                        <div class="col-md-8 pright0">
                                            <div class="col-xs-3 pleft0">
                                                From
                                        <input id="txtFromJobExp" class="form-control" name="txtFromJobExp" type="text" placeholder="DD/MM/YY" value="" autofocus="" />

                                            </div>
                                            <div class="col-xs-3 pleft0">
                                                To
                                                <input id="txtToJobExp" class="form-control" name="txtToJobExp" type="text" placeholder="DD/MM/YY" value="" autofocus="" />

                                            </div>
                                            <div class="col-md-3 pleft0 pright0">Experience (YY/MM/DD)
                                                <div class="col-xs-4 pleft0 pright0">
                                                    
                                                <input id="JobExpYear" class="form-control mtop0" placeholder="Year" name="SevsYear" value="" maxlength="2" readonly="readonly" />

                                                </div>
                                                <div class="col-xs-4 pleft0 pright0">                                                   
                                                <input id="JobExpMonth" class="form-control mtop0" placeholder="Month" name="SevsMonth" value="" maxlength="2" readonly="readonly" />
                                                </div>
                                                <div class="col-xs-4  pleft0">                                                    
                                                <input id="JobExpDay" class="form-control mtop0" placeholder="Day" name="SevsDay" value="" maxlength="2" readonly="readonly" />
                                                </div>
                                            </div>                                        
                                            <div class="col-xs-3 pleft0 pright0">
                                                Labour Licence/ESI/PF No.
                                                <input id="txtExpno" class="form-control" name="txtToJobExp" type="text" placeholder="Labour Licence/ESI/PF No." value="" autofocus="" />

                                            </div>

                                        </div>


                                    </div>                                </div>
                                <div class="clearfix"></div>
                               
                            </div>

                            <div class="clearfix"></div>

                            <div class="form-group mtop5" style="display: none">

                                <div class="col-lg-12 othrinfohd">
                                    <p><span><span class="fom-Numbx"></span>Registration No., Date and Name of Employment Exchange</span></p>
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
                            <%-- end of Job experience --%>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span class="manadatory"><span class="fom-Numbx">5.</span> Whether the candidate involved in any criminal case?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio9" id="rdoCrmYes" value="yes" onclick="return fuShowHideDiv('divCirmeCase', 1);" />Yes
                                            <label for="CrmnlInvlv"></label>

                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio9" id="rdoCrmNo" value="no" onclick="return fuShowHideDiv('divCirmeCase', 0);" />
                                            No
                                            <label for="NtCrmnlInvlv"></label>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="divCirmeCase">
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>(If yes, the details of the criminal case) Status of the Case</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <select name="ddlAcquitted" id="ddlAcquitted" class="form-control" data-val="true" data-val-number="Acquitted." data-val-required="Please select Acquitted">
                                                    <option value="0">--Select--</option>
                                                    <option value="101">Pending for Investigation</option>
                                                    <option value="102">Pending for Trail</option>
                                                    <option value="103">Acquitted</option>
                                                    <option value="104">Convicted</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>State where case is Registered</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <select name="ddlStateCC" id="ddlStateCC" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select State.">
                                                    <option value="0">Select District</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Name of the District</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <select name="ddlArrestDistrict" id="ddlArrestDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                    <option value="0">--Select District--</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Police Station Name</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <select class="form-control" data-val="true" data-val-number="PoliceStation" data-val-required="Please select Police Station" id="ddlPoliceStation" name="ddlPoliceStation">
                                                    <option value="Select Category">--Select Police Station--</option>
                                                </select>
                                                <input id="txtPoliceStation" class="form-control" name="txtPoliceStation" placeholder="Name of the Police Station" type="text" value="" autofocus="" />
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Police Station Case Reference No.</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <input id="txtCriminalRefNo" class="form-control" name="txtCriminalRefNo" type="text" value="" autofocus="" placeholder="Case Reference No." />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>IPC Section</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <input id="txtIPCSection" class="form-control" name="txtIpcscton" type="text" value="" autofocus="" placeholder="IPC Section" title="IPC Section against which the case is register" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%---Start of CrimeDetails----%>
                                <div class="row" style="display: none">
                                    <div class="col-md-12 box-container" id="">
                                        <div class="box-heading">
                                            <h4 class="box-title">Details of Criminal Case
                                            </h4>
                                        </div>
                                        <div class="box-body box-body-open">
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlStateCC">
                                                        State where case is Registered</label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="EEddlDistrict">
                                                        E.Ex. District</label>
                                                    <select name="ddlDistrictCC" id="ddlDistrictCC" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                        <option value="0">Select District</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtNmeEmpEx">
                                                        Police Station Name</label>
                                                    <select name="ddlDistrictCC" id="ddlPolice" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                        <option value="0">Select District</option>
                                                        <option value="Nlco">Nalco Township</option>
                                                        <option value="Bnrpl">Banarpal</option>
                                                        <option value="Bntala">Bantala</option>
                                                        <option value="Chndipda">Chhendipada</option>
                                                        <option value="Jrpda">Jarpada</option>
                                                        <option value="Prnakote">Purunakote</option>
                                                    </select>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtNmeEmpEx">
                                                        Case Reference No.</label>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="txtNmeEmpEx">
                                                        IPC Section</label>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <%----End of CrimeDetails-----%>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>

            <%---Start of Declaration----%>
            <div class="row">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Declaration
                        </h4>
                    </div>
                    <uc1:MSFDeclaration runat="server" ID="MSFDeclaration" ClientIDMode="Static" />
                </div>
            </div>
            <%----End of Declaration-----%>
            <%---Start of Declaration----%>
            <%--<div class="row">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Declaration for Participation in Physical Efficiency Test 
                        </h4>
                    </div>
                    <uc1:PhysicalTestDeclaration runat="server" ID="PhysicalTestDeclaration" ClientIDMode="Static" />
                </div>
            </div>--%>
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
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" />
    <asp:HiddenField ID="HFb64Sign" runat="server" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />



</asp:Content>
