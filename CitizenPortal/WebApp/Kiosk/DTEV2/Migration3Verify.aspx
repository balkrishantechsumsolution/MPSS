<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Migration3Verify.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DTEV2.Migration3Verify" %>
<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>
<%@ Register Src="~/WebApp/Control/Photograph.ascx" TagPrefix="uc1" TagName="Photograph" %>

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
    <script src="Migration3Verify.js"></script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        #divNonAadhar {
            display: none;
        }
    </style>
    <script type="text/javascript">
        window.CallParent = function () {
            //alert(" Parent window Alert");
            ParentBindProfile();
        }
    </script>
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
                                    <label class="manadatory" for="txtRegistration">
                                        Registration No. (State Council)</label>
                                    <%--<input id="txtRegistration" class="form-control" placeholder="Student Registration Number (State Council)" name=" txtRegistration" maxlength="20" onkeypress="return AlphaNumeric(event)" />--%>
                                    <select class="form-control" data-val="true" data-val-number="ddlRegistration" data-val-required="Please select Registration" id="ddlRegistration" name="ddltxtRegistration" onchange="BindAppRegNo()">
                                        <option value="0">Select Year of Admission</option>
                                        <option value="101">F1100104005</option>
                                        <option value="102">080102035</option>
                                        <option value="103">f0901207087</option>
                                        <option value="104">f1001207025</option>
                                        <option value="105">F13005003001</option>
                                        <option value="106">F13001001013</option>
                                        <option value="107">F14004004058</option>
                                        <option value="108">L1305604025</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlAdmission">
                                        Year of Admission</label>
                                    <select class="form-control" data-val="true" data-val-number="ddlAdmission"
                                        data-val-required="Please select Session" id="ddlAdmission" name="ddlAdmission">
                                        <option value="0">Select Year of Admission</option>
                                        <option value="101">2011-2012</option>
                                        <option value="102">2008-2009</option>
                                        <option value="103">2009-2010</option>
                                        <option value="104">2010-2011</option>
                                        <option value="105">2013-2014</option>
                                        <option value="106">2013-2014</option>
                                        <option value="107">2014-2015</option>
                                        <option value="108">2013-2014</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 text-left">
                                <div class="form-group">
                                    <asp:Button ID="btnGetData" runat="server" class="btn btn-success mtop20" Text="Fetch Data" OnClientClick="javascript: return GetMigrationData();" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlBranch">
                                        Branch Name</label>
                                    <%--<select name="ddlBranch" id="ddlBranch" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Branch Name">
                                        <option value="0">Select Branch Name</option>
                                    </select>--%>
                                    <input id="ddlBranch" placeholder="Branch Name" class="form-control"/>
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
                                    <%--<select name="ddlInstitute" id="ddlInstitute" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Institute Name">
                                        <option value="0">Select Institute Name</option>
                                    </select>--%>
                                    <input id="ddlInstitute" placeholder="Institute Name" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="" for="txtDetails">
                                        Details of Examination passed/appreared</label>
                                    <%--<select class="form-control" data-val="true" data-val-number="ddlReason"
                                        data-val-required="Please select Session" id="ddlReason" name="ddlReason">
                                        <option value="0">Select</option>
                                        <option value="Passed Diploma">Passed Diploma</option>
                                        <option value="102">Discontinue Diploma</option>
                                    </select>--%>
                                    <input id="ddlReason" class="form-control" placeholder="Details of Examination passed/appreared" name=" txtDetails" type="text" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-9">
                                <div class="form-group">
                                    <label for="txReason">
                                        Reason of Issuing of Migration Certificate</label>
                                    <input id="txReason" class="form-control" placeholder="Reason of Issuing of Migration Certificate" name=" txReason" type="text" value=""
                                        maxlength="80" onkeypress="return ValidateAlpha(event)" />
                                </div>
                            </div>

                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of DeceasedDetails-----%>
                </div>
                <%----Start of SearhBasicDetails-----%>

                <div id="divRollNo" class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Search RollNo Details 
                            </h4>
                        </div>

                        <script>
                            function validateRollNo(RollNoVal) {
                                debugger;
                                if (RollNoVal == "1") {
                                    var RollNo = $("#RollNo").val();
                                    var length = RollNo.length;

                                    if ($("#RollNo").val() == "") {
                                        alert("Please Enter Your RollNo number.");
                                        return false;
                                    }
                                    if (eval(length) < 12) {
                                        alert("RollNo should be 12 digit");
                                        $("#RollNo").val("");
                                        return false;
                                    }
                                }
                            }
                        </script>

                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="row">
                                    <div class="form-group col-lg-2 ptop5"><b>Select Roll No :- </b></div>
                                    <div class="form-group col-lg-3">
                                        <select class="form-control" id="SelectRollNo">
                                            <option value="0">-Select Enrollment No-</option>
                                            <option value="001000000011">SE19217</option>
                                            <option value="001000000114">UR04110</option>
                                            <option value="001000000146">SC01352</option>
                                            <option value="001000000167">SC01342</option>
                                            <option value="001000001178">SE08140</option>
                                            <option value="001000001892">UR00729</option>
                                            <option value="025000001574">ST10956</option>
                                            <option value="025000001672">ST12294</option>
                                            <option value="025000002583">ST16742</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-lg-2 text-left">
                                        <input type="button" value="Search Roll No" class="btn btn-primary" onclick="BindRollNoDetail();"/>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 box-container p0">
                    <div class="box-heading">
                        <h4 class="box-title">Applicant Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered" style="width: 99%; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td>
                                        <table border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; font-size: 10px; text-align: center; width: 135px;">
                                                        <img src="" id="ProfilePhotoStu" name="ProfilePhoto" style="margin: 1px; width: 118px;"><b>Applicant Photo</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border-top: 1px solid #999; font-size: 10px; text-align: center; width: 135px;">
                                                        <img src="" id="ProfileSignature" name="ProfileSignature" style="width: 118px;"><b>Applicant Sign</b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td valign="top">
                                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                            <tbody>
                                                <tr>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Name Of The Candidate</b></td>
                                                    <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <input id="txtCandidateName" class="form-control" placeholder="Name Of The Candidate" maxlength="20" onkeypress="return AlphaNumeric(event)" />
                                                    </td>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Father's  Name</b></td>
                                                    <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <input id="txtFatherName" class="form-control" placeholder="Father's  Name" maxlength="20" onkeypress="return AlphaNumeric(event)" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1">
                                                        <b>Date of Birth
                                                            <br>
                                                            <span style="font-size: 11px;">(Age as on 01.01.2016)</span></b>  </td>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="vertical-align: top;">
                                                            <tbody>
                                                                <tr>
                                                                    <td width="7%" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #999; text-align: left;"><b>DOB</b></td>
                                                                    <td width="17%" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                        <input id="txtDOB" class="form-control" placeholder="DOB" name=" txtRegistration" maxlength="20" /></td>
                                                                    <td width="7%" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #999; text-align: left;"><b>Year</b></td>
                                                                    <td width="18%" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                        <input id="txtYear" class="form-control" placeholder="Year" name=" txtRegistration" maxlength="20" /></td>
                                                                    <td width="9%" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #999; text-align: left;"><b>Month</b></td>
                                                                    <td width="20%" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                        <input id="txtMonth" class="form-control" placeholder="Month" name=" txtRegistration" maxlength="20" /></td>
                                                                    <td width="7%" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #999; text-align: left;"><b>Day</b></td>
                                                                    <td width="15%" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                        <input id="txtDay" class="form-control" placeholder="Day" name=" txtRegistration" maxlength="20" /></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Gender</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 120px;">
                                                        <input id="txtGender" class="form-control" placeholder="Gender" name=" txtRegistration" maxlength="20" onkeypress="return AlphaNumeric(event)" /></td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mobile</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <input id="txtMobile" class="form-control" placeholder="Mobile" name=" txtRegistration" maxlength="20" onkeypress="return AlphaNumeric(event)" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1">
                                                        <b>Category</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <input id="txtCategory" class="form-control" placeholder="Category" name=" txtRegistration" maxlength="20" onkeypress="return AlphaNumeric(event)" />
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Email ID</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <input id="txtEmailId" class="form-control" placeholder="Email ID" name=" txtRegistration" maxlength="20" onkeypress="return AlphaNumeric(event)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Year of Admission</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <input id="txtAdmisionYear" class="form-control" placeholder="Year of Admission" name=" txtRegistration" maxlength="20" onkeypress="return AlphaNumeric(event)" /></td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Name of the Institute </b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>

                                                                    <td width="76%">
                                                                        <input id="txtInstituteName" class="form-control" placeholder="Name of the Institute" name=" txtRegistration" maxlength="20" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Branch Name</b>

                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <input id="txtBranchName" class="form-control" placeholder="Branch Name" name=" txtRegistration" maxlength="20" />
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Semester</b>

                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <input id="txtSemester" class="form-control" placeholder="Semester" name=" txtRegistration" maxlength="20" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%-----End of StudentUniversityDetails------%>

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
                <%---Start of PhotoNDetail----%>
                <div class="col-md-3 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">{{resourcesData.lblAppPhotograph}}
                        </h4>
                    </div>
                    <uc1:Photograph runat="server" ID="Photograph" />
                </div>
                <%---End of Photoupload----%>
                <%---Start of Basic Details----%>
                <div class="col-md-9 box-container p0" id="divDetails" runat="server">
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
                <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Mark Attendance
                    </h4>
                </div>
                <table style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                    <tr>
                        <td>
                            <input type="radio" name="attendance" id="rbtnPresent" value="P" />Present
                        </td>
                        <td>
                            <input type="radio" name="attendance" id="rbtnAbsent" value="A" />Absent
                        </td>

                    </tr>
                </table>
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
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Save" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" CssClass="btn btn-danger" PostBackUrl="" Text="Cancel" />
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
