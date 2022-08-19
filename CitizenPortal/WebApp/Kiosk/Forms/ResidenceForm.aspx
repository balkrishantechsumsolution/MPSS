<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="ResidenceForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.ResidenceForm" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Control/Instructions.ascx" TagPrefix="uc1" TagName="Instructions" %>
<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>
<%@ Register Src="~/WebApp/Control/Photograph.ascx" TagPrefix="uc1" TagName="Photograph" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>
<%@ Register Src="~/WebApp/Control/Attachment.ascx" TagPrefix="uc1" TagName="Attachment" %>
<%@ Register Src="~/WebApp/Control/SubmitterDetail.ascx" TagPrefix="uc1" TagName="SubmitterDetail" %>
<%@ Register Src="~/WebApp/Control/LandRecord.ascx" TagPrefix="uc1" TagName="LandRecord" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/AadhaarDetail.ascx" TagPrefix="uc1" TagName="AadhaarDetail" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../../Scripts/angular.min.js"></script>
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <style type="text/css">
        .rbt-grp {
            padding-left: 0;
        }
        /*.form-heading {            
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;            
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;  
            border-top-right-radius:2px;
            border-top-left-radius:2px;
            text-transform:uppercase;
            font-weight:bold;
            
        }*/
    </style>
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
                <uc1:FormTitle runat="server" id="FormTitle" />
                <%----END of FormTitle-----%>

                <%----Start of Aadhar-----%>
                <div class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">{{resourcesData.aadhaar}}
                            </h4>
                        </div>
                        <uc1:aadhaardetail runat="server" ID="AadharDetail" />
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
                            <h4 class="box-title register-num">Permanent Address
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
                <%----End of Submitter's Detail-----%>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Submitter's Detail
                            </h4>
                        </div>
                        <uc1:SubmitterDetail runat="server" ID="SubmitterDetail" />
                    </div>
                </div>

                <%---Start of Submitter's Detail----%>
                <%---Start of Present Adress----%>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Present Address
                            </h4>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="box-body box-body-open">
                                <div class="form-group">
                                    <label class="manadatory col-lg-6 rbt-grp" for="ddlYearTerm">
                                        Is Present Address same as Permanent Address?
                                    </label>
                                    <label class="col-lg-3" for="rbtYes">
                                        <asp:RadioButton ID="rbtYes" runat="server" />
                                        Yes
                                    </label>
                                    <label class="col-lg-3" for="rbtNo">
                                        <asp:RadioButton ID="rbtNo" runat="server" />No
                                    </label>
                                </div>
                            </div>
                        </div>
                        <uc1:Address runat="server" ID="Address1" />
                    </div>
                </div>
                <%----End of Identifier-----%>

                <%---Start of Record Details----%>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Land Record Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory col-lg-3 rbt-grp" for="ddlYearTerm">
                                        Is ROR Produced?
                                    </label>
                                    <label class="col-lg-1" for="rbtYes">
                                        <asp:RadioButton ID="RadioButton1" runat="server" />
                                        Yes
                                    </label>
                                    <label class="col-lg-1" for="rbtNo">
                                        <asp:RadioButton ID="RadioButton2" runat="server" />No
                                    </label>
                                    <label class="col-lg-7 " for="ddlYearTerm">
                                        (If yes please provide the Land Record Details)
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <div class="row">
                                    <uc1:LandRecord runat="server" ID="LandRecord" />
                                        </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>

                        </div>
                    </div>
                </div>
                <%----End of Record Details-----%>
                <%---Start of Reason----%>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Reason for Residence 
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group col-lg-2 rbt-grp">
                                    <asp:Label ID="Label2" runat="server" Text="Reason for residence certificate" CssClass="manadatory "></asp:Label>
                                </div>
                                <div class="form-group col-lg-10">
                                    <input class="form-control" placeholder="Reson" name="Reson" type="text" value="" aria-multiline="true"
                                        autofocus />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%----End of Reason-----%>
                <%---Start of Other Details----%>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Other Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        Year(s) of residing in the above address
                                    </label>
                                    <input id="txtYear" class="form-control" placeholder="Year" name="Year" type="text" value="" maxlength="2"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        Registered Sales Deed No.
                                    </label>
                                    <input id="txtDeedNo" class="form-control" placeholder="Deed No" name="Deed No" type="text" value="" maxlength="2"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        Registered Sales Deed Date
                                    </label>
                                    <input id="txtDeedDate" class="form-control" placeholder="Deed Date" name="Deed Date" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory col-lg-5 rbt-grp" for="Village">
                                        Applicant able to read, write & speak in Oriya.
                                    </label>
                                    <label class="col-lg-2" for="rbtYes">
                                        <asp:CheckBox ID="RadioButton3" runat="server" />
                                        Read
                                    </label>
                                    <label class="col-lg-2" for="rbtNo">
                                        <asp:CheckBox ID="RadioButton4" runat="server" />Write
                                    </label>
                                    <label class="col-lg-2" for="rbtNo">
                                        <asp:CheckBox ID="CheckBox1" runat="server" />Speak
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory col-lg-5 rbt-grp" for="Village">
                                        Applicant passed from Oriya up to M.E. Standard
                                    </label>
                                    <label class="col-lg-2" for="rbtYes">
                                        <asp:RadioButton ID="CheckBox2" runat="server" />
                                        Yes
                                    </label>
                                    <label class="col-lg-2" for="rbtNo">
                                        <asp:RadioButton ID="CheckBox3" runat="server" />No
                                    </label>
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
                        <div class="box-body box-body-open">
                            <div class="col-sm-6 col-md-6 col-lg-12">
                                <div class="text-danger text-danger-green">
                                    <p class="text-justify">
                                        <input type="checkbox" runat="server" id="disclaimercheck" onclick="javascript: declaration(this.checked, '1');" />
                                        I &nbsp;
                                            <span id="spndecl" style="text-decoration: underline; text-transform: capitalize; font-weight: bold;"></span>&nbsp; 
    son /daughter /wife / of <span id="txtCareOf" style="text-decoration: underline; text-transform: capitalize; font-weight: bold;"></span>&nbsp; resident of village <span id="txtVillage" style="text-decoration: underline; text-transform: capitalize; font-weight: bold;"></span>&nbsp;Police Station <span id="txtPS" style="text-decoration: underline; text-transform: capitalize; font-weight: bold;"></span>&nbsp;District <span id="lblDist" style="text-decoration: underline; text-transform: capitalize; font-weight: bold;"></span>&nbsp; and particulars stated above are true to best of my knowledge and belief and that they are exhaustive and I've not suppressed any fact. In case it is detected later on that nay of facts stated herein wrong or that I've suppressed some material facts, I shall be liable for prosecution under the relevent law.
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
        </div>
    </div>
</asp:Content>
