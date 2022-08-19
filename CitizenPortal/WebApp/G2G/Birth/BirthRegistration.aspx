<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="BirthRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.Birth.BirthRegistration" %>

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
    <%--<script src="../../../Scripts/angular.min.js"></script>--%>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/AddressScript.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>
    <script src="BirthRegistration.js"></script>
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
                    <uc1:FormTitle runat="server" ID="FormTitle" />
                </div>
                <div class="row">
                <%---Start of BirthDetails----%>
                <div class="col-md-12 box-container mTop15" id="divDetails">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Baby Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    {{resourcesData.lblAppDOB}}</label>
                                <input id="DOB" class="form-control" placeholder="dd/MM/yyyy" name="Date of Birth" type="text" value="" maxlength="10"
                                    autofocus />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="TOB">
                                    Time of Birth</label>
                                <input id="TOB" class="form-control" placeholder="HH:MM:SS" name="TOB" type="text" value="" maxlength="8s"
                                    autofocus />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtWeight">
                                    Weight of Baby</label>
                                <input id="txtWeight" class="form-control" placeholder="Enter weight in KG" name="txtWeight" type="text" value="" maxlength="10"
                                    autofocus />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlGender">
                                    {{resourcesData.lblAppGender}}</label>
                                <select class="form-control" data-val="true" data-val-number="Gender."
                                    data-val-required="Please select gender." id="ddlGender" name="Gender">
                                    <option>Select Gender</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-4">
                            <div class="form-group">
                                <label class="" for="txtChildName">
                                    {{resourcesData.child}}</label>
                                <input id="txtChildName" class="form-control" placeholder="Name of Child" name="txtChildName" type="text" value=""
                                    autofocus />
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="FatherName">
                                    {{resourcesData.father}}</label>
                                <input id="txtFatherName" class="form-control" placeholder="Father Name" name="txtFatherName" type="text" value=""
                                    autofocus />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="MotherName">
                                    {{resourcesData.lblAppMotherName}}</label>
                                <input id="txtMotherName" class="form-control" placeholder="Mother Name" name="txtMotherName" type="text" value=""
                                    autofocus />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="FatherName">
                                    {{resourcesData.lblAppMobile}}</label>
                                <input id="txtMobileNo" class="form-control" placeholder="Mobile No." name="txtMobileNo" value="" maxlength="10" onkeypress="return isNumberKey(event);"
                                    autofocus />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory" for="MotherName">
                                    {{resourcesData.lblAppEmail}}</label>
                                <input id="txtEmailID" class="form-control" placeholder="Email Id" name="txtEmailID" type="email" value="" maxlength="50"
                                    autofocus />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <%----End of BirthDetails-----%>
                <%---Start of BirthDetails----%>
                <div class="col-md-12 box-container mTop15" id="divPlace">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Hospital (Birth Place) Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="hospname">
                                    Nam of the Hospital / Health Center</label>
                                <input id="txtHospname" class="form-control" placeholder="Name of the Hospital / Institution" name="txtHospname" type="text" value=""
                                    autofocus />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-8 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory" for="POB">
                                    {{resourcesData.lblPOB}}</label>
                                <input id="txtPOB" class="form-control" placeholder="Birth Place" name="txtPOB" type="text" value=""
                                    autofocus />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <uc1:Address runat="server" ID="Address" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <%----End of BirthDetails-----%>
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
    <asp:HiddenField ID="HFServiceID" runat="server" Value="993" />
</asp:Content>
