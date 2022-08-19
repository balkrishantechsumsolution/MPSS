<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="PNTC.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.ITIPNTC.PNTC" %>

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
    <script src="PNTC.js"></script>
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
                <div class="row" id="divDetail" runat="server">
                    <%---Start of DeceasedDetails----%>
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Application Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">  
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txReason">
                                        Name of the Candidate</label>
                                    <input id="txCandidateName" class="form-control" placeholder="Name of Candidate" name=" txCandidateName" type="text" value=""
                                       maxlength="80" onkeypress="return ValidateAlpha(event)"   autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txReason">
                                        Candidate's Father Name</label>
                                    <input id="txtFather" class="form-control" placeholder="Name of Candidate Father" name=" txtFather" type="text" value=""
                                       maxlength="80" onkeypress="return ValidateAlpha(event)"   autofocus />
                                </div>
                            </div>                          
                            <div class="col-xs-6 col-sm-6 col-md-12 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegistration">
                                        Registration No.</label>
                                    <input id="txtRegistration" class="form-control" placeholder="Registration Number as a student of State Council" name=" txtRegistration" type="text" value=""
                                     maxlength="22" onkeypress="return AlphaNumeric(event)"   autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlSession">
                                        Session</label>
                                    <select class="form-control" data-val="true" data-val-number="Session"
                                        data-val-required="Please select Session" id="ddlSession" name="ddlSession" runat="server">
                                        <option value="0">Select Session</option>
                                       <%-- <option value="101">Summer Session</option>
                                        <option value="102">Winter Session</option>
                                        <option value="103">Special Session</option>--%>
                                        <option value="2">August</option>
                                        <option value="8">February</option>
                                    </select>
                                </div>
                            </div>                           
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label id="lblYear" class="manadatory" for="ddlPassing">
                                        Year of Passing</label>
                                    <select class="form-control" data-val="true" data-val-number="Session"
                                        data-val-required="Please select Session" id="ddlPassing" name="ddlPassing" runat="server">
                                        <option value="0">Select Year</option>
                                        <option value="2015">2015</option>
                                        <option value="2014">2014</option>
                                        <option value="2013">2013</option>
                                        <option value="2012">2012</option>
                                        <option value="2011">2011</option>
                                        <option value="2010">2010</option>
                                        <option value="2009">2009</option>
                                        <option value="2008">2008</option>
                                        <option value="2007">2007</option>
                                        <option value="2006">2006</option>
                                        <option value="2005">2005</option>
                                        <option value="2004">2004</option>
                                        <option value="2003">2003</option>
                                        <option value="2002">2002</option>
                                        <option value="2001">2001</option>
                                    </select>
                                </div>
                            </div>                              
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none;">
                                <div class="form-group">
                                    <label  class="manadatory" for="ddlSemester" title="Semester upto which Marksheet Requested" id="semester">
                                        Semester</label>
                                    <select class="form-control" data-val="true" data-val-number="Semester"  title="Semester upto which Marksheet Requested"
                                        data-val-required="Please select Session" id="ddlSemester" name="ddlSemesterr" runat="server">
                                        <option value="0" selected="selected">Select Semester</option>
                                        <option value="01">1st Semester</option>
                                        <option value="02">2nd Semester</option>
                                        <option value="03">3rd Semester</option>
                                        <option value="04">4th Semester</option>
                                        <option value="05">5th Semester</option>
                                        <option value="06">6th Semester</option>
                                    </select>
                                </div>
                            </div>  
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlBranch" id="branchname">
                                        Trade Name</label>
                                    <select name="ddlBranch" id="ddlBranch" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Branch Name" onchange="GetSubject();">
                                        <option value="0">Select Trade Name</option>
                                    </select>
                                </div>
                            </div> 
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="divApplicant">
                                <div class="form-group">
                                    <label  for="ddlInstitute" id="lblApplicant">
                                        Name of Institue</label>
                                    <select name="ddlInstitute" id="ddlInstitute" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Institute Name">
                                            <option value="0">Select Institute Name</option>
                                        </select>
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
    <asp:HiddenField ID="HFServiceID" runat="server" Value="138" />
    <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
    <asp:HiddenField ID="hdfSubject" runat="server" />
    <asp:HiddenField ID="hdfSubjectSave" runat="server" />
    <asp:HiddenField ID="hdfSubjectString" runat="server" />
</asp:Content>