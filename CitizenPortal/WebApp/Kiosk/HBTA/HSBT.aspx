<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="HSBT.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.HBTA.HSBT" %>


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
    <script src="HSBT.js"></script>
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
                            <h4 class="box-title register-num">Application Informations
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label for="txtDate" class="manadatory">
                                        BPL Card No.</label>
                                    <input id="bpl_card_no" class="form-control" name="txtDate" type="text" value="" maxlength="10"
                                        autofocus />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label for="bpl_year" class="manadatory">
                                        BPL Year</label>
                                    <select class="form-control" data-val="true" data-val-number="ComplaintType"
                                        data-val-required="Please Select Pension Type" id="bpl_year" name="bpl_year" onchange="fnParticulars();">
                                        <option value="0">Year</option>
                                        <option value="101">2016</option>
                                        <option value="102">2015</option>
                                        <option value="103">2014</option>
                                        <option value="104">2013</option>

                                    </select>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label for="date_journey" class="manadatory">
                                        Date of Journey</label>
                                    <input id="date_journey" class="form-control" placeholder="dd/MM/yyyy" name="date_journey" type="text" value="" maxlength="10"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label for="date_return" class="manadatory">
                                        Date of Return</label>
                                    <input id="date_return" class="form-control" placeholder="dd/MM/yyyy" name="date_return" type="text" value="" maxlength="10"
                                        autofocus />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="applicant_disease" class="manadatory">
                                        Previous serious disease history</label><select class="form-control" data-val="true" data-val-number="ComplaintType"
                                            data-val-required="Please Select Pension Type" id="applicant_disease" name="applicant_disease" onchange="fnParticulars();">
                                            <option value="0">--Select--</option>
                                            <option value="101">Bones and joints diseases</option>
                                            <option value="102">Breast Cancer</option>
                                            <option value="103">Cancer</option>
                                            <option value="104">Dental Problem</option>
                                            <option value="105">Depression</option>
                                            <option value="106">Diabetes</option>
                                            <option value="107">Digestive and Metabolic</option>
                                            <option value="108">Ear Diseases</option>
                                            <option value="109">Eating Disorder</option>
                                            <option value="110">Eye Diseases</option>
                                            <option value="111">Heart Diseases</option>
                                            <option value="112">High Blood Pressure</option>
                                            <option value="113">Kidney Infection</option>
                                            <option value="114">Ling Cancer</option>
                                            <option value="115">Migraine Headaches</option>
                                            <option value="116">Skin Problem</option>
                                        </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="attende_details">
                                        Attendee Details (if any)</label>
                                    <input id="attende_details" class="form-control" name="attende_details" type="text" value="" 
                                        autofocus />

                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="txtDate" class="manadatory">
                                        Detail of Disease</label>
                                    <input id="disease_details" class="form-control" name="txtDate" type="text" value="" 
                                        autofocus />
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

