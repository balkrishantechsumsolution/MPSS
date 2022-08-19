<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/Vendor.Master" AutoEventWireup="true" CodeBehind="VenderInvoice.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.VenderReg.VenderInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>

    <script src="VenderReg.js"></script>
    <style>
        #cphbody_btn_Pay {
            background-color: #5cb85c;
            color: #fff;
            border-color: #4cae4c;
            border: 1px solid transparent;
            border-radius: 4px;
            padding: 6px 12px;
            margin: 10px;
        }

        #Button1 {
            background-color: #d9534f;color: #fff; border-color: #d43f3a; border: 1px solid transparent;
            border-radius: 4px;
            padding: 6px 12px;
            margin: 10px;
        }

        #cphbody_txt_Customer, #cphbody_txt_Mobile, #cphbody_txt_Amt_transfer,#cphbody_txtRemark {
            margin: 10px;
            width: 92%;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        #cphbody_txt_Portal {
            margin: 10px;
            width: 92%;
            background-color:none;
            padding-left:5px;
            border: 1px solid #ddd;
        }

        .hd {
            font-family: 'proximanovaaltbold';
            background-color: #F8F8FF;
            font-size: 25px;
            color: #212121;
            text-transform: uppercase;
            padding: 10px 0 10px 8px;
            border-bottom: 4px solid #FF7D01;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">

    <div id="page-wrapper" style="min-height: 311px;">
        <div class="col-lg-12">
             <h1 class="hd">Vender Invoice </h1>
     <table width="100%" style="line-height:30px; margin-top:10px;" class="table-bordered">
        <tr>
             <td><asp:Label ID="lbl_Customer" runat="server"> Customer Name</asp:Label></td>
            <td><asp:TextBox ID="txt_Customer" runat="server" CssClass="forname" onkeypress="return ValidateAlpha(event)" ></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_CusMobile" runat="server">Customer Mobile Number</asp:Label></td>
            <td><asp:TextBox ID="txt_Mobile" runat="server" CssClass="fornumber"></asp:TextBox></td>

        </tr>
        <tr>
          <td><asp:Label ID="lbl_TransferAmt" runat="server">Ammount Transfer</asp:Label></td>
            <td><asp:TextBox ID="txt_Amt_transfer" runat="server" CssClass="forammount"></asp:TextBox></td>

        </tr>
       <tr>
           <td><asp:Label ID="lbl_Portal" runat="server">Portal Charges</asp:Label></td>
            <td><asp:TextBox ID="txt_Portal" runat="server" Text="0"  ReadOnly="true" CssClass="forpcharges"></asp:TextBox></td>
          
        </tr>
         <tr>
           <td><asp:Label ID="ServiceTax" runat="server">Portal Charges</asp:Label></td>
            <td><asp:TextBox ID="txtservice" runat="server" Text="0" ReadOnly="true"  CssClass="forpcharges1"></asp:TextBox></td>
          
        </tr>
          <tr>
           <td><asp:Label ID="lblRemark" runat="server">Remark</asp:Label></td>
            <td><asp:TextBox ID="txtRemark" runat="server" Text="" TextMode="MultiLine" CssClass="forremark"></asp:TextBox></td>
          
        </tr>
         <tr>
            <td><asp:Button ID="btn_Pay" runat="server" Text="Pay Now" OnClick="btn_Pay_Click" OnClientClick="return checkInvoice(this)" /></td>
          
        </tr>
    </table>
            </div>
        </div>
</asp:Content>
