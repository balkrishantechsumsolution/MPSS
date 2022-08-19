<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="NFBS.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.NFBS.NFBS" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <%--  <script src="../../Scripts/AddressScript.js"></script>--%>

    <script src="/WebApp/Kiosk/NFBS/NFBS.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
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
                    <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>{{titleData.lblTitle}}
                    </h2>
                </div>

                <div class="row clearfix">
                    <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                </div>
                <%---Start of Declaration----%>



                <div class="row" id="divDecease" runat="server">

                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title">Information<span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i></span><span class="clearfix"></span>
                            </h4>
                        </div>
                        <%--<uc1:Declaration runat="server" id="Declaration" />--%>
                        <uc1:ServiceInformation runat="server" ID="ServiceInformation" />
                    </div>

                    <%---Start of DeceasedDetails----%>
                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Details of Deceased
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="firstname">
                                        Deceased Full Name</label>
                                    <input id="DeceasedName" class="form-control" placeholder="Enter Deceased Full Name" name=" DeceasedFullName" type="text" value=""
                                        onkeypress="return ValidateAlpha(event);" onchange="return checkLength(this);" autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlYearTerm">
                                        {{resourcesData.lblAppFatherName}}</label>
                                    <input id="DeceasedFName" class="form-control" placeholder="Enter Deceased Father/Husband Name " name=" DeceasedFatherName" type="text" value=""
                                        onkeypress="return ValidateAlpha(event);"  onchange="return checkLength(this);" autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="form-group">
                                    <label for="Village" class="manadatory">
                                        {{resourcesData.lblAppDOB}}</label>
                                    <input id="DeceasedDOB" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOB" type="text" value=""    maxlength="12" 
                                   onkeypress="return ValidateAlpha(event);"  onkeydown=" return allowBackspace(event);"    autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        {{resourcesData.lblDOD}}</label>
                                    <input id="DeceasedDOD"   class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOD" type="text" value=""  maxlength="12"
                                   onkeypress="return ValidateAlpha(event);"    onkeydown=" return allowBackspace(event);"      autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        {{resourcesData.lblAppAge}}</label>
                                    <input id="DeceasedAge" class="form-control" placeholder="Years" name="Years" type="text" value=""
                                        autofocus />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDeceasedGender">
                                        {{resourcesData.lblAppGender}}</label>
                                    <select class="form-control" data-val="true" data-val-number="Gender."
                                        data-val-required="Please select gender." id="ddlDeceasedGender" name="Gender">
                                        <option>Select Gender</option>
                                        <option>Male</option>
                                        <option>Female</option>
                                        <option>Transgender</option>
                                    </select>
                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="bplcardno">
                                        {{resourcesData.bplcardno}}</label>
                                    <input id="bplcardno" class="form-control" placeholder="Enter BPL Card No." name="BPLCardNo" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="BPLYear">
                                        {{resourcesData.bplYear}}</label>
                                    <select class="form-control" data-val="true" data-val-number="BPLYear."
                                        data-val-required="Please select gender." id="BPLYear" name="BPLYear" runat="server">
                                        <option>Select BPL Year</option>
                                        <option>2016</option>
                                        <option>2015</option>
                                        <option>2014</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row" style="display: none">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                    <div class="form-group">
                                        <label class="manadatory col-lg-5" for="headoffamily">
                                            Whether head of family
                                        </label>
                                        <label class="col-lg-2" for="rbtYes">
                                            <asp:CheckBox ID="chkHeadFamily" runat="server" />
                                            Yes
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of DeceasedDetails-----%>
                    <%---Start of DeceasedAddress----%>
                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Deceased Complete Address
                            </h4>
                        </div>
                        <uc1:Address runat="server" ID="Address2" ClientIDMode="Inherit" />
                    </div>
                    <%----End of DeceasedAddress-----%>
                </div>

                <%---Start of BankDetails----%>
                <div class="row" id="divBankDtls" runat="server">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Account Details of Beneficiary
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="AccountHolder">
                                        Name of the Account Holder</label>
                                    <input id="AccountHolder" class="form-control" placeholder="Name of Account Holder" name="AccountHolder" type="text" value="" maxlength="25"
                                        onkeypress="return ValidateAlpha(event);"  onchange="return checkLength(this);" autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="AccountNumber">
                                        Account Number</label>
                                    <input id="AccountNumber" class="form-control" placeholder="Account Number" name="AccNo" type="text" value="" maxlength="22"
                                        onkeypress="return isNumberKey(event);" autofocus  />
                                </div>
                        </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="IFSCCode">
                                        IFSC Code</label>
                                    <input id="IFSCCode" class="form-control" placeholder="Enter IFSC Code" name="IFSCCode" type="text" value="" maxlength="11"
                                      onchange="AllowIFSC()"   autofocus />
                                     <label for="IFSCCODE" class="forerrormsg"  style="color: red;" ></label>          
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of BankDetails-----%>
                </div>
                <%----End of BankDetails-----%>
                <%---Start of Declaration----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title manadatory">{{resourcesData.lblDeclaration}}
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
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="SubmitData();" title="Proceed to Upload Necessary Document" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />
                            <asp:Button ID="btnHome" runat="server"
                                CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page"
                                Text="Home" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
            </div>
        </div>
        <asp:HiddenField ID="HFServiceID" runat="server" />
        <asp:HiddenField ID="HiddenNFBSAge" runat="server" />
        <asp:HiddenField ID="HiddenNFBSGender" runat="server" />


        <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
    </div>
</asp:Content>
