<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="MarkEntry.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DTE.MarkEntry" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>

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
    
    <script src="DAMSForm.js"></script>
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
                <div class="row" id="divDetail" runat="server">
                    <%---Start of DeceasedDetails----%>
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Application Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-6 col-sm-6 col-md-12 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegistration">
                                        Registration No. (State Council)</label>
                                    <input id="txtRegistration" class="form-control" placeholder="Registration Number as a student of State Council" name=" txtRegistration" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
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
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlAdmission">
                                        Year of Admission</label>
                                    <select class="form-control" data-val="true" data-val-number="Session"
                                        data-val-required="Please select Session" id="ddlAdmission" name="ddlAdmission" runat="server">
                                        <option value="0">Select Year of Admission</option>
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
                                    <label class="manadatory" for="ddlPassing">
                                        Year of Passing</label>
                                    <select class="form-control" data-val="true" data-val-number="Session"
                                        data-val-required="Please select Session" id="ddlPassing" name="ddlPassing" runat="server">
                                        <option value="0">Select Year of Passing</option>
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
                                    <label class="manadatory" for="ddlSemester" title="Semester upto which Marksheet Requested">
                                        Semester</label>
                                    <select class="form-control" data-val="true" data-val-number="Semester" title="Semester upto which Marksheet Requested"
                                        data-val-required="Please select Session" id="ddlSemester" name="ddlSemesterr" runat="server">
                                        <option value="0">Select Semester</option>
                                        <option value="1st">1st Semester</option>
                                        <option value="2nd">2nd Semester</option>
                                        <option value="3rd">3rd Semester</option>
                                        <option value="4th">4th Semester</option>
                                        <option value="5th">5th Semester</option>
                                        <option value="6th">6th Semester</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlBranch">
                                        Branch Name</label>
                                    <select name="ddlBranch" id="ddlBranch" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Branch Name" onchange="GetSubject();">
                                        <option value="0">Select Branch Name</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlSubject">
                                        Subject Name</label>
                                    <select name="ddlSubject" id="ddlSubject" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Branch Subject">
                                        <option value="0">Select Subject</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12" id="divApplicant">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlInstitute" id="lblApplicant">
                                        Name of Institue</label>
                                    <select name="ddlInstitute" id="ddlInstitute" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Institute Name">
                                        <option value="0">Select Institute Name</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="txtInstitute" >
                                        Name of the Student</label>
                                    <input id="txtName" class="form-control" placeholder="Enter Name of the Student" name=" txtInstitute" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="txtInstitute" >
                                        Student's Father Name</label>
                                    <input id="txtFather" class="form-control" placeholder="Enter Name of the Student" name=" txtInstitute" type="text" value=""
                                        autofocus />
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
</asp:Content>
