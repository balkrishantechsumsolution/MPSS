<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="CMRF.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CMRF.CMRF" %>

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
    <script src="/webapp/kiosk/CMRF/CMRF.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <div class="clearfix">
                    <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                </div>
                <div class="row">
                    <%---Start of DeceasedDetails----%>
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Application Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="applicationtype">
                                        Applicant Type</label>
                                    <select class="form-control" data-val="true" data-val-number="applicationtype"
                                        data-val-required="Please select Application Type" id="ddlType" name="applicationtype">
                                        <option>Select Application Type</option>
                                        <option value="101">Individual</option>
                                        <option value="102">Institute</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlYearTerm">
                                        Application Category</label>
                                    <select class="form-control" data-val="true" data-val-number="applicationtype"
                                        data-val-required="Please select Application Type" id="ddlCategory" name="applicationtype">
                                        <option>Select Application Category</option>                                        
                                        <option value="103">Poor and persons in distress, Aged, disabled, orphans</option>
                                        <option value="104">AIDS affected and institutions supporting</option>
                                        <option value="105">NoKs of persons dying due to calamities, or violence</option>
                                        <option value="106">Persons affected by calamities or violence</option>
                                        <option value="107">Heat wave</option>
                                        <option value="108">Deaths due to lightening, boat accident (in normaltimes), tornado and whirlwind</option>
                                        <option value="109">Medical treatment</option>
                                        <option value="110">Medical aid to Freedom Fighters Pensioners</option>
                                        <option value="111">Medical aid in remote areas</option>
                                        <option value="112">Rural Deveropment</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtAmount">
                                        Required Amount</label>
                                    <input id="txtAmount" class="form-control" placeholder="Enter Required Amount in Rs"  name="txtAmount" type="text" value=""
                                     onkeypress="return isNumberKey(event, this);" autofocus="" maxlength="6" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="txtPurpose">
                                        Purpose for the fund</label>
                                    <input id="txtPurpose" class="form-control" onkeypress="return IsAlphabet(event, this);" maxlength="150" placeholder="Enter Purpose for the fund" name="txtPurpose" type="text" value=""
                                        autofocus="" />
                                </div>
                            </div>


                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlReceived">
                                        Received any assistance from this fund earlier</label>
                                    <select class="form-control" data-val="true" data-val-number="Received" onchange="CheckEarlierFund();"
                                        data-val-required="Please select Application Type" id="ddlReceived" name="ddlReceived">
                                        <option>Select Received Fund Earlier</option>
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="form-group" id="divRecPurpose">
                                    <label class="manadatory" for="txtRecPurpose">
                                        Purpose of fund received</label>
                                    <input id="txtRecPurpose" onkeypress="return IsAlphabet(event, this);" maxlength="150" class="form-control" placeholder="Enter Purpose for the fund" name="txtRecPurpose" type="text" value=""
                                        autofocus =""/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group" id="divRecAmount">
                                    <label class="manadatory" for="txtRecAmount">
                                        Amount Received Earlier</label>
                                    <input id="txtRecAmount" class="form-control" placeholder="Enter amount received earlier" name="txtRecAmount" type="text" value=""
                                     onkeypress="return isNumberKey(event, this);" autofocus="" maxlength="6" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlHand">
                                        Is Handicapped or Diseased</label>
                                    <select class="form-control" data-val="true" data-val-number="ddlHand" onchange="fnIsDiseased();"
                                        data-val-required="Please select Application Type" id="ddlHand" name="ddlHand">
                                        <option>Select Handicapped or Diseased</option>
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-8" id="divHandicap">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDetail">
                                        Details of Handicapped / Disease</label>
                                    <input id="txtDetail" class="form-control" onkeypress="return IsAlphabet(event, this);" maxlength="150" placeholder="Enter Detail of Handicapped / Disease" name="txtDetail" type="text" value=""
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlHand">
                                        Recommendation</label>
                                    <select class="form-control" data-val="true" data-val-number="ddlRecommendation" onchange="fnRecommendation();"
                                        data-val-required="Please select Application Type" id="ddlRecommendation" name="ddlRecommendation">
                                        <option>Select Recommendation</option>
                                        <option value="101">Cheif Minister (CM)</option>
                                        <option value="102">Minister</option>
                                        <option value="101">Member of Parliament (MP)</option>
                                        <option value="102">Member of Legislative Assembly (MLA)</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="form-group">
                                    <label class="manadatory" for="txtOccupation">
                                        Applicant Occupation</label>
                                    <input id="txtOccupation" class="form-control" onkeypress="return IsAlphabet(event, this);" maxlength="100" placeholder="Applicant Occupation" name="txtOccupation" type="text" value=""
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                                <div class="form-group">
                                    <label class="manadatory" for="txtIncome">
                                        Total Family Income</label>
                                    <input id="txtIncome" class="form-control" placeholder="Enter Family Income in Rs" name="txtIncome" type="text" value=""
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of DeceasedDetails-----%>
                </div>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Annual Income Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-sm-12" style="display:none">
                                <table class="table table-striped table-bordered" style="margin-bottom: 0 !important;" rules="all" id="grdView" style="border-collapse: collapse;" border="1" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <th scope="col">Sl. No</th>
                                            <th scope="col">Source of Income</th>
                                            <th scope="col">Amount</th>
                                            <th scope="col">Remark</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                        <tr>
                                            <td>1.</td>
                                            <td>Agriculture</td>
                                            <td>1000</td>
                                            <td>from the year 2014</td>
                                            <td>Delete</td>
                                        </tr>
                                        <tr>
                                            <td>2.</td>
                                            <td>Salary</td>
                                            <td>1000</td>
                                            <td>from the year 2014</td>
                                            <td>Delete</td>
                                        </tr>
                                        <tr>
                                            <td>3.</td>
                                            <td>Other</td>
                                            <td>1000</td>
                                            <td>from the year 2014</td>
                                            <td>Delete</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtAgri">
                                        Source of Income from Agriculture</label>
                                    <input type="text" id="txtAgri" class="form-control" placeholder="Income from Agriculture" value="" onchange="fnCalIncome();"
                                     onkeypress="return isNumberKey(event, this);" autofocus="" maxlength="6" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtSalary">
                                        Source of Income from Salary</label>
                                    <input type="text" id="txtSalary" class="form-control" placeholder="Income from Salary" value="" onchange="fnCalIncome();"
                                      onkeypress="return isNumberKey(event, this);" autofocus="" maxlength="6" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtOther">
                                        Other Source of Income</label>
                                    <input type="text" id="txtOther" class="form-control" placeholder="Income from Other Source" value="" onchange="fnCalIncome();"
                                      onkeypress="return isNumberKey(event, this);" autofocus="" maxlength="6" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtTotal">
                                        Total Annual Income</label>
                                    <input type="text" id="txtTotal" class="form-control" placeholder="Total Annual Income" value="" readonly
                                      onkeypress="return isNumberKey(event, this);" autofocus="" maxlength="6" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" id="divRecomend">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Recommendation Details by <span id="txtRecom"></span>
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label style="font-weight: bolder">
                                        Details of income of the Applicant</label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtIncAgri">
                                        Source of Income from Agriculture</label>
                                    <input type="text" id="txtIncAgri" class="form-control" placeholder="Income from Agriculture" value="" onchange="fnCalIncomeRecom();"
                                        autofocus =""/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtIncSalary">
                                        Source of Income from Salary</label>
                                    <input type="text" id="txtIncSalary" class="form-control" placeholder="Income from Salary" value="" onchange="fnCalIncomeRecom();"
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtIncOther">
                                        Other Source of Income</label>
                                    <input type="text" id="txtIncOther" class="form-control" placeholder="Income from Other Source" value="" onchange="fnCalIncomeRecom();"
                                        autofocus =""/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtIncTotal">
                                        Total Annual Income</label>
                                    <input type="text" id="txtIncTotal" class="form-control" placeholder="Total Annual Income" value="" readonly
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRelativeIncome">
                                        Financial condition of near relatives</label>
                                    <input type="text" id="txtRelativeIncome" class="form-control" placeholder="Financial condition of relatives" value=""
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="">
                                <div class="form-group">
                                    <label class="manadatory" for="dllPrayer">
                                        Prayer of Applicant acceptable?</label>
                                    <select class="form-control" data-val="true" data-val-number="Prayer"
                                        data-val-required="Please select Application Type" id="ddlPrayer" name="ddlPrayer">
                                        <option>Select Treatment available in Orissa</option>
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="">
                                <div class="form-group">
                                    <label class="" for="txtRemarks">
                                        Remarks</label>
                                    <input type="text" id="txtRemarks" class="form-control" placeholder="Enter remarks" value=""
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" id="divDiseased">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Recommendation of Medical Officer
                            </h4>
                        </div>
                        <div class="box-body box-body-open">

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDisease">
                                        Name of Disease</label>
                                    <input type="text" id="txtDisease" class="form-control" placeholder="Name of Disease" value=""
                                       onkeypress="return isNumberKey(event, this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtTreatment">
                                        Type of treatment required</label>
                                    <input type="text" id="txtTreatment" class="form-control" placeholder="Type of treatment required" value=""
                                       onkeypress="return isNumberKey(event, this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtCost">
                                        Cost of the Medicine</label>
                                    <input type="text" id="txtCost" class="form-control" placeholder="Cost of the Medicine" value=""
                                      onkeypress="return isNumberKey(event, this);"  autofocus =""/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="txtAppratus">
                                        Appratus</label>
                                    <input type="text" id="txtAppratus" class="form-control" placeholder="Name of Appratus" value=""
                                       onkeypress="return isNumberKey(event, this);" autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="">
                                <div class="form-group">
                                    <label class="manadatory" for="txtExpenditure">
                                        Any other expenditure</label>
                                    <input type="text" id="txtExpenditure" class="form-control" placeholder="Any other expenditure" value=""
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="">
                                <div class="form-group">
                                    <label class="manadatory" for="txtPlace">
                                        Place of treatment</label>
                                    <input type="text" id="txtPlace" class="form-control" placeholder="Place of treatment" value=""
                                        autofocus="" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-9" id="">
                                <div class="form-group">
                                    <label class="manadatory" for="txtReason">
                                        The reason for recommending treatment outside the State
                                    </label>
                                    <input type="text" id="txtReason" class="form-control" placeholder="Reason for recommending treatment outside the State" value=""
                                        autofocus =""/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlTreatment">
                                        Such treatment available in Orissa?</label>
                                    <select class="form-control" data-val="true" data-val-number="Treatment"
                                        data-val-required="Please select Application Type" id="ddlTreatment" name="ddlReceived">
                                        <option>Select Treatment available in Orissa</option>
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%---Start of Declaration----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title register-num">{{resourcesData.lblDeclaration}}
                            </h4>
                        </div>
                        <%--<uc1:Declaration runat="server" id="Declaration" />--%>
                        <uc1:Declaration runat="server" ID="Declaration" />
                    </div>
                </div>
                <%----End of Declaration-----%>

                <%---Start of Button----%>
                <div class="row" id="divButton" runat="server">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="112" />
    <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" /> 

</asp:Content>
