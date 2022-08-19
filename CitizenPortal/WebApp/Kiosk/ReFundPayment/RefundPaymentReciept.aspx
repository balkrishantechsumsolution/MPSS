<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" CodeBehind="RefundPaymentReciept.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.ReFundPayment.RefundPaymentReciept" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/CommonScript.js"></script>

    <style>
        .form-group label {
            display: inline;
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <%--<uc1:Infomation runat="server" ID="Infomation" />--%><%---Start of Application----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Receipt
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12" style="text-align: center;">
                        <div id="divPrint" style="">
                            <table cellpadding="5" cellspacing="0" class="table table-bordered table-striped" style="font-family: Arial; font-size: 12px; width: 750px; border: 0; margin: auto;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <table style="width: 100%; text-align: center;">
                                            <tr style="text-align: center;">
                                                <td style="width: 33%; text-align: left;">
                                                    <img src="../Images/logo_orissa.gif" style="width: 100px" /></td>
                                                <td style="width: 34%; text-align: center;">
                                                    <img src="../Images/logo.png" style="width: 100px" /></td>
                                                <td style="width: 33%; text-align: right;">
                                                    <%--<img src="../Images/QRCode.png" style="width: 100px" />--%>
                                                    <uc1:QRCode runat="server" ID="QRCode1" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"></td>
                                </tr>
                                <tr>
                                    <th style="padding: 5px;  text-align: center;" colspan="4">
                                        <strong>RECEIPT</strong></th>
                                </tr>
                                <tr>
                                    <td style="padding: 5px;  text-align: left;" colspan="4"></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; text-align: left;" colspan="4">
                                        <strong>Application Detail</strong></td>
                                </tr>
                                 <tr>
                                    <td style="padding: 5px;  text-align: left;">
                                        <label runat="server" id="Label2">RefundID</label>
                                    </td>
                                    <td style="padding: 5px;  text-align: left;">
                                        <asp:Label ID="lblRefundID" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                    <td style="padding: 5px;  text-align: left;">
                                        <label runat="server" id="Label4">Application date</label>
                                    </td>
                                    <td style="padding: 5px;  text-align: left;">
                                        <asp:Label ID="lblApplicationdate" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; text-align: left;">
                                        <label runat="server" id="appemail">Sevice Name</label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <asp:Label ID="lblservicename" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <label runat="server" id="Label1">Applicant Name</label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <asp:Label ID="lblApplicantName" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; text-align: left;" colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; text-align: left;" colspan="4"><strong>Multiple Payment Detail</strong></td>
                                </tr>

                                <tr>
                                    <td colspan="4" style="padding:5px !important;">
                                    <asp:GridView ID="Gridview1" ShowHeaderWhenEmpty="true" runat="server" CssClass="table table-bordered legacysearch_tble" Width="100%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#(((GridViewRow)Container).RowIndex+1).ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Application ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRegdNo" runat="server" Text='<%#Eval("AppID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PG SequenceNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStudentName" runat="server" Text='<%#Eval("PGSequenceNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank TransationID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCYEAR" runat="server" Text='<%#Eval("Bank_TranID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblREST" runat="server" Text='<%#Eval("PaymentStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                        <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                                    </asp:GridView>
                                        </td>
                                </tr>
                                
                                <tr>
                                    <td style="padding: 5px; text-align: left;" colspan="4"><strong>Bank Detail For Refund Amount</strong></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; text-align: left;">
                                        <label runat="server" id="Label10">Account Holder Name</label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <asp:Label ID="lblaccountholder" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <label runat="server" id="Label12">Account Number</label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <asp:Label ID="lblaccountnumber" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px;  text-align: left;">
                                        <label runat="server" id="Label14">Bank Name</label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <asp:Label ID="lblbankname" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <label runat="server" id="Label16">Branch Name</label>
                                    </td>
                                    <td style="padding: 5px; text-align: left;">
                                        <asp:Label ID="lblbranch" runat="server" CssClass="lbl_property" Text=""></asp:Label>
                                    </td>
                                </tr>



                            </table>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>


        </div>
        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnPrint" class="btn btn-success" value="Print" onclick="javascript: CallPrint('divPrint');" />
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
        <%----END of Button-----%>
    </div>
   
</asp:Content>

