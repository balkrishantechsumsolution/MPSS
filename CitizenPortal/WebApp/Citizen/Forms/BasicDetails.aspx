<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="BasicDetails.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.BasicDetails" %>


<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/Photograph.ascx" TagPrefix="uc1" TagName="Photograph" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>


    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Citizen/Script/CitizenBasicDetails.js"></script>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Citizen Profile Creation
                </h2>
                <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
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

                <div class="row" id="divBasicInfo" runat="server">
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
                    <div class="col-md-9 box-container mTop15">
                        <div class="box-heading" id="Div4">
                            <h4 class="box-title register-num">{{resourcesData.lblApplicantDetails}}
                            </h4>
                        </div>
                        <uc1:PersonalDetail runat="server" ID="PersonalDetail" />
                    </div>
                    <%---End of Basic Details----%>
                </div>
                <%-- Start Other Information ---%>
                <div class="row" id="divInfo">
                    <div class="col-md-12 box-container mTop15" id="div1" runat="server">
                        <div class="box-heading">
                            <h4 class="box-title">Other Information
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="" for="ddlCategory">
                                        Category
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="Category."
                                        data-val-required="Please select Salutation." id="ddlCategory" name="ddlCategory">
                                        <option value="0">Select Category</option>
                                        <option value="101">Scheduled Castes (SC)</option>
                                        <option value="102">Scheduled Tribes (ST)</option>
                                        <option value="103">Socially and Economically Backward Class(SCBC)</option>
                                        <option value="104">Backward Category(BC)</option>
                                        <option value="105">Other Backward Classes(OBC)</option>
                                        <option value="107">General(GEN)</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="" for="ddlReligion">
                                        Religion
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="Religion"
                                        data-val-required="Please select Religion." id="ddlReligion" name="ddlReligion">
                                        <option value="0">Select Religion</option>
                                        <option value="101">Hindu</option>
                                        <option value="102">Sikh</option>
                                        <option value="103">Muslim</option>
                                        <option value="104">Jain</option>
                                        <option value="105">christian</option>
                                        <option value="109">Buddhism </option>
                                        <option value="110">Parsi</option>
                                        <option value="111">Other</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="" for="ddlStatus">
                                        Marital Status
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="ddlStatus"
                                        data-val-required="Please select Marital Status" id="ddlStatus" name="ddlStatus">
                                        <option value="0">Select Marital Status</option>
                                        <option value="101">Single</option>
                                        <option value="102">Married</option>
                                        <option value="103">Divorced</option>
                                        <option value="104">Widow</option>
                                        <option value="105">Separated</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%-- End of Other Information --%>
                <div class="row" id="divAddress" runat="server">
                    <%---Start of PermanentAddress----%>
                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Permanent Address
                            </h4>
                        </div>
                        <%--<uc1:Address runat="server" ID="Address1" ClientIDMode="Inherit" />--%>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="AddressLine1">
                                        {{resourcesData.lblAppAddress}}
                                    </label>
                                    <input id="AddressLine1" class="form-control" placeholder="First Line Address" name="Address Line-1 (Care of)" type="text" value="" maxlength="20"
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="AddressLine2">
                                        {{resourcesData.lblAppBuilding}}
                                    </label>
                                    <input id="AddressLine2" class="form-control" placeholder="Second Line Address" name="Address Line-2 (Building)" type="text" value="" maxlength="20"
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="RoadStreetName">
                                        {{resourcesData.lblAppStreet}}
                                    </label>
                                    <input id="RoadStreetName" class="form-control" placeholder="Road / Street Name" name="Road / Street Name" type="text" value="" maxlength="20"
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="LandMark">
                                        {{resourcesData.lblAppLandmark}}
                                    </label>
                                    <input id="LandMark" class="form-control" placeholder="Landmark" name="Landmark" type="text" value="" maxlength="20"
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="" for="Locality">
                                        {{resourcesData.lblAppLocality}}
                                    </label>
                                    <input id="Locality" class="form-control" placeholder="Locality" name="Locality" type="text" value="" maxlength="20"
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="txtState">
                                        {{resourcesData.lblAppState}}
                                    </label>
                                    <input id="txtState" class="form-control" placeholder="Enter State Name" name="txtState" type="text" value=""
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDistrict">
                                        {{resourcesData.lblAppDistrict}}
                                    </label>
                                    <input id="txtDistrict" class="form-control" placeholder="Enter District Name" name="txtDistrict" type="text" value=""
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="txtBlock">
                                        {{resourcesData.lblappsubdis}}
                                    </label>
                                    <input id="txtBlock" class="form-control" placeholder="Enter Block Name" name="txtBlock" type="text" value=""
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory text-nowrap" for="txtPanchayat">
                                        {{resourcesData.lblAppVillage}}
                                    </label>
                                    <input id="txtPanchayat" class="form-control" placeholder="Enter Panchayat Name" name="txtPanchayat" type="text" value=""
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="PIN">
                                        {{resourcesData.lblAppPincode}}
                                    </label>
                                    <input id="PinCode" class="form-control" placeholder="PIN" name="PIN" type="text" value="" maxlength="6"
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%---End of PermanentAddress----%>
                    <%---Start of onclick="fnCopyAddress();"PermanentAddress----%>
                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="row box-title register-num"><span class="col-md-6">Present Address</span> <span class="col-md-6" style="font-style: normal; font-size: 12px; text-align: right;">
                                <input id="chkAddress" type="checkbox" onclick="javascript: fnCopyAddress(this.checked);" />Same as Permanent Address</span><span class="clearfix">
                                </span>
                            </h4>
                        </div>
                        <uc1:Address runat="server" ID="Address2" ClientIDMode="Inherit" />
                    </div>
                    <%---End of PermanentAddress----%>
                </div>


                <%---Start of Button----%>
                <div class="row" id="divBtn" runat="server">
                    <div class="col-md-12 box-container">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="fnNext();" />
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
    <asp:HiddenField ID="HFUIDData" runat="server" />
</asp:Content>
