<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="SeniorCitizen.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.RD.SeniorCitizen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="SeniorCitizen.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/RD/SeniorCitizen.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            ///Relative details panel
           
            $("input[name='RelativeY']").on('change', function () {
                var Relative = $("input[name='RelativeY']:checked").val();
                if (Relative == "Yes") {
                    $("#DivRelativeDetails").show(800);
                }
                else {
                    $("#DivRelativeDetails").hide(800);
                }
            });
            //Medical details panel
            $("input[name='RBTNMedical']").on('change', function () {
                var Medical = $("input[name='RBTNMedical']:checked").val();
                if (Medical == "Yes") {
                    $("#DivMedicalHistory").show(800);
                }
                else {
                    $("#DivMedicalHistory").hide(800);
                }
            });
            
           //
            var d = $.datepicker.formatDate('dd.mm.yy', new Date());
            $('#lblasondate').text(d);
            $('#DescribeOtherDisease').hide();

          
            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                onSelect: function (date) {
                    debugger;
                    var todaydate = $.datepicker.formatDate('dd/mm/yy', new Date());
                    var Age = calcDobAge(date);
                    var Age = calcExSerDur(date, todaydate);
                    $('#Age').val(Age.years);
                    $("#Year").val(Age.years);
                    $("#Month").val(Age.months);
                    $("#Day").val(Age.days);
                    if (Age.years < 60 || Age.years == 0) {
                        //$('#DOB').val('');
                        //alert('Test')
                        ValiateSCAge(Age.years)
                    }
                    //else {
                    //    var dob = $("#DOB");
                    //    dob.attr('style', 'border:2px solid green !important;');
                    //    dob.css({ "background-color": "#ffffff" });
                    //}
                }
            });

            $("#btnSubmit").prop('disabled', true);

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

            $('#Others').change(function () {
                if (this.checked)
                    //$('#DescribeOtherDisease').fadeIn('slow');
                    $('#DescribeOtherDisease').show(800);
                else
                    //$('#DescribeOtherDisease').fadeOut('slow');
                    $('#DescribeOtherDisease').hide(800);
            });
        });
    </script>
   
    <script type="text/javascript">
        function Declaration(chk) {
            debugger;
            $('#btnSubmit').prop('disabled', true);
            if (chk) {
                             var name = $('#FirstName').val();
                              $("#lblName").html(name);
                              $('#btnSubmit').prop('disabled', false);
                //show hide concept
                             
                                      $("#DeclarationChk").show(800);
                                 

                //var qs = getQueryStrings();
                //var uid = qs["UID"];

                //$.ajax({
                //    type: "POST",
                //    contentType: "application/json; charset=utf-8",
                //    url: '/webapp/kiosk/forms/basicdetail.aspx/GetDeclaration',
                //    //data: '{"prefix": ""}',
                //    //data: '{"UID": '+uid+'}',
                //    data: '{"prefix":"","UID":"' + uid + '"}',
                //    processData: false,
                //    dataType: "json",
                //    success: function (response) {
                //        var arr = eval(response.d);
                //        var html = "";
                //        var name = arr[0].Name;
                //        $("#lblName").html(name);
                //        //alert($('#spndecl').text(arr[0].Name));
                //        //$.each(arr, function () {
                //        //    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //        //    //console.log(this.Id + ',' + this.Name);
                //        //});
                //        if (qs["UID"] != null && qs["UID"] != "") {
                //            $('#btnSubmit').prop('disabled', false);
                //        }
                //    },
                //    error: function (a, b, c) {
                //        alert("1." + a.responseText);
                //    }
                //});
            }
            else {
                $("#lblName").html("");
                $('#btnSubmit').prop('disabled', true);
                $("#DeclarationChk").hide(800);
            }
        }
      
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

        #divInfo li {
            margin-left: 5px;
            display: flex;
        }

             #divInfo li:before {
                content: "";
                display: flex;
                font-family: FontAwesome;
                font-weight: normal;
                padding-right: 5px;
            }

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
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 311px;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading" style="font-size: 22px; color: #820000; font-weight: bold !important;">Form for Identity Card of Senior Citizen</h2>
                <span class="col-lg-2 p0 text-right" style="font-size: 15px;display:none">Language : 
                           <input type="button" id="btnLang" runat="server" class="btn-link" onclick="javascript: return ChangeLanguage();" value="Odia" /><i class="fa fa-hand-o-up"></i></span>
                <span class="clearfix"></span>
            </div>
            <div class="col-md-12 box-container" style="display:none;">
                <div class="box-heading">
                    <h4 class="box-title">Instruction to Fill the Form
                                <span class="col-md-6 pull-right" style="font-style: normal; cursor: pointer; font-size: 12px; text-align: right; padding: 0;" onclick="ckhInfo();">
                                    <i class="fa fa-info-circle" style="cursor: pointer; font-size: 15px;" title="Information">&nbsp;&nbsp;</i>Help&nbsp;&nbsp;<i class="fa fa-hand-o-up"></i></span><span class="clearfix"></span>
                    </h4>
                </div>
                <div class="box-body box-body-open" id="divInfo" style="display: block;">
                    <div class="col-sm-12 col-md-12 col-lg-6">
                        <p class="text-justify">
                            <b>DOS FOR THE SENIOR CITIZENS</b>
                        </p>
                        <ul>
                            <li>The son daughter residing in the same city have greater role to ensure safely and security
