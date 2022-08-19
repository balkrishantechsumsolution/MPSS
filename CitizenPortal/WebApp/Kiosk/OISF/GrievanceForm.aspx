<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GrievanceForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.GrievanceForm" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />

    <script src="../../Scripts/CommonScript.js"></script>
    <script>
        function EPassPrint(strid) {
            debugger;
            var rollno = $("#lblRollNo").text();
            var appid = $("#lblAppID").text();

            
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }

        function ValidateForm() {
            debugger;
            var text = "";
            var opt = "";
            var Subject = $('#txtSubject');
            var Greivance = $('#txtGreivance');
            
            if (Subject.val() == '') {
                text += "<br /> -Please enter Subject";
                Subject.attr('style', 'border:1px solid #d03100 !important;');
                Subject.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                Subject.attr('style', 'border:1px solid #cdcdcd !important;');
                Subject.css({ "background-color": "#ffffff" });

            }
            if (Greivance.val() == '') {
                text += "<br /> -Please enter Greivance Detail.";
                AppID.attr('style', 'border:1px solid #d03100 !important;');
                AppID.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                AppID.attr('style', 'border:1px solid #cdcdcd !important;');
                AppID.css({ "background-color": "#ffffff" });
            }
            

            if (opt == "1") {
                alertPopup("Please fill following information.", text);

                return false;
            }

            return true;
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
            height: 728px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <div id="" style="margin: 10px auto; width: 800px; height: 50px; /*height: 1220px; overflow: auto; */">
                    <div runat="server" class="danger error bg-warning" id="divErr">
                            
                        </div>
                    
                </div>
                <asp:Panel ID="Panel1" runat="server">
                <div id="divPrint" style="margin: 0 auto;" runat="server">
                    <div style="margin: 0 auto; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial;height: 654px;width: 794px;">
                        <div style="margin: 0 auto; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-size: 300px; background-repeat: no-repeat; background-position: center center;height: 649px; width: 785px;">
                            <%---------Start Header section --------%>
                            <div style="height: 114px; width: 100%; border-bottom: 1px solid #999;">
                                <table style="width: 100%; vertical-align: middle; text-align: center;">
                                    <tr>
                                        <td>
                                            <img alt="Logo" src="img/odisha_policelogo.jpg" style="width: 90px;" />
                                        </td>
                                        <td style="text-align: center; vertical-align: middle;">

                                            <span style="text-align: center; font-size: 15px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</span>
                                            <br />
                                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 18px; font-weight: bolder; text-transform: none;">Recruitment of Constable in 9th SIRB - 2016-17</asp:Label>
                                        </td>
                                        <td style="width: 155px; height: 113px;">
                                            <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                            <uc1:QRCode runat="server" ID="QRCode1" style="width: 80px !important" />

                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="display: block; text-align: center; overflow: auto; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <div style="float: left; text-align: left; width: 500px;">
                                    <span style="text-align: center; font-size: 22px; font-weight: bold; color: #fff;">Grievance for 9TH SIRB &nbsp; 2016-17</span>
                                </div>
                                <div style="float: right; width: 250px; text-align: right;">
                                    <b>Roll No.: </b>
                                    <asp:Label runat="server" ID="lblRollNo" Style="font-weight: bolder; text-transform: none; white-space: nowrap;"></asp:Label>
                                </div>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">Applicant Details</b></td>
                                        <td rowspan="8" style="padding: 0; border: 1px solid #999; text-align: center; width: 135px;">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px; height: 160px" id="ProfilePhoto" />
                                            <br />
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" /></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 100px;">
                                            <asp:Label ID="Label5" runat="server" Text="Reference ID"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 100px; white-space: nowrap;">
                                            <asp:Label ID="Label7" runat="server" Text="Application Date"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                            <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFather1" runat="server">Father's Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblFather" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="padding: 5px 0;">
                                        <td style="padding: 0; border: 1px solid #999; text-align: left;" colspan="4">
                                            <table style="width: 100%;" cellspacing="0" cellpadding="5" class="">
                                                <tr>
                                                    <td style="border-right: 1px solid #999; width: 113px; padding: 5px; white-space: nowrap">
                                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth (Age)"></asp:Label>
                                                    </td>
                                                    <td style="border-right: 1px solid #999; width: 150px; padding: 5px; white-space: nowrap">
                                                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                        (<asp:Label ID="lblAge" runat="server"></asp:Label>)
                                                    </td>
                                                    <td style="border-right: 1px solid #999; white-space: nowrap; width: 130px; padding: 5px">
                                                        <asp:Label ID="lblFather0" runat="server">Religion (Category)</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; width: 166px;">
                                                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0; border: 1px solid #999; text-align: left;" colspan="4">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <b style="text-transform: uppercase;">PHYSICAL MEASURMENT &amp; efficiency Examination Venue Details</b></td>
                                    </tr>
                                    <tr style="">
                                        <td style="border: none;" colspan="4">
                                            <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                    <tr>
                                                        <td style="width: 90px; border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 5px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;" rowspan="2">
                                                            <asp:Label ID="Father" runat="server">Venue Name <br />&<br />Address</asp:Label>

                                                        </td>
                                                        <td style="width: 200px; padding: 5px; border: 1px solid #999; text-align: left; border-top: none;" rowspan="2">
                                                            <asp:Label ID="lblVenue" runat="server" Text=""></asp:Label>

                                                        </td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 124px; border-top: none;">
                                                            <asp:Label ID="lblBPLYear" Font-Size="12px" runat="server" Text="Date of Examination"></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; border-top: none; border-right: none;">
                                                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                            <asp:Label ID="lblBPLYear0" Font-Size="12px" runat="server" Text="Reporting Time "></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; border-right: none;">
                                                            <asp:Label ID="lblTime" runat="server">6:00 AM (Morning)</asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </td>
                                    </tr>
                                </table>

                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; font-family: Arial; font-size: 12px;">
                                    <tr>
                                        <td style="text-transform: uppercase; border: 1px solid #999; padding: 0 5px; text-align: left; font-size: 13px; font-weight: bolder;" colspan="4"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-transform: uppercase; border: 1px solid #999; padding: 5px; text-align: left; font-size: 13px; font-weight: bolder;" colspan="4">Grievance Details</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 0 5px;" colspan="4"></td>
                                    </tr>
                                    <tr id="trGrievance" runat="server" style="display:none;">
                                        <td style="border: 1px solid #999; padding: 5px; width: 100px;">Grievance ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGrievanceID" runat="server" style="font-weight:bold"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Grievance Logged Date</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblCreatedOn" runat="server" style="font-weight:bold"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 0 5px;" colspan="4"></td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 100px;"><span style="color:red"> *</span> Subject</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3"><asp:TextBox ID="txtSubject" runat="server" Width="100%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 0 5px;" colspan="4"></td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px;"><span style="color:red"> *</span> Detail of Grievance</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                            <asp:TextBox ID="txtGreivance" runat="server" Height="57px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 0 5px;" colspan="4"></td>
                                    </tr>
                                </table>


                            </div>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>

                    <%--<div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>--%>
                    <br />
                            <asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label><br />
                </div>
                <%---Start of Button----%>

                </asp:Panel>
                <div class="">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" runat="server" id="btnPrint" class="btn btn-success" visible="false" value="Print" onclick="javascript: EPassPrint('divPrint');" />&nbsp;&nbsp;
                            <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-primary" OnClientClick="isJavaScriptEnabled:return ValidateForm();"
                                Text="Submit" OnClick="btnSubmit_Click" />&nbsp;&nbsp;
                            <input id="btnHome" type="button" class="btn btn-danger"
                                value="Close" onclick="window.close();" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <br />
                <br />
                <%----END of Button-----%>
            </div>
        </div>
    </form>
</body>
</html>
