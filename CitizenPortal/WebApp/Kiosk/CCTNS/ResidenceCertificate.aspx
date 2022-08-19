<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="ResidenceCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CCTNS.ResidenceCertificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Common/Styles/CCTNS/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../../Common/Styles/CCTNS/jquery-ui-1.11.4.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.msgBox.js"></script>
    <script src="../../Common/Styles/CCTNS/bootstrap.min.js" type="text/javascript"></script>
    <script src="ResidenceCertificate.js" type="text/javascript"></script>

    <link href="../../Common/Styles/CCTNS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Common/Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />

    <style type="text/css">
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <div class="row">
                    <div class="col-md-12">                     
                        <div id="divRegNo">
                            <div class="clearfix">
                                <h2 class="form-heading"><i class="fa fa-pencil-square-o fa-fw"></i>Residence Certificate
                                </h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Instructions</h4>
                        </div>
                        <div class="box-body box-body-open">
                             <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                    <span style="font-weight: bold; font-size:14px; margin-bottom: 5px">Supporting Documents:</span><br/>
                                    <ol>
                                        <li>1). Proof of Residence - ROR</li>
                                       
                                        <li>2). Land Pass Book </li>
                                        <li>3). EPIC </li>
                                        <li>4). Any other document in support / claim.</li>
                                        </ol>
                                        <span style="color: #31708f;background-color: #d9edf7; padding:3px;">(any one of the above document is essential)</span>
                                 </div>
                               <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                    <span style="font-weight: bold; margin-bottom: 5px; font-size:14px;">Delivery Time Line:</span><br/>
                                    Estimated timelies to process the application (Expected Date of Delivery) 15days<br />
                                   <span style="color: #31708f;background-color: #d9edf7; padding:3px;">(Expected date is calculated including Holidays)</span>
                                 </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div id="divVerify" class="col-md-12 box-container" hidden="hidden">
                        <div class="box-heading">
                            <h4 class="box-title">Verify Beneficiary ID
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">Submitter Name</label>
                                            <input type="text" id="txtApplicantName" placeholder="Applicant Name" maxlength="40" class="form-control" runat="server" />
                                        </div>
                                    </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory">Relation with Applicant</label>
                                    <input type="text" id="txtRelationType" maxlength="20" placeholder="Relation Type" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory">Applicant Identification Type</label>
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
                                    <label class="manadatory">Applicant Identification No.</label>
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

                    <div class="col-lg-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Applicant Details</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Applicant Name</label>
                                    <input type="text" id="txtFirstName" placeholder="Applicant Name" maxlength="50" onkeypress="return ValidateAlpha(event); " class="form-control" />
                                    <div class="col-xs-4 pleft0" hidden="hidden"><input type="text" id="txtMiddleName" placeholder="Middle Name" class="form-control"  /></div>
                                     <div class="col-xs-4 pleft0" hidden="hidden"><input type="text" id="txtLastName" placeholder="Last Name" class="form-control" /></div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Father Name</label>
                                    <input type="text" id="txtFatherFName" placeholder="Father Name" maxlength="50" onkeypress="return ValidateAlpha(event); " class="form-control" />
                                    <div class="col-xs-4 pleft0" hidden="hidden"><input type="text" id="txtFatherMName" placeholder="Middle Name" class="form-control" /></div>
                                     <div class="col-xs-4 pleft0 pright0" hidden="hidden"><input type="text" id="txtFatherLName" placeholder="Last Name" class="form-control" /></div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Mother Name</label>
                                    <input type="text" id="txtMotherFName" placeholder="Mother Name" maxlength="50" onkeypress="return ValidateAlpha(event); " class="form-control" />
                                    <div class="col-xs-4 pleft0" hidden="hidden"><input type="text" id="txtMotherMName" placeholder="Middle Name" class="form-control" /></div>
                                     <div class="col-xs-4 pleft0 pright0" hidden="hidden"><input type="text" id="txtMotherLName" placeholder="Last Name" class="form-control" /></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                           
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="DOB">
                                        Date of Birth <span style="font-size: 11px;"></span>
                                    </label>
                                    <input id="txtDOB" class="form-control" placeholder="DOB" name="DOB" value="" autofocus="" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="12" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                                <div class="form-group">
                                    <label class="manadatory" for="Age">
                                        Age</label>
                                        <input id="txtAge" class="form-control mtop0" placeholder="Year" name="Year" value="" maxlength="3" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">Gender</label>
                                    <select id="ddlGender" class="form-control">
                                        <option value="0">Select</option>
                                        <option value="M">Male</option>
                                        <option value="F">Female</option>
                                        <option value="T">Transgender</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-5">
                                <div class="form-group">
                                    <label class="manadatory">Email ID</label>
                                    <input type="text" id="txtEmailID" placeholder="Email Id" maxlength="40" class="form-control" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            
                             <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">Mobile Number</label>
                                    <input type="text" id="txtMobileNo" placeholder="Mobile Number" maxlength="10" onkeypress="return onlyNumbers(event);" class="form-control" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                                <div class="form-group">
                                   <label>Std Code</label>
                                    <input type="text" id="txtStdCode" placeholder="Std Code" maxlength="5" onkeypress="return onlyNumbers(event);" class="form-control" />
                            </div>
                                </div>

                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                <label>Phone</label>
                                    <input type="text" id="txtPhone" placeholder="Phone Number" maxlength="10" onkeypress="return onlyNumbers(event);" class="form-control" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-7">
                                <div class="form-group">
                                    <label  class="manadatory">Purpose for Apply</label>
                                    <input type="text" id="txtApplyPurpose" placeholder="Purpose for Apply" maxlength="100"  class="form-control" />
                                </div>
                            </div>
                             <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">Marital Status</label>
                                    <select id="ddlMaritalStatus" name="MaritalStatus" class="form-control">
                                                <option value="">--Select--</option>
                                                <option value="1">UnMarried</option>
                                                <option value="2">Married</option>
                                                <option value="3">Widow / Widower</option>
                                                <option value="4">Divorced</option>
                                                <option value="5">Separated</option>
                                    </select>
                                </div>
                            </div>
                            <div id="SpouseDtl">
                             <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                 <div class="form-group">
                                    <label class="manadatory">Spouse Name</label>
                                     <input type="text" id="txtSpouseFName" placeholder="Spouse Name" maxlength="50" class="form-control" />
                                    <div class="col-xs-6 pleft0">
                                        
                                    </div>
                                     <div class="col-xs-4" hidden="hidden">
                                         <input type="text" id="txtSpouseMName" placeholder="Middle Name" class="form-control" />
                                    </div>
                                    <div class="col-xs-4 pright0" hidden="hidden">
                                        <input type="text" id="txtSpouseLName" placeholder="Last Name" class="form-control" />
                                    </div> 
                                 </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory">Relation with Applicant</label>
                                  <select id="ddlSpouseRelation" name="SpouseRelation" class="form-control" >
                                                         <option selected="selected" value="">-Select-</option>
                                                            <option value="1">Husband</option>
                                                            <option value="2">Wife</option>
                                                            <option value="3">Neutral</option>
                                                    </select>
                                 </div>
                              </div>
                            </div>
                           

                            <div class="clearfix"></div>
                   
                        </div>
                    </div>

                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Permanent Address</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                       <label class="manadatory" for="">Type of Area</label>
                                       <select id="ddlArea" class="form-control">
                                           <option value="0">-Select-</option>
                                           <option value="Urban">Urban</option>
                                           <option value="Rural">Rural</option>
                                       </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="AddressLine1">Address Line-1 (Care of)</label>
                                        <input type="text" id="txtAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="AddressLine2">Address Line-2 (Building)</label>
                                        <input name="" type="text" id="txtAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40"  />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="RoadStreetName">Road/Street Name</label>
                                        <input name="" type="text" id="txtRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" />
                                    </div>
                                </div>
                                
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlState">State</label>
                                        <select name="state" id="ddlState" class="form-control" disabled="disabled">
                                            <option value="">Select</option>
                                            <option value="Odisha" selected="selected">Odisha</option>
                                        </select>
                                        <input id="txtState" style="display: none" class="form-control" placeholder="Enter State Name" name="txtState" type="text" value="" autofocus ="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlDistrict">District</label>
                                        <select id="ddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." >
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtDistrict" style="display: none" class="form-control" placeholder="Enter District Name" name="txtDistrict" type="text" value="" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlSubdivision">Subdivision</label>
                                        <select id="ddlSubdivision" class="form-control"">
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtSubdivision" style="display: none" class="form-control" placeholder="Enter Subdivision Name" name="txtSubdivision" type="text" value="" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlTehsil">Tehsil</label>
                                        <select id="ddlTehsil" class="form-control"">
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtTehsil" style="display: none" class="form-control" placeholder="Enter Tehsil Name" name="txtTehsil" type="text" value="" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlRI">RI</label>
                                        <select id="ddlRI" class="form-control"">
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtRI" style="display: none" class="form-control" placeholder="Enter RI Name" name="txtRI" type="text" value="" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory">Block/Taluka</label>
                                        <select id="ddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." >
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtTaluka" style="display: none" class="form-control" placeholder="Enter Taluka Name" name="txtTaluka" type="text" value="" autofocus="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory">Panchayat/Village</label>
                                        <input id="txtVillage" class="form-control" placeholder ="Panchayat/Village/City" maxlength="40"/>
                                    </div>
                                </div>
                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label for="PostOffice">GP/ULB</label>
                                        <input name="" type="text" id="txtPGPULB" class="form-control" placeholder="GP/ULB" maxlength="40"/>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="PoliceStation">Police Station</label>
                                        <input name="" type="text" id="txtPoliceStation" class="form-control" placeholder="Police Station" maxlength="40"/>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label for="PostOffice">Post Office</label>
                                        <input name="" type="text" id="txtPostOffice" class="form-control" placeholder="Post Office" maxlength="40"/>
                                    </div>
                                </div>
                                 <%--<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label for="PostOffice">GP/ULB</label>
                                        <input name="" type="text" id="PGPULB" class="form-control" placeholder="" maxlength="6"/>
                                    </div>
                                </div>--%>
                                <%--<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="PoliceStation">Police Station</label>
                                        <input name="" type="text" id="PPoliceStation" class="form-control" placeholder="Police Station" maxlength="40" onchange="return checkLength(this);" />
                                    </div>
                                </div>--%>
                                <%--<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label for="PostOffice">Post Office</label>
                                        <input name="" type="text" id="PPostOffice" class="form-control" placeholder="Post Office" maxlength="6"/>
                                    </div>
                                </div>--%>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">Pin Code</label>
                                        <input name="" type="text" id="txtPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return onlyNumbers(event);"/>
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
                            <h4 class="box-title">Present Address 
                                <span style="font-size: 13px; padding-right: 0">(For correspondence)</span>
                                <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                                    <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" />Same as Permanent Address</span>
                                <san class="clearfix">
                                </san>

                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="">Type of Area</label>
                                       <select class="form-control" id="ddlCArea">
                                           <option value="0">Select</option>
                                           <option value="Urban">Urban</option>
                                           <option value="Rural">Rural</option>
                                       </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="AddressLine1">Address Line-1 (Care of)</label>
                                        <input name="" type="text" id="txtCAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40"  />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="AddressLine2">Address Line-2 (Building)</label>
                                        <input name="" type="text" id="txtCAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40"  />
                                    </div>
                                </div>
                               
                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="RoadStreetName">Road/Street Name</label>
                                        <input name="" type="text" id="txtCRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40"  />
                                    </div>
                                </div>
                               
                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlState">State</label>
                                        <select name="state" id="ddlCState" class="form-control" disabled="disabled" >
                                            <option value="">Select</option>
                                            <option selected="selected" value="Odisha">Odisha</option>
                                          </select>
                                        <input id="txtCState" style="display: none" class="form-control" placeholder="Enter State Name" name="txtCState" type="text" value=""  autofocus ="autofocus" />
                                    </div>
                                </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlDistrict">District</label>
                                        <select name="" id="ddlCDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtCDistrict" style="display: none" class="form-control" placeholder="Current District" name="Current District" value="" maxlength="30" autofocus ="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Subdivision">Subdivision</label>
                                        <select id="ddlCSubdivision" class="form-control"">
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtCSubdivision" style="display: none" class="form-control" placeholder="Current Subdivision" name="txtCSubdivision" value="" maxlength="30" autofocus ="autofocus" />
                                    </div>
                                </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Tehsil">Tehsil</label>
                                        <select id="ddlCTehsil" class="form-control"">
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtCTehsil" style="display: none" class="form-control" placeholder="Current Tehsil" name="txtCTehsil" value="" maxlength="30" autofocus ="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="RI">RI</label>
                                        <select id="ddlCRI" class="form-control"">
                                            <option value="0">-Select-</option>
                                        </select>
                                         <input id="txtCRI" style="display: none" class="form-control" placeholder="Current RI" name="txtCRI" value="" maxlength="30" autofocus ="autofocus" />
                                    </div>
                                </div>
                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory">Block/Taluka</label>
                                        <select id="ddlCTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                            <option value="0">-Select-</option>
                                        </select>
                                        <input id="txtCTaluka" style="display: none" class="form-control" placeholder="Current Taluka" name="txtCTaluka" value="" maxlength="30" autofocus ="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory">Panchayat/Village</label>
                                        <input id="txtCVillage" class="form-control" placeholder ="Panchayat/Village/City" maxlength="40" data-val="true" data-val-number="State." data-val-required="Please select panchayat" autofocus ="autofocus"/>
                                    </div>
                                </div>
                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label for="PostOffice">GP/ULB</label>
                                        <input name="" type="text" id="txtCPGPULB" class="form-control" placeholder="GP/ULB" autofocus ="autofocus" maxlength="40"/>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="PoliceStation">Police Station</label>
                                        <input name="" type="text" id="txtCPPoliceStation" class="form-control" placeholder="Police Station" maxlength="40" autofocus ="autofocus" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label for="PostOffice">Post Office</label>
                                        <input name="" type="text" id="txtCPPostOffice" class="form-control" placeholder="Post Office" maxlength="40" autofocus ="autofocus"/>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">Pin Code</label>
                                        <input name="" type="text" id="txtCPPinCode" class="form-control" placeholder="PIN" maxlength="6" autofocus ="autofocus" onkeypress="return onlyNumbers(event);"/>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>

                    <div id="divOtherInfo" class="col-md-12 box-container" style="">
                        <div class="box-heading">
                            <h4 class="box-title pleft0">Mandatory Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <div class="form-group">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="manadatory"><span class="fom-Numbx">1.</span>Whether the applicant is able to read,write & speak in Oriya?</p>
                                        </div>
                                        <div id="divRead" class="col-md-3 pleft0 pright0">
                                             <div class="col-xs-4 pleft0">
                                               <input type="checkbox" id="chkRead" value=""/>Read
                                                     </div>
                                                 <div class="col-xs-4">
                                               <input type="checkbox" id="chkWrite" value=""/>Write
                                                     </div>
                                                 <div class="col-xs-4 pleft0">
                                               <input type="checkbox" id="chkSpeak" value=""/>Speak
                                                     </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="mtop10"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <div class="form-group">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="manadatory"><span class="fom-Numbx">2.</span>Whether the applicant has passed Oriya up to M.E. Standard?</p>
                                        </div>
                                        <div id="divPassMI" class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="passedoriya" id="rdoPassOriyaY" value="yes" />Yes

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="passedoriya" id="rdoPassOriyaN" value="no" />
                                                No

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div class="mtop10"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <div class="form-group">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="manadatory"><span class="fom-Numbx">3.</span>For how many years the applicant is residing in the above house.</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="text" id="txtResidingDtlYear" placeholder="No of Years" maxlength="3" onkeypress="return onlyNumbers(event);" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div class="col-lg-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Land Record Details
                                <span class="col-md-5 pull-right" style="font-style: normal; font-size: 14px; text-align: right; padding-right: 0; padding-left: 0;">
                                    Is ROR Produced? &nbsp;<input type="radio" id="rdoRORY" name="reserved" value="Y"/>Yes &nbsp; <input type="radio" id="rdoRORN" name="reserved" value="N" checked="checked"/>No</span>
                            </h4>
                        </div>
                        <div id="divROR" class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">District</label>
                                    <select id="ddlrorDistr" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="mandatory">SubDivision</label>
                                    <select id="ddlrorSubDiv" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="mandatory">Tahsil</label>
                                    <select id="ddlrorTahsil" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                <div class="form-group">
                                    <label class="mandatory">RI Circle</label>
                                    <select id="ddlrorRI" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                <div class="form-group">
                                    <label>Police Station</label>
                                    <input type="text" id="txtrorPoliceStn" placeholder="Police Station" maxlength="50" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                <div class="form-group">
                                    <label>Mouza (Revenue Village)</label>
                                    <input type="text" id="txtrorVilg" placeholder="Mouza (Revenue Village)" maxlength="50" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory">Khata No</label>
                                    <input type="text" id="txtKhataNo" placeholder="Khata No" maxlength="50" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory">Recorded Tenant (Land Owner)</label>
                                    <input type="text" id="txtRecordedTenant" placeholder="Recorded Tenant" maxlength="50" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                <div class="form-group">
                                    <label>Relation with applicant (Recorded Tenant)</label>
                                    <input type="text" id="txtRecodTenantReltion" placeholder="Relation of the Applicant " maxlength="50"  class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label>Regd. Sale Deed No.</label>
                                    <input type="text" id="txtSaleDeedNo" placeholder="Sale Deed No." maxlength="11"  class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label>Regd. Sale Deed Date</label>
                                    <input type="text" id="txtSaleDeedDte" placeholder="Sale Deed Date" maxlength="11" class="form-control" />
                                </div>
                            </div>
                            <%--<div class="col-xs-12 col-sm-8 col-md-8 col-lg-5">
                                <label>For how many years the applicant is residing in the above house.</label>
                                <div class="form-group">
                                    <input type="text" id="txtResidingDtlYear" placeholder="No of Years" maxlength="3" onkeypress="return onlyNumbers(event);" class="form-control" />
                                </div>
                            </div>--%>
                            <div class="clearfix"></div>
                        </div>
                    </div>   

                    <div class="col-lg-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Plot Details</h4>
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
                                                            Plot No.</label>
                                                    </th>
                                                    <th id="thtxtExam" style="text-align: center;">
                                                        <label class="manadatory" for="txtAddress">
                                                            Area in Acre</label>
                                                    </th>
                                                    <th id="thtxtYear" style="text-align: center;">
                                                        <label class="manadatory" for="txtAddress">
                                                            Kisam</label>
                                                    </th>
                                                    <th style="text-align: center; width: 100px;">Action</th>
                                                </tr>
                                                <tr>
                                                    <td style="width: 32%;">
                                                        <input id="txtPlotNo" class="form-control" placeholder="Plot No." name="txtPlotNo" type="text"
                                                            autofocus="autofocus" />
                                                    </td>
                                                    <td style="width: 33.5%;">
                                                        <input id="txtAreaInAcer" class="form-control" placeholder="Area in Acre" name="txtAreaInAcer" type="text" 
                                                            autofocus="autofocus" onkeypress="return onlyNumbers(event);"/>
                                                    </td>
                                                    <td style="width: 22.5%;">
                                                        <input id="txtKisam" class="form-control" placeholder="Kisam" name="txtKisam" type="text"
                                                            autofocus="autofocus" />
                                                    </td>
                                                    <td style="align-items:center">
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
                </div>
            </div>
            
    <%---Start of Button----%>
            <div class="" id="divBtn" runat="server">
                <div class="col-md-12 mtop10 mb10">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext(this);" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" CssClass="btn btn-danger" Text="Cancel" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
    <%---End of Button----%>
        <input type="hidden" id="hidPremises" value="0" />
        <input type="hidden" id='hdfSuspect' />
        <input type="hidden" id='hdfSuspectSave' />
        <input type="hidden" id='hdfSuspectString' />
        <input type="hidden" id="HFUIDData"  />
        <input type="hidden" id="HFServiceID"  />
        <input type="hidden" id="hidApplicentPhoto" />
        <input type="hidden" id="hidApplicentName"  />
</asp:Content>
