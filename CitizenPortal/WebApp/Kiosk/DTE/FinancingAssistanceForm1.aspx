<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="FinancingAssistanceForm1.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DTE.FinancingAssistanceForm1" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="../../Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="../../Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="FinancingAssitance.js"></script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .instn {
            background-color: #E6F2FF;
            border-right: 2px solid #C4E0FF;
            border-bottom: 2px solid #C4E0FF;
            border-left: 2px solid #C4E0FF;
            padding-left: 15px;
            font-size: 14px;
            color: #000;
            line-height: 22px;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            ShowHideServices();
        });

        function ShowHideServices() {
            var Servicetype = $('#drpSelectService :selected').val();
            var Servicetitle = $('#drpSelectService :selected').text();
            if (Servicetype == "0") {
                $("div[id$='ServiceTitle']").hide(800);
                $("div[id$='StudentService1']").hide(800);
                $("div[id$='StudentService2']").hide(800);
                $("div[id$='StudentService3']").hide(800);
                $("div[id$='StudentService4']").hide(800);
            }
            if (Servicetype == "Service1") {
                $("div[id$='StudentService4']").hide(800);
                $("div[id$='StudentService2']").hide(800);
                $("div[id$='StudentService3']").hide(800);
                $("div[id$='ServiceTitle']").show(800);
                $("label[id$='lblServiceTitle']").text("");
                $("label[id$='lblServiceTitle']").text(Servicetitle);
                $("div[id$='StudentService1']").show(800);
            }
            if (Servicetype == "Service2") {
                $("div[id$='StudentService1']").hide(800);
                $("div[id$='StudentService4']").hide(800);
                $("div[id$='StudentService3']").hide(800);
                $("div[id$='ServiceTitle']").show(800);
                $("label[id$='lblServiceTitle']").text("");
                $("label[id$='lblServiceTitle']").text(Servicetitle);
                $("div[id$='StudentService2']").show(800);
            }
            if (Servicetype == "Service3") {
                $("div[id$='StudentService1']").hide(800);
                $("div[id$='StudentService2']").hide(800);
                $("div[id$='StudentService4']").hide(800);
                $("div[id$='ServiceTitle']").show(800);
                $("label[id$='lblServiceTitle']").text("");
                $("label[id$='lblServiceTitle']").text(Servicetitle);
                $("div[id$='StudentService3']").show(800);
            }
            if (Servicetype == "Service4") {
                $("div[id$='StudentService1']").hide(800);
                $("div[id$='StudentService2']").hide(800);
                $("div[id$='StudentService3']").hide(800);
                $("div[id$='ServiceTitle']").show(800);
                $("label[id$='lblServiceTitle']").text("");
                $("label[id$='lblServiceTitle']").text(Servicetitle);
                $("div[id$='StudentService4']").show(800);
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" class="pleft15 pright15">
        <div class="row" style="display: none;" id="ServiceTitle">
            <div class="col-lg-12">
                <%--<h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>{{titleData.lblTitle}}</h2>--%>
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                    <label id="lblServiceTitle" style="font-size: 25px" />
                </h2>
            </div>
        </div>
        <div class="mtop10"></div>
        <div class="row">
            <div class="col-lg-12 box-container">
                <div>
                    <div style="width: 50%; padding: 1px; color: #fff; border: 10px solid #eeeeee; border-radius: 6px; margin: 0 auto;">
                        <div class="form-group">
                            <select class="form-control" id="drpSelectService" onchange="ShowHideServices();" style="width: 95%; margin-left: 10px; margin-top: 12px; color: #212121; font-weight: bold;">
                                <option value="0">-Select Service-</option>
                                <option value="Service1">Financial Assistance (Guardian’s Death Category)</option>
                                <option value="Service2">Study Allowance To Meritorious Students (EB)</option>
                                <option value="Service3">Scholarship To Girl Toppers</option>
                                <option value="Service4">Scholarship To PWD Candidates</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="StudentService1" style="display: none">
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Instruction to Fill the Form
                                    <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                        <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i>
                                    </span>
                            <span class="clearfix"></span>
                        </h4>
                    </div>
                    <div class="instn" id="divInfo">
                        <p><b style="color: #000; padding-top: 10px;">Document to be attached</b></p>
                        <ul>
                            <li>1.	Copy of HSC</li>
                            <li>2.	Copy of death certificate of Financing guardian</li>
                            <li>3.	Income certificate of the next guardian</li>
                            <li>4.	Document regarding receipt of Financing assistant under PRERANA SCHEME, if any.</li>
                            <li><b>Note : </b>In case of death of the financing guardian of the student and if the next financing guardian’s annual income is less than Re 6,00000.00, then the next remaining entire expenditure till completion of the course will be bear by the government and the said approved amount will be given to the student through their institution. </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Additional Information</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="Semester">Type of Institute </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstituteType" onchange="OnchangeFunction();">
                                    <option value="0">-Select-</option>
                                    <option value="Private">Private</option>
                                    <option value="Government">Government</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 ">
                            <label id="TankArea">Registration Number</label>
                            <div class="form-group">
                                <input id="txtRegistrationNo" class="form-control mtop0" placeholder="Start with F or L max 11 digit numeric" maxlength="12" onkeypress="return AlphaNumeric(event);" onchange="RegistrationNo();","checkLength();" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0 pright0">
                            <div class="form-group">
                                <label class="manadatory" for="Semester">Admission Year</label>
                                <select class="form-control" data-val="true" data-val-required="Please select" id="drpAdmisionYear" name="Tank Status">
                                    <option value="0">-Select-</option>
                                    <option value="2012">2012</option>
                                    <option value="2013">2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="Semester">Which Semester Financing Guardian Expired </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpSemester" name="Tank Status" onchange="GovernmentIncome();">
                                    <option value="0">-Select-</option>
                                    <option value="1stSem">1st Semester</option>
                                    <option value="2ndSem">2nd Semester</option>
                                    <option value="3rdSem">3rd Semester</option>
                                    <option value="4thSem">4th Semester</option>
                                    <option value="5thSem">5th Semester</option>
                                    <option value="6thSem">6th Semester</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="DOD of FG" id="">DOD Financing Guardian</label>
                                <input id="DODGuardian" class="form-control" placeholder="Date of Death" maxlength="12" onkeypress="return AlphaNumeric(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="DOD of FG" id="">Next Guardian Income</label>
                                <input id="txtAnnualIncome" class="form-control" placeholder="Annual Income" maxlength="6" onkeypress="return isNumberKey(event);" onchange="AnnualIncome();" />

                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 pright0">
                            <div class=" form-group  ">
                                <label class="manadatory" for="InstitutionName">
                                    Name of the Institution<span style="font-size: 11px;"></span>
                                </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstitutionName" name="">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class=" form-group  ">
                                <label class="manadatory" id="lblBranch">Branch<span style="font-size: 11px;"></span></label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpBranchName" name="DistrictName">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                            <div class="form-group">
                                <div class="col-xs-2 pleft0">
                                    <label for="PlotNo">Tuition Fee</label>
                                    <input id="txtTuitionFee" class="form-control" placeholder="Tuition Fee" readonly="true" type="text" maxlength="5" onchange="GovernmentIncome();" />
                                </div>
                                <div class="col-xs-2 pleft0 pright0">
                                    <label for="PlotNo">Development Fee</label>
                                    <input id="txtDevelopmentFee" class="form-control" readonly="true" placeholder="Development Fee" type="text" maxlength="5" onchange="GovernmentIncome();" />
                                </div>
                                <div class="col-xs-3">
                                    <label for="PlotNo">ExaminationFee</label>
                                    <input id="txtExaminationFee" class="form-control" placeholder="Examination Fee" readonly="true" type="text" maxlength="3" onchange="GovernmentIncome();" />
                                </div>
                                <div class="col-xs-2 pleft0 pright0">
                                    <label for="PlotNo">Books</label>
                                    <input id="txtStudyBooks" class="form-control" placeholder="Books" name="Development Fee" type="text" maxlength="4" onchange="Studymaterial();" />
                                </div>
                                <div class="col-xs-3 pright0">
                                    <label for="PlotNo">StudyMaterial</label>
                                    <input id="txtStudyMaterial" class="form-control" placeholder="Study material" name="Development Fee" type="text" maxlength="5" onchange="Studymaterial();" />
                                </div>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pright0">
                            <div class="form-group">
                                <label for="AnnualIncome">Category</label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpCategory" onchange="SelectInstitude();">
                                    <option value="0">-Select-</option>
                                    <option value="General">General</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pright0">
                            <div class="form-group">
                                <label class="manadatory">Student Type</label>

                                <select class="form-control" data-val="true" id="drpStudentType">
                                    <option value="0">-Select-</option>
                                    <option value="DayScholar">Day Scholar</option>
                                    <option value="HostelBorders">Hostel Borders</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 pright0">
                            <div class="form-group">
                                <label for="PlotNo">Conveyance (in Kms)  Amount </label>
                                <div class="col-xs-6 pleft0">
                                    <select class="form-control" data-val="true" data-val-required="Please select." id="drpConveyanceKm">
                                        <option value="0">-Km-</option>
                                        <option value="Upto20km">Upto20km</option>
                                        <option value="Beyond20km">Beyond20km</option>
                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    <input id="txtConveyance" class="form-control" placeholder="Conveyance " name="Development Fee" type="text" maxlength="5" onchange="ConvenceKm();" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="ddlGovinstitude">
                            <label for="">Hostel Charges for Govt. Institute</label>
                            <div class="form-group">
                                <div class="col-xs-6 pleft0">
                                    <input id="txtHostelRentElect" class="form-control" placeholder="Hostel Rent & Electricity" maxlength="4" onkeypress="return isNumberKey(event);" onchange="GovHostelcharge();" />
                                </div>
                                <div class="col-xs-6 pright0">
                                    <input id="txtHostelContDevFee" class="form-control" placeholder="Contingency & Dev.Fee" maxlength="4" onkeypress="return isNumberKey(event);" onchange="GovHostelcharge();" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="ddlpriinstitude">
                            <label for="">Hostel Charges for Private Institute</label>
                            <div class="form-group">
                                <div class="col-xs-6 pleft0">
                                    <select class="form-control" data-val="true" data-val-required="Please select." id="drpHostelType" onchange="GovernmentIncome();">
                                        <option value="0">-Select-</option>
                                        <option value="Own">Own</option>
                                        <option value="Rented">Rented</option>
                                    </select>
                                </div>
                                <div class="col-xs-6 pright0">
                                    <input id="txtPriAnnualIncome" class="form-control" placeholder="Annual Amount" maxlength="8" onkeypress="return isNumberKey(event);" onchange="GovernmentIncome();" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <div class="form-group">
                                <label class="manadatory">Tuition Fee Waiver</label>

                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpTuitionFeeWaiver" onchange="GrandTotale();">
                                    <option value="0">-Select-</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <label class="manadatory">Total Fee</label>
                            <input id="txtTotalFee" class="form-control mtop0" placeholder="Total Fee" readonly="true" maxlength="5" />
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="PreranaScheme">
                            <div class="form-group">
                                <label class="manadatory">Benefits Amt. Received</label>
                                <input id="txtPreranaScheme" class="form-control mtop0" placeholder="Under PRERANA SCHEME" name="Production in Value" maxlength="8" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Bank Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Bank Name</label>
                                <input id="txtBankName" class="form-control" placeholder="Bank Name" type="text" maxlength="50" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Account Holder's Name</label>
                                <input id="txtAcHolderName" class="form-control" placeholder="Account Holder's Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Account No.</label>
                                <input id="txtBankAcNo" class="form-control" placeholder="Account Number" type="text" maxlength="12" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">IFSC Code</label>
                                <input id="txtBankIFSCode" name="IFSCCode" class="form-control" placeholder="IFSC Code" type="text" maxlength="11" onchange="AllowIFSCode();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Issuer Details Of Death Certificate</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Name of Issuing Authority</label>
                                <input id="txtIssuingAuthority" class="form-control" placeholder="Name of Issuing Authority" type="text" maxlength="50" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Address</label>
                                <input id="txtAddress" class="form-control" placeholder="Issuing Authority Address" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Contact No (both Desk and Cell)</label>
                                <input id="txtContactNo" class="form-control" placeholder="98XXXXXXXX-0124XXXXXX" type="text" maxlength="21" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Email-id (optional)</label>
                                <input id="txtEmailid" class="form-control" placeholder="Email-id (optional)" type="text" maxlength="30" onchange="EmailValidation();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 box-container" style="margin-top: 5px;">
                    <div class="box-body box-body-open" style="text-align: center; border-top: 1px solid #ccc;">
                        <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitData();" />
                        <input type="submit" name="Button1" value="Cancel" id="Button1" class="btn btn-danger" />
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <div id="StudentService2" style="display: none">
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Instruction to Fill the Form
                                    <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                        <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i>
                                    </span>
                            <span class="clearfix"></span>
                        </h4>
                    </div>
                    <div class="instn" id="divInfo">
                        <p><b style="color: #000; padding-top: 10px;">Document to be attached</b></p>
                        <ul>
                            <li>1.	HSC Certificate.</li>
                            <li>2.	Income Certificate.</li>
                            <li>3.	Council issued Registration No.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Additional Information</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <label id="TankArea2">Registration Number</label>
                            <div class="form-group">
                                <input id="txtRegistrationNo2" style="width: 195px;" class="form-control mtop0" placeholder="Start with  F  or  L max 11 digit numeric" maxlength="12" onkeypress="return AlphaNumeric(event);" onchange="RegistrationNo2();" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2  pright1">
                            <div class="form-group">
                                <label class="manadatory" for="AdmissionYear">Year of Admission</label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpAdmisionYear2">
                                    <option value="0">-Select-</option>
                                    <option value="2012">2012</option>
                                    <option value="2013">2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="Semester">Semester </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpSemester2" name="Tank Status">
                                    <option value="0">-Select-</option>
                                    <option value="1stSem">1st Semester</option>
                                    <option value="2ndSem">2nd Semester</option>
                                    <option value="3rdSem">3rd Semester</option>
                                    <option value="4thSem">4th Semester</option>
                                    <option value="5thSem">5th Semester</option>
                                    <option value="6thSem">6th Semester</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pleft0 pright0">
                            <div class="form-group">
                                <label class="manadatory" style="text-align: left" for="Semester">Type of Institute </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstituteType2" onchange="OnchangeFunction2();">
                                    <option value="0">-Select-</option>
                                    <option value="Private">Private</option>
                                    <option value="Government">Government</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="InstitutionName">
                                    Name of the Institution<span style="font-size: 11px;"></span>
                                </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstitutionName2" name="">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0">
                            <div class=" form-group  ">
                                <label class="manadatory" id="lblBranch2">Branch<span style="font-size: 11px;"></span></label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpBranchName2">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <div class="form-group">
                                <label for="FinancingGuardianName">Financing Guardian Name</label>
                                <input id="txtFinancingGuardianName" class="form-control" placeholder="Financing Guardian Name" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="RelationFinancingGurdan">Relation with Financing Guardian</label>
                                <input id="txtFinancingGuardianRelation" class="form-control" placeholder="Relation" maxlength="15" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0 pright0">
                            <div class="form-group">
                                <label for="AnnualIncome">Category</label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpCategory2" name="Tank Status">
                                    <option value="0">-Select-</option>
                                    <option value="General">General</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <div class="form-group">
                                <label for="AnnualIncome">Annual Income of Guardian</label>
                                <input id="txtAnnualIncome2" class="form-control" placeholder="Annual Income " maxlength="6" onkeypress="return isNumberKey(event);" onchange="AnnualIncome2();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Bank Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Bank Name</label>
                                <input id="txtBankName2" class="form-control" placeholder="Bank Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Account Holder's Name</label>
                                <input id="txtAcHolderName2" class="form-control" placeholder="Account Holder's Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Account No.</label>
                                <input id="txtBankAcNo2" class="form-control" placeholder="Account Number" type="text" maxlength="12" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">IFSC Code</label>
                                <input id="txtBankIFSCode2" name="IFSCCode" class="form-control" placeholder="IFSC Code" type="text" maxlength="11" onchange="AllowIFSCode();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Issuer Details Of Income Certificate</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Name of Issuing Authority</label>
                                <input id="txtIssuingAuthority2" class="form-control" placeholder="Name of Issuing Authority" type="text" maxlength="50" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Address</label>
                                <input id="txtAddress2" class="form-control" placeholder="Account Holder's Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Contact No (both Desk and Cell)</label>
                                <input id="txtContactNo2" class="form-control" placeholder="98XXXXXXXX-0124XXXXXX" type="text" maxlength="21" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Email-id (optional)</label>
                                <input id="txtEmailid2" class="form-control" placeholder="Email-id (optional)" type="text" maxlength="20" onchange="EmailValidation();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 box-container" style="margin-top: 5px;">
                    <div class="box-body box-body-open" style="text-align: center; border-top: 1px solid #ccc;">
                        <input type="button" id="btnSubmit2" class="btn btn-success" value="Submit" onclick="SubmitData2();" />
                        <input type="submit" name="Button1" value="Cancel" id="Button2" class="btn btn-danger" />
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <div id="StudentService3" style="display: none">
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Instruction to Fill the Form
                                    <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                        <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i>
                                    </span>
                            <span class="clearfix"></span>
                        </h4>
                    </div>
                    <div class="instn" id="divInfo">
                        <p><b style="color: #000; padding-top: 10px;">Document to be attached</b></p>
                        <ul>
                            <li>1.	HSC Certificate.</li>
                            <li>2.	Income Certificate.</li>
                            <li>3.	Council issued Registration No.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Additional Information</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <label id="TankArea3">Registration Number</label>
                            <div class="form-group">
                                <input id="txtRegistrationNo3" style="width: 195px;" class="form-control mtop0" placeholder="Start with  F  or  L max 11 digit numeric" maxlength="12" onkeypress="return AlphaNumeric(event);" onchange="RegistrationNo3();" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2  pright1">
                            <div class="form-group">
                                <label class="manadatory" for="AdmissionYear">Year of Admission</label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpAdmisionYear3">
                                    <option value="0">-Select-</option>
                                    <option value="2012">2012</option>
                                    <option value="2013">2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="Semester">Semester </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpSemester3" name="Tank Status">
                                    <option value="0">-Select-</option>
                                    <option value="1stSem">1st Semester</option>
                                    <option value="2ndSem">2nd Semester</option>
                                    <option value="3rdSem">3rd Semester</option>
                                    <option value="4thSem">4th Semester</option>
                                    <option value="5thSem">5th Semester</option>
                                    <option value="6thSem">6th Semester</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pleft0 pright0">
                            <div class="form-group">
                                <label class="manadatory" style="text-align: left" for="Semester">Type of Institute </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstituteType3" onchange="OnchangeFunction3();">
                                    <option value="0">-Select-</option>
                                    <option value="Private">Private</option>
                                    <option value="Government">Government</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="InstitutionName">
                                    Name of the Institution<span style="font-size: 11px;"></span>
                                </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstitutionName3" name="">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0">
                            <div class=" form-group  ">
                                <label class="manadatory" id="lblBranch3">Branch<span style="font-size: 11px;"></span></label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpBranchName3">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <div class="form-group">
                                <label for="FinancingGuardianName">Financing Guardian Name</label>
                                <input id="txtFinancingGuardianName3" class="form-control" placeholder="Financing Guardian Name" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="RelationFinancingGurdan">Relation with Financing Guardian</label>
                                <input id="txtFinancingGuardianRelation3" class="form-control" placeholder="Relation" maxlength="15" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0 pright0">
                            <div class="form-group">
                                <label for="AnnualIncome">Category</label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpCategory3" name="Tank Status">
                                    <option value="0">-Select-</option>
                                    <option value="General">General</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <div class="form-group">
                                <label for="AnnualIncome">Annual Income of Guardian</label>
                                <input id="txtAnnualIncome3" class="form-control" placeholder="Annual Income " maxlength="6" onkeypress="return isNumberKey(event);" onchange="AnnualIncome3();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Bank Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Bank Name</label>
                                <input id="txtBankName3" class="form-control" placeholder="Bank Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Account Holder's Name</label>
                                <input id="txtAcHolderName3" class="form-control" placeholder="Account Holder's Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Account No.</label>
                                <input id="txtBankAcNo3" class="form-control" placeholder="Account Number" type="text" maxlength="12" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">IFSC Code</label>
                                <input id="txtBankIFSCode3" name="IFSCCode" class="form-control" placeholder="IFSC Code" type="text" maxlength="11" onchange="AllowIFSCode();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Issuer Details Of Income Certificate</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Name of Issuing Authority</label>
                                <input id="txtIssuingAuthority3" class="form-control" placeholder="Name of Issuing Authority" type="text" maxlength="50" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Address</label>
                                <input id="txtAddress3" class="form-control" placeholder="Account Holder's Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Contact No (both Desk and Cell)</label>
                                <input id="txtContactNo3" class="form-control" placeholder="98XXXXXXXX-0124XXXXXX" type="text" maxlength="21" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Email-id (optional)</label>
                                <input id="txtEmailid3" class="form-control" placeholder="Email-id (optional)" type="text" maxlength="20" onchange="EmailValidation();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 box-container" style="margin-top: 5px;">
                    <div class="box-body box-body-open" style="text-align: center; border-top: 1px solid #ccc;">
                        <input type="button" id="btnSubmit3" class="btn btn-success" value="Submit" onclick="SubmitData3();" />
                        <input type="submit" name="Button1" value="Cancel" id="Button3" class="btn btn-danger" />
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <div id="StudentService4" style="display: none">
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Instruction to Fill the Form
                                    <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                        <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i>
                                    </span>
                            <span class="clearfix"></span>
                        </h4>
                    </div>
                    <div class="instn" id="divInfo">
                        <p><b style="color: #000; padding-top: 10px;">Document to be attached</b></p>
                        <ul>
                            <li>1.	HSC Certificate.</li>
                            <li>2.	Income Certificate.</li>
                            <li>3.	Council Issued Registration No.</li>
                            <li>5.	Physically Handicraft Certificate.</li>
                            <li>5.	Eligibility Declaration By Medical Board For Diploma Admission.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Additional Information</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <label id="TankArea4">Registration Number</label>
                            <div class="form-group">
                                <input id="txtRegistrationNo4" style="width: 195px;" class="form-control mtop0" placeholder="Start with  F  or  L max 11 digit numeric" maxlength="12" onkeypress="return AlphaNumeric(event);" onchange="RegistrationNo4();" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2  pright1">
                            <div class="form-group">
                                <label class="manadatory" for="AdmissionYear">Year of Admission</label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpAdmisionYear4">
                                    <option value="0">-Select-</option>
                                    <option value="2012">2012</option>
                                    <option value="2013">2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="Semester">Semester </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpSemester4" name="Tank Status">
                                    <option value="0">-Select-</option>
                                    <option value="1stSem">1st Semester</option>
                                    <option value="2ndSem">2nd Semester</option>
                                    <option value="3rdSem">3rd Semester</option>
                                    <option value="4thSem">4th Semester</option>
                                    <option value="5thSem">5th Semester</option>
                                    <option value="6thSem">6th Semester</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pleft0 pright0">
                            <div class="form-group">
                                <label class="manadatory" style="text-align: left" for="Semester">Type of Institute </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstituteType4" onchange="OnchangeFunction4();">
                                    <option value="0">-Select-</option>
                                    <option value="Private">Private</option>
                                    <option value="Government">Government</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="InstitutionName">
                                    Name of the Institution<span style="font-size: 11px;"></span>
                                </label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstitutionName4" name="">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0">
                            <div class=" form-group  ">
                                <label class="manadatory" id="lblBranch4">Branch<span style="font-size: 11px;"></span></label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpBranchName4">
                                    <option value="0">-Select-</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <div class="form-group">
                                <label for="FinancingGuardianName">Financing Guardian Name</label>
                                <input id="txtFinancingGuardianName4" class="form-control" placeholder="Financing Guardian Name" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="RelationFinancingGurdan">Relation with Financing Guardian</label>
                                <input id="txtFinancingGuardianRelation4" class="form-control" placeholder="Relation" maxlength="15" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0 pright0">
                            <div class="form-group">
                                <label for="AnnualIncome">Category</label>
                                <select class="form-control" data-val="true" data-val-required="Please select." id="drpCategory4" name="Tank Status">
                                    <option value="0">-Select-</option>
                                    <option value="General">General</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                            <div class="form-group">
                                <label for="AnnualIncome">Annual Income of Guardian</label>
                                <input id="txtAnnualIncome4" class="form-control" placeholder="Annual Income " maxlength="6" onkeypress="return isNumberKey(event);" onchange="AnnualIncome4();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Bank Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Bank Name</label>
                                <input id="txtBankName4" class="form-control" placeholder="Bank Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Account Holder's Name</label>
                                <input id="txtAcHolderName4" class="form-control" placeholder="Account Holder's Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Account No.</label>
                                <input id="txtBankAcNo4" class="form-control" placeholder="Account Number" type="text" maxlength="12" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">IFSC Code</label>
                                <input id="txtBankIFSCode4" name="IFSCCode" class="form-control" placeholder="IFSC Code" type="text" maxlength="11" onchange="AllowIFSCode();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Issuer Details Of Income Certificate</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Name of Issuing Authority</label>
                                <input id="txtIssuingAuthority4" class="form-control" placeholder="Name of Issuing Authority" type="text" maxlength="50" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Address</label>
                                <input id="txtAddress4" class="form-control" placeholder="Account Holder's Name" type="text" maxlength="30" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Contact No (both Desk and Cell)</label>
                                <input id="txtContactNo4" class="form-control" placeholder="98XXXXXXXX-0124XXXXXX" type="text" maxlength="21" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="Bank Name">Email-id (optional)</label>
                                <input id="txtEmailid4" class="form-control" placeholder="Email-id (optional)" type="text" maxlength="20" onchange="EmailValidation();" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 box-container" style="margin-top: 5px;">
                    <div class="box-body box-body-open" style="text-align: center; border-top: 1px solid #ccc;">
                        <input type="button" id="btnSubmit4" class="btn btn-success" value="Submit" onclick="SubmitData4();" />
                        <input type="submit" name="Button1" value="Cancel" id="Button4" class="btn btn-danger" />
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

    </div>
</asp:Content>
