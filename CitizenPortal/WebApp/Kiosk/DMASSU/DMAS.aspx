<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="DMAS.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DMASSU.DMAS" %>

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
    <script src="DMAS.js"></script>
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
                                    <label class="manadatory" for="txtRegistration">
                                        Registration No. </label>
                                    <input id="txtRegistration" class="form-control" placeholder="Registration No issued by University" name=" txtRegistration" type="text" value="" maxlength="20"
                                       onkeypress="return AlphaNumeric(event)"  autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRoll">
                                        Roll No. </label>
                                    <input id="txtRoll" class="form-control" placeholder="Roll Number issued by College" name=" txtRoll" type="text" value="" maxlength="20"
                                       onkeypress="return AlphaNumeric(event)"  autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlSession">
                                        Session</label>
                                    <select class="form-control" data-val="true" data-val-number="Session"
                                        data-val-required="Please select Session" id="ddlSession" name="ddlSession" runat="server">
                                        <option value="0">Select Session</option>
                                        <option value="101">Summer Session</option>
                                        <option value="102">Winter Session</option>
                                        <option value="103">Special Session</option>

                                    </select>
                                </div>
                            </div>                           
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label id="lblYear" class="manadatory" for="ddlPassing">
                                        Year of Passing</label>
                                    <select class="form-control" data-val="true" data-val-number="Session"
                                        data-val-required="Please select Session" id="ddlPassing" name="ddlPassing" runat="server">
                                        <option value="0">Select Year</option>
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
                                    </select>
                                </div>
                            </div>                              
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label  class="manadatory" for="ddlSemester" title="Semester upto which Marksheet Requested" id="semester">
                                        Semester</label>
                                    <select class="form-control" data-val="true" data-val-number="Semester"  title="Semester upto which Marksheet Requested"
                                        data-val-required="Please select Session" id="ddlSemester" name="ddlSemesterr" runat="server">
                                        <option value="0">Select Semester</option>
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
                                        Branch Name</label>
                                    <select name="ddlBranch" id="ddlBranch" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Branch Name" onchange="GetSubject();">
                                        <option value="0">Select Branch Name</option>
                                    </select>
                                </div>
                            </div> 
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label  for="ddlSubject" class="manadatory" id="Subject">
                                        Subject Name</label>
                                    <select name="ddlSubject" id="ddlSubject" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Branch Subject">
                                        <option value="0">Select Subject</option>
                                    </select>
                                </div>
                            </div>                               
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12" id="divApplicant">
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
                    <div class="col-md-12 box-container" id="divDetails">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Answer Sheet Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group error" id="divmore" runat="server" style="display: none;">
                                </div>
                                <div id="divSubject">
                                </div>
                                <div class="form-group">
                                    <table style="width: 100%" class="table table-striped table-bordered">
                                        <tbody>
                                            <tr>
                                                <th style="text-align: center;">
                                                    <label class="manadatory" for="txtAccused">
                                                        Subject</label>
                                                </th>
                                                <th style="text-align: center;">
                                                    <label for="txtAddress">
                                                        Semester</label>
                                                </th>
                                                <th style="text-align: center; width: 190px">
                                                    <label for="txtContact">
                                                        Branch</label>
                                                </th>
                                                <th style="text-align: center;">
                                                    <label class="" for="txtRemark">
                                                        Remarks</label>
                                                </th>
                                                <th style="text-align: center; width: 100px;">Add</th>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <input id="txtSubject" class="form-control" placeholder="Name of Subject" name="txtSubject" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td style="">
                                                    <input id="txtSemester" class="form-control" placeholder="Semester" name="txtSemester" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td style="">
                                                    <input id="txtBranch" class="form-control" placeholder="Branch" name="txtBranch" type="text" value=""
                                                        autofocus maxlength="10" />
                                                </td>
                                                <td style="">
                                                    <input id="txtRemark" class="form-control" placeholder="Remarks if any" name="txtRemark" type="text" value=""
                                                        autofocus />
                                                </td>
                                                <td align="center">
                                                    <input id="btnAdd" type="button" value="Add" onclick="AddSubject('');" class="btn btn-success" />
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