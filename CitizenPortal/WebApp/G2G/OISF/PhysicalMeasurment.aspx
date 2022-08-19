<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="PhysicalMeasurment.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PhysicalMeasurment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/CommonScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="box-body box-body-open">

            <div id="divPrint" style="margin: 0 auto; width: 800px; height: 1220px; overflow: auto; ">
                <div style="margin: 0 auto; height: 591px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 585px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-size: 300px; background-repeat: no-repeat; background-position: center center;">
                        <%---------Start Header section --------%>
                        <div style="height: 95px; width: 100%; border-bottom: 1px solid #999;">
                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                <tr>
                                    <td>
                                        <img alt="Logo" src="img/odisha_policelogo.jpg" style="width: 90px;" />
                                    </td>
                                    <td style="text-align: center">
                                        <br />
                                        <span style="text-align: center; font-size: 15px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</span>
                                        <br />
                                        <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 18px; font-weight: bolder; text-transform: uppercase;">Recruitment of Constable in 9th IRB</asp:Label>
                                        <br />
                                        <span id="lblDeptName" runat="server" style="font-size: 15px">Home Department</span></td>
                                    <td>
                                        <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                        <%--<uc1:qrcode runat="server" id="QRCode1" style="width: 80px !important" />--%>

                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%----------End Header section ---------%>
                        <%---------Start Title section --------%>
                        <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <span style="text-align: center; font-size: 22px; font-weight: bold; color: #fff;">Physical Measurment Sheet - 2016</span>
                        </div>
                        <%----------End title section ---------%>
                        <%---------Start Applicant Section --------%>
                        <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                        <b style="text-transform: uppercase;">Applicant Details</b></td>
                                    <td rowspan="8" style="padding: 0; border: 1px solid #999; text-align: center; width: 135px;">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px; height: 160px" id="ProfilePhoto" />
                                        <br />
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" /></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="Label5" runat="server" Text="Application ID"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; white-space: nowrap;">
                                        <asp:Label ID="Label7" runat="server" Text="Application Date"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;" colspan="2">
                                        <asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 135px;">
                                        <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                        <asp:Label ID="lblFather1" runat="server">Father Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblFather" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Mobile No.</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Email ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 0; border: 1px solid #999; text-align: left;" colspan="5">
                                        <table style="width: 100%;" cellspacing="0" cellpadding="5" class="">
                                            <tr>
                                                <td style="border-right: 2px solid #999; width: 116px;">
                                                    <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                                </td>
                                                <td style="border-right: 2px solid #999;">
                                                    <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                </td>
                                                <td style="border-right: 2px solid #999;">Age</td>
                                                <td style="border-right: 2px solid #999;">
                                                    <asp:Label ID="lblAge" runat="server"></asp:Label>
                                                </td>
                                                <td style="border-right: 2px solid #999; white-space: nowrap; width: 115px;">
                                                    <asp:Label ID="lblFather0" runat="server">Religion (Category)</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                        <b style="text-transform: uppercase;">Physical Examination Venue Details</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 135px;">
                                        <asp:Label ID="Father" runat="server">Venue Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblVenue" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 50px">
                                        <asp:Label ID="lblBPLYear" Font-Size="12px" runat="server" Text="Date"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">
                                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 135px;">
                                        <asp:Label ID="lblCategory2" runat="server">Venue Address</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblBPLYear0" Font-Size="12px" runat="server" Text="Time "></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblTime" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                              
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; text-align: left;" colspan="2">
                                            <b style="text-transform: uppercase;">Medical Officer Details</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" rowspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 120px">
                                            <asp:Label ID="Label21" runat="server">Examiner Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 333px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 120px">
                                            <asp:Label ID="Label30" runat="server">Remark</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; border-top: none; vertical-align: bottom; text-align: center;">
                                            <asp:Label ID="lblpin" runat="server">Signature of Medical Officer</asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; text-align: left;" colspan="2">
                                            <b style="text-transform: uppercase;">Physical Examination details</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" rowspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 120px">
                                            <asp:Label ID="Label2" runat="server">Officer Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 333px;"></td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 0;" colspan="2">
                                            <table cellspacing="0" cellpadding="5">
                                                <tr>
                                                    <td style="border-right: 2px solid #999; width: 60px;">Height<br />
                                                        (in cm)</td>
                                                    <td style="border-right: 2px solid #999; width: 70px;">&nbsp;</td>
                                                    <td style="border-right: 2px solid #999; width: 60px;">Weight
                                                        <br />
                                                        (in Kg)</td>
                                                    <td style="border-right: 2px solid #999; width: 70px;">&nbsp;</td>
                                                    <td style="border-right: 2px solid #999; width: 60px;">Chest<br />
                                                        (in cm)</td>
                                                    <td style="width: 70px;">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; border-top: none; text-align: center; vertical-align: bottom">
                                            <asp:Label ID="Label12" runat="server">Signature of Examiner</asp:Label>
                                        </td>
                                    </tr>
                                </table>
                        </div>
                        <%----------End Document Section ---------%>
                        <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 135px;">
                        </div>
                    </div>
                </div>
                
                <div style="margin: 0 auto; height: 591px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 585px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-size: 300px; background-repeat: no-repeat; background-position: center center;">
                        <%---------Start Header section --------%>
                        <div style="height: 95px; width: 100%; border-bottom: 1px solid #999;">
                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                <tr>
                                    <td>
                                        <img alt="Logo" src="img/odisha_policelogo.jpg" style="width: 90px;" />
                                    </td>
                                    <td style="text-align: center">
                                        <br />
                                        <span style="text-align: center; font-size: 15px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</span>
                                        <br />
                                        <asp:Label runat="server" ID="Label1" Style="font-size: 18px; font-weight: bolder; text-transform: uppercase;">Recruitment of Constable in 9th IRB</asp:Label>
                                        <br />
                                        <span id="Span1" runat="server" style="font-size: 15px">Home Department</span></td>
                                    <td>
                                        <div style="width: 75px; text-align: center; margin: 0 auto;"></div>
                                        <%--<uc1:qrcode runat="server" id="QRCode2" style="width: 80px !important" />--%>

                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%----------End Header section ---------%>
                        <%---------Start Title section --------%>
                        <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <span style="text-align: center; font-size: 22px; font-weight: bold; color: #fff;">Physical Measurment Sheet - 2016</span>
                        </div>
                        <%----------End title section ---------%>
                        <%---------Start Applicant Section --------%>
                        <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                        <b style="text-transform: uppercase;">Applicant Details</b></td>
                                    <td rowspan="8" style="padding: 0; border: 1px solid #999; text-align: center; width: 135px;">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px; height: 160px" id="Img1" />
                                        <br />
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="Img2" /></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="Label3" runat="server" Text="Application ID"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="Label4" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; white-space: nowrap;">
                                        <asp:Label ID="Label6" runat="server" Text="Application Date"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;" colspan="2">
                                        <asp:Label ID="Label8" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 135px;">
                                        <asp:Label ID="Label9" runat="server" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                        <asp:Label ID="Label11" runat="server">Father Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label13" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Mobile No.</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label14" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Email ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label15" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 0; border: 1px solid #999; text-align: left;" colspan="5">
                                        <table style="width: 100%;" cellspacing="0" cellpadding="5" class="">
                                            <tr>
                                                <td style="border-right: 2px solid #999; width: 116px;">
                                                    <asp:Label ID="Label16" runat="server" Text="Date of Birth"></asp:Label>
                                                </td>
                                                <td style="border-right: 2px solid #999;">
                                                    <asp:Label ID="Label17" runat="server"></asp:Label>
                                                </td>
                                                <td style="border-right: 2px solid #999;">Age</td>
                                                <td style="border-right: 2px solid #999;">
                                                    <asp:Label ID="Label18" runat="server"></asp:Label>
                                                </td>
                                                <td style="border-right: 2px solid #999; white-space: nowrap; width: 115px;">
                                                    <asp:Label ID="Label19" runat="server">Religion (Category)</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label20" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                        <b style="text-transform: uppercase;">Physical Examination Venue Details</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 135px;">
                                        <asp:Label ID="Label22" runat="server">Venue Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label23" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 50px">
                                        <asp:Label ID="Label24" Font-Size="12px" runat="server" Text="Date"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">
                                        <asp:Label ID="Label25" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 135px;">
                                        <asp:Label ID="Label26" runat="server">Venue Address</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label27" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label31" Font-Size="12px" runat="server" Text="Time "></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label32" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                              
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; text-align: left;" colspan="2">
                                            <b style="text-transform: uppercase;">Medical Officer Details</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" rowspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 120px">
                                            <asp:Label ID="Label33" runat="server">Examiner Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 333px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 120px">
                                            <asp:Label ID="Label34" runat="server">Remark</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; border-top: none; vertical-align: bottom; text-align: center;">
                                            <asp:Label ID="Label35" runat="server">Signature of Medical Officer</asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; text-align: left;" colspan="2">
                                            <b style="text-transform: uppercase;">Physical Examination details</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" rowspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 5px; width: 120px">
                                            <asp:Label ID="Label36" runat="server">Officer Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 333px;"></td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 0;" colspan="2">
                                            <table cellspacing="0" cellpadding="5">
                                                <tr>
                                                    <td style="border-right: 2px solid #999; width: 60px;">Height<br />
                                                        (in cm)</td>
                                                    <td style="border-right: 2px solid #999; width: 70px;">&nbsp;</td>
                                                    <td style="border-right: 2px solid #999; width: 60px;">Weight
                                                        <br />
                                                        (in Kg)</td>
                                                    <td style="border-right: 2px solid #999; width: 70px;">&nbsp;</td>
                                                    <td style="border-right: 2px solid #999; width: 60px;">Chest<br />
                                                        (in cm)</td>
                                                    <td style="width: 70px;">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; border-top: none; text-align: center; vertical-align: bottom">
                                            <asp:Label ID="Label37" runat="server">Signature of Examiner</asp:Label>
                                        </td>
                                    </tr>
                                </table>
                        </div>
                        <%----------End Document Section ---------%>
                        <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 135px;">
                        </div>
                    </div>
                </div>
               
            </div>
            <%---Start of Button----%>
            <div class="">
                <div class="col-md-12 box-container" id="divBtn">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <input type="button" id="btnPrint" class="btn btn-success" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <%----END of Button-----%>
        </div>
    </div>
</asp:Content>
