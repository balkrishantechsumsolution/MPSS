<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="DEOAdmissionForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CBCS.DEOAdmissionForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--For Date Picker--%>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--For Date Picker--%>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />   

     <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/CBCS/DEO.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            
            $('#SubjectList').hide();

            var User = $("#HDFUserID").val();
            var CollegeName = $("#HDFCName").val();
            var CollegeCode = $("#HDFCCode").val();

            $("#UserID").val(User);
            //$("#CollegeCode").val(CollegeCode);
            //$("#CollegeName").val(CollegeName);


            $('#txtBirthDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                onSelect: function (date) {

                }
            });
            $('#txtDOA').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
            //$('#DOB').datepicker({
            //    dateFormat: "dd/mm/yy",
            //    changeMonth: true,
            //    changeYear: true,
            //    yearRange: "-100:+0",
            //    onSelect: function (date) {

            //    }
            //});
            $('#YOP').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
            $('#DOA').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
       
         
            $('#Age').attr("readonly", true);
            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    debugger;
                    var t_DOB = $("#DOB").val();
                    /*
                    var D1 = t_DOB.split('/');
                    var calday = D1[0];
                    var calmon = D1[1];
                    var calyear = D1[2];
    
                    var S_date = calyear.toString() + "/" + calmon.toString() + "/" + calday.toString();  //new Date(calyear, calmon - 1, calday);
    
                    var Age = calage(S_date);
                    */
                    t_DOB = t_DOB.replace("-", "/");
                    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    //var Age = calage(S_date);
                    var Age = calage1(t_DOB);
                    if (Age != null && Age < 15) {
                        alertPopup("Age Validate", "Age allow minimum 15 year's");
                        $("#DOB").val('');
                        $('#Age').val('');
                    }
                    else {
                        $('#Age').val(Age);
                    }


                }
            });
        });

        function calage1(dob) {
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
     <!----Progressbar---------->
   <div id="progressbar" class="modalBackground" runat="server" clientidmode="Static" style="height: 700%; border: 1px solid #ccc; display: none">
        <div style="z-index: 105; left: 40%; position: absolute; top: 70%;" class="text-center">
            <img id="imgloader" alt="" runat="server" src="/WebApp/Kiosk/Images/loading.gif" style="height: 200px;" />
            <p class="text-danger">
                Please do not refresh or click back button<br />
                as Request is Processing....
            </p>
        </div>
    </div>

    <div id="page-wrapper" style="min-height: 500px !important;">


        <div class="col-lg-12 home-contentbox">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                        +3 Examination Enrollment (CBCS)
                    </h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="display: none;">
                    <div id="divErr" class="danger error bg-warning">
                        Please enter Date of Birth, Mobile Number (Mandatory) and any one of Roll Number or Application No or Aadhaar Number fields to access the OUAT Application FORM-B.
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="mtop10"></div>
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">College Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">
                                    User Id
                                </label>
                                <input type="text" id="UserID" class="form-control" placeholder="User Id" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label>College Code</label>
                                <input id="CollegeCode" type="text" class="form-control" placeholder="College Code" disabled="disabled" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label>College Name</label>
                                <%--<input id="CollegeName" type="text" class="form-control" placeholder="College Name" disabled="disabled" />--%>
                                <select id="ddlCollege" class="form-control">
                                    <option value="0">--Select--</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div id="divDetails" class="col-md-12 box-container">
                    <div class="box-heading" id="Div4">
                        <h4 class="box-title">Student Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="firstname">
                                    Name of Student</label>
                                <input id="FirstName" class="form-control" placeholder="Full Name" name="FirstName" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" autocomplete="off" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Father's Name</label>
                                <input id="FatherName" class="form-control" placeholder="Father's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">
                                    Mother's Name</label>
                                <input id="MotherName" class="form-control" placeholder="Mother's Name" name="" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" type="text" autofocus="" maxlength="100" autocomplete="off" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-5 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label>
                                    Guardian Name</label>
                                <input id="GuardianName" class="form-control" placeholder="Guardian Name" name="Father Name" type="text" value="" autofocus="" maxlength="100" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label>
                                    Relation with Guardian
                                </label>
                               <select id="ddlRelation" class="form-control">
                                   <option value="Select">Select</option>
                               </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    Date of Birth <span style="font-size: 11px;"></span>
                                </label>
                                <input id="DOB" class="form-control" placeholder="dd/MM/yyyy" name="DOB" value="" autofocus="" maxlength="10" onchange="CalculateAge();" autocomplete="off" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    Age on(01.01.2018) <span style="font-size: 11px;"></span>
                                </label>
                                <input id="Age" class="form-control" placeholder="Age (in years)" name="Age" maxlength="2" disabled="disabled" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlGender">
                                    Gender</label>
                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                    <option value="0">Select</option>
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                    <option value="T">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtTongue">
                                    Mother Tongue</label>

                                <select class="form-control" data-val="true" data-val-number="mothertongue" id="txtTongue" name="txtTongue">
                                    <option value="0">Select</option>
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
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Category</label>
                                <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="ddlcategory" name="Category">
                                    <option value="Select Category">Select</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                    <option value="OBC">OBC</option>
                                    <option value="General">General</option>
                                </select>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">
                                    Mobile Number</label>
                                <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event); " type="text" value="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label>
                                    Email ID</label>
                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" autofocus="" style="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-4 col-lg-4" id="DivMTOther">
                            <div class="form-group">
                                <label for="MTOthers" class="manadatory">
                                    MotherTongue Other</label>
                                <input id="MTOther" class="form-control" placeholder="Mother Tongue Other" type="text" value="" maxlength="30" autofocus="" style="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12" style="display: none">
                            <p class="ptop10"><i class="fa fa-info-circle pright5" style="color: #000;"></i>SC,ST SEBC candidates should attach self attested copy of respective Caste Certificate.<span style="color: red;">*</span></p>

                        </div>

                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Admission Details
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="col-xs-12 alert alert-info">
                        For Admission No. please enter logical sequece no like "<b>20/198/AP/001</b> " 
                     <br/>   2-digit for Academic Year
                     <br/>   3-digit for College Code  
                     <br/>   2- Alphabet for Course Code (AH,AP,SH,SP,CH,CP) and
                     <br/>   3-digit for running sequence no. 
                     <br/>   Example : <b>&nbsp;&nbsp; 20/001/AP/003</b>
                     <br/>       <b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20/002/AH/001</b>
                        <br />
                        <b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20/219/SH/001</b>
                    </div>
                     <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Admission Number</label>
                            <input type="text" id="AdmissionNo" class="form-control" placeholder="Admission No." onkeypress="return AlphaNumericHypenNSlash(event);"  maxlength="18" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Date of Admission into the College</label>
                            <input type="text" id="DOA" class="form-control" placeholder="" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">
                                Branch</label>
                            <select id="ddlBranch" class="form-control" onchange="GetCBCSSubjectList();">

                                <option value="0">Select</option>                                
                            </select>

                        </div>
                    </div>
                    <div id="lblSubjectList">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label class="manadator" style="font-weight: bold;">
                                <span id="SubjectName"></span>
                            </label>
                            <div class="col-xs-3 pleft0" id="DivCore1">
                                <%-- <div id="divchklist"></div>--%>
                                <label class="manadatory" id="lblDSCI">
                                    DSC-Honours (Choose any one)</label>
                                <select id="ddlAP" class="form-control">
                                    <option value="0">Select</option>
                                </select>
                            </div>
                            <div class="col-xs-3" id="DivCore2">
                                <label class="manadatory" id="lblDSCII">
                                    DSC-A (Choose Any one)</label>
                                <select id="ddlAP1" class="form-control">
                                    <option value="0">Select</option>
                                </select>
                            </div>
                            <div class="col-xs-3" id="DivCore3">
                                <label class="manadatory" id="lblDSCIII">
                                    DSC-B (Choose Any one)</label>
                                <select id="ddlAP2" class="form-control">
                                    <option value="0">Select</option>
                                </select>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivGE">
                        <div class="form-group">
                            <label class="" id="lblGE" >
                                GE</label>
                            <select id="ddlGE" class="form-control">
                                <option value="0">Select</option>  
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivGEII">
                        <div class="form-group">
                            <label class="manadatory" id="lblGEII" >
                                GE-II</label>
                            <select id="ddlGEII" class="form-control">
                                <option value="0">Select</option>  
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-5 col-lg-3" id="DivMIL">
                        <div class="form-group">
                            <label class="manadatory" id="lblMIL">
                                MIL</label>
                            <select id="ddlMIL" class="form-control">
                                <option value="0">Select</option>    
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivAECC">
                        <div class="form-group">
                            <label class="manadatory" id="lblAECC">
                                AECC-II</label>
                            <select id="ddlAECC" class="form-control">
                                <option value="0">Select</option>   
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivSEC">
                        <div class="form-group">
                            <label class="manadatory" id="lblSEC">
                                SEC-B</label>
                            <select id="ddlSECB" class="form-control">
                                <option value="0">Select</option>    
                            </select>
                        </div>
                    </div>
                        </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            </div>
            <div id="divBtn" class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="SAVE" title="Proceed to Upload Necessary Document" onclick="SubmitData();"/>
                                <%--<input type="submit" name="" value="Cancel" id="Button1" title="Refresh the page" class="btn btn-danger"/>--%>
                                <input type="submit" name="" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary"/>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
        </div>
    </div>
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HDFUserID" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HDFCCode" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HDFCName" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdfAffiliationNo" runat="server" ClientIDMode="Static" />
    
</asp:Content>
