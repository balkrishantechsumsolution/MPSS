<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/Vendor.Master" AutoEventWireup="true" CodeBehind="VenderLogin.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.VenderReg.VenderLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>

    <script src="VenderReg.js"></script>

    <style>
        #cphbody_txt_loginid, #cphbody_txt_Password, cphbody_txtEmail, cphbody_txtUsrID {
            margin: 10px;
            width: 92%;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        #cphbody_btn_login, #cphbody_BtnRegistration , #cphbody_btnEmail{
            background-color: #5cb85c;
            color: #fff;
            border-color: #4cae4c;
            border: 1px solid transparent;
            border-radius: 4px;
            padding: 6px 12px;
            margin: 10px;
        }

        #cphbody_Btn,#cphbody_btnCanel {
            background-color: #d9534f;
            color: #fff;
            border-color: #d43f3a;
            border: 1px solid transparent;
            border-radius: 4px;
            padding: 6px 12px;
            margin: 10px;
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

        #cphbody_txtUsrID {
            margin: 10px;
            width: 92%;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        #cphbody_txtEmail {
            margin: 10px;
            width: 92%;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        #cphbody_BtnRegistration {
            color: #fff;
            background-color: #5bc0de;
            border-color: #46b8da;
        }

        .container-table {
            display: table;
        }

        .vertical-center-row {
            display: table-cell;
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="container container-table">

        <div class="row vertical-center-row">
            <div id="divtab" class="text-center col-md-7 col-md-offset-2" style="box-shadow: 5px 5px 5px 5px#ccc; margin-top: 60px; margin-left: 250px; padding: 0 10px 0 10px;" runat="server">
                <h1 class="hd">User Login</h1>
                <table id="tbl" runat="server" width="100%" style="line-height: 30px; margin-top: 10px; border: 1px solid #ddd; margin-bottom: 34px;">
                    <tr>
                        <td width="20%" height="66" style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; border-right: 1px solid #ddd !important; padding-left: 10px;">
                            <asp:Label ID="lbl_Login" runat="server">Login ID</asp:Label></td>
                        <td style="background-color: #f8f8f8; border-bottom: 1px solid #ddd !important; border-right: 1px solid #ddd !important;">
                            <asp:TextBox ID="txt_loginid" runat="server" CssClass="forlogid" MaxLength="30" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; border-right: 1px solid #ddd !important; padding-left: 10px;">
                            <asp:Label ID="lbl_Password" runat="server">Password</asp:Label></td>
                        <td height="50" colspan="2" style="background-color: #f8f8f8; border-right: 1px solid #ddd !important;">
                            <asp:TextBox ID="txt_Password" runat="server" CssClass="forpasword"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td height="50" colspan="3" style="text-align: center; background-color: #f8f8f8;">
                            <asp:Label ID="lblmeg" runat="server"></asp:Label>

                            <asp:Button ID="btn_login" runat="server" Text="LOGIN" OnClick="btn_login_Click"  OnClientClick="return ChecLogin(this)" />

                            <asp:Button ID="Btn" runat="server" Text="Forget Password" OnClick="btn_Forget_Click" />
                            <asp:Button ID="BtnRegistration" runat="server" Text="Registration" OnClick="btn_REg_Click" />
                        </td>
                        <%--  <td><asp:Label ID="" runat="server">Password</asp:Label></td>--%>
                    </tr>

                </table>
            </div>
            <div id="myModal" runat="server">
                <div class="container container-table">

                    <div class="row vertical-center-row">
                        <div class="text-center col-md-7 col-md-offset-2" style="box-shadow: 5px 5px 5px 5px#ccc; margin-top: 60px; margin-left: 250px; padding: 0 10px 0 10px;" runat="server">
                            <h1 class="hd">User Forget Password</h1>
                            <table style="line-height: 30px; width: 100%; margin-top: 10px; margin-bottom: 20px; margin-top: 20px;" class="table-bordered">
                                <tr>
                                    <td height="66" style="background-color: #F0F0F0; width: 25%; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                                        <asp:Label ID="lblForgetPassword" runat="server" Text="Enter Your Email ID"></asp:Label></td>
                                    <td height="66" colspan="-1" style="background-color: #f8f8f8;">
                                        <asp:TextBox ID="txtEmail" runat="server" Text="" CssClass="foremailid" MaxLength="30"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td width="20%" height="66" style="background-color: #F0F0F0; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                                        <asp:Label ID="lblUserID" runat="server" Text="Enter Your User ID"></asp:Label>

                                    </td>
                                    <td height="66" colspan="-1" style="background-color: #f8f8f8;">
                                        <asp:TextBox ID="txtUsrID" runat="server" Text="" CssClass="foruserid" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" height="66" style="background-color: #F8F8F8; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                                        <asp:Button ID="btnEmail" runat="server" Text="Send Mail" OnClick="btnSendEmail" OnClientClick="return checkForget(this)" />
                                          <asp:Button ID="btnCanel" runat="server" Text="Cancel" OnClick="btnCanelClick" />
                                    </td>
                                    <%--<td colspan="2" height="66" style="background-color: #F8F8F8; border-bottom: 1px solid #ddd !important; padding-left: 10px;">
                                      </td>--%>

                                </tr>

                            </table>



                        </div>
                    </div>
                </div>




            </div>
        </div>

    </div>




</asp:Content>