Of their parents. The parents should keep frequent with her children.
                            </li>
                            <li>Furnish the details particulars of domestic help to engaged to local police for record.</li>
                            <li>Develop friendly and cordial relationship with your neighbour Intimate the neighbour about  about your long absence from the home.</li>
                            <li>Use of Modern security gadgets is always advantageous Door alarm, CCTV, electric eye bell
Etc are readily available in the market. Consult some Professionals in this regards for Installation in the houses.
                            </li>
                            <li>Install peephole and safety chain in the front door always check the identify of stranger(s) before you let them inside.</li>
                            <li>Install metal grills at your front and back doors for added protection.</li>
                            <li>Close your door even when you are going out just for a minute. It takes only a few seconds
For outsider/thief to enter your house and steal valuables.</li>
                            <li>It is advisable to change the locks of the main door after a few years. This will Prevent an outsider from using duplicate keys. If made without knowledge.</li>
                            <li>An electronic alarm system attached to the office of your housing society or to the watchman’s cabin or the building is advisable foe sending alarm signals in case of exigency.</li>
                            <li>Inform your society in advance about unacquainted visitors, so that their identify can be checked  at the entrance gate of the society/building.</li>
                            <li>When you admit a workman or salesman into your house, do not leave him alone or unattended at any point of time.</li>
                            <li>Employ a domestic help only after recording and verify his/ her real name. Native address
