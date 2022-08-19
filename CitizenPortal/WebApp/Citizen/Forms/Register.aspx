<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.Register" %>

<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../../Scripts/CommonScript.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

        });

        function fnRedirectProfile(regType) {
            debugger;
            var rtnurl;
            var qs = getQueryStrings();
            if (qs["UserID"] != null && qs["UserID"] != "") {
                var UserID = qs["UserID"];
            }
            if (regType == 'UID') {
                //alert(regType);
                rtnurl = "/WebApp/Kiosk/Forms/BasicDetail.aspx";
                window.location.href = rtnurl + "?UserID=" + UserID + "&SvcID=992";
            }
            else {
                //alert(regType);
                rtnurl = "/WebApp/Citizen/Forms/CitizenProfile.aspx";
                window.location.href = rtnurl + "?UserID=" + UserID + "&SvcID=992";
            }
        }
    </script>
    <style>
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
        border:none;}
        .auto-style1 {
            font-weight: bold;
        }
    </style>
    <link href="/WebApp/Citizen/Styles/usrreg.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">

    <div class="row" style="width:90%;margin:0 auto;">
        <div class="w95" style="margin: 20px auto;">
            <div class="box-container">
                <div>

                    <table class="table">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>&nbsp;:&nbsp;
                                <asp:Label ID="lblName" runat="server" Text="" CssClass="auto-style1"></asp:Label></td>
                            <td>|</td>
                            <td><asp:Label ID="Label3" runat="server" Text="Login ID"></asp:Label>&nbsp;:&nbsp;
                                <asp:Label ID="lblUserID" runat="server" Text="" CssClass="auto-style1"></asp:Label></td>
                            <td>|</td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Mobile No"></asp:Label>
                            &nbsp;:&nbsp;
                                <asp:Label ID="lblMobile" runat="server" Text="" CssClass="auto-style1">></asp:Label></td>
                            <td>|</td>
                            <td>Email ID&nbsp;:&nbsp;
                                <asp:Label ID="lblEmail" runat="server" Text="" CssClass="auto-style1"></asp:Label></td>
                            <td>|</td>                            
                        </tr>
                    </table>

                </div>
                <h1>Citizen Profile Creation</h1>                
                <div class="col-lg-12 pleft0">
                    <div class="text-danger register-note">
                        <ul>
                            <li>Please take time to complete the profile to avail the services.</li>
                            <li>Information entered while creating the profile shall be used as basic information in all the server.</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-12 mtop15 mbtm10 pleft0">
                    <p><b class="ftcl_black" style="font-size: 19px !important;">Profile not completed. Please select below option to complete it</b></p>
                    <div class="col-lg-6 pleft0" style="display:none;" onclick="fnRedirectProfile('UID');">
                        <a href="#">
                            <div class="reg_opt1">
                                <div class="icon">
                                    <img src="/WebApp/Citizen/Images/ekyc_opt1.png" />
                                </div>
                                <div class="txt">
                                    <h2 style="background-color: #D52736;">Create profile</h2>
                                    <p><b>using Aadhaar Number</b></p>
                                    <p>Your information will be fetched from Aadhaar Database after eKYC, and the profile shall be created based on Aadhaar data.</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-6 pright0" onclick="fnRedirectProfile('DOC');">
                        <a href="#">
                            <div class="reg_opt1">
                                <div class="icon">
                                    <img src="/WebApp/Citizen/Images/photo_icon_opt2.png" />
                                </div>
                                <div class="txt">
                                    <h2>Create profile</h2>
                                    <p><b>Manually</b></p>
                                    <p>Need to enter the information manually (personal details, photo, address etc).</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>
        </div>
</asp:Content>
