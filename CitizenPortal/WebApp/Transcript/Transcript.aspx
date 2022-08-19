<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="Transcript.aspx.cs" Inherits="CitizenPortal.WebApp.Transcript.Transcript" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script><script src="bootstrap-datetimepicker.min.js"></script>
    <%--<script src="moment.min.js"></script>--%>

    
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <%--<script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>--%>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    
      <%--<link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />--%>

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">--%>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">


    <script src="Transcript.js"></script>
    <style type="text/css">
    .multiselect-container {
        width: 100% !important;
    }
        .dropdown-menu > li > a {
        color:black !important;
        }

        
    </style>

    <script>
 $(document).ready(function () {

            debugger;
            $('#Age').attr("readonly", true);
            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {

                    var t_DOB = $("#DOB").val();

                    var D1 = t_DOB.split('/');
                    var calday = D1[0];
                    var calmon = D1[1];
                    var calyear = D1[2];

                    /*var S_date = calyear.toString() + "/" + calmon.toString() + "/" + calday.toString();  //new Date(calyear, calmon - 1, calday);
    
                    var Age = calage(S_date);
                    */
                    t_DOB = t_DOB.replace("-", "/");
                    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    //var Age = calage(S_date);
                    //var Age = calcDobAge(t_DOB);
                    var Age = calcExSerDur(t_DOB, "01/01/2021")
                    if (Age != null && Age < 18) {
                        alertPopup("Age Validate", "Age allow 18 years or above");
                        return false;
                    }
                    else {

                        $("#Year").val(Age.years + " Years");
                        $("#Month").val(Age.months + " Month");
                        $("#Day").val(Age.days + " Days");
                    }

                    if (!ValiateAge(Age.years)) {
                        return false;
                    }


                }
            });
        });



        //details
        function calage1(dob) {
            debugger;
            var D1 = dob.split('/');
            var calday = D1[0];
            var calmon = D1[1];
            var calyear = D1[2];

            var curd = new Date(curyear, curmon - 1, curday);
            var cald = new Date(calyear, calmon - 1, calday);
            var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
            var dife = datediff(curd, cald);
            return dife[0];
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i> Application for Transcript</h2>
                </div>
            </div>

            <div class="" style="">

                <div class="row">

                    <div class="col-md-9 p0">
                        <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Student Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-5 col-md-4 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory">CSVTU Enrollment No.</label>
                                        <input id="RegdNo" type="text" class="form-control" maxlength="6" placeholder="CSVTU Enrollment No." onchange="ValidateCSVTURegNo();" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-5 col-md-4 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory">CSVTU Roll No.</label>
                                        <input id="RollNo" type="text" class="form-control" maxlength="6" placeholder="CSVTU Roll No." onchange="ValidateCSVTURegNo();" />
                                    </div>
                                </div>  

                                <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            Gender</label>
                                        <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                            <option value="0">Select</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Transgender">Transgender</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="DOB">
                                            Date of Birth <span style="font-size: 11px;"></span>
                                        </label>
                                        <input id="DOB" class="form-control" placeholder="DOB" name="DOB" value="" onkeypress="return ValidateAlpha(event);" onkeydown=" return allowBackspace(event);" maxlength="10" />

                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-3" style="display:none">
                                    <div class="form-group">
                                        <label class="" id="AAO" for="AAO">
                                        </label>
                                        <%--<input id="Age" class="form-control" placeholder="Age (in years)" name="Age" maxlength="2" disabled="disabled" />--%>

                                        <div class="col-xs-4 pleft0 pright0 margin-btm">
                                            <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" maxlength="3" readonly="readonly" />
                                        </div>
                                        <div class="col-xs-4 pleft0 pright0">
                                            <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" maxlength="3" readonly="readonly" />
                                        </div>
                                        <div class="col-xs-4 pleft0 pright0">
                                            <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" maxlength="3" readonly="readonly" />
                                        </div>
                                        <%----%>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                                    <div class="form-group">
                                        <label class="manadatory">College Name</label>
                                        <select name="" id="CollegeName" class="form-control" onchange="GetCourse();">
                                            <option value="0">-Select-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory">
                                            Course Name</label>
                                        <select name="" id="CourseName" class="form-control" onchange="GetProgram();">
                                            <option value="0">-Select-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory">Program Name</label>
                                        <select name="" id="ProgramName" class="form-control">
                                            <option value="0">-Select-</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="firstname">
                                            Name of Student</label>
                                        <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" maxlength="100" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory">
                                            Father's / Husband's Name</label>
                                        <input id="FatherName" class="form-control" placeholder="Father's/Husband Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" maxlength="100" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYear">Admission Year</label>
                                        <select name="" id="ddlAdmission" class="form-control">
                                            <option value="0">-Select-</option>
                                            <option value="2020-2021">2020-2021</option>
                                            <option value="2019-2020">2019-2020</option>
                                            <option value="2018-2019">2018-2019</option>
                                            <option value="2017-2018">2017-2018</option>
                                            <option value="2016-2017">2016-2017</option>
                                            <option value="2015-2016">2015-2016</option>
                                            <option value="2014-2015">2014-2015</option>
                                            <option value="2013-2014">2013-2014</option>
                                            <option value="2012-2013">2012-2013</option>
                                            <option value="2011-2012">2011-2012</option>
                                            <option value="2010-2011">2010-2011</option>
                                            <option value="2009-2010">2009-2010</option>
                                            <option value="2008-2009">2008-2009</option>
                                            <option value="2007-2008">2007-2008</option>
                                            <option value="2006-2007">2006-2007</option>
                                            <option value="2005-2006">2005-2006</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="MobileNo">
                                            Mobile Number</label>
                                        <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event);" type="text" value="" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="EmailID" class="manadatory">
                                            Email ID</label>
                                        <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50" style="" />
                                        <br />
                                        <div>

                                            <table class=" table table-bordered table-hover table-condensed">
                                                <tr>
                                                    <td colspan="3"><b>Transcript Fees Details</b></td>
                                                </tr>
                                                <tr style="font-weight:bold">
                                                    <td>Sl.</td>
                                                    <td>Particular</td>
                                                    <td>Rate</td>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Per Transcript</td>
                                                    <td>Rs.100</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Urgent addational </td>
                                                    <td>Rs.200</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>Delivery by Post </td>
                                                    <td>Rs.100</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td colspan="2">Maximum No. of Coppies for a semester is 15</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">For example, if <b>1 to 8 Semester</b> is selected with <b>1 No. of Coppies</b> each and applied as <b>Urgent</b> and <b>Delivery by Post</b> then Payable amount will be <b>Rs.1700</b></td>
                                                </tr>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4" style="display: none">
                                    <div class="form-group">
                                        <label class="manadatory">
                                            Mother's Name</label>
                                        <input id="MotherName" class="form-control" placeholder="Mother's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" maxlength="100" />
                                    </div>
                                </div>
                                
                                <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4" style="display: none">
                                    <div class="form-group">
                                        <label class="manadatory" for="firstname">
                                            Student Name in English</label>
                                        <input id="txtStudentEng" class="form-control" placeholder="Student Name in English" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" maxlength="100" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4" style="display: none">
                                    <div class="form-group">
                                        <label class="manadatory">
                                            Student Name in Hindi</label>
                                        <input id="txtStudentHin" class="form-control" placeholder="Student Name in Hindi" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" maxlength="100" />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                                    <div class="form-group">
                                        <label class="manadatory" for="">
                                            Select Semester
                                        </label>                                        
                                        <asp:ListBox ID="ddlSemester" runat="server" Width="100%" SelectionMode="Multiple" ClientIDMode="Static"></asp:ListBox>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label id="lblSemester" class="manadatory" for="">
                                            Semester Detail & its Coppies
                                        </label>                                        
                                        <div id="grd">

                                        </div>
                                    </div>
                                </div>
                                
                                <div style="display:none">
                                    <input type="button" id="btnSemester" class="btn btn-success" value="btnSemester"/>
                                <div class="clearfix"></div>
                                
                                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label style="font-size:25px;color:maroon"><i class="fa fa-info"></i></label>                                            
                                        </div>
                                    </div>
                                    <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                        <div class="form-group">                                            
                                            <label style="color:red"><b>Please Note : </b>Student Name in English & Student Name in Hindi, will be printed on Certificate, please enter correct name without any salutation.</label>
                                        </div>
                                    </div>
                                <div class="clearfix"></div>
                                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label style="font-size:25px;color:maroon"><i class="fa fa-edit"></i></label>
                                        </div>
                                    </div>
                                    <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                        <div class="form-group">                                            
                                            <label style="color:red">For Hindi typing, please visit <b><a href="https://www.easyhindityping.com/unicode-hindi-typing" style="color:blue" >https://www.easyhindityping.com/unicode-hindi-typing</a></b> and type your Name in Hindi and copy & paste it in <b>Student Name in Hindi textbox</b></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-3 p0">

                        <div id="divPhoto" class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">Student Photograph
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-lg-12">
                                    <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 200px; margin: 10px 0" id="myImg" />
                                    <input class="camera" id="ApplicantImage" name="Photoupload" type="file" />
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                        <div id="divSign" class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title manadatory">Student Signature
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-lg-12">
                                    <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 125px; margin: 10px 0" id="mySign" />
                                    <input class="camera" id="ApplicantSign" name="Photoupload" type="file" />
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="divAddress" class="row" style="">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Delivery Details
                            </h4>
                        </div>

                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlMode">
                                        Delivery Mode</label>
                                    <select class="form-control" data-val="true" data-val-required="Please select Deliver Mode" id="ddlMode" name="Deliver Mode" style="">
                                        <option value="0">Select</option>
                                        <option value="Offline by Post">Offline by Post</option>
                                        <option value="Offline by Hand">Offline by Hand</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-2 col-md-3 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlType">
                                        Delivery Type</label>
                                    <select class="form-control" data-val="true" data-val-required="Please select Deliver Type" id="ddlType" name="Deliver Type">
                                        <option value="0">Select</option>
                                        <option value="Urgent">Urgent</option>
                                        <option value="Normal">Normal</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="AddressLine1">
                                        Address Line-1 (Care of/ House/Building)
                                    </label>
                                    <input name="" type="text" id="PAddressLine1" class="form-control" placeholder="First Line Address" maxlength="50" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="RoadStreetName">
                                        Address Line-2 (Road/Street Name/Locality)
                                    </label>
                                    <input name="" type="text" id="PRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="50" onchange="return checkLength(this);" autofocus="" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlState">
                                        State
                                    </label>
                                    <select name="" id="PddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state" onchange="GetOUATDistrict();">
                                    </select>
                                    <input name="" type="text" id="txtState" class="form-control" placeholder="Enter State Name" autofocus="" style="display: none;" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDistrict">
                                        District
                                    </label>
                                    <select name="" id="PddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District." onchange="GetOUATBlock();">
                                        <option value="0">Select District</option>
                                    </select>
                                    <input name="" type="text" id="txtDistrict" class="form-control" placeholder="Enter District Name" autofocus="" style="display: none;" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label for="ddlTaluka">
                                        Block/Taluka
                                    </label>
                                    <select name="" id="PddlTaluka" class="form-control" data-val="true" data-val-number="Taluka." data-val-required="Please select block." onchange="GetOUATPanchayat();">
                                        <option value="0">Select Block</option>
                                    </select>
                                    <input name="" type="text" id="txtBlock" class="form-control" placeholder="Enter Block Name" autofocus="" style="display: none;" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="text-nowrap" for="ddlVillage">
                                        Panchayat/Village/City
                                    </label>
                                    <select name="" id="PddlVillage" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select panchayat">
                                        <option value="0">Select Panchayat</option>
                                    </select>
                                    <input name="" type="text" id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" autofocus="" style="display: none;" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="PIN">
                                        Pin Code
                                    </label>
                                    <input name="" type="text" id="PPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return isNumberKey(event);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="">Remark</label>
                                    <input id="txtRemark" type="text" class="form-control" maxlength="100" placeholder="Applicant Remark" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>

                    </div>
                </div>               

                <%----Start of Declaration-----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Declaration
                            </h4>
                        </div>
                        <%--<uc1:Declaration runat="server" id="Declaration" />--%>
                        <div class="box-body box-body-open">
                            <div class="col-sm-6 col-md-6 col-lg-12">
                                <div class="text-danger text-danger-green mt0">
                                    <p class="text-justify">
                                        <input name="" type="checkbox" id="chkDeclaration" onclick="javascript: Declaration(this.checked);" />
                                        I 
                <span id="spndecl" style="font-weight: bold; text-transform: uppercase;"></span>
                                        solemnly affirm that the above mentioned information / documnets submitted by me is true and correct to my knowledge and belief. I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date.                                        
                                    </p>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                            <tr>
                                                <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;"></span>
                                                    
                                                </b>
                                                    <br />
                                                </td>

                                                <td rowspan="2"><span class="pull-right" style="color: #000;"><span id="lblApplicant" style="text-transform: uppercase; float: right; color: #000; font-weight:bold; padding-right: 50px;"></span>
                                                    <br />
                                                    Full Name of the Candidate</span></td>
                                            </tr>
                                            <tr>
                                                <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">Date : </span>
                                                    <label id="currntdte" style="font-weight: bold"></label>
                                                </b></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>

                        </div>
                    </div>
                </div>
                <%----End of Declaration-----%>

                <%---Start of Button----%>
                <div class="row" id="divButton" runat="server">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Submit"/>
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" CssClass="btn btn-danger" Text="Cancel" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
            </div>
        </div>
    
    </div>
</asp:Content>
