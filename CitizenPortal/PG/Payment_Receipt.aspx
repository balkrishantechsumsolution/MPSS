<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="Payment_Receipt.aspx.cs" Inherits="CitizenPortal.PG.Payment_Receipt" %>

<%@ Import Namespace="CitizenPortal.Models" %>






<script runat="server">

//protected void Page_PreInit(Object sender, EventArgs e)
//{
//    long svc = 0;


//    if (Request.QueryString["SvcID"] == null || Request.QueryString["SvcID"] == "")
//    {

//        svc = 0;


//        this.MasterPageFile = "../WebApp/Kiosk/Master/Empty.Master";

//    }
//    else
//    {
//        string m_ServiceID = KeyClass.Decrypt(HttpUtility.UrlDecode(Request.QueryString["SvcID"]));
//        svc = Int64.Parse(m_ServiceID);



//        if (svc < 391 && svc != 0)//This is for all Odisa Servcie ID
//        {
//            this.MasterPageFile = "~/g2c/master/Home.Master";
//        }
//        else if (svc == 850) //this is for Vendor Service ID
//        {
//            this.MasterPageFile = "../WebApp/Kiosk/Master/Vendor.Master";
//        }
//        else if (svc == 851)//this is for Epay service ID
//        {
//            this.MasterPageFile = "../WebApp/Kiosk/Master/EPAY.Master";
//        }
//        else if (svc == 852)//For  PayBill Service ID
//        {
//            this.MasterPageFile = "../WebApp/Kiosk/Master/PayBill.Master";
//        }
//        else if (svc == 0) //somethimg is wrong, any request parameter is invalid
//        {
//            this.MasterPageFile = "../WebApp/Kiosk/Master/Empty.Master";
//        }
//        else
//        {
//              this.MasterPageFile = "../WebApp/Kiosk/Master/Empty.Master";

//        }
//    }
//}


