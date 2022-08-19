<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="Migration.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Migration.Migration" %>

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
    <script src="MigrationSU.js"></script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
    <script type="text/javascript">
        function TakeAction(p_URL, p_AppID, p_ServiceID, p_PaymentStatus, p_AckURL) {
            debugger;
            var t_URL = "";
            p_ServiceID = '1446';
            if (p_PaymentStatus == "UnPaid") {
                t_URL = "/WebApp/Kiosk/Forms/Attachment.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            }
            else {
                t_URL = "/WebApp/Kiosk/MigrationSU/Acknowledgement.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <div class="clearfix">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Migration Application Form
                    </h2>
                </div>
                <div class="clearfix">
                    <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                </div>

                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Filter Panel
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRegistration">
                                        University Registration No.
                                    </label>
                                    <input id="txtRegistration" runat="server" class="form-control" placeholder="Registration No issued by University" name=" txtRegistration" type="text" value="" maxlength="20"
                                        autofocus />
                                </div>
                            </div>                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="txtRoll">
                                        Date of Birth (as registered with University)
                                    </label>
                                    <input id="txtDOB" runat="server" class="form-control" placeholder="DD/MM/YYYY" name=" txtDOB" type="text" value="" maxlength="10"
                                        onchange="ValidateDate();" autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="" for="txtRoll">
                                        University Roll No.
                                    </label>
                                    <input id="txtRoll" runat="server" class="form-control" placeholder="Roll Number issued by university" name=" txtRoll" type="text" value="" maxlength="20"
                                        autofocus />
                                </div>
                            </div>



                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label>
                                    </label>
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mtop25" class="btn btn-primary" value="Apply" OnClick="btnSearch_Click" />
                                </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <div class="row" id="divDecease" runat="server" style="">
                    <%---Start of DeceasedDetails----%>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 pleft0">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num ptop10">Application Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
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


                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
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
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlPrograme">
                                            Branch</label>
                                        <select name="ddlPrograme" id="ddlPrograme" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Trade Name">
                                            <option value="0">Select Branch </option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display:none;">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlClass">
                                            Current Year</label>
                                        <select name="ddlClass" id="ddlClass" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Current Year">
                                            <option value="0">Select Current Year</option>
                                            <option value="1">1st Year</option>
                                            <option value="2">2nd Year</option>
                                            <option value="1">3rd Year</option>

                                        </select>
                                    </div>
                                </div>


                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtCandidate">
                                            Candidate Name
                                        </label>
                                        <input id="txtCandidate" class="form-control" placeholder="Applicant Name as Registration with University" runat="server" name="txtCandidate" type="text" value="" maxlength="20"
                                            onkeypress="return AlphaNumeric(event)" autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlCollege">
                                            Name of College</label>
                                        <select name="ddlCollege" id="ddlCollege" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Institute Name">
                                            <option value="0">Select College Name</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="txtDate">
                                            Month & Year of Last Exam. Attended</label>
                                        <input id="txtDate" class="form-control" placeholder="dd/MM/yyyy" name="txtDate" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlReason">
                                            Result of Exam. Attended</label>
                                        <select class="form-control" data-val="true" data-val-number="ddlReason"
                                            data-val-required="Please select Session" id="ddlReason" name="ddlReason">
                                            <option value="0">Select</option>
                                            <option value="Passed">Passed</option>
                                            <option value="Discontinue">Discontinue</option>
                                            <option value="Failed">Failed</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="" for="txtCollege">
                                            Name of Joining College</label>
                                        <input id="txtCollege" class="form-control" placeholder="Name of Joining College" name=" txtCollege" type="text" value="" maxlength="200"
                                            onkeypress="return AlphaNumeric(event)" autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="" for="txtUniversity">
                                            Name of Joining University</label>
                                        <input id="txtUniversity" class="form-control" placeholder="Name of Joining University" name=" txtUniversity" type="text" value="" maxlength="200"
                                            onkeypress="return AlphaNumeric(event)" autofocus />
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="txReason">
                                            Reason of Issuing of Migration Certificate</label>
                                        <input id="txReason" class="form-control" placeholder="Reason of Issuing of Migration Certificate" name=" txReason" type="text" value=""
                                            maxlength="80" onkeypress="return ValidateAlpha(event)" autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlRegCardStatus">
                                            Original Registration Card Status</label>
                                        <select class="form-control" data-val="true" data-val-number="ddlRegCardStatus"
                                            data-val-required="Please select Session" id="ddlRegCardStatus" name="ddlRegCardStatus">
                                            <option value="0">Select</option>
                                            <option value="Available">Available</option>
                                            <option value="Damaged">Damaged</option>
                                            <option value="Lost">Lost</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display:none;">
                                    <div class="form-group">
                                        <label class="mandatory">Father’s/Husband's Name</label>
                                        <input type="text" id="lblFathersName" class="form-control" placeholder="" maxlength="30" onkeypress="return ValidateAlpha(event);" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display:none;">
                                    <div class="form-group">
                                        <label class="mandatory">Gender</label>
                                        <select class="form-control" id="ddlGender">
                                            <option value="Select">-Select-</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Transgender">Transgender</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mandatory">
                                            Email Id</label>
                                        <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" autofocus="" style="" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mandatory">Mobile No </label>
                                        <input type="text" class="form-control" placeholder="" id="txtContactNo" maxlength="10" onkeypress="return isNumberKey(event); " />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 p0">
                        <div id="divPhoto" class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title mandatory">Applicant Photograph
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-lg-12">
                                    <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" runat="server" id="myImg" />
                                    <input class="camera" id="File1" name="Photoupload" type="file" onchange="readFile(this.files);" />
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                        <div id="divSign" class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title mandatory">Applicant Signature
                                </h4>
                            </div>
                            <div class="box-body box-body-open p0">
                                <div class="col-lg-12">
                                    <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" runat="server" id="mySign" />
                                    <input class="camera" id="File2" name="Photoupload" type="file" onchange="readFileSign(this.files);" />
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
                            <div class="box-body box-body-open">
                                <div class="col-sm-6 col-md-6 col-lg-12">
                                    <div class="text-danger text-danger-green mt0">
                                        <p class="text-justify">
                                            <input type="checkbox" runat="server" id="disclaimercheck"  />
                                            I 
                <span id="spndecl" style="font-weight: bold; text-transform: uppercase;"></span>
                                           solemnly affirm that the above mentioned information / documnets submitted by me is true and correct to my knowledge and belief. I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date.                                        
                                        </p>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>

                            </div>
                        </div>
                    </div>
                    <%----End of Declaration-----%>

                    <%---Start of Button----%>
                    <div class="row" id="divButton" runat="server">
                        <div class="col-md-12 box-container" id="divBtn">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>"  disabled="disabled"/>
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                    CssClass="btn btn-danger" OnClick="btnCancel_Click"
                                    Text="Cancel" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <%---End of Button----%>
                </div>
                <div class="row" id="divApplication" runat="server" style="">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pleft0">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num ptop10">Application Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-lg-12">
                                    <asp:GridView ID="grdView1" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnRowDataBound="grdView1_RowDataBound">
                                    </asp:GridView>
                                    
                                </div>
                                <div class="clearfix"></div>
                            </div>                            
                        </div>                        
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="HFServiceID" runat="server" Value="" />
            <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="HFAppValue" runat="server" />

            <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
    </div>
    </div>
</asp:Content>

