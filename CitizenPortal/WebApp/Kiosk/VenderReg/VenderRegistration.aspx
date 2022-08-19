<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/Vendor.Master" AutoEventWireup="true" CodeBehind="VenderRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.VenderReg.VenderRegistation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>
        <script src="VenderReg.js"></script>
    <style>
        #cphbody_btn_Reg {
            background-color: #5cb85c;
            color: #fff;
            border-color: #4cae4c;
            border: 1px solid transparent;
            border-radius: 4px;
            padding: 6px 12px;
            margin: 10px;
        }

        #cphbody_txtShopName, #cphbody_txt_OwnerName, #cphbody_txt_Address, #cphbody_txt_BankAc, #cphbody_txt_bankName, #cphbody_txt_IFsc, #cphbody_txt_UserId, #cphbody_txt_Password,#cphbody_TxtEmail {
            margin: 10px;
            width: 92%;
            border: 1px solid #ddd;
            background-color: #fff;
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

    <div class="container container-table">
        <div class="row vertical-center-row" style="box-shadow: 5px 5px 5px 5px#ccc; margin-top:50px;">
            <h1 class="hd">User Registration</h1>
            <div class="col-md-12" style="padding:0 0 0 0;">
                <table width="98%" style="line-height: 30px; margin-top: 10px; margin-left:12px; margin-bottom:20px; padding:0 10px 0 10px" class="table-bordered">
                <tr>
                    <td width="15%" style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lblShopName" runat="server">Shop Name</asp:Label></td>
                    <td width="35%" style="background-color: #f8f8f8;">
                        <asp:TextBox ID="txtShopName" runat="server" CssClass="forshopname" onkeypress="return ValidateAlpha(event)"></asp:TextBox></td>
                    <td width="15%" style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lbl_owner" runat="server"> Owner Name</asp:Label></td>
                    <td width="35%" style="background-color: #f8f8f8;">
                        <asp:TextBox ID="txt_OwnerName" runat="server" CssClass="forownername" onkeypress="return ValidateAlpha(event)"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lbl_Address" runat="server">Address</asp:Label></td>
                    <td style="background-color: #f8f8f8;">
                        <asp:TextBox ID="txt_Address" runat="server" CssClass="foraddress"></asp:TextBox></td>
                    <td style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lbl_Bank_Ac" runat="server">Bank Account Number</asp:Label></td>
                    <td style="background-color: #f8f8f8;">
                        <asp:TextBox ID="txt_BankAc" runat="server" CssClass="foraccountnumber" onkeypress="return isNumberKey(event)"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lbl_BankName" runat="server"> Bank Name</asp:Label></td>
                    <td style="background-color: #f8f8f8;">
                        <asp:TextBox ID="txt_bankName" runat="server" CssClass="forbankname" onkeypress="return ValidateAlpha(event)"></asp:TextBox></td>
                    <td style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lbl_IFSC" runat="server">Bank IFSC Code</asp:Label></td>
                    <td style="background-color: #f8f8f8;">
                        <asp:TextBox ID="txt_IFsc" runat="server" CssClass="forifsccode"  onchange="AllowIFSC(this)" onKeypress="AlphaNumeric()" MaxLength="11" ></asp:TextBox>
                          <asp:Label ID="ifscmsg" runat="server" CssClass="ifscmsg" style="color:#dc1717"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lbl_USerID" runat="server">User Login ID</asp:Label></td>
                    <td style="background-color: #f8f8f8;">
                        <asp:TextBox ID="txt_UserId" runat="server" CssClass="foruserid"></asp:TextBox></td>
                    <td style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lbl_Password" runat="server">Password</asp:Label></td>
                    <td style="background-color: #f8f8f8;">
                        <asp:TextBox ID="txt_Password" runat="server" CssClass="forpassword"></asp:TextBox></td>

                </tr>
                <tr>
                   <td style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                        <asp:Label ID="lblEmail" runat="server">Email ID</asp:Label></td>
                    <td style="background-color: #f8f8f8;">
                        <asp:TextBox ID="TxtEmail" runat="server" CssClass="formailid"></asp:TextBox></td>
                    <td style="background-color: #f8f8f8;"></td>
                    <td style="background-color: #f8f8f8;"></td>

                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; background-color: #f8f8f8;">
                        <asp:Button ID="btn_Reg" runat="server" Text="Submit" OnClick="btn_Reg_Click"  OnClientClick="return checkRegistration(this)"/></td>


                </tr>

            </table>
            </div>
        </div>
    </div>




</asp:Content>
