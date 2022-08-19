<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Migration2.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DTEV2.Migration2" %>

<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
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
    <script src="Migration2.js"></script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        #divNonAadhar {
            display: none;
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
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>{{titleData.lblTitle}}
                    </h2>
                </div>
                <div class="clearfix">
                    <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                </div>
                <%----Start of SearhBasicDetails-----%>

                <div class="row" id="divSearch" runat="server">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Search Basic Details 
                            </h4>
                        </div>
                        <uc1:SearchRecord runat="server" ID="SearchRecord" />
                    </div>
                </div>
                <%-----End of SearhBasicDetails------%>
                <%---Start of Basic Details----%>
                <div class="col-md-12 box-container" style="padding-left: 0px; padding-right: 0px;" id="divDetails" runat="server">
                    <div class="box-heading" id="Div4">
                        <h4 class="box-title">{{resourcesData.lblApplicantDetails}}
                        </h4>
                    </div>
                    <div class="box-body box-body-open">

                        <uc1:PersonalDetail runat="server" ID="PersonalDetail" />
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <%---End of Basic Details----%>
                <div class="row" id="divDecease" runat="server">
                    <%---Start of DeceasedDetails----%>
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Application Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegistration">
                                        Registration No. (State Council)</label>
                                    <input id="txtRegistration" class="form-control" placeholder="Student Registration Number (State Council)" name=" txtRegistration" maxlength="20" onkeypress="return AlphaNumeric(event)" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlAdmission">
                                        Year of Admission</label>
                                    <select class="form-control" data-val="true" data-val-number="ddlAdmission"
                                        data-val-required="Please select Session" id="ddlAdmission" name="ddlAdmission">
                                        <option value="0">Select Year of Admission</option>
                                        <option value="101">2015-2016</option>
                                        <option value="102">2014-2015</option>
                                        <option value="103">2013-2014</option>
                                        <option value="104">2012-2013</option>
                                        <option value="105">2011-2012</option>
                                        <option value="106">2010-2011</option>
                                        <option value="101">2009-2010</option>
                                        <option value="102">2008-2009</option>
                                        <option value="103">2007-2008</option>
                                        <option value="104">2006-2007</option>
                                        <option value="105">2005-2006</option>
                                        <option value="106">2004-2005</option>
                                        <option value="103">2003-2004</option>
                                        <option value="104">2002-2003</option>
                                        <option value="105">2001-2002</option>
                                        <option value="106">2001-2000</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 text-left "">
                               
                                <div class="form-group">
                            <asp:Button ID="btnGetData" runat="server" class="btn btn-success mtop20" Text="Fetch Data" OnClientClick="javascript: return GetMigrationData();" />
                                    </div></div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlBranch">
                                        Branch Name</label>
                                    <select name="ddlBranch" id="ddlBranch" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Branch Name">
                                        <option value="0">Select Branch Name</option>
                                    </select>
                                </div>
                            </div>                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label for="txtDate">
                                        Date of Leaving Institute</label>
                                    <input id="txtDate" class="form-control" placeholder="dd/MM/yyyy" name="txtDate" type="text" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="ddlInstitute">
                                        Name of Institute</label>
                                    <select name="ddlInstitute" id="ddlInstitute" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Institute Name">
                                        <option value="0">Select Institute Name</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDetails">
                                        Details of Examination passed/appreared</label>
                                    <select class="form-control" data-val="true" data-val-number="ddlReason"
                                        data-val-required="Please select Session" id="ddlReason" name="ddlReason">
                                        <option value="0">Select</option>
                                        <option value="Passed Diploma">Passed Diploma</option>
                                        <option value="102">Discontinue Diploma</option>
                                    </select>
                                    <input id="txtDetails" style="display: none;" class="form-control" placeholder="Details of Examination passed/appreared" name=" txtDetails" type="text" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-9">
                                <div class="form-group">
                                    <label for="txReason">
                                        Reason of Issuing of Migration Certificate</label>
                                    <input id="txReason" class="form-control" placeholder="Reason of Issuing of Migration Certificate" name=" txReason" type="text" value=""
                                        maxlength="80" onkeypress="return ValidateAlpha(event)" autofocus />
                                </div>
                            </div>

                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of DeceasedDetails-----%>
                </div>               
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
    <asp:HiddenField ID="HFServiceID" runat="server" Value="" />
    <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HFOTPDone" runat="server" />
    <asp:HiddenField ID="HFMobileNo" runat="server" />
    <asp:HiddenField ID="HFProfileID" runat="server" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
</asp:Content>
