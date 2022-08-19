<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="FIRRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.FIR.FIRRegistration" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
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
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>
    <script src="FIRRegistration.js"></script>
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
                <div class="row" id="divDetails" runat="server">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Complaint Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlCategory">
                                        Complaint Category</label>
                                    <select class="form-control" data-val="true" data-val-number="ComplaintType"
                                        data-val-required="Please Select Pension Type" id="ddlCategory" name="ddlCategory" onchange="fnParticulars();">
                                        <option value="0">Select Complaint Category</option>
                                        <option value="101">Theft</option>
                                        <option value="102">Muder</option>
                                        <option value="103">Missing / Kidnapping</option>
                                        <option value="104">Rape</option>
                                        <option value="105">Eve Teasing</option>
                                        <option value="106">Burglary</option>
                                        <option value="107">Accident</option>
                                        <option value="108">Dowary Death</option>
                                        <option value="109">Dowary Torture</option>
                                        <option value="110">Robbery</option>
                                        <option value="111">Miscellaneous</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDate">
                                        Date of Incident</label>
                                    <input id="txtDate" class="form-control" placeholder="dd/MM/yyyy" name="txtDate" type="text" value="" maxlength="10"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="txtPlace">
                                        Place of Incident</label>
                                    <input id="txtPlace" class="form-control" placeholder="Place of Incident" name="txtPlace" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDetails">
                                        Complaint Description</label>
                                    <input id="txtDetails" class="form-control" placeholder="Complaint Description" name="txtDetails" type="text" value=""
                                        autofocus multiple="multiple" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Accused / Suspects Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group error" id="divmore" runat="server" style="display: none;">
                                </div>
                                <div id="divSuspect">
                                </div>
                                <div class="form-group">
                                    <table style="width: 100%" class="table table-striped table-bordered">
                                        <tbody>
                                            <tr>
                                                <th style="text-align: center;">
                                                    <label class="manadatory" for="txtAccused">
                                                        Name of Accussed/Suspect</label>
                                                </th>
                                                <th style="text-align: center;">
                                                    <label for="txtAddress">
                                                        Address</label>
                                                </th>
                                                <th style="text-align: center; width: 190px">
                                                    <label for="txtContact">
                                                        Contact</label>
                                                </th>
                                                <th style="text-align: center;">
                                                    <label class="" for="txtRemark">
                                                        Remarks</label>
                                                </th>
                                                <th style="text-align: center; width: 100px;">Add</th>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <input id="txtAccused" class="form-control" placeholder="Name of Accussed/Suspect" name="txtAccused" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td style="">
                                                    <input id="txtAddress" class="form-control" placeholder="Address of Accussed/Suspect" name="txtAddress" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td style="">
                                                    <input id="txtContact" class="form-control" placeholder="Contact No of Accussed/Suspect" name="txtContact" type="text" value=""
                                                        autofocus maxlength="10" />
                                                </td>
                                                <td style="">
                                                    <input id="txtRemark" class="form-control" placeholder="Remarks if any" name="txtRemark" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td align="center">
                                                    <input id="btnAdd" type="button" value="Add" onclick="AddSuspect('');" class="btn btn-success" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 box-container" id="divParticulars">
                        <div class="box-heading">
                            <h4 class="box-title register-num"><span class="manadatory" id="lblParticulars"></span>
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <input id="txtParticulars" class="form-control" placeholder="" name="Income Per Month" type="text" value=""
                                        autofocus multiple="multiple" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%---Start of Button----%>
                    <div class="" id="divBtn" runat="server">
                        <div class="col-md-12 box-container">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" />
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
    <asp:HiddenField ID="hdfSuspect" runat="server" />
    <asp:HiddenField ID="hdfSuspectSave" runat="server" />
    <asp:HiddenField ID="hdfSuspectString" runat="server" />
    <asp:HiddenField ID="HFServiceID" Value="" runat="server" />
</asp:Content>
