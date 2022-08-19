<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="TransferSU.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CTCSU.TransferSU" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
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
    <script src="TransferSU.js"></script>
    
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
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>{{titleData.lblTitle}}
                    </h2>
                </div>
                <div class="clearfix">
                    <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                </div>

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
                                    <label class="manadatory" for="ddlStudent">
                                        Student Type</label>
                                    <select name="ddlStudent" id="ddlStudent" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Trade Name">
                                        <option value="0">Select Type of Student</option>
                                        <option value="1">Regular</option>
                                        <option value="2">Non Collegiate</option>
                                        <option value="3">Distance Student</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="" for="txtRegistration">
                                        Registration No.
                                    </label>
                                    <input id="txtRegistration" class="form-control" placeholder="Registration No issued by University" name=" txtRegistration" type="text" value="" maxlength="20"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRoll">
                                        Roll No.
                                    </label>
                                    <input id="txtRoll" class="form-control" placeholder="Roll Number issued by College" name=" txtRoll" type="text" value="" maxlength="20"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlAdmission">
                                        Year of Admission</label>
                                    <select class="form-control" data-val="true" data-val-number="ddlAdmission"
                                        data-val-required="Please select Session" id="ddlAdmission" name="ddlAdmission">
                                        <option value="0">Select Year of Admission</option>
                                        <option value="2017">2017</option>
                                        <option value="2016">2016</option>
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
                                        <option value="2000">2000</option>
                                    </select>
                                </div>
                            </div>

                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of DeceasedDetails-----%>
                </div>
                <%----Start of Present College-----%>
                <div class="row">
                    <div class="col-md-7 box-container" id="divPresent">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Present College Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-8">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlCollege">
                                        Name of College (Currently Studying)</label>
                                    <select name="ddlCollege" id="ddlCollege" class="form-control" data-val="true" data-val-number="" data-val-required="Please select College Name">
                                        <option value="0">Select College Name</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlBranch">
                                        Branch</label>
                                    <select name="ddlBranch" id="ddlBranch" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Trade Name" onchange="GetCBCSSubjectList_CTC();">
                                        <option value="0">Select Branch</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlClass">
                                        Class Name</label>
                                    <select name="ddlClass" id="ddlClass" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Class Name">
                                        <option value="0">Select Class Name</option>
                                        <option value="1">1st Year</option>
                                        <option value="2">2nd Year</option>
                                        <option value="3">3rd Year</option>

                                    </select>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                
                    <div class="col-md-5 box-container" id="divTransfer">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Seeking Transfer College Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlCollegeTransfer">
                                        Name of College (Seeking Transfer)</label>
                                    <select name="ddlCollegeTransfer" id="ddlCollegeTransfer" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Institute Name">
                                        <option value="0">Select College Name</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlProgrameTransfer">
                                        Programme Name</label>
                                    <select name="ddlProgrameTransfer" id="ddlProgrameTransfer" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Trade Name">
                                        <option value="0">Select Programme Name</option>
                                        <option value="BAH">B.A (Hons.)</option>
                                        <option value="BAP">B.A (Pass.)</option>
                                        <option value="BCH">B.Com (Hons.)</option>
                                        <option value="BCP">B.Com (Pass.)</option>
                                        <option value="BSH">B.Sc (Hons.)</option>
                                        <option value="BSP">B.Sc (Pass.)</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlClassTransfer">
                                        Class Name</label>
                                    <select name="ddlClassTransfer" id="ddlClassTransfer" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Class Name">
                                        <option value="0">Select Class Name</option>
                                        <option value="1">1st Year</option>
                                        <option value="2">2nd Year</option>
                                        <option value="1">3rd Year</option>

                                    </select>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%----End of Present College-----%>
                <%----Start of Subject-----%>
                <div class="row" id="lblSubjectList">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Name of Subject Under Taken (with Hons if any)
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="DivCore1">
                                <div class="form-group">
                                    <label class="manadatory" id="lblDSCI">
                                        DSC-Honours (Choose any one)</label>
                                    <select id="ddlAP" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="DivCore2">
                                <div class="form-group">
                                    <label class="manadatory" id="lblDSCII">
                                        DSC-A (Choose Any one)</label>
                                    <select id="ddlAP1" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="DivCore3">
                                <div class="form-group">
                                    <label class="manadatory" id="lblDSCIII">
                                        DSC-B (Choose Any one)</label>
                                    <select id="ddlAP2" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivGE">
                                <div class="form-group">
                                    <label class="manadatory">
                                        GE</label>
                                    <select id="ddlGE" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-5 col-lg-3" id="DivMIL">
                                <div class="form-group">
                                    <label class="manadatory">
                                        MIL</label>
                                    <select id="ddlMIL" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivAECC">
                                <div class="form-group">
                                    <label class="manadatory">
                                        AECC-II</label>
                                    <select id="ddlAECC" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" id="DivSEC">
                                <div class="form-group">
                                    <label class="manadatory">
                                        SEC-B</label>
                                    <select id="ddlSECB" class="form-control">
                                        <option value="0">Select</option>
                                    </select>
                                </div>
                            </div>


                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%----End of Subject-----%>
                <%----Start of Transfer College-----%>
                <div class="row">
                    
                </div>
                <%----End of Transfer College-----%>

                <%----Start of Reason-----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="divTrans">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Reason for Transfer
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlReason">
                                        Reason for Seeking College Transfer Certificate</label>
                                    <%--<input id="txReason" class="form-control" placeholder="Reason of Issuing of Migration Certificate" name=" txReason" type="text" value=""
                                        maxlength="80" onkeypress="return ValidateAlpha(event)" autofocus />--%>
                                    <select name="ddlReason" id="ddlReason" class="form-control" data-val="true" data-val-number="" data-val-required="Please select College Name">
                                        <option value="0">Select Reason</option>
                                    </select>
                                </div>
                            </div>

                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%----End of Reason-----%>

                <%----Start of Declaration-----%>
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
</asp:Content>

