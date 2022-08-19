<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="RoadTax.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Transport.RoadTax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.msgBox.js" type="text/javascript"></script>
    <script src="RoadTax.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <link href="/PortalStyles/msgBoxLight.css" type="text/css" rel="stylesheet" />
    <script src="/WebApp/Kiosk/Transport/RoadTax.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <style type="text/css">
        .mtop22 {
            margin-top: 22px !important;
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .ptop28 {
            padding-top: 28px !important;
        }

        .RTtable > tbody > tr > th {
            background-color: #4879a9;
            color: #fff;
            padding: 12px !important;
            font-weight: normal;
            border: 1px solid #fff;
            text-align: center;
            vertical-align: middle !important;
        }

        .RTtable > tbody > tr > td {
            background-color: #fff;
            text-align: center;
            padding: 10px !important;
            border: 1px solid #ddd;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#PurchaseDeliveryDate').datepicker({
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

            $('#ManufactureYear').datepicker({
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

            $('#RegistrationDate').datepicker({
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

            $('#VehicleValidity').datepicker({
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

            $("#btnShowDtl").prop('disabled', true);

            $("#OwnerTaxDtl").hide();
            $("#btnShowDtl").click(function () {
                var mob = $("#txtMobile").val();
                $("#HFMobile").val(mob);
                $("#RegistrationSearch").hide(1000);
                $("#OwnerTaxDtl").show(1000);
            });

            $("#btnResetDtl").click(function () {
                $("#RegistrationTxt")[0].reset();
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 311px;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading">
                    <i class="fa fa-pencil-square-o"></i>Collection of Road Tax
                </h2>
            </div>
        </div>
        <div class="row" id="RegistrationSearch">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Online Application (Road Tax)
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10 mb10" id="divCredential">
                            <span style="font-weight: bold; margin-bottom: 5px">Instruction:</span><br />
                            <span>Before filling the APPLICATION, you need to authenticate your mobile number.</span>
                            <br />
                            <span>Please enter valid mobile number, as all the communications shall be made on the regisered mobile number.
                                        <br />
                                OTP authentication code shall be SMS to validate the mobile number.</span>
                        </div>
                        <div class="alert alert-success" id="divMsg" style="display: none;">
                            <b>
                                <p class="text-justify" id="divMsgTitle" style=""></p>
                            </b>
                            <p class="text-justify" id="divMsgDtls">
                            </p>
                        </div>
                        <div class="row" id="RegistrationTxt">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegistrationNo">Registration No.</label>
                                    <input type="text" name="txtRegistrationNo" id="txtRegistrationNo" class="form-control" placeholder="Vehicle Registration No." maxlength="11" onchange="GetDLDetail();" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="txtMobile">Mobile No.</label>
                                    <input class="form-control" id="txtMobile" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" value="" maxlength="10" title="Please enter valid Mobile No" onkeypress="return isNumberKey(event);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 mtop22">
                                <div class="form-group">
                                    <input type="button" id="btnOTP" class="btn btn-primary" value="Generate OTP" onclick="fnGenOTP();" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pleft0" id="divOTP">
                                <div class="form-group">
                                    <label class="manadatory" for="txtSMSCode">OTP</label>
                                    <input class="form-control" id="txtSMSCode" placeholder="6 Digit OTP Code" name="OTPVerification" type="text" value="" maxlength="6" disabled="disabled" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 mtop22" id="divbtnOTP">
                                <div class="form-group">
                                    <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Validate SMS Code" onclick="ValidateOTP();" disabled="disabled" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnShowDtl" class="btn btn-success" value="Show Details" onclick="BindDLData();" />
                    <input type="submit" name="btnResetDtl" value="Reset" id="btnResetDtl" class="btn btn-danger" style="min-width: 110px; margin-left: 10px;" />
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="row mtop10" id="OwnerTaxDtl">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Owner Tax Information</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">

                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group has-success">
                                    <label class="manadatory" for="OwerName">Vehicle No.</label>
                                    <input type="text" name="VehicleNo" id="VehicleNo" class="form-control" placeholder="Vehicle Number" maxlength="10" disabled="disabled" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="OwerName">Owner Name</label>
                                    <input type="text" name="OwerName" id="OwerName" class="form-control" placeholder="Owner Full Name" maxlength="100" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="CareOf">Son/Wife/Daugther of</label>
                                    <input class="form-control" id="CareOf" placeholder="Son/Wife/Daugther Name" name="CareOf" type="text" value="" maxlength="10" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="EngineNo">Engine No</label>
                                    <input class="form-control" id="EngineNo" placeholder="Vehicle Engine No" name="EngineNo" type="text" value="" maxlength="17" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="PurchaseDeliveryDate">Purchase/Delivery Date</label>
                                    <input type="text" name="PurchaseDeliveryDate" id="PurchaseDeliveryDate" class="form-control" placeholder="DD/MM/YYYY" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="VehicleClass">Vehicle Class</label>
                                    <input type="text" id="VehicleClass" class="form-control" placeholder="VehicleClass" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="BodyType">Body Type</label>
                                    <input type="text" id="BodyType" class="form-control" placeholder="BodyType" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="MakersModel">Makers Model</label>
                                    <input class="form-control" id="MakersModel" placeholder="Model No" name="MakersModel" type="text" value="" maxlength="10" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="VehicleMakers">Makers</label>
                                    <input type="text" id="VehicleMakers" class="form-control" placeholder="VehicleMakers" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="UnloadedWeight">Unladen Weight (Kg)</label>
                                    <input class="form-control" id="UnloadedWeight" placeholder="(in kg)" name="UnloadedWeight" type="text" value="" maxlength="10" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="LadenWeight">Laden Weight (Kg)</label>
                                    <input type="text" name="LadenWeight" id="LadenWeight" class="form-control" placeholder="(in kg)" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="SeatingCapacity">Seating Capacity</label>
                                    <input class="form-control" id="SeatingCapacity" placeholder="Seating Capacity" name="SeatingCapacity" type="text" value="" maxlength="10" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ManufactureYear">Manufacture Year</label>
                                    <input class="form-control" id="ManufactureYear" placeholder="DD/MM/YYYY" name="ManufactureYear" type="text" value="" maxlength="10" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="SleeperCapacity">Sleeper Capacity</label>
                                    <input type="text" name="SleeperCapacity" id="SleeperCapacity" class="form-control" placeholder="Sleeper Capacity" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="StandingCapacity">Standing Capacity</label>
                                    <input class="form-control" id="StandingCapacity" placeholder="Standing Capacity" name="StandingCapacity" type="text" value="" maxlength="2" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="RegistrationDate">Registration Date</label>
                                    <input type="text" name="RegistrationDate" id="RegistrationDate" class="form-control" placeholder="DD/MM/YYYY" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ChassisNumber">Chassis Number</label>
                                    <input class="form-control" id="ChassisNumber" placeholder="Chassis No (VIN)" name="ChassisNumber" type="text" value="" maxlength="17" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="VehicleType">Vehicle Type</label>
                                    <input type="text" id="VehicleType" class="form-control" placeholder="VehicleType" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="VehicleCategory">Vehicle Category</label>
                                    <input type="text" id="VehicleCategory" class="form-control" placeholder="VehicleCategory" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="VehicleValidity">Fitness Valid Upto</label>
                                    <input type="text" name="VehicleValidity" id="VehicleValidity" class="form-control" placeholder="DD/MM/YYYY" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Latest Tax Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="row">
                            <table class="table table-bordered" style="width: 98%; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <th>Receipt Date</th>
                                        <th>Amount</th>
                                        <th>Tax Upto</th>
                                        <th id="lblFine" style="display: none;">Fine</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" id="TaxUpto" class="form-control" />
                                        </td>
                                        <td>
                                            <input type="text" id="Amount" class="form-control" />
                                        </td>
                                        <td>
                                            <input type="text" id="ReceiptDate" class="form-control" />
                                        </td>
                                        <td id="lblFimeAmt" style="display: none;">
                                            <input type="text" id="Fine" class="form-control" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-12 box-container" style="display: none;">
                <div class="box-heading">
                    <h4 class="box-title">Permit Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">

                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="PermitType">Permit Type</label>
                                    <select class="form-control" id="PermitType">
                                        <option value="Select">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="PermitCategory">Permit Category</label>
                                    <select class="form-control" id="PermitCategory">
                                        <option value="Select">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ServiceType">Service Type</label>
                                    <select class="form-control" id="ServiceType">
                                        <option value="Select">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="RouteLength">Route Length (km)</label>
                                    <input type="text" class="form-control" id="RouteLength" placeholder="(in Km)" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                                <div class="form-group">
                                    <label class="manadatory" for="TripsNo">No of Trips</label>
                                    <input type="text" class="form-control" id="TripsNo" placeholder="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="PermitDomain">Permit Domain</label>
                                    <select class="form-control" id="PermitDomain">
                                        <option value="Select">Select</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Tax Details (Select the Tax Mode from the below Table to calculate the Tax)</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="TaxModeQty">Tax Mode</label>
                            <select class="form-control" id="ddlTaxMode" onchange="GetTaxCalculation();">
                                <option value="0">Select</option>
                                <option value="Y">Yearly</option>
                                <option value="Q">Quarterly</option>
                                <option value="M">Monthly</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="TaxModeQty">Enter the No.of Month/Year/Quarter (If Tax Upto date.)</label>
                            <input type="text" name="TaxModeQty" value="1" id="TaxModeQty" class="form-control" onchange="GetTaxCalculation();" />
                        </div>
                    </div>

                     <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 text-center" id="DivLoadingTax" style="display:none">
                        <div class="form-group">
                            <label style="display:inline-block; font-size:12px; color:crimson; font-weight:bold; margin-top:30px">Calculating Tax....Please Wait...</label>
                            <img src="/WebApp/Login/Loading_hourglass_88px.gif" style="display:inline-block; width:50px;height:50px" />
                        </div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="row">
                            <div class="table-responsive">
                                <table class="RTtable" style="width: 98%; margin: 0 auto;">
                                    <tr>
                                        <th>Tax Head</th>
                                        <th>Tax From</th>
                                        <th>Tax Upto</th>
                                        <th>Tax Amount</th>
                                        <th>Penalty</th>
                                        <th>Surcharge</th>
                                        <th>Rebate</th>
                                        <th>Interest</th>
                                        <th>Amount1</th>
                                        <th>Amount2</th>
                                        <th>Total</th>
                                    </tr>

                                    <tr id="NormalTax" runat="server" style="display: none">
                                        <td class="ptop28">
                                            <label id="CalcTaxHead" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxFrom" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxUpto" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxAmount" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxPenalty" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxSurcharge" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxRebate" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxInterest" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxAmount1" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxAmount2" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="CalcTaxTotal" />
                                        </td>
                                    </tr>

                                    <tr id="AdditionalTax" runat="server" style="display: none">
                                        <td class="ptop28">
                                            <label id="AddCalcTaxHead" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxFrom" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxUpto" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxAmount" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxPenalty" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxSurcharge" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxRebate" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxInterest" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxAmount1" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxAmount2" />
                                        </td>
                                        <td class="ptop28">
                                            <label id="AddCalcTaxTotal" />
                                        </td>
                                    </tr>

                                </table>
                            </div>
                            <div class="mtop15"></div>
                            <div class="col-lg-4 col-xs-12 pleft20" style="font-weight: bold;">
                                User/Service Charges:
                                <label id="lblServiceCharges" style="display:inline-block;" ></label>
                            </div>
                            <div class="col-lg-4 col-xs-12" style="font-weight: bold; text-align:center;">
                                User/transaction Charges:
                                <label id="lblTransactionCharges" style="display:inline-block;"></label>
                            </div>
                            <div class="col-lg-4 col-xs-12" style="font-weight: bold; text-align:right;">
                                Total Payable Amount (In Rs):
                                <label id="lblotalPayableAmount" style="display: inline-block;" ></label>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-12 box-container">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnSubmit" class="btn btn-success" value="Payment" style="min-width: 110px;" onclick="SubmitData();" />
                    <input type="submit" name="btnCancel" value="Cancel" id="" class="btn btn-danger" style="min-width: 110px; margin-left: 10px;" />
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <asp:HiddenField ClientIDMode="Static" ID="HFMobile" runat="server" />
    <asp:HiddenField ClientIDMode="Static" ID="HFNTD" runat="server" />
    <asp:HiddenField ClientIDMode="Static" ID="HFNTC" runat="server" />

</asp:Content>
