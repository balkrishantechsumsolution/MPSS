<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationStatus.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.ApplicationStatus" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../../Scripts/jquery-2.2.3.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="g2c/js/visitorcount.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="g2c/css/ie10-viewport-bug-workaround.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="g2c/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%--    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../bootstrap.min.css" rel="stylesheet" />--%>
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/timeline.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <%--<link href="../../Styles/StyleSheet3.css" rel="stylesheet" />--%>
    <link href="../../Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <%--<link href="../../Styles/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
    <script src="../../Common/Scripts/bootstrap.min.js"></script>
    <script src="../../Common/Scripts/metisMenu.js"></script>
    <script src="../../Common/Scripts/raphael.js"></script>
    <script src="../../Common/Scripts/morris.js"></script>
    <script src="../../Common/Scripts/sb-admin-2.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../../g2c/css/style.css" rel="stylesheet" />
    <link href="../../../g2c/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <style type="text/css">
        #page-wrapper {
            width: 100%;
            margin: 0 auto 50px !important;
        }

        .title-marg {
            margin: 20px 50px 0;
        }

        .stepfinish {
            background-color: rgb(81, 155, 3);
            border: 1px solid rgb(56, 102, 2);
        }

        .stepactive {
            background-color: rgb(255, 177, 27);
            border: 1px solid rgb(210, 138, 0);
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtAppDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });
        });

        function ValidateForm() {
            debugger;
            var text = "";
            var opt = "";

            var AppID = $('#txtAppID');


            if (AppID.val() != '') {

                if (AppID.val().length != 12) {
                    text += "<br /> -Please enter valid 12 digit Reference ID.";
                    AppID.attr('style', 'border:1px solid #d03100 !important;');
                    AppID.css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    AppID.attr('style', 'border:1px solid #cdcdcd !important;');
                    AppID.css({ "background-color": "#ffffff" });
                }
            }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);

                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page-wrapper">
            <header>
                <div class="row">
                    <div class="col-md-12 col-lg-12 outertop">
                        <div class="col-xs-12 col-md-9 ptop10">
                            <p class="support"><span class="fa fa-headphones"></span>For Queries and Customer Support <span class="tollfree">1800 3000 3468</span>     </p>
                        </div>

                        <div class="col-md-3 ptop10">
                            <div class="col-xs-6 col-sm-5">
                                <div class="tsize"><a href="">-A</a> <a href="">A=</a> <a href="">A+</a></div>
                            </div>
                            <div class="col-xs-6 col-sm-7 talgnright">
                                <div class="langbxhld">
                                    <label for="chooselang"></label>
                                    <select name="chooselang" id="chooselang" class="searchbox">
                                        <option>English</option>
                                        <option>Odiya</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-xs-12 col-md-6 pleft0 ptop10">
                            <div class="logo">
                                <div class="hmetitle">
                                    <div class="fltleft pright5">
                                        <img src="/g2c/img/dashboard_logo.png" />
                                    </div>
                                    <div class="fltleft">
                                        <h1>LOKASEBA ADHIKARA</h1>
                                        <div class="hmesub-title">Common Application Portal (CAP)</div>
                                        <div class="hmesub-sub-title">An Initiative Of Odisha Government</div>
                                    </div>
                                    <div class="tophd_csclogo">
                                        <img src="/g2c/img/tophead_logo.png" />
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xs-12 col-md-6">
                            <img src="/g2c/img/tophead_rght.png" class="pull-right" alt="" />
                        </div>
                    </div>
                </div>

                <nav class="navbar navbar-default navbar-static-top">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Menu</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="http://g2cservices.in/g2c/index.html"><span class="fa fa-home"></span>HOME</a></li>
                                <li><a href="http://ortpsa.in/about_act.php" target="_blank"><span class="fa fa-gavel"></span>ACT</a></li>
                                <li><a href="http://ortpsa.in/forms.php" target="_blank"><span class="fa fa-clone"></span>FORMS</a></li>
                                <li><a href="http://ortpsa.in/departments.php" target="_blank"><span class="fa fa-university"></span>DEPARTMENTS</a></li>
                                <li><a href="http://ortpsa.in/pmu_cell.php" target="_blank"><span class="fa fa-desktop"></span>PMU</a></li>
                                <li><a href="http://ortpsa.in/faq-english.php" target="_blank"><span class="fa fa-joomla"></span>FAQ</a></li>
                                <li><a href="http://ortpsa.in/contact_us.php" target="_blank"><span class="fa fa-map-marker"></span>CONTACTS</a></li>
                                <li><a href="http://ortpsa.in/circulars.php" target="_blank"><span class="fa fa-paste"></span>CIRCULARS</a></li>
                            </ul>
                            <!--<div class="ptop5">
                                        <label for="searchbar"></label>
                                            <input name="searchbar" type="text" class="box" id="searchbar" value="search" required autofocus>
                                        </div>-->
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </nav>
            </header>


            <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
            <div class="row" id="divApp" runat="server">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Applicant Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label for="ddlYearTerm" class="manadatory">
                                    Reference ID</label>
                                <asp:TextBox ID="txtAppID" placeholder="Reference ID" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label for="Village">
                                    Application Date</label>
                                <asp:TextBox ID="txtAppDate" placeholder="dd/MM/yyyy" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="ddlYearTerm">
                                    Applicant Name</label>
                                <asp:TextBox ID="txtAppName" placeholder="Applicant Name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                            <div style="    margin-top: -12px;">
                                <label>    
                                <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />
                            </label>
                                <asp:TextBox runat="server" ID="captcha" MaxLength="6" CssClass="form-control" placeholder="Enter Captcha" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="danger" id="error" for="ddlYearTerm" runat="server">
                                </label>
                                &nbsp;<div class="text-right">
                                    <%--<button type="button" class="btn btn-primary"><i class="fa fa-search"></i>  Search </button>--%>
                                    <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-primary" OnClientClick="isJavaScriptEnabled:return ValidateForm();"
                                        Text="Search" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="divStatus" runat="server" style="display: none">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Application Status
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-md-12 box-container" style="left: 0px; top: 0px">
                            <div id="divPrint">

                                <div style="border: 1px solid #999; background-color: #ffffff; border-bottom: none; width: 708px; margin: 35px auto 0px; padding: 6px 0 0 7px; font-size: 17px; font-weight: bold;">
                                    &nbsp;<div style="clear: both; margin: 0; line-height: 0; padding: 0;"></div>
                                    <div>
                                    </div>
                                    <table style="width: 100%">
                                        <tr>
                                            <td rowspan="3"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img alt="Logo" src="../images/depLgog.png" style="width: 120px;" />
                                            </td>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="text-align: center">&nbsp;</td>
                                                        <td></td>
                                                        <td style="text-align: center; font-size: 22px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</td>
                                                        <td></td>
                                                        <td style="text-align: center">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <div style="width: 100px; margin:0 auto;">
                                                    <uc1:QRCode ID="QRCode1" runat="server" />
                                                </div>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style="text-align: center">&nbsp;</td>
                                            <td>&nbsp;</td>

                                        </tr>

                                    </table>
                                    <div style="text-align: center; font-size: 20px; font-weight: bolder; width: 708px; padding: 6px 0 0 7px; text-transform: uppercase; width: 100%; background-color: #ffffff; color: #1f1a1a;">
                                        <asp:Label runat="server" ID="lbldepartment" Style="font-size: 15px">Application Status</asp:Label>
                                    </div>
                                </div>

                                <div class="" style="font-weight: normal; width: 708px; margin: 0 auto;">

                                    <table cellpadding="5" cellspacing="0" class="table table-bordered table-striped" style="width: 100%; border: 0;">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                                <strong>Application Detail</strong></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="tokanno" runat="server" CssClass="lbl_property" Text="Application ID"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblTokenNo" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Label77" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblAppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Label79" runat="server" CssClass="lbl_property" Text="Applicant Name"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblAppName" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Label82" runat="server" Text="Application For"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblAppFor" runat="server" CssClass="lbl_value" Style="white-space: normal !important;"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Payment Detail</strong></td>
                                            <%--  <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>--%>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Payment Status</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblPayStatus" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr id="trpay" runat="server">
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Transaction ID</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblTrnID" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Transaction Date</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblTrnDate" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr id="trpay1" runat="server">
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Total Amount</td>
                                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <i class="fa fa-rupee"></i>
                                                <asp:Label ID="lblTotalAmount" runat="server" CssClass="lbl_value"></asp:Label>
                                                &nbsp;<asp:Label ID="lblAmtWord" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Application </strong>S<span class="auto-style1">tatus</span></td>
                                            <%--<td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>--%>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Current Status</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblStatus" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Last Action Date</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblActionDate" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Remarks</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                <asp:Label ID="lblRemarks" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <div style="text-align: center; margin-bottom: 10px;">
                    <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    <input type="submit" name="btnClose" value="Close" id="btnCancel" class="btn btn-danger" onclick="javascript: window.close();" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
