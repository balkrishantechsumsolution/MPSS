<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftPanel.ascx.cs" Inherits="CitizenPortal.WebApp.Control.LeftPanel" %>

<%--<script src="../Scripts/jquery.min.js"></script>
<script src="../Scripts/bootstrap.min.js"></script>
<script src="../Scripts/metisMenu.js"></script>
<script src="../Scripts/raphael.js"></script>
<script src="../Scripts/morris.js"></script>
<link href="../Styles/beyond.css" rel="stylesheet" />
<script src="../Scripts/beyond.js"></script>
<script src="../Scripts/sb-admin-2.js"></script>

<link href="../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />--%>

<link href="../Common/Styles/style.admin.css" rel="stylesheet" />
<%--<script src="../../Scripts/angular.min.js"></script>--%>
<script src="/PortalScripts/Wallet.js"></script>
<style type="text/css">
    .navbar-collapse {
    padding-right:0 !important;
    }
    .navbar-brand > img {
        width: 188px;
        margin-top: -13px;
    }

    .title {
        margin: 10px auto 0 50px;
        font-size: 2em;
        font-weight: bold;
        display: block;
        text-align: center;
    }

    .camera {
        display: block;
        margin: -60px auto 0;
        width: 1px;
        border-radius: 50px;
        position: relative;
        border: 4px solid #f2f2f2;
        background: #ccc;
        padding: 10px;
        width: 75px;
        height: 75px;
        background-image: url('/WebApp/Kiosk/Images/camera.png');
        cursor: pointer;
    }

        .camera:hover {
            box-shadow: 0 -4px 18px 0 rgba(0, 0, 0, 0.2), 0 6px 5px 0 rgba(0, 0, 0, 0.2);
            width: 74px;
            height: 74px;
        }

    .panel-success {
        margin-top: -2px;
    }

    .panel {
        background-color: #f6f6f6;
    }

    .profile-wapper {
        overflow: auto;
        font-weight: 700;
        color: Maroon;
    }

    .profile {
        border-radius: 50px;
        width: 105px;
        height: 105px;
        margin: 20px auto 10px;
        border: 3px solid #b1b1b1;
        display: block;
        background: #ccc;
    }

        .profile > img {
            border-radius: 50px;
            width: 100px;
            height: 100px;
            margin: 0 auto 10px;
            border: 2px solid #cfcfcf;
            display: block;
        }

    #wrapper {
        margin-bottom: 50px;
    }

    .modalBackground {
        background-color: #F4F4F4;
        filter: alpha(opacity=90);
        opacity: 0.9;
        height: 100%;
        left: 0;
        position: absolute;
        top: 0;
        width: 100%;
        z-index: 10000;
    }

    #divSteps {
        position: relative;
        top: 0;
        z-index: 10;
        display: block;
        margin: 0 auto;
    }

    .register-num {
        padding: 0;
    }

    .navbar-default-gray {
        background-color: #f8f8f8;
        border-color: #e7e7e7;
    }

    .nv_bg {
        background-color: #F1F4F8 !important;
    }


    .UserDetail p {
        background-color: #fff !important;
        color: #37485F !important;
        text-align: left;
        padding: 10px 0 10px 15px;
        font-size: 14px;
        font-weight: normal;
        line-height: 12px;
        margin: 1px;
    }

    .profile_bg {
        width: 100%;
        /*background-color:#2f4e6c;*/
        min-height: 150px;
        /*margin-top: -43px;*/
        padding-top: 7px;
    }

    .pleft0 {
        padding-left: 0 !important;
    }

    .pright0 {
        padding-right: 0 !important;
    }

    .fntsize13 {
        font-size: 13px !important;
    }
    .leftpnlbg_grey li {
    padding-left: 10px;
    border-bottom: 1px solid #e7e7e7;
    line-height: 37px;
    display: block;
    width: 100%;
}
    .leftpnlbg_grey li a {
    font-family: 'Heebo-Regular', Helvetica, Arial, sans-serif;
    color: #777;
    padding-left: 9px !important;
}
</style>

<script>
    $(document).ready(function () {
        var url = window.location;

        $('#side-menu > ul.nav a[href="' + url + '"]').removeClass('active').parent().parent().removeClass('out').parent().removeClass('active');

        // Will also work for relative and absolute hrefs
        $('#side-menu > ul.nav a').filter(function () {
            return this.href == url;
        }).removeClass('active').parent().parent().removeClass('in').parent().removeClass('active');
        $('#side-menu').metisMenu();
        //$('#side-menu').click();
    });
    $(function () {
        $('#pnlMenu').metisMenu();
    });
</script>
<div class="navbar-default-gray sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse leftpnlbg_grey p0" runat="server" ng-app="appmoduleWallet" style="padding: 0 !important;">
        <ul class="nav" id="side-menu1" style="overflow: auto; display: none;" ng-controller="ctrlWallet">
            <li>
                <center class="profile-wapper"><br />
                    <div class="profile">  
                        <img runat="server" src="/webApp/kiosk/Images/user_1.png" name="ProfilePhoto" id="ProfileImg" />                          
                                                                     
                    </div>
                    <p><i class="fa fa-user"></i> <span id="lblUser" runat="server"></span></p> 
                    <p id="pMobile" runat="server"><i class="fa fa-mobile-phone"></i> <span id="lblMobile" runat="server"></span> 
                        </p><p id="pEmail" runat="server"> <i class="fa fa-envelope"></i> <span id="lblEmail" runat="server"></span></p>
                    <%--<p><i class="fa fa-money fa-1x"></i> <span> Balance : </span><span><i class='fa fa-rupee'></i>{{walletData.lblBalance}}</span></p>--%>
                    <p> <i class="fa fa-calendar"></i><span id="Span1" runat="server"> Today : </span><span id="lblDate" runat="server"></span></p>  
                <br />

                </center>
            </li>
        </ul>
        <%--<asp:Panel ID="divLogger" runat="server"></asp:Panel>--%>
        <asp:Panel ID="pnlMenu" runat="server"></asp:Panel>
    </div>
</div>