Character and antecedents, cell number etc, will the help of the nearest police station.</li>
                            <li>Inform your neighbour about you are staying alone . The Housing society also needs to know about this.</li>
                            <li>Keep telephone numbers of your nearest police station, hospital, fire station etc. handy and stay them in your cell phones.</li>
                            <li>Install a handy system at a conscious place and also a first aid kit </li>
                        </ul>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6">
                        <p class="text-justify">
                            <b>DON’TS FOR SENOIR CITIZENS</b>
                        </p>
                        <ul>
                            <li>Never leave spare keys in open or in the conventional hiding places.</li>
                            <li>Do not keep lot of cash/jewellery valuables at homiest is always advisable to keep your valuable in safe locker of any bank.</li>
                            <li>Do not allow any relative or friend of your domestic help to visit your place. If he/she has any frequent visitor, get his/her antecedents verified from the local polices station and try to keep the telephone number of such persons.</li>
                            <li>Never discuss any financial matters in front of your domestic help.</li>
                            <li>Do not ignore any suspicious incident inform the police station.</li>
                            <li>Do not allow the domestic help to know where the valuable are kept in the house it is advisable not to allow the domestic help to bed rooms.</li>
                        </ul>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 box-container" style="display:none;">
                <div class="box-heading">
                    <h4 class="box-title">Mobile Number Verification</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10 mb10" id="divCredential">
                            <span style="font-weight: bold; margin-bottom: 5px">Instruction:</span><br />
                            <span>Please enter valid mobile number, as all the communication shall be made on the regisered mobile number.
                                        <br />
                                OTP authentication code shall be SMS to validate the mobile number.</span>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="lblMobileNo">Applicant Mobile No.</label>
                                    <input class="form-control" id="txtMobile" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" maxlength="10" title="Please enter valid Mobile No" onkeypress="return isNumberKey(event);" onchange="MobileValidation('txtMobile');" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="" for="">
                                        &nbsp;
                                    </label>
                                    <input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." onclick="fnGenOTP();" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divOTP">
                                <div class="form-group">
                                    <label class="manadatory" for="CompanyName">OTP Verification Code</label>
                                    <input class="form-control" id="txtSMSCode" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);" disabled="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divbtnOTP">
                                <div class="form-group">
                                    <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Verify OTP Code" onclick="ValidateSeniorCitizenOTP();" disabled="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container">
                    <div class="box-heading ">
                        <h4 class="box-title manadatory">Aadhaar Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="row">
                                <div class="form-group col-lg-3">
                                    <select class="form-control" data-val="true" data-val-number="search application" data-val-required="Please select search type" id="ddlSearch" name="Search">
                                        <option value="0">Select Search Type</option>
                                        <option selected="" value="U">Aadhaar Number</option>
                                      
                                    </select>
                                </div>
                                  <!--<option value="C">Citizen Profile ID</option> onclick="return openWindow(1, 2, 'UIDCasteCertificate1');"
                                        <option value="A">Application ID</option>-->
                                <div class="form-group col-lg-4">
                                    <input class="form-control" placeholder="Enter 12 digit Aadhaar Number" name="txtAadhaar" type="text" value="" id="UID" maxlength="12" onkeypress="return isNumberKey(event);" autofocus="" />
                                </div>
                                <div class="form-group col-lg-2 text-left">
                                    <input type="submit" name="" value="Fetch Data from UID" onclick="return ValidateAadhaar(1, 2, 'UIDCasteCertificate1');" id="btnSearch" class="btn btn-primary" />
                                </div>
                                <div id="divNonAadhar" class="form-group col-lg-3 text-right" style="white-space: nowrap; margin-top: 10px; display: none;"><a href="#" onclick="fnNonUID();" title="Click if Aadhaar UID is not available">I don't have Aadhaar No.</a></div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>

        </div>
        <div class="row">
            <div class="col-md-9 p0">
            <!---------police station panel----------->
            <div class="col-md-12 box-container">
                <div class="box-heading ">
                    <h4 class="box-title">Police Station Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDistrict1">District</label>
                                    <select name="" id="PddlDistrict1" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select District"
                                        onchange="GetDistrictPloiceStations();">
                                        <option value="0">-Select-</option>
                                        <option value="381">Cuttak</option>
                                        <option value="382">Bhubaneswar</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-8">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlps">Police Station</label>
                                    <select id="Pddlps" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select Police Station.">
                                        <option value="0">-Select-</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <!-------End Here--------->                
            <div id="divDetails" class="col-md-12 box-container">
                    <div class="box-heading" id="Div4">
                        <h4 class="box-title">Senior Citizen Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Name of Police Station</label>
                                <input id="PoliceStationName" class="form-control" placeholder="Name of Police Station" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                            </div>
                        </div>--%>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-9">
                            <div class="form-group">
                                <label class="manadatory" for="firstname">Name of the Senior Citizen</label>
                                <input id="FirstName" class="form-control" placeholder="Full Name of Applicant" name="FirstName" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Gender</label>
                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                    <option value="0">Select</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="SpouseName">Father's/Spouse Name</label>
                                <input id="SpouseName" class="form-control" placeholder="Name of Spouse" type="text" maxlength="30" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">Date of Birth</label>
                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" maxlength="12" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="margin-bottom: 15px;">
                            <div class="form-group">
                                <label for="Age">Age as on <asp:Label ID="lblasondate" runat="server" /></label>
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
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">Mobile Number</label>
                                <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event);" onchange="MobileValidation('MobileNo');" type="text" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="LandLineNo">LandLine No</label>
                                <input id="txtlandlineno" class="form-control inputbox_bluebdr" maxlength="15" name="LandLineNo" placeholder="LandLine Number" type="text" autocomplete="off" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="EmailID">Email ID</label>
                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" onchange="ValiateEmail();" />
                            </div>
                        </div>
                        
                        <!-------------New field added------------>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="Bloodgroup">Blood Group</label>
                                <select class="form-control" data-val="true" data-val-number="Bgroup" id="ddlBloodGroup" name="Bgroup">
                                    <option value="Select BloodGroup">--Select Blood Group--</option>
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
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none;">
                            <div class="form-group">
                                <label for="MotherName">Mother Name</label>
                                <input id="txtMotherName" class="form-control inputbox_bluebdr" maxlength="50" name="Mother" placeholder="Mother Name" type="text" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none;">
                            <div class="form-group">
                                <label for="FatherName">Father Name</label>
                                <input id="txtFatherName" class="form-control inputbox_bluebdr" maxlength="50" name="Father" placeholder="Father Name" type="text" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none;">
                            <div class="form-group">
                                <label for="nationality">
                                    Nationality</label>
                                <select class="form-control" data-val="true" data-val-number="Nationality" id="Nationality" name="Nationality">
                                    <option selected="" value="Indian">Indian</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="Religion">Religion</label>
                                <select class="form-control" data-val="true" data-val-number="Religion" id="ddlReligion" name="Religion">
                                    <option value="Select Religion">--Select Religion--</option>
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
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="Category">Category</label>
                                <select class="form-control" data-val="true" data-val-number="Category" id="ddlCategory" name="Category">
                                    <option value="Select Category">--Select Category--</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                    <option value="General">General</option>
                                </select>
                            </div>
                        </div>
                        <!------End-------->
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5" style="display:none;">
                            <div class="form-group">
                                <label class="manadatory" for="Category">Is any of your relative staying in same city?</label>
                                <select class="form-control" id="RelativeStaying">
                                    <option value="0">Select</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 pleft0" style="display:none;">
                            <div class="form-group">
                                <label class="manadatory" for="Category">Do you have any medical history?</label>
                                <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please Select your Category" id="HaveMedicalHistory" name="Category">
                                    <option value="0">Select</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12" style="display: none;">
                            <b>Note: </b>For apply this service your age should be minimum 60year.
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
                            <input class="camera" id="ApplicantImage" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div id="divSign" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Applicant Signature</h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
                            <input class="camera" id="ApplicantSign" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="row">   
             <!-----Relative details tab-----> 
             <div >
            <div class="col-lg-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title">Relative Details (In case of Emergency) <span style="float:right">
                        <span id="Relativechk">Is any of your relative staying in same city? 
                            <span>
                              <input type="radio" name="RelativeY" id="RBTNRelativeY"  value="Yes" />Yes
                                          
                            </span>
                            <span>
                                 <input type="radio" name="RelativeY" id="RBTNRelativeN" value="No" />  No                                           
                                          
                            </span> </span></span> </h4>
                </div>
                <div class="box-body box-body-open p0 pbottom0" id="DivRelativeDetails" style="display: none">
                    <div class="form-group error" id="divmore" runat="server" style="display: none;">
                    </div>
                    <div id="divSuspect">
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" style="width: 100%; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <%--<th style="width: 5%;">S.No</th>--%>
                                    <th style="width: 25%;">Name of Relative</th>
                                    <th>Relation</th>
                                    <th style="width: 35%;">Address</th>
                                    <th>Mobile No</th>
                                    <th>Action</th>
                                </tr>
                                <tr>
                                    <%-- <td>1</td>--%>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Full Name of Relative" id="txtNOR" maxlength="100" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Relation" id="txtRelation" maxlength="100" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Full Address of Relative" id="txtAddress" maxlength="100" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Mobile No." id="txtMobileno" maxlength="10" onkeypress="return isNumberKey(event);" onchange="MobileValidation('txtMobileno');" /></td>
                                    <td>
                                        <input type="button" class="btn btn-info" id="btnAdd" value="Save" onclick="AddSuspect('');" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
                </div>
             <!-----Medical history details tab---->
        <div id="" class="col-md-12 box-container" >

                <div class="box-heading">
                    <h4 class="box-title">Medical History <span style="float:right"><span id="Medicalchk">Do you have Medical History? <span>
                        <input type="radio" name="RBTNMedical" id="RBTNMedicalY" value="Yes" />Yes </span>
                        <span><input type="radio" name="RBTNMedical" id="RBTNMedicalN" value="No" />No </span> </span></span></h4>
                </div>
                <div class="box-body box-body-open" id="DivMedicalHistory" style="display: none">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none;">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="BloodGroup" id="BloodGroup" />Blood Group</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Arthritis" id="Arthritis" />Arthritis</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Diabetes" id="Diabetes" />Diabetes</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="RespiratoryDiseases" id="RespiratoryDiseases" />Respiratory Diseases</label>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="InfluenzaPneumonia" id="InfluenzaPneumonia" />Influenza and Pneumonia</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="HeartDisease" id="HeartDisease" />Heart Disease</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Osteoporosis" id="Osteoporosis" />Osteoporosis</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Cancer" id="Cancer" />Cancer</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="AlzheimerDisease" id="AlzheimerDisease" />Alzheimer's disease</label>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Others" id="Others" />Others</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" id="DescribeOtherDisease" style="margin-top:-7px;">
                        <div class="">
                            <input id="OtherDisease" class="form-control" placeholder="Any other disease describe here" type="text" maxlength="100" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9">
                        <div class="form-group">
                            <label class="manadatory" for="">Name of Family Doctor</label>
                            <input id="FamilyDoctorName" class="form-control" placeholder="Name of Family Doctor" type="text" maxlength="100" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Mobile No.</label>
                            <input id="FamilyDoctorNo" class="form-control" placeholder="Mobile No" type="text" maxlength="10" onkeypress="return isNumberKey(event);" onchange="MobileValidation('FamilyDoctorNo');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                        <div class="form-group">
                            <label class="manadatory" for="">Full Address of Family Doctor</label>
                            <input id="FamilyDoctorAddress" class="form-control" placeholder="Full Address of Family Doctor" type="text" maxlength="100" onchange="return checkLength(this);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Pincode</label>
                            <input id="FamilyDoctorPincode" class="form-control" placeholder="Pincode" type="text" maxlength="6" onkeypress="return isNumberKey(event);" onchange="return PinCodeValidation('FamilyDoctorPincode');" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
             <div class="clearfix"></div>
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
                                <label class="manadatory" for="RoadStreetName">Road/Street Name</label>
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
                                <input name="" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" onchange="return PinCodeValidation('PPinCode');" onkeypress="return isNumberKey(event);" />
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
                                <label class="manadatory" for="RoadStreetName">Road/Street Name</label>
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
                                <label class="text-nowrap" for="ddlVillage">
                                    Panchayat/Village/City
                                </label>
                                <select name="" id="CddlVillage" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select panchayat">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="PIN">
                                    Pin Code
                                </label>
                                <input name="" type="text" id="CPinCode" class="form-control" onchange="return PinCodeValidation('CPinCode');" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" />
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
            <div class="clearfix"></div>
            
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title">Servant/Driver/Watchman/Tenant Details
                    </h4>
                </div>
                <div class="box-body box-body-open mt0 ptop0 pbottom0">
                     <div class="form-group error" id="divmoreS" runat="server" style="display: none;">
                    </div>
                    <div id="divSuspectS">
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" style="width: 100%; margin: 0 auto;">
                            <tbody>
                                <tr>
                                   
                                    <th>Person Type</th>
                                    <th style="width: 20%;">Name of Person</th>
                                    <th style="width: 35%;">Address</th>
                                    <th>Mobile No</th>
                                    <th>Action</th>
                                </tr>
                                <tr>
                                    
                                    <td>
                                        <select class="form-control" id="SddlPersonType">
                                            <option value="Select">Select</option>
                                            <option value="Servant">Servant</option>
                                            <option value="Driver">Driver</option>
                                            <option value="Watchman">Watchman</option>
                                            <option value="Tenant">Tenant</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Full Name of Person" id="txtSNameOfPerson" maxlength="100" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Full Address of Personn" id="txtSAddress" maxlength="100" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Mobile No." id="txtSMobile" maxlength="10" onkeypress="return isNumberKey(event);" onchange="MobileValidation('txtSMobile');" /></td>
                                    <td>
                                        <input type="button" class="btn btn-info" id="btnAddS" onclick="AddServantSuspect('');" value="Save" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">
                         <input type="checkbox" id="chkDeclaration" runat="server" onclick="javascript: Declaration(this.checked);" />
                        
                        Declaration</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="text-danger text-danger-green mt0" id="DeclarationChk" style="display:none;">
                        <p class="text-justify ng-binding">
                           I, <b><span id="lblName" style="text-transform: uppercase;"></span></b>
                            <span id="lblDeclaration" class="ng-binding">hereby affirm that the information given by me in the application is complete and true to the best of my knowledge and belief.
                                 </span><!--and that I have made the application with the consent and approval of my parents/guardian.--->
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div id="divBtn" class="row">
            <div class="col-md-12 box-container" style="margin-top: 5px;">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnSubmit" class="btn btn-success" value="Register &amp; Proceed" title="Proceed to Upload Necessary Document" onclick="SubmitData();" />
                    <input type="submit" name="" value="Cancel" id="Button1" title="Refresh the page" class="btn btn-danger" />
                    <%--<input type="submit" name="" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />--%>
                    <asp:Button ID="BtnHome" runat="server" Text="Home" CssClass="btn btn-primary" title="Back to Home Page" OnClick="BtnHome_Click" />
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>

     <!---new fields added here-->
          <asp:HiddenField ID="hdfSuspect" runat="server" />
          <asp:HiddenField ID="hdfSuspectSave" runat="server" />
          <asp:HiddenField ID="hdfSuspectString" runat="server" />

          <asp:HiddenField ID="hdfSuspectS" runat="server" />
          <asp:HiddenField ID="hdfSuspectSaveS" runat="server" />
          <asp:HiddenField ID="hdfSuspectStringS" runat="server" />
    <!--End here-->

    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HDFDistrict" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HDFPS" runat="server" ClientIDMode="Static" />

</asp:Content>
