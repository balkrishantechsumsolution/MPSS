<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="FisheriesForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DOF.FisheriesForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/dofStylesheet.css" rel="stylesheet" />
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/g2c/js/bootstrap.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="../../Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />

    <script src="/WebApp/Kiosk/DOF/DOF.js"></script>
    <script>
        function fuShowHideDiv(divID, isTrue) {
            if (isTrue == "1") {
                $('#' + divID).show(500);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(500);
            }
        }
    </script>

    <style>
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

        .msgBox {
            width: 600px !important;
            overflow: auto;
            height: 300px;
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {

            $(window).load(function () {
                $('#myModal').modal('show');
            });

        });

        function SubmitServiceType() {

            if ($('#ddlServiceType').val() == "392") {
                $('#myModal').modal('hide');
                $('#lblServiceTitle').text($('#ddlServiceType option:selected').text());
                $('#InlandFisheriesBlueRevoluton').show(800);
                $('#CntrlSpeciesCultured').hide(500);
            }
            if ($('#ddlServiceType').val() == "437") {
                $('#myModal').modal('hide');
                $('#lblServiceTitle').text($('#ddlServiceType option:selected').text());
                $('#InlandFisheriesBlueRevoluton').show(800);
                $('#CntrlSpeciesCultured').hide(500);
            }
            if ($('#ddlServiceType').val() == "438") {
                $('#myModal').modal('hide');
                $('#lblServiceTitle').text($('#ddlServiceType option:selected').text());
                $('#CntrlSpeciesCultured').show(500);
                $('#InlandFisheriesBlueRevoluton').show(800);
            }
            if ($('#ddlServiceType').val() == "0") {
                $('#CntrlSpeciesCultured').hide(500);
                $('#InlandFisheriesBlueRevoluton').hide(800);
                $('#myModal').modal('show');
                $('#lblServiceTitle').text("");
            }
        }

        function SelectService() {
            $('#InlandFisheriesBlueRevoluton').hide(800);
            $('#myModal').modal('show');

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">POND DEVELOPMENT PROGRAMME</h3>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">
                        <div class="form-group">
                            <select class="form-control" id="ddlServiceType">
                                <option value="0">Please Select</option>
                                <option value="392">In Land Fisheries Through Blue Revolution</option>
                                <option value="437">Biju Matshya Pokhari Yojana</option>
                                <option value="438">Brackish Water Fisheries Through Blue Revolution</option>
                            </select>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <input id="errorMsg" type="text" hidden="hidden" value="" style="color: red; width: 100%; border: none" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="SubmitServiceType(this);">Submit</button>
                </div>
            </div>
        </div>
    </div>

    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">

            <div id="InlandFisheriesBlueRevoluton" style="display: none">
                <div id="page-wrapper" class="pleft15 pright15">
                    <div class="row">
                        <div class="clearfix">
                            <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                                <label style="font-size: 28px; font-weight: bolder" id="lblServiceTitle"></label>
                                <span class="pull-right">
                                    <input type="button" id="btnSelectService" value="Select Service" class="btn btn-primary" onclick="SelectService();" /></span></h2>
                        </div>
                    </div>

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
                                    <li>1. Photo ID Card / Aadhar Card of Applicant</li>
                                    <li>2. Caste Certificate in case of SC / ST / OBC</li>
                                    <li>3. Qualification Certificate</li>
                                    <li>4. Witness Address Proof</li>
                                    <li>5. Lease Document</li>
                                    <li>6. Training Certificate</li>
                                    <li>7. Member Card / Certificate PFCS / SHG</li>
                                    <li>8. Last 3 Months Loan Statement</li>
                                    <li>9. Bank Clearance Certificate</li>
                                    <li>10. First page of Bank Account passbook.</li>
                                    <li>11. Last 2 years IT Return (Incase of income exceed 2,50,000 per annum)</li>
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
                                        <label class="manadatory" style="white-space: nowrap;">Services Required</label>
                                        <select class="form-control forowntank" data-val="true" data-val-required="Please Select" id="ReqService" name="Required Service" onchange="return ServiceType();">
                                            <option value="0">-Select-</option>
                                            <option value="Excavation">Excavation</option>
                                            <option value="Renovation">Renovation</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="tankDescrptn" style="white-space: nowrap;" id="tanktype">Select Tank Type</label>
                                        <select class="form-control forowntank" data-val="true" data-val-required="Please Select" id="ddlowntank" name="Tank Description" onchange="Owntank();">
                                            <option value="0">-Select-</option>
                                            <option value="101">Own Tank </option>
                                            <option value="102">Govt. Lease Tank</option>
                                            <option value="103">Private Leased Tank</option>
                                        </select>
                                        <select class="form-control forowntank" data-val="true" data-val-required="Please Select" id="ddlowntank1" name="Tank Description1" onchange="Owntank1();">
                                            <option value="0">-Select-</option>
                                            <option value="107">Own Land </option>
                                            <option value="108">Govt. Lease Land</option>
                                            <option value="109">Private Leased Land</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 pright0" id="divareatank">
                                    <label id="TankArea">
                                        Area Description
                                    </label>
                                    <div class="form-group">
                                        <div class="col-xs-4 pleft0">
                                            <input id="AreaLnth" class="form-control mtop0" placeholder="Length (Mtr)" name="Area Length" value="" maxlength="3" autofocus="" onkeypress="return isNumberKey(event);" />
                                        </div>
                                        <div class="col-xs-4 pleft0">
                                            <input id="AreaBreth" class="form-control mtop0" placeholder="Breadth (Mtr)" name="Area Breadth" value="" maxlength="3" autofocus="" onkeypress="return isNumberKey(event);" />
                                        </div>
                                        <div class="col-xs-4 pleft0">
                                            <input id="AreaHtrs" class="form-control mtop0" placeholder="Area (Haters)" name="Area Haters" value="" maxlength="3" autofocus="" onkeypress="return isNumberKey(event);" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0 pright0">
                                    <div class="form-group">
                                        <label class="manadatory" for="Category">Category</label>
                                        <select class="form-control" data-val="true" data-val-required="Please select." id="ddlCastCategory" name="Tank Status" onchange="Presentstatustank();">
                                            <option value="0">-Select-</option>
                                            <option value="SC">SC</option>
                                            <option value="ST">ST</option>
                                            <option value="SEBC">SCBC</option>
                                            <option value="General">General</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label>Annual Income</label>
                                        <input id="AnnualIncome" class="form-control" placeholder="Annual Income" name="AnnualIncome" value="" maxlength="7" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class=" form-group  ">
                                        <label class="manadatory" id="lblDistrict">Select District<span style="font-size: 11px;"></span></label>
                                        <select class="form-control" data-val="true" data-val-required="Please select." id="DistrictName" name="DistrictName"></select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class=" form-group  ">
                                        <label class="manadatory" for="DOB" id="lblBlock ">Input Block<span style="font-size: 11px;"></span></label>
                                        <input id="BlockName" class="form-control" placeholder="Block Name" name="Tahsil Name" maxlength="20" onkeypress="return AlphaNumeric(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class=" form-group  ">
                                        <label class="manadatory" for="DOB" id="lblGramPanchayat ">Input Gram Panchayat<span style="font-size: 11px;"></span></label>
                                        <input id="GramPanchayatName" class="form-control" placeholder="Gram Panchayat Name" name="Gram Panchayat Name" maxlength="20" onkeypress="return AlphaNumeric(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class=" form-group  ">
                                        <label class="manadatory" for="DOB" id="lblvillage">Input Village (Mouza)<span style="font-size: 11px;"></span></label>
                                        <input id="VllgeName" class="form-control" placeholder="Village Name" name="Village Name" value="" autofocus="" maxlength="12" onkeypress="return AlphaNumeric(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divKhatano">
                                    <div class="form-group">
                                        <label for="KhataNo">Input Khata No</label>
                                        <input id="KhataNo" class="form-control" placeholder="Khata No." name="KhataNo" value="" maxlength="10" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="ploteno">
                                    <div class="form-group">
                                        <label for="PlotNo">Input Plot No.</label>
                                        <input id="PlotNo" class="form-control" placeholder="Plot No" name="PlotNo" type="email" value="" maxlength="5" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="LeasetankCtgry" id="lblCategoryLesTnk">Category of Lease Tank</label>
                                        <select class="form-control" data-val="true" data-val-required="Please select." name="Lease Tank Category" id="ddlcategory" onchange="Presentstatustank();">
                                            <option value="0">-Select-</option>
                                            <option value="10">GP</option>
                                            <option value="11">Private</option>
                                            <option value="12">Revenue</option>
                                            <option value="13">Water Resource</option>
                                            <option value="14">NAC </option>
                                            <option value="15">Municipal</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="tankStatus">Finance Mode</label>
                                        <select name="financeMeans" id="financeMeans" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District." onchange="FinanceMode();">
                                            <option value="0">-Select-</option>
                                            <option value="SelfFinance">Self Finance </option>
                                            <option value="BankFinance">Bank Finance</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label for="KhataNo">Lease Period</label>
                                        <input id="LeasePrd" class="form-control" placeholder="Upto 15 Years" maxlength="2" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pright0">
                                    <div class="form-group">
                                        <label style="white-space: nowrap;">Lease Value</label>
                                        <input id="LeaseVal" class="form-control" placeholder="Value" name="Lease Value" value="" maxlength="7" autofocus="" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory">Lessor Details </label>
                                        <input id="lessorDetail" class="form-control mtop0" placeholder="Lessor Detail" name="Production in Value" value="" maxlength="100" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="tankStatus" id="tankstatus">Present Tank Status</label>
                                        <div class="col-xs-6 pleft0">
                                            <select class="form-control" data-val="true" data-val-required="Please select." id="ddltankStatus" name="Tank Status" onchange="Presentstatustank();">
                                                <option value="0">-Select-</option>
                                                <option value="201">Derelict</option>
                                                <option value="202">Weed Infisted </option>
                                                <option value="203">Silted </option>
                                                <option value="204">Culture Tank</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-6 pright0">
                                            <select class="form-control" data-val="true" data-val-required="Please select ." name="Tank Status" id="ddltankstatusid">
                                                <option value="0">-Select-</option>
                                                <option value="E">Extensive</option>
                                                <option value="SI">Semi–Intensive</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <label>Present Fish Production</label>
                                    <div class="form-group">
                                        <div class="col-xs-6 pleft0 pright0">
                                            <input id="PrdctnQntl" class="form-control mtop0" placeholder="Quantal" name="Production in Quantal" value="" maxlength="5" autofocus="" onkeypress="return isNumberKey(event);" />
                                        </div>
                                        <div class="col-xs-6 pright0">
                                            <input id="PrdctnVal" class="form-control mtop0" placeholder="Value" name="Production in Value" value="" maxlength="5" autofocus="" onkeypress="return isNumberKey(event);" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory">Preferred Bank Name</label>
                                        <input id="txtBankName" class="form-control" placeholder="Preferred Bank Name" maxlength="20" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory">Bank Branch Name</label>
                                        <input id="txtBranchName" class="form-control" placeholder="Bank Branch Name" maxlength="20" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="tankStatus" id="lblEduQualification">Educational Qualification</label>
                                        <select class="form-control" data-val="true" data-val-required="Please select" name="Educational Qualification" id="EduQualification">
                                            <option value="0">-Select-</option>
                                            <option value="Illiterate">Illiterate</option>
                                            <option value="Graduation">Graduation</option>
                                            <option value="Professional">Professional</option>
                                            <option value="Matriculation">Matriculation</option>
                                            <option value="PostGraduation">Post-Graduation</option>
                                            <option value="UnderMatriculation">Under-Matriculation</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0 pright0">
                                    <div class="form-group">
                                        <label class="manadatory" for="tankStatus" id="lblDateOfBirth">DOB</label>
                                        <input id="DOB" class="form-control mtop0" placeholder="Date Of Birth" onchange="GetAge();" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                                    <div class="form-group">
                                        <label class="manadatory" for="tankStatus" id="lblDay">Days</label>
                                        <input id="txtDays" class="form-control mtop0" placeholder="Days" readonly="true" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                                    <div class="form-group">
                                        <label class="manadatory" for="tankStatus" id="lblMonth">Month</label>
                                        <input id="txtMonth" class="form-control mtop0" placeholder="Month" readonly="true" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                                    <div class="form-group">
                                        <label class="manadatory" for="tankStatus" id="lblYear">Year</label>
                                        <input id="txtYear" class="form-control mtop0" placeholder="Year" readonly="true" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="CntrlSpeciesCultured" style="display: none">
                                    <div class="form-group">
                                        <label class="manadatory">Species Cultured</label>
                                        <select class="form-control" data-val="true" data-val-required="Please select" id="SpeciesCultured">
                                            <option value="0">-Select-</option>
                                            <option value="PMonodon">P.Monodon</option>
                                            <option value="LVannamei">L.Vannamei</option>
                                            <option value="BWFinFish">BW FinFish</option>
                                            <option value="Others">Others</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row" style="display: none">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Educational Qualification of High School Certificate (HSC)
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0">
                                    <div class="form-group" style="margin-bottom: 0;">
                                        <div class="table-responsive">
                                            <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                                <tbody>
                                                    <tr>
                                                        <th style="width: 15%;">
                                                            <label class="manadatory">State</label>
                                                        </th>

                                                        <th style="width: 15%;">
                                                            <label class="manadatory">Board / Council Name</label>
                                                        </th>

                                                        <th style="width: 20%;">
                                                            <label class="manadatory">Name of the Examination Passed(HSC & Equivalent)</label>
                                                        </th>

                                                        <th style="width: 10%;">
                                                            <label class="manadatory">Name of School</label>
                                                        </th>

                                                        <th style="width: 10%;">
                                                            <label class="manadatory">Year of Passing</label>
                                                        </th>

                                                        <th style="width: 11%;">
                                                            <label class="manadatory">Division</label>
                                                        </th>

                                                        <th style="width: 9%;">
                                                            <label class="manadatory" id="lblTotalMarks">Total Marks</label>
                                                        </th>

                                                        <th style="width: 9%;">
                                                            <label class="manadatory">Mark Secured</label>
                                                        </th>

                                                        <th style="width: 9%;">
                                                            <label>Percentage (%)</label>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="EddlBoardState" id="EddlBoardState" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select State.">
                                                                <option value="0">-Select-</option>
                                                                <option value="01">ANDAMAN &amp; NIKOBAR ISLANDS</option>
                                                                <option value="26">ANDHRA PRADESH</option>
                                                                <option value="09">ARUNACHAL PRADESH</option>
                                                                <option value="35">ASSAM</option>
                                                                <option value="29">BIHAR</option>
                                                                <option value="210">CHANDIGARH</option>
                                                                <option value="25">CHHATTISGARH</option>
                                                                <option value="33">DADRA &amp; NAGAR HAVELI</option>
                                                                <option value="10">DAMAN &amp; DIU</option>
                                                                <option value="07">Delhi</option>
                                                                <option value="32">GOA</option>
                                                                <option value="18">GUJARAT</option>
                                                                <option value="17">HARYANA</option>
                                                                <option value="30">HIMACHAL PRADESH</option>
                                                                <option value="02">JAMMU &amp; KASHMIR</option>
                                                                <option value="22">JHARKHAND</option>
                                                                <option value="24">KARNATAKA</option>
                                                                <option value="08">KERALA</option>
                                                                <option value="04">LAKSHADWEEP</option>
                                                                <option value="34">MADHYA PRADESH</option>
                                                                <option value="27">MAHARASHTRA</option>
                                                                <option value="20">MANIPUR</option>
                                                                <option value="15">MEGHALAYA</option>
                                                                <option value="28">MIZORAM</option>
                                                                <option value="12">NAGALAND</option>
                                                                <option value="21">ODISHA</option>
                                                                <option value="31">PUDUCHERRY</option>
                                                                <option value="05">PUNJAB</option>
                                                                <option value="06">RAJASTHAN</option>
                                                                <option value="13">SIKKIM</option>
                                                                <option value="19">TAMIL NADU</option>
                                                                <option value="37">Telangana</option>
                                                                <option value="11">TRIPURA</option>
                                                                <option value="23">UTTAR PRADESH</option>
                                                                <option value="14">UTTARAKHAND</option>
                                                                <option value="16">WEST BENGAL</option>
                                                            </select></td>
                                                        <td>
                                                            <input id="boardName" class="form-control" placeholder="Board Name" name="boardName" type="text" value="" autofocus="" maxlength="30" onkeypress="return AlphaNumeric(event);" />
                                                        </td>
                                                        <td>
                                                            <input id="hscName" class="form-control" placeholder="HSC BOard Name" name="hscName" type="text" value="" autofocus="" maxlength="30" onkeypress="return AlphaNumeric(event);" />
                                                        </td>
                                                        <td>
                                                            <input id="universrityName" class="form-control" placeholder="Name of School" name="Name of School" type="text" value="" autofocus="" maxlength="30" onkeypress="return AlphaNumeric(event);" />
                                                        </td>
                                                        <td>
                                                            <select name="txtPssngYr" id="txtPssngYr" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select.">
                                                                <option value="0">-Select-</option>
                                                                <option value="1998">1998</option>
                                                                <option value="1999">1999</option>
                                                                <option value="2000">2000</option>
                                                                <option value="2001">2001</option>
                                                                <option value="2002">2002</option>
                                                                <option value="2003">2003</option>
                                                                <option value="2004">2004</option>
                                                                <option value="2005">2005</option>
                                                                <option value="2006">2006</option>
                                                                <option value="2007">2007</option>
                                                                <option value="2008">2008</option>
                                                                <option value="2009">2009</option>
                                                                <option value="2010">2010</option>
                                                                <option value="2011">2011</option>
                                                                <option value="2012">2012</option>
                                                                <option value="2013">2013</option>
                                                                <option value="2014">2014</option>
                                                                <option value="2015">2015</option>
                                                                <option value="2016">2016</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select name="gradeDivision" id="gradeDivision" class="form-control" data-val="" data-val-number="" data-val-required="Please Select.">
                                                                <option value="0">-Select-</option>
                                                                <option value="1st">1st Class </option>
                                                                <option value="2nd">2nd Class </option>
                                                                <option value="3rd">3rd Class </option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <input id="txtTotalMarks" class="form-control" placeholder="Total Marks" name="txtTMarks" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                                        </td>
                                                        <td>
                                                            <input id="txtMarkSecure" class="form-control" placeholder="Marks Secure" name="txtMkSecure" type="text" value="" autofocus="" maxlength="4" onkeypress="return isNumberKey(event); " />
                                                        </td>
                                                        <td>
                                                            <input id="txtPercentage" class="form-control" name="txtPrcntge" type="text" value="" readonly="true" maxlength="5" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title pleft0">Other Information
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0 ">
                                                <p>
                                                    <span class="dplyflex "><span class="fom-Numbx">1.</span>
                                                        Has he availed any Training?
                                                    </span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio1" id="yes" value="yes" onclick="return fuShowHideDiv('aval_training', 1);" />Yes
                                        <label for="yes"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio1" id="no" value="no" onclick="return fuShowHideDiv('aval_training', 0);" />No
                                        <label for="no"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="aval_training" class="form-group" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>No. of Training</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="trainingYear" class="form-control" name="trainingYear" placeholder="No. of the Training" type="text" value="" autofocus="" onkeypress="return isNumberKey(event); " maxlength="2" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Duration of Training </p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-4 pleft0">
                                                    <select name="trainingWeek" id="trainingWeek" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                        <option value="0">-Week-</option>
                                                        <option value="1W">1</option>
                                                        <option value="2W">2</option>
                                                        <option value="3W">3</option>
                                                        <option value="4W">4</option>
                                                        <option value="5W">5</option>
                                                        <option value="6W">6</option>
                                                        <option value="7W">7</option>
                                                        <option value="8W">8</option>
                                                        <option value="9W">9</option>
                                                        <option value="10W">10</option>
                                                        <option value="11W">11</option>
                                                        <option value="12W">12</option>
                                                        <option value="13W">13</option>
                                                        <option value="14W">14</option>
                                                        <option value="15W">15</option>
                                                        <option value="16W">16</option>
                                                        <option value="17W">17</option>
                                                        <option value="18W">18</option>
                                                        <option value="19W">19</option>
                                                        <option value="20W">20</option>
                                                        <option value="21W">21</option>
                                                        <option value="22W">22</option>
                                                        <option value="23W">23</option>
                                                        <option value="24W">24</option>
                                                        <option value="25W">25</option>
                                                        <option value="26W">26</option>
                                                        <option value="27W">27</option>
                                                        <option value="28W">28</option>
                                                        <option value="29W">29</option>
                                                        <option value="30W">30</option>
                                                        <option value="31W">31</option>
                                                        <option value="32W">32</option>
                                                        <option value="33W">33</option>
                                                        <option value="34W">34</option>
                                                        <option value="35W">35</option>
                                                        <option value="36W">36</option>
                                                        <option value="37W">37</option>
                                                        <option value="38W">38</option>
                                                        <option value="39W">39</option>
                                                        <option value="40W">40</option>
                                                        <option value="41W">41</option>
                                                        <option value="42W">42</option>
                                                        <option value="43W">43</option>
                                                        <option value="44W">44</option>
                                                        <option value="45W">45</option>
                                                        <option value="46W">46</option>
                                                        <option value="47W">47</option>
                                                        <option value="48W">48</option>
                                                        <option value="49W">49</option>
                                                        <option value="50W">50</option>
                                                        <option value="51W">51</option>
                                                        <option value="52W">52</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-4 pright0">
                                                    <select name="trainingMonth" id="trainingMonth" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                        <option value="0">-Month-</option>
                                                        <option value="1M">1</option>
                                                        <option value="2M">2</option>
                                                        <option value="3M">3</option>
                                                        <option value="4M">4</option>
                                                        <option value="5M">5</option>
                                                        <option value="6M">6</option>
                                                        <option value="7M">7</option>
                                                        <option value="8M">8</option>
                                                        <option value="9M">9</option>
                                                        <option value="10M">10</option>
                                                        <option value="11M">11</option>
                                                        <option value="12M">12</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-4 pright0">
                                                    <select name="trainingYear2" id="trainingYear2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                        <option value="0">-Year-</option>
                                                        <option value="1Y">1</option>
                                                        <option value="2Y">2</option>
                                                        <option value="3Y">3</option>
                                                        <option value="4Y">4</option>
                                                        <option value="5Y">5</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Name of training  </p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-4 pleft0">
                                                    <select name="trainingName" id="ddltrainingName" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District." onchange="selectchange();">
                                                        <option value="0">-Select-</option>
                                                        <option value="FFDA">FFDA </option>
                                                        <option value="BFDA">BFDA</option>
                                                        <option value="NFDB">NFDB</option>
                                                        <option value="CIFA">CIFA </option>
                                                        <option value="Others">Others</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-8 pright0 pleft0">
                                                    <input id="otherTrainingnme" class="form-control" name="otherTrainingnme" placeholder="Training Name" type="text" maxlength="4" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">2.</span> Is he member of PFCS / SHG?</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio2" id="Mmbr" value="yes" onclick="return fuShowHideDiv('hvng_membrshp', 1);" />Yes
                                        <label for="Mrd"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio2" id="NtMmbr" value="no" onclick="return fuShowHideDiv('hvng_membrshp', 0);" />No
                                        <label for="UnMrd"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="hvng_membrshp" class="form-group" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Name of PFCS / SHG</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="memberName" class="form-control" name="memberName" type="text" value="" autofocus="" placeholder="Name of PFCS / SHG" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Address of PFCS / SHG</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="addressPFCSSHG" class="form-control" name="addressPFCSSHG" type="text" value="" autofocus="" placeholder="Address of PFCS / SHG" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Member No. of PFCS / SHG</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <input id="membershipNo" class="form-control" name="membershipNo" type="text" value="" autofocus="" placeholder="Member No. of PFCS / SHG" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">3.</span> Is there any way of communication and Infrastructure at Farm Side? </span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio3" id="Infrhve" value="yes" onclick="return fuShowHideDiv('hvng_infrandcom', 1);" />Yes
                                        <label for="Infrhve"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio3" id="Infrnthve" value="no" onclick="return fuShowHideDiv('hvng_infrandcom', 0);" />No
                                        <label for="Infrnthve"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="hvng_infrandcom" class="form-group" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Please Select</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-4 pleft0" style="white-space: nowrap;">
                                                    <input type="checkbox" name="road" id="road" />Road
                                    <label for="checkbox"></label>
                                                </div>
                                                <div class="col-xs-4 pleft0" style="white-space: nowrap;">
                                                    <input type="checkbox" name="electricity" id="electricity" />Electricity
                                    <label for="checkbox"></label>
                                                </div>
                                                <div class="col-xs-4 pleft0" style="white-space: nowrap;">
                                                    <input type="checkbox" name="canal" id="canal" />Canal
                                    <label for="checkbox"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group mtop5">
                                        <div class="col-lg-12 othrinfohd">
                                            <div class="col-md-9 pleft0">
                                                <p><span><span class="fom-Numbx">4.</span>Has he availed any loan previously?</span></p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-6 pleft0">
                                                    <input type="radio" name="radio4a" id="hveLoan" value="yes" onclick="return fuShowHideDiv('hnvg_loan', 1);" />Yes
                                        <label for="exarmy"></label>
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="radio" name="radio4a" id="nthveLoan" value="no" onclick="return fuShowHideDiv('hnvg_loan', 0);" />No
                                        <label for="sptprsn"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div id="hnvg_loan" style="display: none;">
                                        <div class="col-lg-12 othrinfosubhd2">
                                            <div class="col-md-9 pleft0">
                                                <p class="ptop5 pleft27"><i class="fa fa-arrow-right pright5"></i>Name of Bank</p>
                                            </div>
                                            <div class="col-md-3 pleft0 pright0">
                                                <div class="col-xs-12 pleft0 pright0">
                                                    <input id="bankName" class="form-control" name="bankName" type="text" value="" maxlength="20" autofocus="" placeholder="BankName" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Purpose of Loan</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0">
                                                    <input id="loanPurpose" class="form-control" name="loanPurpose" type="text" maxlength="15" value="" autofocus="" placeholder="loanPurpose" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Amount of Loan</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0 mbtm10">
                                                    <input id="loanAmt" class="form-control" name="loanAmt" type="text" value="" maxlength="7" autofocus="" placeholder="loanAmt" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <div class="col-lg-12 othrinfosubhd2">
                                                <div class="col-md-9 pleft0">
                                                    <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Outstanding Balance of Loan</p>
                                                </div>
                                                <div class="col-md-3 pleft0 pright0 mbtm10">
                                                    <input id="OutstndngloanAmt" class="form-control" name="OutstndngloanAmt" maxlength="7" type="text" value="" autofocus="" placeholder="OutstndngloanAmt" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title">Witness Details </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 fltleft">
                                    <div class="form-group">
                                        <div class="col-xs-6 pleft0">
                                            <label class="manadatory" for="WitnessNme1">
                                                Name of Witness1 <span style="font-size: 11px;"></span>
                                            </label>
                                            <input id="WitnessNme1" class="form-control" placeholder="Witness Name1" name="WitnessNme1" value="" autofocus="" maxlength="30" />
                                        </div>
                                        <div class="col-xs-6">
                                            <label class="manadatory" for="AddWtness1">
                                                Address of Witness1</label>
                                            <input id="AddWtness1" class="form-control inputbox_bluebdr" maxlength="50" name="AddWtness1" placeholder="Witness1 Address" type="text" value="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <div class="col-xs-6">
                                            <label>
                                                Name of Witness2</label>
                                            <input id="WitnessNme2" class="form-control inputbox_bluebdr" maxlength="30" name="WitnessNme2" placeholder="Witness Name2" type="text" value="" />
                                        </div>
                                        <div class="col-xs-6">
                                            <label>
                                                Address of Witness2</label>
                                            <input id="AddWtness2" class="form-control inputbox_bluebdr" maxlength="50" name="AddWtness2" placeholder="Witness2 Address" type="text" value="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center; border-top: 1px solid #ccc;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitInlandFisheriesData();" />
                                <input type="submit" name="Button1" value="Cancel" id="Button1" class="btn btn-danger" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>