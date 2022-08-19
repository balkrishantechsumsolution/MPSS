<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="eAppeal.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Complaint.eAppeal" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>

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
    <script src="/WebApp/Scripts/CommonScript.js"></script>

    
    <script src="/webapp/Scripts/AddressScript.js"></script>
    <script src="/WebApp/Kiosk/Complaint/Script/eAppeal.js"></script>
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
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <div class="row" id="divDetails" runat="server">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Complaint Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlServices">
                                        {{resourcesData.services}}
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="Services"
                                        data-val-required="Please select Services" id="ddlServices" name="ddlServices" runat="server">
                                        <option>-Select Services-</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDistrict">
                                        {{resourcesData.department}}
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="Department"
                                        data-val-required="Please select Department." id="ddlDepartment" name="ddlDepartment" runat="server">
                                        <option value="0">-Select Department-</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDistrict">
                                        {{resourcesData.lblAppDistrict}}
                                    </label>
                                    <select class="form-control" data-val="true" data-val-number="District." onchange="GetAppletAuthority();"
                                        data-val-required="Please select District." id="ddlDistrict" name="ddlDistrict" runat="server">
                                        <option value="0">-Select District-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        
                    </div>
                    
                    <div class="col-md-12 box-container" id="divGridAppeal">
                        <div class="box-heading">
                            <h4 class="box-title">Service Delivery Detail
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <asp:GridView ID="grdViewAppeal" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0;" ClientIDMode="Static">
                                </asp:GridView>
                            </div>

                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    



                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Complaint Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                <div class="form-group">
                                    <label for="ddlOffice">
                                        Concerned office</label>
                                    <select class="form-control" data-val="true" data-val-number="ComplaintType"
                                        data-val-required="Please Select Pension Type" id="ddlOffice" name="ddlOffice">
                                        <option value="0">-Select Concerned office-</option>
                                        <option value="101">BDO, KHURDA</option>
                                        <option value="102">Sub-Collector Office</option>
                                        <option value="103">Collector Office</option>
                                        <option value="104">CMO Office</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlCategory">
                                        Type of complaint</label>
                                    <select class="form-control" data-val="true" data-val-number="ComplaintType"
                                        data-val-required="Please Select Pension Type" id="ddlCategory" name="ddlCategory">
                                        <option value="0">-Select Complaint Type-</option>
                                        <option value="101">Service Denied</option>
                                        <option value="102">Acknowledgement Not Given</option>
                                        <option value="103">Service Not delivered within time</option>
                                        <%--<option value="104">Information regarding Service not given</option>
                                        <option value="105">Concerned Designated Officer Not Available</option>
                                        <option value="106">Burglary</option>--%>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="txtofficer">
                                        Concerned officer name</label>
                                    <input id="txtofficer" class="form-control" name="txtofficer" type="text" value="" placeholder="Concerned officer name" onkeypress="return ValidateAlpha(event);" maxlength="30"
                                        autofocus />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="txtDate">
                                        Submitted Application Date</label>
                                    <input id="txtDate" class="form-control" placeholder="dd/MM/yyyy" name="txtDate" type="text" value=""
                                        autofocus />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="RefID">
                                        Reference ID of submitted Application</label>
                                    <input id="RefID" class="form-control" name="RefID" type="text" value="" maxlength="25" placeholder="Reference ID of submitted Application"
                                      onkeypress="return AlphaNumeric(event);"  autofocus />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="txtDescription">
                                        Complaint description</label>
                                    <input id="txtDescription" class="form-control" placeholder="Description" name="txtDate" type="text" value=""
                                       maxlength="150"  autofocus />
                                </div>
                            </div>


                            <div class="clearfix">
                            </div>
                        </div>
                    </div>



                    </div>
                    <%---Start of Button----%>
                    <div class="" id="divBtn" runat="server">
                        <div class="col-md-12 box-container">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnSubmit" class="btn btn-success" value="Submit"  onclick="SubmitData(); "/>
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

                <asp:HiddenField ID="hdfSuspect" runat="server" />
                <asp:HiddenField ID="hdfSuspectSave" runat="server" />
                <asp:HiddenField ID="hdfSuspectString" runat="server" />
                <asp:HiddenField ID="HFServiceID" Value="399" runat="server" />
            </div>
        </div>
    
</asp:Content>
