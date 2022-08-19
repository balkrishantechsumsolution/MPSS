<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="BasicDetail.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.BasicDetail" %>

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
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="../../Scripts/BasicDetail.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>    
    <script src="/WebApp/Kiosk/Forms/AadhaarBasicDetail.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script type="text/javascript">
        
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
                <div style="display: none">
                    {{ServiceNameData.lblSvcName}}
                </div>
                <uc1:FormTitle runat="server" ID="FormTitle" />
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
                                    onchange="return checkLength(this);"  onkeypress="return AlphaNumeric(event);"    autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="AddressLine2">
                                        {{resourcesData.lblAppBuilding}}
                                    </label>
                                    <input id="AddressLine2" class="form-control" placeholder="Second Line Address" name="Address Line-2 (Building)" type="text" value="" maxlength="20"
                                      onchange="return checkLength(this);"  onkeypress="return AlphaNumeric(event);" autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="RoadStreetName">
                                        {{resourcesData.lblAppStreet}}
                                    </label>
                                    <input id="RoadStreetName" class="form-control" placeholder="Road / Street Name" name="Road / Street Name" type="text" value="" maxlength="20" onchange="return checkLength(this);"  onkeypress="return AlphaNumeric(event);"
                                        autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="LandMark">
                                        {{resourcesData.lblAppLandmark}}
                                    </label>
                                    <input id="LandMark" class="form-control" placeholder="Landmark" name="Landmark" type="text" value="" maxlength="20"
                                     onchange="return checkLength(this);"  onkeypress="return AlphaNumeric(event);"   autofocus runat="server" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="Locality">
                                        {{resourcesData.lblAppLocality}}
                                    </label>
                                    <input id="Locality" class="form-control" placeholder="Locality" name="Locality" type="text" value="" maxlength="20"
                                      onchange="return checkLength(this);"  onkeypress="return AlphaNumeric(event);"  autofocus runat="server" />
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
                            <h4 class="box-title">Present Address<span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right;">
                                <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" onclick="javascript: fnCopyAddress(this.checked);" />Same as Permanent Address</span><span class="clearfix">
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
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />
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
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <asp:HiddenField ID="HFUIDData" runat="server" />
    <asp:HiddenField ID="HFResponseType" runat="server" />
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" />

</asp:Content>
