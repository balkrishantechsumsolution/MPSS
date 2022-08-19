<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" CodeBehind="CharacterCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CCTNS.CharacterCertificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Common/Styles/CCTNS/jquery-2.2.3.min.js"></script>
    <script src="../../Common/Styles/CCTNS/jquery-ui-1.11.4.min.js"></script>
    <link href="../../Common/Styles/CCTNS/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../Common/Styles/CCTNS/bootstrap.min.js"></script>
    <script src="CharacterCertificate.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
    <link href="../../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Popup Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Applying For?</h3>
                </div>
                <div class="modal-body">
                    <select class="form-control" id="ddlApplicantType">
                        <option value="0">Please Select...</option>
                        <option value="1">Self</option>
                        <option value="2">Other</option>
                    </select>
                    <br />
                    <input id="errorMsg" type="text" hidden="hidden" value="" style="color: red; width: 100%; border: none" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="submitApplicantType(this);">Submit</button>
                </div>
            </div>
        </div>
    </div>

    <div id="page-wrapper" style="min-height: 500px !important;">

        <div class="row" id="divBirthDetails" runat="server">
            <div class="col-md-12 box-container mTop15">
                <div class="clearfix">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Character Certificate
                    </h2>
                </div>
            </div>
            <%-- Verify Beneficiary Panel--%>
            <div id="divVerify" class="col-md-12 box-container" hidden="hidden">
                <div class="box-heading">
                    <h4 class="box-title">Verify Beneficiary ID
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Applicant Name</label>
                            <input type="text" id="txtApplicantName" placeholder="Applicant Name" class="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Relation with Beneficiary</label>
                            <select class="form-control" id="ddlRelationType">
                                <option value="0">-Select Relation-</option>
                                <option value="Father">Father</option>
                                <option value="Mother">Mother</option>
                                <option value="Brother">Brother</option>
                                <option value="Sister">Sister</option>
                                <option value="Husband">Husband</option>
                                <option value="Wife">Wife</option>
                                <option value="Guardian">Guardian</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Beneficiary Identification Type</label>
                            <select class="form-control" id="ddlIdentificationType">
                                <option value="0">Select Identification Type</option>
                                <option value="1">Aadhaar Card (UIDAI)</option>
                                <option value="2">Arms License</option>
                                <option value="3">Driving License</option>
                                <option value="4">Income Tax (Pan Card)</option>
                                <option value="5">Passport</option>
                                <option value="6">Ration Card</option>
                                <option value="7">Voter ID Card</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Identification No.</label>
                            <input type="text" id="txtIdentificationNumber" placeholder="Enter your Identification Number" class="form-control" maxlength="12" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <input type="button" id="btnverify" class="btn btn-primary" value="Verify Identification No." />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <%-- Beneficiary Details Panel--%>
            <div id="divBenifeciryDtl">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Beneficiary Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Beneficiary Full Name</label>
                                <input type="text" id="txtFirstName" class="form-control" placeholder="Full Name" name="FirstName" autofocus="" maxlength="50" onkeypress="return ValidateAlpha(event); " />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Mother's Name</label>
                                <input id="txtMotherName" class="form-control" placeholder="Mother's Name" name="Mother Name" type="text" value="" autofocus="" maxlength="50" onkeypress="return ValidateAlpha(event); " />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="">
                                    Father Name
                                </label>
                                <input id="txtFatherName" class="form-control" placeholder="Father's Name" name="Father Name" type="text" value="" autofocus="" maxlength="40" onkeypress="return ValidateAlpha(event);" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="">
                                    DOB
                                </label>
                                <input id="txtDOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" maxlength="12" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label for="Age">
                                    Age</label>
                                <input id="txtAge" class="form-control" placeholder="Year" name="Year" value="" maxlength="3" autofocus="" readonly="readonly" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="">
                                    Gender
                                </label>
                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                    <option value="0">--Select Gender--</option>
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                    <option value="T">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="">
                                    Mobile No.
                                </label>
                                <input id="txtMobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return onlyNumbers(event);" type="text" value="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="">
                                    Phone Number
                                </label>
                                <input id="txtphoneno" class="form-control" placeholder="Alternate Mobile Number" name="Alternate Mobile Number" value="" maxlength="10" onkeypress="return onlyNumbers(event);" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="">
                                    Nationality
                                </label>
                                <input id="txtnationality" class="form-control" name="Nationality" placeholder="Nationality" type="text" value="Indian" onkeypress="return ValidateAlpha(event); " autocomplete="" readonly="readonly" />

                                <%--<select class="form-control" data-val="true" data-val-number="Nationality" id="txtnationality" name="Nationality" readonly="readonly">
                                        <option selected="selected" value="Indian">Indian</option>
                                    </select>--%>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="" class="manadatory">
                                    EmailID
                                </label>
                                <input id="txtEmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" autofocus="" style="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2 pright0">
                            <div class="form-group">
                                <label>Visible Identification Mark</label>
                                <input type="text" id="txtIdentificationMark" class="form-control" placeholder="Identification Mark" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Height(in cm)</label>
                                <input type="text" id="txtHeigt" class="form-control" maxlength="3" placeholder="Height" onkeypress="return onlyNumbers(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Weight(in kg)</label>
                                <input type="text" id="txtWeight" class="form-control" maxlength="3" placeholder="Weight" onkeypress="return onlyNumbers(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Active In Politics?</label>
                                <%--<select class="form-control">
                                    <option value="Select">Select</option>
                                    <option value="Yes" id="chkIsActiveInPoliticsYes">Yes</option>
                                    <option value="No" id="chkIsActiveInPoliticsNo">No</option>
                                </select>--%>
                                <input type="radio" id="chkIsActiveInPoliticsYes" name="ActiveInPolitics" value="Yes" />
                                Yes &nbsp;&nbsp;
                                <input type="radio" id="chkIsActiveInPoliticsNo" name="ActiveInPolitics" value="No" checked="checked" />
                                No
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <%--Address Panel Details--%>
            <div id="divAddress">
                <div class="col-md-6 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Permanent Address</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="AddressLine1">
                                        AddressLine1(care of)
                                    </label>
                                    <input type="text" id="txtAddressLine1" class="form-control" placeholder="First Line Address" maxlength="50" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                AddressLine2 (Building)
                                        <div class="form-group">
                                            <label for="AddressLine2">
                                            </label>
                                            <input type="text" id="txtAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="50" autofocus="" />
                                        </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="RoadStreetName">
                                        Road/StreetName
                                    </label>
                                    <input type="text" id="txtRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="50" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="LandMark">
                                        LandMark
                                    </label>
                                    <input type="text" id="txtLandMark" class="form-control" placeholder="Landmark" maxlength="50" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="Locality">
                                        Locality
                                    </label>
                                    <input type="text" id="txtLocality" class="form-control" placeholder="Locality" maxlength="50" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlState">
                                        State
                                    </label>
                                    <select name="" id="ddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                        <option value="0">-Select State-</option>
                                    </select>
                                    <input id="txtState" style="display: none" class="form-control" placeholder="Enter State Name" name="txtState" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDistrict">
                                        District
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="District."
                                        data-val-required="Please select District." id="ddlDistrict" name="District">
                                        <option value="0">-Select District-</option>
                                    </select>
                                    <input id="txtDistrict" style="display: none" class="form-control" placeholder="Enter District Name" name="txtDistrict" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">
                                        Taluka
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="Taluka."
                                        data-val-required="Please select gender." id="ddlBlockTaluka" name="Taluka">
                                        <option value="0">-Select Taluka-</option>
                                    </select>
                                    <input id="txtBlock" style="display: none" class="form-control" placeholder="Enter Block Name" name="txtBlock" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label>
                                        Village
                                    </label>
                                    <select id="ddlPanchayatVillageCity" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                        <option value="0">-Select Village-</option>
                                    </select>
                                    <input id="txtPanchayat" style="display: none" class="form-control" placeholder="Enter Panchayat Name" name="txtPanchayat" type="text" value="" autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="PIN">
                                        PIN
                                    </label>
                                    <input type="text" id="txtPincode" class="form-control" placeholder="Pin" maxlength="6" autofocus="" onkeypress="return onlyNumbers(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="year">
                                        Stay Duration in Year
                                    </label>
                                    <input type="text" id="txtStayYear" class="form-control" placeholder="Years" maxlength="6" autofocus="" onkeypress="return onlyNumbers(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" hidden="hidden">
                                <div class="form-group">
                                    <label class="manadatory" for="month">
                                        Month
                                    </label>
                                    <input type="text" id="txtStayMonth" value="0" class="form-control" placeholder="Month" maxlength="6" autofocus="" onkeypress="return onlyNumbers(event);" />
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
                        <h4 class="box-title">Present Address <span style="font-size: 13px; padding-right: 0">(For correspondence)</span> <span style="font-size: 13px; padding-right: 0"></span>
                            <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                                <input id="chkIsSameAddrsYes" type="checkbox" style="vertical-align: bottom;" />Same as Permanent Address</span><span class="clearfix">
                                </span>
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="txtPAddressLine1">
                                    AddressLine1(care of)
                                </label>
                                <input type="text" id="txtPAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="txtPAddressLine2">
                                    AddressLine2(Building)
                                </label>
                                <input type="text" id="txtPAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="txtPRoadStreetName">
                                    Road/StreetName
                                </label>
                                <input type="text" id="txtPRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="txtPLandMark">
                                    LandMark
                                </label>
                                <input type="text" id="txtPLandMark" class="form-control" placeholder="Landmark" maxlength="40" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="txtPLocality">
                                    Locality
                                </label>
                                <input type="text" id="txtPLocality" class="form-control" placeholder="Locality" maxlength="40" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="ddlPState">
                                    State
                                </label>
                                <select id="ddlPState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                    <option value="0">-Select State-</option>
                                </select>
                                <input id="txtPState" style="display: none" class="form-control" placeholder="Enter State Name" name="txtState" type="text" value=""
                                    autofocus />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="ddlPDistrict">
                                    District
                                </label>
                                <select id="ddlPDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                    <option value="0">-Select District-</option>
                                </select>
                                <input id="txtPDistrict" style="display: none" class="form-control" placeholder="Current District" name="Current District" value="" maxlength="30" autofocus="" style="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Taluka
                                </label>
                                <select id="ddlPBlockTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                    <option value="0">-Select Taluka-</option>
                                </select>
                                <input id="txtPBlockTaluka" style="display: none" class="form-control" placeholder="Current Block" name="Current Block" value="" maxlength="30" autofocus="" style="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label>
                                    Village
                                </label>
                                <select id="ddlPPanchayatVillageCity" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select panchayat">
                                    <option value="0">-Select Village-</option>
                                </select>
                                <input id="txtPPanchayatVillageCity" style="display: none" class="form-control" placeholder="Current Panchayat" name="Current Panchayat" value="" maxlength="30" autofocus="" style="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="txtPPincode">
                                    PIN
                                </label>
                                <input type="text" id="txtPPincode" class="form-control" onchange="return PresentPinCode();" placeholder="Pin" maxlength="6" onkeypress="return onlyNumbers(event);" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="txtPPincode">
                                    Stay Duration in Year
                                </label>
                                <input type="text" id="txtPStayYear" class="form-control" placeholder="Year" maxlength="6" onkeypress="return onlyNumbers(event);" autofocus="" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" hidden="hidden">
                            <div class="form-group">
                                <label class="manadatory" for="txtPPincode">
                                    Month
                                </label>
                                <input type="text" id="txtPStayMonth" value="0" class="form-control" placeholder="Month" maxlength="6" onkeypress="return onlyNumbers(event);" autofocus="" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <%--Qualification Panel--%>
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Do you have any Qualification?
                        <span class="col-md-2 pull-right">
                            <input type="radio" id="chkIsHaveQualificationYes" name="HaveQualification" value="Yes" onclick="return fuShowHideDiv('QualificationDtl', 1);" />
                            Yes&nbsp;&nbsp;
                                <input type="radio" id="chkIsHaveQualificationNo" name="HaveQualification" value="No" checked="checked" onclick="return fuShowHideDiv('QualificationDtl', 0);" />
                            No</span>
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12" id="QualificationDtl">
                        <div class="form-group error" id="divmore" runat="server" style="display: none;">
                        </div>
                        <div id="divSuspect">
                        </div>
                        <div class="form-group">
                            <table id="tblItem" style="width: 100%" class="table table-striped table-bordered">
                                <tbody>
                                    <tr id="thadd">
                                        <th id="thtxtColName" style="text-align: center;">
                                            <label class="manadatory" for="txtAccused">
                                                Name Of School/Collage</label>
                                        </th>
                                        <th id="thtxtExam" style="text-align: center;">
                                            <label class="manadatory" for="txtAddress">
                                                Exam Passed</label>
                                        </th>
                                        <th id="thtxtYear" style="text-align: center;">
                                            <label class="manadatory" for="txtAddress">
                                                Year</label>
                                        </th>
                                        <th style="text-align: center; width: 100px;">Action</th>
                                    </tr>
                                    <tr>
                                        <td style="width: 47.5%;">
                                            <input id="txtColName" class="form-control" placeholder=" Name of College/University" name="txtColName" type="text" onkeypress="return ValidateAlpha(event);"
                                                autofocus />
                                        </td>
                                        <td style="width: 27%;">
                                            <input id="txtExam" class="form-control" placeholder="Name Of Exam" name="txtExam" type="text"
                                                autofocus />
                                        </td>
                                        <td style="width: 14%;">
                                            <input id="txtYear" class="form-control" placeholder="Passing/Current Year" name="txtYear" type="text" maxlength="4"
                                                onkeypress="return onlyNumbers(event);"
                                                autofocus />
                                        </td>
                                        <td align="center">
                                            <input id="btnAdd" type="button" value="Add" onclick="AddSuspect('');" class="btn btn-success" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <%--
                    <input type="text" id="txtQualification" />
            --%>
            <%-- Occupation Panel--%>
            <div class="col-md-12 box-container">

                <div class="box-heading">
                    <h4 class="box-title">Are your working?
                        <span class="col-md-2 pull-right">
                            <input type="radio" id="chkIsOccupationYes" name="Isworking" value="Yes" onclick="return fuShowHideDiv('OccupationDtl', 1);" />
                            Yes&nbsp;&nbsp;
                                <input type="radio" id="chkIsOccupationNo" name="Isworking" value="No" checked="checked" onclick="return fuShowHideDiv('OccupationDtl', 0);" />
                            No</span>
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div id="OccupationDtl">
                        <div class="form-group">
                            <h4 class="pleft15">(Current Company Details)</h4>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                            <div class="form-group">
                                <label>Company Name</label>
                                <input type="text" id="txtCompanyName" class="form-control" placeholder="Company Name" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                            <div class="form-group">
                                <label>Company Address</label>
                                <input type="text" id="txtCompanyAddrs" class="form-control" placeholder="Company Address" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                            <div class="form-group">
                                <label>Company Contact Number</label>
                                <input type="text" id="txtCompanyPhone" class="form-control" placeholder="Company Phone Number"
                                    maxlength="10" onkeypress="return onlyNumbers(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                            <div class="form-group">
                                <label>Designation</label>
                                <input type="text" id="txtDesig" class="form-control" placeholder="Designation" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                            <div class="form-group">
                                <label>Joining Date</label>
                                <input type="text" id="txtJoingDate" class="form-control" placeholder="Joining Date" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
            <%-- Additional Details Panel--%>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Additional Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Purpose for applying this service</label>
                            <input type="text" id="txtPerposeOfApply" placeholder="Perpose Of Apply" maxlength="100" onkeypress="return ValidateAlpha(event);" class="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Mode of Receiving</label>
                            <select class="form-control" id="ddlModeOfRecieving">
                                <option value="0">Select Mode</option>
                                <option value="By Post">By Post</option>
                                <option value="In Person">In Person</option>
                                <option value="Online">Online</option>
                                <option value="BY Fax(Fascimile)">By Fax (Fascimile)</option>
                                <option value="Others">Others</option>
                            </select>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <%--Police Station Detail Panel--%>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Police Station Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">District</label>
                            <select class="form-control" id="ddlLocalPoliceStationDisct">
                                <option value="0">-Select Police Station Distc-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Local Police Station</label>
                            <select class="form-control" id="ddlLocalPoliceStation">
                                <option value="0">-Select Police Station-</option>
                                <%--<option value="1">Angul Police Station</option>
                                    <option value="2">Athamallik Police Station</option>
                                    <option value="3">Banarpal Police Station</option>
                                    <option value="4">Bantala Police Station</option>
                                    <option value="5">Bikrampur Police Station</option>
                                    <option value="6">Chhendipada Police Station</option>
                                    <option value="7">Colliery Police Station</option>
                                    <option value="8">Handapa Police Station</option>
                                    <option value="9">Jarapada Police Station</option>
                                    <option value="10">Kaniha Police Station</option>--%>
                            </select>
                            <input class="form-control" type="text" id="txtLocalPoliceStation" placeholder="Local Police Station" visible="false" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                        <div class="form-group">
                            <h4 class="manadatory">Do you have any criminal record or any proceeding against you or your family in any part of country?</h4>
                            <input type="radio" id="chkIsCriminalRecordYes" name="CriminalRecord" value="Yes" />
                            Yes&nbsp;&nbsp;
                               <input type="radio" id="chkIsCriminalRecordNo" name="CriminalRecord" value="No" checked="checked" />
                            No
                        </div>
                    </div>
                    <div id="HveCriminalRecord">
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                            <div class="form-group">
                                <h4 class="manadatory">If Yes, Provide Details</h4>
                                <input type="text" aria-multiline="true" id="txtCriminalRecordDetail" maxlength="500" class="form-control" placeholder="Criminal Record Detail" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>


            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Declaration
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12">
                        <span id="divPassMI" style="display: inline;">
                            <input type="checkbox" id="chkIsCorrectInfo" /></span>
                        <h4 class="manadatory" style="display: inline;">All the information provided in form is true.</h4>
                    </div>

                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <h4 class="manadatory">Place</h4>
                            <input type="text" id="txtPlace" class="form-control" placeholder="Place" />
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2 col-md-push-8">
                        <div class="form-group">
                            <h4 class="manadatory">Date</h4>
                            <input type="text" id="txtDate" class="form-control" placeholder="Date" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <%---Start of Button----%>
            <div class="" id="divBtn" runat="server">
                <div class="col-md-12 box-container">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="fnNext(this);" />
                        <asp:Button runat="server" PostBackUrl="" value="Cancel" ID="btnCancel" Text="Cancel" class="btn btn-danger" />
                    
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <%---End of Button----%>
        </div>
        <input type="hidden" id="hidPremises" value="0" />
        <input type="hidden" id='hdfSuspect' />
        <input type="hidden" id='hdfSuspectSave' />
        <input type="hidden" id='hdfSuspectString' />
        <asp:HiddenField ID="HFUIDData" runat="server" />
        <asp:HiddenField ID="HFServiceID" runat="server" />
        <asp:HiddenField ID="hidApplicentPhoto" runat="server" />
        <asp:HiddenField ID="hidApplicentName" runat="server" />
</asp:Content>


