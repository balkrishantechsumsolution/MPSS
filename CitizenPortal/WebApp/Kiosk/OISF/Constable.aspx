<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Constable.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.Constable" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="OISF.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#side-menu1').show();
            $('#pnlMenu').show();
            $('#page-wrapper').css("margin", "0 0 0 250px !important;");
        });

        function SubmitDataV2() {
            debugger;
            if (!ValidateFormV2()) {
                return;
            }

            $("#btnSubmitV2").prop('disabled', true);

            var t_Message = "";
            var result = false;

            var DOB = $("#HFAge");

            if (DOB.val() != '') {


                /*
        
                var Age = calcDobAge(date);
                            $('#Age').val(Age.years);
        
                            $("#Year").val(Age.years);
                            $("#Month").val(Age.months);
                            $("#Day").val(Age.days);
        
                            if (Age < 18) {
                                $('#DOB').val('');
                                alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
                                $('#Age').val('');
                                return false;
                            } else if (Age > 23) {
                                $('#Age').val('');
                                alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 23 years.');
                                $('#Age').val('');
                                return false;
                            }
        
                */

                var txtDOB = DOB.val();
                var dateDOB = new Date(txtDOB.substr(0, 4), txtDOB.substr(5, 2) - 1, txtDOB.substr(8, 2));//1984/07/14
                var Age = calcExSerDur(txtDOB, '01/01/2016');
                var minAge = 18;
                var maxAge = 23;
                var ageToCompare = Age.years;

                if ($('#category').val() == "UR") {

                }
                else if ($('#category').val() == "SC" || $('#category').val() == "ST") {
                    maxAge = 28;
                }

                var startDate = $('#txtRndDrtinstrt').val();
                var endDate = $('#txtRndDrtinend').val();

                if (startDate != "" && endDate != "") {

                    if ($("#DOB").datepicker("getDate") >= $("#txtRndDrtinstrt").datepicker("getDate")) {
                        alert('Qualifying Service Duration must be greater than Date of Birth');
                        $("#txtRndDrtinstrt").val("");
                    }

                    if ($("#DOB").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
                        alert('Qualifying Service Duration must be greater than Date of Birth');
                        $("#txtRndDrtinend").val("");
                    }

                    if ($("#txtRndDrtinstrt").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
                        alert('Qualifying Service To Date must be greater than From Date');
                        $("#txtRndDrtinend").val("");
                    }

                    //var startDate2 = new Date(startDate.substr(6, 4), startDate.substr(3, 2) - 1, startDate.substr(0, 2));
                    //var endDate2 = new Date(endDate.substr(6, 4), endDate.substr(3, 2) - 1, endDate.substr(0, 2));

                    //var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
                    //var firstDate = startDate2; //new Date(2008, 01, 12);
                    //var secondDate = endDate2; //new Date(2008, 01, 22);

                    //var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime()) / (oneDay)));


                    var durn = calcExSerDur(startDate, endDate);

                    if (durn != null) {

                        if (durn.years > 0) dateDOB.setFullYear(dateDOB.getFullYear() + durn.years);
                        if (durn.months > 0) {
                            dateDOB = dateDOB.addMonths(durn.months);
                        }
                        if (durn.days > 0) {
                            dateDOB.setDate(dateDOB.getDate() + durn.days);
                        }


                        //alert(dateDOB);


                        var newDate = pad(dateDOB.getDate().toString(), 2) + "/" + pad(dateDOB.getMonth().toString(), 2) + "/" + dateDOB.getFullYear().toString();

                        var Age = calcExSerDur(newDate, '01/01/2016');
                        //alert(Age.years);
                        //alert(Age.months);
                        //alert(Age.days);
                        ageToCompare = Age.years;

                    }


                    //var ServicesDate = dateDOB.setDate(dateDOB.getDate() - diffDays);
                    //var ServicesDate = dateDOB.getDate() - diffDays;

                    //alert(ServicesDate);
                    //var Age = calcExSerDur(txtDOB, ServicesDate);
                    //alert(Age);
                }

                var text = "";
                var check = false;
                var opt = 0;
                if (ageToCompare < minAge) {
                    //$('#DOB').val('');
                    text += "<br /> -Applicant age should be 18 years. ";
                    //$("#Year").val('');
                    //$("#Month").val('');
                    //$("#Day").val('');


                    opt = 1;
                } else if (ageToCompare > maxAge) {

                    //if ($("#Month").val() == 0) {

                    //}
                    //else {
                    //    check = true;
                    //}

                    //if ($("#Day").val() == 0) {

                    //}
                    //else {
                    //    check = true;
                    //}

                    check = true;

                    if (check) {
                        //$('#DOB').val('');
                        text += "<br /> -Applicant age should be less than " + maxAge + " years. ";
                        //$("#Year").val('');
                        //$("#Month").val('');
                        //$("#Day").val('');
                        opt = 1;

                    }

                }

                //alertPopup("Eligibility criteria for submitting application.", text);

                if (opt == 1) {
                    t_Message = "As per Govt. Notification, you are not eligible for the Application. Do you want to submit your application?";

                    if (confirm(t_Message)) {
                        result = true;
                    }

                }
                else {
                    t_Message = "As per Govt. Notification, you are eligible for the Application. Please confirm to Proceed.";
                    alert(t_Message);
                    result = true;
                }


                if (!result) {
                    $("#btnSubmit").prop('disabled', false);
                    return false;

                }

                //return false;

            }

            
            var temp = "Gunwant";
            var AppID = "";
            var result = false;
            //var DOBArr = $('#DOB').val().split("/");
            //var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

            //var FirstName = $("#FirstName");
            //var LastName = $("#LastName");
            //var FatherName = $("#FatherName");
            //var Age = $("#Age");

            //var AgeYear = $("#Year");
            //var AgeMonth = $("#Month");
            //var AgeDay = $("#Day");

            var Religion = $("#religion option:selected").text();
            var Category = $("#category option:selected").text();
            var Nationality = $("#nationality option:selected").text();

            //var obj = jQuery.parseJSON($("#HFUIDData").val());

            var Section1_PassOdia = $("input[name='radio1']:checked").val();
            var Section1_AbililtyRead = 0;
            if ($('#readOdiya').is(":checked")) {
                // it is checked
                Section1_AbililtyRead = 1;
            }

            var Section1_AbilityWrite = 0;
            if ($('#writeOdiya').is(":checked")) {
                // it is checked
                Section1_AbilityWrite = 1;
            }

            var Section1_AbilitySpeak = 0;
            if ($('#spkOdiya').is(":checked")) {
                // it is checked
                Section1_AbilitySpeak = 1;
            }

            var Section2_Married = $("input[name='radio2']:checked").val();
            var Section2A_MoreThanOneSpouse = $("input[name='radio2a']:checked").val();

            var Section3_ExServiceMan = $("input[name='radio3']:checked").val();
            var Section3A_ServiceRendered = $("#txtRtrmntdte").val();
            var Section3B_ServiceDurationFrom = $("#txtRndDrtinstrt").val();
            var Section3B_ServiceDurationTo = $("#txtRndDrtinend").val();
            var Section3C_ServiceYear = $("#SevsYear").val();
            var Section3C_ServiceMonth = $("#SevsMonth").val();
            var Section3C_ServiceDay = $("#SevsDay").val();

            var Section4_IsSportsPerson = $("input[name='radio4']:checked").val();
            var Section4A_SportsParticipated = $("#ddlSports option:selected").text();
            var Section4B_SportsOthers = $("#txtOthrsport").val();
            var Section4B_WantsRelaxation = $("input[name='radio4b']:checked").val();

            var Section4B_RelaxationHeight = $("#ddlRxlstnhgt option:selected").text();
            var Section4B_RelaxationChest = $("#ddlRxlstnchst option:selected").text();
            var Section4B_RelaxationWeight = $("#ddlRxlstnwght option:selected").text();

            var Section5A_ParticipateEvent = $("#ddlSports2 option:selected").text();
            var Section5B_SportsCategory = $("input[name='radio5b']:checked").val();
            var Section5C_SportsMedal = $("input[name='radio5C']:checked").val();

            var Section6_NCCCertificate = $("input[name='radio6']:checked").val();
            var Section6A_NCCCertificateCategory = $("input[name='radio6A']:checked").val();

            var Section7A_RegNo = $("#txtRegNo").val();
            var Section7A_RegDate = $("#txtRegdte").val();
            var Section7B_NameEmpExchg = $("#txtNmeEmpEx").val();

            var Section8_HasDL = $("input[name='radio8']:checked").val();
            var Section8A_LicenseVehicle = $("input[name='radio8A']:checked").val();
            var Section8B_LicenseNo = $("#txtLicenseNo").val();
            var Section8B_LicenseDate = $("#txtLicenseDate").val();
            var Section8C_NameRTOOffice = $("#txtLicenseOffice").val();

            var Section9_InvolvedCriminal = $("input[name='radio9']:checked").val();
            var Section9A_ArrestDetail = $("input[name='radio9A']:checked").val();
            var Section9B_CaseRefNo = $("#txtCriminalRefNo").val();
            var Section9C_District = $("#ddlArrestDistrict").val();
            var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
            var Section9E_IPCSection = $("#txtIPCSection").val();

            var qs = getQueryStrings();
            var uid = qs["UID"];
            var svcid = qs["SvcID"];
            var dpt = qs["DPT"];
            var dist = qs["DIST"];
            var blk = qs["BLK"];
            var pan = qs["PAN"];
            var ofc = qs["OFC"];
            var ofr = qs["OFR"];

            var datavar = {

                //'AgeYear': $('#AgeYear').val(),
                //'AgeMonth': $('#AgeMonth').val(),
                //'AgeDay': $('#AgeDay').val(),
                'Religion': Religion,
                'Category': Category,
                'Nationality': Nationality,
                //'stdcode': $('#stdcode').val(),

                'Section1_PassOdia': Section1_PassOdia,
                'Section1_AbililtyRead': Section1_AbililtyRead,
                'Section1_AbilityWrite': Section1_AbilityWrite,
                'Section1_AbilitySpeak': Section1_AbilitySpeak,
                'Section2_Married': Section2_Married,
                'Section2A_MoreThanOneSpouse': Section2A_MoreThanOneSpouse,
                'Section3_ExServiceMan': Section3_ExServiceMan,
                'Section3A_ServiceRendered': Section3A_ServiceRendered,
                //'Section3B_ServiceDuration': Section3B_ServiceDuration,
                'Section3B_ServiceDurationFrom': Section3B_ServiceDurationFrom,
                'Section3B_ServiceDurationTo': Section3B_ServiceDurationTo,
                'Section3C_ServiceYear': Section3C_ServiceYear,
                'Section3C_ServiceMonth': Section3C_ServiceMonth,
                'Section3C_ServiceDay': Section3C_ServiceDay,
                'Section4_IsSportsPerson': Section4_IsSportsPerson,
                'Section4A_SportsParticipated': Section4A_SportsParticipated,
                'Section4B_SportsOthers': Section4B_SportsOthers,
                'Section4B_WantsRelaxation': Section4B_WantsRelaxation,
                'Section4B_RelaxationHeight': Section4B_RelaxationHeight,
                'Section4B_RelaxationChest': Section4B_RelaxationChest,
                'Section4B_RelaxationWeight': Section4B_RelaxationWeight,
                //'Section5_SportsPersonData': '',
                'Section5A_ParticipateEvent': Section5A_ParticipateEvent,
                'Section5B_SportsCategory': Section5B_SportsCategory,
                'Section5C_SportsMedal': Section5C_SportsMedal,
                'Section6_NCCCertificate': Section6_NCCCertificate,
                'Section6A_NCCCertificateCategory': Section6A_NCCCertificateCategory,
                //'Section7': '',
                'Section7A_RegNo': Section7A_RegNo,
                'Section7A_RegDate': Section7A_RegDate,
                'Section7B_NameEmpExchg': Section7B_NameEmpExchg,
                'Section8_HasDL': Section8_HasDL,
                'Section8A_LicenseVehicle': Section8A_LicenseVehicle,
                'Section8B_LicenseNo': Section8B_LicenseNo,
                'Section8B_LicenseDate': Section8B_LicenseDate,
                'Section8C_NameRTOOffice': Section8C_NameRTOOffice,
                'Section9_InvolvedCriminal': Section9_InvolvedCriminal,
                'Section9A_ArrestDetail': Section9A_ArrestDetail,
                'Section9B_CaseRefNo': Section9B_CaseRefNo,
                'Section9C_District': Section9C_District,
                'Section9D_PoliceStationNo': Section9D_PoliceStationNo,
                'Section9E_IPCSection': Section9E_IPCSection,

                'aadhaarNumber':uid,
                'department': dpt,
                'district': dist,
                'block': blk,
                'panchayat': pan,
                'office': ofc,
                'officer': ofr,
            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": $.stringify(datavar, null, 4)
            };


            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Kiosk/OISF/Constable.aspx/InsertConstable',
                    data: $.stringify(obj, null, 4),
                    processData: false,
                    dataType: "json",
                    success: function (response) {

                    },
                    error: function (a, b, c) {
                        result = false;
                        alert("5." + a.responseText);
                    }
                })
                ).then(function (data, textStatus, jqXHR) {
                    debugger;
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    AppID = obj.AppID;
                    result = true;


                    if (result /*&& jqXHRData_IMG_result*/) {

                        alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                        window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=388&AppID=' + obj.AppID;

                    }

                    //alert("Basic detail saved from Aadhaar.");
                    //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

                });// end of Then function of main Data Insert Function

            return false;
        }



        Date.isLeapYear = function (year) {
            return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0));
        };

        Date.getDaysInMonth = function (year, month) {
            return [31, (Date.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
        };

        Date.prototype.isLeapYear = function () {
            return Date.isLeapYear(this.getFullYear());
        };

        Date.prototype.getDaysInMonth = function () {
            return Date.getDaysInMonth(this.getFullYear(), this.getMonth());
        };

        Date.prototype.addMonths = function (value) {
            var n = this.getDate();
            this.setDate(1);
            this.setMonth(this.getMonth() + value);
            this.setDate(Math.min(n, this.getDaysInMonth()));
            return this;
        };


        function pad(n, width, z) {
            z = z || '0';
            n = n + '';
            return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
        }


        function ValidateFormV2() {

            var text = "";
            var opt = "";

            /// Basic Information 
            //var FirstName = $("#FirstName");
            //var LastName = $("#LastName");
            //var FatherName = $("#FatherName");

            //var MobileNo = $("#MobileNo");
            //var EmailID = $("#EmailID");
            //var DOB = $("#HFAge");
            //var Age = $("#Age");

            //var AgeYear = $("#Year");
            //var AgeMonth = $("#Month");
            //var AgeDay = $("#Day");

            //var Religion = $("#religion option:selected").text();

            //var Category = $("#category option:selected").text();
            //var Nationality = $("#nationality option:selected").text();


            //var Gender = $("#ddlGender option:selected").text();

            ////Permanent  address
            //var AddressLine1 = $("#PAddressLine1");
            //var AddressLine2 = $("#PAddressLine2");
            //var RoadStreetName = $("#PRoadStreetName");
            //var LandMark = $("#PLandMark");
            //var Locality = $("#PLocality");
            //var State = $("#PddlState option:selected").text();
            //var District = $("#PddlDistrict option:selected").text();
            //var Taluka = $("#PddlTaluka option:selected").text();
            //var Village = $("#PddlVillage option:selected").text();
            //var Pincode = $("#PPinCode");

            ////Present  address
            //var PreAddressLine1 = $("#CAddressLine1");
            //var PreAddressLine2 = $("#CAddressLine2");
            //var PreRoadStreetName = $("#CRoadStreetName");
            //var PreLandMark = $("#CLandMark");
            //var PreLocality = $("#CLocality");
            ////CoPrententPlaceHolder1_Address1_ddlState
            //var PreState = $("#CddlState option:selected").text();
            //var PreDistrict = $("#CddlDistrict option:selected").text();
            //var PreTaluka = $("#CddlTaluka option:selected").text();
            //var PreVillage = $("#CddlVillage option:selected").text();
            //var PrePincode = $("#CPinCode");





            /*
        
            if (EL("myImg").src.indexOf("photo.png") != -1) {
                text += "<br /> -Please upload Applicant Photograph.";
                opt = 1;
            }
        
            if (FirstName.val() == '') {
                text += "<br /> -Please enter First Name. ";
                opt = 1;
            }
        
            if (LastName.val() == '') {
                text += "<br /> -Please enter Last Name. ";
                opt = 1;
            }
        
            
            if (FatherName.val() == '') {
                text += "<br /> -Please enter Father Name. ";
                opt = 1;
            }
        
            if (MobileNo.val() == '') {
                text += "<br /> -Please enter Mobile No. ";
                opt = 1;
            }
        
            if (MobileNo.val() != '') {
                var mobmatch1 = /^[789]\d{9}$/;
                if (!mobmatch1.test(MobileNo.val())) {
                    text += "<br /> -Please enter valid mobile Number.";
                    opt = 1;
                }
            }
        
            //if (EmailID.val() == '') {
            //    text += "<br /> -Please enter EMail ID. ";
            //    opt = 1;
            //}
        
            if (DOB.val() == '') {
                text += "<br /> -Please enter Date of Birth. ";
                opt = 1;
            }
        
            if ((Gender == '' || Gender == 'Select Gender')) {
                text += "<br /> -Please Select Gender. ";
                opt = 1;
            }
        
            if ((Religion == '' || Religion == 'Select')) {
                text += "<br /> -Please Select Religion. ";
                opt = 1;
            }
        
            if ((Category == '' || Category == 'Select')) {
                text += "<br /> -Please Select Category. ";
                opt = 1;
            }
        
            if ((Nationality == '' || Nationality == 'Select')) {
                text += "<br /> -Please Select Nationality. ";
                opt = 1;
            }
        
            if (AddressLine1 != null && AddressLine1.val() == '') {
                text += "<br /> -Please enter Care of Address in Permanent Address. ";
                opt = 1;
            }
        
            if (State != null && (State == '' || State == '-Select-')) {
                text += "<br /> -Please select State in Permanent Address.";
                opt = 1;
            }
        
            if (District != null && (District == '' || District == '-Select-' || District == 'Select District')) {
                text += "<br /> -Please select District in Permanent Address.";
                opt = 1;
            }
        
            if (Taluka != null && (Taluka == '' || Taluka == '-Select-' || Taluka == 'Select Block')) {
                text += "<br /> -Please select Taluka in Permanent Address.";
                opt = 1;
            }
        
            if (Village != null && (Village == '' || Village == '-Select-' || Village == 'Select Panchayat')) {
                text += "<br /> -Please select Village in Permanent Address.";
                opt = 1;
            }
            if (Pincode != null && Pincode.val() == '') {
                text += "<br /> -Please enter Pincode in Permanent Address.";
                opt = 1;
            }
            /////////////////////////
            if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
                text += "<br /> -Please enter Care of Address in Present Address. ";
                opt = 1;
            }
        
            if (PreState != null && (PreState == '' || PreState == '-Select-')) {
                text += "<br /> -Please select State in Present Address.";
                opt = 1;
            }
        
            if (PreDistrict != null && (PreDistrict == '' || PreDistrict == '-Select-' || PreDistrict == 'Select District')) {
                text += "<br /> -Please select District in Present Address.";
                opt = 1;
            }
        
            if (PreTaluka != null && (PreTaluka == '' || PreTaluka == '-Select-' || PreTaluka == 'Select Block')) {
                text += "<br /> -Please select Taluka in Present Address.";
                opt = 1;
            }
        
            if (PreVillage != null && (PreVillage == '' || PreVillage == '-Select-' || PreVillage == 'Select Panchayat')) {
                text += "<br /> -Please select Village in Present Address.";
                opt = 1;
            }
            if (PrePincode != null && PrePincode.val() == '') {
                text += "<br /> -Please enter Pincode in Present Address.";
                opt = 1;
            }
            /////////////////////////
            var pinmatch = /^[0-9]\d{5}$/;
            if (Pincode != null && Pincode.val() != '') {
                if (!pinmatch.test(Pincode.val())) {
                    text += "<br /> -Please enter valid pincode.";
                    opt = 1;
                }
            }
            */

            //var PhotoUpload1 = $("#myImg");

            //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
            //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

            //if (Photoarray.indexOf(Extension) <= -1) {
            //    _err_mag += "<br /> - Photo must be in JPEG / PNG form.";
            //    opt = 1;
            //}

            //var sizekb = $('#HFSizeOfPhoto').val();
            //sizekb = sizekb == "" ? 0 : sizekb.toFixed(0);

            ////alert(sizekb);

            //if (sizekb < 5 || sizekb > 50) {
            //    text += "<br /> - The size of the photograph should fall between 5KB to 50KB. Your Photo Size is " + sizekb + "kb.";
            //    opt = 1;
            //}

            var DOB = $("#HFAge");

            //Section 1
            var Section1_PassOdia = $("input[name='radio1']:checked").val();

            if (Section1_PassOdia == null) {
                text += "<br /> -Please choose whether Candidate has passed Odia.";
                opt = 1;
            }

            var checkLanguage = true;
            var Section1_AbililtyRead = 0;
            if ($('#readOdiya').is(":checked")) {
                // it is checked
                Section1_AbililtyRead = 1;
                checkLanguage = false;
            }

            var Section1_AbilityWrite = 0;
            if ($('#writeOdiya').is(":checked")) {
                // it is checked
                Section1_AbilityWrite = 1;
                checkLanguage = false;
            }

            var Section1_AbilitySpeak = 0;
            if ($('#spkOdiya').is(":checked")) {
                // it is checked
                Section1_AbilitySpeak = 1;
                checkLanguage = false;
            }

            if (Section1_PassOdia == "yes") {
                if (checkLanguage) {
                    text += "<br /> -Please choose ability to Odia Language.";
                    opt = 1;
                }
            }

            //Section 2
            var Section2_Married = $("input[name='radio2']:checked").val();
            if (Section2_Married == null) {
                text += "<br /> -Please choose whether Candidate is married or not.";
                opt = 1;
            }

            var Section2A_MoreThanOneSpouse = $("input[name='radio2a']:checked").val();

            if (Section2_Married == "yes") {
                if (Section2A_MoreThanOneSpouse == null) {
                    text += "<br /> -Please choose whether candidate has more than one spouse living or not.";
                    opt = 1;
                }
            }

            //Section 3
            var Section3_ExServiceMan = $("input[name='radio3']:checked").val();
            if (Section3_ExServiceMan == null) {
                text += "<br /> -Please choose whether Candidate is Ex-Serviceman or not.";
                opt = 1;
            }



            var Section3A_ServiceRendered = $("#txtRtrmntdte").val();
            var Section3B_ServiceDurationFrom = $("#txtRndDrtinstrt").val();
            var Section3B_ServiceDurationTo = $("#txtRndDrtinend").val();
            var Section3C_ServiceYear = $("#SevsYear").val();
            var Section3C_ServiceMonth = $("#SevsMonth").val();
            var Section3C_ServiceDay = $("#SevsDay").val();

            if (Section3_ExServiceMan == "yes") {

                if (Section3B_ServiceDurationFrom == "" || Section3B_ServiceDurationTo == "") {
                    text += "<br /> -Please Enter the duration of service rendered.";
                    opt = 1;

                }

            }


            //Section 4
            var Section4_IsSportsPerson = $("input[name='radio4a']:checked").val();
            var Section4A_SportsParticipated = $("#ddlSports option:selected").text();
            var Section4B_SportsOthers = $("#txtOthrsport").val();
            var Section4B_WantsRelaxation = $("input[name='radio4b']:checked").val();

            var Section4B_RelaxationHeight = $("#ddlRxlstnhgt option:selected").text();
            var Section4B_RelaxationChest = $("#ddlRxlstnchst option:selected").text();
            var Section4B_RelaxationWeight = $("#ddlRxlstnwght option:selected").text();

            if (Section4_IsSportsPerson == null) {
                text += "<br /> -Please choose whether Candidate is Sports Person or not.";
                opt = 1;
            }

            if (Section4_IsSportsPerson == "yes") {
                if (Section4A_SportsParticipated != null && (Section4A_SportsParticipated == '' || Section4A_SportsParticipated == 'List of Sports')) {
                    text += "<br /> -Please choose List of Sports Event the candidate participated in.";
                    opt = 1;
                }

                if (Section4A_SportsParticipated != null && (Section4A_SportsParticipated == 'Others')) {

                    if (Section4B_SportsOthers == "") {
                        text += "<br /> -Please enter Sports Event the candidate participated in.";
                        opt = 1;

                    }

                }


                if (Section4B_RelaxationHeight == null) {
                    text += "<br /> -Please choose whether Candidate wants to avail ralaxation in height, weight & chest.";
                    opt = 1;
                }

                if (Section4B_RelaxationHeight == "yes") {

                    if (Section4B_RelaxationHeight != null && (Section4B_RelaxationHeight == '' || Section4B_RelaxationHeight == 'Select')) {
                        text += "<br /> -Please select Height in Physical Standards of Measurement.";
                        opt = 1;
                    }

                    if (Section4B_RelaxationChest != null && (Section4B_RelaxationChest == '' || Section4B_RelaxationChest == 'Select')) {
                        text += "<br /> -Please select Chest in Physical Standards of Measurement.";
                        opt = 1;
                    }

                    if (Section4B_RelaxationWeight != null && (Section4B_RelaxationWeight == '' || Section4B_RelaxationWeight == 'Select')) {
                        text += "<br /> -Please select Weight in Physical Standards of Measurement.";
                        opt = 1;
                    }

                }

            }

            //Section 5
            var Section5A_ParticipateEvent = $("#ddlSports2 option:selected").text();
            if (Section5A_ParticipateEvent != null && (Section5A_ParticipateEvent == '' || Section5A_ParticipateEvent == 'List of Sports')) {
                text += "<br /> -Please choose List of Sports Event the candidate participated in.";
                opt = 1;
            }


            var Section5B_SportsCategory = $("input[name='radio5b']:checked").val();
            if (Section5B_SportsCategory == null) {
                text += "<br /> -Please choose List of Sports Category the candidate participated in.";
                opt = 1;
            }
            var Section5C_SportsMedal = $("input[name='radio5C']:checked").val();

            //Section 6
            var Section6_NCCCertificate = $("input[name='radio6']:checked").val();
            var Section6A_NCCCertificateCategory = $("input[name='radio6A']:checked").val();

            if (Section6_NCCCertificate == null) {
                text += "<br /> -Please choose whether candidate possess NCC Certificate or not.";
                opt = 1;
            }

            if (Section6_NCCCertificate == "yes") {
                if (Section6A_NCCCertificateCategory == null) {
                    text += "<br /> -Please choose category of NCC Certificate.";
                    opt = 1;
                }
            }

            //Section 7
            var Section7A_RegNo = $("#txtRegNo").val();
            var Section7A_RegDate = $("#txtRegdte").val();
            var Section7B_NameEmpExchg = $("#txtNmeEmpEx").val();

            if (Section7A_RegNo == "" || Section7A_RegDate == "") {
                text += "<br /> -Please enter Employment Exchange Registration Number and Date.";
                opt = 1;
            }

            if (Section7B_NameEmpExchg == "") {
                text += "<br /> -Please enter Employment Exchange Name.";
                opt = 1;
            }

            //Section 8
            var Section8_HasDL = $("input[name='radio8']:checked").val();

            var Section8A_LicenseVehicle = $("input[name='radio8A']:checked").val();
            var Section8B_LicenseNo = $("#txtLicenseNo").val();

            var Section8B_LicenseDate = $("#txtLicenseDate").val();
            var Section8C_NameRTOOffice = $("#txtLicenseOffice").val();

            if (Section8_HasDL == null) {
                text += "<br /> -Please choose whether candidate possess Driving License with validity for atleast 1 year.";
                opt = 1;
            }

            if (Section8_HasDL == "yes") {

                if (Section8A_LicenseVehicle == null) {
                    text += "<br /> -Please choose whether Driving License is applicable for Heavy Vehicle or Light vehicle.";
                    opt = 1;

                }

                if (Section8B_LicenseNo == "" || Section8B_LicenseDate == "") {
                    text += "<br /> -Please enter License Number and Date.";
                    opt = 1;
                }

                if (Section8C_NameRTOOffice == "") {
                    text += "<br /> -Please enter Name of RTO Office.";
                    opt = 1;
                }

            }

            //Section 9
            var Section9_InvolvedCriminal = $("input[name='radio9']:checked").val();

            var Section9A_ArrestDetail = $("input[name='radio9A']:checked").val();

            var Section9B_CaseRefNo = $("#txtCriminalRefNo").val();
            var Section9C_District = $("#ddlArrestDistrict").val();
            var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
            var Section9E_IPCSection = $("#txtIPCSection").val();


            if (Section9_InvolvedCriminal == null) {
                text += "<br /> -Please choose whether candidate is involved in Criminal Case.";
                opt = 1;
            }

            if (Section9_InvolvedCriminal == "yes") {
                if (Section9A_ArrestDetail == null) {
                    text += "<br /> -Please choose whether candidate is involved in Criminal Case.";
                    opt = 1;
                }

                if (Section9B_CaseRefNo == "") {
                    text += "<br /> -Please enter details of Case Reference No.";
                    opt = 1;
                }

                if (Section9C_District != null && (Section9C_District == '' || Section9C_District == '-Select-' || Section9C_District == '0')) {
                    text += "<br /> -Please select District.";
                    opt = 1;
                }

                if (Section9D_PoliceStationNo == "") {
                    text += "<br /> -Please enter details of Police Station.";
                    opt = 1;
                }

                if (Section9E_IPCSection == "") {
                    text += "<br /> -Please enter details of IPC Section.";
                    opt = 1;
                }

            }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                //alert(text);
                return false;
            }


            return true;


        }

        function ValidateFormV2_old() {

            var text = "";
            var opt = "";

            /// Basic Information 
            var FirstName = $("#FirstName");
            var LastName = $("#LastName");
            var FatherName = $("#FatherName");

            var MobileNo = $("#MobileNo");
            var EmailID = $("#EmailID");
            var DOB = $("#DOB");
            var Age = $("#Age");

            var AgeYear = $("#Year");
            var AgeMonth = $("#Month");
            var AgeDay = $("#Day");

            var Religion = $("#religion option:selected").text();

            var Category = $("#category option:selected").text();
            var Nationality = $("#nationality option:selected").text();


            var Gender = $("#ddlGender option:selected").text();

            //Permanent  address
            var AddressLine1 = $("#PAddressLine1");
            var AddressLine2 = $("#PAddressLine2");
            var RoadStreetName = $("#PRoadStreetName");
            var LandMark = $("#PLandMark");
            var Locality = $("#PLocality");
            var State = $("#PddlState option:selected").text();
            var District = $("#PddlDistrict option:selected").text();
            var Taluka = $("#PddlTaluka option:selected").text();
            var Village = $("#PddlVillage option:selected").text();
            var Pincode = $("#PPinCode");

            //Present  address
            var PreAddressLine1 = $("#CAddressLine1");
            var PreAddressLine2 = $("#CAddressLine2");
            var PreRoadStreetName = $("#CRoadStreetName");
            var PreLandMark = $("#CLandMark");
            var PreLocality = $("#CLocality");
            //CoPrententPlaceHolder1_Address1_ddlState
            var PreState = $("#CddlState option:selected").text();
            var PreDistrict = $("#CddlDistrict option:selected").text();
            var PreTaluka = $("#CddlTaluka option:selected").text();
            var PreVillage = $("#CddlVillage option:selected").text();
            var PrePincode = $("#CPinCode");



            if (EL("myImg").src.indexOf("photo.png") != -1) {
                text += "<br /> -Please upload Applicant Photograph.";
                opt = 1;
            }

            if (FirstName.val() == '') {
                text += "<br /> -Please enter First Name. ";
                opt = 1;
            }

            if (LastName.val() == '') {
                text += "<br /> -Please enter Last Name. ";
                opt = 1;
            }


            if (FatherName.val() == '') {
                text += "<br /> -Please enter Father Name. ";
                opt = 1;
            }

            if (MobileNo.val() == '') {
                text += "<br /> -Please enter Mobile No. ";
                opt = 1;
            }

            if (MobileNo.val() != '') {
                var mobmatch1 = /^[789]\d{9}$/;
                if (!mobmatch1.test(MobileNo.val())) {
                    text += "<br /> -Please enter valid mobile Number.";
                    opt = 1;
                }
            }

            //if (EmailID.val() == '') {
            //    text += "<br /> -Please enter EMail ID. ";
            //    opt = 1;
            //}

            if (DOB.val() == '') {
                text += "<br /> -Please enter Date of Birth. ";
                opt = 1;
            }

            if ((Gender == '' || Gender == 'Select Gender')) {
                text += "<br /> -Please Select Gender. ";
                opt = 1;
            }

            if ((Religion == '' || Religion == 'Select')) {
                text += "<br /> -Please Select Religion. ";
                opt = 1;
            }

            if ((Category == '' || Category == 'Select')) {
                text += "<br /> -Please Select Category. ";
                opt = 1;
            }

            if ((Nationality == '' || Nationality == 'Select')) {
                text += "<br /> -Please Select Nationality. ";
                opt = 1;
            }

            if (AddressLine1 != null && AddressLine1.val() == '') {
                text += "<br /> -Please enter Care of Address in Permanent Address. ";
                opt = 1;
            }

            if (State != null && (State == '' || State == '-Select-')) {
                text += "<br /> -Please select State in Permanent Address.";
                opt = 1;
            }

            if (District != null && (District == '' || District == '-Select-' || District == 'Select District')) {
                text += "<br /> -Please select District in Permanent Address.";
                opt = 1;
            }

            if (Taluka != null && (Taluka == '' || Taluka == '-Select-' || Taluka == 'Select Block')) {
                text += "<br /> -Please select Taluka in Permanent Address.";
                opt = 1;
            }

            if (Village != null && (Village == '' || Village == '-Select-' || Village == 'Select Panchayat')) {
                text += "<br /> -Please select Village in Permanent Address.";
                opt = 1;
            }
            if (Pincode != null && Pincode.val() == '') {
                text += "<br /> -Please enter Pincode in Permanent Address.";
                opt = 1;
            }
            /////////////////////////
            if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
                text += "<br /> -Please enter Care of Address in Present Address. ";
                opt = 1;
            }

            if (PreState != null && (PreState == '' || PreState == '-Select-')) {
                text += "<br /> -Please select State in Present Address.";
                opt = 1;
            }

            if (PreDistrict != null && (PreDistrict == '' || PreDistrict == '-Select-' || PreDistrict == 'Select District')) {
                text += "<br /> -Please select District in Present Address.";
                opt = 1;
            }

            if (PreTaluka != null && (PreTaluka == '' || PreTaluka == '-Select-' || PreTaluka == 'Select Block')) {
                text += "<br /> -Please select Taluka in Present Address.";
                opt = 1;
            }

            if (PreVillage != null && (PreVillage == '' || PreVillage == '-Select-' || PreVillage == 'Select Panchayat')) {
                text += "<br /> -Please select Village in Present Address.";
                opt = 1;
            }
            if (PrePincode != null && PrePincode.val() == '') {
                text += "<br /> -Please enter Pincode in Present Address.";
                opt = 1;
            }
            /////////////////////////
            var pinmatch = /^[0-9]\d{5}$/;
            if (Pincode != null && Pincode.val() != '') {
                if (!pinmatch.test(Pincode.val())) {
                    text += "<br /> -Please enter valid pincode.";
                    opt = 1;
                }
            }


            var passOdia = $("input[name='radio1']:checked").val();

            if (passOdia == null) {
                text += "<br /> -Please choose whether Candidate has passed Odia.";
                opt = 1;
            }



            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                //alert(text);
                return false;
            }


            return true;

        }
    </script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <div class="clearfix">
                    <uc1:FormTitle runat="server" ID="FormTitle" />
                </div>
                <div class="row clearfix">
                    <div class="col-md-12 box-container mTop15" id="div1" runat="server">
                        <div class="box-heading" id="divInfo">
                            <h4 class="box-title">Other Information
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlReligion">
                                        Religion
                                    </label>
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
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlCategory">
                                        Category
                                    </label>
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
                                        <option value="Indian">Indian</option>
                                        <!--<option value="ST">Others</option>-->
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>


                <div>
                    <div class="col-md-12 box-container pleft0 pright0">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Educational Qualification upto HSC
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
                                                <th style="text-align: center; width: 10%; display: none">State</th>
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
                                                <th style="text-align: center; width: 8%;display:none">Action</th>
                                            </tr>
                                            <tr>
                                                <td style="display: none">
                                                    <select name="EddlBoardState" id="EddlBoardState" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select State.">
                                                    </select></td>
                                                <td style="width: 25%;">
                                                    <input id="txtExmntnName" class="form-control" placeholder="Examination Name" name="txtExmntnName" type="text" value="" autofocus="" />

                                                </td>
                                                <td style="">
                                                    <input id="txtPssngYr" class="form-control" placeholder="Year of Passing" name="txtPssngYr" type="text" value="" autofocus="" onkeypress="return isNumberKey(event, this);" maxlength="4" />
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
                                                    <input id="txtDivision" class="form-control" placeholder="Division" name="txtTDivision" type="text" value="" autofocus="" onkeypress="return isNumberKey(event, this);" maxlength="2" />
                                                </td>
                                                <td>
                                                    <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" value="" autofocus="" onkeypress="return isNumberKey(event, this);" maxlength="3" />
                                                </td>
                                                <td align="center">
                                                    <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" value="" autofocus="" onkeypress="return isNumberKey(event, this);" maxlength="3" />
                                                </td>
                                                <td align="center">
                                                    <input id="txtPercentage" class="form-control" placeholder="%" name="txtPrcntge" type="text" value="" autofocus="" onkeypress="return isNumberKey(event, this);" maxlength="2" />
                                                </td>
                                                <td style="display:none">
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
                                                <input type="radio" name="radio1" id="yes" value="yes" />Yes
                                            <label for="yes"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio1" id="no" value="no" />
                                                No
                                            <label for="no"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>

                                <div class="form-group">
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
                                                <input type="radio" name="radio2" id="Mrd" value="yes" />Yes
                                            <label for="Mrd"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio2" id="UnMrd" value="no" />
                                                No
                                            <label for="UnMrd"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
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
                                                <input type="radio" name="radio3" id="exarmyyes" value="yes" />
                                                Yes
                                            <label for="exarmyyes"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio3" id="exarmyno" value="no" />
                                                No
                                            <label for="exarmyno"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="clearfix"></div>
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
                                                <input id="SevsMonth" class="form-control mtop0" placeholder="Month" name="SevsMonth" value="" maxlength="3" autofocus="" readonly="readonly">
                                            </div>
                                            <div class="col-xs-3  pright0">
                                                <input id="SevsDay" class="form-control mtop0" placeholder="Day" name="SevsDay" value="" maxlength="3" autofocus="" readonly="readonly" />

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
                                                <input type="radio" name="radio4a" id="sptprsnYes" value="yes" />
                                                Yes
                                            <label for="exarmy"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio4a" id="sptprsnNo" value="no" />
                                                No
                                            <label for="sptprsn"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="clearfix"></div>
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
                                                <input type="radio" name="radio4b" id="wntavlrlxon" value="want relaxation" />
                                                Yes
                                            <label for="wntavlrlxon"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio4b" id="dntavlrlxon" value="Not want relaxation" />
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
                                                <input type="radio" name="radio6" id="HsCerfte" value="yes" />Yes
                                            <label for="HsCerfte"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio6" id="NtHvgCerfte" value="no" />No
                                            <label for="NtHvgCerfte"></label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
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
                                                <input type="radio" name="radio8" id="rdoDLYes" value="yes" />Yes
                                            <label for="HsCerfte"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio8" id="rdoDLNo" value="no" />
                                                No
                                            <label for="NtHvgCerfte"></label>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
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
                                <div class="clearfix"></div>
                                <div class="form-group mtop5">
                                    <div class="col-lg-12 othrinfohd">
                                        <div class="col-md-9 pleft0">
                                            <p><b><span class="fom-Numbx">9.</span> Whether the candidate involved in any criminal case?</b></p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <div class="col-xs-6 pleft0">
                                                <input type="radio" name="radio9" id="rdoCrmYes" value="yes" />Yes
                                            <label for="CrmnlInvlv"></label>

                                            </div>
                                            <div class="col-xs-6">
                                                <input type="radio" name="radio9" id="rdoCrmNo" value="no" />
                                                No
                                            <label for="NtCrmnlInvlv"></label>

                                            </div>
                                        </div>
                                    </div>
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
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="divBtn" class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-body box-body-open" style="text-align: center;">

                            <input type="button" id="btnSubmitV2" class="btn btn-success" value="Submit" onclick="SubmitDataV2();" />
                            <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Cancel" id="btnCancel" class="btn btn-danger" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>


                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" />
    <asp:HiddenField ID="HFAge" runat="server" Value="388" />
    <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />

</asp:Content>
