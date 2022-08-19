<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgroPolytechnicDiplomaAcknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.AgroPolytechnicDiplomaAcknowledgement" %>


<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>
   
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement For OUAT AgroPolytechnic Diploma  Admission Form</title>
    <script src="../../Scripts/CommonScript.js"></script>
    <style>
        .hdbg { 
            background-color: #383E4B; 
            color: #fff;
        }

        .sub_hdbg {
            background-color: #F8F8F8;
            color: #383E4B;
            font-weight: bold;
        }

        .t_trans {
            text-transform: capitalize;
        }

        .auto-style1 {
            width: 165px;
        }

        .auto-style2 {
            width: 487px;
        }
    </style>
    
  

    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="box-body box-body-open">
            <div id="divPrint" style="margin: 0 auto; width: 80%;">
                <div style="margin: 0 auto; height: auto; width: 100%; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: auto; width: 100%; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-image: url('../images/ouatlogobg.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                        <%---------Start Header section --------%>
                        <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                            <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                            </div>
                            <div style="width: 165px; float: right;">
                                <img alt="Logo" src="/webApp/kiosk/Images/OUAT.png" style="width: 100px; margin: 16px 0px 0px 33px;" />
                            </div>
                            <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                                <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                    Trans. No.
                                </div>
                                <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                </div>
                                <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                    Trans. Date
                                </div>
                                <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                    <asp:Label ID="lblappdate" runat="server" Font-Bold="True"></asp:Label>
                                </div>
                            </div>
                            <div style="height: 47px; float: right; margin: 30px 31px 0 0;">
                                <uc1:QRCode runat="server" ID="QRCode" />
                            </div>
                        </div>
                        <%----------End Header section ---------%>

                        <%---------Start Title section --------%>
                        <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; text-transform: uppercase;">ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY</asp:Label>
                            <br />
                            <span style="font-size: 20px">ACKNOWLEDGEMENT FOR AgroPolytechnic Diploma PROGRAMMES, 2017-18</span>
                        </div>
                        <%----------End title section ---------%>

                        <%---------Start Applicant Section --------%>
                        <div style="margin: 10px 0; width: 100%; height: auto; font-size: 13px;">
                            <%--Applicant Table--%>
                            <table style="width: 98%; margin: 0 auto;">
                                <tr>
                                    <td colspan="2">
                                        <table class="table-bordered" style="width: 100%;">
                                            <tr>
                                                <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Applicant Details</b></td>
                                            </tr>
                                            </table>
                                        </td>
                                    </tr>
                                            <tr>
                                                <td style="vertical-align: top;">
                                                    <table border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td style="padding: 5px; border: 1px solid #999; font-size: 10px; text-align: center; width: 135px; vertical-align: top;">
                                                                <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 118px;" id="ProfilePhoto" />
                                                                <b>Applicant Photo</b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding: 5px; border-top: 1px solid #999; font-size: 10px; text-align: center; width: 135px;">
                                                                <img runat="server" src="img/signature.png" id="ProfileSignature" style="width: 118px; height: 50px;" />
                                                                <b>Applicant Sign.</b>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </td>
                                                <td style="vertical-align: top;">
                                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                                        <tr>
                                                            <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Name of the Candidate</b></td>
                                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style2">
                                                                <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                                             <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Aadhaar Number</b></td>
                                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                <asp:Label ID="lblAadhaarNo" runat="server"></asp:Label></td>
                                                        </tr>
                                                        
                                                           
                                                
                                            <tr>
                                                <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Father&#39;s&nbsp;  Name</b></td>
                                                <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="FatherName" runat="server"></asp:Label></td>
                                                <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mother's  Name</b></td>
                                                <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="MotherName" runat="server"></asp:Label></td>

                                            </tr>
                                            <tr>
                                                <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                    <b>Date of Birth
                                                    </b></td>
                                                <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="DOBConverted" runat="server"></asp:Label></td>
                                                <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>
                                                    <span style="font-size: 11px;">(Age as on 31.12.2017)</span></b></td>
                                                <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="AgeYear" runat="server"></asp:Label>
                                                    <asp:Label ID="AgeMonth" runat="server"></asp:Label>
                                                    <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Gender</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 120px;">
                                                    <asp:Label ID="gender" runat="server"></asp:Label></td>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Religion</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="Religion" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1">
                                                    <b>Category</b>
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                    <asp:Label ID="Category" runat="server"></asp:Label>
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Marital Status</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="MaritalStatus" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mother Tongue</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="mothertongue" runat="server"></asp:Label>
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1">
                                                    <b>Nationality</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                    <asp:Label ID="Nationality" runat="server"></asp:Label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                    <b>Email</b>
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                    <asp:Label ID="EmailID" runat="server"></asp:Label>
                                                </td>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Mobile Number</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="MobileNo" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                                </td>
                                             </tr>   
                            </table>

                            <br />
                            <%--Applicant Address Table--%>
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin:0 auto;">
                                <tr>
                                    <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Permanent Address</b></td>
                                    <td colspan="2" style="padding: 8px; border-left: 1px solid #fff; border-right: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Present Address</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                        <b>Address</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="PAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="PAddressLine2" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                        <b>Address</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="CAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="CAddressLine2" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td width="146" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                    <td width="339" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                        <asp:Label ID="PRoadStreetName" runat="server"></asp:Label></td>
                                    <td width="210" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                    <td width="276" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                        <asp:Label ID="CRoadStreetName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 190px;">
                                        <b>Landmark</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="PLandMark" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>Landmark</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="CLandMark" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="PLocality" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="CLocality" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="PddlVillage" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="CddlVillage" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="PBlock" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="CBlock" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="PddlDistrict" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="CddlDistrict" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>State</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="PddlState" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>State</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="CddlState" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="PPinCode" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="CPinCode" runat="server"></asp:Label></td>
                                </tr>
                            </table>

                            <br />
                            <%--Applicant Address Table--%>
                            <table cellpadding="5" class="table-bordered" style="width: 98%; border: 1px solid #999; min-width: 600px; margin:0 auto;">
                                <tr>
                                    <td colspan="7" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Academic Profile of Applicant</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>Degree/Diploma</b> </td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>Name of the Board/University</b> </td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>Marks/CGPA</b> </td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>Marks/CGPA Scored</b> </td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>Total % of Marks</b> </td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>Percentage/CGPA</b> </td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                        <b>Passing Year</b> </td>

                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">H.S.C/Equivalent (Excluding Extra Opt.)</td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblHscName" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblHscTotalMarks" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblHscMarksGot" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblHscPercentage" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblHscDivision" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblHscPassingYear" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">+2n Science/Equivalent</td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblSscName" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblSscTotalMarks" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblSscMarksGot" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblSscPercentage" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblSscDivision" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                        <asp:Label ID="lblSscPassingYear" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <%--Reservation Quota Details Table--%>
                            <table cellpadding="5" class="table-bordered" style="width: 98%; min-width: 600px; border: 1px solid #999; margin:0 auto;">
                                <tr>
                                    <td colspan="3" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999;"><b>Reservation Quota Details</b></td>
                                </tr>
                                <tr>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">1.</span> </td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Wants to claim for Reserved Seats?</td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="ReservedQuota" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>
                                <tr id="divReservedQuota" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td colspan="2" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="border-right: 1px solid #999; border-bottom: 1px solid #999; line-height: 20px; padding: 2px 3px;">
                                                    <asp:Label ID="Label3" runat="server" CssClass="t_trans">Physically Challenged</asp:Label>
                                                    &nbsp;:&nbsp;&nbsp;
                                                        <asp:Label ID="lblPC" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td style="border-right: 1px solid #999; line-height: 20px; padding: 2px 3px;">
                                                    <asp:Label ID="Label37" runat="server" CssClass="t_trans">Green Card Holder</asp:Label>
                                                    &nbsp;:&nbsp;
                                                       <asp:Label ID="lblGCH" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                                
                                            </tr>
                                        </table>
                                    </td>

                                </tr>

                                <tr id="divPhyChlng" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">(a)</td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Reservation details under Physically Handicapped quota</td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                     
                                <tr id="divPCType" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Physical Challenged type?</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblPCType" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>

                                <tr id="divPCPart" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Which part of body is Handicapped?</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblPCPart" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>

                                <tr id="divPCPercnt" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Percentage of Handicapped</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblPCPercnt" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>


                            </table>
                            <br />
                            <%--Domicile Table--%>
                            <table cellpadding="5" class="table-bordered" style="width: 98%; min-width: 600px; border: 1px solid #999; margin:0 auto;">
                                <tr>
                                    <td colspan="3" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999;"><b>Domicile Information</b></td>
                                </tr>
                                <tr>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">1.</span> </td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Has the Candidate passed Odia as one of the subject in HSC Examination?</td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="lblOdia" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="padding: 0;" id="trLang" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <table border="0" style="width: 100%;">
                                            <tr>
                                                <td>Able to Read Odia :&nbsp;&nbsp;
                                                        <asp:Label ID="Section1_AbililtyRead" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                                <td>Able to Write Odia :&nbsp;&nbsp;
                                                        <asp:Label ID="Section1_AbilityWrite" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                                <td>Able to Speak Odia :&nbsp;&nbsp;
                                                        <asp:Label ID="Section1_AbilitySpeak" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="trResType" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">Residence Type :&nbsp;&nbsp;
                                            <asp:Label ID="lblResidentType" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>

                            </table>
                            <br />
                            <table cellpadding="0" cellspacing="0"  style="width:98%; margin:0 auto;">
                                <tbody>
                                    <tr>
                                        <td class="hdbg" colspan="3" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>List of essential documents (enclosed with the application)</b></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div>
                                <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; margin:0 auto;" ClientIDMode="Static" Width="98%">
                                </asp:GridView>
                            </div>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 0; margin:0 auto; display:none" >
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="4"><b>Payment Details</b></td>

                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Application Number"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                        <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="Label31" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                        <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsID" runat="server" style="font-weight: bold;"></span></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsDate" runat="server" style="font-weight: bold;"></span></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="TokenNo0" runat="server">Kiosk Name (ID)</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                        <asp:Label ID="lblKiosk" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="TokenNo3" runat="server">Kiosk Mobile No.</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                        <asp:Label ID="lblKioskMob" runat="server" CssClass="lbl_value"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                        <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Portal Fee + Service Tax</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>Rs.<asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>+ <i class="fa fa-rupee"></i>
                                        <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                        Rs.
                                            <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                        <%--<asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Two Rupees and Ninety Paise)"></asp:Label>--%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%---------End Applicant Section --------%>
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
        </div>
    </form>
</body>
</html>
