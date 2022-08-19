<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="MotorVehicleRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.VehicleRegistration.MotorVehicleRegistration" %>

<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../../Scripts/angular.min.js"></script>
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <%---Start of FormTitle----%>
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <%----END of FormTitle-----%>
                <div class="row">
                    <%---Start of Basic Details----%>

                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading" id="Div4">
                            <h4 class="box-title register-num">{{resourcesData.lblApplicantDetails}}
                            </h4>
                        </div>
                        <uc1:PersonalDetail runat="server" ID="PersonalDetail" />
                    </div>
                    <%---End of Basic Details----%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
