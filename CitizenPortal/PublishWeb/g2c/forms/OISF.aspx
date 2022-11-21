<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="OISF.aspx.cs" Inherits="CitizenPortal.g2c.forms.OISF" %>

<%@ Register Src="~/WebApp/Control/OISFDeclaration.ascx" TagPrefix="uc1" TagName="OISFDeclaration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<%--    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    
    <script src="/Scripts/angular.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />--%>
    <%--<script src="/PortalScripts/ServiceLanguage.js"></script>--%>
    <%--<link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />--%>

    <%--<script src="../../../Scripts/angular.min.js"></script>--%>
    <%--<script src="../Script/CitizenProfile.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="../Script/RegisterMobile.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=Guid.NewGuid()%>"></script>--%>

   <%-- <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>--%>


    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <%--<script src="/PortalScripts/ServiceLanguage.js"></script>--%>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>

    <script src="/g2c/Scripts/OISF.js"></script>

    <link href="../css/style.admin.css" rel="stylesheet" />
    <style>
        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            font-size:22px;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        function fnClose() {
            $('#divLogin').hide();
        }
        function fnShowLogin() {
            $('#divLogin').show();
        }

        $(document).ready(function () {
            debugger;

            $('#Age').attr("readonly", true);
            //$('#DOB').datepicker({
            //    dateFormat: "dd/mm/yy",
            //    changeMonth: true,
            //    changeYear: true,
            //    maxDate: '-1d',
            //    yearRange: "-150:+0",
            //    onSelect: function (date) {

            //        var t_DOB = $("#DOB").val();

            //        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            //        var selectedYear = S_date.getFullYear(); // selected year

            //        var Age = calage(date);
            //        $('#Age').val(Age);
            //        //if (Age < 18) {
            //        //    $('#DOB').val('');
            //        //    alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
            //        //    $('#Age').val('');
            //        //    return false;
            //        //} else if (Age > 125) {
            //        //    $('#Age').val('');
            //        //    alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 125 years.');
            //        //    $('#Age').val('');
            //        //    return false;
            //        //}
            //    }
            //});



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



    </script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server" ClientIDMode="Static">
    <div id="page-wrapper" style="min-height: 311px;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>



        <div id="divCitizenProfile">
            <div>
                <h2 class="form-heading">
                  <i class="fa fa-pencil-square-o"></i>Application Form for Recruitment for Constable in 9<sup>th</sup> Indian Reserve Batalion (Specialised)
                    <span class="pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i></span>
                </h2>
            </div>
            <div class="row" style="display: block;">
                   
                                    <div class="col-xs-12" style="margin-top: 10px;"  id="chklist" >
                                        <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10" id="divCredential" style="    line-height: 22px; padding-bottom: 0px;">
                                        
                                        <span style="font-weight: bold; margin-bottom: 5px; font-size:18px; line-height:22px;">Check List:</span><br>
                                        <span>1. Self attested photo copy of HSC Certificate.<br/>
                                            2. Self attested photo copy of HSC Mark Sheets.
                                            <br/>
                                            3. Application Fees Rs.150/- in shape of Bank Draft / Postal Order (Original) (Not applicable for SC/ST Candidate).<br/>
                                            4. Application Form Rs.35/- in shape of Bank Draft / Poster Order (Original) and its receipt. <br/>
                                            5. Self attested photo copy of Caste Certificate. (for SC / ST / SEBC Category).<br/>
                                            6. Self attested photo copy of Employment Exchange Certificate. <br/>    
                                            7. Passport Colour Photographs - 3 nos. (self attestation).   <br/>
                                            8. Other documents, if any.<br/>                 
                                        </span>
                                        <br/>
                                       
                                        
                                        
                                    </div>
                                        
                                    </div>

                                
                </div>
            <div class="mt20">

                <div class="row" style="background-color: #fbfbfb; border: 1px solid #ebebeb; display: block; padding: 10px; margin: 0">

                    <div class="row">

                        <div id="divPhoto" class="col-md-3 box-container">
                            <div class="box-heading">
                                <h4 class="box-title' ng-binding">Applicant Photograph
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="alert alert-info col-xs-12 col-sm-6 col-md-12 col-lg-12" style="display: none">
                                    Please, upload your recent pasport size photograph size between 200 to 250 pixels.
                                </div>



                                <div class="col-lg-12">
                                    <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="photocustomer" style="height: 220px" id="myImg" />
                                    <input class="camera" id="File1" name="Photoupload" type="file" />
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>


                        <div id="divDetails" class="col-md-9 box-container mTop15 pleft0">
                            <div class="box-heading" id="Div4">
                                <h4 class="box-title ng-binding">Applicant Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">


                                <div class="box-body box-body-open">
                                     <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7 pright0">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="firstname">
                                                Name of the Candidate</label>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input id="FirstName" class="form-control" placeholder="First Name" name="
                                                    First Name"
                                                    type="text" value="" autofocus="" />
                                            </div>
                                            <div class="col-xs-4 pright0">
                                                <input id="MiddleName" class="form-control" placeholder="Middle Name" name="Middle Name" type="text" value="" autofocus="" />
                                            </div>
                                            <div class="col-xs-4 pright0">
                                                <input id="LastName" class="form-control" placeholder="Last Name" name="Last Name" type="text" value="" autofocus="" />
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="FatherName">
                                                Father's Name</label>
                                            <input id="FatherName" class="form-control" placeholder="Father Name" name="Father Name" type="text" value="" autofocus="" />
                                        </div>
                                    </div>




                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 pright0">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="DOB">
                                                Date of Birth (As per HSC Certificate)</label>
                                          <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" maxlength="8" autofocus=""  />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 pright0">

                                        <div class="form-group">
                                            <label class="ng-binding" for="Age">
                                                Age as on 01.01.2016</label>
                                            <div class="col-xs-5 pleft0 pright0 mtop17">
                                                <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" value="" maxlength="3" autofocus="" readonly="readonly" />
                                            </div>
                                            <div class="col-xs-4 pleft0 pright0 mtop17">
                                                <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" value="" maxlength="3" autofocus="" readonly="readonly" />
                                            </div>
                                            <div class="col-xs-3 pleft0 mtop17">
                                                <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" value="" maxlength="3" autofocus="" readonly="readonly" />
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pright0 pleft0">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="ddlGender">
                                                Gender</label>
                                            <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="margin-top:20px;">
                                                <!-- <option value="Select Gender">Select Gender</option>-->
                                                <option value="M">Male</option>
                                                <!--<option value="F">Female</option>-->
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                        <div class="form-group">
                                            <label class="ng-binding" for="EmailID">
                                                Email ID</label>
                                            <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50" autofocus="" style="margin-top:20px;" />
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="MobileNo">
                                                Religion</label>

                                            <select class="form-control" data-val="true" data-val-number="Religion" data-val-required="Please select your Category" id="religion" name="Religion">
                                                <!--<option value="Select Category">Select</option>-->
                                                <option value="Hndu">Hindu</option>
                                                <option value="Mslm">Islam</option>
                                                <option value="Jnsm">Jain</option>
                                                <option value="Skhsm">Sikh</option>
                                                <option value="Crstn">Christian</option>
                                                </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="category">
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



                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="MobileNo">
                                                Nationality</label>
                                            <select class="form-control" data-val="true" data-val-number="Nationality" data-val-required="Please select your Category" id="nationality" name="Nationality">
                                                <!--<option value="Select Category">Select</option>-->
                                                <option value="SC">Indian</option>
                                                <!--<option value="ST">Others</option>-->
                                            </select>
                                        </div>
                                    </div>




                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        Mobile No  <span style="color:red;">*</span>
                                        <label class="sr-only" for="exampleInputAmount">
                                            + 91</label>
                                        <div class="form-group mtop5">
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    + 91
                                                </div>
                                                <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" onblur="return MobileNoValidation();" onkeypress="return onlyNumbers(event); " type="text" value="" autocomplete="off" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="" for="phoneno">
                                                Telelphone</label>
                                            <div class="col-xs-4 pleft0">
                                                <input id="stdcode" class="form-control" placeholder="STD Code" name="Std" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />
                                            </div>
                                            <div class="col-xs-8 pright0 pleft0">
                                                <input id="phoneno" class="form-control" placeholder="Telephone No." name="Telephone No." value="" maxlength="10" onkeypress="return isNumberKey(event);" autofocus="" />
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7 pright0">
                                        <div class="form-group">
                                            <label class="" for="phoneno">
                                                Physical Standard</label>
                                            <div class="col-xs-3 pleft0">
                                                <input id="height" class="form-control" placeholder="Height in cm" name="height" value="" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" />
                                            </div>
                                            <div class="col-xs-3 pleft0">
                                                <input id="weight" class="form-control" placeholder="Weight in kg" name="Weight" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />
                                            </div>

                                            <div class="col-xs-3 pleft0">
                                                <input id="unexpdchest" class="form-control" placeholder="Unexpanded Chest in cm" name="Unexpdchest" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />
                                            </div>

                                            <div class="col-xs-3 pleft0 pright0">
                                                <input id="expdchest" class="form-control" placeholder="Expanded Chest in cm" name="Expdchest" value="" maxlength="5" onkeypress="return isNumberKey(event);" autofocus="" />
                                            </div>

                                        </div>
                                    </div>

                                   <%-- <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                        <div class="form-group">
                                            <label class="" for="phoneno">
                                                UID/Aadhaar No.</label>
                                            
                                                <input id="uidno" class="form-control" placeholder="UID/Aadhaar NO" name="uid" value="" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" />
                                           
                                            </div>
                                    </div>--%>


                                    <div class="col-xs-12">
                                        <p><i class="fa fa-info-circle pright5" style="color: #000;"></i>SC,ST SEBC candidates should attach self attested copy of respective Caste Certificate.<span style="color: red;">*</span></p>

                                    </div>

                                    <div class="clearfix">
                                    </div>
                                </div>

                                
                                <div class="clearfix">
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
                                            <label class="manadatory ng-binding" for="AddressLine1">
                                                Address Line-1 (Care of)
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address1$AddressLine1" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="ng-binding" for="AddressLine2">
                                                Address Line-2 (Building)
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address1$AddressLine2" type="text" id="PAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="RoadStreetName">
                                                Road/Street Name
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address1$RoadStreetName" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="ng-binding" for="LandMark">
                                                Landmark
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address1$LandMark" type="text" id="PLandMark" class="form-control" placeholder="Landmark" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="Locality">
                                                Locality
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address1$Locality" type="text" id="PLocality" class="form-control" placeholder="Locality" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="ddlState">
                                                State
                                            </label>
                                            <select name="ctl00$ContentPlaceHolder1$Address1$ddlState" id="PddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">                                                
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="ddlDistrict">
                                                District
                                            </label>
                                            <select name="ctl00$ContentPlaceHolder1$Address1$ddlDistrict" id="PddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                            <option value="0">Select District</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="ddlTaluka">
                                                Block/Taluka
                                            </label>
                                            <select name="ctl00$ContentPlaceHolder1$Address1$ddlTaluka" id="PddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                                <option value="0">Select Block</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory text-nowrap ng-binding" for="ddlVillage">
                                                Panchayat/Village/City
                                            </label>
                                            <select name="ctl00$ContentPlaceHolder1$Address1$ddlVillage" id="PddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                                <option value="0">Select Panchayat</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="PIN">
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
                                <h4 class="box-title">Present Address <br />
                                    (For correspondence)
                                    <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; margin-top: -10px;">
                                        <input id="chkAddress" type="checkbox" style="vertical-align:bottom;" onclick="fnCopyAddress();" />Same as Permanent Address</span><span class="clearfix">
                                        </span>
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="AddressLine1">
                                                Address Line-1 (Care of)
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address2$AddressLine1" type="text" id="CAddressLine1" class="form-control" placeholder="First Line Address" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="ng-binding" for="AddressLine2">
                                                Address Line-2 (Building)
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address2$AddressLine2" type="text" id="CAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="RoadStreetName">
                                                Road/Street Name
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address2$RoadStreetName" type="text" id="CRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="ng-binding" for="LandMark">
                                                Landmark
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address2$LandMark" type="text" id="CLandMark" class="form-control" placeholder="Landmark" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="Locality">
                                                Locality
                                            </label>
                                            <input name="ctl00$ContentPlaceHolder1$Address2$Locality" type="text" id="CLocality" class="form-control" placeholder="Locality" maxlength="20" autofocus="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="ddlState">
                                                State
                                            </label>
                                            <select name="ctl00$ContentPlaceHolder1$Address2$ddlState" id="CddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">                                               
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="ddlDistrict">
                                                District
                                            </label>
                                            <select name="ctl00$ContentPlaceHolder1$Address2$ddlDistrict" id="CddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">                                              
                                            <option value="0">Select District</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="ddlTaluka">
                                                Block/Taluka
                                            </label>
                                            <select name="ctl00$ContentPlaceHolder1$Address2$ddlTaluka" id="CddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block.">
                                                <option value="0">Select Block</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory text-nowrap ng-binding" for="ddlVillage">
                                                Panchayat/Village/City
                                            </label>
                                            <select name="ctl00$ContentPlaceHolder1$Address2$ddlVillage" id="CddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                                <option value="0">Select Panchayat</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory ng-binding" for="PIN">
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
                            <h4 class="box-title register-num">Educational Qualification upto HSC:
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div id="divmore" class="form-group error" style="display: none;">
                                </div>
                                <div id="divSuspect">
                                </div>
                                <div class="form-group">
                                    <table style="width: 100%" class="table table-striped table-bordered">
                                        <tbody>
                                            <tr>
                                                <th style="text-align: center; width: 10%;">State</th>
                                                <th style="text-align: center; width: 15%;">
                                                    <label class="manadatory" for="txtAccused">
                                                        Name of the Examination Passed
                                                        <br />
                                                        (HSC & Equivalent)</label>
                                                </th>
                                                <th style="text-align: center; width: 12%;">
                                                    <label for="txtAddress">
                                                        Year of Passing</label>
                                                </th>
                                                <th style="text-align: center; width: 14%;">
                                                    <label for="txtContact">
                                                        Name of the Board/Council</label>
                                                </th>
                                                <th style="text-align: center; width: 8%;">
                                                    <label class="" for="txtRemark">
                                                        Division</label>
                                                </th>
                                                <th style="text-align: center; width: 8%;">Total Marks</th>
                                                <th style="text-align: center; width: 8%;">Mark Secured</th>
                                                <th style="text-align: center; width: 8%;">Percentage of Marks secured</th>
                                                <th style="text-align: center; width: 8%;">Action</th>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <select name="EddlBoardState" id="EddlBoardState" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select State.">                                                        
                                                    </select></td>
                                                <td style="width: 25%;">
                                                    <input id="txtExmntnName" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" value="" autofocus="" />

                                                </td>
                                                <td style="">
                                                    <input id="txtPssngYr" class="form-control" placeholder="Year of Passing" name="txtPssngYr" type="text" value="" autofocus="" maxlength="10" />
                                                </td>
                                                <td style="">
                                                    <select name="ddlBoard" id="ddlBoard" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                        <option value="0">List of Board</option>
                                                        <option value="108">Nagaland Board of Secondary, Education Kohima - 797001</option>
                                                        <option value="101">Board of Secondary Education, Manipur, Imphal - 795001</option>
                                                        <option value="100">Meghalaya Board of School Education, Tura - 794001</option>
                                                        <option value="109">Punjab School Education Board, S.A.S. Nagar, Phase-8, Mohali-160059</option>
                                                        <option value="122">Board of Secondary Education, Haryana, Bhiwani, Pin-127021</option>
                                                        <option value="112">Himachal Pradesh Board of School Education Dharamsala, Kangra-176700</option>
                                                        <option value="104">Goa Board of Secondary & Higher Secondary Education, Alltobetim, Beralez, Goa-403521</option>
                                                        <option value="114">Board of Secondary Education, Andhra Pradesh, Hyderabad-500001</option>
                                                        <option value="120">Tripura Board of  Secondary Education, Gurkha Basti, Kunjaban Asartala-799006</option>
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

                                                    </select>

                                                </td>
                                                <td style="">
                                                    <input id="txtDivision" class="form-control" placeholder="Division" name="txtTDivision" type="text" value="" autofocus="" />
                                                </td>
                                                <td>
                                                    <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" value="" autofocus="" />
                                                </td>
                                                <td align="center">
                                                    <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" value="" autofocus="" />
                                                </td>
                                                <td align="center">
                                                    <input id="txtPercentage" class="form-control" placeholder="%" name="txtPrcntge" type="text" value="" autofocus="" />
                                                </td>
                                                <td>
                                                    <div class="col-xs-6 pleft0" style="margin-left: -10px;">
                                                        <input id="btnAdd" type="button" value="Add" onclick="AddEducation('');" class="btn btn-success" />
                                                    </div>
                                                    <div class="col-xs-6 pleft0">
                                                        <input id="btnRemove" type="button" value="Remove" onclick="DeleteEducation('');" class="btn btn-danger" />
                                                    </div>
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

                    <div class="col-md-12 box-container pleft0 pright0">
                        <div class="box-heading">
                            <h4 class="box-title register-num pleft0">Other Information
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div id="divmore" class="form-group error" style="display: none;">
                                </div>
                                <div id="divSuspect">
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p><b><span class="fom-Numbx">1.</span> Has the Candidate passed Odia as one of the subject in HSC Examination or an examination in Odia language equivalent to M.E. Standard recognised or conducted by the School and Mass Education Department of Odisha. (photo copy with self attestation should be enclosed)</b></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio1" id="yes" value="yes" onclick="return fuShowHideDiv('subdiv_vsble', 1);"/>Yes
                                            <label for="yes"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio1" id="no" value="no" onclick ="return fuShowHideDiv('subdiv_vsble', 0);"/>
                                                No
                                            <label for="no"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>

                                <div id="subdiv_vsble" class="form-group">
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Ability to Odia langugae</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-4 pleft0" style="white-space: nowrap;">
                                                <input type="checkbox" name="readOdiya" id="readOdiya" />Read
                                    <label for="checkbox"></label>

                                            </div>
                                            <div class="col-xs-4" style="white-space: nowrap;">
                                                <input type="checkbox" name="writeOdiya" id="writeOdiya" />Write
                                            <label for="checkbox"></label>

                                            </div>
                                            <div class="col-xs-4" style="white-space: nowrap;">
                                                <input type="checkbox" name="spkOdiya" id="spkOdiya" />Speak
  <label for="checkbox"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>

                                <div class="form-group mtop5">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p><b><span class="fom-Numbx">2.</span> Whether the candidate is married?</b></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio2" id="Mrd" value="yes" onclick="return fuShowHideDiv('cndtemrd', 1);" />Yes
                                            <label for="Mrd"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio2" id="UnMrd" value="no" onclick ="return fuShowHideDiv('cndtemrd', 0);" />
                                                No
                                            <label for="UnMrd"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div id="cndtemrd" class="form-group">
                                    <div class="col-lg-12 othrinfosubhd">
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
                                            <p><b><span class="fom-Numbx">3.</span> Whether the Candidate Ex-Serviceman?</b></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">

                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio3" id="exarmyyes" value="yes" onclick="return fuShowHideDiv('exsrvmn', 1);" />
                                                Yes
                                            <label for="exarmyyes"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio3" id="exarmyno" value="no" onclick ="return fuShowHideDiv('exsrvmn', 0);" />
                                                No
                                            <label for="exarmyno"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="clearfix"></div>
                                <div id="exsrvmn">
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd">
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
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>No.of service years</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-5 pleft0 pright0">
                                                <input id="SevsYear" class="form-control mtop0" placeholder="Year" name="SevsYear" value="" maxlength="3" autofocus="" readonly="readonly" />

                                            </div>
                                            <div class="col-xs-4  pright0">
                                                <input id="SevsMonth" class="form-control mtop0" placeholder="Month" name="SevsMonth" value="" maxlength="3" autofocus="" readonly="readonly"/>
                                            </div>
                                            <div class="col-xs-3  pright0">
                                                <input id="SevsDay" class="form-control mtop0" placeholder="Day" name="SevsDay" value="" maxlength="3" autofocus="" readonly="readonly" />

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                    </div>
                                <div class="clearfix"></div>
                                <div class="form-group mtop5">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p><b><span class="fom-Numbx">4.</span> Whether the candidate is a Sports Person ?</b></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio4a" id="sptprsnYes" value="yes" onclick="return fuShowHideDiv('sptprtptd', 1);"/>
                                                Yes
                                            <label for="exarmy"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio4a" id="sptprsnNo" value="no" onclick ="return fuShowHideDiv('sptprtptd', 0);" />
                                                No
                                            <label for="sptprsn"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="clearfix"></div>

                                <div id="sptprtptd">
                               <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Please Select Sports Participated</p>
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
                                <div class="form-group mtop5">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Please Mention the Sports Federation or Association Name.</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pleft0">
                                                <input id="txtOthrsport" class="form-control" name="txtOthrsport" type="text" value="" autofocus=""/>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Whether he wants to avail relaxation in height, weight & chest.</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio4c" id="wntavlrlxon" value="want relaxation" />
                                                Yes
                                            <label for="wntavlrlxon"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio4c" id="dntavlrlxon" value="Not want relaxation"  />
                                                No
                                            <label for="dntavlrlxon"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    
                                <div class="clearfix"></div>
                                
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Physical Standards of Measurements</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0 mbtm10">
                                            <div class="col-xs-4 pleft0 pright0">
                                                Height
                                                <select name="ddlRxlstnhgt" id="ddlRxlstnhgt" class="form-control" data-val="true" data-val-number="Board" data-val-required="">
                                                    <option value="0">Select</option>
                                                    <option value="400">1 cm</option>
                                                    <option value="401">2 cm</option>
                                                    <option value="402">3 cm</option>
                                                </select>


                                            </div>
                                            <div class="col-xs-4 pleft1 pright0">
                                                Chest
                                                <select name="ddlRxlstnchst" id="ddlRxlstnchst" class="form-control" data-val="true" data-val-number="Board" data-val-required="">
                                                    <option value="0">Select</option>
                                                    <option value="403">1 cm</option>
                                                    <option value="404">2 cm</option>

                                                </select>

                                            </div>
                                            <div class="col-xs-4 pleft1 pright0">
                                                Weight
                                                <select name="ddlRxlstnwght" id="ddlRxlstnwght" class="form-control" data-val="true" data-val-number="Board" data-val-required="">
                                                    <option value="0">Select</option>
                                                    <option value="405">1 kg</option>
                                                    <option value="406">2 kg</option>
                                                    <option value="407">3 kg</option>
                                                    <option value="408">4 kg</option>
                                                    <option value="409">5 kg</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    </div>
                                    
                                <div class="clearfix"></div>
                                <div class="form-group mtop5">
                                    <div class="col-lg-12 othrinfohd">
                                        <p><b><span class="fom-Numbx">5.</span> If Sports Person (candidate only indicate one sports event participatedin Open National Championship / International Championship and the same should be recognised and sponsored either by the recognised National Sports Federations / Associations or Indian Olympic Association, Odisha State Sports Association, Affiliated to the recognised National Sports Federation / Association)</b></p>
                                    </div>
                                </div>
                                <div class="form-group mt10">
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft10 ptop5">(A) Participated in Sports Event</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pleft0 pright0">
                                                <select name="ddlSports2" id="ddlSports2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                    <option value="0">List of Sports</option>
                                                    <option value="227">Athletics</option>
                                                    <option value="228">Archery</option>
                                                    <option value="229">Badminton</option>
                                                    <option value="230">Basket Ball</option>
                                                    <option value="231">Boxing</option>
                                                    <option value="232">Cricket</option>
                                                    <option value="233">Cycling</option>
                                                    <option value="234">Equestrian</option>
                                                    <option value="235">Football</option>
                                                    <option value="236">Gymnastics</option>
                                                    <option value="237">Hockey</option>
                                                    <option value="238">Judo</option>
                                                    <option value="239">Kabaddi</option>
                                                    <option value="240">Karate Do</option>
                                                    <option value="241">Kayaking &amp; Canoeing</option>
                                                    <option value="242">Lawn Tennis</option>
                                                    <option value="243">Power Lifting</option>
                                                    <option value="244">Rowing</option>
                                                    <option value="245">Shooting</option>
                                                    <option value="246">Swimming</option>
                                                    <option value="247">Table Tennis</option>
                                                    <option value="248">Tae Kwon Do</option>
                                                    <option value="249">Volleyball</option>
                                                    <option value="250">Weight Lifting</option>
                                                    <option value="251">Wrestling</option>
                                                </select>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="form-group mtop10">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft10">(B) In which Sports and Category (National / International)</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio5b" id="Plyntonal" value="yes" />National
                                            <label for="Plyntonal"></label>

                                            </div>
                                            <div class="col-xs-6" style="white-space: nowrap">
                                                <input type="radio" name="radio5b" id="Plyintrnal" value="no" />
                                                International
                                            <label for="Plyintrnal"></label>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 mtop5 pleft0">
                                            <p class="pleft10">(C) Awarded any Medal (Gold/Silver/Bronze) Appreciation ( 1<sup>st</sup> / 2<sup>nd</sup> / 3<sup>rd</sup> )</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-4 pright0 pleft0">
                                                <input type="radio" name="radio5C" id="GldMdl" value="yes" />Gold /1st
                                            <label for="GldMdl"></label>

                                            </div>
                                            <div class="col-xs-4 pright0 pleft0" style="white-space: nowrap">
                                                <input type="radio" name="radio5C" id="SlvrMdl" value="no" />
                                                Silver / 2nd
                                            <label for="SlvrMdl"></label>

                                            </div>
                                            <div class="col-xs-4 pright0 pleft0" style="white-space: nowrap">
                                                <input type="radio" name="radio5C" id="BrnzMdl" value="no" />
                                                Bronze / 3rd
                                            <label for="BrnzMdl"></label>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group mtop5">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p><b><span class="fom-Numbx">6.</span>  Whether the candidate possess NCC Certificate? If possess NCC Certificate</b></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0"> 
                                                <input type="radio" name="radio6" id="HsCerfte" value="yes" onclick="return fuShowHideDiv('ncccrtfcte', 1);" />Yes
                                            <label for="HsCerfte"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio6" id="NtHvgCerfte" value="no" onclick ="return fuShowHideDiv('ncccrtfcte', 0);" />No
                                            <label for="NtHvgCerfte"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div id="ncccrtfcte">
                               <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Category of NCC Certificate</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-4 pleft0">
                                                <input type="radio" name="radio6A" id="radio6AA" value="ACrtfte" />
                                                A
                                            <label for="ACrtfte"></label>

                                            </div>
                                            <div class="col-xs-4 pright0">
                                                <input type="radio" name="radio6A" id="radio6AB" value="BCrtfte" />
                                                B
                                            <label for="BCrtfte"></label>

                                            </div>
                                            <div class="col-xs-4 pright0">
                                                <input type="radio" name="radio6A" id="radio6AC" value="CCrtfte" />
                                                C
                                            <label for="CCrtfte"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    </div>
                                <div class="clearfix"></div>
                                
                               
                                    <div class="form-group mtop5">

                                    <div class="col-lg-12 othrinfohd">
                                        <p><b><span class="fom-Numbx">7.</span> Registration No., Date and Name of Employment Exchange</b></p>
                                    </div>
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Registration No. & Date</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-7 pright0 pleft0">
                                                <input id="txtRegNo" class="form-control" name="txtRegNo" placeholder="Registration No." type="text" value="" autofocus="" />

                                            </div>
                                            <div class="col-xs-5 pright0">
                                                <input id="txtRegdte" class="form-control" name="txtRegdte" type="text" placeholder="DD/MM/YY" value="" autofocus="" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Name of Employment Exchange</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">

                                            <div class="col-xs-12 pright0 pleft0">
                                                <input id="txtNmeEmpEx" class="form-control" name="txtNmeEmpEx" placeholder="Employment Ex.Name" type="text" value="" autofocus="" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    
                                <div class="clearfix"></div>

                                <div class="form-group mtop5">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p><b><span class="fom-Numbx">8.</span> Whether the candidate possess a Driving licenses having the validity for at least 1 year (Excluding the learning period) ?</b></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio8" id="rdoDLYes" value="yes" onclick="return fuShowHideDiv('hvngdl', 1);" />Yes
                                            <label for="HsCerfte"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio8" id="rdoDLNo" value="no" onclick ="return fuShowHideDiv('hvngdl', 0);" />
                                                No
                                            <label for="NtHvgCerfte"></label>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div id="hvngdl">
                              <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9">
                                            <p class="pleft10">(A) Whether the license is applicable for Heavy Vehicle or light vehicle (photo copy of such license with self attestation should be enclosed).</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0" style="white-space: nowrap">
                                                <input type="radio" name="radio8A" id="hvyVeh" value="yes" />Heavy Vehicle
                                            <label for="HsCerfte"></label>

                                            </div>
                                            <div class="col-xs-6" style="white-space: nowrap">
                                                <input type="radio" name="radio8A" id="lgtVeh" value="no" />
                                                Light Vehicle
                                            <label for="NtHvgCerfte"></label>

                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5">(B) Licenses No. and Date.</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-7 pright0 pleft0">
                                                <input id="txtLicenseNo" class="form-control" name="txtLcseNo" placeholder="License No" type="text" value="" autofocus="" />

                                            </div>
                                            <div class="col-xs-5 pright0">
                                                <input id="txtLicenseDate" class="form-control" name="txtLcsedte" placeholder="DD/MM/YY" type="text" value="" autofocus="" />

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5">(C) Name of the RTO Office from which license issued</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <input id="txtLicenseOffice" class="form-control" name="txtLcseIss" type="text" value="" autofocus="" />

                                            </div>

                                        </div>
                                    </div>


                                </div>
                                    </div>
                                <div class="clearfix"></div>
                                <div class="form-group mtop5">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p><b><span class="fom-Numbx">9.</span> Whether the candidate involved in any criminal case?</b></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio9" id="rdoCrmYes" value="yes" onclick="return fuShowHideDiv('hvngcrmnlcse', 1);" />Yes
                                            <label for="CrmnlInvlv"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio9" id="rdoCrmNo" value="no" onclick ="return fuShowHideDiv('hvngcrmnlcse', 0);" />
                                                No
                                            <label for="NtCrmnlInvlv"></label>

                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                <div id="hvngcrmnlcse">
                                <div class="form-group">
                                   <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>(If yes, the details of the criminal case and / or the details arrest be provided.)</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio9A" id="radio9AA" value="yes" />Accuted
                                            <label for="Actd"></label>

                                            </div>
                                            <div class="col-xs-6" style="white-space: nowrap">
                                                <input type="radio" name="radio9A" id="radio9AB" value="no" />
                                                Convicted
                                            <label for="Cnvtd"></label>

                                            </div>
                                        </div>

                                    </div>
                                   <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Police Station Case Reference No.</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <input id="txtCriminalRefNo" class="form-control" name="txtCrmnlRcd" type="text" value="" autofocus="" />

                                            </div>

                                        </div>
                                    </div>
                                   <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Name of the District</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <select name="ddlArrestDistrict" id="ddlArrestDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                </select>

                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>Police Station Name</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <input id="txtPoliceStationNo" class="form-control" name="txtPlcestonNo" type="text" value="" autofocus="" />

                                            </div>

                                        </div>
                                    </div>
                                   <div class="col-lg-12 othrinfosubhd">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27 ptop5"><i class="fa fa-arrow-right pright5"></i>IPC Section</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-12 pright0 pleft0">
                                                <input id="txtIPCSection" class="form-control" name="txtIpcscton" type="text" value="" autofocus="" />

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                    </div>

                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        <uc1:OISFDeclaration runat="server" ID="OISFDeclaration" />
                        
                    </div>
                </div>



                <div id="divBtn" class="row">
                    <div class="col-md-12 box-container" style="margin-top:5px;">
                        <div class="box-body box-body-open" style="text-align: center;">

                            <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" />
                            <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Cancel" id="btnCancel" class="btn btn-danger" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>


                </div>
                <!--<div class="row">
                             <div class="col-md-12 pbottom15">
                                 <div class="form-group">
                               (1) Self attested photo copy of HSC Certificate.
                               (2) Self attested photo copy of HSC Mark Sheets.
                               (3) Application Fees Rs.150/- in shape of Bank Draft / Postal Order (Original) (Not applicable for SC/ST Candidate).
                                (4) Application Form Rs.35/- in shape of Bank Draft / Poster Order (Original) and its receipt.
                               (5) Self attested photo copy of Caste Certificate. (for SC / ST / SEBC Category)
                               (6) Self attested photo copy of Employment Exchange Certificate.
                               (7) Passport Colour Photographs - 3 nos. (self attestation)
                               (8) Other documents, if any.
                                     </div>
                                        </div>
                                   
                </div>-->


            </div>
        </div>
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    </div>
</asp:Content>