//protected void Page_Load(object sender, EventArgs e)
//{
//    if (this.MasterPageFile == "../Master/Empty.Master")
//    {
//        divsms.Visible = true;
//        lblsms.Text = "Invalid Request Parameter!!!";//receive null then
//        table_div.Visible = false;
//        return;
//    }
//}


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #cphbody_lblsms {
            font-size: 15px;
            color: white;
            padding: 5px;
            background-color: red;
        }
    </style>
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
            font-size: x-large;
        }

        .divError {
            font-family: Arial;
            font-size: 20px;
            text-align: center;
            margin: 10px auto;
        }

            .divError img {
                float: left;
                width: 50px;
                margin: 0 20px 0 10px;
            }

            .divError div {
                float: left;
                color: red;
                font-size: .8em;
            }

            .divError h1 {
                float: left;
                margin: 0;
                padding: 0;
                font-size: .9em;
                color: maroon;
            }

        .info, .success, .warning, .error, .validation {
            /*border: 1px solid;*/
            margin: 10px 0px;
            padding: 15px 10px 15px 15px;
            background-repeat: no-repeat;
            background-position: 10px left;
            text-align: left;
            font: 13px Tahoma,sans-serif;
        }

        .success {
            color: #4F8A10;
            background-color: #DFF2BF;
        }

        .error {
            color: #D8000C;
            background-color: #FFBABA;
        }
    </style>
    <script type="text/javascript">
        function CallPrint(strid) {
            debugger;
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,border=1px,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row content">
        <div id="table_div" runat="server" class="container  mtop15 mbtm15">

            <div class="col-lg-8 col-md-push-2 pleft0 pright0 pbottom15">

                <div runat="server" class="w98">
                    <table class="table pymnt_rcptbox">
                        <thead>
                            <tr>
                                <th class="pymntbox_hd">Payment Receipt</th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row" id="divCitizenProfile">
                                        <div id="" class="col-md-12">
                                            <div runat="server" class="success" id="div1" style="line-height: 11px;">
                                                <b style="text-transform: uppercase;">After successful payment, please login to view your Acknowledgement Receipt. </b>
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="pymntbox_bdr3" style="border-bottom: 3px solid #ddd;">
                                    <div id="divPrint">
                                        <table style="width: 100%; border: 1px solid #ddd;">
                                            <thead>
                                                <tr>
                                                    <th colspan="4" style="background-color: #666666 !important; color: #fff; font-family: 'proximanovaalt'; font-size: 16px; text-align: left; font-weight: normal; padding: 16px;">Applicant Details</th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 162px; border-bottom: none; background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D; background-color: #F5F5F5; color: #6D6D6D; padding: 16px; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">Reference ID</th>
                                                    <th style="border-bottom: none; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">
                                                        <label id="lblRefernceNo" runat="server"></label>
                                                    </th>
                                                    <th style="width: 162px; border-bottom: none; background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D; padding: 16px; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">Service Name</th>
                                                    <th style="border-bottom: none; border-top: 1px solid #ddd;">
                                                        <label id="lblServiceName" runat="server"></label>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row" style="background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D; padding: 16px; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">Payment Date</th>
                                                    <td style="border-top: 1px solid #ddd; border-right: 1px solid #ddd;">
                                                        <label id="lblpaymentdate" runat="server"></label>
                                                    </td>
                                                    <td style="border-top: 1px solid #ddd; border-right: 1px solid #ddd;"></td>
                                                    <td style="border-top: 1px solid #ddd;"></td>
                                                    <td style="display: none; border-top: 1px solid #ddd; font-family: 'proximanovaaltbold';">Applicant Name</td>
                                                    <td style="display: none; border-top: 1px solid #ddd;">
                                                        <label id="lblUserName" runat="server"></label>
                                                    </td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <th scope="row" class="pymnt_rcptsubhd rcptsubhd_bdrrght rcptsubhd_bdrlft" style="background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D;">Applicant Email ID</th>
                                                    <td>
                                                        <label id="lblEmailid" runat="server"></label>
                                                    </td>
                                                    <td class="pymnt_rcptsubhd rcptsubhd_bdrrght rcptsubhd_bdrlft" style="background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D;">Applicant Mobile No.</td>
                                                    <td>
                                                        <label id="lblMobile" runat="server"></label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />
                                        <table class="table pymnt_rcptbox" style="width: 100%; border: 1px solid #ddd;">
                                            <thead>
                                                <tr>
                                                    <th colspan="4" style="background-color: #666666 !important; color: #fff; font-family: 'proximanovaalt'; font-size: 16px; text-align: left; font-weight: normal; padding: 16px;">Transaction Details</th>
                                                </tr>
                                                <tr>
                                                    <th  style="width: 162px; border-bottom: none; background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D; background-color: #F5F5F5; color: #6D6D6D; padding: 16px; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">Transaction Referenc ID</th>
                                                    <th style=" border-top: 1px solid #ddd; border-right: 1px solid #ddd">
                                                        <label id="lblBankRefNo" runat="server"></label>
                                                    </th>
                                                    <th style="width: 162px; border-bottom: none; background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D; background-color: #F5F5F5; color: #6D6D6D; padding: 16px; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">Transaction Amount (Rs.)</th>
                                                    <th style="border-bottom: none; border-top: 1px solid #ddd;">
                                                        <label id="lblAmt" runat="server"></label>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row" style="width: 162px; border-bottom: none; background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D; background-color: #F5F5F5; color: #6D6D6D; padding: 16px; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">Payment Mode</th>
                                                    <td style="border-top: 1px solid #ddd; border-right: 1px solid #ddd">
                                                        <label id="lblPaymentMode" runat="server"></label>
                                                    </td>
                                                    <td style="width: 162px; border-bottom: none; background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D; background-color: #F5F5F5; color: #6D6D6D; padding: 16px; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">Transaction Status</td>
                                                    <td style="border-top: 1px solid #ddd;">
                                                        <label id="lblResponestatus" runat="server"></label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" style="width: 162px; border-bottom: none; background-color: #F5F5F5; font-family: 'proximanovaaltbold'; color: #6D6D6D; background-color: #F5F5F5; color: #6D6D6D; padding: 16px; border-top: 1px solid #ddd; border-right: 1px solid #ddd;">Payment Gateway</th>
                                                    <td style="border-top: 1px solid #ddd; border-right: 1px solid #ddd">
                                                        <label id="lblPaymentGateway" runat="server"></label>
                                                    </td>
                                                    <td colspan="2" style="border-top: 1px solid #ddd;">&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-12 mtop15">

            <div class="box-body box-body-open" style="text-align: center;">
                <input type="button" id="btnPrint" class="btn btn-info" style="background-color: #0040FF !important;" value="PRINT" onclick="javascript: CallPrint('divPrint');" />

                <asp:Button ID="btnSubmit" class="btn btn-proceed" runat="server" Text="PROCEED" OnClick="btnSubmit_Click" />
                <%--<asp:Button ID="proceedBooking" class="printBtn" runat="server" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');"  />--%>

                <%--<input type="button" id="proceedBooking" class="printBtn" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />--%>

                <%-- <input type="button" name="cancel payment" value="CANCEL" id="btnCancel" runat="server" class="btn btn-cancel"/>--%>
            </div>
            <div class="clearfix">
                <div class="mtop20"></div>
            </div>
        </div>
        <div style="text-align: center; padding-bottom: 20px;" class="col-lg-12 mtop15" id="divsms" runat="server" visible="false">

            <asp:Label ID="lblsms" runat="server"></asp:Label>

        </div>
    </div>

</asp:Content>
