<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicationCount.ascx.cs" Inherits="CitizenPortal.Sambalpur.controls.ApplicationCount" %>
<style>
    /*Count Boxes Start Here*/

    .deptbox_bg {
        background-color: #911500 !important;
        /* background-color: #FFD24D !important; */
    }

    .small-box {
        position: relative;
        display: block;
        -webkit-border-radius: 2px;
        -moz-border-radius: 2px;
        border-radius: 2px;
        margin-bottom: 20px;
        -webkit-box-shadow: 0 1px 4px rgba(0,0,0,.3);
        box-shadow: 0 1px 4px rgba(0,0,0,.3);
    }

        .small-box > .inner {
            padding: 0 0 0 10px;
        }

    .lgbox_hd {
        font-size: 45px;
        font-family: 'OpenSans-Bold', Helvetica, Arial, sans-serif;
        color: #fff;
        white-space: nowrap;
        margin: 0 0 10px 0;
    }


    .small-box p {
        color: #fff;
        font-family: 'OpenSans-Bold', Helvetica, Arial, sans-serif;
        font-size: 21px;
        margin: 0 0 5px 0;
        font-weight:bold;
    }

    .small-box .icon {
        position: absolute;
        top: auto;
        bottom: 0;
        right: 9px;
        z-index: 0;
        font-size: 70px;
        color: rgba(0, 0, 0, 0.20);
    }

    .small-box > .small-box-footer {
        position: relative;
        text-align: center;
        padding: 3px 0;
        color: #fff;
        color: rgba(255, 255, 255, 0.8);
        display: block;
        z-index: 10;
        background: rgba(0, 0, 0, 0.1);
        text-decoration: none;
    }

    .servbox_bg {
        background-color: #0d5d10 !important;
        /* background-color: #26FF93 !important; */
    }

    .appbox_bg {
        background-color: #00405C !important; 
        /* background-color: #FFA64D !important;*/
    }

    .compbox_bg {
        background-color: #ff9800 !important; 
        /* background-color: #26C9FF !important;*/
    }
</style>

<div class="">
    <div class="col-lg-12 mtop10">
        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 p0">
            <div class="small-box deptbox_bg">
                <div class="inner">
                    <span class="lgbox_hd" id="lblTotal" runat="server"></span>
                    <p id="lblStudent" runat="server"></p>
                </div>
                <div class="icon"><i class="fa fa-graduation-cap"></i></div>
                <div class="small-box-footer"></div>
                <a href="/WebApp/G2G/DTE/StudentHistory.aspx" target ="_blank" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a>
            </div>
        </div>

        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 pright0">
            <!-- small box -->
            <div class="small-box servbox_bg">
                <div class="inner">
                    <span id="lblSemCount" runat="server" class="lgbox_hd"></span>
                    <p id="lblSEM" runat="server"></p>
                </div>
                <div class="icon"><i class="fa fa-money"></i></div>
                <div class="small-box-footer"></div>
                <a href="//WebApp/G2G/DTE/PGSummary.aspx" target ="_blank" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 pright0">
            <!-- small box -->
            <div class="small-box appbox_bg">
                <div class="inner">
                    <span id="lblInternalCount" runat="server" class="lgbox_hd"></span>
                    <p id="lblInternal" runat="server"></p>
                </div>
                <div class="icon"><i class="fa fa-pencil"></i></div>
                <div class="small-box-footer"></div>
                <a href="/WebApp/G2G/MarkEntry/InternalMarksV2.aspx" target ="_blank" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 pright0">
            <div class="small-box compbox_bg">
                <div class="inner">
                    <span id="lblApplicationCount" runat="server" class="lgbox_hd"></span>
                    <p id="lblApplication" runat="server"></p>
                </div>
                <div class="icon"><i class="fa fa-group"></i></div>
                <div class="small-box-footer"></div>
                <a href="/WebApp/G2G/DTE/PendingApplication.aspx" target ="_blank" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a>
            </div>
        </div>
    </div>
</div>
