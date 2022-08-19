<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" CodeBehind="OUATDiplomaHome.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.OUATDiplomaHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-2.2.3.min.js"></script>
    <link href="../../Styles/easy-responsive-tabs.css" rel="stylesheet" />
    <script src="../../Scripts/easyResponsiveTabs.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script type="text/javascript">


        function getQueryStrings() {
            var assoc = {};
            var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
            var queryString = location.search.substring(1);
            var keyValues = queryString.split('&');

            for (var i in keyValues) {
                var key = keyValues[i].split('=');
                if (key.length > 1) {
                    assoc[decode(key[0])] = decode(key[1]);
                }
            }

            return assoc;
        }

        function RedirectToService(p_URL) {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];

            window.open(p_URL + "?SvcID=" + SvcID + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
            return false;
        }

        function MakePayment() {
            //alert('Payment details can be upload after 24 hours from the time of making of payment');
            //return false;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/OUATPayment.aspx?SvcID=" + SvcID;
            if (AppID != "" || AppID != null)
            {
                window.open(p_URL  + "&AppID=" + AppID,
                               ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');

            }
        }

        function OuatRefund() {
            debugger;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = '/WebApp/Kiosk/ReFundPayment/RefundPayment.aspx?SvcID=' + SvcID + '&AppID=' + AppID + '&UID=' + UID;
            window.open(p_URL);
        }

        function ShowRankCard() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/AgroDiplomaRankCard.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function ViewApplication() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "";
            if (SvcID == "430") {
                p_URL = "/WebApp/Kiosk/OUAT/AgroPolytechnicDiplomaAcknowledgement.aspx?SvcID=430";
            }
            window.open(p_URL + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function ViewFormBApplication() {
           
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var p_URL = "";
            p_URL = "/WebApp/Kiosk/OUAT/FormBAcknowledgement.aspx?SvcID=405";
            
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');

        }

        function EditApplication() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "";
            if (SvcID == "403") {
                p_URL = "/WebApp/Kiosk/OUAT/FormA.aspx?SvcID=403";

            }
            else if (SvcID == "409") {
                p_URL = "/WebApp/Kiosk/OUAT/AgroFormA.aspx?SvcID=409";

            }
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function DownloadPass() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/DiplomaRankCard.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function ConfirmPayment() {
            debugger;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + SvcID;
                window.location.href = p_URL  + "&AppID=" + AppID;
            //window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
            //               ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }


        //UploadSEBC
        function UploadDocument() {
            //alert('Payment details can be upload after 24 hours from the time of making of payment');
            //return false;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var p_URL = "/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=430";
            window.open(p_URL + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function UploadCustomDocument() {
            //alert('Payment details can be upload after 24 hours from the time of making of payment');
            //return false;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var p_URL = "/WebApp/Kiosk/OISF/CustomAttachment.aspx?SvcID=405";
            window.open(p_URL + "&UID=" + UID + "&AppID=" + FormBAppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }
    </script>

    <style type="text/css">
        #container {
            width: 100%;
        }

        @media only screen and (max-width: 768px) {
            #container {
                width: 100%;
                margin: 0 auto;
            }
        }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 47.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }

        #parentHorizontalTab {
            margin: 0 10px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div ng-controller="ctrl">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 mtop10">
                    
<div style="padding:15px; font-family:Arial, Helvetica, sans-serif; background-color:#31708f; font-size:14px; /*text-shadow: 2px 2px 14px #000000;*/ letter-spacing:0.15em; color:#d9edf7; text-align:center;"><i class="fa fa-hand-o-right fa-fw"></i>The Applicant who has paid their Application Fee, their payment status will be updated soon. Sorry for inconvenience.</div>
                </div>
            </div>
            
            <div class="resp-tabs-container ver_1">
                <div style="margin-top: 20px;">
                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="101">
                        <a href="#" onclick="javascript:return RedirectToService('/WebApp/Kiosk/OUAT/AgroPolytechnicDiplomaAcknowledgement.aspx?SvcID=430');">
                            <img src="/webapp/kiosk/Images/OUAT.png" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ViewApplication();">VIEW Filled Application</a>
                        <br />
                        <span>View & Print Filled Application</span>
                    </div>

                    <div runat="server" id="divPayment" style="" visible="false">
                        <div style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv" id="103">
                            <a href="#" onclick="javascript:return ConfirmPayment();">
                                <img src="/webapp/kiosk/Images/csc_logo.png" alt="" align="left" style="height: 50px;margin-top: 9px;" />
                            </a><a href="#" onclick="javascript:return ConfirmPayment();">MAKE PAYMENT (till 06-07-2017)</a>
                            <br />
                            <span>Make Payment either through Online Payment or CSC Center</span>
                        </div>                        
                    </div>     
                                                     
                    <div runat="server" id="divPass" style="min-height: 4.66em; z-index: -760;" class="SrvDiv">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return DownloadPass();">Intimation-Cum-Rank Card</a>
                        <br />
                        <span>Click to Print Intimation-cum-Rank Diploma in AgroPolytechnic Card </span>

                    </div>
                     <div runat="server" id="divRank" style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv" visible="false">
                        <a href="#" onclick="javascript:return ShowRankCard();">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ShowRankCard();">Intimation Cum Rank Card</a>
                        <br />
                        <span>Click to view Intimation Cum Rank Card for OUAT Agro Polytechnic Diploma - 2017</span>
                    </div>
                    
                    <div runat="server" id="divDoc" style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv" visible="false">
                        <a href="#" onclick="javascript:return UploadDocument();">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return UploadDocument();">Upload Relevant Document (by 17-07-2017)</a>
                        <br />
                        <span>Upload and View the attached Document (link open till 10-07-2017)</span>
                    </div>

                     <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="101">
                        <a href="#" onclick="javascript:return OuatRefund();">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return OuatRefund();">SUBMIT REFUND Application</a>
                        <br />
                        <span>To Be Fill Refund Application</span>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFFormBAppID" runat="server" ClientIDMode="Static"/>
</asp:Content>
