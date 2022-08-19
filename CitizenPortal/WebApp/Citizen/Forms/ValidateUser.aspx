<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="ValidateUser.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.ValidateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <link href="../../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
   
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="../Script/ValidateUser.js?v=<%=Guid.NewGuid()%>"></script>
    <script type="text/javascript">

    </script>
    <style type="text/css">.form-heading {
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <div>
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Register your Mobile / Verify Mobile
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
                                <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10 mb10" id="divCredential">
                                    <span style="font-weight: bold; margin-bottom: 5px">Instruction:</span><br />
                                    <span>Please enter applicant mobile number, OTP will be SMS to Your mobile number.
                                        <br />  
                                        This number can be used as Login ID and for further communication.</span>
                                        
                                </div>
                                <div class="alert alert-success" id="divMsg">
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
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="" for="Village">
                                                &nbsp;
                                            </label>
                                            <input type="button" id="btnOTP" class="btn btn-primary" value="Verify Mobile No." onclick="fnGenOTP();" />                                            
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divOTP">
                                        <div class="form-group">
                                            <label class="manadatory" for="CompanyName">
                                                OTP Verification Code</label>
                                            <input class="form-control" id="txtSMSCode" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" value="" maxlength="6" onkeypress="return isNumberKey(event);"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" id="divbtnOTP">
                                        <div class="form-group">
                                            <label class="" for="">
                                                &nbsp;
                                            </label>
                                            <input type="button" id="btnValidateOTP" class="btn btn-danger" value="Verify OTP Code" onclick="fnValidateOTP();" />
                                        </div>
                                    </div>
                                    <div id="divNonAadhar" runat="server" class="form-group col-lg-3 text-right" style="white-space:nowrap;margin-top: 10px;">
                                         <label class="" for="">
                                                &nbsp;
                                            </label>
                                        <a href="#" onclick="fnSkipValidation();" title="Skip Mobile Validation (Profile will not be created)">Skip Mobile Validation</a>
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
