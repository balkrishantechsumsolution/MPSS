<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Connection.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Water.Connection" %>


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
    <script src="../../Scripts/ValidationScript.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>
    <script src="Connection.js"></script>
    
    
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
                <div class="clearfix">
                    <uc1:formtitle runat="server" id="FormTitle" />
                </div>
                <div class="clearfix">
                    <uc1:applicationsteps runat="server" id="ApplicationSteps" />
                </div>
                <div class="row" id="divDecease" runat="server">
                    <%---Start of DeceasedDetails----%>
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title">Connection Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-md-12">
                                <div class=" col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="row form-group">
                                        <label class="col-lg-8 manadatory" for="conection">
                                            Having any existing connections?</label>
                                        <label class="col-lg-2" for="rbtYes">
                                            <input type="radio" name="grpConn" value="1" id="rbtYes" onclick="chkClick(this.id, '');" />
                                            Yes
                                        </label>
                                        <label class="col-lg-2" for="rbtNo">
                                            <input type="radio" name="grpConn" value="0" id="rbtNo" onclick="chkClick(this.id, '');" />No
                                        </label>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group" id="divConn">
                                        <label class="manadatory" for="coustomerid">
                                            Coustmer ID</label>
                                        <input id="coustomerid" class="form-control" placeholder="Enter Coustmer Id of Existing Connection" name=" DeceasedFatherName" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Category">
                                            Category of Connection</label>
                                        <select class="form-control" data-val="true" data-val-number="Category"
                                            data-val-required="Please select Connection Category" id="ddlCategory" name="Category">
                                            <option>Select Connection Category</option>
                                            <option>Permanent</option>
                                            <option>Temperory</option>
                                            <option>Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlFacility">
                                            Connection Facility</label>
                                        <select class="form-control" data-val="true" data-val-number="Facility"
                                            data-val-required="Please select Connection Facility" id="ddlFacility" name="Facility">
                                            <option>Select Connection Facility</option>
                                            <option>Water</option>
                                            <option>Sewage</option>
                                            <option>Water & Sewage</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlPurpose">
                                            Connection Purpose</label>
                                        <select class="form-control" data-val="true" data-val-number="Purpose"
                                            data-val-required="Please select Connection Purpose" id="ddlPurpose" name="Purpose">
                                            <option>Select Connection Purpose</option>
                                            <option>Domestic</option>
                                            <option>Commercial</option>
                                            <option>Appartment</option>
                                            <option>Instituitional</option>
                                            <option>Industrial</option>
                                            <option>Other</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of DeceasedDetails-----%>
                    
                </div>

                <%---Start of Button----%>
                <div class="row" id="divButton" runat="server">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <%--<asp:Button ID="btnConfirm" runat="server" Text="Submit" class="btn btn-success"
                        OnClientClick="return checkDeclaration();" />--%>
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
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
</asp:Content>
