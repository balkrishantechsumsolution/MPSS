<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="RegisterMobile.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.RegisterMobile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-1.9.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>

    <script src="../../Scripts/jquery.fileupload.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="../../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <link href="../../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--<script src="../../../Scripts/angular.min.js"></script>--%>
    <%--<script src="../Script/CitizenProfile.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="../Script/RegisterMobile.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=Guid.NewGuid()%>"></script>--%>

    <script src="/WebApp/Citizen/Script/CitizenProfile.js"></script>
    <script src="/WebApp/Citizen/Script/RegisterMobile.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="/WebApp/Citizen/Script/RegisterMobile.js"></script>
    <script type="text/javascript">

    </script>
    <style type="text/css">
        .fldupload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            font-size: 200px !important;
            direction: ltr;
            cursor: pointer;
        }

        .fldupload {
            width: 100px;
            height: 30px;
        }

        .pagination {
            border: 0;
            margin: 0;
        }

            .pagination > li > a, .pagination > li > span {
                padding: 2px 5px;
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
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <div>
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Register your Mobile/Verify Mobile
                    </h2>
                </div>
                <%----Start of SearhBasicDetails-----%>

                <div class="row" id="divSearch" runat="server">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Registered Mobile Number
                            </h4>
                        </div>

                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                
                                <div class="text-danger text-danger-green mt0 mb10" id="divMsg">
                                    <b>
                                        <p class="text-justify" id="divMsgTitle">
                                        </p>
                                    </b>
                                    <p class="text-justify" id="divMsgDtls">
                                    </p>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="lblMobileNo">
                                                Applicant Mobile No.</label>
                                            <input class="form-control" id="txtMobile" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" value="" maxlength="10" title="Please enter valid Mobile No" onkeypress="return isNumberKey(event);" 
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="" for="Village">
                                                &nbsp;
                                            </label>
                                            <input type="button" id="btnOTP" class="btn btn-primary" value="Validate Mobile No." onclick="ValidateMobile();" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="divOTP">
                                        <div class="form-group">
                                            <label class="manadatory" for="CompanyName">
                                                Mobile No. OTP Verification</label>
                                            <input class="form-control" id="txtSMSCode" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);" 
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" id="divbtnOTP">
                                        <div class="form-group">
                                            <label class="" for="">
                                                &nbsp;
                                            </label>
                                            <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Verify OTP Code" onclick="AuthenticateMobile();" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%-----End of SearhBasicDetails------%>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFServiceID" runat="server" />
</asp:Content>
