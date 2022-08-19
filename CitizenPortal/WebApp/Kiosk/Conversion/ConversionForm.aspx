<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="ConversionForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Conversion.ConversionForm" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/AddressScript.js"></script>
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>
    <script src="Conversion.js"></script>
    <script type="text/javascript">
        
    </script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />

                <div class="row" id="divPensionDetails" runat="server">

                    <div class="row">
                        <div class="col-md-12">
                            <%---Start of BirthDetails----%>
                            <div class="col-md-12 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Property Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                {{resourcesData.lblAppDistrict}}
                                            </label>
                                            <select class="form-control" data-val="true" data-val-number="District."
                                                data-val-required="Please select District." id="ddlDistrict" name="District">
                                                <option>Select District</option>
                                                <%-- <option>Assam</option>
                        <option>Bihar</option>
                        <option>Sikkim</option>--%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                {{resourcesData.lblappsubdis}}
                                            </label>
                                            <select class="form-control" data-val="true" data-val-number="Taluka."
                                                data-val-required="Please select gender." id="ddlTaluka" name="Taluka">
                                                <option>Select Taluka</option>
                                                <%-- <option>Assam</option>
                        <option>Bihar</option>
                        <option>Sikkim</option>--%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                Mouza (Revenue Village)
                                            </label>
                                            <select class="form-control" data-val="true" data-val-number="Village"
                                                data-val-required="Please select Village" id="ddlVillage" name="Village">
                                                <option>Select Village</option>
                                                <%--<option>Assam</option>
                        <option>Bihar</option>
                        <option>Sikkim</option>--%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtDrawing">
                                                Drawing No.</label>
                                            <input id="txtDrawing" class="form-control" placeholder="Drawing No." name="txtDrawing" type="text" value=""  onkeypress="return isNumberKey(event, this);"
                                            maxlength="20"     autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtPlotNo">
                                                Drawing Plot No</label>
                                            <input id="txtPlotNo" class="form-control" placeholder="Plot No" name="PlotNo" type="text" value=""  onkeypress="return isNumberKey(event, this);"
                                              maxlength="20"   autofocus />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="diasbilitypercentage">
                                                Allotted Area</label>
                                            <input id="txtArea" class="form-control" placeholder="Measurment of Allotted Area" name="AllottedArea" type="text" value=""  maxlength="20"
                                               onkeypress="return isNumberKey(event, this);"  autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-1 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlUnit">
                                                Unit</label>
                                            <select class="form-control" data-val="true" data-val-number="Unit"
                                                data-val-required="Please select Village" id="ddlUnit" name="ddlUnit">
                                                <option value="0">-Select Unit-</option>
                                                <option value="Sqft">Square Feet</option>
                                                <option value="Acre">Acre</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtKhata">
                                                Khata No.
                                            </label>
                                            <input id="txtKhata" class="form-control" placeholder="Revenue Plot No." name="txtPlot" type="text" value=""  onkeypress="return isNumberKey(event, this);" maxlength="20"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtPlot">
                                                Revenue Plot No. (As per lease deed)</label>
                                            <input id="txtPlotReve" class="form-control" placeholder="Revenue Plot No." name="txtPlotReve" type="text" value=""  onkeypress="return isNumberKey(event, this);" maxlength="20"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtIncome">
                                                Date of Physical Possession</label>
                                            <input id="DOPossission" class="form-control" placeholder="DD/MM/YYYY" name="AnnualIncome" type="text" value="" maxlength="10"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of BirthDetails-----%>
                        </div>

                    </div>

                    <%---Start of Reason----%>
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Other Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group" style="height: 30px">
                                    <label class="manadatory col-lg-5 rbt-grp" for="rbtLandV">
                                        Present Land Used
                                    </label>
                                    <label class="col-lg-2" for="rbtLandV">
                                        <input type="radio" id="rbtLandV" value="0" name="grpLand" onclick="chkClick(this.id, 'divUsed');" />
                                        Vacant
                                    </label>
                                    <label class="col-lg-2" for="rbtLandO">
                                        <input type="radio" id="rbtLandO" value="1" name="grpLand" onclick="chkClick(this.id, 'divUsed');" />
                                        Occupied
                                    </label>
                                    <div id="divUsed" class="row col-lg-3 ">
                                        <label class="row col-lg-12 " for="txtResDetails">Land Used Type</label>
                                        <select class="col-lg-6 form-control" data-val="true" data-val-number="LandType"
                                            data-val-required="Please Select Pension Type" id="ddlLandType" name="ddlLandType">
                                            <option value="0">--Select Land Used Type--</option>
                                            <option value="101">Residential</option>
                                            <option value="102">Shop Cum Residential</option>
                                            <option value="103">Commercial</option>
                                            <option value="104">Industrial</option>
                                            <option value="105">Institutional</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group" style="height: 30px">
                                    <label class="manadatory col-lg-5 rbt-grp" for="Village">
                                        Whether lease deed is executed and registered
                                    </label>
                                    <label class="col-lg-1" for="rbtYes">
                                        <%--<input type="radio" id="rbtRegY" runat="server"  name="grpReg" />--%>
                                        <input type="radio" name="grpReg" value="1" id="rbtRegY" onclick="chkClick(this.id, 'divDeed');" />
                                        Yes
                                    </label>
                                    <label class="col-lg-1" for="rbtNo">
                                        <%--<input type="radio" id="rbtRegN" runat="server"  name="grpReg"/>--%>
                                        <input type="radio" name="grpReg" value="0" id="rbtRegN" onclick="chkClick(this.id, 'divDeed');" />No
                                    </label>

                                </div>
                            </div>
                            <div class="box-body box-body-open" id="divDeed">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtRegistration">
                                            Registration No.
                                        </label>
                                        <input id="txtRegistration" class="form-control" placeholder="Registration No." name="txtRegistration" type="text" value=""  onkeypress="return isNumberKey(event, this);" maxlength="25"
                                            autofocus />
                                    </div>
                                </div>                                
                                <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtDeedBook">
                                            Lease Deed Book No.
                                        </label>
                                        <input id="txtDeedBook" class="form-control" placeholder="Lease Deed Book No." name="txtDeedBook" type="text" value=""  onkeypress="return isNumberKey(event, this);" maxlength="20"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtVolume">
                                            Lease Deed Volume No
                                        </label>
                                        <input id="txtVolume" class="form-control" placeholder="Lease Deed Volume No." name="txtVolume" type="text" value=""  onkeypress="return isNumberKey(event, this);" maxlength="15"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtVolume">
                                            Page No of Deed
                                        </label>
                                        <div class="col-lg-2" style="margin-top: -2px; padding: 0;">From Page</div>
                                        <div class="col-lg-4">
                                            <input id="txtPagefrom" class="form-control" placeholder="From Page No." name="txtPagefrom" type="text" value="" style="width: 50px"
                                             onkeypress="return isNumberKey(event, this);" maxlength="15"    autofocus />
                                        </div>
                                        <div class="col-lg-2" style="margin-top: -2px; padding: 0; width: 35px;">To Page</div>
                                        <div class="col-lg-4">
                                            <input id="txtPageTo" class="form-control" placeholder="To Page No." name="txtPageTo" type="text" value="" style="width: 50px"
                                              onkeypress="return isNumberKey(event, this);"  maxlength="15"  autofocus />
                                        </div>
                                    </div>
                                </div>




                                <div class="clearfix">
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group" style="height: 30px">
                                    <label class="manadatory col-lg-5 rbt-grp" for="rbtBuildY">
                                        Whether building has been construted
                                    </label>
                                    <label class="col-lg-1" for="rbtBuildY">
                                        <%--<input type="radio" id="rbtBuildY" runat="server" onclick="chkClick(this.id, 'txtDetails');" name="grpBuild" />--%>
                                        <input type="radio" name="grpBuild" value="1" id="rbtBuildY" onclick="chkClick(this.id, 'divDetails');" />
                                        Yes
                                    </label>
                                    <label class="col-lg-1" for="rbtBuildN">
                                        <%--<input type="radio" id="rbtBuildN" runat="server" onclick="chkClick(this.id, 'txtDetails');" name="grpBuild" />--%>
                                        <input type="radio" name="grpBuild" value="0" id="rbtBuildN" onclick="chkClick(this.id, 'divDetails');" />No
                                    </label>

                                </div>
                            </div>
                            <div class="box-body box-body-open" id="divDetails">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="row col-lg-5 " for="txtDetails">
                                            Details of approval of plan</label>
                                        <input id="txtDetails" class="form-control" placeholder="(If yes, details of approval of plan)" name="txtDetails" type="text" value=""
                                           onkeypress="return ValidateAlpha(event);" maxlength="50" autofocus />

                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory col-lg-5 rbt-grp" for="rbtBuildY">
                                            If holding tax assessed
                                        </label>
                                        <label class="col-lg-1" for="rbttaxY">
                                            <%--<input type="radio" id="rbtBuildY" runat="server" onclick="chkClick(this.id, 'txtDetails');" name="grpBuild" />--%>
                                            <input type="radio" name="grptax" value="1" id="rbttaxY" />
                                            Yes
                                        </label>
                                        <label class="col-lg-1" for="rbttaxN">
                                            <%--<input type="radio" id="rbtBuildN" runat="server" onclick="chkClick(this.id, 'txtDetails');" name="grpBuild" />--%>
                                            <input type="radio" name="grptax" value="0" id="rbttaxN" />No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group" style="height: 30px">
                                    <label class="manadatory col-lg-5 rbt-grp" for="rbtPlotY">
                                        If the plot is being used other than Residential
                                    </label>
                                    <label class="col-lg-1" for="rbtPlotY">
                                        <input type="radio" name="grpPlot" value="1" id="rbtPlotY" onclick="chkClick(this.id, 'txtResDetails');" />
                                        Yes
                                    </label>
                                    <label class="col-lg-1" for="rbtPlotN">
                                        <input type="radio" name="grpPlot" value="0" id="rbtPlotN" onclick="chkClick(this.id, 'txtResDetails');" />
                                        No
                                    </label>
                                    <label class="col-lg-5 " for="txtResDetails">
                                        <input id="txtResDetails" class="form-control" placeholder="(If yes, provide details)" name="txtResDetails" type="text" value=""
                                           maxlength="25"  autofocus />
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group" style="height: 30px">
                                    <label class="manadatory col-lg-5 rbt-grp" for="rbtMortY">
                                        Whether properties stand mortgaged
                                    </label>
                                    <label class="col-lg-1" for="rbtMortY">
                                        <input type="radio" id="rbtMortY" value="1" onclick="chkClick(this.id, 'txtModDetails');" name="grpMort" />
                                        Yes
                                    </label>
                                    <label class="col-lg-1" for="rbtMortN">
                                        <input type="radio" id="rbtMortN" value="0" onclick="chkClick(this.id, 'txtModDetails');" name="grpMort" />No
                                    </label>
                                    <label class="col-lg-5 " for="txtModDetails">
                                        <input id="txtModDetails" class="form-control" placeholder="(If yes, provide details)" name="txtModDetails" type="text" value=""
                                          maxlength="25"  autofocus />
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group" style="height: 30px">
                                    <label class="manadatory col-lg-5 rbt-grp" for="rbtNOCY">
                                        No‐objection Certificate from the mortgagee enclosed
                                    </label>
                                    <label class="col-lg-1" for="rbtNOCY">
                                        <input type="radio" id="rbtNOCY" value="1" onclick="chkClick(this.id, 'txtNOCDetail');" name="grpNOC" />
                                        Yes
                                    </label>
                                    <label class="col-lg-1" for="rbtNOCN">
                                        <input type="radio" id="rbtNOCN" value="0" onclick="chkClick(this.id, 'txtNOCDetail');" name="grpNOC" />No
                                    </label>
                                    <label class="col-lg-5 " for="txtNOCDetail">
                                        <input id="txtNOCDetail" class="form-control" placeholder="(If yes, provide details)" name="txtNOCDetail" type="text" value=""
                                         maxlength="25"   autofocus />
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group" style="height: 30px">
                                    <label class="manadatory col-lg-5 rbt-grp" for="Village">
                                        Any disputepending in the court of law regarding title of the property
                                    </label>
                                    <label class="col-lg-1" for="rbtLawY">
                                        <input type="radio" id="rbtLawY" value="1" onclick="chkClick(this.id, 'txtlawDetails');" name="grpLaw" />
                                        Yes
                                    </label>
                                    <label class="col-lg-1" for="rbtLawN">
                                        <input type="radio" id="rbtLawN" value="0" onclick="chkClick(this.id, 'txtlawDetails');" name="grpLaw" />No
                                    </label>
                                    <label class="col-lg-5 " for="txtlawDetails">
                                        <input id="txtlawDetails" class="form-control" placeholder="(If yes, provide details)" name="txtlawDetails" type="text" value=""
                                        maxlength="25"    autofocus />
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group" style="height: 30px">
                                    <label class="manadatory col-lg-3 rbt-grp" for="txtAmtRent">
                                        Amount of annual ground rent (in RS) 
                                    </label>
                                    <label class="col-lg-2 " for="txtAmtRent">
                                        <input id="txtAmtRent" class="form-control" placeholder="(If yes, provide details)" name="txtModDetails" type="text" value=""
                                          onkeypress="return isNumberKey(event)" maxlength="8" autofocus />
                                    </label>
                                    <label class="manadatory col-lg-5 rbt-grp" for="">
                                        Whether up-to-date ground rent along with interest for related payment,if any has been paid 
                                    </label>
                                    <label class="col-lg-1" for="rbtAmtY">
                                        <input type="radio" id="rbtAmtY" value="1" name="grpAmt" />
                                        Yes
                                    </label>
                                    <label class="col-lg-1" for="rbtAmtN">
                                        <input type="radio" id="rbtAmtN" value="0" name="grpAmt" />No
                                    </label>                                    
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of Reason-----%>

                    <%---Start of Button----%>
                    <div class="" id="divBtn" runat="server">
                        <div class="col-md-12 box-container">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" />
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
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />

</asp:Content>
