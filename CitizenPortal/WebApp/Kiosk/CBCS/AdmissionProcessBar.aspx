﻿<%@ Page Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="AdmissionProcessBar.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CBCS.AdmissionProcessBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="../../Scripts/CommonScript.js"></script>
    <link href="../../../g2c/css/formSteps.css" rel="stylesheet" />
    <style>
        .mtop10 {
            margin-top: 10px !important;
        }

        .mbtm20 {
            margin-bottom: 20px !important;
        }

        .wizard_inston {
            width: 95%;
            margin: 0 auto;
            padding: 0;
        }

            .wizard_inston p {
                text-align: left;
                line-height: 30.5px;
                font-family: Arial;
                color: #000 !important;
            }

                .wizard_inston p a {
                    color: #337ab7;
                    font-size: 15px;
                }

        p {
            color: #000 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div id="page-wrapper">
                <div class="row">
                    <div id="divPrint" class="container mtop10 hldshdw" style="padding-right: 0; padding-left: 0; width: 99%;">

                       
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                                    +3 Examination Enrollment Process - 2019
                                </h2>
                            </div>
                        
                        

                        <div class="row bs-wizard" style="border-bottom: 0;">

                            <div class="col-xs-3 bs-wizard-step complete">
                                <div class="text-center bs-wizard-stepnum">Step 1</div>
                                <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>
                                <a href="#" class="bs-wizard-dot"></a>
                                <div class="bs-wizard-info text-center">Application Saved</div>
                            </div>

                            <div class="col-xs-3 bs-wizard-step disabled" style="display:none">
                                <!-- complete -->
                                <div class="text-center bs-wizard-stepnum">Step 2</div>
                                <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>
                                <a href="#" class="bs-wizard-dot"></a>
                                <div class="bs-wizard-info text-center">Attach Documents</div>
                            </div>

                            <div class="col-xs-3 bs-wizard-step disabled">
                                <!-- complete -->
                                <div class="text-center bs-wizard-stepnum">Step 2</div>
                                <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>
                                <a href="#" class="bs-wizard-dot"></a>
                                <div class="bs-wizard-info text-center">Make Payment</div>
                            </div>

                            <div class="col-xs-3 bs-wizard-step disabled">
                                <!-- active -->
                                <div class="text-center bs-wizard-stepnum">Step 3</div>
                                <div class="progress">
                                    <div class="progress-bar"></div>
                                </div>
                                <a href="#" class="bs-wizard-dot"></a>
                                <div class="bs-wizard-info text-center">Check Application Status</div>
                            </div>
                        </div>
                        <div>
                            <div class="wizard_inston text-left">
                                <p>
                                    1. Your Application is saved.<br />
                                    &nbsp;&nbsp;&nbsp;
                        The Application Number  
                                     <b>
                                         <asp:Label ID="lblAppID" runat="server" Font-Bold="True" Font-Size="20px"></asp:Label></b>,
                        please note down the no for future use.
                        <br />
                                    <%--2. Upload all necessary Documents as per The Application Form.--%>
                        <br />
                                    2. Make payment against the Application Number
                        <asp:Label ID="lblAppID1" runat="server" Font-Bold="True" Font-Size="20px"></asp:Label>.<br />
                                    &nbsp;&nbsp;&nbsp; 
                        Payment can be done through Online (Payment Gateway).<br />
                                    3. Check your Application status after login through your Login ID (detailed SMS and email)
                                </p>
                            </div>
                            <p style="color: maroon !important; width: 90%; margin: 0 auto; font-family: Arial; text-align: center; font-size: 20px;">
                                <b style="font-size: 20px;">Please Note: </b>Your Application is <b style="font-size: 20px;">NOT VALID</b>
                                unless the payment is done
                        <br />
                                <b style="font-size: 25px; color: maroon !important;">http://sambalpur.lokaseba-odisha.in/ </b>
                            </p>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row mtop10 mbtm20">
                            <div class="form-group mtop10">
                                <div class="col-md-4">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="divBtn" class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;margin-bottom:100px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                    Text="Proceed" OnClick="btnSubmit_Click" />
                                <input type="button" id="print" class="btn btn-primary" value="Print" onclick="javascript: CallPrint('divPrint');" />
                                <%--<input type="submit" value="Home" id="Button1" class="btn btn-danger" onclick="javascript: return ReturnURL();" />--%>
                                <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-danger" OnClick="btnHome_Click" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>

</asp:Content>

