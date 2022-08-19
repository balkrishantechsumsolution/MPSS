<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.Services" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/DesignatedOfficer.ascx" TagPrefix="uc1" TagName="DesignatedOfficer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-2.2.3.min.js"></script>
    <link href="../../Styles/easy-responsive-tabs.css" rel="stylesheet" />
    <script src="../../Scripts/easyResponsiveTabs.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    

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
    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            $("#liBasic").removeClass("active");
            $("#liService").addClass("active");
            $("#liDetails").removeClass("active");
            $("#liDoc").removeClass("active");
            $("#liPayment").removeClass("active");

            $("#step1").addClass("stepfinish");
            $("#step2").addClass("stepactive");
            $("#step3").removeClass("active");
            $("#step4").removeClass("active");
            $("#step5").removeClass("active");
            $("#step6").removeClass("active");
            //$("#desigOffice").hide();

            $("#<%=txtSvcName.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("/WebApp/Registration/KioskRegistration.aspx/GetSvcName") %>',
                        data: "{ 'prefix': '" + request.term + "', 'SvcName':'" + $('#txtSvcName').val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.split('-')[0],
                                    val: item.split('-')[1]
                                }
                            }))
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                },
                        select: function (e, i) {
                            //alert()
                            //$("#<%=HFServiceID.ClientID %>").val(i.item.val);
                            window.location.href = i.item.val + "&UID=" + $("#HFUID").val();

                        },
                        minLength: 1
                    });


        var qs = getQueryStrings();
        var uid = qs["UID"];
        $("#HFUID").val(uid);
    });

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
                    debugger;
                    window.location.href = p_URL + "&UID=" + $("#HFUID").val();
                    //alert(p_URL + "&UID=" + $("#HFUID").val());
                    return false;
                }
                function desigOffice() {
                    alert('dssdf');
                    debugger;
                    $("#desigOffice").show();
                }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                <%---Start of Service----%>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading" id="Div4">
                            <h4 class="box-title register-num">Department & Services
                            </h4>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 mt10">
                            <div class="row">
                                <div class="form-group col-lg-4">
                                    <label for="txtSvcName" style="font-weight: normal">
                                        Search Service</label>
                                </div>
                                <div class="form-group col-lg-5">
                                    <asp:TextBox ID="txtSvcName" runat="server" class="form-control" type="text" placeholder="Enter service name to search"></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-3 text-right">                                    
                                    <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#desigOffice"><span>Proceed</span></a>
                                </div>
                            </div>
                        </div>
                        <div class="box-body box-body-open">
                            <div id="parentHorizontalTab">
                                <!--vertical Tabs-->
                                <div id="ChildVerticalTab_1">
                                    <ul class="resp-tabs-list ver_1">
                                        <li>Health & Welfare</li>
                                        <li title="SOCIAL SECURITY EMPOWERMENT OF PERSON WITH DISSABILITIES DEPARTMENT">SSEPDD</li>
                                        <li>General Administration</li>
                                        <li>Water & Sewage</li>
                                        <%--<li>Agriculture</li>--%>
                                    </ul>
                                    <div class="resp-tabs-container ver_1">
                                        <div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="103">
                                                <a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">BIRTH CERTIFICATE</a>
                                                <br />
                                                <span>Revenue Dept. Birth Certificate</span>

                                            </div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="104">
                                                <a href="#" onclick="javascript:return RedirectToService('../Death/DeathForm.aspx?SvcID=104');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../Death/DeathForm.aspx?SvcID=104');">DEATH CERTIFICATE</a>
                                                <br />
                                                <span>Revenue Dept. Death Certificate</span>

                                            </div>
                                        </div>
                                        <div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="105">
                                                <a href="#" onclick="javascript:return RedirectToService('../NFBS/NFBS.aspx?SvcID=105');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../NFBS/NFBS.aspx?SvcID=105');">NFBS</a>
                                                <br />
                                                <span>National Family Benefit Scheme</span>
                                            </div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="106">
                                                <a href="#" onclick="javascript:return RedirectToService('../MBPY/PensionForm.aspx?SvcID=106');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../MBPY/PensionForm.aspx?SvcID=106');">MBPY</a>
                                                <br />
                                                <span>Madhu Babu Pension Yojana</span>
                                            </div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="107">
                                                <a href="#" onclick="javascript:return RedirectToService('../IGNWP/IGNWPForm.aspx?SvcID=107');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../IGNWP/IGNWPForm.aspx?SvcID=107');">IGNWP</a>
                                                <br />
                                                <span>Indira Gandhi National Widow Pension Scheme</span>
                                            </div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="108">
                                                <a href="#" onclick="javascript:return RedirectToService('../IGNDP/IGNDPForm.aspx?SvcID=108');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../IGNDP/IGNDPForm.aspx?SvcID=108');">IGNDP</a>
                                                <br />
                                                <span>Indira Gandhi National Disabled Pension Scheme</span>
                                            </div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="109">
                                                <a href="#" onclick="javascript:return RedirectToService('../IGNOAP/IGNOAPForm.aspx?SvcID=109');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../IGNOAP/IGNOAPForm.aspx?SvcID=109');">IGNOAP</a>
                                                <br />
                                                <span>Indira Gandhi National Old Age Pension</span>
                                            </div>
                                        </div>
                                        <div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="110">
                                                <a href="#" onclick="javascript:return RedirectToService('../Conversion/ConversionForm.aspx?SvcID=110');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../Conversion/ConversionForm.aspx?SvcID=110');">Apply for conversion</a>
                                                <br />
                                                <span>General Admin. Dpet. (Conversion)</span>

                                            </div>
                                        </div>
                                        <div>
                                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="111">
                                                <a href="#" onclick="javascript:return RedirectToService('../water/Connection.aspx?SvcID=111');">
                                                    <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                </a><a href="#" onclick="javascript:return RedirectToService('../water/Connection.aspx?SvcID=111');">Water & Sewage Connection</a>
                                                <br />
                                                <span>Apply for Water & Sewage Connection</span>

                                            </div>
                                        </div>
                                        <%--<div>
                                            <p>d ut ornare non, volutpat vel tortor. InLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor. Integer laoreet placerat suscipit. Sed sodales scelerisque commodo. Nam porta cursus lectus. Proin nunc erat, gravida a facilisis quis, ornare id lectus. Proin consectetur nibh quis urna gravida mollis.t in malesuada odio venenatis.</p>
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%---End of Service----%>
                <%---Start of ConcernOffice----%>
                <div id="desigOffice" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" style="margin: -10px -8px 0 10px;color: red;" data-dismiss="modal"><i class="fa fa-times"></i></button>                                
                            </div>
                            <div id="divOffice" class="modal-body" style="margin-top: -35px;">
                                <div class="col-md-12 box-container">
                                    <div class="box-heading">
                                        <h4 class="box-title register-num">Concerned Office & Designated Officer 
                                        </h4>
                                    </div>
                                    <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" />
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%---End of ConcernOffice----%>
                <%---Start of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <asp:HiddenField ID="HFUID" runat="server" />
    <!--Plug-in Initialisation-->
    <script type="text/javascript">
        $(document).ready(function () {
            //Horizontal Tab
            $('#parentHorizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true, // 100% fit in a container
                tabidentify: 'hor_1', // The tab groups identifier
                activate: function (event) { // Callback function if tab is switched
                    var $tab = $(this);
                    var $info = $('#nested-tabInfo');
                    var $name = $('span', $info);
                    $name.text($tab.text());
                    $info.show();
                }
            });

            // Child Tab
            $('#ChildVerticalTab_1').easyResponsiveTabs({
                type: 'vertical',
                width: 'auto',
                fit: true,
                tabidentify: 'ver_1', // The tab groups identifier
                activetab_bg: '#fff', // background color for active tabs in this group
                inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
                active_border_color: '#c1c1c1', // border color for active tabs heads in this group
                active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
            });

            //Vertical Tab
            $('#parentVerticalTab').easyResponsiveTabs({
                type: 'vertical', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true, // 100% fit in a container
                closed: 'accordion', // Start closed if in accordion view
                tabidentify: 'hor_1', // The tab groups identifier
                activate: function (event) { // Callback function if tab is switched
                    var $tab = $(this);
                    var $info = $('#nested-tabInfo2');
                    var $name = $('span', $info);
                    $name.text($tab.text());
                    $info.show();
                }
            });
        });
    </script>
   
</asp:Content>
