<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" 
    CodeBehind="GeneralAffidavit.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.GeneralAffidavit" ClientIDMode="Static" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Control/Instructions.ascx" TagPrefix="uc1" TagName="Instructions" %>
<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>
<%@ Register Src="~/WebApp/Control/Photograph.ascx" TagPrefix="uc1" TagName="Photograph" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>
<%@ Register Src="~/WebApp/Control/Attachment.ascx" TagPrefix="uc1" TagName="Attachment" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../../Scripts/angular.min.js"></script>
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div ng-app="appmodule">
        <div ng-controller="ctrl">
    <div id="page-wrapper" style="min-height: 500px !important;">

        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <%---Start of Title----%>
        <uc1:FormTitle runat="server" ID="FormTitle" />
        <%----END of Title-----%>
        <%----Start of Aadhar-----%>
        <div class="row">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Search Applicant Details
                    </h4>
                </div>
                <uc1:SearchRecord runat="server" id="SearchRecord" />
            </div>
        </div>
        <%-----End of Aadhar------%>
        <div class="row">
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
        <%---End of PhotoNDetal----%>
        <%---Start of PostalAddress----%>
        <div class="row">
            <div class="col-md-8 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">{{resourcesData.lblResidentialAddress}}
                    </h4>
                </div>
                <uc1:Address runat="server" ID="Address" />
            </div>
            <div class="col-md-4 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">{{resourcesData.lblResidentialAddress}}
                    </h4>
                </div>
                <uc1:Attachment runat="server" ID="Attachment" />
            </div>
        </div>
        <%----End of PostalAddress-----%>
        <%---Start of Affidavit----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">{{resourcesData.lblAffidavitDetails}}
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <asp:Label ID="Sal_identi" CssClass="manadatory" runat="server" Text="{{resourcesData.lblAppSal}}"></asp:Label>
                            <asp:DropDownList ID="ddlsal" runat="server" TabIndex="27" CssClass="form-control"
                                DataTextField="EnumerationValue" DataValueField="EnumerationValueID">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                        <div class="form-group">
                            <asp:Label ID="lblname" CssClass="manadatory" runat="server" Text="{{resourcesData.lblNameOfIdentifier}}"></asp:Label>
                            <input class="form-control" placeholder="First Name" name="First Name" type="text" value=""
                                autofocus />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="{{resourcesData.lblAffidavitName}}"></asp:Label>
                            <input class="form-control" placeholder="First Name" name="First Name" type="text" value=""
                                autofocus />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----End of Affidavit-----%>

        <%---Start of Identifier----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">{{resourcesData.lblIdentifierResidenceDetails}}
                    </h4>
                </div>
                <uc1:Address runat="server" ID="Address1" />
            </div>
        </div>
        <%----End of Identifier-----%>

        <%---Start of Reason----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Reason for Affidavit
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group col-lg-2">
                            <asp:Label ID="Label2" runat="server" Text="{{resourcesData.lblReason}}" CssClass="manadatory "></asp:Label>
                        </div>
                        <div class="form-group col-lg-10">
                            <input class="form-control" placeholder="First Name" name="First Name" type="text" value="" aria-multiline="true"
                                autofocus />
                        </div>
                    </div>
                    <div class="clearfix">
                        </div>
                </div>
            </div>
        </div>
        <%----End of Reason-----%>

        <%---Start of Declaration----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Declaration
                    </h4>
                </div>
                <uc1:Declaration runat="server" ID="Declaration" />
            </div>
        </div>
        <%----End of Declaration-----%>
        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <%--<asp:Button ID="btnConfirm" runat="server" Text="Submit" class="btn btn-success"
                        OnClientClick="return checkDeclaration();" />--%>
                    <input type="button" id="btnSave" class="btn btn-success" value="Save" onclick="checkDeclaration();" />
                    <input type="button" id="btnPrint" class="btn btn-primary" value="Print" />
                    <input type="button" id="btnConfirm" class="btn btn-info" value="Submit" onclick="checkDeclaration();" />
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
</div></div>
</asp:Content>
