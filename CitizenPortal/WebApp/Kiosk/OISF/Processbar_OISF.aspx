<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Processbar_OISF.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.Processbar_OISF" %>

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
        width:95%;margin:0 auto;padding: 0;
        }
        .wizard_inston p {
        text-align:left;line-height:30.5px;font-family:Arial;color:#000 !important;
        }
            .wizard_inston p a {
                color: #337ab7;font-size:15px;
            }
        p {
        color:#000 !important;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="container mtop10 hldshdw" style="padding-right: 0; padding-left: 0; width:99%;">
                
                <div class="col-lg-12 wizard_hd">
                    Application Form For Admission into Undergraduate Course 2016-17 
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

                    <div class="col-xs-3 bs-wizard-step disabled">
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
                        <div class="text-center bs-wizard-stepnum">Step 3</div>
                        <div class="progress">
                            <div class="progress-bar"></div>
                        </div>
                        <a href="#" class="bs-wizard-dot"></a>
                        <div class="bs-wizard-info text-center">Make Payment</div>
                    </div>

                    <div class="col-xs-3 bs-wizard-step disabled">
                        <!-- active -->
                        <div class="text-center bs-wizard-stepnum">Step 4</div>
                        <div class="progress">
                            <div class="progress-bar"></div>
                        </div>
                        <a href="#" class="bs-wizard-dot"></a>
                        <div class="bs-wizard-info text-center">Update Payment Details</div>
                    </div>
                </div>
<div id="divPrint">
                <div class="wizard_inston text-left">
                    
                    <p>
                        1. Your Application is saved.<br />
                        &nbsp;&nbsp;&nbsp;
                        The Reference Number  
                                     <b>   <asp:Label ID="lblAppID" runat="server" Font-Bold="True" Font-Size="20px"></asp:Label></b>,
                        please notedown the no for future use.
                        <br />
                        2. Please upload the supporting document.<br />
                        3. Make payment against the Reference Number.
                        <asp:Label ID="lblAppID1" runat="server" Font-Bold="True" Font-Size="20px"></asp:Label><br /> 
                        &nbsp;&nbsp;&nbsp; 
                        Payment can be done through SB-Collect (<a href="https://www.onlinesbi.com/prelogin/icollecthome.htm?corpID=792927" target="_blank">SBI link</a>) or at any CSC centers (<a href="/g2c/forms/CenterList.aspx" target="_blank">CSC centers in Odisha</a>)<br />
                        4. After payment, do not forget to Update the Payment Details after login through your Login ID (details SMS and emailed)
                        
                    </p>
                    
                </div>
    <p style="color: maroon !important; width: 90%; margin: 0 auto; font-family: Arial; text-align: center; font-size: 20px;">
        <b style="font-size: 20px;">Please Note: </b>Your Application is <b style="font-size: 20px;">NOT VALID</b>
        unless the payment detail is uploaded to CAP Portal - <b style="font-size: 25px;color: maroon !important;">www.lokaseba-odisha.in </b>

    </p>
                </div>
                <div class="row mtop10 mbtm20">
                    <div class="form-group mtop10">
                        <label class="col-md-5 control-label" for="singlebutton"></label>
                        <div class="col-md-4">
                            <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                 Text="Proceed" OnClick="btnSubmit_Click"  />
                            <input type="button" id="print" class="btn btn-primary" value="Print" onclick="javascript: CallPrint('divPrint');" />
                            <input type="submit" name="" value="Cancel" id="Button1" class="btn btn-danger" />
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>

            </div>
        </div>
    </div>
</asp:Content>
